// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetHandbook

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.Property;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import flash.display.Loader;
    import mx.controls.Alert;
    import mx.controls.TextArea;
    import mx.containers.Canvas;
    import mx.core.UIComponent;
    import flash.display.MovieClip;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.ButtonTree;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import mx.collections.ArrayCollection;
    import mx.events.FlexEvent;
    import flash.net.URLRequest;
    import mx.events.ListEvent;
    import com.qeedoo.game.data.GameData;
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

    public class PetHandbook extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _677709750petName:Label;
        private var _692413227classImg:Image;
        private var _1753050362petHiddenProp2:Label;
        public var _PetHandbook_Image1:Image;
        public var _PetHandbook_LinkButton1:LinkButton;
        public var _PetHandbook_LinkButton2:LinkButton;
        private var _247885319statusPet4:Label;
        private var _661045344petEvolutionBtn:DelayButton;
        private var _1026941175petAptStamina:Label;
        private var _464115109petLevel:Label;
        private var _677294173progressActiveNum6:Property;
        private var b:Boolean = false;
        private var _979804988prop12:Label;
        private var _SERIE:int = 0;
        private var _677847407petImg5:Image;
        private var _770866455progressTotal:Property;
        private var playType:int = 0;
        private var _1596220963skillSlot2:ItemSlot;
        private var _104723017petMapLive:Label;
        private var _106940726prop9:Label;
        private var _176118958seriePropAdd4:Label;
        private var _handbookId:Number = 0;
        private var _1695470783petAptIntelligenceMax:Label;
        private var _888262899petAptAgilityMin:Label;
        private var _106940720prop3:Label;
        private var _677294171progressActiveNum8:Property;
        private var _552417655petAptStaminaMin:Label;
        private var _174671760petActiveNormalBtn:DelayButton;
        private var load:Loader;
        private var _247885320statusPet5:Label;
        private var _186958625petAptAgility:Label;
        private var _762725793petActiveMoneyBtn:DelayButton;
        private var _677847403petImg9:Image;
        private var _141601409serieTypeName:Label;
        private var _677294178progressActiveNum1:Property;
        private var _helpAlert:Alert;
        private var _979804987prop13:Label;
        private var _247885323statusPet8:Label;
        private var _192442979petDescText:TextArea;
        private var _575917863elementImg:Image;
        private var _1983701820petAptEnergyMin:Label;
        private var _677847408petImg4:Image;
        private var _677847410petImg2:Image;
        private var _1062648537oneSerieProcess:Canvas;
        private var _106940721prop4:Label;
        private var _484087665progressActiveTotal:Property;
        private var _247885318statusPet3:Label;
        private var _145245136container1:UIComponent;
        private var _483746560petNatureNum:Label;
        private var mc:MovieClip;
        private var _1072417325serieEffect:Label;
        private var _677294176progressActiveNum3:Property;
        private var _CREATURE:int = 1;
        private var _379017676allSerieEffect:Label;
        private var _995543379panel1:Canvas;
        private var _144113051petAptIntelligence:Label;
        private var _1356615745petActiveNum:Label;
        public var _PetHandbook_Label2:Label;
        public var _PetHandbook_Label3:Label;
        public var _PetHandbook_Label4:Label;
        public var _PetHandbook_Label6:Label;
        public var _PetHandbook_Label7:Label;
        public var _PetHandbook_Label8:Label;
        public var _PetHandbook_Label5:Label;
        private var _1596220962skillSlot1:ItemSlot;
        public var _PetHandbook_Label9:Label;
        private var _979804986prop14:Label;
        private var _1577614078npActiveNum:NumericStepper;
        private var _1695471021petAptIntelligenceMin:Label;
        private var _677847404petImg8:Image;
        private var _478717010progressActiveNum10:Property;
        private var _1753050361petHiddenProp3:Label;
        private var _888262661petAptAgilityMax:Label;
        private var _176118960seriePropAdd2:Label;
        private var _1596220965skillSlot4:ItemSlot;
        private var _1753050359petHiddenProp5:Label;
        private var _1983702058petAptEnergyMax:Label;
        private var _106940722prop5:Label;
        private var _677294174progressActiveNum5:Property;
        private var _activedNum:Number = 0;
        private var _534882346seridState:Image;
        private var _677847409petImg3:Image;
        private var _176118959seriePropAdd3:Label;
        private var _677847411petImg1:Image;
        private var _677514915petTree:ButtonTree;
        private var _1356532594petActivated:Label;
        private var _1704142595petAptStrengthMax:Label;
        private var _677846419petInfo:Canvas;
        private var _1290955033petAptStrength:Label;
        private var _247885322statusPet7:Label;
        private var _1753050363petHiddenProp1:Label;
        private var _106940718prop1:Label;
        private var _677294172progressActiveNum7:Property;
        private var _979804985prop15:Label;
        private var _106940723prop6:Label;
        private var _1711403170petGiftSkill:Label;
        private var _247885317statusPet2:Label;
        private var _677847405petImg7:Image;
        private var _goldRate:Number = 5;
        private var _31193047allSeriesProcess:Canvas;
        private var _905489748statusPet10:Label;
        public var _PetHandbook_Label10:Label;
        public var _PetHandbook_Label11:Label;
        public var _PetHandbook_Label12:Label;
        public var _PetHandbook_Label13:Label;
        public var _PetHandbook_Label14:Label;
        private var _974219530petActiveEffect:Label;
        private var _461566787petImg10:Image;
        private var _677294170progressActiveNum9:Property;
        private var _1500310190petAptEnergy:Label;
        private var _106940719prop2:Label;
        public var _PetHandbook_Label35:Label;
        public var _PetHandbook_Label37:Label;
        private var _979804990prop10:Label;
        public var _PetHandbook_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1596220964skillSlot3:ItemSlot;
        private var _106940724prop7:Label;
        private var _677294177progressActiveNum2:Property;
        private var _909209476petEvolutionBtnTotal:DelayButton;
        private var _176118961seriePropAdd1:Label;
        private var _677847406petImg6:Image;
        private var _979804989prop11:Label;
        private var _247885321statusPet6:Label;
        private var _1874945609petCatchDifficulty:Label;
        public var _PetHandbook_Label73:Label;
        private var _1753050360petHiddenProp4:Label;
        private var _1114801243serieEffect2:Label;
        private var _881404598tabPet:ViewStack;
        private var _relateId:Number = 0;
        private var _1704142357petAptStrengthMin:Label;
        private var _677294175progressActiveNum4:Property;
        private var _247885324statusPet9:Label;
        private var _552417893petAptStaminaMax:Label;
        private var _401544427_selectedURL:CharactorShowCanvas;
        private var _106940725prop8:Label;
        private var _247885316statusPet1:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":756,
                    "height":510,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetHandbook_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.top = "40";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":160,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ButtonTree,
                                    "id":"petTree",
                                    "events":{"itemClick":"__petTree_itemClick"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":151,
                                            "x":6,
                                            "percentHeight":100,
                                            "y":6
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "180";
                            this.top = "40";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":555,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_PetHandbook_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":555});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":UIComponent,
                                    "id":"container1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "-14";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"panel1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"seridState",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "75";
                                                    this.top = "40";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"tabPet",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "50";
                                                    this.bottom = "40";
                                                    this.right = "83";
                                                    this.left = "83";
                                                    this.color = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "creationPolicy":"all",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"allSeriesProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"allSerieEffect",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "20";
                                                                            this.top = "10";
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"visible":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "10";
                                                                            this.color = 0;
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "40";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveTotal",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "70";
                                                                            this.top = "40";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":240,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "60";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "70";
                                                                            this.top = "60";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "80";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "70";
                                                                            this.top = "80";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "100";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "70";
                                                                            this.top = "100";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "120";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "70";
                                                                            this.top = "120";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label8",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "200";
                                                                            this.top = "60";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "260";
                                                                            this.top = "60";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "200";
                                                                            this.top = "80";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "260";
                                                                            this.top = "80";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label10",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "200";
                                                                            this.top = "100";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "260";
                                                                            this.top = "100";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label11",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "200";
                                                                            this.top = "120";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum8",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "260";
                                                                            this.top = "120";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label12",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "140";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "70";
                                                                            this.top = "140";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label13",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "200";
                                                                            this.top = "140";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Property,
                                                                        "id":"progressActiveNum10",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "260";
                                                                            this.top = "140";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":13,
                                                                                "width":100,
                                                                                "styleName":"ProgressExp",
                                                                                "color":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label14",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "165";
                                                                            this.color = 0;
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "0";
                                                                            this.top = "170";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":150,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "30";
                                                                                        this.top = "10";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "150";
                                                                                        this.top = "10";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop3",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "270";
                                                                                        this.top = "10";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop4",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "30";
                                                                                        this.top = "40";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop5",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "150";
                                                                                        this.top = "40";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop6",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "270";
                                                                                        this.top = "40";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop7",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "30";
                                                                                        this.top = "70";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop8",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "150";
                                                                                        this.top = "70";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop9",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "270";
                                                                                        this.top = "70";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop10",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "30";
                                                                                        this.top = "100";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop11",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "150";
                                                                                        this.top = "100";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop12",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "270";
                                                                                        this.top = "100";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop13",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "30";
                                                                                        this.top = "130";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop14",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "150";
                                                                                        this.top = "130";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"prop15",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "270";
                                                                                        this.top = "130";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"petEvolutionBtnTotal",
                                                                        "events":{"click":"__petEvolutionBtnTotal_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.bottom = "5";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "labelPlacement":"bottom",
                                                                                "width":70,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkButton,
                                                                        "id":"_PetHandbook_LinkButton1",
                                                                        "events":{"click":"___PetHandbook_LinkButton1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textDecoration = "underline";
                                                                            this.bottom = "5";
                                                                            this.right = "10";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"height":17});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"petInfo",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":SimpleCanvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":5,
                                                                                "y":5,
                                                                                "height":165,
                                                                                "width":180,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":CharactorShowCanvas,
                                                                                    "id":"_selectedURL",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.borderStyle = "none";
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "height":10,
                                                                                            "width":10,
                                                                                            "y":133
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"classImg",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":7,
                                                                                            "y":6,
                                                                                            "width":16,
                                                                                            "height":16
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"elementImg",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":24.35,
                                                                                            "y":6,
                                                                                            "width":16,
                                                                                            "height":16
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petLevel",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.right = "4";
                                                                                        this.textAlign = "right";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"y":5});
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"petEvolutionBtn",
                                                                        "events":{"click":"__petEvolutionBtn_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":55,
                                                                                "y":145,
                                                                                "styleName":"BtnStdRed",
                                                                                "labelPlacement":"bottom",
                                                                                "width":70,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":SimpleCanvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":175,
                                                                                "height":75,
                                                                                "width":180,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":TextArea,
                                                                                    "id":"petDescText",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "10";
                                                                                        this.top = "10";
                                                                                        this.right = "10";
                                                                                        this.bottom = "10";
                                                                                        this.color = 0;
                                                                                        this.borderStyle = "none";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"CSSBorder",
                                                                                            "editable":false
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
                                                                                "x":190,
                                                                                "y":20,
                                                                                "height":130,
                                                                                "width":240,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petName",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "5";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 14;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petActivated",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "120";
                                                                                        this.top = "5";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petActiveEffect",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "25";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petActiveNum",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "45";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "visible":false,
                                                                                            "width":200
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Property,
                                                                                    "id":"progressTotal",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "55";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "height":13,
                                                                                            "width":180,
                                                                                            "styleName":"ProgressExp",
                                                                                            "color":0
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_PetHandbook_Label35",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "80";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":130});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petNatureNum",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "120";
                                                                                        this.top = "80";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":130});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_PetHandbook_Label37",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "105";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":170});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":NumericStepper,
                                                                                    "id":"npActiveNum",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "100";
                                                                                        this.top = "105";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "minimum":1,
                                                                                            "value":1
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":DelayButton,
                                                                                    "id":"petActiveNormalBtn",
                                                                                    "events":{"click":"__petActiveNormalBtn_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.top = "130";
                                                                                        this.left = "60";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdRed",
                                                                                            "labelPlacement":"bottom",
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":DelayButton,
                                                                                    "id":"petActiveMoneyBtn",
                                                                                    "events":{"click":"__petActiveMoneyBtn_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.top = "130";
                                                                                        this.left = "130";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdRed",
                                                                                            "labelPlacement":"bottom",
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petCatchDifficulty",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "150";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":170});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petMapLive",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "170";
                                                                                        this.color = 0;
                                                                                        this.fontWeight = "normal|bold";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":200});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petGiftSkill",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "190";
                                                                                        this.color = 0;
                                                                                        this.fontWeight = "normal|bold";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":170});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"skillSlot1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.top = "210";
                                                                                        this.borderStyle = "none";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":30,
                                                                                            "movable":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"skillSlot2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.top = "210";
                                                                                        this.borderStyle = "none";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":68,
                                                                                            "movable":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"skillSlot3",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.top = "210";
                                                                                        this.borderStyle = "none";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":106,
                                                                                            "movable":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"skillSlot4",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.top = "210";
                                                                                        this.borderStyle = "none";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":144,
                                                                                            "movable":false
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":SimpleCanvas,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "260";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":5,
                                                                                "height":100,
                                                                                "width":440,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptStrength",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "5";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":70});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptAgility",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "24";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":70});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptStamina",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "43";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":70});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptIntelligence",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "62";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":70});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptEnergy",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "81";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":70});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptStrengthMin",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "85";
                                                                                        this.top = "5";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptAgilityMin",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "85";
                                                                                        this.top = "24";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptStaminaMin",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "85";
                                                                                        this.top = "43";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptIntelligenceMin",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "85";
                                                                                        this.top = "62";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptEnergyMin",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "85";
                                                                                        this.top = "81";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptStrengthMax",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "190";
                                                                                        this.top = "5";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptAgilityMax",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "190";
                                                                                        this.top = "24";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptStaminaMax",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "190";
                                                                                        this.top = "43";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptIntelligenceMax",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "190";
                                                                                        this.top = "62";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petAptEnergyMax",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "190";
                                                                                        this.top = "81";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":90});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petHiddenProp1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "280";
                                                                                        this.top = "5";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":130});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petHiddenProp2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "280";
                                                                                        this.top = "24";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":130});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petHiddenProp3",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "280";
                                                                                        this.top = "43";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":130});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petHiddenProp4",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "280";
                                                                                        this.top = "62";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":130});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"petHiddenProp5",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "280";
                                                                                        this.top = "81";
                                                                                        this.fontSize = 12;
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":130});
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"oneSerieProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"serieTypeName",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "10";
                                                                            this.color = 0;
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"text":""});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"serieEffect",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.right = "20";
                                                                            this.top = "10";
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "40";
                                                                            this.left = "40";
                                                                            this.right = "40";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":180,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg1",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":10,
                                                                                            "y":10,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":10,
                                                                                            "y":60,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg2",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":70,
                                                                                            "y":10,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":70,
                                                                                            "y":60,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg3",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":130,
                                                                                            "y":10,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet3",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":130,
                                                                                            "y":60,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg4",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":190,
                                                                                            "y":10,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet4",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":190,
                                                                                            "y":60,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg5",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":250,
                                                                                            "y":10,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet5",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":250,
                                                                                            "y":60,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg6",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":10,
                                                                                            "y":90,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet6",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":10,
                                                                                            "y":150,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg7",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":70,
                                                                                            "y":90,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet7",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":70,
                                                                                            "y":150,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg8",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":130,
                                                                                            "y":90,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet8",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":130,
                                                                                            "y":150,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg9",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":190,
                                                                                            "y":90,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet9",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":190,
                                                                                            "y":150,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"petImg10",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":250,
                                                                                            "y":90,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "source":""
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"statusPet10",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":250,
                                                                                            "y":150,
                                                                                            "width":50
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetHandbook_Label73",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "220";
                                                                            this.color = 0;
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"serieEffect2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "20";
                                                                            this.top = "250";
                                                                            this.fontSize = 12;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "270";
                                                                            this.left = "10";
                                                                            this.right = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":70,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"seriePropAdd1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "10";
                                                                                        this.top = "10";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":180});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"seriePropAdd2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "200";
                                                                                        this.top = "10";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":180});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"seriePropAdd3",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "10";
                                                                                        this.top = "40";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":180});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"seriePropAdd4",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "200";
                                                                                        this.top = "40";
                                                                                        this.color = 0;
                                                                                        this.fontSize = 12;
                                                                                        this.textAlign = "center";
                                                                                        this.fontStyle = "normal";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":180});
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkButton,
                                                                        "id":"_PetHandbook_LinkButton2",
                                                                        "events":{"click":"___PetHandbook_LinkButton2_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textDecoration = "underline";
                                                                            this.bottom = "5";
                                                                            this.right = "10";
                                                                            this.color = 0;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"height":17});
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
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _kindType:Object = {
            "1":1,
            "2":2,
            "3":3,
            "4":4,
            "5":5,
            "6":6,
            "7":7,
            "8":8,
            "9":9,
            "10":10
        };
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetHandbook()
        {
            mx_internal::_document = this;
            this.width = 756;
            this.height = 510;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___PetHandbook_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetHandbook._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get petAptAgilityMax():Label
        {
            return (this._888262661petAptAgilityMax);
        }

        public function set statusPet1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._247885316statusPet1;
            if (_local_2 !== _arg_1)
            {
                this._247885316statusPet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet1", _local_2, _arg_1));
            };
        }

        public function set petAptAgilityMax(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._888262661petAptAgilityMax;
            if (_local_2 !== _arg_1)
            {
                this._888262661petAptAgilityMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptAgilityMax", _local_2, _arg_1));
            };
        }

        public function set statusPet3(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._247885318statusPet3;
            if (_local_2 !== _arg_1)
            {
                this._247885318statusPet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet3", _local_2, _arg_1));
            };
        }

        public function set statusPet4(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._247885319statusPet4;
            if (_local_2 !== _arg_1)
            {
                this._247885319statusPet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet4", _local_2, _arg_1));
            };
        }

        public function set statusPet5(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._247885320statusPet5;
            if (_local_2 !== _arg_1)
            {
                this._247885320statusPet5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet5", _local_2, _arg_1));
            };
        }

        public function set statusPet2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._247885317statusPet2;
            if (_local_2 !== _arg_1)
            {
                this._247885317statusPet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet2", _local_2, _arg_1));
            };
        }

        public function set statusPet6(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._247885321statusPet6;
            if (_local_2 !== _arg_1)
            {
                this._247885321statusPet6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet6", _local_2, _arg_1));
            };
        }

        public function set statusPet7(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._247885322statusPet7;
            if (_local_2 !== _arg_1)
            {
                this._247885322statusPet7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet7", _local_2, _arg_1));
            };
        }

        private function enterFrameHandler(_arg_1:Event):void
        {
            var _local_3:Sprite;
            var _local_4:UIComponent;
            if (!panel1.mask)
            {
                _local_3 = new Sprite();
                panel1.mask = _local_3;
                _local_4 = new UIComponent();
                _local_4.addChild(_local_3);
                panel1.parent.addChild(_local_4);
            };
            var _local_2:Sprite = (panel1.mask as Sprite);
            _local_2.x = ((mc.x - ((mc.width * (mc.currentFrame / mc.totalFrames)) / 2)) + 10);
            _local_2.graphics.clear();
            _local_2.graphics.beginFill(0xFF00, 0.5);
            _local_2.graphics.drawRect(0, 0, ((mc.width * (mc.currentFrame / mc.totalFrames)) - 10), mc.height);
            _local_2.graphics.endFill();
            panel1.mask = _local_2;
            panel1.x = (panel1.x + (1E-6 * ((b) ? 1 : -1)));
            b = (!(b));
            if (!panel1.visible)
            {
                panel1.visible = true;
            };
            if (((playType == 1) && (mc.currentFrame < mc.totalFrames)))
            {
                mc.gotoAndPlay((mc.currentFrame + 3));
            };
            if (mc.totalFrames == mc.currentFrame)
            {
                mc.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
                mc.gotoAndStop(mc.totalFrames);
                panel1.x = 0.0001;
            };
        }

        public function set statusPet8(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._247885323statusPet8;
            if (_local_2 !== _arg_1)
            {
                this._247885323statusPet8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet8", _local_2, _arg_1));
            };
        }

        public function set statusPet9(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._247885324statusPet9;
            if (_local_2 !== _arg_1)
            {
                this._247885324statusPet9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petActiveNum():Label
        {
            return (this._1356615745petActiveNum);
        }

        public function set skillSlot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1596220962skillSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1596220962skillSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot1", _local_2, _arg_1));
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_2:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("juanzhou_mc") as Class);
            mc = new (_local_2)();
            container1.addChild(mc);
            mc.x = (mc.width >> 1);
            mc.y = (mc.height >> 1);
            mc.gotoAndStop(1);
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            showPanel();
        }

        public function set skillSlot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1596220964skillSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1596220964skillSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot3", _local_2, _arg_1));
            };
        }

        public function __petEvolutionBtn_click(_arg_1:MouseEvent):void
        {
            showPetEvolutionPanel();
        }

        public function set skillSlot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1596220963skillSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1596220963skillSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petName():Label
        {
            return (this._677709750petName);
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum10():Property
        {
            return (this._478717010progressActiveNum10);
        }

        public function set skillSlot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1596220965skillSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1596220965skillSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot4", _local_2, _arg_1));
            };
        }

        public function set serieEffect(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1072417325serieEffect;
            if (_local_2 !== _arg_1)
            {
                this._1072417325serieEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "serieEffect", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petActiveNormalBtn():DelayButton
        {
            return (this._174671760petActiveNormalBtn);
        }

        private function activeGold():void
        {
            var requireNum:Number;
            var type:* = undefined;
            if (((!(_core.player.pmLevel)) || (ToolKit.isSmallOrEqual(_core.player.pmLevel, 0))))
            {
                _core.sysMidNote(Language.PET_HANDBOOK_PANEL_U[115]);
                return;
            };
            var _activeObj:* = _core.player.activePetObject;
            if ((((_activeObj) && (_activeObj[_handbookId])) && (_activeObj[_handbookId].actived)))
            {
                _core.sysMsg(Language.PET_HANDBOOK_PANEL_U[95]);
            };
            requireNum = _getActiveGold();
            if (requireNum < 0)
            {
                _core.sysMsg(Language.PET_HANDBOOK_PANEL_U[102]);
            };
            var creatureData:* = _core.data.gameData[GamePredef.TBL_CREATURE][_relateId];
            if (!creatureData)
            {
                return;
            };
            type = "gold";
            if (creatureData.classIds != 10)
            {
                type = "gold";
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:Object = {};
                _local_2.num = requireNum;
                _local_2.pid = _handbookId;
                _local_2.moneyType = type;
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("activePetGold", new Responder(setActiveInfo), _local_2);
                };
            };
            if (((type == "gold") && (requireNum > 0)))
            {
                Alert.show(Language.PET_HANDBOOK_PANEL_U[100].toString().replace("{num}", requireNum), "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                if (((type == "goldBind") && (requireNum > 0)))
                {
                    Alert.show(Language.PET_HANDBOOK_PANEL_U[101].toString().replace("{num}", requireNum), "", (Alert.YES | Alert.NO), null, func);
                };
            };
        }

        public function set petActiveNum(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1356615745petActiveNum;
            if (_local_2 !== _arg_1)
            {
                this._1356615745petActiveNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petActiveNum", _local_2, _arg_1));
            };
        }

        public function set petMapLive(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._104723017petMapLive;
            if (_local_2 !== _arg_1)
            {
                this._104723017petMapLive = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMapLive", _local_2, _arg_1));
            };
        }

        public function set petName(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._677709750petName;
            if (_local_2 !== _arg_1)
            {
                this._677709750petName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petGiftSkill():Label
        {
            return (this._1711403170petGiftSkill);
        }

        public function set progressActiveNum10(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._478717010progressActiveNum10;
            if (_local_2 !== _arg_1)
            {
                this._478717010progressActiveNum10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum10", _local_2, _arg_1));
            };
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.PET_HANDBOOK_PANEL_U[98].toString();
            _helpAlert = Alert.show(_local_1, Language.PET_HANDBOOK_PANEL_U[99].toString(), Alert.YES, null, null);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" load Error ");
        }

        [Bindable(event="propertyChange")]
        public function get prop11():Label
        {
            return (this._979804989prop11);
        }

        [Bindable(event="propertyChange")]
        public function get prop13():Label
        {
            return (this._979804987prop13);
        }

        [Bindable(event="propertyChange")]
        public function get petAptIntelligenceMax():Label
        {
            return (this._1695470783petAptIntelligenceMax);
        }

        [Bindable(event="propertyChange")]
        public function get prop15():Label
        {
            return (this._979804985prop15);
        }

        private function _PetHandbook_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_BasicTitleCanvas1.text = _arg_1;
            }, "_PetHandbook_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000214));
            }, function (_arg_1:Object):void
            {
                _PetHandbook_Image1.source = _arg_1;
            }, "_PetHandbook_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[96];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                allSerieEffect.htmlText = _arg_1;
            }, "allSerieEffect.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label2.text = _arg_1;
            }, "_PetHandbook_Label2.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label3.text = _arg_1;
            }, "_PetHandbook_Label3.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label4.text = _arg_1;
            }, "_PetHandbook_Label4.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label5.text = _arg_1;
            }, "_PetHandbook_Label5.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label6.text = _arg_1;
            }, "_PetHandbook_Label6.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label7.text = _arg_1;
            }, "_PetHandbook_Label7.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label8.text = _arg_1;
            }, "_PetHandbook_Label8.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label9.text = _arg_1;
            }, "_PetHandbook_Label9.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label10.text = _arg_1;
            }, "_PetHandbook_Label10.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[110];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label11.text = _arg_1;
            }, "_PetHandbook_Label11.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[118];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label12.text = _arg_1;
            }, "_PetHandbook_Label12.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[120];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label13.text = _arg_1;
            }, "_PetHandbook_Label13.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label14.text = _arg_1;
            }, "_PetHandbook_Label14.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop1.htmlText = _arg_1;
            }, "prop1.htmlText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop2.htmlText = _arg_1;
            }, "prop2.htmlText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop3.htmlText = _arg_1;
            }, "prop3.htmlText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop4.htmlText = _arg_1;
            }, "prop4.htmlText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop5.htmlText = _arg_1;
            }, "prop5.htmlText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop6.htmlText = _arg_1;
            }, "prop6.htmlText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop7.htmlText = _arg_1;
            }, "prop7.htmlText");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop8.htmlText = _arg_1;
            }, "prop8.htmlText");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop9.htmlText = _arg_1;
            }, "prop9.htmlText");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop10.htmlText = _arg_1;
            }, "prop10.htmlText");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop11.htmlText = _arg_1;
            }, "prop11.htmlText");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop12.htmlText = _arg_1;
            }, "prop12.htmlText");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop13.htmlText = _arg_1;
            }, "prop13.htmlText");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop14.htmlText = _arg_1;
            }, "prop14.htmlText");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prop15.htmlText = _arg_1;
            }, "prop15.htmlText");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_EVOLUTION_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEvolutionBtnTotal.label = _arg_1;
            }, "petEvolutionBtnTotal.label");
            result[31] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetHandbook_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_PetHandbook_LinkButton1.overSkin");
            result[32] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetHandbook_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_PetHandbook_LinkButton1.upSkin");
            result[33] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetHandbook_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_PetHandbook_LinkButton1.downSkin");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_LinkButton1.label = _arg_1;
            }, "_PetHandbook_LinkButton1.label");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEvolutionBtn.label = _arg_1;
            }, "petEvolutionBtn.label");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petDescText.text = _arg_1;
            }, "petDescText.text");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petName.text = _arg_1;
            }, "petName.text");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petActivated.htmlText = _arg_1;
            }, "petActivated.htmlText");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[86];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petActiveEffect.htmlText = _arg_1;
            }, "petActiveEffect.htmlText");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petActiveNum.text = _arg_1;
            }, "petActiveNum.text");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label35.text = _arg_1;
            }, "_PetHandbook_Label35.text");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.npPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petNatureNum.text = _arg_1;
            }, "petNatureNum.text");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label37.text = _arg_1;
            }, "_PetHandbook_Label37.text");
            result[44] = binding;
            binding = new Binding(this, function ():Number
            {
                return (_core.player.npPnt);
            }, function (_arg_1:Number):void
            {
                npActiveNum.maximum = _arg_1;
            }, "npActiveNum.maximum");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_HANDBOOK_PANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petActiveNormalBtn.label = _arg_1;
            }, "petActiveNormalBtn.label");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petActiveMoneyBtn.label = _arg_1;
            }, "petActiveMoneyBtn.label");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petCatchDifficulty.htmlText = _arg_1;
            }, "petCatchDifficulty.htmlText");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMapLive.htmlText = _arg_1;
            }, "petMapLive.htmlText");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petGiftSkill.text = _arg_1;
            }, "petGiftSkill.text");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptStrength.htmlText = _arg_1;
            }, "petAptStrength.htmlText");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptAgility.htmlText = _arg_1;
            }, "petAptAgility.htmlText");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptStamina.htmlText = _arg_1;
            }, "petAptStamina.htmlText");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptIntelligence.htmlText = _arg_1;
            }, "petAptIntelligence.htmlText");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptEnergy.htmlText = _arg_1;
            }, "petAptEnergy.htmlText");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptStrengthMin.htmlText = _arg_1;
            }, "petAptStrengthMin.htmlText");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptAgilityMin.htmlText = _arg_1;
            }, "petAptAgilityMin.htmlText");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptStaminaMin.htmlText = _arg_1;
            }, "petAptStaminaMin.htmlText");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptIntelligenceMin.htmlText = _arg_1;
            }, "petAptIntelligenceMin.htmlText");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptEnergyMin.htmlText = _arg_1;
            }, "petAptEnergyMin.htmlText");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptStrengthMax.htmlText = _arg_1;
            }, "petAptStrengthMax.htmlText");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptAgilityMax.htmlText = _arg_1;
            }, "petAptAgilityMax.htmlText");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptStaminaMax.htmlText = _arg_1;
            }, "petAptStaminaMax.htmlText");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptIntelligenceMax.htmlText = _arg_1;
            }, "petAptIntelligenceMax.htmlText");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petAptEnergyMax.htmlText = _arg_1;
            }, "petAptEnergyMax.htmlText");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petHiddenProp1.htmlText = _arg_1;
            }, "petHiddenProp1.htmlText");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petHiddenProp2.htmlText = _arg_1;
            }, "petHiddenProp2.htmlText");
            result[67] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petHiddenProp3.htmlText = _arg_1;
            }, "petHiddenProp3.htmlText");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petHiddenProp4.htmlText = _arg_1;
            }, "petHiddenProp4.htmlText");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petHiddenProp5.htmlText = _arg_1;
            }, "petHiddenProp5.htmlText");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[96];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                serieEffect.htmlText = _arg_1;
            }, "serieEffect.htmlText");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet1.htmlText = _arg_1;
            }, "statusPet1.htmlText");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet2.htmlText = _arg_1;
            }, "statusPet2.htmlText");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet3.htmlText = _arg_1;
            }, "statusPet3.htmlText");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet4.htmlText = _arg_1;
            }, "statusPet4.htmlText");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet5.htmlText = _arg_1;
            }, "statusPet5.htmlText");
            result[76] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet6.htmlText = _arg_1;
            }, "statusPet6.htmlText");
            result[77] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet7.htmlText = _arg_1;
            }, "statusPet7.htmlText");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet8.htmlText = _arg_1;
            }, "statusPet8.htmlText");
            result[79] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet9.htmlText = _arg_1;
            }, "statusPet9.htmlText");
            result[80] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                statusPet10.htmlText = _arg_1;
            }, "statusPet10.htmlText");
            result[81] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_Label73.text = _arg_1;
            }, "_PetHandbook_Label73.text");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[96];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                serieEffect2.htmlText = _arg_1;
            }, "serieEffect2.htmlText");
            result[83] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[85];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                seriePropAdd1.htmlText = _arg_1;
            }, "seriePropAdd1.htmlText");
            result[84] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[85];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                seriePropAdd2.htmlText = _arg_1;
            }, "seriePropAdd2.htmlText");
            result[85] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[85];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                seriePropAdd3.htmlText = _arg_1;
            }, "seriePropAdd3.htmlText");
            result[86] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PET_HANDBOOK_PANEL_U[85];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                seriePropAdd4.htmlText = _arg_1;
            }, "seriePropAdd4.htmlText");
            result[87] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetHandbook_LinkButton2.setStyle("overSkin", _arg_1);
            }, "_PetHandbook_LinkButton2.overSkin");
            result[88] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetHandbook_LinkButton2.setStyle("upSkin", _arg_1);
            }, "_PetHandbook_LinkButton2.upSkin");
            result[89] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetHandbook_LinkButton2.setStyle("downSkin", _arg_1);
            }, "_PetHandbook_LinkButton2.downSkin");
            result[90] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ASTROLOGIC_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetHandbook_LinkButton2.label = _arg_1;
            }, "_PetHandbook_LinkButton2.label");
            result[91] = binding;
            return (result);
        }

        public function set petAptIntelligence(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._144113051petAptIntelligence;
            if (_local_2 !== _arg_1)
            {
                this._144113051petAptIntelligence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptIntelligence", _local_2, _arg_1));
            };
        }

        private function showPetEvolutionPanel():void
        {
            if (_core.player.level < 120)
            {
                _core.sysMsg(Language.PET_HANDBOOK_PANEL_U[112]);
                return;
            };
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_PET_EVOLUTION);
            if (_local_1)
            {
                _local_1.open(_relateId);
            };
        }

        [Bindable(event="propertyChange")]
        public function get prop14():Label
        {
            return (this._979804986prop14);
        }

        private function initTree():void
        {
            var _local_3:*;
            var _local_4:ArrayCollection;
            var _local_5:int;
            var _local_6:*;
            var _local_7:*;
            var _local_1:Object = {};
            var _local_2:ArrayCollection = new ArrayCollection();
            _local_2.addItem({"label":Language.PET_HANDBOOK_PANEL_U[11]});
            for (_local_3 in _kindType)
            {
                _local_1[_local_3] = new ArrayCollection();
                _local_6 = _core.data.gameDataIndex[GamePredef.TBL_CREATURE_HANDBOOK][_local_3];
                for (_local_7 in _local_6)
                {
                    _local_1[_local_3].addItem({
                        "label":_local_6[_local_7].name.split("【")[0],
                        "kind":_local_3,
                        "type":_CREATURE,
                        "id":_local_6[_local_7].id,
                        "relateId":_local_6[_local_7].relateId
                    });
                };
                _local_2.addItem({
                    "label":GamePredef.PET_KIND_NAME[_local_3],
                    "kind":_local_3,
                    "children":_local_1[_local_3]
                });
            };
            _local_4 = new ArrayCollection();
            _local_5 = 0;
            while (_local_5 < _local_2.length)
            {
                _local_4.addItem(_local_2.getItemAt(_local_5));
                _local_5++;
            };
            petTree.dataProvider = _local_4;
        }

        [Bindable(event="propertyChange")]
        public function get prop10():Label
        {
            return (this._979804990prop10);
        }

        [Bindable(event="propertyChange")]
        public function get petAptEnergyMin():Label
        {
            return (this._1983701820petAptEnergyMin);
        }

        public function __petActiveNormalBtn_click(_arg_1:MouseEvent):void
        {
            activeNormal();
        }

        [Bindable(event="propertyChange")]
        public function get prop12():Label
        {
            return (this._979804988prop12);
        }

        public function set petActiveNormalBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._174671760petActiveNormalBtn;
            if (_local_2 !== _arg_1)
            {
                this._174671760petActiveNormalBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petActiveNormalBtn", _local_2, _arg_1));
            };
        }

        public function __petEvolutionBtnTotal_click(_arg_1:MouseEvent):void
        {
            showPetEvolutionPanel();
        }

        [Bindable(event="propertyChange")]
        public function get petAptAgility():Label
        {
            return (this._186958625petAptAgility);
        }

        public function ___PetHandbook_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get petAptAgilityMin():Label
        {
            return (this._888262899petAptAgilityMin);
        }

        [Bindable(event="propertyChange")]
        public function get petAptStrengthMax():Label
        {
            return (this._1704142595petAptStrengthMax);
        }

        public function showPanel():void
        {
            if (((!(load)) && (!(mc))))
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2060090400040)));
                return;
            };
            playType = 0;
            playMC();
            this.visible = true;
            _handbookId = 0;
            _relateId = 0;
            tabPet.selectedIndex = 0;
            closeAllNodes();
            showAllSeriesActiveData();
            getAllSeriesProp();
        }

        public function set serieTypeName(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._141601409serieTypeName;
            if (_local_2 !== _arg_1)
            {
                this._141601409serieTypeName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "serieTypeName", _local_2, _arg_1));
            };
        }

        public function set petInfo(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._677846419petInfo;
            if (_local_2 !== _arg_1)
            {
                this._677846419petInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get progressTotal():Property
        {
            return (this._770866455progressTotal);
        }

        public function set petAptStaminaMin(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._552417655petAptStaminaMin;
            if (_local_2 !== _arg_1)
            {
                this._552417655petAptStaminaMin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptStaminaMin", _local_2, _arg_1));
            };
        }

        public function set petImg3(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._677847409petImg3;
            if (_local_2 !== _arg_1)
            {
                this._677847409petImg3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg3", _local_2, _arg_1));
            };
        }

        public function set petImg5(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._677847407petImg5;
            if (_local_2 !== _arg_1)
            {
                this._677847407petImg5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg5", _local_2, _arg_1));
            };
        }

        public function set petImg6(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._677847406petImg6;
            if (_local_2 !== _arg_1)
            {
                this._677847406petImg6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg6", _local_2, _arg_1));
            };
        }

        public function set petImg7(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._677847405petImg7;
            if (_local_2 !== _arg_1)
            {
                this._677847405petImg7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg7", _local_2, _arg_1));
            };
        }

        public function set petImg4(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._677847408petImg4;
            if (_local_2 !== _arg_1)
            {
                this._677847408petImg4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg4", _local_2, _arg_1));
            };
        }

        public function set petImg8(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._677847404petImg8;
            if (_local_2 !== _arg_1)
            {
                this._677847404petImg8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg8", _local_2, _arg_1));
            };
        }

        private function showCreatureInfo():void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:*;
            var _local_7:Object;
            var _local_8:String;
            var _local_9:String;
            var _local_10:String;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            var _local_18:int;
            var _local_19:int;
            var _local_20:int;
            var _local_21:int;
            var _local_22:String;
            var _local_23:String;
            var _local_24:*;
            if (((!(_core.player.pmLevel)) || (ToolKit.isSmallOrEqual(_core.player.pmLevel, 0))))
            {
                petActiveMoneyBtn.visible = false;
            }
            else
            {
                petActiveMoneyBtn.visible = true;
            };
            if (_handbookId == 27)
            {
                _selectedURL.y = 157;
            }
            else
            {
                if (_handbookId == 72)
                {
                    _selectedURL.y = 83;
                }
                else
                {
                    _selectedURL.y = 133;
                };
            };
            var _local_1:* = _core.data.gameData[GamePredef.TBL_CREATURE][_relateId];
            var _local_2:* = _core.data.gameDataIndex2[GamePredef.TBL_CREATURE_HANDBOOK][_handbookId];
            var _local_3:* = _core.player.activePetObject;
            progressTotal.m = _local_2[_handbookId].activeNum1;
            if (!_local_2[_handbookId].evolutionId)
            {
                petEvolutionBtn.visible = false;
            }
            else
            {
                petEvolutionBtn.visible = true;
            };
            if ((((!(_local_2[_handbookId])) || (!(_local_2[_handbookId].propType))) || (!(_local_2[_handbookId].propNum))))
            {
                petActiveEffect.visible = false;
            }
            else
            {
                if (Number(_local_2[_handbookId].percentFlag) == 1)
                {
                    petActiveEffect.htmlText = Language.PET_HANDBOOK_PANEL_U[84].toString().replace("{type}", Language.PROP_NAME_U[int(_local_2[_handbookId].propType)]).replace("{num}", _local_2[_handbookId].propNum);
                }
                else
                {
                    petActiveEffect.htmlText = Language.PET_HANDBOOK_PANEL_U[86].toString().replace("{type}", Language.PROP_NAME_U[int(_local_2[_handbookId].propType)]).replace("{num}", _local_2[_handbookId].propNum);
                };
                petActiveEffect.visible = true;
            };
            if ((((!(_local_3)) || (!(_local_3[_handbookId]))) || (!(_local_3[_handbookId].actived))))
            {
                petActiveEffect.htmlText = petActiveEffect.htmlText.toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[114]);
                petActivated.htmlText = Language.PET_HANDBOOK_PANEL_U[33];
                petEvolutionBtn.enabled = false;
                if ((((_local_3) && (_local_3[_handbookId])) && (_local_3[_handbookId].activedNum)))
                {
                    progressTotal.v = _local_3[_handbookId].activedNum;
                    progressTotal.label = ((_local_3[_handbookId].activedNum + "/") + _local_2[_handbookId].activeNum1);
                    petActiveNum.text = Language.PET_HANDBOOK_PANEL_U[45].toString().replace("{num}", _local_3[_handbookId].activedNum).replace("{total}", _local_2[_handbookId].activeNum1);
                }
                else
                {
                    progressTotal.v = 0;
                    progressTotal.label = ((0 + "/") + _local_2[_handbookId].activeNum1);
                    petActiveNum.text = Language.PET_HANDBOOK_PANEL_U[45].toString().replace("{num}", 0).replace("{total}", _local_2[_handbookId].activeNum1);
                };
                _selectedURL.url = "";
                classImg.source = "";
                classImg.toolTip = "";
                elementImg.source = "";
                elementImg.toolTip = "";
                petLevel.text = "";
                petAptStrengthMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                petAptStrengthMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                petAptAgilityMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                petAptAgilityMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                petAptStaminaMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                petAptStaminaMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                petAptIntelligenceMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                petAptIntelligenceMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                petAptEnergyMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                petAptEnergyMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                _local_4 = 1;
                while (_local_4 < 5)
                {
                    this[("skillSlot" + _local_4)].clean();
                    _local_4++;
                };
                petMapLive.htmlText = Language.PET_HANDBOOK_PANEL_U[50].toString().replace("{name}", Language.PET_HANDBOOK_PANEL_U[55]);
                petCatchDifficulty.htmlText = Language.PET_HANDBOOK_PANEL_U[48].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                _local_5 = 1;
                _local_6 = GamePredef.PET_HIDDEN_PROP;
                for (_local_7 in _local_6)
                {
                    _local_8 = GamePredef.PET_HIDDEN_PROP[_local_7].data;
                    _local_9 = ((_local_1[_local_8]) ? _local_1[_local_8] : "0");
                    _local_10 = GamePredef.PET_HIDDEN_PROP[_local_7].name;
                    this[("petHiddenProp" + _local_5)].text = Language.PET_HANDBOOK_PANEL_U[87].toString().replace("{prop}", _local_10).replace("{num}", Language.PET_HANDBOOK_PANEL_U[55]);
                    _local_5++;
                };
                petDescText.text = Language.PET_HANDBOOK_PANEL_U[108].toString().replace("{disc}", Language.PET_HANDBOOK_PANEL_U[54]);
            }
            else
            {
                petActiveEffect.htmlText = petActiveEffect.htmlText.toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]);
                petActivated.htmlText = Language.PET_HANDBOOK_PANEL_U[32];
                petEvolutionBtn.enabled = true;
                progressTotal.v = _local_3[_handbookId].activedNum;
                progressTotal.label = ((_local_3[_handbookId].activedNum + "/") + _local_2[_handbookId].activeNum1);
                petActiveNum.text = Language.PET_HANDBOOK_PANEL_U[45].toString().replace("{num}", _local_3[_handbookId].activedNum).replace("{total}", _local_2[_handbookId].activeNum1);
                _selectedURL.url = ResManager.getResUrl(_local_1.resCode);
                classImg.source = ResManager.CREATURE_CLASS[_local_1.classId];
                classImg.toolTip = (GamePredef.CREATURE_QLEVEL[_local_1.qLevel] + GamePredef.CREATURE_CLASS_INFO[_local_1.classId]);
                elementImg.source = ResManager.ELEMENT_KIND[_local_1.element];
                elementImg.toolTip = GamePredef.ELEMENT_INFO[_local_1.element];
                petLevel.text = Language.TIPCRE_S[11].toString().replace("{vo.useLv}", _local_1.useLv);
                _local_11 = Math.round((_local_1.aptStrength * 0.8));
                _local_12 = Math.round((_local_1.aptStrength * 1.2));
                petAptStrengthMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", _local_11);
                petAptStrengthMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", _local_12);
                _local_13 = Math.round((_local_1.aptAgility * 0.8));
                _local_14 = Math.round((_local_1.aptAgility * 1.2));
                petAptAgilityMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", _local_13);
                petAptAgilityMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", _local_14);
                _local_15 = Math.round((_local_1.aptStamina * 0.8));
                _local_16 = Math.round((_local_1.aptStamina * 1.2));
                petAptStaminaMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", _local_15);
                petAptStaminaMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", _local_16);
                _local_17 = Math.round((_local_1.aptIntelligence * 0.8));
                _local_18 = Math.round((_local_1.aptIntelligence * 1.2));
                petAptIntelligenceMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", _local_17);
                petAptIntelligenceMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", _local_18);
                _local_19 = Math.round((_local_1.aptEnergy * 0.8));
                _local_20 = Math.round((_local_1.aptEnergy * 1.2));
                petAptEnergyMin.text = Language.PET_HANDBOOK_PANEL_U[53].toString().replace("{num}", _local_19);
                petAptEnergyMax.text = Language.PET_HANDBOOK_PANEL_U[52].toString().replace("{num}", _local_20);
                _local_21 = 1;
                _local_4 = 1;
                while (_local_4 < 5)
                {
                    this[("skillSlot" + _local_4)].clean();
                    if (_local_2[_handbookId][("skillId" + _local_4)])
                    {
                        this[("skillSlot" + _local_4)].giid = _local_2[_handbookId][("skillId" + _local_4)];
                        this[("skillSlot" + _local_4)].type = GamePredef.TBL_SKILL;
                        if (_core.data.hasData(GamePredef.TBL_SKILL, _local_2[_handbookId][("skillId" + _local_4)]))
                        {
                            _local_24 = _core.data.getGameData(GamePredef.TBL_SKILL, _local_2[_handbookId][("skillId" + _local_4)]);
                            this[("skillSlot" + _local_4)].slotData = _local_24;
                        };
                    };
                    _local_4++;
                };
                _local_22 = Language.PET_HANDBOOK_PANEL_U[88].toString();
                _local_23 = Language.PET_HANDBOOK_PANEL_U[49].toString();
                if (_local_2[_handbookId].mid)
                {
                    _local_22 = Language.PET_HANDBOOK_PANEL_U[89].toString().replace("{data}", _core.data.getGameData(GamePredef.TBL_MAP, _local_2[_handbookId].mid).name);
                };
                if (((_local_1.catchable) || (!(_local_1.catchable == "0"))))
                {
                    _local_23 = Language.PET_HANDBOOK_PANEL_U[89].toString().replace("{data}", _local_1.catchable);
                };
                petMapLive.htmlText = Language.PET_HANDBOOK_PANEL_U[50].toString().replace("{name}", _local_22);
                if (_local_1.catchable == "0")
                {
                    petCatchDifficulty.htmlText = Language.PET_HANDBOOK_PANEL_U[48].toString().replace("{num}", Language.PET_HANDBOOK_PANEL_U[109]);
                }
                else
                {
                    petCatchDifficulty.htmlText = Language.PET_HANDBOOK_PANEL_U[48].toString().replace("{num}", _local_23);
                };
                _local_5 = 1;
                _local_6 = GamePredef.PET_HIDDEN_PROP;
                for (_local_7 in _local_6)
                {
                    _local_8 = GamePredef.PET_HIDDEN_PROP[_local_7].data;
                    _local_9 = ((_local_1[_local_8]) ? _local_1[_local_8] : "0");
                    _local_10 = GamePredef.PET_HIDDEN_PROP[_local_7].name;
                    this[("petHiddenProp" + _local_5)].text = Language.PET_HANDBOOK_PANEL_U[87].toString().replace("{prop}", _local_10).replace("{num}", _local_9);
                    _local_5++;
                };
                petDescText.text = Language.PET_HANDBOOK_PANEL_U[108].toString().replace("{disc}", _local_2[_handbookId].discription);
            };
        }

        public function set petImg2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._677847410petImg2;
            if (_local_2 !== _arg_1)
            {
                this._677847410petImg2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prop1():Label
        {
            return (this._106940718prop1);
        }

        [Bindable(event="propertyChange")]
        public function get prop2():Label
        {
            return (this._106940719prop2);
        }

        public function set petImg1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._677847411petImg1;
            if (_local_2 !== _arg_1)
            {
                this._677847411petImg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prop6():Label
        {
            return (this._106940723prop6);
        }

        [Bindable(event="propertyChange")]
        public function get prop8():Label
        {
            return (this._106940725prop8);
        }

        [Bindable(event="propertyChange")]
        public function get prop9():Label
        {
            return (this._106940726prop9);
        }

        [Bindable(event="propertyChange")]
        public function get prop3():Label
        {
            return (this._106940720prop3);
        }

        [Bindable(event="propertyChange")]
        public function get prop4():Label
        {
            return (this._106940721prop4);
        }

        public function set petImg9(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._677847403petImg9;
            if (_local_2 !== _arg_1)
            {
                this._677847403petImg9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prop7():Label
        {
            return (this._106940724prop7);
        }

        [Bindable(event="propertyChange")]
        public function get prop5():Label
        {
            return (this._106940722prop5);
        }

        public function set petGiftSkill(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1711403170petGiftSkill;
            if (_local_2 !== _arg_1)
            {
                this._1711403170petGiftSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petGiftSkill", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabPet():ViewStack
        {
            return (this._881404598tabPet);
        }

        public function set panel1(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._995543379panel1;
            if (_local_2 !== _arg_1)
            {
                this._995543379panel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panel1", _local_2, _arg_1));
            };
        }

        public function set petAptEnergy(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1500310190petAptEnergy;
            if (_local_2 !== _arg_1)
            {
                this._1500310190petAptEnergy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptEnergy", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petTree():ButtonTree
        {
            return (this._677514915petTree);
        }

        public function set statusPet10(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._905489748statusPet10;
            if (_local_2 !== _arg_1)
            {
                this._905489748statusPet10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusPet10", _local_2, _arg_1));
            };
        }

        public function ___PetHandbook_LinkButton2_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        public function set petAptEnergyMin(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1983701820petAptEnergyMin;
            if (_local_2 !== _arg_1)
            {
                this._1983701820petAptEnergyMin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptEnergyMin", _local_2, _arg_1));
            };
        }

        public function __petActiveMoneyBtn_click(_arg_1:MouseEvent):void
        {
            activeGold();
        }

        public function set prop10(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._979804990prop10;
            if (_local_2 !== _arg_1)
            {
                this._979804990prop10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop10", _local_2, _arg_1));
            };
        }

        public function set prop14(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._979804986prop14;
            if (_local_2 !== _arg_1)
            {
                this._979804986prop14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop14", _local_2, _arg_1));
            };
        }

        public function set petAptIntelligenceMax(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1695470783petAptIntelligenceMax;
            if (_local_2 !== _arg_1)
            {
                this._1695470783petAptIntelligenceMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptIntelligenceMax", _local_2, _arg_1));
            };
        }

        public function set prop15(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._979804985prop15;
            if (_local_2 !== _arg_1)
            {
                this._979804985prop15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop15", _local_2, _arg_1));
            };
        }

        public function set prop12(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._979804988prop12;
            if (_local_2 !== _arg_1)
            {
                this._979804988prop12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop12", _local_2, _arg_1));
            };
        }

        public function set prop13(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._979804987prop13;
            if (_local_2 !== _arg_1)
            {
                this._979804987prop13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop13", _local_2, _arg_1));
            };
        }

        public function set prop11(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._979804989prop11;
            if (_local_2 !== _arg_1)
            {
                this._979804989prop11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petAptStaminaMax():Label
        {
            return (this._552417893petAptStaminaMax);
        }

        [Bindable(event="propertyChange")]
        public function get petDescText():TextArea
        {
            return (this._192442979petDescText);
        }

        [Bindable(event="propertyChange")]
        public function get petLevel():Label
        {
            return (this._464115109petLevel);
        }

        [Bindable(event="propertyChange")]
        public function get petActiveMoneyBtn():DelayButton
        {
            return (this._762725793petActiveMoneyBtn);
        }

        [Bindable(event="propertyChange")]
        public function get petAptIntelligenceMin():Label
        {
            return (this._1695471021petAptIntelligenceMin);
        }

        private function showSerieActiveData(_arg_1:Number):void
        {
            var _local_10:*;
            var _local_11:*;
            seridState.visible = true;
            var _local_2:Object = _core.data.gameDataIndex[GamePredef.TBL_CREATURE_HANDBOOK][_arg_1];
            var _local_3:* = GamePredef.PET_SERIE_PROP[_arg_1];
            var _local_4:String = Language.PET_HANDBOOK_PANEL_U[104];
            var _local_5:String = Language.PET_HANDBOOK_PANEL_U[104];
            var _local_6:int = 1;
            var _local_7:* = _core.player.activePetObject;
            var _local_8:int = 1;
            while (_local_6 <= 10)
            {
                this[("statusPet" + _local_6)].visible = false;
                this[("petImg" + _local_6)].visible = false;
                if (_local_8 <= 4)
                {
                    this[("seriePropAdd" + _local_8)].visible = false;
                };
                _local_8++;
                _local_6++;
            };
            _local_6 = 1;
            _local_8 = 1;
            var _local_9:Boolean = true;
            for (_local_10 in _local_2)
            {
                if (_local_6 > 10)
                {
                    return;
                };
                _local_11 = _core.data.gameData[GamePredef.TBL_CREATURE][_local_2[_local_10].relateId];
                if (_local_11)
                {
                    this[("petImg" + _local_6)].source = ResManager.getIconUrl(_local_11.iconCode);
                    this[("petImg" + _local_6)].toolTip = _local_11.name.split("【")[0];
                    if ((((_local_7) && (_local_7[_local_2[_local_10].id])) && (_local_7[_local_2[_local_10].id].actived)))
                    {
                        this[("statusPet" + _local_6)].htmlText = Language.PET_HANDBOOK_PANEL_U[32];
                        if (((_local_2[_local_10].propType) && (_local_8 <= 4)))
                        {
                            if (Number(_local_2[_local_10].percentFlag) == 1)
                            {
                                this[("seriePropAdd" + _local_8)].htmlText = Language.PET_HANDBOOK_PANEL_U[106].toString().replace("{name}", _local_11.name.split("【")[0]).replace("{type}", Language.PROP_NAME_U[_local_2[_local_10].propType]).replace("{num}", _local_2[_local_10].propNum);
                            }
                            else
                            {
                                this[("seriePropAdd" + _local_8)].htmlText = Language.PET_HANDBOOK_PANEL_U[105].toString().replace("{name}", _local_11.name.split("【")[0]).replace("{type}", Language.PROP_NAME_U[_local_2[_local_10].propType]).replace("{num}", _local_2[_local_10].propNum);
                            };
                            this[("seriePropAdd" + _local_8)].visible = true;
                            _local_8++;
                        };
                    }
                    else
                    {
                        this[("petImg" + _local_6)].source = ResManager.PET_DEFAULT_ICON;
                        this[("statusPet" + _local_6)].htmlText = Language.PET_HANDBOOK_PANEL_U[33];
                        _local_9 = false;
                    };
                    this[("statusPet" + _local_6)].visible = true;
                    this[("petImg" + _local_6)].visible = true;
                    _local_6++;
                };
            };
            if (!_local_9)
            {
                if (_local_3)
                {
                    _local_4 = _local_4.replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]);
                    _local_5 = _local_5.replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]);
                    for (_local_10 in _local_3)
                    {
                        if (Number(_local_3[_local_10].percentFlag) == 0)
                        {
                            _local_4 = (_local_4 + Language.PET_HANDBOOK_PANEL_U[96].toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]).replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]).replace("{type}", Language.PROP_NAME_U[_local_3[_local_10].propType]).replace("{num}", _local_3[_local_10].propNum));
                            _local_5 = (_local_5 + Language.PET_HANDBOOK_PANEL_U[96].toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]).replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]).replace("{type}", Language.PROP_NAME_U[_local_3[_local_10].propType]).replace("{num}", _local_3[_local_10].propNum));
                        }
                        else
                        {
                            _local_4 = (_local_4 + Language.PET_HANDBOOK_PANEL_U[97].toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]).replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]).replace("{type}", Language.PROP_NAME_U[_local_3[_local_10].propType]).replace("{num}", _local_3[_local_10].propNum));
                            _local_5 = (_local_5 + Language.PET_HANDBOOK_PANEL_U[97].toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]).replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]).replace("{type}", Language.PROP_NAME_U[_local_3[_local_10].propType]).replace("{num}", _local_3[_local_10].propNum));
                        };
                    };
                };
                serieEffect.htmlText = _local_4.replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]);
                serieEffect2.htmlText = _local_5.replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]);
                serieEffect2.visible = false;
                seridState.source = ResManager.getIconUrl(4130220000220);
            }
            else
            {
                if (_local_3)
                {
                    _local_4 = _local_4.replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]);
                    _local_5 = _local_5.replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]);
                    for (_local_10 in _local_3)
                    {
                        if (Number(_local_3[_local_10].percentFlag) == 0)
                        {
                            _local_4 = (_local_4 + Language.PET_HANDBOOK_PANEL_U[96].toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]).replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]).replace("{type}", Language.PROP_NAME_U[_local_3[_local_10].propType]).replace("{num}", _local_3[_local_10].propNum));
                            _local_5 = (_local_5 + Language.PET_HANDBOOK_PANEL_U[96].toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]).replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]).replace("{type}", Language.PROP_NAME_U[_local_3[_local_10].propType]).replace("{num}", _local_3[_local_10].propNum));
                        }
                        else
                        {
                            _local_4 = (_local_4 + Language.PET_HANDBOOK_PANEL_U[97].toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]).replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]).replace("{type}", Language.PROP_NAME_U[_local_3[_local_10].propType]).replace("{num}", _local_3[_local_10].propNum));
                            _local_5 = (_local_5 + Language.PET_HANDBOOK_PANEL_U[97].toString().replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]).replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]).replace("{type}", Language.PROP_NAME_U[_local_3[_local_10].propType]).replace("{num}", _local_3[_local_10].propNum));
                        };
                    };
                };
                serieEffect.htmlText = _local_4.replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]);
                serieEffect2.htmlText = _local_5.replace("{color}", Language.PET_HANDBOOK_PANEL_U[117]);
                serieEffect2.visible = true;
                seridState.source = ResManager.getIconUrl(4130220000221);
            };
        }

        public function set oneSerieProcess(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1062648537oneSerieProcess;
            if (_local_2 !== _arg_1)
            {
                this._1062648537oneSerieProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneSerieProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petCatchDifficulty():Label
        {
            return (this._1874945609petCatchDifficulty);
        }

        public function set petAptAgility(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._186958625petAptAgility;
            if (_local_2 !== _arg_1)
            {
                this._186958625petAptAgility = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptAgility", _local_2, _arg_1));
            };
        }

        public function set petAptStrength(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1290955033petAptStrength;
            if (_local_2 !== _arg_1)
            {
                this._1290955033petAptStrength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptStrength", _local_2, _arg_1));
            };
        }

        private function _getActiveNum():Number
        {
            var _local_1:Object = _core.player.activePetObject;
            var _local_2:* = _core.data.gameDataIndex2[GamePredef.TBL_CREATURE_HANDBOOK][_handbookId];
            if (!_local_2)
            {
                return (-1);
            };
            var _local_3:Number = Number(_local_2[_handbookId].activeNum1);
            var _local_4:Number = 0;
            if ((((_local_1) && (_local_1[_handbookId])) && (_local_1[_handbookId].activedNum)))
            {
                _local_4 = Number(_local_1[_handbookId].activedNum);
            };
            var _local_5:Number = (_local_3 - _local_4);
            return (_local_5);
        }

        [Bindable(event="propertyChange")]
        public function get allSerieEffect():Label
        {
            return (this._379017676allSerieEffect);
        }

        public function set petAptAgilityMin(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._888262899petAptAgilityMin;
            if (_local_2 !== _arg_1)
            {
                this._888262899petAptAgilityMin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptAgilityMin", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petAptStrengthMin():Label
        {
            return (this._1704142357petAptStrengthMin);
        }

        public function set petActiveEffect(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._974219530petActiveEffect;
            if (_local_2 !== _arg_1)
            {
                this._974219530petActiveEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petActiveEffect", _local_2, _arg_1));
            };
        }

        public function __petTree_itemClick(_arg_1:ListEvent):void
        {
            petTreeClick(_arg_1);
        }

        public function set petAptStrengthMax(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1704142595petAptStrengthMax;
            if (_local_2 !== _arg_1)
            {
                this._1704142595petAptStrengthMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptStrengthMax", _local_2, _arg_1));
            };
        }

        public function set petNatureNum(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._483746560petNatureNum;
            if (_local_2 !== _arg_1)
            {
                this._483746560petNatureNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petNatureNum", _local_2, _arg_1));
            };
        }

        public function set npActiveNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._1577614078npActiveNum;
            if (_local_2 !== _arg_1)
            {
                this._1577614078npActiveNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npActiveNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get statusPet2():Label
        {
            return (this._247885317statusPet2);
        }

        [Bindable(event="propertyChange")]
        public function get statusPet4():Label
        {
            return (this._247885319statusPet4);
        }

        [Bindable(event="propertyChange")]
        public function get statusPet5():Label
        {
            return (this._247885320statusPet5);
        }

        [Bindable(event="propertyChange")]
        public function get statusPet6():Label
        {
            return (this._247885321statusPet6);
        }

        public function set petHiddenProp1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1753050363petHiddenProp1;
            if (_local_2 !== _arg_1)
            {
                this._1753050363petHiddenProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petHiddenProp1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get statusPet1():Label
        {
            return (this._247885316statusPet1);
        }

        public function set petHiddenProp2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1753050362petHiddenProp2;
            if (_local_2 !== _arg_1)
            {
                this._1753050362petHiddenProp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petHiddenProp2", _local_2, _arg_1));
            };
        }

        public function set petHiddenProp4(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1753050360petHiddenProp4;
            if (_local_2 !== _arg_1)
            {
                this._1753050360petHiddenProp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petHiddenProp4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get statusPet7():Label
        {
            return (this._247885322statusPet7);
        }

        public function set petAptStamina(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1026941175petAptStamina;
            if (_local_2 !== _arg_1)
            {
                this._1026941175petAptStamina = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptStamina", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get statusPet9():Label
        {
            return (this._247885324statusPet9);
        }

        public function set petHiddenProp3(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1753050361petHiddenProp3;
            if (_local_2 !== _arg_1)
            {
                this._1753050361petHiddenProp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petHiddenProp3", _local_2, _arg_1));
            };
        }

        public function set petHiddenProp5(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1753050359petHiddenProp5;
            if (_local_2 !== _arg_1)
            {
                this._1753050359petHiddenProp5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petHiddenProp5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get statusPet3():Label
        {
            return (this._247885318statusPet3);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot1():ItemSlot
        {
            return (this._1596220962skillSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot2():ItemSlot
        {
            return (this._1596220963skillSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot3():ItemSlot
        {
            return (this._1596220964skillSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot4():ItemSlot
        {
            return (this._1596220965skillSlot4);
        }

        public function set _selectedURL(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._401544427_selectedURL;
            if (_local_2 !== _arg_1)
            {
                this._401544427_selectedURL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_selectedURL", _local_2, _arg_1));
            };
        }

        private function petTreeClick(_arg_1:Event):void
        {
            var _local_3:Boolean;
            seridState.visible = false;
            var _local_2:Object = petTree.selectedItem;
            if (_local_2.label == Language.PET_HANDBOOK_PANEL_U[11])
            {
                _handbookId = 0;
                _relateId = 0;
                tabPet.selectedIndex = 0;
                closeAllNodes();
                showAllSeriesActiveData();
                getAllSeriesProp();
            }
            else
            {
                if ((((_local_2.kind) && (_local_2.kind > 0)) && (_local_2.hasOwnProperty("children"))))
                {
                    _handbookId = 0;
                    _relateId = 0;
                    tabPet.selectedIndex = 2;
                    _local_3 = petTree.isItemOpen(petTree.selectedItem);
                    closeAllNodes();
                    if (!_local_3)
                    {
                        petTree.expandItem(petTree.selectedItem, (!(petTree.isItemOpen(petTree.selectedItem))));
                    };
                    showSerieActiveData(_local_2.kind);
                }
                else
                {
                    if (_local_2.id)
                    {
                        tabPet.selectedIndex = 1;
                        _handbookId = _local_2.id;
                        _relateId = _local_2.relateId;
                        showCreatureInfo();
                    };
                };
            };
            playType = 1;
            panel1.visible = false;
            playMC();
        }

        [Bindable(event="propertyChange")]
        public function get serieEffect():Label
        {
            return (this._1072417325serieEffect);
        }

        public function set progressTotal(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._770866455progressTotal;
            if (_local_2 !== _arg_1)
            {
                this._770866455progressTotal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressTotal", _local_2, _arg_1));
            };
        }

        public function ___PetHandbook_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        [Bindable(event="propertyChange")]
        public function get statusPet8():Label
        {
            return (this._247885323statusPet8);
        }

        private function _PetHandbook_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_HANDBOOK_PANEL_U[0];
            _local_1 = ResManager.getIconUrl(4130220000214);
            _local_1 = Language.PET_HANDBOOK_PANEL_U[96];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[19];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[20];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[12];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[13];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[14];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[15];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[16];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[17];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[18];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[110];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[118];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[120];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[21];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_EVOLUTION_PANEL_U[0];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.ASTROLOGIC_PANEL_U[38];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[42];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[19];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[19];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[86];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[45];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[46];
            _local_1 = _core.player.npPnt;
            _local_1 = Language.PET_HANDBOOK_PANEL_U[47];
            _local_1 = _core.player.npPnt;
            _local_1 = Language.PET_HANDBOOK_PANEL_U[43];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[44];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[48];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[50];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[51];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[1];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[2];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[3];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[4];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[5];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[53];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[52];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[87];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[96];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[33];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[21];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[96];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[85];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[85];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[85];
            _local_1 = Language.PET_HANDBOOK_PANEL_U[85];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.ASTROLOGIC_PANEL_U[38];
        }

        [Bindable(event="propertyChange")]
        public function get petMapLive():Label
        {
            return (this._104723017petMapLive);
        }

        public function set classImg(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._692413227classImg;
            if (_local_2 !== _arg_1)
            {
                this._692413227classImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classImg", _local_2, _arg_1));
            };
        }

        public function set prop1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._106940718prop1;
            if (_local_2 !== _arg_1)
            {
                this._106940718prop1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop1", _local_2, _arg_1));
            };
        }

        public function set elementImg(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._575917863elementImg;
            if (_local_2 !== _arg_1)
            {
                this._575917863elementImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elementImg", _local_2, _arg_1));
            };
        }

        public function set prop3(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._106940720prop3;
            if (_local_2 !== _arg_1)
            {
                this._106940720prop3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop3", _local_2, _arg_1));
            };
        }

        public function set prop6(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._106940723prop6;
            if (_local_2 !== _arg_1)
            {
                this._106940723prop6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop6", _local_2, _arg_1));
            };
        }

        public function set prop7(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._106940724prop7;
            if (_local_2 !== _arg_1)
            {
                this._106940724prop7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop7", _local_2, _arg_1));
            };
        }

        public function set prop8(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._106940725prop8;
            if (_local_2 !== _arg_1)
            {
                this._106940725prop8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop8", _local_2, _arg_1));
            };
        }

        public function set prop5(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._106940722prop5;
            if (_local_2 !== _arg_1)
            {
                this._106940722prop5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petAptIntelligence():Label
        {
            return (this._144113051petAptIntelligence);
        }

        public function set prop4(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._106940721prop4;
            if (_local_2 !== _arg_1)
            {
                this._106940721prop4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop4", _local_2, _arg_1));
            };
        }

        public function set prop9(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._106940726prop9;
            if (_local_2 !== _arg_1)
            {
                this._106940726prop9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petInfo():Canvas
        {
            return (this._677846419petInfo);
        }

        public function set prop2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._106940719prop2;
            if (_local_2 !== _arg_1)
            {
                this._106940719prop2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop2", _local_2, _arg_1));
            };
        }

        private function _getActiveGold():Number
        {
            var _local_1:Number = _getActiveNum();
            if (_local_1 < 0)
            {
                return (_local_1);
            };
            return (Math.ceil((_local_1 / _goldRate)));
        }

        [Bindable(event="propertyChange")]
        public function get serieTypeName():Label
        {
            return (this._141601409serieTypeName);
        }

        public function set petImg10(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._461566787petImg10;
            if (_local_2 !== _arg_1)
            {
                this._461566787petImg10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petAptStaminaMin():Label
        {
            return (this._552417655petAptStaminaMin);
        }

        [Bindable(event="propertyChange")]
        public function get petImg2():Image
        {
            return (this._677847410petImg2);
        }

        [Bindable(event="propertyChange")]
        public function get petImg3():Image
        {
            return (this._677847409petImg3);
        }

        [Bindable(event="propertyChange")]
        public function get petImg5():Image
        {
            return (this._677847407petImg5);
        }

        [Bindable(event="propertyChange")]
        public function get petImg6():Image
        {
            return (this._677847406petImg6);
        }

        [Bindable(event="propertyChange")]
        public function get petImg7():Image
        {
            return (this._677847405petImg7);
        }

        [Bindable(event="propertyChange")]
        public function get petImg1():Image
        {
            return (this._677847411petImg1);
        }

        [Bindable(event="propertyChange")]
        public function get petImg9():Image
        {
            return (this._677847403petImg9);
        }

        [Bindable(event="propertyChange")]
        public function get petImg4():Image
        {
            return (this._677847408petImg4);
        }

        [Bindable(event="propertyChange")]
        public function get petImg8():Image
        {
            return (this._677847404petImg8);
        }

        public function set seriePropAdd1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._176118961seriePropAdd1;
            if (_local_2 !== _arg_1)
            {
                this._176118961seriePropAdd1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seriePropAdd1", _local_2, _arg_1));
            };
        }

        public function set seriePropAdd2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._176118960seriePropAdd2;
            if (_local_2 !== _arg_1)
            {
                this._176118960seriePropAdd2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seriePropAdd2", _local_2, _arg_1));
            };
        }

        public function set seriePropAdd3(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._176118959seriePropAdd3;
            if (_local_2 !== _arg_1)
            {
                this._176118959seriePropAdd3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seriePropAdd3", _local_2, _arg_1));
            };
        }

        public function set tabPet(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._881404598tabPet;
            if (_local_2 !== _arg_1)
            {
                this._881404598tabPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabPet", _local_2, _arg_1));
            };
        }

        public function set seriePropAdd4(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._176118958seriePropAdd4;
            if (_local_2 !== _arg_1)
            {
                this._176118958seriePropAdd4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seriePropAdd4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get statusPet10():Label
        {
            return (this._905489748statusPet10);
        }

        [Bindable(event="propertyChange")]
        public function get panel1():Canvas
        {
            return (this._995543379panel1);
        }

        [Bindable(event="propertyChange")]
        public function get petAptEnergy():Label
        {
            return (this._1500310190petAptEnergy);
        }

        public function set petTree(_arg_1:ButtonTree):void
        {
            var _local_2:Object;
            _local_2 = this._677514915petTree;
            if (_local_2 !== _arg_1)
            {
                this._677514915petTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petTree", _local_2, _arg_1));
            };
        }

        private function setActiveInfo(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (((!(_arg_1.pid)) && (!(_arg_1.pid == _handbookId))))
            {
                return;
            };
            if (_arg_1.actived)
            {
                petActivated.htmlText = Language.PET_HANDBOOK_PANEL_U[32];
                petEvolutionBtn.enabled = true;
            }
            else
            {
                petActivated.htmlText = Language.PET_HANDBOOK_PANEL_U[33];
                petEvolutionBtn.enabled = false;
            };
            var _local_2:* = _core.data.gameDataIndex2[GamePredef.TBL_CREATURE_HANDBOOK][_handbookId];
            petActiveNum.text = Language.PET_HANDBOOK_PANEL_U[45].toString().replace("{num}", _arg_1.activedNum).replace("{total}", _local_2[_handbookId].activeNum1);
            progressTotal.v = Number(_arg_1.activedNum);
            progressTotal.m = _local_2[_handbookId].activeNum1;
            progressTotal.label = ((Number(_arg_1.activedNum) + "/") + _local_2[_handbookId].activeNum1);
            npActiveNum.value = 0;
            showCreatureInfo();
        }

        [Bindable(event="propertyChange")]
        public function get oneSerieProcess():Canvas
        {
            return (this._1062648537oneSerieProcess);
        }

        public function set progressActiveTotal(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._484087665progressActiveTotal;
            if (_local_2 !== _arg_1)
            {
                this._484087665progressActiveTotal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveTotal", _local_2, _arg_1));
            };
        }

        public function set petActivated(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1356532594petActivated;
            if (_local_2 !== _arg_1)
            {
                this._1356532594petActivated = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petActivated", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petActiveEffect():Label
        {
            return (this._974219530petActiveEffect);
        }

        [Bindable(event="propertyChange")]
        public function get petAptStrength():Label
        {
            return (this._1290955033petAptStrength);
        }

        [Bindable(event="propertyChange")]
        public function get petNatureNum():Label
        {
            return (this._483746560petNatureNum);
        }

        [Bindable(event="propertyChange")]
        public function get npActiveNum():NumericStepper
        {
            return (this._1577614078npActiveNum);
        }

        [Bindable(event="propertyChange")]
        public function get petHiddenProp2():Label
        {
            return (this._1753050362petHiddenProp2);
        }

        [Bindable(event="propertyChange")]
        public function get petAptStamina():Label
        {
            return (this._1026941175petAptStamina);
        }

        [Bindable(event="propertyChange")]
        public function get petHiddenProp3():Label
        {
            return (this._1753050361petHiddenProp3);
        }

        public function set petEvolutionBtnTotal(_arg_1:DelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._909209476petEvolutionBtnTotal;
            if (_local_2 !== _arg_1)
            {
                this._909209476petEvolutionBtnTotal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEvolutionBtnTotal", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petHiddenProp5():Label
        {
            return (this._1753050359petHiddenProp5);
        }

        [Bindable(event="propertyChange")]
        public function get _selectedURL():CharactorShowCanvas
        {
            return (this._401544427_selectedURL);
        }

        [Bindable(event="propertyChange")]
        public function get petHiddenProp4():Label
        {
            return (this._1753050360petHiddenProp4);
        }

        [Bindable(event="propertyChange")]
        public function get petHiddenProp1():Label
        {
            return (this._1753050363petHiddenProp1);
        }

        private function showAllSeriesActiveData():void
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:Object;
            var _local_8:*;
            var _local_9:*;
            var _local_1:* = _core.player.activePetObject;
            var _local_2:* = 0;
            var _local_3:* = 0;
            for (_local_4 in _kindType)
            {
                _local_5 = 0;
                _local_6 = 0;
                _local_7 = _core.data.gameDataIndex[GamePredef.TBL_CREATURE_HANDBOOK][_local_4];
                for (_local_8 in _local_7)
                {
                    _local_9 = _local_7[_local_8];
                    if ((((_local_1) && (_local_1[_local_9.id])) && (_local_1[_local_9.id].actived)))
                    {
                        _local_6++;
                        _local_3++;
                    };
                    _local_5++;
                    _local_2++;
                };
                this[("progressActiveNum" + _local_4)].m = _local_5;
                this[("progressActiveNum" + _local_4)].v = _local_6;
                this[("progressActiveNum" + _local_4)].label = ((_local_6 + "/") + _local_5);
            };
            progressActiveTotal.m = _local_2;
            progressActiveTotal.v = _local_3;
            progressActiveTotal.label = ((_local_3 + "/") + _local_2);
        }

        [Bindable(event="propertyChange")]
        public function get elementImg():Image
        {
            return (this._575917863elementImg);
        }

        public function set petAptStaminaMax(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._552417893petAptStaminaMax;
            if (_local_2 !== _arg_1)
            {
                this._552417893petAptStaminaMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptStaminaMax", _local_2, _arg_1));
            };
        }

        public function set petEvolutionBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._661045344petEvolutionBtn;
            if (_local_2 !== _arg_1)
            {
                this._661045344petEvolutionBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEvolutionBtn", _local_2, _arg_1));
            };
        }

        public function set petDescText(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._192442979petDescText;
            if (_local_2 !== _arg_1)
            {
                this._192442979petDescText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petDescText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petImg10():Image
        {
            return (this._461566787petImg10);
        }

        public function set progressActiveNum5(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._677294174progressActiveNum5;
            if (_local_2 !== _arg_1)
            {
                this._677294174progressActiveNum5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum5", _local_2, _arg_1));
            };
        }

        public function set progressActiveNum6(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._677294173progressActiveNum6;
            if (_local_2 !== _arg_1)
            {
                this._677294173progressActiveNum6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum6", _local_2, _arg_1));
            };
        }

        public function set progressActiveNum3(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._677294176progressActiveNum3;
            if (_local_2 !== _arg_1)
            {
                this._677294176progressActiveNum3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum3", _local_2, _arg_1));
            };
        }

        public function set petActiveMoneyBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._762725793petActiveMoneyBtn;
            if (_local_2 !== _arg_1)
            {
                this._762725793petActiveMoneyBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petActiveMoneyBtn", _local_2, _arg_1));
            };
        }

        public function set petLevel(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._464115109petLevel;
            if (_local_2 !== _arg_1)
            {
                this._464115109petLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petLevel", _local_2, _arg_1));
            };
        }

        private function getAllSeriesProp():void
        {
            var _local_1:Object;
            var _local_7:*;
            var _local_9:Boolean;
            var _local_10:Object;
            var _local_11:*;
            var _local_12:*;
            _local_1 = GamePredef.PET_SERIE_PROP[0];
            var _local_2:String = Language.PET_HANDBOOK_PANEL_U[111];
            if (_local_1)
            {
                for (_local_7 in _local_1)
                {
                    if (Number(_local_1[_local_7].percentFlag) == 0)
                    {
                        _local_2 = (_local_2 + Language.PET_HANDBOOK_PANEL_U[96].toString().replace("{type}", Language.PROP_NAME_U[_local_1[_local_7].propType]).replace("{num}", _local_1[_local_7].propNum));
                    }
                    else
                    {
                        _local_2 = (_local_2 + Language.PET_HANDBOOK_PANEL_U[97].toString().replace("{type}", Language.PROP_NAME_U[_local_1[_local_7].propType]).replace("{num}", _local_1[_local_7].propNum));
                    };
                };
            };
            var _local_3:int = 1;
            while (_local_3 <= 15)
            {
                this[("prop" + _local_3)].visible = false;
                _local_3++;
            };
            var _local_4:Object = _core.player.activePetObject;
            var _local_5:Array = new Array();
            var _local_6:Boolean = true;
            for (_local_7 in _kindType)
            {
                _local_9 = true;
                _local_10 = _core.data.gameDataIndex[GamePredef.TBL_CREATURE_HANDBOOK][_local_7];
                for (_local_11 in _local_10)
                {
                    _local_12 = _local_10[_local_11];
                    if ((((((_local_4) && (_local_4[_local_12.id])) && (_local_4[_local_12.id].actived)) && (_local_12.propType)) && (GamePredef.PET_ALLSERIE_PROP_INDEX[_local_12.propType])))
                    {
                        if (!_local_5[_local_12.propType])
                        {
                            _local_5[_local_12.propType] = Number(0);
                        };
                        _local_5[_local_12.propType] = (_local_5[_local_12.propType] + Number(_local_12.propNum));
                    }
                    else
                    {
                        if ((((!(_local_4)) || (!(_local_4[_local_12.id]))) || (!(_local_4[_local_12.id].actived))))
                        {
                            _local_9 = false;
                            _local_6 = false;
                        };
                    };
                };
                if (_local_9)
                {
                    _local_1 = GamePredef.PET_SERIE_PROP[_local_7];
                    for (_local_11 in _local_1)
                    {
                        if (!_local_5[_local_1[_local_11].propType])
                        {
                            _local_5[_local_1[_local_11].propType] = Number(0);
                        };
                        _local_5[_local_1[_local_11].propType] = (_local_5[_local_1[_local_11].propType] + Number(_local_1[_local_11].propNum));
                    };
                };
            };
            if (_local_6)
            {
                _local_1 = GamePredef.PET_SERIE_PROP[0];
                for (_local_11 in _local_1)
                {
                    if (!_local_5[_local_1[_local_11].propType])
                    {
                        _local_5[_local_1[_local_11].propType] = Number(0);
                    };
                    _local_5[_local_1[_local_11].propType] = (_local_5[_local_1[_local_11].propType] + Number(_local_1[_local_11].propNum));
                };
                allSerieEffect.htmlText = _local_2.replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]);
            }
            else
            {
                allSerieEffect.htmlText = _local_2.replace("{color}", Language.PET_HANDBOOK_PANEL_U[116]);
            };
            var _local_8:* = 1;
            for (_local_7 in _local_5)
            {
                if (GamePredef.PET_ALLSERIE_PROP[GamePredef.PET_ALLSERIE_PROP_INDEX[_local_7]].percentFlag)
                {
                    this[("prop" + _local_8)].htmlText = Language.PET_HANDBOOK_PANEL_U[107].toString().replace("{prop}", Language.PROP_NAME_U[_local_7]).replace("{num}", _local_5[_local_7]);
                }
                else
                {
                    this[("prop" + _local_8)].htmlText = Language.PET_HANDBOOK_PANEL_U[87].toString().replace("{prop}", Language.PROP_NAME_U[_local_7]).replace("{num}", _local_5[_local_7]);
                };
                this[("prop" + _local_8)].visible = true;
                _local_8++;
            };
            checkBtnTotal();
        }

        [Bindable(event="propertyChange")]
        public function get classImg():Image
        {
            return (this._692413227classImg);
        }

        [Bindable(event="propertyChange")]
        public function get seriePropAdd2():Label
        {
            return (this._176118960seriePropAdd2);
        }

        public function set progressActiveNum4(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._677294175progressActiveNum4;
            if (_local_2 !== _arg_1)
            {
                this._677294175progressActiveNum4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum4", _local_2, _arg_1));
            };
        }

        public function set progressActiveNum9(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._677294170progressActiveNum9;
            if (_local_2 !== _arg_1)
            {
                this._677294170progressActiveNum9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum9", _local_2, _arg_1));
            };
        }

        public function set progressActiveNum1(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._677294178progressActiveNum1;
            if (_local_2 !== _arg_1)
            {
                this._677294178progressActiveNum1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum1", _local_2, _arg_1));
            };
        }

        public function set progressActiveNum2(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._677294177progressActiveNum2;
            if (_local_2 !== _arg_1)
            {
                this._677294177progressActiveNum2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum2", _local_2, _arg_1));
            };
        }

        public function set progressActiveNum7(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._677294172progressActiveNum7;
            if (_local_2 !== _arg_1)
            {
                this._677294172progressActiveNum7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum7", _local_2, _arg_1));
            };
        }

        public function set progressActiveNum8(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._677294171progressActiveNum8;
            if (_local_2 !== _arg_1)
            {
                this._677294171progressActiveNum8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressActiveNum8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get seriePropAdd1():Label
        {
            return (this._176118961seriePropAdd1);
        }

        public function set serieEffect2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1114801243serieEffect2;
            if (_local_2 !== _arg_1)
            {
                this._1114801243serieEffect2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "serieEffect2", _local_2, _arg_1));
            };
        }

        public function set petAptIntelligenceMin(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1695471021petAptIntelligenceMin;
            if (_local_2 !== _arg_1)
            {
                this._1695471021petAptIntelligenceMin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptIntelligenceMin", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get seriePropAdd4():Label
        {
            return (this._176118958seriePropAdd4);
        }

        public function set petCatchDifficulty(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1874945609petCatchDifficulty;
            if (_local_2 !== _arg_1)
            {
                this._1874945609petCatchDifficulty = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petCatchDifficulty", _local_2, _arg_1));
            };
        }

        private function checkBtnTotal():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_1:Object = _core.player.activePetObject;
            for (_local_2 in _local_1)
            {
                if (_local_1[_local_2].actived)
                {
                    _local_3 = GameData.d[GamePredef.TBL_CREATURE_HANDBOOK][_local_2];
                    if (((_local_3) && (_local_3.evolutionId)))
                    {
                        petEvolutionBtnTotal.visible = true;
                        return;
                    };
                };
            };
            petEvolutionBtnTotal.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveTotal():Property
        {
            return (this._484087665progressActiveTotal);
        }

        [Bindable(event="propertyChange")]
        public function get petActivated():Label
        {
            return (this._1356532594petActivated);
        }

        [Bindable(event="propertyChange")]
        public function get seriePropAdd3():Label
        {
            return (this._176118959seriePropAdd3);
        }

        [Bindable(event="propertyChange")]
        public function get petEvolutionBtnTotal():DelayButton
        {
            return (this._909209476petEvolutionBtnTotal);
        }

        private function activeNormal():void
        {
            var num:Number;
            var _activeObj:* = _core.player.activePetObject;
            if ((((_activeObj) && (_activeObj[_handbookId])) && (_activeObj[_handbookId].actived)))
            {
                _core.sysMsg(Language.PET_HANDBOOK_PANEL_U[95]);
            };
            num = Number(npActiveNum.value);
            var func:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:Object;
                if (_arg_1.detail == Alert.YES)
                {
                    _local_2 = {};
                    _local_2.num = num;
                    _local_2.pid = _handbookId;
                    _core.remote.call("activePet", new Responder(setActiveInfo), _local_2);
                };
            };
            Alert.show(Language.PET_HANDBOOK_PANEL_U[103].toString().replace("{num}", num), "", (Alert.YES | Alert.NO), null, func);
        }

        override public function initialize():void
        {
            var target:PetHandbook;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetHandbook_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetHandbookWatcherSetupUtil");
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

        public function set allSerieEffect(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._379017676allSerieEffect;
            if (_local_2 !== _arg_1)
            {
                this._379017676allSerieEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allSerieEffect", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum1():Property
        {
            return (this._677294178progressActiveNum1);
        }

        public function set container1(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._145245136container1;
            if (_local_2 !== _arg_1)
            {
                this._145245136container1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum4():Property
        {
            return (this._677294175progressActiveNum4);
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum5():Property
        {
            return (this._677294174progressActiveNum5);
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum7():Property
        {
            return (this._677294172progressActiveNum7);
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum6():Property
        {
            return (this._677294173progressActiveNum6);
        }

        public function set petAptEnergyMax(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1983702058petAptEnergyMax;
            if (_local_2 !== _arg_1)
            {
                this._1983702058petAptEnergyMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptEnergyMax", _local_2, _arg_1));
            };
        }

        private function closeAllNodes():void
        {
            var _local_1:*;
            for each (_local_1 in petTree.openItems)
            {
                petTree.expandItem(_local_1, false);
            };
        }

        public function set allSeriesProcess(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._31193047allSeriesProcess;
            if (_local_2 !== _arg_1)
            {
                this._31193047allSeriesProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allSeriesProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum2():Property
        {
            return (this._677294177progressActiveNum2);
        }

        [Bindable(event="propertyChange")]
        public function get petEvolutionBtn():DelayButton
        {
            return (this._661045344petEvolutionBtn);
        }

        public function set seridState(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._534882346seridState;
            if (_local_2 !== _arg_1)
            {
                this._534882346seridState = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seridState", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum8():Property
        {
            return (this._677294171progressActiveNum8);
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum9():Property
        {
            return (this._677294170progressActiveNum9);
        }

        [Bindable(event="propertyChange")]
        public function get progressActiveNum3():Property
        {
            return (this._677294176progressActiveNum3);
        }

        [Bindable(event="propertyChange")]
        public function get serieEffect2():Label
        {
            return (this._1114801243serieEffect2);
        }

        private function playMC():void
        {
            if (mc)
            {
                load = null;
                mc.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
                mc.gotoAndPlay(1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get container1():UIComponent
        {
            return (this._145245136container1);
        }

        override public function initView():void
        {
            initTree();
        }

        public function set petAptStrengthMin(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1704142357petAptStrengthMin;
            if (_local_2 !== _arg_1)
            {
                this._1704142357petAptStrengthMin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petAptStrengthMin", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get allSeriesProcess():Canvas
        {
            return (this._31193047allSeriesProcess);
        }

        [Bindable(event="propertyChange")]
        public function get petAptEnergyMax():Label
        {
            return (this._1983702058petAptEnergyMax);
        }

        [Bindable(event="propertyChange")]
        public function get seridState():Image
        {
            return (this._534882346seridState);
        }


    }
}//package com.qeedoo.ui.view.compDragable

