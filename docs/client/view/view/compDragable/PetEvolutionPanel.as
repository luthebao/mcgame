// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetEvolutionPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.Text;
    import mx.controls.Image;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.controls.Label;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import com.qeedoo.ui.view.compBattle.SkillCanvas;
    import mx.containers.ViewStack;
    import mx.controls.LinkButton;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.FilterButton;
    import mx.controls.CheckBox;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.adobe.crypto.MD5;
    import flash.events.Event;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.ui.event.DressEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.utils.LanguageUtil;
    import mx.core.IUITextField;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.Slot;
    import style.Assets;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.event.GameDataEvent;
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

    public class PetEvolutionPanel extends DragableCanvas implements IBindingClient 
    {

        private static const ROUND_MAX:* = 3;
        private static const STAGE_MAX:* = 9;
        private static const PROTECT_ITEM_ID:int = 3911;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const CONTRACT_ITEMID:* = 4979;
        private var _3437302pet5:ItemSlot;
        private var _740436871propRight:Text;
        private var _106556910petE4:ItemSlot;
        private var _309153677propNow:Text;
        private var _97439934fire4:Image;
        public var _PetEvolutionPanel_Text2:Text;
        private var _3437301pet4:ItemSlot;
        private var ITEM_COUNT_PER_PAGE:int = 12;
        private var selectPetFeather:Object;
        private var _tenAlert:Alert;
        private var _1413892224selectPetInfo1:RoundedLabel;
        private var _106556906petE0:ItemSlot;
        private var _110363459tile1:Tile;
        private var _106556911petE5:ItemSlot;
        private var _938937372showCanvas1:CharactorShowCanvas;
        private var _97439935fire5:Image;
        private var _3437300pet3:ItemSlot;
        private var _1324347617evolutionBtn:DelayButton;
        private var _helpAlert:Alert;
        private var FEATHER_COUNT_PER_PAGE:int = 10;
        public var _PetEvolutionPanel_Label1:Label;
        public var _PetEvolutionPanel_Label2:Label;
        public var _PetEvolutionPanel_Label3:Label;
        private var _1400590334toNextStepBtn:DelayButton;
        public var _PetEvolutionPanel_DelayButton2:DelayButton;
        public var _PetEvolutionPanel_Label9:Label;
        private var _1331586071direct:Image;
        private var _1714701186picCanvas:Canvas;
        private var _106556907petE1:ItemSlot;
        private var _610140195featherRate:Label;
        private var _109610221sock1:Image;
        private var _511796720bigCircle:BigContractCircle;
        private var _865666787needText:Label;
        private var _803559802pageTab:HButtonTab;
        private var _1769958153skillCanvas:SkillCanvas;
        private var _106556912petE6:ItemSlot;
        private var _currentRound:int = 0;
        private var _782949730circle2:ContractCircle;
        private var _97439936fire6:Image;
        private var _115868346zhen1:Image;
        private var _956131171costTXT:Label;
        private var _97439930fire0:Image;
        private var _789774322helpText:Text;
        private var _106556908petE2:ItemSlot;
        private var _109610222sock2:Image;
        private var _3619493view:ViewStack;
        private var _3437306pet9:ItemSlot;
        private var _106556913petE7:ItemSlot;
        private var _1177514720itemText:Label;
        public var _PetEvolutionPanel_Image20:Image;
        public var _PetEvolutionPanel_Image21:Image;
        private var _currentStep:int = 2;
        public var _PetEvolutionPanel_LinkButton1:LinkButton;
        private var _106556286pet10:ItemSlot;
        private var _691653267protectSlot:ItemSlot;
        private var _97439937fire7:Image;
        private var _938937373showCanvas2:CharactorShowCanvas;
        private var _1717383265basicPro:DataGrid;
        private var _2033704065featherSelect:Image;
        private var _110363460tile2:Tile;
        private var petList:Array;
        private var _115868347zhen2:Image;
        private var _782949729circle1:ContractCircle;
        public var _PetEvolutionPanel_FilterButton1:FilterButton;
        public var _PetEvolutionPanel_FilterButton2:FilterButton;
        private var _782949731circle3:ContractCircle;
        private var _97439931fire1:Image;
        private var selectPet:Object;
        private var _106556909petE3:ItemSlot;
        private var _3437305pet8:ItemSlot;
        public var _PetEvolutionPanel_RoundedLabel1:RoundedLabel;
        public var _PetEvolutionPanel_RoundedLabel2:RoundedLabel;
        public var _PetEvolutionPanel_RoundedLabel3:RoundedLabel;
        public var _PetEvolutionPanel_RoundedLabel6:RoundedLabel;
        private var _109610223sock3:Image;
        private var _646343081autoBuy:CheckBox;
        public var _PetEvolutionPanel_DataGridColumn1:DataGridColumn;
        public var _PetEvolutionPanel_DataGridColumn2:DataGridColumn;
        public var _PetEvolutionPanel_DataGridColumn3:DataGridColumn;
        public var _PetEvolutionPanel_DataGridColumn4:DataGridColumn;
        public var _PetEvolutionPanel_DataGridColumn5:DataGridColumn;
        public var _PetEvolutionPanel_DataGridColumn6:DataGridColumn;
        public var _PetEvolutionPanel_DataGridColumn7:DataGridColumn;
        private var _993898998propLeft:Text;
        private var _106556914petE8:ItemSlot;
        private var _106556287pet11:ItemSlot;
        private var _1930251448useProtect:CheckBox;
        private var _97439938fire8:Image;
        private var _1413892225selectPetInfo2:RoundedLabel;
        private var _3437299pet2:ItemSlot;
        private var _3437304pet7:ItemSlot;
        private var _1324361010evolutionPro:DataGrid;
        private var _97439932fire2:Image;
        private var _406889116petEvolutionTitle:BasicTitleCanvas;
        private var _782949732circle4:ContractCircle;
        private var _106556915petE9:ItemSlot;
        private var _3437298pet1:ItemSlot;
        private var _993838858propNext:Text;
        private var _1847060154nextPro:Image;
        private var _2070140094envoSelect:Image;
        private var _1840576088nameText:Label;
        private var _173227roundImg:Image;
        private var petListFeather:Array;
        private var _2072851743zhiranzhiliCost:RoundedLabel;
        private var _3437303pet6:ItemSlot;
        private var _607339634pageSelector:PageSelector;
        private var _97439933fire3:Image;
        private var _contracting:Boolean;
        private var _buyAlert:Alert;
        private var _3437297pet0:ItemSlot;
        private var _1647659420pageSelector2:PageSelector;
        private var firstIn:Boolean = true;
        private var _selectType:int = 1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":540,
                    "height":445,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"petEvolutionTitle"
                    }), new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTab",
                        "events":{"tabChanged":"__pageTab_tabChanged"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":41
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"helpText",
                        "events":{"click":"__helpText_click"},
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":465,
                                "y":40,
                                "selectable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"view",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":60,
                                "clipContent":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "clipContent":false,
                                            "width":520,
                                            "height":365,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"picCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "styleName":"CanvasBorder",
                                                        "clipContent":false,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "width":500,
                                                        "height":180,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetEvolutionPanel_RoundedLabel1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-120";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":8});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetEvolutionPanel_RoundedLabel2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "120";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":8});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"zhen1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-120";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":110});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"zhen2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "120";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":110});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"direct",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "0";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CharactorShowCanvas,
                                                            "id":"showCanvas1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-120";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":124,
                                                                    "height":13,
                                                                    "width":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CharactorShowCanvas,
                                                            "id":"showCanvas2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "120";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":124,
                                                                    "height":13,
                                                                    "width":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"evolutionBtn",
                                                            "events":{"click":"__evolutionBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.bottom = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":65
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
                                                        "x":10,
                                                        "y":195,
                                                        "styleName":"CanvasBorder",
                                                        "clipContent":false,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "width":230,
                                                        "height":160,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"nextPro",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalCenter = "0";
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":220,
                                                                    "height":130,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"evolutionPro",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "selectable":false,
                                                                                "x":10,
                                                                                "y":0,
                                                                                "height":94,
                                                                                "verticalScrollPolicy":"off",
                                                                                "width":230,
                                                                                "columns":[_PetEvolutionPanel_DataGridColumn1_i(), _PetEvolutionPanel_DataGridColumn2_i(), _PetEvolutionPanel_DataGridColumn3_i()]
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
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":245,
                                                        "y":195,
                                                        "styleName":"CanvasBorder",
                                                        "clipContent":false,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "width":265,
                                                        "height":160,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetEvolutionPanel_RoundedLabel3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":14});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"envoSelect",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":37
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"tile1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 4;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":16,
                                                                    "y":41,
                                                                    "width":226,
                                                                    "height":80,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileBagItem",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet0",
                                                                        "events":{"click":"__pet0_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet1",
                                                                        "events":{"click":"__pet1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet2",
                                                                        "events":{"click":"__pet2_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet3",
                                                                        "events":{"click":"__pet3_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet4",
                                                                        "events":{"click":"__pet4_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet5",
                                                                        "events":{"click":"__pet5_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet6",
                                                                        "events":{"click":"__pet6_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet7",
                                                                        "events":{"click":"__pet7_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet8",
                                                                        "events":{"click":"__pet8_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet9",
                                                                        "events":{"click":"__pet9_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet10",
                                                                        "events":{"click":"__pet10_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"pet11",
                                                                        "events":{"click":"__pet11_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelector,
                                                            "id":"pageSelector",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.bottom = "13";
                                                            }
                                                        })]
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
                                            "clipContent":false,
                                            "width":520,
                                            "height":365,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":20,
                                                        "clipContent":false,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"roundImg"
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fire7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":31,
                                                                    "y":15
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fire8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":75,
                                                                    "y":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fire0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":117,
                                                                    "y":14
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fire1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":143,
                                                                    "y":58
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fire2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":135,
                                                                    "y":105
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fire3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":99,
                                                                    "y":135
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fire4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":50,
                                                                    "y":135
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fire5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":13,
                                                                    "y":105
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fire6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":5,
                                                                    "y":58
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"sock1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":90,
                                                                    "y":16
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"sock2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":151,
                                                                    "y":121
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"sock3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":27,
                                                                    "y":121
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"selectPetInfo1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":179,
                                                                    "width":195
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"selectPetInfo2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":200,
                                                                    "width":195
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
                                                        "x":215,
                                                        "y":10,
                                                        "clipContent":false,
                                                        "styleName":"CanvasBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "width":295,
                                                        "height":160,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "5";
                                                                this.bottom = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":280,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"basicPro",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "0";
                                                                            this.bottom = "0";
                                                                            this.left = "0";
                                                                            this.right = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "selectable":false,
                                                                                "verticalScrollPolicy":"off",
                                                                                "columns":[_PetEvolutionPanel_DataGridColumn4_i(), _PetEvolutionPanel_DataGridColumn5_i(), _PetEvolutionPanel_DataGridColumn6_i(), _PetEvolutionPanel_DataGridColumn7_i()]
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
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":215,
                                                        "y":175,
                                                        "clipContent":false,
                                                        "styleName":"CanvasBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "width":295,
                                                        "height":180,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PetEvolutionPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 326404;
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":30,
                                                                    "y":16
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_PetEvolutionPanel_LinkButton1",
                                                            "events":{"click":"___PetEvolutionPanel_LinkButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":220,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PetEvolutionPanel_Label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 326404;
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":140,
                                                                    "y":16,
                                                                    "width":124
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PetEvolutionPanel_Label3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 326404;
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":30,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"featherRate",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 326404;
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":30,
                                                                    "y":45
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"costTXT",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 326404;
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"",
                                                                    "x":140,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"protectSlot",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":126,
                                                                    "y":66,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"useProtect",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":167,
                                                                    "y":66
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetEvolutionPanel_RoundedLabel6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 16494596;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":167,
                                                                    "y":86
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"zhiranzhiliCost",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":117});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"_PetEvolutionPanel_DelayButton2",
                                                            "events":{"click":"___PetEvolutionPanel_DelayButton2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.horizontalCenter = "-20";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"styleName":"BtnStdRed"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"toNextStepBtn",
                                                            "events":{"click":"__toNextStepBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.horizontalCenter = "70";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"styleName":"BtnStdRed"});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":245,
                                                        "clipContent":false,
                                                        "styleName":"CanvasBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "width":200,
                                                        "height":110,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"featherSelect",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":4,
                                                                    "y":1
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"tile2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 4;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":5,
                                                                    "width":186,
                                                                    "height":80,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileBagItem",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE0",
                                                                        "events":{"click":"__petE0_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE1",
                                                                        "events":{"click":"__petE1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE2",
                                                                        "events":{"click":"__petE2_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE3",
                                                                        "events":{"click":"__petE3_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE4",
                                                                        "events":{"click":"__petE4_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE5",
                                                                        "events":{"click":"__petE5_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE6",
                                                                        "events":{"click":"__petE6_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE7",
                                                                        "events":{"click":"__petE7_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE8",
                                                                        "events":{"click":"__petE8_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petE9",
                                                                        "events":{"click":"__petE9_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelector,
                                                            "id":"pageSelector2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.bottom = "5";
                                                            }
                                                        })]
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
                                            "clipContent":false,
                                            "width":520,
                                            "height":365,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "clipContent":false,
                                                        "styleName":"CanvasBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "width":250,
                                                        "height":345,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_PetEvolutionPanel_Image20",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":7,
                                                                    "y":12
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ContractCircle,
                                                            "id":"circle1",
                                                            "events":{"click":"__circle1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "type":1,
                                                                    "x":90,
                                                                    "y":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ContractCircle,
                                                            "id":"circle3",
                                                            "events":{"click":"__circle3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "type":3,
                                                                    "x":20,
                                                                    "y":95
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ContractCircle,
                                                            "id":"circle4",
                                                            "events":{"click":"__circle4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "type":4,
                                                                    "x":160,
                                                                    "y":95
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ContractCircle,
                                                            "id":"circle2",
                                                            "events":{"click":"__circle2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "type":2,
                                                                    "x":90,
                                                                    "y":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":260,
                                                                    "clipContent":false,
                                                                    "styleName":"CanvasBorder",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "width":230,
                                                                    "height":75,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Text,
                                                                        "id":"_PetEvolutionPanel_Text2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":10});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Text,
                                                                        "id":"propLeft",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":30,
                                                                                "y":30
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Text,
                                                                        "id":"propRight",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":118,
                                                                                "y":30
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
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":265,
                                                        "y":10,
                                                        "clipContent":false,
                                                        "styleName":"CanvasBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "width":245,
                                                        "height":345,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"itemText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"nameText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":35});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BigContractCircle,
                                                            "id":"bigCircle",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":60});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"propNow",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":215,
                                                                    "width":125
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_PetEvolutionPanel_Image21",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "rotation":90,
                                                                    "y":225
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"propNext",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":120,
                                                                    "y":215,
                                                                    "width":126
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"needText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":260});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":285,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":CheckBox,
                                                                        "id":"autoBuy"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetEvolutionPanel_Label9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FilterButton,
                                                            "id":"_PetEvolutionPanel_FilterButton1",
                                                            "events":{"click":"___PetEvolutionPanel_FilterButton1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":50,
                                                                    "height":23,
                                                                    "x":55,
                                                                    "y":308,
                                                                    "styleName":"BtnStdGreen",
                                                                    "delayTime":1000
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FilterButton,
                                                            "id":"_PetEvolutionPanel_FilterButton2",
                                                            "events":{"click":"___PetEvolutionPanel_FilterButton2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":80,
                                                                    "height":23,
                                                                    "x":115,
                                                                    "y":308,
                                                                    "styleName":"BtnStdGreen",
                                                                    "delayTime":1000
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
                    }), new UIComponentDescriptor({
                        "type":SkillCanvas,
                        "id":"skillCanvas",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "-68";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"visible":false});
                        }
                    })]
                });
            }
        });
        private var _90794110_core:Core = Core.getInstance();
        private var _1042207272petProData:ArrayCollection = new ArrayCollection();
        private var fireUrl:Array = [4130220000209, 4130220000210, 4130220000211];
        private var _1719946217basicProData:ArrayCollection = new ArrayCollection();
        private var PET_ENVOLUTION_FEATHER_STEP_RAN:* = [[35, 29, 24, 30, 24, 20, 25, 20, 20], [29, 24, 23, 24, 21, 18, 20, 18, 16], [30, 24, 19, 24, 20, 16, 24, 18, 12]];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetEvolutionPanel()
        {
            mx_internal::_document = this;
            this.width = 540;
            this.height = 445;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
            this.addEventListener("initialize", ___PetEvolutionPanel_DragableCanvas1_initialize);
            this.addEventListener("remove", ___PetEvolutionPanel_DragableCanvas1_remove);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetEvolutionPanel._watcherSetupUtil = _arg_1;
        }


        private function proTextRefresh():void
        {
            var _local_1:Object;
            var _local_2:Number;
            var _local_3:*;
            basicProData.removeAll();
            if (((selectPetFeather) && (selectPetFeather.creatureData)))
            {
                _local_1 = selectPetFeather.creatureData;
                _currentRound = 0;
                _currentStep = 0;
                if (((selectPetFeather.envoInfo) && (selectPetFeather.envoInfo["envo"])))
                {
                    _currentStep = selectPetFeather.envoInfo["stage"];
                    _currentRound = selectPetFeather.envoInfo["round"];
                };
                basicProData.addItem({
                    "name":Language.PETPANEL_U[12],
                    "curPro":selectPetFeather.aptStrength,
                    "nextPro":getAddPro(selectPetFeather.creatureData.id, 0),
                    "nextPro2":getAddPro(selectPetFeather.creatureData.id, 0, true)
                });
                basicProData.addItem({
                    "name":Language.PETPANEL_U[14],
                    "curPro":selectPetFeather.aptStamina,
                    "nextPro":getAddPro(selectPetFeather.creatureData.id, 1),
                    "nextPro2":getAddPro(selectPetFeather.creatureData.id, 1, true)
                });
                basicProData.addItem({
                    "name":Language.PETPANEL_U[13],
                    "curPro":selectPetFeather.aptAgility,
                    "nextPro":getAddPro(selectPetFeather.creatureData.id, 2),
                    "nextPro2":getAddPro(selectPetFeather.creatureData.id, 2, true)
                });
                basicProData.addItem({
                    "name":Language.PETPANEL_U[15],
                    "curPro":selectPetFeather.aptIntelligence,
                    "nextPro":getAddPro(selectPetFeather.creatureData.id, 3),
                    "nextPro2":getAddPro(selectPetFeather.creatureData.id, 3, true)
                });
                basicProData.addItem({
                    "name":Language.PETPANEL_U[16],
                    "curPro":selectPetFeather.aptEnergy,
                    "nextPro":getAddPro(selectPetFeather.creatureData.id, 4),
                    "nextPro2":getAddPro(selectPetFeather.creatureData.id, 4, true)
                });
                refreshRoundInfo();
                featherSelect.visible = true;
                _local_2 = 0;
                if (selectPetFeather.upgradeNum == 9)
                {
                    _local_2 = 0.1;
                }
                else
                {
                    if (selectPetFeather.upgradeNum == 10)
                    {
                        _local_2 = 0.3;
                    }
                    else
                    {
                        if (selectPetFeather.upgradeNum == 11)
                        {
                            _local_2 = 0.35;
                        }
                        else
                        {
                            if (selectPetFeather.upgradeNum == 12)
                            {
                                _local_2 = 0.4;
                            };
                        };
                    };
                };
                selectPetInfo1.htmlText = (((Language.PETPANEL_U[25] + ":<font color='#04FB04'>") + selectPetFeather.petName) + "</font>");
                selectPetInfo2.htmlText = (((Language.PETPANEL_U[11] + ":<font color='#04FB04'>") + (Math.round(((Number(selectPetFeather.growRate) * 100) + ((Number(selectPetFeather.growRateAdd) + _local_2) * 100))) / 100)) + "</font>");
                if (((_currentRound == (ROUND_MAX - 1)) && (_currentStep == STAGE_MAX)))
                {
                    featherRate.text = "";
                }
                else
                {
                    _local_3 = PET_ENVOLUTION_FEATHER_STEP_RAN[_currentRound][_currentStep];
                    featherRate.text = ((Language.PET_EVOLUTION_PANEL_U[66] + String(_local_3)) + "%[buff tăng thêm]");
                };
            }
            else
            {
                featherSelect.visible = false;
                selectPetInfo2.htmlText = "";
                selectPetInfo2.htmlText = "";
                featherRate.text = "";
            };
        }

        private function tenContractHandler(event:Event):void
        {
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var gfunc:Function;
            event.stopImmediatePropagation();
            if (_buyAlert)
            {
                PopUpManager.removePopUp(_buyAlert);
                _buyAlert = null;
            };
            var contractPet:Object = _core.player.contractPet;
            var propStr:String = GamePredef.CONTRACT_DICT[_selectType];
            var propLvl:int = (((contractPet) && (contractPet[propStr])) ? contractPet[propStr] : 0);
            if (propLvl >= GamePredef.MAX_CONTRACT_LEVEL)
            {
                _core.sysMidNote(Language.PET_EVOLUTION_PANEL_U[61]);
                return;
            };
            var ensureTenFunc:Function = function (_arg_1:CloseEvent=null):void
            {
                if (((_arg_1) && (_arg_1.detail == Alert.NO)))
                {
                    return;
                };
                _contracting = true;
                _core.remote.call("contractPetTen", new Responder(onContractPetTen), _selectType, autoBuy.selected);
            };
            if (autoBuy.selected)
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                goldLockFlag = bagPanel.goldLockFlag;
                if (((goldLockFlag) || (!(bagPanel))))
                {
                    _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                    gfunc = function (_arg_1:String):void
                    {
                        _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                    };
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                    return;
                };
                _buyAlert = Alert.show(Language.PET_EVOLUTION_PANEL_U[65], "", (Alert.YES | Alert.NO), null, ensureTenFunc);
                return;
            };
            (ensureTenFunc());
        }

        public function set toNextStepBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1400590334toNextStepBtn;
            if (_local_2 !== _arg_1)
            {
                this._1400590334toNextStepBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "toNextStepBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get toNextStepBtn():DelayButton
        {
            return (this._1400590334toNextStepBtn);
        }

        [Bindable(event="propertyChange")]
        public function get helpText():Text
        {
            return (this._789774322helpText);
        }

        public function __petE4_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        public function set propLeft(_arg_1:Text):void
        {
            var _local_2:Object = this._993898998propLeft;
            if (_local_2 !== _arg_1)
            {
                this._993898998propLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propLeft", _local_2, _arg_1));
            };
        }

        public function set helpText(_arg_1:Text):void
        {
            var _local_2:Object = this._789774322helpText;
            if (_local_2 !== _arg_1)
            {
                this._789774322helpText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "helpText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCanvas2():CharactorShowCanvas
        {
            return (this._938937373showCanvas2);
        }

        [Bindable(event="propertyChange")]
        public function get featherRate():Label
        {
            return (this._610140195featherRate);
        }

        private function _PetEvolutionPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetEvolutionPanel_DataGridColumn6 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 70;
            _local_1.sortable = false;
            _local_1.dataField = "nextPro";
            _local_1.setStyle("textAlign", "center");
            _local_1.setStyle("color", 326404);
            BindingManager.executeBindings(this, "_PetEvolutionPanel_DataGridColumn6", _PetEvolutionPanel_DataGridColumn6);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get showCanvas1():CharactorShowCanvas
        {
            return (this._938937372showCanvas1);
        }

        public function set showCanvas2(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._938937373showCanvas2;
            if (_local_2 !== _arg_1)
            {
                this._938937373showCanvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCanvas2", _local_2, _arg_1));
            };
        }

        public function set showCanvas1(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._938937372showCanvas1;
            if (_local_2 !== _arg_1)
            {
                this._938937372showCanvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCanvas1", _local_2, _arg_1));
            };
        }

        public function set featherRate(_arg_1:Label):void
        {
            var _local_2:Object = this._610140195featherRate;
            if (_local_2 !== _arg_1)
            {
                this._610140195featherRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherRate", _local_2, _arg_1));
            };
        }

        private function circleHandler(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
            var _local_2:ContractCircle = (_arg_1.currentTarget as ContractCircle);
            if (_selectType == _local_2.type)
            {
                return;
            };
            _selectType = _local_2.type;
            this.updateSelectContract();
        }

        public function __petE9_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        public function __pet3_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        private function _PetEvolutionPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetEvolutionPanel_DataGridColumn5 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 70;
            _local_1.sortable = false;
            _local_1.dataField = "curPro";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_PetEvolutionPanel_DataGridColumn5", _PetEvolutionPanel_DataGridColumn5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get propNow():Text
        {
            return (this._309153677propNow);
        }

        [Bindable(event="propertyChange")]
        public function get propRight():Text
        {
            return (this._740436871propRight);
        }

        [Bindable(event="propertyChange")]
        public function get selectPetInfo1():RoundedLabel
        {
            return (this._1413892224selectPetInfo1);
        }

        [Bindable(event="propertyChange")]
        public function get selectPetInfo2():RoundedLabel
        {
            return (this._1413892225selectPetInfo2);
        }

        public function __evolutionBtn_click(_arg_1:MouseEvent):void
        {
            toEvolution();
        }

        public function __circle2_click(_arg_1:MouseEvent):void
        {
            circleHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        private function get _core():Core
        {
            return (this._90794110_core);
        }

        public function __pageTab_tabChanged(_arg_1:DressEvent):void
        {
            viewChange(_arg_1);
        }

        public function __pet8_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        public function set autoBuy(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._646343081autoBuy;
            if (_local_2 !== _arg_1)
            {
                this._646343081autoBuy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoBuy", _local_2, _arg_1));
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

        private function changeSWF():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:int;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:String;
            if (selectPet)
            {
                _local_1 = selectPet.creatureData;
                if (_local_1)
                {
                    _local_6 = ResManager.getResUrl(_local_1.resCode);
                    if (showCanvas1.url != _local_6)
                    {
                        showCanvas1.url = _local_6;
                    };
                    showCanvas1.color = ((selectPet.colorCode) ? selectPet.colorCode : _local_1.colorCode);
                };
                _local_2 = _core.data.gameDataIndex3[GamePredef.TBL_CREATURE_HANDBOOK][_local_1.id];
                for (_local_4 in _local_2)
                {
                    if (_local_2[_local_4].relateId == _local_1.id)
                    {
                        _local_3 = _local_2[_local_4].evolutionId;
                    };
                };
                if (_local_3)
                {
                    _local_5 = _core.data.gameData[GamePredef.TBL_CREATURE][_local_3];
                };
                if (_local_5)
                {
                    _local_7 = ResManager.getResUrl(_local_5.resCode);
                    if (showCanvas2.url != _local_7)
                    {
                        showCanvas2.url = _local_7;
                    };
                    showCanvas2.color = ((selectPet.colorCode) ? selectPet.colorCode : _local_5.colorCode);
                };
                refreshPro();
                envoSelect.visible = true;
            }
            else
            {
                showCanvas1.url = "";
                showCanvas2.url = "";
                petProData.removeAll();
                envoSelect.visible = false;
                nextPro.visible = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get fire1():Image
        {
            return (this._97439931fire1);
        }

        [Bindable(event="propertyChange")]
        public function get fire2():Image
        {
            return (this._97439932fire2);
        }

        [Bindable(event="propertyChange")]
        public function get fire3():Image
        {
            return (this._97439933fire3);
        }

        [Bindable(event="propertyChange")]
        public function get envoSelect():Image
        {
            return (this._2070140094envoSelect);
        }

        [Bindable(event="propertyChange")]
        public function get fire5():Image
        {
            return (this._97439935fire5);
        }

        [Bindable(event="propertyChange")]
        public function get fire6():Image
        {
            return (this._97439936fire6);
        }

        [Bindable(event="propertyChange")]
        public function get fire0():Image
        {
            return (this._97439930fire0);
        }

        private function _PetEvolutionPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetEvolutionPanel_DataGridColumn4 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 70;
            _local_1.sortable = false;
            _local_1.dataField = "name";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_PetEvolutionPanel_DataGridColumn4", _PetEvolutionPanel_DataGridColumn4);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get fire4():Image
        {
            return (this._97439934fire4);
        }

        private function helpHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_2:String = Language.PET_EVOLUTION_PANEL_U[4][pageTab.selectedIndex];
            _helpAlert = Alert.show(LanguageUtil.html2PlainText(_local_2), "", Alert.YES);
            _helpAlert.mx_internal::alertForm.mx_internal::textField.htmlText = _local_2;
        }

        public function set pageSelector2(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._1647659420pageSelector2;
            if (_local_2 !== _arg_1)
            {
                this._1647659420pageSelector2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get fire7():Image
        {
            return (this._97439937fire7);
        }

        [Bindable(event="propertyChange")]
        public function get fire8():Image
        {
            return (this._97439938fire8);
        }

        public function __petE3_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        private function _PetEvolutionPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetEvolutionPanel_DataGridColumn3 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 80;
            _local_1.sortable = false;
            _local_1.dataField = "nextPro";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_PetEvolutionPanel_DataGridColumn3", _PetEvolutionPanel_DataGridColumn3);
            return (_local_1);
        }

        public function set propNow(_arg_1:Text):void
        {
            var _local_2:Object = this._309153677propNow;
            if (_local_2 !== _arg_1)
            {
                this._309153677propNow = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propNow", _local_2, _arg_1));
            };
        }

        public function __pet11_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                _core.data.addEventListener(GamePredef.EVENT_REFRESH_FUNCSLOTS, onItemChange);
            }
            else
            {
                _core.data.removeEventListener(GamePredef.EVENT_REFRESH_FUNCSLOTS, onItemChange);
            };
        }

        [Bindable(event="propertyChange")]
        public function get sock1():Image
        {
            return (this._109610221sock1);
        }

        [Bindable(event="propertyChange")]
        public function get sock2():Image
        {
            return (this._109610222sock2);
        }

        [Bindable(event="propertyChange")]
        public function get sock3():Image
        {
            return (this._109610223sock3);
        }

        [Bindable(event="propertyChange")]
        public function get evolutionBtn():DelayButton
        {
            return (this._1324347617evolutionBtn);
        }

        private function showNoCanEnvolutePet():void
        {
            var _local_1:String;
            var _local_2:Alert;
            var _local_3:IUITextField;
            if (((firstIn) && (petList.length == 0)))
            {
                firstIn = false;
                _local_1 = Language.PET_EVOLUTION_PANEL_U[45].toString();
                _local_2 = Alert.show(_local_1, _local_1, Alert.YES, null, null);
                _local_3 = _local_2.mx_internal::alertForm.mx_internal::textField;
                _local_3.htmlText = _local_1;
                _local_3.filters = GamePredef.FILTER_TEXT1;
            };
        }

        public function set propRight(_arg_1:Text):void
        {
            var _local_2:Object = this._740436871propRight;
            if (_local_2 !== _arg_1)
            {
                this._740436871propRight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propRight", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propNext():Text
        {
            return (this._993838858propNext);
        }

        public function updateContract():void
        {
            var _local_4:*;
            var _local_5:int;
            var _local_6:String;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:int;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:ContractCircle;
            var _local_1:* = "";
            var _local_2:* = "";
            var _local_3:Object = _core.player.contractPet;
            for (_local_4 in GamePredef.CONTRACT_DICT)
            {
                _local_6 = GamePredef.CONTRACT_DICT[_local_4];
                _local_7 = (((_local_3) && (_local_3[_local_6])) ? _local_3[_local_6] : 0);
                _local_8 = GameData.d[GamePredef.TBL_PET_CONTRACT][_local_7];
                if (!_local_8)
                {
                    if ((int(_local_4) % 2) == 1)
                    {
                        _local_1 = (_local_1 + ((_local_1) ? "\n" : ""));
                        _local_1 = (_local_1 + Language.PET_EVOLUTION_PANEL_U[56][_local_4]);
                    }
                    else
                    {
                        _local_2 = (_local_2 + ((_local_2) ? "\n" : ""));
                        _local_2 = (_local_2 + Language.PET_EVOLUTION_PANEL_U[56][_local_4]);
                    };
                }
                else
                {
                    _local_9 = _local_8[("prop" + _local_4)];
                    _local_10 = ((_local_8[("propNum" + _local_4)]) || (0));
                    if (_core.player.classId == 5)
                    {
                        _local_11 = ((_local_8[("extraNum" + _local_4)]) || (0));
                        _local_10 = (_local_10 + _local_11);
                    };
                    if ((int(_local_4) % 2) == 1)
                    {
                        _local_1 = (_local_1 + ((_local_1) ? "\n" : ""));
                        _local_1 = (_local_1 + (((GamePredef.AWAKEN_PROP_DICT[_local_9] + "+") + _local_10.toFixed(2)) + "%"));
                    }
                    else
                    {
                        _local_2 = (_local_2 + ((_local_2) ? "\n" : ""));
                        _local_2 = (_local_2 + (((GamePredef.AWAKEN_PROP_DICT[_local_9] + "+") + _local_10.toFixed(2)) + "%"));
                    };
                };
            };
            propLeft.htmlText = _local_1;
            propRight.htmlText = _local_2;
            _local_5 = 1;
            while (_local_5 <= 4)
            {
                _local_12 = this[("circle" + _local_5)];
                _local_12.updateView();
                _local_5++;
            };
            this.updateSelectContract();
            this.onItemChange();
        }

        private function set _core(_arg_1:Core):void
        {
            var _local_2:Object = this._90794110_core;
            if (_local_2 !== _arg_1)
            {
                this._90794110_core = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_core", _local_2, _arg_1));
            };
        }

        public function set selectPetInfo1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1413892224selectPetInfo1;
            if (_local_2 !== _arg_1)
            {
                this._1413892224selectPetInfo1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectPetInfo1", _local_2, _arg_1));
            };
        }

        public function set selectPetInfo2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1413892225selectPetInfo2;
            if (_local_2 !== _arg_1)
            {
                this._1413892225selectPetInfo2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectPetInfo2", _local_2, _arg_1));
            };
        }

        public function set pageTab(_arg_1:HButtonTab):void
        {
            var _local_2:Object = this._803559802pageTab;
            if (_local_2 !== _arg_1)
            {
                this._803559802pageTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTab", _local_2, _arg_1));
            };
        }

        private function init(_arg_1:int=0):void
        {
            nextPro.visible = false;
            var _local_2:int;
            selectPet = null;
            if (_arg_1 == 0)
            {
                selectPet = petList[0];
            }
            else
            {
                _local_2 = 0;
                while (_local_2 < petList.length)
                {
                    if ((((petList[_local_2]) && (petList[_local_2].creatureData)) && (petList[_local_2].creatureData.id == _arg_1)))
                    {
                        selectPet = petList[_local_2];
                        break;
                    };
                    _local_2++;
                };
            };
            if (!selectPet)
            {
                selectPet = petList[0];
                _local_2 = 0;
            };
            onPageChanged(0, (petList.length % ITEM_COUNT_PER_PAGE));
            var _local_3:int = (_local_2 % ITEM_COUNT_PER_PAGE);
            envoSelect.x = (12 + ((_local_3 % (ITEM_COUNT_PER_PAGE / 2)) * (pet1.x - pet0.x)));
            envoSelect.y = (37 + (int((_local_3 / (ITEM_COUNT_PER_PAGE / 2))) * (pet6.y - pet0.y)));
            pageSelector.initPageSeletor(petList.length, ITEM_COUNT_PER_PAGE);
            changeSWF();
        }

        public function __petE8_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        private function _PetEvolutionPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetEvolutionPanel_DataGridColumn2 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 80;
            _local_1.sortable = false;
            _local_1.dataField = "curPro";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_PetEvolutionPanel_DataGridColumn2", _PetEvolutionPanel_DataGridColumn2);
            return (_local_1);
        }

        public function __pet2_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get evolutionPro():DataGrid
        {
            return (this._1324361010evolutionPro);
        }

        private function getAddPro(_arg_1:int, _arg_2:int, _arg_3:Boolean=false):String
        {
            var _local_5:int;
            var _local_6:int;
            var _local_4:int = GamePredef.PET_ENVOLUTION_FEATHER_STEP[_arg_1][_arg_2][_currentRound][_currentStep];
            if (_arg_3)
            {
                if (((_currentRound == (ROUND_MAX - 1)) && (_currentStep == STAGE_MAX)))
                {
                    return ("0");
                };
                _local_5 = _currentRound;
                _local_6 = (_currentStep + 1);
                if (((_local_5 < (ROUND_MAX - 1)) && (_local_6 == STAGE_MAX)))
                {
                    _local_5++;
                    _local_6 = 0;
                };
                _local_4 = (GamePredef.PET_ENVOLUTION_FEATHER_STEP[_arg_1][_arg_2][_local_5][_local_6] - GamePredef.PET_ENVOLUTION_FEATHER_STEP[_arg_1][_arg_2][_currentRound][_currentStep]);
            };
            return ("+" + _local_4.toString());
        }

        public function set petEvolutionTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._406889116petEvolutionTitle;
            if (_local_2 !== _arg_1)
            {
                this._406889116petEvolutionTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEvolutionTitle", _local_2, _arg_1));
            };
        }

        public function __circle1_click(_arg_1:MouseEvent):void
        {
            circleHandler(_arg_1);
        }

        public function set view(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3619493view;
            if (_local_2 !== _arg_1)
            {
                this._3619493view = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "view", _local_2, _arg_1));
            };
        }

        private function _PetEvolutionPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetEvolutionPanel_DataGridColumn1 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 70;
            _local_1.sortable = false;
            _local_1.dataField = "name";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_PetEvolutionPanel_DataGridColumn1", _PetEvolutionPanel_DataGridColumn1);
            return (_local_1);
        }

        public function __pet7_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get circle2():ContractCircle
        {
            return (this._782949730circle2);
        }

        [Bindable(event="propertyChange")]
        public function get circle3():ContractCircle
        {
            return (this._782949731circle3);
        }

        [Bindable(event="propertyChange")]
        public function get circle4():ContractCircle
        {
            return (this._782949732circle4);
        }

        [Bindable(event="propertyChange")]
        public function get protectSlot():ItemSlot
        {
            return (this._691653267protectSlot);
        }

        private function initFeather():void
        {
            petFeatherListRefresh();
            onPageChangedFeather(0, (petListFeather.length % FEATHER_COUNT_PER_PAGE));
            featherSelect.x = 4;
            featherSelect.y = 1;
            selectPetFeather = petListFeather[0];
            pageSelector2.initPageSeletor(petListFeather.length, FEATHER_COUNT_PER_PAGE);
            proTextRefresh();
            refreshProtect();
            if (((!(_core.player.pmLevel)) || (ToolKit.isSmallOrEqual(_core.player.pmLevel, 0))))
            {
                toNextStepBtn.visible = false;
            }
            else
            {
                toNextStepBtn.visible = true;
            };
        }

        public function set fire2(_arg_1:Image):void
        {
            var _local_2:Object = this._97439932fire2;
            if (_local_2 !== _arg_1)
            {
                this._97439932fire2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fire2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get circle1():ContractCircle
        {
            return (this._782949729circle1);
        }

        public function ___PetEvolutionPanel_DragableCanvas1_initialize(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function set envoSelect(_arg_1:Image):void
        {
            var _local_2:Object = this._2070140094envoSelect;
            if (_local_2 !== _arg_1)
            {
                this._2070140094envoSelect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "envoSelect", _local_2, _arg_1));
            };
        }

        public function ___PetEvolutionPanel_FilterButton2_click(_arg_1:MouseEvent):void
        {
            tenContractHandler(_arg_1);
        }

        public function set fire6(_arg_1:Image):void
        {
            var _local_2:Object = this._97439936fire6;
            if (_local_2 !== _arg_1)
            {
                this._97439936fire6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fire6", _local_2, _arg_1));
            };
        }

        public function set fire3(_arg_1:Image):void
        {
            var _local_2:Object = this._97439933fire3;
            if (_local_2 !== _arg_1)
            {
                this._97439933fire3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fire3", _local_2, _arg_1));
            };
        }

        public function set fire7(_arg_1:Image):void
        {
            var _local_2:Object = this._97439937fire7;
            if (_local_2 !== _arg_1)
            {
                this._97439937fire7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fire7", _local_2, _arg_1));
            };
        }

        public function set fire8(_arg_1:Image):void
        {
            var _local_2:Object = this._97439938fire8;
            if (_local_2 !== _arg_1)
            {
                this._97439938fire8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fire8", _local_2, _arg_1));
            };
        }

        public function set fire5(_arg_1:Image):void
        {
            var _local_2:Object = this._97439935fire5;
            if (_local_2 !== _arg_1)
            {
                this._97439935fire5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fire5", _local_2, _arg_1));
            };
        }

        public function set fire4(_arg_1:Image):void
        {
            var _local_2:Object = this._97439934fire4;
            if (_local_2 !== _arg_1)
            {
                this._97439934fire4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fire4", _local_2, _arg_1));
            };
        }

        public function set fire0(_arg_1:Image):void
        {
            var _local_2:Object = this._97439930fire0;
            if (_local_2 !== _arg_1)
            {
                this._97439930fire0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fire0", _local_2, _arg_1));
            };
        }

        public function set fire1(_arg_1:Image):void
        {
            var _local_2:Object = this._97439931fire1;
            if (_local_2 !== _arg_1)
            {
                this._97439931fire1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fire1", _local_2, _arg_1));
            };
        }

        public function __petE2_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        public function set nextPro(_arg_1:Image):void
        {
            var _local_2:Object = this._1847060154nextPro;
            if (_local_2 !== _arg_1)
            {
                this._1847060154nextPro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextPro", _local_2, _arg_1));
            };
        }

        private function getEvolutionPets(_arg_1:Object):Array
        {
            var _local_3:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                if (((_arg_1[_local_3]) && (envoluted(_arg_1[_local_3]))))
                {
                    _local_2.push(_arg_1[_local_3]);
                };
            };
            return (_local_2);
        }

        public function set zhen2(_arg_1:Image):void
        {
            var _local_2:Object = this._115868347zhen2;
            if (_local_2 !== _arg_1)
            {
                this._115868347zhen2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zhen2", _local_2, _arg_1));
            };
        }

        public function __pet10_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        public function set zhen1(_arg_1:Image):void
        {
            var _local_2:Object = this._115868346zhen1;
            if (_local_2 !== _arg_1)
            {
                this._115868346zhen1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zhen1", _local_2, _arg_1));
            };
        }

        private function toFeather():void
        {
            var _local_2:Object;
            if (!selectPetFeather)
            {
                return;
            };
            if (((_currentRound == (ROUND_MAX - 1)) && (_currentStep == STAGE_MAX)))
            {
                ViewManager.getInstance().getUI(ViewManager.MAIN_CHAT).showSystemMsg(Language.PET_EVOLUTION_PANEL_U[21]);
                return;
            };
            var _local_1:int = (GamePredef.PET_ENVOLUTION_FEATHER_PARAM * GamePredef.PET_ENVOLUTION_FEATHER_COST[_currentRound][_currentStep]);
            if (_local_1 > _core.player.npPnt)
            {
                ViewManager.getInstance().getUI(ViewManager.MAIN_CHAT).showSystemMsg(Language.PET_EVOLUTION_PANEL_U[16]);
                return;
            };
            if (((useProtect.selected) && (!((_currentStep % 3) == 0))))
            {
                _local_2 = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, PROTECT_ITEM_ID);
                if ((((!(_local_2)) || (!(_local_2.slot))) || (_local_2.num < GamePredef.PET_ENVOLUTION_FEATHER_COST_PROTECT[_currentRound][_currentStep])))
                {
                    ViewManager.getInstance().getUI(ViewManager.MAIN_CHAT).showSystemMsg(Language.PET_EVOLUTION_PANEL_U[20]);
                    return;
                };
            };
            _core.remote.call("toPetFeather", new Responder(onFeather), selectPetFeather.id, useProtect.selected);
        }

        private function petListRefresh():void
        {
            petList = getEvolutionAblePets(_core.player.petList);
            petList.sortOn(["tid", "growRate"], [(Array.DESCENDING | Array.NUMERIC), (Array.DESCENDING | Array.NUMERIC)]);
        }

        public function set itemText(_arg_1:Label):void
        {
            var _local_2:Object = this._1177514720itemText;
            if (_local_2 !== _arg_1)
            {
                this._1177514720itemText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText", _local_2, _arg_1));
            };
        }

        public function set evolutionBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1324347617evolutionBtn;
            if (_local_2 !== _arg_1)
            {
                this._1324347617evolutionBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "evolutionBtn", _local_2, _arg_1));
            };
        }

        private function onFeather(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.num == 1)
            {
                resultInfo(_arg_1.pid, _arg_1.success, _arg_1.round, _arg_1.stage, _arg_1.protect);
                if (_arg_1.success)
                {
                    skillCanvas.flash(Language.PET_EVOLUTION_PANEL_U[33]);
                }
                else
                {
                    skillCanvas.flash(Language.PET_EVOLUTION_PANEL_U[29]);
                };
            }
            else
            {
                if (_arg_1.num == 100)
                {
                    resultInfo(_arg_1.pid, true, _arg_1.round, _arg_1.stage, _arg_1.protect);
                };
            };
            proTextRefresh();
            refreshProtect();
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_3:int;
            while (_local_3 < ITEM_COUNT_PER_PAGE)
            {
                _local_4 = petList[(_local_3 + _arg_1)];
                if (_local_4)
                {
                    if (_local_4.inTrade)
                    {
                        this[("pet" + _local_3)].clean();
                    }
                    else
                    {
                        if (_local_4.inAuction)
                        {
                            this[("pet" + _local_3)].clean();
                        }
                        else
                        {
                            this[("pet" + _local_3)].type = GamePredef.TBL_PET;
                            this[("pet" + _local_3)].giid = _local_4.id;
                            this[("pet" + _local_3)].stackNum = 1;
                            this[("pet" + _local_3)].slotData = _local_4;
                        };
                    };
                };
                _local_3++;
            };
            envoSelect.visible = false;
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

        private function refreshPro():void
        {
            var _local_1:Object;
            var _local_2:int;
            var _local_3:Object;
            var _local_4:Object;
            petProData.removeAll();
            if (((selectPet) && (selectPet.creatureData)))
            {
                _local_1 = selectPet.creatureData;
                _local_2 = 0;
                _local_3 = _core.data.gameDataIndex3[GamePredef.TBL_CREATURE_HANDBOOK][_local_1.id];
                for (_local_4 in _local_3)
                {
                    if (_local_3[_local_4].relateId == _local_1.id)
                    {
                        _local_2 = _local_3[_local_4].evolutionId;
                    };
                };
                if (_local_2 > 0)
                {
                    petProData.addItem({
                        "name":Language.PETPANEL_U[12],
                        "curPro":Math.round((int(_local_1.aptStrength) * 1.2)),
                        "nextPro":(Math.round((int(_local_1.aptStrength) * 1.2)) + GamePredef.PET_ENVOLUTION_FEATHER_STEP[_local_2][0][(ROUND_MAX - 1)][STAGE_MAX])
                    });
                    petProData.addItem({
                        "name":Language.PETPANEL_U[14],
                        "curPro":Math.round((int(_local_1.aptStamina) * 1.2)),
                        "nextPro":(Math.round((int(_local_1.aptStamina) * 1.2)) + GamePredef.PET_ENVOLUTION_FEATHER_STEP[_local_2][1][(ROUND_MAX - 1)][STAGE_MAX])
                    });
                    petProData.addItem({
                        "name":Language.PETPANEL_U[13],
                        "curPro":Math.round((int(_local_1.aptAgility) * 1.2)),
                        "nextPro":(Math.round((int(_local_1.aptAgility) * 1.2)) + GamePredef.PET_ENVOLUTION_FEATHER_STEP[_local_2][2][(ROUND_MAX - 1)][STAGE_MAX])
                    });
                    petProData.addItem({
                        "name":Language.PETPANEL_U[15],
                        "curPro":Math.round((int(_local_1.aptIntelligence) * 1.2)),
                        "nextPro":(Math.round((int(_local_1.aptIntelligence) * 1.2)) + GamePredef.PET_ENVOLUTION_FEATHER_STEP[_local_2][3][(ROUND_MAX - 1)][STAGE_MAX])
                    });
                    petProData.addItem({
                        "name":Language.PETPANEL_U[16],
                        "curPro":Math.round((int(_local_1.aptEnergy) * 1.2)),
                        "nextPro":(Math.round((int(_local_1.aptEnergy) * 1.2)) + GamePredef.PET_ENVOLUTION_FEATHER_STEP[_local_2][4][(ROUND_MAX - 1)][STAGE_MAX])
                    });
                };
            };
        }

        public function __pet1_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        public function set sock2(_arg_1:Image):void
        {
            var _local_2:Object = this._109610222sock2;
            if (_local_2 !== _arg_1)
            {
                this._109610222sock2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sock2", _local_2, _arg_1));
            };
        }

        public function set sock3(_arg_1:Image):void
        {
            var _local_2:Object = this._109610223sock3;
            if (_local_2 !== _arg_1)
            {
                this._109610223sock3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sock3", _local_2, _arg_1));
            };
        }

        private function contractHandler(event:Event):void
        {
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var gfunc:Function;
            event.stopImmediatePropagation();
            var contractPet:Object = _core.player.contractPet;
            var propStr:String = GamePredef.CONTRACT_DICT[_selectType];
            var propLvl:int = (((contractPet) && (contractPet[propStr])) ? contractPet[propStr] : 0);
            if (propLvl >= GamePredef.MAX_CONTRACT_LEVEL)
            {
                _core.sysMidNote(Language.PET_EVOLUTION_PANEL_U[61]);
                return;
            };
            _contracting = true;
            if (autoBuy.selected)
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                goldLockFlag = bagPanel.goldLockFlag;
                if (((goldLockFlag) || (!(bagPanel))))
                {
                    _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                    gfunc = function (_arg_1:String):void
                    {
                        _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                    };
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                    return;
                };
            };
            _core.remote.call("contractPet", new Responder(onContractPet), _selectType, autoBuy.selected);
        }

        private function activated(_arg_1:int):Boolean
        {
            var _local_4:Object;
            var _local_2:Object = _core.player.activePetObject;
            var _local_3:Object = _core.data.gameDataIndex3[GamePredef.TBL_CREATURE_HANDBOOK][_arg_1];
            for (_local_4 in _local_3)
            {
                if ((((((_local_3[_local_4].relateId == _arg_1) && (_local_3[_local_4].evolutionId)) && (_local_2)) && (_local_2[_local_3[_local_4].id])) && (_local_2[_local_3[_local_4].id].actived)))
                {
                    return (true);
                };
            };
            return (false);
        }

        public function set pet0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437297pet0;
            if (_local_2 !== _arg_1)
            {
                this._3437297pet0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet0", _local_2, _arg_1));
            };
        }

        public function set pet1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437298pet1;
            if (_local_2 !== _arg_1)
            {
                this._3437298pet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get petProData():ArrayCollection
        {
            return (this._1042207272petProData);
        }

        public function set pet3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437300pet3;
            if (_local_2 !== _arg_1)
            {
                this._3437300pet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet3", _local_2, _arg_1));
            };
        }

        public function set pet4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437301pet4;
            if (_local_2 !== _arg_1)
            {
                this._3437301pet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petE1():ItemSlot
        {
            return (this._106556907petE1);
        }

        public function set pet5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437302pet5;
            if (_local_2 !== _arg_1)
            {
                this._3437302pet5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet5", _local_2, _arg_1));
            };
        }

        public function set pet2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437299pet2;
            if (_local_2 !== _arg_1)
            {
                this._3437299pet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet2", _local_2, _arg_1));
            };
        }

        public function set pet6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437303pet6;
            if (_local_2 !== _arg_1)
            {
                this._3437303pet6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet6", _local_2, _arg_1));
            };
        }

        private function onContractPetTen(_arg_1:Object=null):void
        {
            _contracting = false;
            if (!_arg_1)
            {
                return;
            };
            if (!_core.player.contractPet)
            {
                _core.player.contractPet = {};
            };
            var _local_2:Object = _core.player.contractPet;
            var _local_3:int = _arg_1.type;
            var _local_4:String = GamePredef.CONTRACT_DICT[_local_3];
            var _local_5:String = (_local_4 + GamePredef.CONTRACT_EXP);
            _local_2[_local_4] = _arg_1.newLvl;
            _local_2[_local_5] = _arg_1.newExp;
            this.updateContract();
        }

        [Bindable(event="propertyChange")]
        public function get bigCircle():BigContractCircle
        {
            return (this._511796720bigCircle);
        }

        [Bindable(event="propertyChange")]
        public function get petE0():ItemSlot
        {
            return (this._106556906petE0);
        }

        public function __petE7_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get petE2():ItemSlot
        {
            return (this._106556908petE2);
        }

        public function set pet9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437306pet9;
            if (_local_2 !== _arg_1)
            {
                this._3437306pet9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petE4():ItemSlot
        {
            return (this._106556910petE4);
        }

        public function __helpText_click(_arg_1:MouseEvent):void
        {
            helpHandler(_arg_1);
        }

        private function close():void
        {
            firstIn = true;
        }

        public function set pet8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437305pet8;
            if (_local_2 !== _arg_1)
            {
                this._3437305pet8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petE9():ItemSlot
        {
            return (this._106556915petE9);
        }

        public function set propNext(_arg_1:Text):void
        {
            var _local_2:Object = this._993838858propNext;
            if (_local_2 !== _arg_1)
            {
                this._993838858propNext = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propNext", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petE3():ItemSlot
        {
            return (this._106556909petE3);
        }

        [Bindable(event="propertyChange")]
        public function get petE5():ItemSlot
        {
            return (this._106556911petE5);
        }

        public function set pet7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437304pet7;
            if (_local_2 !== _arg_1)
            {
                this._3437304pet7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petE7():ItemSlot
        {
            return (this._106556913petE7);
        }

        [Bindable(event="propertyChange")]
        public function get petE8():ItemSlot
        {
            return (this._106556914petE8);
        }

        public function set sock1(_arg_1:Image):void
        {
            var _local_2:Object = this._109610221sock1;
            if (_local_2 !== _arg_1)
            {
                this._109610221sock1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sock1", _local_2, _arg_1));
            };
        }

        private function envoluted(_arg_1:Object):Boolean
        {
            if (!_arg_1.envoInfo)
            {
                return (false);
            };
            if (!_arg_1.envoInfo["envo"])
            {
                return (false);
            };
            return (_arg_1.envoInfo["envo"]);
        }

        [Bindable(event="propertyChange")]
        public function get propLeft():Text
        {
            return (this._993898998propLeft);
        }

        private function petClickHandlerFeather(_arg_1:Event):void
        {
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (((!(selectPetFeather)) || (!(_local_2.slotData))))
            {
                return;
            };
            if (selectPetFeather.id == _local_2.slotData.id)
            {
                featherSelect.visible = true;
                return;
            };
            selectPetFeather = _local_2.slotData;
            featherSelect.x = (_local_2.x + 4);
            featherSelect.y = (_local_2.y + 1);
            proTextRefresh();
        }

        [Bindable(event="propertyChange")]
        public function get petE6():ItemSlot
        {
            return (this._106556912petE6);
        }

        public function set skillCanvas(_arg_1:SkillCanvas):void
        {
            var _local_2:Object = this._1769958153skillCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1769958153skillCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillCanvas", _local_2, _arg_1));
            };
        }

        public function ___PetEvolutionPanel_FilterButton1_click(_arg_1:MouseEvent):void
        {
            contractHandler(_arg_1);
        }

        public function __pet6_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        public function set zhiranzhiliCost(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2072851743zhiranzhiliCost;
            if (_local_2 !== _arg_1)
            {
                this._2072851743zhiranzhiliCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zhiranzhiliCost", _local_2, _arg_1));
            };
        }

        private function toFeatherNextStep():void
        {
            var cost:int;
            var gfunc:Function;
            var str:String;
            var targetRound:int;
            var targetStage:int;
            if (!selectPetFeather)
            {
                return;
            };
            if (((_currentRound == (ROUND_MAX - 1)) && (_currentStep == STAGE_MAX)))
            {
                ViewManager.getInstance().getUI(ViewManager.MAIN_CHAT).showSystemMsg(Language.PET_EVOLUTION_PANEL_U[21]);
                return;
            };
            if (((_currentRound == (ROUND_MAX - 1)) && (_currentStep == STAGE_MAX)))
            {
                ViewManager.getInstance().getUI(ViewManager.MAIN_CHAT).showSystemMsg(Language.PET_EVOLUTION_PANEL_U[21]);
                return;
            };
            var bagPanel:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var goldLockFlag:Boolean = bagPanel.goldLockFlag;
            if (((goldLockFlag) || (!(bagPanel))))
            {
                _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                return;
            };
            cost = GamePredef.PET_ENVOLUTION_FEATHER_COST_GOLD[_currentRound][_currentStep];
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (_core.player.gold < cost)
                    {
                        Alert.show(Language.GUILDCONTRIBPANEL_U[1]);
                    }
                    else
                    {
                        _core.remote.call("toPetFeatherNextStep", new Responder(OnFeatherNextStep), selectPetFeather.id);
                    };
                };
            };
            if (_core.player)
            {
                str = Language.PET_EVOLUTION_PANEL_U[25];
                targetRound = _currentRound;
                targetStage = _currentStep;
                targetStage = int(((Math.floor((targetStage / 3)) + 1) * 3));
                str = str.replace("num", cost).replace("num1", (targetRound + 1)).replace("num2", targetStage);
                Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
            };
        }

        private function OnFeatherNextStep(_arg_1:Object):void
        {
            onFeather(_arg_1);
        }

        private function closeHandler(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.NO)
            {
                return;
            };
            _contracting = true;
            _core.remote.call("ensureBuyContractPet", new Responder(onContractPet), _selectType);
        }

        public function open(_arg_1:int):void
        {
            var _local_3:int;
            var _local_2:* = (!(this.visible));
            petListRefresh();
            if (_local_2)
            {
                _local_3 = getEnvoNumber();
                if (((petList.length == 0) && (_local_3 > 0)))
                {
                    pageTab.selectedIndex = 1;
                    initFeather();
                }
                else
                {
                    init(_arg_1);
                    pageTab.selectedIndex = 0;
                    showNoCanEnvolutePet();
                };
            }
            else
            {
                firstIn = true;
            };
            helpText.htmlText = Language.PET_EVOLUTION_PANEL_U[46][pageTab.selectedIndex];
            this.visible = _local_2;
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            var _local_2:BagPanel;
            var _local_3:Boolean;
            if (_arg_1)
            {
                _local_2 = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                _local_3 = _local_2.goldLockFlag;
                if (((!(_local_3 == false)) && (_local_2)))
                {
                    _local_2.goldLockFlag = false;
                };
            };
        }

        public function __petE1_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get autoBuy():CheckBox
        {
            return (this._646343081autoBuy);
        }

        [Bindable(event="propertyChange")]
        public function get nameText():Label
        {
            return (this._1840576088nameText);
        }

        public function set evolutionPro(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1324361010evolutionPro;
            if (_local_2 !== _arg_1)
            {
                this._1324361010evolutionPro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "evolutionPro", _local_2, _arg_1));
            };
        }

        private function resultInfo(_arg_1:int, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:Boolean):void
        {
            var _local_6:Object = _core.player.petList[_arg_1];
            if (((!(_local_6)) || (!(_local_6.envoInfo))))
            {
                return;
            };
            var _local_7:* = "";
            var _local_8:Object = ViewManager.getInstance().getUI(ViewManager.MAIN_CHAT);
            if (_arg_2)
            {
                if (int(_local_6.envoInfo["round"]) == _arg_3)
                {
                    _local_7 = Language.PET_EVOLUTION_PANEL_U[18];
                    _local_8.showSystemMsg(_local_7.replace("num1", (_arg_3 + 1)).replace("num2", _arg_4));
                }
                else
                {
                    _local_8.showSystemMsg(Language.PET_EVOLUTION_PANEL_U[30]);
                };
            }
            else
            {
                if (int(_local_6.envoInfo["stage"]) == _arg_4)
                {
                    _local_8.showSystemMsg(Language.PET_EVOLUTION_PANEL_U[29]);
                }
                else
                {
                    _local_7 = Language.PET_EVOLUTION_PANEL_U[19];
                    _local_8.showSystemMsg(_local_7.replace("num1", (_arg_3 + 1)).replace("num2", _arg_4));
                };
            };
            _local_6.envoInfo["stage"] = _arg_4;
            _local_6.envoInfo["round"] = _arg_3;
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector2():PageSelector
        {
            return (this._1647659420pageSelector2);
        }

        private function _PetEvolutionPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEvolutionTitle.text = _arg_1;
            }, "petEvolutionTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTab.filters = _arg_1;
            }, "pageTab.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.PET_EVOLUTION_PANEL_U[47]);
            }, function (_arg_1:Array):void
            {
                pageTab.dataArray = _arg_1;
            }, "pageTab.dataArray");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                helpText.filters = _arg_1;
            }, "helpText.filters");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTab.selectedIndex);
            }, function (_arg_1:int):void
            {
                view.selectedIndex = _arg_1;
            }, "view.selectedIndex");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_RoundedLabel1.text = _arg_1;
            }, "_PetEvolutionPanel_RoundedLabel1.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_RoundedLabel2.text = _arg_1;
            }, "_PetEvolutionPanel_RoundedLabel2.text");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000215));
            }, function (_arg_1:Object):void
            {
                zhen1.source = _arg_1;
            }, "zhen1.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000215));
            }, function (_arg_1:Object):void
            {
                zhen2.source = _arg_1;
            }, "zhen2.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000217));
            }, function (_arg_1:Object):void
            {
                direct.source = _arg_1;
            }, "direct.source");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                evolutionBtn.label = _arg_1;
            }, "evolutionBtn.label");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000216));
            }, function (_arg_1:Object):void
            {
                nextPro.source = _arg_1;
            }, "nextPro.source");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (petProData);
            }, function (_arg_1:Object):void
            {
                evolutionPro.dataProvider = _arg_1;
            }, "evolutionPro.dataProvider");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_DataGridColumn1.headerText = _arg_1;
            }, "_PetEvolutionPanel_DataGridColumn1.headerText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_DataGridColumn2.headerText = _arg_1;
            }, "_PetEvolutionPanel_DataGridColumn2.headerText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_DataGridColumn3.headerText = _arg_1;
            }, "_PetEvolutionPanel_DataGridColumn3.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_RoundedLabel3.text = _arg_1;
            }, "_PetEvolutionPanel_RoundedLabel3.text");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000213));
            }, function (_arg_1:Object):void
            {
                envoSelect.source = _arg_1;
            }, "envoSelect.source");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet0.slotType = _arg_1;
            }, "pet0.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet1.slotType = _arg_1;
            }, "pet1.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet2.slotType = _arg_1;
            }, "pet2.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet3.slotType = _arg_1;
            }, "pet3.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet4.slotType = _arg_1;
            }, "pet4.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet5.slotType = _arg_1;
            }, "pet5.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet6.slotType = _arg_1;
            }, "pet6.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet7.slotType = _arg_1;
            }, "pet7.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet8.slotType = _arg_1;
            }, "pet8.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet9.slotType = _arg_1;
            }, "pet9.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet10.slotType = _arg_1;
            }, "pet10.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet11.slotType = _arg_1;
            }, "pet11.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000212));
            }, function (_arg_1:Object):void
            {
                roundImg.source = _arg_1;
            }, "roundImg.source");
            result[30] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000218));
            }, function (_arg_1:Object):void
            {
                sock1.source = _arg_1;
            }, "sock1.source");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                sock1.toolTip = _arg_1;
            }, "sock1.toolTip");
            result[32] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000218));
            }, function (_arg_1:Object):void
            {
                sock2.source = _arg_1;
            }, "sock2.source");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                sock2.toolTip = _arg_1;
            }, "sock2.toolTip");
            result[34] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000218));
            }, function (_arg_1:Object):void
            {
                sock3.source = _arg_1;
            }, "sock3.source");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                sock3.toolTip = _arg_1;
            }, "sock3.toolTip");
            result[36] = binding;
            binding = new Binding(this, function ():Object
            {
                return (basicProData);
            }, function (_arg_1:Object):void
            {
                basicPro.dataProvider = _arg_1;
            }, "basicPro.dataProvider");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_DataGridColumn4.headerText = _arg_1;
            }, "_PetEvolutionPanel_DataGridColumn4.headerText");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_DataGridColumn5.headerText = _arg_1;
            }, "_PetEvolutionPanel_DataGridColumn5.headerText");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_DataGridColumn6.headerText = _arg_1;
            }, "_PetEvolutionPanel_DataGridColumn6.headerText");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_DataGridColumn7.headerText = _arg_1;
            }, "_PetEvolutionPanel_DataGridColumn7.headerText");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_Label1.text = _arg_1;
            }, "_PetEvolutionPanel_Label1.text");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_LinkButton1.label = _arg_1;
            }, "_PetEvolutionPanel_LinkButton1.label");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.npPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_Label2.text = _arg_1;
            }, "_PetEvolutionPanel_Label2.text");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_Label3.text = _arg_1;
            }, "_PetEvolutionPanel_Label3.text");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[66];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                featherRate.text = _arg_1;
            }, "featherRate.text");
            result[46] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                protectSlot.slotType = _arg_1;
            }, "protectSlot.slotType");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_RoundedLabel6.text = _arg_1;
            }, "_PetEvolutionPanel_RoundedLabel6.text");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = "";
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                zhiranzhiliCost.text = _arg_1;
            }, "zhiranzhiliCost.text");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_DelayButton2.label = _arg_1;
            }, "_PetEvolutionPanel_DelayButton2.label");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                toNextStepBtn.label = _arg_1;
            }, "toNextStepBtn.label");
            result[51] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000213));
            }, function (_arg_1:Object):void
            {
                featherSelect.source = _arg_1;
            }, "featherSelect.source");
            result[52] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE0.slotType = _arg_1;
            }, "petE0.slotType");
            result[53] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE1.slotType = _arg_1;
            }, "petE1.slotType");
            result[54] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE2.slotType = _arg_1;
            }, "petE2.slotType");
            result[55] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE3.slotType = _arg_1;
            }, "petE3.slotType");
            result[56] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE4.slotType = _arg_1;
            }, "petE4.slotType");
            result[57] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE5.slotType = _arg_1;
            }, "petE5.slotType");
            result[58] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE6.slotType = _arg_1;
            }, "petE6.slotType");
            result[59] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE7.slotType = _arg_1;
            }, "petE7.slotType");
            result[60] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE8.slotType = _arg_1;
            }, "petE8.slotType");
            result[61] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                petE9.slotType = _arg_1;
            }, "petE9.slotType");
            result[62] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220002073));
            }, function (_arg_1:Object):void
            {
                _PetEvolutionPanel_Image20.source = _arg_1;
            }, "_PetEvolutionPanel_Image20.source");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_Text2.htmlText = _arg_1;
            }, "_PetEvolutionPanel_Text2.htmlText");
            result[64] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetEvolutionPanel_Text2.filters = _arg_1;
            }, "_PetEvolutionPanel_Text2.filters");
            result[65] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                propLeft.filters = _arg_1;
            }, "propLeft.filters");
            result[66] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                propRight.filters = _arg_1;
            }, "propRight.filters");
            result[67] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                itemText.filters = _arg_1;
            }, "itemText.filters");
            result[68] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nameText.filters = _arg_1;
            }, "nameText.filters");
            result[69] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                propNow.filters = _arg_1;
            }, "propNow.filters");
            result[70] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Assets.UP_ARROW);
            }, function (_arg_1:Object):void
            {
                _PetEvolutionPanel_Image21.source = _arg_1;
            }, "_PetEvolutionPanel_Image21.source");
            result[71] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                propNext.filters = _arg_1;
            }, "propNext.filters");
            result[72] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                needText.filters = _arg_1;
            }, "needText.filters");
            result[73] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetEvolutionPanel_Label9.filters = _arg_1;
            }, "_PetEvolutionPanel_Label9.filters");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_Label9.text = _arg_1;
            }, "_PetEvolutionPanel_Label9.text");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[55];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_FilterButton1.label = _arg_1;
            }, "_PetEvolutionPanel_FilterButton1.label");
            result[76] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetEvolutionPanel_FilterButton1.filters = _arg_1;
            }, "_PetEvolutionPanel_FilterButton1.filters");
            result[77] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[64];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetEvolutionPanel_FilterButton2.label = _arg_1;
            }, "_PetEvolutionPanel_FilterButton2.label");
            result[78] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetEvolutionPanel_FilterButton2.filters = _arg_1;
            }, "_PetEvolutionPanel_FilterButton2.filters");
            result[79] = binding;
            return (result);
        }

        public function onEnsureBuyContract(_arg_1:int):void
        {
            if (_buyAlert)
            {
                PopUpManager.removePopUp(_buyAlert);
                _buyAlert = null;
            };
            var _local_2:String = LanguageUtil.replace(Language.PET_EVOLUTION_PANEL_U[62], {"money":_arg_1});
            _buyAlert = Alert.show(LanguageUtil.html2PlainText(_local_2), "", (Alert.YES | Alert.NO), null, closeHandler);
            _buyAlert.mx_internal::alertForm.mx_internal::textField.htmlText = _local_2;
        }

        private function clearPage():void
        {
            var _local_1:int;
            while (_local_1 < 12)
            {
                this[("pet" + _local_1)].clean();
                _local_1++;
            };
        }

        private function clearPageFeather():void
        {
            var _local_1:int;
            while (_local_1 < 10)
            {
                this[("petE" + _local_1)].clean();
                _local_1++;
            };
        }

        public function set tile2(_arg_1:Tile):void
        {
            var _local_2:Object = this._110363460tile2;
            if (_local_2 !== _arg_1)
            {
                this._110363460tile2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tile2", _local_2, _arg_1));
            };
        }

        public function set useProtect(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1930251448useProtect;
            if (_local_2 !== _arg_1)
            {
                this._1930251448useProtect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useProtect", _local_2, _arg_1));
            };
        }

        private function _PetEvolutionPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_EVOLUTION_PANEL_U[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[47];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = pageTab.selectedIndex;
            _local_1 = Language.PET_EVOLUTION_PANEL_U[43];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[44];
            _local_1 = ResManager.getIconUrl(4130220000215);
            _local_1 = ResManager.getIconUrl(4130220000215);
            _local_1 = ResManager.getIconUrl(4130220000217);
            _local_1 = Language.PET_EVOLUTION_PANEL_U[1];
            _local_1 = ResManager.getIconUrl(4130220000216);
            _local_1 = petProData;
            _local_1 = Language.PET_EVOLUTION_PANEL_U[6];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[7];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[8];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[42];
            _local_1 = ResManager.getIconUrl(4130220000213);
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = ResManager.getIconUrl(4130220000212);
            _local_1 = ResManager.getIconUrl(4130220000218);
            _local_1 = Language.PET_EVOLUTION_PANEL_U[39];
            _local_1 = ResManager.getIconUrl(4130220000218);
            _local_1 = Language.PET_EVOLUTION_PANEL_U[40];
            _local_1 = ResManager.getIconUrl(4130220000218);
            _local_1 = Language.PET_EVOLUTION_PANEL_U[41];
            _local_1 = basicProData;
            _local_1 = Language.PET_EVOLUTION_PANEL_U[6];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[26];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[27];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[28];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[10];
            _local_1 = Language.ASTROLOGIC_PANEL_U[50];
            _local_1 = _core.player.npPnt;
            _local_1 = Language.PET_EVOLUTION_PANEL_U[11];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[66];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.PET_EVOLUTION_PANEL_U[12];
            _local_1 = "";
            _local_1 = Language.PET_EVOLUTION_PANEL_U[14];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[24];
            _local_1 = ResManager.getIconUrl(4130220000213);
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = ResManager.getIconUrl(4130220002073);
            _local_1 = Language.PET_EVOLUTION_PANEL_U[48];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Assets.UP_ARROW;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[54];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[55];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[64];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get petEvolutionTitle():BasicTitleCanvas
        {
            return (this._406889116petEvolutionTitle);
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        public function __petE6_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        public function __pet0_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get view():ViewStack
        {
            return (this._3619493view);
        }

        public function set roundImg(_arg_1:Image):void
        {
            var _local_2:Object = this._173227roundImg;
            if (_local_2 !== _arg_1)
            {
                this._173227roundImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roundImg", _local_2, _arg_1));
            };
        }

        public function set tile1(_arg_1:Tile):void
        {
            var _local_2:Object = this._110363459tile1;
            if (_local_2 !== _arg_1)
            {
                this._110363459tile1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tile1", _local_2, _arg_1));
            };
        }

        private function viewChange(_arg_1:Event):void
        {
            var _local_3:int;
            var _local_2:int = pageTab.selectedIndex;
            if (1 == _local_2)
            {
                _local_3 = getEnvoNumber();
                if (_local_3 < 1)
                {
                    Alert.show(Language.PET_EVOLUTION_PANEL_U[31], Language.PET_EVOLUTION_PANEL_U[31].toString(), Alert.YES, null, null);
                    return;
                };
                initFeather();
            }
            else
            {
                if (0 == _local_2)
                {
                    showNoCanEnvolutePet();
                }
                else
                {
                    if (2 == _local_2)
                    {
                        this.updateContract();
                    };
                };
            };
            helpText.htmlText = Language.PET_EVOLUTION_PANEL_U[46][pageTab.selectedIndex];
        }

        public function set circle1(_arg_1:ContractCircle):void
        {
            var _local_2:Object = this._782949729circle1;
            if (_local_2 !== _arg_1)
            {
                this._782949729circle1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "circle1", _local_2, _arg_1));
            };
        }

        public function set circle2(_arg_1:ContractCircle):void
        {
            var _local_2:Object = this._782949730circle2;
            if (_local_2 !== _arg_1)
            {
                this._782949730circle2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "circle2", _local_2, _arg_1));
            };
        }

        public function set circle3(_arg_1:ContractCircle):void
        {
            var _local_2:Object = this._782949731circle3;
            if (_local_2 !== _arg_1)
            {
                this._782949731circle3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "circle3", _local_2, _arg_1));
            };
        }

        private function gotoAstroPanel():void
        {
            if (_core.player.level < 70)
            {
                _core.sysMsg(Language.PET_HANDBOOK_PANEL_U[119]);
                return;
            };
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_ASTROLOGIC);
            if (_local_1)
            {
                _local_1.visible = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextPro():Image
        {
            return (this._1847060154nextPro);
        }

        [Bindable(event="propertyChange")]
        public function get zhen2():Image
        {
            return (this._115868347zhen2);
        }

        public function set costTXT(_arg_1:Label):void
        {
            var _local_2:Object = this._956131171costTXT;
            if (_local_2 !== _arg_1)
            {
                this._956131171costTXT = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "costTXT", _local_2, _arg_1));
            };
        }

        public function set circle4(_arg_1:ContractCircle):void
        {
            var _local_2:Object = this._782949732circle4;
            if (_local_2 !== _arg_1)
            {
                this._782949732circle4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "circle4", _local_2, _arg_1));
            };
        }

        private function refreshRoundInfo():void
        {
            var _local_2:int;
            var _local_3:String;
            refreshFire();
            if (((_currentRound == (ROUND_MAX - 1)) && (_currentStep == STAGE_MAX)))
            {
                costTXT.htmlText = "<font color='#FF0000'>0</font>";
            }
            else
            {
                _local_2 = (GamePredef.PET_ENVOLUTION_FEATHER_PARAM * GamePredef.PET_ENVOLUTION_FEATHER_COST[_currentRound][_currentStep]);
                _local_3 = "";
                if (_local_2 > _core.player.npPnt)
                {
                    _local_3 = "#ff0000";
                }
                else
                {
                    _local_3 = "#00ff00";
                };
                costTXT.htmlText = (((("<font color='" + _local_3) + "'>") + _local_2) + "</font>");
            };
            var _local_1:String = Language.PET_EVOLUTION_PANEL_U[13].toString();
            _local_2 = GamePredef.PET_ENVOLUTION_FEATHER_COST_PROTECT[_currentRound][_currentStep];
            zhiranzhiliCost.htmlText = _local_1.replace("num", _local_2);
        }

        public function set protectSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._691653267protectSlot;
            if (_local_2 !== _arg_1)
            {
                this._691653267protectSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "protectSlot", _local_2, _arg_1));
            };
        }

        public function __pet5_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get itemText():Label
        {
            return (this._1177514720itemText);
        }

        [Bindable(event="propertyChange")]
        public function get needText():Label
        {
            return (this._865666787needText);
        }

        [Bindable(event="propertyChange")]
        public function get zhen1():Image
        {
            return (this._115868346zhen1);
        }

        [Bindable(event="propertyChange")]
        public function get pet0():ItemSlot
        {
            return (this._3437297pet0);
        }

        [Bindable(event="propertyChange")]
        public function get pet1():ItemSlot
        {
            return (this._3437298pet1);
        }

        [Bindable(event="propertyChange")]
        public function get pet2():ItemSlot
        {
            return (this._3437299pet2);
        }

        [Bindable(event="propertyChange")]
        public function get pet3():ItemSlot
        {
            return (this._3437300pet3);
        }

        [Bindable(event="propertyChange")]
        public function get pet4():ItemSlot
        {
            return (this._3437301pet4);
        }

        [Bindable(event="propertyChange")]
        public function get pet5():ItemSlot
        {
            return (this._3437302pet5);
        }

        [Bindable(event="propertyChange")]
        public function get pet6():ItemSlot
        {
            return (this._3437303pet6);
        }

        [Bindable(event="propertyChange")]
        public function get pet7():ItemSlot
        {
            return (this._3437304pet7);
        }

        [Bindable(event="propertyChange")]
        public function get pet8():ItemSlot
        {
            return (this._3437305pet8);
        }

        [Bindable(event="propertyChange")]
        public function get pet9():ItemSlot
        {
            return (this._3437306pet9);
        }

        private function onEnvolution(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Object = _core.player.petList[_arg_1.pid];
            if (_local_2)
            {
                skillCanvas.flash(Language.PET_EVOLUTION_PANEL_U[32]);
                _local_2["creatureData"] = _core.data.gameData[GamePredef.TBL_CREATURE][_arg_1.tid];
                _local_2.envoInfo = _arg_1.envo;
                _local_2.tid = _arg_1.tid;
                petListRefresh();
                init();
            };
        }

        private function getEnvoNumber():int
        {
            return (getEvolutionPets(_core.player.petList).length);
        }

        public function set pet10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556286pet10;
            if (_local_2 !== _arg_1)
            {
                this._106556286pet10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet10", _local_2, _arg_1));
            };
        }

        public function set picCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1714701186picCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1714701186picCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "picCanvas", _local_2, _arg_1));
            };
        }

        public function set featherSelect(_arg_1:Image):void
        {
            var _local_2:Object = this._2033704065featherSelect;
            if (_local_2 !== _arg_1)
            {
                this._2033704065featherSelect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherSelect", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skillCanvas():SkillCanvas
        {
            return (this._1769958153skillCanvas);
        }

        public function __circle4_click(_arg_1:MouseEvent):void
        {
            circleHandler(_arg_1);
        }

        public function __petE0_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get zhiranzhiliCost():RoundedLabel
        {
            return (this._2072851743zhiranzhiliCost);
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

        public function set pet11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556287pet11;
            if (_local_2 !== _arg_1)
            {
                this._106556287pet11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet11", _local_2, _arg_1));
            };
        }

        public function __toNextStepBtn_click(_arg_1:MouseEvent):void
        {
            toFeatherNextStep();
        }

        private function petFeatherListRefresh():void
        {
            petListFeather = getEvolutionPets(_core.player.petList);
            petListFeather.sortOn(["tid", "growRate"], [(Array.DESCENDING | Array.NUMERIC), (Array.DESCENDING | Array.NUMERIC)]);
        }

        public function set basicPro(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1717383265basicPro;
            if (_local_2 !== _arg_1)
            {
                this._1717383265basicPro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro", _local_2, _arg_1));
            };
        }

        private function toEvolution():void
        {
            if (((!(selectPet)) || (!(selectPet.creatureData))))
            {
                return;
            };
            if (selectPet.binded == 0)
            {
                Alert.show(Language.PET_EVOLUTION_PANEL_U[37], Language.PET_EVOLUTION_PANEL_U[37].toString(), Alert.YES, null, null);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("toPetEnvolution", new Responder(onEnvolution), selectPet.id);
                };
            };
            var str:String = Language.PET_EVOLUTION_PANEL_U[38];
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get tile1():Tile
        {
            return (this._110363459tile1);
        }

        [Bindable(event="propertyChange")]
        public function get tile2():Tile
        {
            return (this._110363460tile2);
        }

        [Bindable(event="propertyChange")]
        public function get useProtect():CheckBox
        {
            return (this._1930251448useProtect);
        }

        private function onContractPet(_arg_1:Object=null):void
        {
            _contracting = false;
            if (!_arg_1)
            {
                return;
            };
            if (!_core.player.contractPet)
            {
                _core.player.contractPet = {};
            };
            var _local_2:Object = _core.player.contractPet;
            var _local_3:int = _arg_1.type;
            var _local_4:String = GamePredef.CONTRACT_DICT[_local_3];
            var _local_5:String = (_local_4 + GamePredef.CONTRACT_EXP);
            _local_2[_local_4] = _arg_1.newLvl;
            _local_2[_local_5] = _arg_1.newExp;
            this.updateContract();
        }

        [Bindable(event="propertyChange")]
        public function get roundImg():Image
        {
            return (this._173227roundImg);
        }

        private function updateSelectContract():void
        {
            var _local_4:Object;
            var _local_5:int;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:int;
            var _local_9:Object;
            var _local_10:int;
            var _local_11:Number;
            var _local_12:Number;
            var _local_1:Object = _core.player.contractPet;
            var _local_2:String = GamePredef.CONTRACT_DICT[_selectType];
            var _local_3:int = (((_local_1) && (_local_1[_local_2])) ? _local_1[_local_2] : 0);
            nameText.text = ((Language.PET_EVOLUTION_PANEL_U[59][_selectType] + Language.PET_EVOLUTION_PANEL_U[50]) + _local_3);
            if (_local_3 <= 0)
            {
                propNow.htmlText = (Language.PET_EVOLUTION_PANEL_U[51] + Language.PET_EVOLUTION_PANEL_U[58]);
            }
            else
            {
                if ((_local_3 > GamePredef.MAX_CONTRACT_LEVEL))
                {
                    _local_3 = GamePredef.MAX_CONTRACT_LEVEL;
                };
                _local_4 = GameData.d[GamePredef.TBL_PET_CONTRACT][_local_3];
                _local_5 = _local_4[("prop" + _selectType)];
                _local_6 = _local_4[("propNum" + _selectType)];
                if (_core.player.classId == 5)
                {
                    _local_7 = _local_4[("extraNum" + _selectType)];
                    _local_6 = (_local_6 + _local_7);
                };
                propNow.htmlText = ((((Language.PET_EVOLUTION_PANEL_U[51] + GamePredef.AWAKEN_PROP_DICT[_local_5]) + "+") + _local_6.toFixed(2)) + "%");
            };
            if (_local_3 >= GamePredef.MAX_CONTRACT_LEVEL)
            {
                needText.visible = false;
                propNext.htmlText = (Language.PET_EVOLUTION_PANEL_U[52] + Language.PET_EVOLUTION_PANEL_U[60]);
            }
            else
            {
                _local_8 = (_local_3 + 1);
                _local_9 = GameData.d[GamePredef.TBL_PET_CONTRACT][_local_8];
                needText.visible = true;
                needText.text = (Language.PET_EVOLUTION_PANEL_U[53] + _local_9.reqNum);
                _local_10 = _local_9[("prop" + _selectType)];
                _local_11 = _local_9[("propNum" + _selectType)];
                if (_core.player.classId == 5)
                {
                    _local_12 = _local_9[("extraNum" + _selectType)];
                    _local_11 = (_local_11 + _local_12);
                };
                propNext.htmlText = ((((Language.PET_EVOLUTION_PANEL_U[52] + GamePredef.AWAKEN_PROP_DICT[_local_10]) + "+") + _local_11.toFixed(2)) + "%");
            };
            bigCircle.updateView(_selectType);
        }

        public function ___PetEvolutionPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            gotoAstroPanel();
        }

        private function petClickHandler(_arg_1:Event):void
        {
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (!_local_2.slotData)
            {
                return;
            };
            if (((selectPet) && (selectPet.id == _local_2.slotData.id)))
            {
                envoSelect.visible = true;
                return;
            };
            selectPet = _local_2.slotData;
            envoSelect.x = (_local_2.x + 12);
            envoSelect.y = (_local_2.y + 39);
            changeSWF();
        }

        [Bindable(event="propertyChange")]
        public function get costTXT():Label
        {
            return (this._956131171costTXT);
        }

        public function __petE5_click(_arg_1:MouseEvent):void
        {
            petClickHandlerFeather(_arg_1);
        }

        public function ___PetEvolutionPanel_DragableCanvas1_remove(_arg_1:FlexEvent):void
        {
            close();
        }

        private function refreshProtect():void
        {
            this["protectSlot"].type = GamePredef.TBL_ITEM_TEMPLATE;
            this["protectSlot"].giid = PROTECT_ITEM_ID;
            this["protectSlot"].stackNum = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, PROTECT_ITEM_ID).num;
            this["protectSlot"].enabled = true;
            this["protectSlot"].acceptable = false;
        }

        [Bindable(event="propertyChange")]
        public function get featherSelect():Image
        {
            return (this._2033704065featherSelect);
        }

        [Bindable(event="propertyChange")]
        public function get pet10():ItemSlot
        {
            return (this._106556286pet10);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        [Bindable(event="propertyChange")]
        public function get picCanvas():Canvas
        {
            return (this._1714701186picCanvas);
        }

        private function getEvolutionAblePets(_arg_1:Object):Array
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3].creatureData;
                if (((((_local_4) && (int(_local_4.classIds) == 10)) && (activated(_local_4.id))) && (!(envoluted(_arg_1[_local_3])))))
                {
                    _local_2.push(_arg_1[_local_3]);
                };
            };
            return (_local_2);
        }

        override public function initialize():void
        {
            var target:PetEvolutionPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetEvolutionPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetEvolutionPanelWatcherSetupUtil");
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

        public function ___PetEvolutionPanel_DelayButton2_click(_arg_1:MouseEvent):void
        {
            toFeather();
        }

        public function __pet4_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro():DataGrid
        {
            return (this._1717383265basicPro);
        }

        [Bindable(event="propertyChange")]
        public function get pet11():ItemSlot
        {
            return (this._106556287pet11);
        }

        private function set petProData(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1042207272petProData;
            if (_local_2 !== _arg_1)
            {
                this._1042207272petProData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petProData", _local_2, _arg_1));
            };
        }

        private function refreshFire():void
        {
            var _local_3:int;
            var _local_1:int;
            var _local_2:int;
            _local_1 = 0;
            while (_local_1 < STAGE_MAX)
            {
                _local_3 = ((_currentRound - 1) + ((_local_1 < _currentStep) ? 1 : 0));
                if (_local_3 >= 0)
                {
                    this[("fire" + _local_1)].source = ResManager.getIconUrl(fireUrl[_local_3]);
                    this[("fire" + _local_1)].visible = true;
                }
                else
                {
                    this[("fire" + _local_1)].visible = false;
                };
                _local_1++;
            };
        }

        public function __circle3_click(_arg_1:MouseEvent):void
        {
            circleHandler(_arg_1);
        }

        public function set petE0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556906petE0;
            if (_local_2 !== _arg_1)
            {
                this._106556906petE0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE0", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector2.onPageChanged = onPageChangedFeather;
            pageSelector2.onPageCleared = clearPageFeather;
        }

        public function set petE1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556907petE1;
            if (_local_2 !== _arg_1)
            {
                this._106556907petE1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE1", _local_2, _arg_1));
            };
        }

        public function set petE2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556908petE2;
            if (_local_2 !== _arg_1)
            {
                this._106556908petE2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE2", _local_2, _arg_1));
            };
        }

        public function set direct(_arg_1:Image):void
        {
            var _local_2:Object = this._1331586071direct;
            if (_local_2 !== _arg_1)
            {
                this._1331586071direct = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "direct", _local_2, _arg_1));
            };
        }

        public function set petE5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556911petE5;
            if (_local_2 !== _arg_1)
            {
                this._106556911petE5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE5", _local_2, _arg_1));
            };
        }

        public function set bigCircle(_arg_1:BigContractCircle):void
        {
            var _local_2:Object = this._511796720bigCircle;
            if (_local_2 !== _arg_1)
            {
                this._511796720bigCircle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bigCircle", _local_2, _arg_1));
            };
        }

        public function set petE3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556909petE3;
            if (_local_2 !== _arg_1)
            {
                this._106556909petE3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE3", _local_2, _arg_1));
            };
        }

        private function onItemChange(_arg_1:GameDataEvent=null):void
        {
            if ((((!(this.initialized)) || (!(this.visible))) || (_contracting)))
            {
                return;
            };
            itemText.text = (Language.PET_EVOLUTION_PANEL_U[49] + _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, CONTRACT_ITEMID).num);
        }

        public function __pet9_click(_arg_1:MouseEvent):void
        {
            petClickHandler(_arg_1);
        }

        public function set petE8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556914petE8;
            if (_local_2 !== _arg_1)
            {
                this._106556914petE8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE8", _local_2, _arg_1));
            };
        }

        private function _PetEvolutionPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetEvolutionPanel_DataGridColumn7 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 70;
            _local_1.sortable = false;
            _local_1.dataField = "nextPro2";
            _local_1.setStyle("textAlign", "center");
            _local_1.setStyle("color", 326404);
            BindingManager.executeBindings(this, "_PetEvolutionPanel_DataGridColumn7", _PetEvolutionPanel_DataGridColumn7);
            return (_local_1);
        }

        public function set petE9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556915petE9;
            if (_local_2 !== _arg_1)
            {
                this._106556915petE9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE9", _local_2, _arg_1));
            };
        }

        public function set petE6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556912petE6;
            if (_local_2 !== _arg_1)
            {
                this._106556912petE6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get direct():Image
        {
            return (this._1331586071direct);
        }

        public function set petE4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556910petE4;
            if (_local_2 !== _arg_1)
            {
                this._106556910petE4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get basicProData():ArrayCollection
        {
            return (this._1719946217basicProData);
        }

        private function set basicProData(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1719946217basicProData;
            if (_local_2 !== _arg_1)
            {
                this._1719946217basicProData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicProData", _local_2, _arg_1));
            };
        }

        public function set petE7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556913petE7;
            if (_local_2 !== _arg_1)
            {
                this._106556913petE7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petE7", _local_2, _arg_1));
            };
        }

        private function onPageChangedFeather(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_3:int;
            while (_local_3 < 10)
            {
                _local_4 = petListFeather[(_local_3 + _arg_1)];
                if (_local_4)
                {
                    if (_local_4.inTrade)
                    {
                        this[("petE" + _local_3)].clean();
                    }
                    else
                    {
                        if (_local_4.inAuction)
                        {
                            this[("petE" + _local_3)].clean();
                        }
                        else
                        {
                            this[("petE" + _local_3)].type = GamePredef.TBL_PET;
                            this[("petE" + _local_3)].giid = _local_4.id;
                            this[("petE" + _local_3)].stackNum = 1;
                            this[("petE" + _local_3)].slotData = _local_4;
                        };
                    };
                };
                _local_3++;
            };
            featherSelect.visible = false;
        }


    }
}//package com.qeedoo.ui.view.compDragable

