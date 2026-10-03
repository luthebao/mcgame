// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DressPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.RecipeCell;
    import mx.controls.Alert;
    import mx.controls.Label;
    import com.qeedoo.ui.view.compGameStage.CreatureShowView;
    import mx.containers.Canvas;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.GeneralTree;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.FilterButton;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import mx.core.UIComponent;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.DisplaySlot;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import flash.events.Event;
    import mx.collections.ArrayCollection;
    import mx.collections.Sort;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.collections.SortField;
    import com.qeedoo.game.config.Language;
    import mx.collections.ICollectionView;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.ui.utils.LanguageUtil;
    import com.qeedoo.ui.event.DressEvent;
    import mx.utils.ObjectUtil;
    import mx.managers.PopUpManager;
    import mx.events.CloseEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.FlexEvent;
    import com.qeedoo.game.utils.JSONUtil;
    import com.qeedoo.ui.resource.ResManager;
    import style.Assets;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import mx.core.ClassFactory;
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

    public class DressPanel extends DragableCanvas implements IBindingClient 
    {

        private static const FREE_EXTRACT_TIME:int = 1;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1584105757viewStack:ViewStack;
        private var _819927962recipeBag:DressBag;
        private var _1429700080exchangeText:IntroText;
        private var _715179439dressBag:DressBag;
        public var _DressPanel_Image1:Image;
        public var _DressPanel_Image2:Image;
        public var _DressPanel_Image3:Image;
        public var _DressPanel_Image4:Image;
        public var _DressPanel_Image5:Image;
        public var _DressPanel_Image6:Image;
        public var _DressPanel_Image7:Image;
        public var _DressPanel_Image8:Image;
        public var _DressPanel_Image9:Image;
        private var _1972807202recipeCell2:RecipeCell;
        private var _alert:Alert;
        private var _1538341031freeTime:Label;
        private var _1713694796flyerPlay:DressDisplay;
        public var _DressPanel_Label11:Label;
        public var _DressPanel_Label12:Label;
        public var _DressPanel_Label13:Label;
        public var _DressPanel_Label14:Label;
        public var _DressPanel_Label16:Label;
        private var _1177498631itemStat:Label;
        private var _tenAlert:Alert;
        private var _showView:CreatureShowView;
        private var _463381257showHolder:Canvas;
        private var _646343081autoBuy:CheckBox;
        private var _initFreeText:String;
        private var _1813919509illustrateTree:GeneralTree;
        private var _1972807201recipeCell1:RecipeCell;
        private var _1716875591transformText:IntroText;
        private var _ssdAlert:Alert;
        private var _tenssdAlert:Alert;
        private var _993660112propText:TextArea;
        public var _DressPanel_FilterButton1:FilterButton;
        public var _DressPanel_FilterButton2:FilterButton;
        public var _DressPanel_FilterButton3:FilterButton;
        public var _DressPanel_FilterButton4:FilterButton;
        public var _DressPanel_FilterButton5:FilterButton;
        public var _DressPanel_FilterButton6:FilterButton;
        public var _DressPanel_FilterButton7:FilterButton;
        public var _DressPanel_FilterButton8:FilterButton;
        public var _DressPanel_FilterButton9:FilterButton;
        public var _DressPanel_FilterButton11:FilterButton;
        public var _DressPanel_FilterButton10:FilterButton;
        private var _803559802pageTab:HButtonTab;
        private var _goldAlert:Alert;
        private var _1293666237jewelNum:Label;
        private var _1972807200recipeCell0:RecipeCell;
        private var _1396576659bagTab:HButtonTab;
        private var _352003056recipeCell:RecipeCell;
        private var _695298549dressPlay:DressDisplay;
        public var _DressPanel_Label1:Label;
        public var _DressPanel_Label2:Label;
        public var _DressPanel_Label4:Label;
        public var _DressPanel_Label5:Label;
        public var _DressPanel_Label6:Label;
        private var _2113119409viewHolder:UIComponent;
        public var _DressPanel_Label9:Label;
        private var _76902757dressScore:Label;
        public var _DressPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _61982977toActiveSlot:DisplaySlot;
        private var _657874032crystalNum:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":550,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_DressPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTab",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":41,
                                "selectedIndex":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"viewStack",
                        "events":{"creationComplete":"__viewStack_creationComplete"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":60,
                                "width":520,
                                "height":325,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"creationComplete":"___DressPanel_Canvas1_creationComplete"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":10,
                                                        "y":215,
                                                        "width":150,
                                                        "height":100,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "clipContent":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DressPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":5});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"propText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "center";
                                                                this.borderStyle = "none";
                                                                this.backgroundAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":150,
                                                                    "height":80,
                                                                    "y":25,
                                                                    "mouseEnabled":false,
                                                                    "mouseChildren":false
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DressDisplay,
                                                "id":"dressPlay",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "activeCall":activeTab,
                                                        "x":165,
                                                        "y":10,
                                                        "dressCall":dressChangeHanlder
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DressDisplay,
                                                "id":"flyerPlay",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "activeCall":activeTab,
                                                        "x":165,
                                                        "y":165,
                                                        "dressCall":flyerChangeHanlder
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"showHolder",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":10,
                                                        "y":10,
                                                        "width":150,
                                                        "height":200,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "clipContent":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DressPanel_Label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":5});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":UIComponent,
                                                            "id":"viewHolder",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":210,
                                                                    "mouseEnabled":false,
                                                                    "mouseChildren":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___DressPanel_Button1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-40";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "buttonMode":true,
                                                                    "styleName":"BtnLoginTurnLeft"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___DressPanel_Button2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "40";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "buttonMode":true,
                                                                    "styleName":"BtnLoginTurnRight"
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
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":10,
                                                        "y":10,
                                                        "width":235,
                                                        "height":305,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "clipContent":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":GeneralTree,
                                                            "id":"illustrateTree",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.horizontalCenter = "0";
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":213,
                                                                    "height":288,
                                                                    "y":10,
                                                                    "styleName":"TreeGeneral",
                                                                    "itemRenderer":_DressPanel_ClassFactory1_c()
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
                                                        "x":250,
                                                        "y":10,
                                                        "width":260,
                                                        "height":305,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "clipContent":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_DressPanel_Image1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":45});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"itemStat",
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
                                                            "type":DisplaySlot,
                                                            "id":"toActiveSlot",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":45});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.horizontalGap = 18;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":135,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_DressPanel_Label4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_DressPanel_Label5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_DressPanel_Label6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.horizontalGap = 36;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":155,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":34,
                                                                                "height":34,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "clipContent":false,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_DressPanel_Image2"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_DressPanel_Image3",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.verticalCenter = "0";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"crystalNum",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                        this.bottom = "0";
                                                                                        this.right = "0";
                                                                                        this.fontSize = 8;
                                                                                        this.fontFamily = "Arial";
                                                                                        this.textAlign = "right";
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":34,
                                                                                "height":34,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "clipContent":false,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_DressPanel_Image4"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_DressPanel_Image5",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.verticalCenter = "0";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"jewelNum",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                        this.bottom = "0";
                                                                                        this.right = "0";
                                                                                        this.fontSize = 8;
                                                                                        this.fontFamily = "Arial";
                                                                                        this.textAlign = "right";
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RecipeCell,
                                                                        "id":"recipeCell"
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.horizontalGap = 2;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":220,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":CheckBox,
                                                                        "id":"autoBuy"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_DressPanel_Label9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FilterButton,
                                                            "id":"_DressPanel_FilterButton1",
                                                            "events":{"click":"___DressPanel_FilterButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "y":0xFF,
                                                                    "width":60,
                                                                    "height":23
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
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":10,
                                                        "y":10,
                                                        "width":280,
                                                        "height":214,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "clipContent":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clipContent":false,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "x":7,
                                                                    "y":10,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_DressPanel_Image6"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"freeTime",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.horizontalCenter = "0";
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":110});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clipContent":false,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "x":95,
                                                                    "y":10,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_DressPanel_Image7"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_DressPanel_Label11",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.color = 0xFFFFFF;
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":110,
                                                                                "visible":true
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
                                                                    "clipContent":false,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "x":183,
                                                                    "y":10,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_DressPanel_Image8"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_DressPanel_Label12",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.color = 0xFFFFFF;
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":110,
                                                                                "visible":true
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FilterButton,
                                                            "id":"_DressPanel_FilterButton2",
                                                            "events":{"click":"___DressPanel_FilterButton2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "x":10,
                                                                    "y":144,
                                                                    "width":84,
                                                                    "height":23
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FilterButton,
                                                            "id":"_DressPanel_FilterButton3",
                                                            "events":{"click":"___DressPanel_FilterButton3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "x":98,
                                                                    "y":144,
                                                                    "width":84,
                                                                    "height":23
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FilterButton,
                                                            "id":"_DressPanel_FilterButton4",
                                                            "events":{"click":"___DressPanel_FilterButton4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "x":186,
                                                                    "y":144,
                                                                    "width":84,
                                                                    "height":23
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FilterButton,
                                                            "id":"_DressPanel_FilterButton5",
                                                            "events":{"click":"___DressPanel_FilterButton5_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "x":98,
                                                                    "y":168,
                                                                    "width":84,
                                                                    "height":23
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FilterButton,
                                                            "id":"_DressPanel_FilterButton6",
                                                            "events":{"click":"___DressPanel_FilterButton6_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "x":186,
                                                                    "y":168,
                                                                    "width":84,
                                                                    "height":23
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DressPanel_Label13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                                this.color = 0xFFFFFF;
                                                                this.left = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":192,
                                                                    "width":72
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DressPanel_Label14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                                this.color = 0xFFFFFF;
                                                                this.left = "80";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":192});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"exchangeText",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":232,
                                                        "width":280,
                                                        "height":83
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HButtonTab,
                                                "id":"bagTab",
                                                "events":{"tabChanged":"__bagTab_tabChanged"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":305,
                                                        "y":10,
                                                        "selectedIndex":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":295,
                                                        "y":30,
                                                        "width":215,
                                                        "height":266,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DressBag,
                                                            "id":"dressBag",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":10,
                                                                    "height":227
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":FilterButton,
                                                            "id":"_DressPanel_FilterButton7",
                                                            "events":{"click":"___DressPanel_FilterButton7_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "width":60,
                                                                    "height":23,
                                                                    "y":238
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"dressScore",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "right";
                                                    this.fontSize = 12;
                                                    this.right = "130";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":23,
                                                        "y":301
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":FilterButton,
                                                "id":"_DressPanel_FilterButton8",
                                                "events":{"click":"___DressPanel_FilterButton8_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdGreen",
                                                        "width":60,
                                                        "height":23,
                                                        "x":392,
                                                        "y":298
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":10,
                                                        "y":10,
                                                        "width":280,
                                                        "height":205,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "clipContent":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_DressPanel_Image9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":22});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DressPanel_Label16",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":55});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.horizontalGap = 11;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":85,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":RecipeCell,
                                                                        "id":"recipeCell0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":true});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RecipeCell,
                                                                        "id":"recipeCell1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":true});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RecipeCell,
                                                                        "id":"recipeCell2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":true});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.horizontalGap = 8;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":145,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":FilterButton,
                                                                        "id":"_DressPanel_FilterButton9",
                                                                        "events":{"click":"___DressPanel_FilterButton9_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdGreen",
                                                                                "width":60,
                                                                                "height":23
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":FilterButton,
                                                                        "id":"_DressPanel_FilterButton10",
                                                                        "events":{"click":"___DressPanel_FilterButton10_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdGreen",
                                                                                "width":60,
                                                                                "height":23
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"transformText",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":220,
                                                        "width":280,
                                                        "height":95
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":FilterButton,
                                                "id":"_DressPanel_FilterButton11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "height":20,
                                                        "x":305,
                                                        "y":11,
                                                        "styleName":"HorizontalTab",
                                                        "selected":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":295,
                                                        "y":30,
                                                        "width":215,
                                                        "height":285,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DressBag,
                                                            "id":"recipeBag",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":10});
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
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DressPanel()
        {
            mx_internal::_document = this;
            this.width = 550;
            this.height = 400;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___DressPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DressPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get itemStat():Label
        {
            return (this._1177498631itemStat);
        }

        public function ___DressPanel_FilterButton5_click(_arg_1:MouseEvent):void
        {
            ssdHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get dressPlay():DressDisplay
        {
            return (this._695298549dressPlay);
        }

        private function turnHandler(_arg_1:Boolean):void
        {
            if (((!(_showView)) || (!(_showView.gameObject))))
            {
                return;
            };
            var _local_2:* = _showView.gameObject;
            if (_arg_1)
            {
                _local_2.dir++;
            }
            else
            {
                _local_2.dir--;
            };
            _local_2.dir = ((_local_2.dir + 8) % 8);
            _local_2.posDir = _local_2.dir;
            ((_showView) && (_showView.faceTo(_local_2.dir)));
        }

        public function set itemStat(_arg_1:Label):void
        {
            var _local_2:Object = this._1177498631itemStat;
            if (_local_2 !== _arg_1)
            {
                this._1177498631itemStat = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemStat", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell():RecipeCell
        {
            return (this._352003056recipeCell);
        }

        public function set showHolder(_arg_1:Canvas):void
        {
            var _local_2:Object = this._463381257showHolder;
            if (_local_2 !== _arg_1)
            {
                this._463381257showHolder = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHolder", _local_2, _arg_1));
            };
        }

        public function set dressPlay(_arg_1:DressDisplay):void
        {
            var _local_2:Object = this._695298549dressPlay;
            if (_local_2 !== _arg_1)
            {
                this._695298549dressPlay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dressPlay", _local_2, _arg_1));
            };
        }

        private function ensureTenssdExtract():void
        {
            var onTenssdExtract:Function = function (_arg_1:Object=null):void
            {
                var _local_4:Object;
                var _local_5:Number;
                var _local_6:int;
                if (_arg_1 == null)
                {
                    return;
                };
                DressLogic.updateDressInfo(_arg_1.dressInfo);
                var _local_2:Array = _arg_1.planArr;
                var _local_3:Array = [];
                for each (_local_4 in _local_2)
                {
                    _local_5 = _local_4.recipeId;
                    _local_6 = _local_4.num;
                    _local_3.push({
                        "recipeId":_local_5,
                        "recipeNum":_local_6
                    });
                };
                RecipeAlertTen.show(_local_3);
            };
            _core.remote.call("largessdExtractRecipe", new Responder(onTenssdExtract));
        }

        public function set recipeCell(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._352003056recipeCell;
            if (_local_2 !== _arg_1)
            {
                this._352003056recipeCell = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell1():RecipeCell
        {
            return (this._1972807201recipeCell1);
        }

        private function bagHandler(_arg_1:Event):void
        {
            var _local_2:int = bagTab.selectedIndex;
            var _local_3:int = ((_local_2 == 1) ? DressBag.TYPE_RECIPE : DressBag.TYPE_CHIP);
            dressBag.updateView(_local_3);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell0():RecipeCell
        {
            return (this._1972807200recipeCell0);
        }

        private function updatePageTwo(_arg_1:Boolean):void
        {
            var _local_3:Object;
            var _local_4:ArrayCollection;
            var _local_5:Object;
            var _local_6:Sort;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Sort;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:Object;
            var _local_14:Object;
            if (_arg_1)
            {
                _local_3 = {};
                _local_4 = new ArrayCollection();
                _local_5 = GameData.d[GamePredef.TBL_DRESS];
                _local_6 = new Sort();
                _local_6.fields = [new SortField("position", false, false, true)];
                for each (_local_7 in _local_5)
                {
                    _local_10 = _local_7.type;
                    if (!_local_3[_local_10])
                    {
                        _local_12 = {};
                        _local_12.type = _local_10;
                        _local_12.position = _local_10;
                        _local_12.name = Language.DRESS_PANEL[12][_local_10];
                        _local_12.children = new ArrayCollection();
                        (_local_12.children as ArrayCollection).sort = _local_6;
                        _local_4.addItem(_local_12);
                        _local_3[_local_10] = _local_12;
                    };
                    _local_11 = _local_3[_local_10];
                    (_local_11.children as ArrayCollection).addItem(_local_7);
                };
                for each (_local_8 in _local_4)
                {
                    if (((_local_8) && (_local_8.hasOwnProperty("children"))))
                    {
                        _local_13 = _local_8.children;
                        if (((_local_13) && (_local_13 is ICollectionView)))
                        {
                            (_local_13 as ICollectionView).refresh();
                        };
                    };
                };
                _local_9 = new Sort();
                _local_9.fields = [new SortField("type", false, false, true)];
                _local_4.sort = _local_9;
                _local_4.refresh();
                illustrateTree.dataProvider = _local_4;
                _local_6 = null;
                _local_9 = null;
            }
            else
            {
                illustrateTree.invalidateList();
            };
            var _local_2:Object = {
                "crystal":0,
                "jewel":0
            };
            if (_core.player.dressInfo)
            {
                _local_5 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((_local_5) && (_local_5.bag)))
                {
                    _local_14 = _local_5.bag;
                    if (_local_14.crystal)
                    {
                        _local_2["crystal"] = _local_14.crystal;
                    };
                    if (_local_14.jewel)
                    {
                        _local_2["jewel"] = _local_14.jewel;
                    };
                };
            };
            itemStat.text = LanguageUtil.replace(Language.DRESS_PANEL[25], _local_2);
        }

        private function onComplete():void
        {
            if (_initFreeText)
            {
                freeTime.text = _initFreeText;
            };
            _initFreeText = null;
            exchangeText.htmlText = Language.DRESS_PANEL[22];
            transformText.htmlText = Language.DRESS_PANEL[23];
            this.addEventListener(DressEvent.DRESS_DROP, dressDropHandler);
            this.addEventListener(DressEvent.TREE_SELECTED, treeSelectHanlder);
            DressLogic.dressProxy.addEventListener(DressEvent.DRESS_CHANGE, changeHandler);
            this.updateView(true);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell2():RecipeCell
        {
            return (this._1972807202recipeCell2);
        }

        private function updatePageFour():void
        {
            var _local_2:RecipeCell;
            var _local_1:int;
            while (_local_1 < 3)
            {
                _local_2 = this[("recipeCell" + _local_1)];
                _local_2.clean();
                _local_1++;
            };
            recipeBag.updateView(DressBag.TYPE_RECIPE);
        }

        public function set recipeCell0(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807200recipeCell0;
            if (_local_2 !== _arg_1)
            {
                this._1972807200recipeCell0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell0", _local_2, _arg_1));
            };
        }

        public function set recipeCell1(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807201recipeCell1;
            if (_local_2 !== _arg_1)
            {
                this._1972807201recipeCell1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get jewelNum():Label
        {
            return (this._1293666237jewelNum);
        }

        public function set recipeCell2(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807202recipeCell2;
            if (_local_2 !== _arg_1)
            {
                this._1972807202recipeCell2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell2", _local_2, _arg_1));
            };
        }

        private function transformHandler(event:Event):void
        {
            var recipeCell:RecipeCell;
            event.stopImmediatePropagation();
            var recipeArr:Array = [];
            var i:int;
            while (i < 3)
            {
                recipeCell = this[("recipeCell" + i)];
                ((recipeCell.recipeId) && (recipeArr.push(recipeCell.recipeId)));
                i = (i + 1);
            };
            var onTransform:Function = function (_arg_1:Object=null):void
            {
                if (_arg_1 == null)
                {
                    return;
                };
                DressLogic.updateDressInfo(_arg_1.dressInfo);
                RecipeAlertFree.show(_arg_1.recipeId, _arg_1.recipeNum);
            };
            _core.remote.call("transformRecipe", new Responder(onTransform), recipeArr);
        }

        public function ___DressPanel_FilterButton2_click(_arg_1:MouseEvent):void
        {
            freeHandler(_arg_1);
        }

        private function updatePageOne():void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:*;
            var _local_7:Object;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            if (!_showView)
            {
                _showView = new CreatureShowView();
                viewHolder.addChild(_showView);
                _local_3 = ObjectUtil.copy(_core.player);
                _local_3.wp = -1;
                _local_3.name = "";
                _local_3.wingResCode = -1;
                _local_3.doubleFly = false;
                _local_3.dir = 0;
                _local_3.posDir = 0;
                _local_3.flyingState = GamePredef.FLYING_STATE_TAKING_OFF;
                _showView.gameObject = _local_3;
            };
            dressPlay.updateView(DressDisplay.TYPE_DRESS);
            flyerPlay.updateView(DressDisplay.TYPE_FLYER);
            var _local_1:Object = {
                "1":0,
                "4":0,
                "5":0,
                "11":0
            };
            if (_core.player.dressInfo)
            {
                _local_4 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                _local_5 = _local_4.book;
                for (_local_6 in _local_5)
                {
                    _local_7 = GameData.d[GamePredef.TBL_DRESS][_local_6];
                    _local_8 = 1;
                    while (_local_8 <= 4)
                    {
                        _local_9 = ((_local_7) ? int(_local_7[("prop" + _local_8)]) : 0);
                        _local_10 = ((_local_7) ? int(_local_7[("propNum" + _local_8)]) : 0);
                        if (!_local_1[_local_9])
                        {
                            _local_1[_local_9] = _local_10;
                        }
                        else
                        {
                            _local_1[_local_9] = (_local_1[_local_9] + _local_10);
                        };
                        _local_8++;
                    };
                };
            };
            var _local_2:Object = {
                "hp":_local_1[1],
                "phAtt":_local_1[4],
                "mgAtt":_local_1[5],
                "sp":_local_1[11]
            };
            propText.htmlText = LanguageUtil.replace(Language.DRESS_PANEL[11], _local_2);
        }

        [Bindable(event="propertyChange")]
        public function get dressBag():DressBag
        {
            return (this._715179439dressBag);
        }

        public function dressActiveValidate(dressId:Number):void
        {
            var dressDict:Object;
            var dressBag:Object;
            var dressMeta:Object = GameData.d[GamePredef.TBL_DRESS][dressId];
            if (!dressMeta)
            {
                return;
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var hasCrystalNum:int;
            var hasJewelNum:int;
            var needCrystalNum:int = int(dressMeta.num1);
            var needJewelNum:int = int(dressMeta.num2);
            if (_core.player.dressInfo)
            {
                dressDict = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((dressDict) && (dressDict.bag)))
                {
                    dressBag = dressDict.bag;
                    hasCrystalNum = int(dressBag.crystal);
                    hasJewelNum = int(dressBag.jewel);
                };
            };
            var needGold:int;
            var buyCrystalNum:int = (needCrystalNum - hasCrystalNum);
            var buyJewelNum:int = (needJewelNum - hasJewelNum);
            if ((buyCrystalNum > 0))
            {
                needGold = (needGold + (buyCrystalNum * GamePredef.DRESS_CRYSTAL_PRICE));
            };
            if ((buyJewelNum > 0))
            {
                needGold = (needGold + (buyJewelNum * GamePredef.DRESS_JEWEL_PRICE));
            };
            var popStr:String = LanguageUtil.replace(Language.DRESS_PANEL[36], {"money":needGold});
            var closeHandler:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.NO)
                {
                    return;
                };
                _core.remote.call("ensureBuyActive", new Responder(DressLogic.updateDressInfo), dressId);
            };
            _alert = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _alert.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        [Bindable(event="propertyChange")]
        public function get autoBuy():CheckBox
        {
            return (this._646343081autoBuy);
        }

        public function set propText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._993660112propText;
            if (_local_2 !== _arg_1)
            {
                this._993660112propText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText", _local_2, _arg_1));
            };
        }

        private function tenHandler(event:Event):void
        {
            event.stopImmediatePropagation();
            if (_tenAlert)
            {
                PopUpManager.removePopUp(_tenAlert);
                _tenAlert = null;
            };
            var closeHandler:Function = function (_arg_1:CloseEvent):void
            {
                ((_arg_1.detail == Alert.YES) && (ensureTenExtract()));
            };
            var popStr:String = Language.DRESS_PANEL[46];
            _tenAlert = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _tenAlert.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        [Bindable(event="propertyChange")]
        public function get crystalNum():Label
        {
            return (this._657874032crystalNum);
        }

        private function exchangeTab(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_RECIPE_EXCHANGE);
            _local_2.show();
        }

        [Bindable(event="propertyChange")]
        public function get bagTab():HButtonTab
        {
            return (this._1396576659bagTab);
        }

        private function ensureTenExtract():void
        {
            var onTenExtract:Function = function (_arg_1:Object=null):void
            {
                var _local_4:Object;
                var _local_5:Number;
                var _local_6:int;
                if (_arg_1 == null)
                {
                    return;
                };
                DressLogic.updateDressInfo(_arg_1.dressInfo);
                var _local_2:Array = _arg_1.planArr;
                var _local_3:Array = [];
                for each (_local_4 in _local_2)
                {
                    _local_5 = _local_4.recipeId;
                    _local_6 = _local_4.num;
                    _local_3.push({
                        "recipeId":_local_5,
                        "recipeNum":_local_6
                    });
                };
                RecipeAlertTen.show(_local_3);
            };
            _core.remote.call("tenExtractRecipe", new Responder(onTenExtract));
        }

        private function tenssdHandler(event:Event):void
        {
            event.stopImmediatePropagation();
            if (_tenssdAlert)
            {
                PopUpManager.removePopUp(_tenssdAlert);
                _tenssdAlert = null;
            };
            var closeHandler:Function = function (_arg_1:CloseEvent):void
            {
                ((_arg_1.detail == Alert.YES) && (ensureTenssdExtract()));
            };
            var popStr:String = Language.DRESS_PANEL[55];
            _tenssdAlert = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _tenssdAlert.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        public function set jewelNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1293666237jewelNum;
            if (_local_2 !== _arg_1)
            {
                this._1293666237jewelNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelNum", _local_2, _arg_1));
            };
        }

        public function __bagTab_tabChanged(_arg_1:DressEvent):void
        {
            bagHandler(_arg_1);
        }

        private function viewStackComp():void
        {
            viewStack.parent.setChildIndex(viewStack, 0);
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        private function ensuressdExtract():void
        {
            var onssdExtract:Function = function (_arg_1:Object=null):void
            {
                if (_arg_1 == null)
                {
                    return;
                };
                DressLogic.updateDressInfo(_arg_1.dressInfo);
                RecipeAlertFree.show(_arg_1.recipeId, _arg_1.recipeNum);
            };
            _core.remote.call("ssdExtractRecipe", new Responder(onssdExtract));
        }

        public function ___DressPanel_Button2_click(_arg_1:MouseEvent):void
        {
            turnHandler(true);
        }

        private function treeSelectHanlder(_arg_1:DressEvent):void
        {
            _arg_1.stopImmediatePropagation();
            var _local_2:Object = illustrateTree.selectedItem;
            var _local_3:Number = _local_2.id;
            var _local_4:Object = GameData.d[GamePredef.TBL_DRESS][_local_3];
            if (!_local_4)
            {
                return;
            };
            var _local_5:Object = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][_local_4.equiptId];
            if (!_local_5)
            {
                return;
            };
            var _local_6:Object = {
                "slotData":_local_5,
                "type":GamePredef.TBL_EQUIPT_TEMPLATE,
                "giid":_local_5.id
            };
            toActiveSlot.setData(_local_6);
            recipeCell.stackNum = 1;
            recipeCell.recipeId = _local_4.recipeId;
            crystalNum.text = _local_4.num1;
            jewelNum.text = _local_4.num2;
        }

        public function set dressBag(_arg_1:DressBag):void
        {
            var _local_2:Object = this._715179439dressBag;
            if (_local_2 !== _arg_1)
            {
                this._715179439dressBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dressBag", _local_2, _arg_1));
            };
        }

        private function dressDropHandler(_arg_1:DressEvent):void
        {
            var _local_4:RecipeCell;
            var _local_2:RecipeCell = (_arg_1.target as RecipeCell);
            if (!_local_2.recipeId)
            {
                return;
            };
            var _local_3:int;
            while (_local_3 < 3)
            {
                _local_4 = this[("recipeCell" + _local_3)];
                if (_local_4 != _local_2)
                {
                    if (_local_4.recipeId == _local_2.recipeId)
                    {
                        _local_4.clean();
                    };
                };
                _local_3++;
            };
        }

        public function ___DressPanel_FilterButton7_click(_arg_1:MouseEvent):void
        {
            bagFuncHndler(_arg_1);
        }

        private function ssdHandler(event:Event):void
        {
            event.stopImmediatePropagation();
            if (_ssdAlert)
            {
                PopUpManager.removePopUp(_ssdAlert);
                _ssdAlert = null;
            };
            var closeHandler:Function = function (_arg_1:CloseEvent):void
            {
                ((_arg_1.detail == Alert.YES) && (ensuressdExtract()));
            };
            var popStr:String = Language.DRESS_PANEL[54];
            _ssdAlert = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _ssdAlert.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        private function activeTab(_arg_1:Number):void
        {
            var _local_3:Object;
            var _local_4:ArrayCollection;
            var _local_5:Object;
            pageTab.selectedIndex = 1;
            if (!illustrateTree.dataProvider)
            {
                return;
            };
            var _local_2:ArrayCollection = (illustrateTree.dataProvider as ArrayCollection);
            for each (_local_3 in _local_2)
            {
                if (_local_3.hasOwnProperty("children"))
                {
                    _local_4 = _local_3.children;
                    for each (_local_5 in _local_4)
                    {
                        if (_local_5.id == _arg_1)
                        {
                            illustrateTree.expandItem(_local_3, true);
                            illustrateTree.selectedItem = _local_5;
                            break;
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get viewHolder():UIComponent
        {
            return (this._2113119409viewHolder);
        }

        [Bindable(event="propertyChange")]
        public function get dressScore():Label
        {
            return (this._76902757dressScore);
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

        public function set freeTime(_arg_1:Label):void
        {
            var _local_2:Object = this._1538341031freeTime;
            if (_local_2 !== _arg_1)
            {
                this._1538341031freeTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "freeTime", _local_2, _arg_1));
            };
        }

        public function ___DressPanel_FilterButton4_click(_arg_1:MouseEvent):void
        {
            tenHandler(_arg_1);
        }

        public function ___DressPanel_FilterButton10_click(_arg_1:MouseEvent):void
        {
            transformAllHandler(_arg_1);
        }

        private function goldHandler(event:Event):void
        {
            event.stopImmediatePropagation();
            if (_goldAlert)
            {
                PopUpManager.removePopUp(_goldAlert);
                _goldAlert = null;
            };
            var closeHandler:Function = function (_arg_1:CloseEvent):void
            {
                ((_arg_1.detail == Alert.YES) && (ensureGoldExtract()));
            };
            var popStr:String = Language.DRESS_PANEL[45];
            _goldAlert = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _goldAlert.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        [Bindable(event="propertyChange")]
        public function get transformText():IntroText
        {
            return (this._1716875591transformText);
        }

        public function set bagTab(_arg_1:HButtonTab):void
        {
            var _local_2:Object = this._1396576659bagTab;
            if (_local_2 !== _arg_1)
            {
                this._1396576659bagTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagTab", _local_2, _arg_1));
            };
        }

        public function onUpdateDressInfo(_arg_1:String):void
        {
            DressLogic.updateDressInfo(_arg_1);
        }

        public function set crystalNum(_arg_1:Label):void
        {
            var _local_2:Object = this._657874032crystalNum;
            if (_local_2 !== _arg_1)
            {
                this._657874032crystalNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "crystalNum", _local_2, _arg_1));
            };
        }

        private function ensureGoldExtract():void
        {
            var onGoldExtract:Function = function (_arg_1:Object=null):void
            {
                if (_arg_1 == null)
                {
                    return;
                };
                DressLogic.updateDressInfo(_arg_1.dressInfo);
                RecipeAlertFree.show(_arg_1.recipeId, _arg_1.recipeNum);
            };
            _core.remote.call("goldExtractRecipe", new Responder(onGoldExtract));
        }

        [Bindable(event="propertyChange")]
        public function get viewStack():ViewStack
        {
            return (this._1584105757viewStack);
        }

        [Bindable(event="propertyChange")]
        public function get illustrateTree():GeneralTree
        {
            return (this._1813919509illustrateTree);
        }

        public function __viewStack_creationComplete(_arg_1:FlexEvent):void
        {
            viewStackComp();
        }

        private function transformAllHandler(event:Event):void
        {
            var recipeCell:RecipeCell;
            event.stopImmediatePropagation();
            var recipeArr:Array = [];
            var i:int;
            while (i < 3)
            {
                recipeCell = this[("recipeCell" + i)];
                ((recipeCell.recipeId) && (recipeArr.push(recipeCell.recipeId)));
                i = (i + 1);
            };
            var onTransformAll:Function = function (_arg_1:Object=null):void
            {
                if (_arg_1 == null)
                {
                    return;
                };
                DressLogic.updateDressInfo(_arg_1.dressInfo);
                RecipeAlertTen.show(_arg_1.produceArr);
            };
            _core.remote.call("transformAllRecipe", new Responder(onTransformAll), recipeArr);
        }

        public function ___DressPanel_FilterButton1_click(_arg_1:MouseEvent):void
        {
            activeHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get toActiveSlot():DisplaySlot
        {
            return (this._61982977toActiveSlot);
        }

        public function ___DressPanel_FilterButton9_click(_arg_1:MouseEvent):void
        {
            transformHandler(_arg_1);
        }

        private function changeIndex():void
        {
            showHolder.parent.setChildIndex(showHolder, 0);
        }

        [Bindable(event="propertyChange")]
        public function get showHolder():Canvas
        {
            return (this._463381257showHolder);
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

        private function updateView(_arg_1:Boolean=false):void
        {
            this.updatePageOne();
            this.updatePageTwo(_arg_1);
            this.updatePageThree();
            this.updatePageFour();
        }

        override public function show():void
        {
            var onCheckSameDay:Function = function (_arg_1:String=null):void
            {
                if (!_arg_1)
                {
                    return;
                };
                _core.player.dressInfo = JSONUtil.JSONfy(_arg_1);
                var _local_2:String = LanguageUtil.replace(Language.DRESS_PANEL[16], {"time":1});
                if (!this.initialized)
                {
                    _initFreeText = _local_2;
                }
                else
                {
                    freeTime.text = _local_2;
                };
            };
            _core.remote.call("checkSameDay", new Responder(onCheckSameDay));
            ((this.initialized) && (this.updateView()));
            super.show();
        }

        private function _DressPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DRESS_PANEL[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[1];
            _local_1 = pageTab.selectedIndex;
            _local_1 = Language.DRESS_PANEL[10];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[2];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ResManager.TOTEM_PET_FUNC1;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[26];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[27];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[28];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Assets.TRANSPARENT_SLOT;
            _local_1 = ResManager.getIconUrl(4130220000436);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Assets.TRANSPARENT_SLOT;
            _local_1 = ResManager.getIconUrl(4130220000437);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[29];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[5];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ResManager.getIconUrl(4130220000485);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ResManager.getIconUrl(4130220000486);
            _local_1 = Language.DRESS_PANEL[17];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ResManager.getIconUrl(4130220000487);
            _local_1 = Language.DRESS_PANEL[18];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[19];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[51];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[52];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[49];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[50];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[53];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = _core.player.shishangdian;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[24];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.DRESS_PANEL[((bagTab.selectedIndex == 0) ? 44 : 39)];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[21];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ResManager.TOTEM_PET_FUNC1;
            _local_1 = Language.DRESS_PANEL[30];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[32];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[33];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[31];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get propText():TextArea
        {
            return (this._993660112propText);
        }

        public function set recipeBag(_arg_1:DressBag):void
        {
            var _local_2:Object = this._819927962recipeBag;
            if (_local_2 !== _arg_1)
            {
                this._819927962recipeBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeBag", _local_2, _arg_1));
            };
        }

        public function set dressScore(_arg_1:Label):void
        {
            var _local_2:Object = this._76902757dressScore;
            if (_local_2 !== _arg_1)
            {
                this._76902757dressScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dressScore", _local_2, _arg_1));
            };
        }

        private function freeHandler(event:Event):void
        {
            event.stopImmediatePropagation();
            var onFreeExtract:Function = function (_arg_1:Object=null):void
            {
                if (_arg_1 == null)
                {
                    return;
                };
                DressLogic.updateDressInfo(_arg_1.dressInfo);
                RecipeAlertFree.show(_arg_1.recipeId, _arg_1.recipeNum);
            };
            _core.remote.call("freeExtractRecipe", new Responder(onFreeExtract));
        }

        private function bagFuncHndler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            if (dressBag.showType == DressBag.TYPE_RECIPE)
            {
                pageTab.selectedIndex = 3;
            }
            else
            {
                if (dressBag.showType == DressBag.TYPE_CHIP)
                {
                    dressBag.makeAll();
                };
            };
        }

        public function ___DressPanel_FilterButton6_click(_arg_1:MouseEvent):void
        {
            tenssdHandler(_arg_1);
        }

        private function activeHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            if (!illustrateTree.selectedItem)
            {
                return;
            };
            var _local_2:Object = illustrateTree.selectedItem;
            _core.remote.call("activeDress", new Responder(DressLogic.updateDressInfo), _local_2.id, autoBuy.selected);
        }

        private function _DressPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_DressPanel_BasicTitleCanvas1.text");
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
                return (Language.DRESS_PANEL[1]);
            }, function (_arg_1:Array):void
            {
                pageTab.dataArray = _arg_1;
            }, "pageTab.dataArray");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTab.selectedIndex);
            }, function (_arg_1:int):void
            {
                viewStack.selectedIndex = _arg_1;
            }, "viewStack.selectedIndex");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label1.text = _arg_1;
            }, "_DressPanel_Label1.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label1.filters = _arg_1;
            }, "_DressPanel_Label1.filters");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                propText.filters = _arg_1;
            }, "propText.filters");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label2.text = _arg_1;
            }, "_DressPanel_Label2.text");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label2.filters = _arg_1;
            }, "_DressPanel_Label2.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_FUNC1);
            }, function (_arg_1:Object):void
            {
                _DressPanel_Image1.source = _arg_1;
            }, "_DressPanel_Image1.source");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                itemStat.filters = _arg_1;
            }, "itemStat.filters");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label4.text = _arg_1;
            }, "_DressPanel_Label4.text");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label4.filters = _arg_1;
            }, "_DressPanel_Label4.filters");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label5.text = _arg_1;
            }, "_DressPanel_Label5.text");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label5.filters = _arg_1;
            }, "_DressPanel_Label5.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label6.text = _arg_1;
            }, "_DressPanel_Label6.text");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label6.filters = _arg_1;
            }, "_DressPanel_Label6.filters");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Assets.TRANSPARENT_SLOT);
            }, function (_arg_1:Object):void
            {
                _DressPanel_Image2.source = _arg_1;
            }, "_DressPanel_Image2.source");
            result[17] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000436));
            }, function (_arg_1:Object):void
            {
                _DressPanel_Image3.source = _arg_1;
            }, "_DressPanel_Image3.source");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                crystalNum.filters = _arg_1;
            }, "crystalNum.filters");
            result[19] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Assets.TRANSPARENT_SLOT);
            }, function (_arg_1:Object):void
            {
                _DressPanel_Image4.source = _arg_1;
            }, "_DressPanel_Image4.source");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000437));
            }, function (_arg_1:Object):void
            {
                _DressPanel_Image5.source = _arg_1;
            }, "_DressPanel_Image5.source");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                jewelNum.filters = _arg_1;
            }, "jewelNum.filters");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label9.text = _arg_1;
            }, "_DressPanel_Label9.text");
            result[23] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label9.filters = _arg_1;
            }, "_DressPanel_Label9.filters");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton1.label = _arg_1;
            }, "_DressPanel_FilterButton1.label");
            result[25] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton1.filters = _arg_1;
            }, "_DressPanel_FilterButton1.filters");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000485));
            }, function (_arg_1:Object):void
            {
                _DressPanel_Image6.source = _arg_1;
            }, "_DressPanel_Image6.source");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                freeTime.filters = _arg_1;
            }, "freeTime.filters");
            result[28] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000486));
            }, function (_arg_1:Object):void
            {
                _DressPanel_Image7.source = _arg_1;
            }, "_DressPanel_Image7.source");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label11.text = _arg_1;
            }, "_DressPanel_Label11.text");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label11.filters = _arg_1;
            }, "_DressPanel_Label11.filters");
            result[31] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000487));
            }, function (_arg_1:Object):void
            {
                _DressPanel_Image8.source = _arg_1;
            }, "_DressPanel_Image8.source");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label12.text = _arg_1;
            }, "_DressPanel_Label12.text");
            result[33] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label12.filters = _arg_1;
            }, "_DressPanel_Label12.filters");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton2.label = _arg_1;
            }, "_DressPanel_FilterButton2.label");
            result[35] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton2.filters = _arg_1;
            }, "_DressPanel_FilterButton2.filters");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton3.label = _arg_1;
            }, "_DressPanel_FilterButton3.label");
            result[37] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton3.filters = _arg_1;
            }, "_DressPanel_FilterButton3.filters");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton4.label = _arg_1;
            }, "_DressPanel_FilterButton4.label");
            result[39] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton4.filters = _arg_1;
            }, "_DressPanel_FilterButton4.filters");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton5.label = _arg_1;
            }, "_DressPanel_FilterButton5.label");
            result[41] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton5.filters = _arg_1;
            }, "_DressPanel_FilterButton5.filters");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton6.label = _arg_1;
            }, "_DressPanel_FilterButton6.label");
            result[43] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton6.filters = _arg_1;
            }, "_DressPanel_FilterButton6.filters");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label13.text = _arg_1;
            }, "_DressPanel_Label13.text");
            result[45] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label13.filters = _arg_1;
            }, "_DressPanel_Label13.filters");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.shishangdian;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label14.text = _arg_1;
            }, "_DressPanel_Label14.text");
            result[47] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label14.filters = _arg_1;
            }, "_DressPanel_Label14.filters");
            result[48] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.DRESS_PANEL[24]);
            }, function (_arg_1:Array):void
            {
                bagTab.dataArray = _arg_1;
            }, "bagTab.dataArray");
            result[49] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                bagTab.filters = _arg_1;
            }, "bagTab.filters");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[((bagTab.selectedIndex == 0) ? 44 : 39)];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton7.label = _arg_1;
            }, "_DressPanel_FilterButton7.label");
            result[51] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton7.filters = _arg_1;
            }, "_DressPanel_FilterButton7.filters");
            result[52] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                dressScore.filters = _arg_1;
            }, "dressScore.filters");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton8.label = _arg_1;
            }, "_DressPanel_FilterButton8.label");
            result[54] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton8.filters = _arg_1;
            }, "_DressPanel_FilterButton8.filters");
            result[55] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_FUNC1);
            }, function (_arg_1:Object):void
            {
                _DressPanel_Image9.source = _arg_1;
            }, "_DressPanel_Image9.source");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_Label16.text = _arg_1;
            }, "_DressPanel_Label16.text");
            result[57] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_Label16.filters = _arg_1;
            }, "_DressPanel_Label16.filters");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton9.label = _arg_1;
            }, "_DressPanel_FilterButton9.label");
            result[59] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton9.filters = _arg_1;
            }, "_DressPanel_FilterButton9.filters");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton10.label = _arg_1;
            }, "_DressPanel_FilterButton10.label");
            result[61] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton10.filters = _arg_1;
            }, "_DressPanel_FilterButton10.filters");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DressPanel_FilterButton11.label = _arg_1;
            }, "_DressPanel_FilterButton11.label");
            result[63] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DressPanel_FilterButton11.filters = _arg_1;
            }, "_DressPanel_FilterButton11.filters");
            result[64] = binding;
            return (result);
        }

        public function ___DressPanel_Button1_click(_arg_1:MouseEvent):void
        {
            turnHandler(false);
        }

        public function set flyerPlay(_arg_1:DressDisplay):void
        {
            var _local_2:Object = this._1713694796flyerPlay;
            if (_local_2 !== _arg_1)
            {
                this._1713694796flyerPlay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "flyerPlay", _local_2, _arg_1));
            };
        }

        public function set transformText(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1716875591transformText;
            if (_local_2 !== _arg_1)
            {
                this._1716875591transformText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "transformText", _local_2, _arg_1));
            };
        }

        private function dressChangeHanlder():void
        {
            if (((!(dressPlay)) || (!(dressPlay.selectId))))
            {
                return;
            };
            var _local_1:Number = dressPlay.selectId;
            var _local_2:Object = GameData.d[GamePredef.TBL_DRESS][_local_1];
            if (!_local_2)
            {
                return;
            };
            var _local_3:Object = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][_local_2.equiptId];
            if (!_local_3)
            {
                return;
            };
            var _local_4:Number = ((_core.player.gender == 0) ? _local_3.resCodeMale : _local_3.resCodeFemale);
            ((_showView) && (_showView.setResCode(_local_4)));
        }

        private function changeHandler(_arg_1:Event):void
        {
            this.updateView();
        }

        [Bindable(event="propertyChange")]
        public function get freeTime():Label
        {
            return (this._1538341031freeTime);
        }

        public function ___DressPanel_FilterButton3_click(_arg_1:MouseEvent):void
        {
            goldHandler(_arg_1);
        }

        public function set viewHolder(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._2113119409viewHolder;
            if (_local_2 !== _arg_1)
            {
                this._2113119409viewHolder = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewHolder", _local_2, _arg_1));
            };
        }

        private function updatePageThree():void
        {
            var _local_4:Object;
            var _local_1:int = ((bagTab.selectedIndex == 0) ? DressBag.TYPE_CHIP : DressBag.TYPE_RECIPE);
            dressBag.updateView(_local_1);
            var _local_2:int = FREE_EXTRACT_TIME;
            var _local_3:Number = 0;
            if (_core.player.dressInfo)
            {
                _local_4 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (_local_4.extract)
                {
                    _local_2 = (FREE_EXTRACT_TIME - _local_4.extract);
                    if ((_local_2 < 0))
                    {
                        _local_2 = 0;
                    };
                };
                _local_3 = ((_local_4.score) ? Number(_local_4.score) : 0);
            };
            dressScore.text = LanguageUtil.replace(Language.DRESS_PANEL[20], {"score":_local_3});
            freeTime.text = LanguageUtil.replace(Language.DRESS_PANEL[16], {"time":_local_2});
        }

        override public function initialize():void
        {
            var target:DressPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DressPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DressPanelWatcherSetupUtil");
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
        public function get recipeBag():DressBag
        {
            return (this._819927962recipeBag);
        }

        public function ___DressPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            onComplete();
        }

        private function _DressPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = DressItemRenderer;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get flyerPlay():DressDisplay
        {
            return (this._1713694796flyerPlay);
        }

        public function ___DressPanel_FilterButton8_click(_arg_1:MouseEvent):void
        {
            exchangeTab(_arg_1);
        }

        public function set viewStack(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1584105757viewStack;
            if (_local_2 !== _arg_1)
            {
                this._1584105757viewStack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewStack", _local_2, _arg_1));
            };
        }

        public function set illustrateTree(_arg_1:GeneralTree):void
        {
            var _local_2:Object = this._1813919509illustrateTree;
            if (_local_2 !== _arg_1)
            {
                this._1813919509illustrateTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "illustrateTree", _local_2, _arg_1));
            };
        }

        public function set exchangeText(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1429700080exchangeText;
            if (_local_2 !== _arg_1)
            {
                this._1429700080exchangeText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "exchangeText", _local_2, _arg_1));
            };
        }

        private function flyerChangeHanlder():void
        {
            if (((!(flyerPlay)) || (!(flyerPlay.selectId))))
            {
                return;
            };
            var _local_1:Number = flyerPlay.selectId;
            var _local_2:Object = GameData.d[GamePredef.TBL_DRESS][_local_1];
            if (!_local_2)
            {
                return;
            };
            var _local_3:Object = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][_local_2.equiptId];
            if (!_local_3)
            {
                return;
            };
            var _local_4:Object = {
                "flyerResCode":_local_3.resCode,
                "flyerFrontResCode":_local_3.wavCode
            };
            ((_showView) && (_showView.setFlyerCodes(_local_4)));
        }

        public function ___DressPanel_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            changeIndex();
        }

        [Bindable(event="propertyChange")]
        public function get exchangeText():IntroText
        {
            return (this._1429700080exchangeText);
        }

        public function set toActiveSlot(_arg_1:DisplaySlot):void
        {
            var _local_2:Object = this._61982977toActiveSlot;
            if (_local_2 !== _arg_1)
            {
                this._61982977toActiveSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "toActiveSlot", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

