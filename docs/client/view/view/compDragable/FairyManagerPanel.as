// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.FairyManagerPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.FairySkillCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.FairySkinCanvas;
    import com.qeedoo.ui.view.comp.FairyFuncCanvas;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.FairyDetailCanvas;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.FairyItemCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.logic.FairyLogic;
    import com.qeedoo.game.predef.GamePredef;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.events.ListEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.collections.Sort;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
    import mx.collections.SortField;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.net.Responder;
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

    public class FairyManagerPanel extends DragableCanvas implements IBindingClient 
    {

        private static const FAIRY_BACKGROUND:Class = FairyManagerPanel_FAIRY_BACKGROUND;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const PAGE_MAX_FAIRY_NUM:int = 5;
        private var _346188388fairyStaG:BoxLabel;
        private var _346491445fairyInte:BoxLabel;
        public var _FairyManagerPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1906851782fairyEffect:BoxLabel;
        private var _346736871fairyAgiG:BoxLabel;
        public var _FairyManagerPanel_BasicTxtButton10:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton11:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton12:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton13:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton14:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton15:BasicTxtButton;
        private var _fairySkillCanvas:FairySkillCanvas;
        private var _1318169611stateBtn:BasicGlowButton;
        public var _FairyManagerPanel_Image1:Image;
        private var _fairySkinCanvas:FairySkinCanvas;
        private var _firstTimeFlag:Boolean = true;
        private var _fairyFuncCanvas:FairyFuncCanvas;
        private var _1379459640funcBtn0:BasicGlowButton;
        private var _307382965showCanvas:CharactorShowCanvas;
        private var _1339554909fairyDataList:List;
        private var _fairyDetailCanvas:FairyDetailCanvas;
        private var _681569291fairySta:BoxLabel;
        private var _681569295fairySte:BoxLabel;
        private var _681555976fairyExp:BoxLabel;
        private var _346188264fairySteG:BoxLabel;
        private var _116765vip:BasicGlowButton;
        public var _FairyManagerPanel_BasicTxtButton1:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton2:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton3:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton4:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton5:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton6:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton7:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton8:BasicTxtButton;
        public var _FairyManagerPanel_BasicTxtButton9:BasicTxtButton;
        private var _fairyAC:ArrayCollection;
        private var _2138148494fairyColor:BoxLabel;
        private var _2143667164fairyInteG:BoxLabel;
        private var _607339634pageSelector:PageSelector;
        private var _1379459641funcBtn1:BasicGlowButton;
        private var _681551598fairyAgi:BoxLabel;
        private var _selFairyData:Object;
        private var _681554728fairyDoh:BoxLabel;
        private var _2139959068fairyEnerG:BoxLabel;
        public var _FairyManagerPanel_BasicGlowButton3:BasicGlowButton;
        public var _FairyManagerPanel_BasicGlowButton4:BasicGlowButton;
        private var _2146171567fairyLevel:BoxLabel;
        private var _346611061fairyEner:BoxLabel;
        private var _fairyItemCanvas:FairyItemCanvas;
        private var _selFairyTemp:Object;
        private var _509690632funcBtn:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FairyManagerPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":14,
                                "y":40,
                                "height":135,
                                "width":135,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_FairyManagerPanel_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":5,
                                            "width":128,
                                            "height":128
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CharactorShowCanvas,
                                    "id":"showCanvas",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":95,
                                            "y":170,
                                            "height":13,
                                            "width":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"vip",
                                    "events":{"click":"__vip_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":67,
                                            "y":108,
                                            "styleName":"BtnLevelUp",
                                            "height":20,
                                            "visible":true
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelector,
                        "id":"pageSelector",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":164,
                                "y":154,
                                "width":126,
                                "height":21
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":162,
                                "y":41,
                                "width":128,
                                "height":109,
                                "styleName":"CSSBorder",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":List,
                                    "id":"fairyDataList",
                                    "events":{
                                        "itemClick":"__fairyDataList_itemClick",
                                        "mouseDown":"__fairyDataList_mouseDown"
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
                                            "verticalScrollPolicy":"off",
                                            "height":99,
                                            "itemRenderer":_FairyManagerPanel_ClassFactory1_c()
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"stateBtn",
                        "events":{"click":"__stateBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":176,
                                "styleName":"CrystalYellowButton",
                                "x":134
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_FairyManagerPanel_BasicGlowButton3",
                        "events":{"click":"___FairyManagerPanel_BasicGlowButton3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":197,
                                "y":176,
                                "styleName":"CrystalYellowButton"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyLevel",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":180,
                                "width":65,
                                "x":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":180,
                                "width":40,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyExp",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":69,
                                "y":348,
                                "width":218,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton2",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":348,
                                "width":45,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyColor",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":201,
                                "width":65,
                                "x":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton3",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":201,
                                "width":40,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyDoh",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":201,
                                "width":65,
                                "x":216,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton4",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":134,
                                "y":201,
                                "width":77,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairySta",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":243,
                                "width":65,
                                "x":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton5",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":243,
                                "width":40,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyStaG",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":243,
                                "width":65,
                                "x":216,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton6",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":134,
                                "y":243,
                                "width":77,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairySte",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":222,
                                "width":65,
                                "x":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton7",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":222,
                                "width":40,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairySteG",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":222,
                                "width":65,
                                "x":216,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton8",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":134,
                                "y":222,
                                "width":77,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyAgi",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":264,
                                "width":65,
                                "x":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton9",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":264,
                                "width":40,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyAgiG",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":264,
                                "width":65,
                                "x":216,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton10",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":134,
                                "y":264,
                                "width":77,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyInte",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":285,
                                "width":65,
                                "x":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton11",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":285,
                                "width":40,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyInteG",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":285,
                                "width":65,
                                "x":216,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton12",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":134,
                                "y":285,
                                "width":77,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyEner",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":306,
                                "width":65,
                                "x":60,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton13",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":306,
                                "width":40,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyEnerG",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":306,
                                "width":65,
                                "x":216,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton14",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":134,
                                "y":306,
                                "width":77,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"fairyEffect",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":327,
                                "width":140,
                                "x":69,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_FairyManagerPanel_BasicTxtButton15",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":327,
                                "width":45,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_FairyManagerPanel_BasicGlowButton4",
                        "events":{"click":"___FairyManagerPanel_BasicGlowButton4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":220,
                                "y":323,
                                "styleName":"CrystalYellowButton",
                                "width":70
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"funcBtn",
                        "events":{"click":"__funcBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":30,
                                "y":367,
                                "styleName":"CrystalYellowButton"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"funcBtn1",
                        "events":{"click":"__funcBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":117,
                                "y":367,
                                "styleName":"CrystalYellowButton"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"funcBtn0",
                        "events":{"click":"__funcBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":205,
                                "y":367,
                                "styleName":"CrystalYellowButton"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _1595139975_fairyPageAc:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FairyManagerPanel()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 400;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FairyManagerPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get fairySta():BoxLabel
        {
            return (this._681569291fairySta);
        }

        [Bindable(event="propertyChange")]
        public function get fairyExp():BoxLabel
        {
            return (this._681555976fairyExp);
        }

        public function set fairyExp(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._681555976fairyExp;
            if (_local_2 !== _arg_1)
            {
                this._681555976fairyExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stateBtn():BasicGlowButton
        {
            return (this._1318169611stateBtn);
        }

        public function set fairySta(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._681569291fairySta;
            if (_local_2 !== _arg_1)
            {
                this._681569291fairySta = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairySta", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vip():BasicGlowButton
        {
            return (this._116765vip);
        }

        [Bindable(event="propertyChange")]
        public function get fairySte():BoxLabel
        {
            return (this._681569295fairySte);
        }

        [Bindable(event="propertyChange")]
        public function get fairySteG():BoxLabel
        {
            return (this._346188264fairySteG);
        }

        private function showSkin():void
        {
            if (!_fairySkinCanvas)
            {
                _fairySkinCanvas = new FairySkinCanvas();
                _fairySkinCanvas.visible = false;
                this.parent.addChildAt(_fairySkinCanvas, this.parent.numChildren);
                _fairySkinCanvas.follow(this);
            };
            if (((_fairyDetailCanvas) && (_fairyDetailCanvas.visible)))
            {
                _fairyDetailCanvas.visible = false;
            };
            if (((_fairyItemCanvas) && (_fairyItemCanvas.visible)))
            {
                _fairyItemCanvas.visible = false;
            };
            if (((_fairyFuncCanvas) && (_fairyFuncCanvas.visible)))
            {
                _fairyFuncCanvas.visible = false;
            };
            if (((_fairySkillCanvas) && (_fairySkillCanvas.visible)))
            {
                _fairySkillCanvas.visible = false;
            };
            if (_selFairyData)
            {
                _fairySkinCanvas.show();
            };
        }

        public function set fairySte(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._681569295fairySte;
            if (_local_2 !== _arg_1)
            {
                this._681569295fairySte = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairySte", _local_2, _arg_1));
            };
        }

        public function set stateBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1318169611stateBtn;
            if (_local_2 !== _arg_1)
            {
                this._1318169611stateBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateBtn", _local_2, _arg_1));
            };
        }

        public function set fairySteG(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._346188264fairySteG;
            if (_local_2 !== _arg_1)
            {
                this._346188264fairySteG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairySteG", _local_2, _arg_1));
            };
        }

        public function set fairyAgiG(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._346736871fairyAgiG;
            if (_local_2 !== _arg_1)
            {
                this._346736871fairyAgiG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyAgiG", _local_2, _arg_1));
            };
        }

        public function __stateBtn_click(_arg_1:MouseEvent):void
        {
            changeState();
        }

        [Bindable(event="propertyChange")]
        public function get funcBtn1():BasicGlowButton
        {
            return (this._1379459641funcBtn1);
        }

        public function set vip(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._116765vip;
            if (_local_2 !== _arg_1)
            {
                this._116765vip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vip", _local_2, _arg_1));
            };
        }

        public function set fairyEnerG(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._2139959068fairyEnerG;
            if (_local_2 !== _arg_1)
            {
                this._2139959068fairyEnerG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyEnerG", _local_2, _arg_1));
            };
        }

        public function set fairyDoh(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._681554728fairyDoh;
            if (_local_2 !== _arg_1)
            {
                this._681554728fairyDoh = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyDoh", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get funcBtn0():BasicGlowButton
        {
            return (this._1379459640funcBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get fairyDataList():List
        {
            return (this._1339554909fairyDataList);
        }

        private function _FairyManagerPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[0];
            _local_1 = FAIRY_BACKGROUND;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[20];
            _local_1 = _fairyPageAc;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[2];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[4];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[68];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[5];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[30];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[6];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[67];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[7];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[67];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[66];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[8];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[66];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[9];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[58];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[10];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[58];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[11];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[59];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[12];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[59];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[13];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[60];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[14];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[60];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[15];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[61];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[16];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[61];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[17];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[62];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[18];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[62];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[65];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[19];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[65];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[31];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[32];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[79];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[89];
        }

        public function set funcBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1379459640funcBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1379459640funcBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "funcBtn0", _local_2, _arg_1));
            };
        }

        public function set funcBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1379459641funcBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1379459641funcBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "funcBtn1", _local_2, _arg_1));
            };
        }

        public function ___FairyManagerPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            showItem();
        }

        private function clearPage():void
        {
            _fairyPageAc.removeAll();
        }

        [Bindable(event="propertyChange")]
        public function get fairyEner():BoxLabel
        {
            return (this._346611061fairyEner);
        }

        public function updateFairy(_arg_1:Number, _arg_2:String, _arg_3:String):void
        {
            var _local_4:Number;
            var _local_5:String;
            var _local_6:Number;
            var _local_7:Number;
            if ((((_core.player) && (_core.player.fairyList)) && (_core.player.fairyList[_arg_1])))
            {
                if (_arg_2 == "exp")
                {
                    _local_4 = (Number(_arg_3) - Number(_core.player.fairyList[_arg_1].exp));
                    _local_5 = "";
                    if (_local_4 > 0)
                    {
                        _local_5 = Language.FAIRY_MANAGER_PANEL_S[1];
                        _local_5 = _local_5.replace("{fairyName}", _core.player.fairyList[_arg_1].name);
                        _local_5 = _local_5.replace("{exp}", (Number(_arg_3) - _core.player.fairyList[_arg_1].exp));
                        _core.sysBlueMsg(_local_5);
                    };
                    _local_6 = FairyLogic.expToLv(Number(_arg_3));
                    _local_7 = FairyLogic.expToLv(_core.player.fairyList[_arg_1].exp);
                    if (_local_7 < _local_6)
                    {
                        _local_5 = Language.FAIRY_MANAGER_PANEL_S[2];
                        _local_5 = _local_5.replace("{fairyName}", _core.player.fairyList[_arg_1].name);
                        _local_5 = _local_5.replace("{newLv}", _local_6);
                        _core.sysBlueMsg(_local_5);
                    };
                };
                _core.player.fairyList[_arg_1][_arg_2] = _arg_3;
                updateView(_arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get fairyColor():BoxLabel
        {
            return (this._2138148494fairyColor);
        }

        public function __funcBtn0_click(_arg_1:MouseEvent):void
        {
            showSkin();
        }

        [Bindable(event="propertyChange")]
        public function get fairyLevel():BoxLabel
        {
            return (this._2146171567fairyLevel);
        }

        public function onAddFairy(_arg_1:Object):void
        {
            var _local_2:Object = _core.data.getData(GamePredef.TBL_FAIRY_TEMPALTE, _arg_1.tid);
            if (_local_2)
            {
                _arg_1.tData = _local_2;
                if (!_core.player.fairyList)
                {
                    _core.player.fairyList = {};
                };
                _core.player.fairyList[_arg_1.id] = _arg_1;
                updateView();
                if (((_fairySkinCanvas) && (_fairySkinCanvas.isLoadCharactorFairyFlag)))
                {
                    _fairySkinCanvas.isLoadCharactorFairyFlag = false;
                    if (_fairySkinCanvas.visible)
                    {
                        _fairySkinCanvas.show();
                    };
                };
                _core.sysBlueMsg(Language.FAIRY_MANAGER_PANEL_U[64].replace("{name}", _arg_1.name));
            };
        }

        private function viewClear():void
        {
            showCanvas.url = null;
        }

        public function set fairyDataList(_arg_1:List):void
        {
            var _local_2:Object = this._1339554909fairyDataList;
            if (_local_2 !== _arg_1)
            {
                this._1339554909fairyDataList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyDataList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCanvas():CharactorShowCanvas
        {
            return (this._307382965showCanvas);
        }

        private function initPageSelector():void
        {
            var _local_1:int;
            pageSelector.lastBtnLabel = Language.PAGE_SELECTOR[2];
            pageSelector.nextBtnLabel = Language.PAGE_SELECTOR[3];
            pageSelector.btnLastPage.width = 32;
            pageSelector.btnNextPage.width = 32;
            if (_fairyAC.length >= PAGE_MAX_FAIRY_NUM)
            {
                _local_1 = PAGE_MAX_FAIRY_NUM;
            }
            else
            {
                _local_1 = _fairyAC.length;
            };
            var _local_2:int;
            while (_local_2 < _local_1)
            {
                _fairyPageAc.addItem(_fairyAC.getItemAt(_local_2));
                _local_2++;
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(_fairyAC.length, PAGE_MAX_FAIRY_NUM);
        }

        private function changeState():void
        {
            var oldState:int;
            var func:Function;
            if (((fairyDataList.selectedItem) && (_selFairyData)))
            {
                oldState = int(_selFairyData.state);
                func = function (_arg_1:CloseEvent):void
                {
                    if (((!(_arg_1)) || (_arg_1.detail == Alert.YES)))
                    {
                        _core.remote.call("changeFairyState", null, _selFairyData.id, ((oldState == 1) ? 0 : 1));
                    };
                };
                if (_selFairyData.binded == 0)
                {
                    Alert.show(Language.FAIRY_MANAGER_PANEL_S[0], "", (Alert.YES | Alert.NO), null, func);
                }
                else
                {
                    (func(null));
                };
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                if (_firstTimeFlag)
                {
                    initView();
                };
            }
            else
            {
                if (((_fairyDetailCanvas) && (_fairyDetailCanvas.visible)))
                {
                    _fairyDetailCanvas.visible = false;
                };
                if (((_fairyFuncCanvas) && (_fairyFuncCanvas.visible)))
                {
                    _fairyFuncCanvas.visible = false;
                };
                if (((_fairyItemCanvas) && (_fairyItemCanvas.visible)))
                {
                    _fairyItemCanvas.visible = false;
                };
                if (((_fairySkillCanvas) && (_fairySkillCanvas.visible)))
                {
                    _fairySkillCanvas.visible = false;
                };
                if (((_fairySkinCanvas) && (_fairySkinCanvas.visible)))
                {
                    _fairySkinCanvas.visible = false;
                };
            };
        }

        private function deleteFairy():void
        {
            var fid:Number;
            var delFunc:Function;
            if (((fairyDataList.selectedItem) && (_selFairyData)))
            {
                fid = fairyDataList.selectedItem.fairyData.id;
                delFunc = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("delFairy", null, fid);
                    };
                };
                Alert.show("", "", (Alert.YES | Alert.NO), null, delFunc);
            };
        }

        [Bindable(event="propertyChange")]
        public function get fairyAgi():BoxLabel
        {
            return (this._681551598fairyAgi);
        }

        public function __fairyDataList_itemClick(_arg_1:ListEvent):void
        {
            fairyDataListClick();
        }

        [Bindable(event="propertyChange")]
        public function get funcBtn():BasicGlowButton
        {
            return (this._509690632funcBtn);
        }

        private function showFairySkillConfig():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_FAIRY_SKILL_CONFIG);
            if (_local_1)
            {
                _local_1.open(_selFairyData);
            };
        }

        public function __vip_click(_arg_1:MouseEvent):void
        {
            showFairySkillConfig();
        }

        private function updateView(_arg_1:Number=-1):void
        {
            var _local_2:int;
            var _local_3:Sort;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:Class;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Object;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (_arg_1 == -1)
            {
                _core.activeFairy = null;
                _fairyAC = new ArrayCollection();
                _local_2 = 0;
                if (_core.player.fairyList)
                {
                    for each (_local_5 in _core.player.fairyList)
                    {
                        if (((_local_5) && (_local_5.tData)))
                        {
                            _local_2++;
                            if (_local_5.state == 1)
                            {
                                _local_6 = ResManager.ICON_PET_BATTLE;
                                _core.activeFairy = _local_5;
                            }
                            else
                            {
                                _local_6 = ResManager.ICON_PET_STANDBY;
                            };
                            _local_7 = int(Math.floor(((FairyLogic.gexpToLv(_local_5.gexp) - 1) / 10)));
                            if (_local_7 < 0)
                            {
                                _local_7 = 0;
                            };
                            _fairyAC.addItem({
                                "id":_local_5.id,
                                "text":_local_5.tData.name,
                                "level":FairyLogic.expToLv(_local_5.exp),
                                "icon":_local_6,
                                "tid":_local_5.tid,
                                "sort2":_local_7,
                                "color":GamePredef.CODE_ITEM_COLOR[_local_7],
                                "fairyData":_local_5
                            });
                        };
                    };
                };
                _local_3 = new Sort();
                _local_3.fields = [new SortField("tid", true, true, true), new SortField("sort2", true, true, true)];
                _fairyAC.sort = _local_3;
                _fairyAC.refresh();
                initPageSelector();
                _local_4 = 0;
                while (_local_4 < _fairyAC.length)
                {
                    if (_fairyAC[_local_4].fairyData.state == 1)
                    {
                        fairyDataList.selectedIndex = _local_4;
                        if (_local_4 >= PAGE_MAX_FAIRY_NUM)
                        {
                            pageSelector.pageNo = (_local_4 / PAGE_MAX_FAIRY_NUM);
                            fairyDataList.selectedIndex = (_local_4 - (PAGE_MAX_FAIRY_NUM * pageSelector.pageNo));
                        }
                        else
                        {
                            pageSelector.pageNo = 0;
                            fairyDataList.selectedIndex = _local_4;
                        };
                        break;
                    };
                    _local_4++;
                };
            }
            else
            {
                if (_arg_1 > 0)
                {
                    _local_8 = 0;
                    while (_local_8 < _fairyAC.length)
                    {
                        if (_fairyAC[_local_8].fairyData.id == _arg_1)
                        {
                            _local_9 = _core.player.fairyList[_arg_1];
                            if (_local_9.state == 1)
                            {
                                _local_10 = ResManager.ICON_PET_BATTLE;
                                _core.activeFairy = _local_9;
                            }
                            else
                            {
                                _local_10 = ResManager.ICON_PET_STANDBY;
                            };
                            _local_7 = int(Math.floor(((FairyLogic.gexpToLv(_local_9.gexp) - 1) / 10)));
                            _local_11 = _fairyAC[_local_8];
                            _local_11.id = _local_9.id;
                            _local_11.text = _local_9.tData.name;
                            _local_11.level = FairyLogic.expToLv(_local_9.exp);
                            _local_11.icon = _local_10;
                            _local_11.tid = _local_9.tid;
                            _local_11.sort2 = _local_7;
                            _local_11.color = GamePredef.CODE_ITEM_COLOR[_local_7];
                            _local_11.fairyData = _local_9;
                            fairyDataList.selectedIndex = _local_8;
                            if (_local_8 >= PAGE_MAX_FAIRY_NUM)
                            {
                                pageSelector.pageNo = (_local_8 / PAGE_MAX_FAIRY_NUM);
                                fairyDataList.selectedIndex = (_local_8 - (PAGE_MAX_FAIRY_NUM * pageSelector.pageNo));
                            }
                            else
                            {
                                pageSelector.pageNo = 0;
                                fairyDataList.selectedIndex = _local_8;
                            };
                            break;
                        };
                        _local_8++;
                    };
                };
            };
            if (fairyDataList.selectedItem == null)
            {
                fairyDataList.selectedIndex = 0;
            };
            fairyDataListClick();
        }

        [Bindable(event="propertyChange")]
        public function get fairyAgiG():BoxLabel
        {
            return (this._346736871fairyAgiG);
        }

        public function set fairyColor(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._2138148494fairyColor;
            if (_local_2 !== _arg_1)
            {
                this._2138148494fairyColor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyColor", _local_2, _arg_1));
            };
        }

        public function set fairyEner(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._346611061fairyEner;
            if (_local_2 !== _arg_1)
            {
                this._346611061fairyEner = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyEner", _local_2, _arg_1));
            };
        }

        private function set _fairyPageAc(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1595139975_fairyPageAc;
            if (_local_2 !== _arg_1)
            {
                this._1595139975_fairyPageAc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_fairyPageAc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get fairyDoh():BoxLabel
        {
            return (this._681554728fairyDoh);
        }

        private function fairyDataListClick():void
        {
            if (((_fairyAC.length <= 0) || (fairyDataList.selectedItem == null)))
            {
                viewClear();
                return;
            };
            _selFairyData = fairyDataList.selectedItem.fairyData;
            showSelFairy();
            if (((_fairyDetailCanvas) && (_fairyDetailCanvas.visible)))
            {
                _fairyDetailCanvas.fairy = _selFairyData;
            };
            if (((_fairyFuncCanvas) && (_fairyFuncCanvas.visible)))
            {
                _fairyFuncCanvas.fairy = _selFairyData;
            };
            if (((_fairyItemCanvas) && (_fairyItemCanvas.visible)))
            {
                _fairyItemCanvas.fairy = _selFairyData;
            };
            if (((_fairySkillCanvas) && (_fairySkillCanvas.visible)))
            {
                _fairySkillCanvas.fairy = _selFairyData;
            };
            if (((_fairySkinCanvas) && (_fairySkinCanvas.visible)))
            {
            };
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_FAIRY_SKILL_CONFIG);
            if (_local_1)
            {
                _local_1.fairy = _selFairyData;
            };
        }

        [Bindable(event="propertyChange")]
        public function get fairyEnerG():BoxLabel
        {
            return (this._2139959068fairyEnerG);
        }

        public function set fairyStaG(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._346188388fairyStaG;
            if (_local_2 !== _arg_1)
            {
                this._346188388fairyStaG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyStaG", _local_2, _arg_1));
            };
        }

        private function mouseAction(_arg_1:Event, _arg_2:int):void
        {
            if (((fairyDataList.selectedItem) && (_selFairyData)))
            {
                _core.view.getUI(ViewManager.PANEL_BAG).visible = true;
                _arg_1.stopImmediatePropagation();
                if (_core.state == GamePredef.ST_BATTLE)
                {
                    return;
                };
                _core.view.showMouse(ResManager.MOUSE_ACTION_IMG[_arg_2]);
                _core.view.mouseState = _arg_2;
                _core.view.mousePetId = fairyDataList.selectedItem.id;
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

        public function set fairyLevel(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._2146171567fairyLevel;
            if (_local_2 !== _arg_1)
            {
                this._2146171567fairyLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyLevel", _local_2, _arg_1));
            };
        }

        private function onInitCharFairy(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_2:int;
            _firstTimeFlag = false;
            for each (_local_3 in _arg_1)
            {
                if (_local_3)
                {
                    _local_3.tData = _core.data.gameData[GamePredef.TBL_FAIRY_TEMPALTE][_local_3.tid];
                };
                _local_2++;
            };
            _core.player.fairyList = _arg_1;
            updateView();
        }

        private function showFunc():void
        {
            if (!_fairyFuncCanvas)
            {
                _fairyFuncCanvas = new FairyFuncCanvas();
                _fairyFuncCanvas.visible = false;
                this.parent.addChildAt(_fairyFuncCanvas, this.parent.numChildren);
                _fairyFuncCanvas.follow(this);
            };
            if (((_fairyDetailCanvas) && (_fairyDetailCanvas.visible)))
            {
                _fairyDetailCanvas.visible = false;
            };
            if (((_fairyItemCanvas) && (_fairyItemCanvas.visible)))
            {
                _fairyItemCanvas.visible = false;
            };
            if (((_fairySkillCanvas) && (_fairySkillCanvas.visible)))
            {
                _fairySkillCanvas.visible = false;
            };
            if (((_fairySkinCanvas) && (_fairySkinCanvas.visible)))
            {
                _fairySkinCanvas.visible = false;
            };
            if (_selFairyData)
            {
                _fairyFuncCanvas.fairy = _selFairyData;
                _fairyFuncCanvas.show();
            };
        }

        private function showSkill():void
        {
            if (!_fairySkillCanvas)
            {
                _fairySkillCanvas = new FairySkillCanvas();
                _fairySkillCanvas.visible = false;
                this.parent.addChildAt(_fairySkillCanvas, this.parent.numChildren);
                _fairySkillCanvas.follow(this);
            };
            if (((_fairyDetailCanvas) && (_fairyDetailCanvas.visible)))
            {
                _fairyDetailCanvas.visible = false;
            };
            if (((_fairyItemCanvas) && (_fairyItemCanvas.visible)))
            {
                _fairyItemCanvas.visible = false;
            };
            if (((_fairyFuncCanvas) && (_fairyFuncCanvas.visible)))
            {
                _fairyFuncCanvas.visible = false;
            };
            if (((_fairySkinCanvas) && (_fairySkinCanvas.visible)))
            {
                _fairySkinCanvas.visible = false;
            };
            if (_selFairyData)
            {
                _fairySkillCanvas.fairy = _selFairyData;
                _fairySkillCanvas.show();
            };
        }

        public function enableUI():void
        {
            if (initialized)
            {
                funcBtn.enabled = true;
            };
        }

        public function reset():void
        {
            _firstTimeFlag = true;
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

        public function disableUI():void
        {
            if (initialized)
            {
                funcBtn.enabled = false;
            };
        }

        [Bindable(event="propertyChange")]
        private function get _fairyPageAc():ArrayCollection
        {
            return (this._1595139975_fairyPageAc);
        }

        public function set fairyEffect(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1906851782fairyEffect;
            if (_local_2 !== _arg_1)
            {
                this._1906851782fairyEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyEffect", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:FairyManagerPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FairyManagerPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_FairyManagerPanelWatcherSetupUtil");
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

        public function onDelFairy(_arg_1:Number):void
        {
            if (_core.player.fairyList)
            {
                if (_core.player.fairyList[_arg_1])
                {
                    _core.sysBlueMsg(Language.FAIRY_MANAGER_PANEL_U[63].replayce("{name}", _core.player.fairyList[_arg_1].name));
                };
                delete _core.player.fairyList[_arg_1];
                updateView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get fairyStaG():BoxLabel
        {
            return (this._346188388fairyStaG);
        }

        public function set fairyInte(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._346491445fairyInte;
            if (_local_2 !== _arg_1)
            {
                this._346491445fairyInte = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyInte", _local_2, _arg_1));
            };
        }

        public function __funcBtn_click(_arg_1:MouseEvent):void
        {
            showFunc();
        }

        public function __fairyDataList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function showDetail():void
        {
            if (!_fairyDetailCanvas)
            {
                _fairyDetailCanvas = new FairyDetailCanvas();
                _fairyDetailCanvas.visible = false;
                this.parent.addChildAt(_fairyDetailCanvas, this.parent.numChildren);
                _fairyDetailCanvas.follow(this);
            };
            if (_fairyDetailCanvas.visible)
            {
                _fairyDetailCanvas.visible = false;
            }
            else
            {
                if (((_fairyFuncCanvas) && (_fairyFuncCanvas.visible)))
                {
                    _fairyFuncCanvas.visible = false;
                };
                if (((_fairyItemCanvas) && (_fairyItemCanvas.visible)))
                {
                    _fairyItemCanvas.visible = false;
                };
                if (((_fairySkillCanvas) && (_fairySkillCanvas.visible)))
                {
                    _fairySkillCanvas.visible = false;
                };
                if (((_fairySkinCanvas) && (_fairySkinCanvas.visible)))
                {
                    _fairySkinCanvas.visible = false;
                };
                if (_selFairyData)
                {
                    _fairyDetailCanvas.fairy = _selFairyData;
                    _fairyDetailCanvas.visible = true;
                };
            };
        }

        private function showSelFairy():void
        {
            var _local_1:int;
            var _local_2:Number;
            var _local_3:String;
            if (_selFairyData)
            {
                _selFairyTemp = _selFairyData.tData;
                if (_selFairyTemp)
                {
                    _local_3 = ResManager.getResUrl(_selFairyTemp.rc);
                    if (showCanvas.url != _local_3)
                    {
                        showCanvas.url = _local_3;
                    };
                    showCanvas.color = ((_selFairyData.cc) ? _selFairyData.cc : _selFairyTemp.cc);
                }
                else
                {
                    return;
                };
                if (ToolKit.isEqual(_selFairyData.state, 1))
                {
                    stateBtn.label = Language.FAIRY_MANAGER_PANEL_U[4];
                }
                else
                {
                    stateBtn.label = Language.FAIRY_MANAGER_PANEL_U[3];
                };
                _selFairyData.level = FairyLogic.expToLv(_selFairyData.exp);
                fairyLevel.text = _selFairyData.level;
                fairyExp.text = (((Number(_selFairyData.exp) - FairyLogic.lvToExp(_selFairyData.level)).toString() + "/") + FairyLogic.lvUpExp(_selFairyData.level).toString());
                _local_1 = FairyLogic.gexpToLv(_selFairyData.gexp);
                fairyColor.text = GamePredef.FAIRY_COLOR_TO_TEXT[Math.floor((((_local_1 == 0) ? 0 : (_local_1 - 1)) / 10))];
                fairyDoh.text = Math.round((_selFairyData.doh / 100)).toString();
                _local_2 = (Math.round(((0.2 * _local_1) * 10)) / 10);
                fairySta.text = String(Math.round(ToolKit.add(_selFairyData.sta, ((_selFairyData.level - 1) * ToolKit.add(_selFairyData.staG, _local_2)))));
                fairyStaG.htmlText = ((((Math.round((_selFairyData.staG * 10)) / 10) + "<font color='#00ff00'>+") + _local_2) + "</font>");
                fairySte.text = String(Math.round(ToolKit.add(_selFairyData.ste, ((_selFairyData.level - 1) * ToolKit.add(_selFairyData.steG, _local_2)))));
                fairySteG.htmlText = ((((Math.round((_selFairyData.steG * 10)) / 10) + "<font color='#00ff00'>+") + _local_2) + "</font>");
                fairyAgi.text = String(Math.round(ToolKit.add(_selFairyData.agi, ((_selFairyData.level - 1) * ToolKit.add(_selFairyData.agiG, _local_2)))));
                fairyAgiG.htmlText = ((((Math.round((_selFairyData.agiG * 10)) / 10) + "<font color='#00ff00'>+") + _local_2) + "</font>");
                fairyInte.text = String(Math.round(ToolKit.add(_selFairyData.inte, ((_selFairyData.level - 1) * ToolKit.add(_selFairyData.inteG, _local_2)))));
                fairyInteG.htmlText = ((((Math.round((_selFairyData.inteG * 10)) / 10) + "<font color='#00ff00'>+") + _local_2) + "</font>");
                fairyEner.text = String(Math.round(ToolKit.add(_selFairyData.ener, ((_selFairyData.level - 1) * ToolKit.add(_selFairyData.enerG, _local_2)))));
                fairyEnerG.htmlText = ((((Math.round((_selFairyData.enerG * 10)) / 10) + "<font color='#00ff00'>+") + _local_2) + "</font>");
                fairyEffect.text = (((GamePredef.FAIRY_COLOR_EFFECT[Math.floor((((_local_1 == 0) ? 0 : (_local_1 - 1)) / 10))] + "% * ") + Math.floor((100 - ((Math.max((75 - Math.round((_selFairyData.doh / 100))), 0) * 100) / 75)))) + "%");
            };
        }

        private function showItem():void
        {
            if (!_fairyItemCanvas)
            {
                _fairyItemCanvas = new FairyItemCanvas();
                _fairyItemCanvas.visible = false;
                this.parent.addChildAt(_fairyItemCanvas, this.parent.numChildren);
                _fairyItemCanvas.follow(this);
            };
            if (((_fairyDetailCanvas) && (_fairyDetailCanvas.visible)))
            {
                _fairyDetailCanvas.visible = false;
            };
            if (((_fairyFuncCanvas) && (_fairyFuncCanvas.visible)))
            {
                _fairyFuncCanvas.visible = false;
            };
            if (((_fairySkillCanvas) && (_fairySkillCanvas.visible)))
            {
                _fairySkillCanvas.visible = false;
            };
            if (((_fairySkinCanvas) && (_fairySkinCanvas.visible)))
            {
                _fairySkinCanvas.visible = false;
            };
            if (_selFairyData)
            {
                _fairyItemCanvas.fairy = _selFairyData;
                _fairyItemCanvas.show();
            };
        }

        public function ___FairyManagerPanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            showDetail();
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                _fairyPageAc.addItem(_fairyAC.getItemAt(_local_3));
                _local_4++;
            };
        }

        public function set fairyInteG(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._2143667164fairyInteG;
            if (_local_2 !== _arg_1)
            {
                this._2143667164fairyInteG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyInteG", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get fairyInte():BoxLabel
        {
            return (this._346491445fairyInte);
        }

        [Bindable(event="propertyChange")]
        public function get fairyEffect():BoxLabel
        {
            return (this._1906851782fairyEffect);
        }

        public function set fairyAgi(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._681551598fairyAgi;
            if (_local_2 !== _arg_1)
            {
                this._681551598fairyAgi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairyAgi", _local_2, _arg_1));
            };
        }

        public function __funcBtn1_click(_arg_1:MouseEvent):void
        {
            showSkill();
        }

        [Bindable(event="propertyChange")]
        public function get fairyInteG():BoxLabel
        {
            return (this._2143667164fairyInteG);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initCharFairy", new Responder(onInitCharFairy));
        }

        public function set funcBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._509690632funcBtn;
            if (_local_2 !== _arg_1)
            {
                this._509690632funcBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "funcBtn", _local_2, _arg_1));
            };
        }

        private function _FairyManagerPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = FairyManagerPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function _FairyManagerPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_FairyManagerPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (FAIRY_BACKGROUND);
            }, function (_arg_1:Object):void
            {
                _FairyManagerPanel_Image1.source = _arg_1;
            }, "_FairyManagerPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vip.label = _arg_1;
            }, "vip.label");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_fairyPageAc);
            }, function (_arg_1:Object):void
            {
                fairyDataList.dataProvider = _arg_1;
            }, "fairyDataList.dataProvider");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                stateBtn.toolTip = _arg_1;
            }, "stateBtn.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                stateBtn.label = _arg_1;
            }, "stateBtn.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicGlowButton3.toolTip = _arg_1;
            }, "_FairyManagerPanel_BasicGlowButton3.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicGlowButton3.label = _arg_1;
            }, "_FairyManagerPanel_BasicGlowButton3.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton1.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton2.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton2.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[67];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairyColor.toolTip = _arg_1;
            }, "fairyColor.toolTip");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton3.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton3.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[67];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton3.toolTip = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton3.toolTip");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[66];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairyDoh.toolTip = _arg_1;
            }, "fairyDoh.toolTip");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton4.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton4.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[66];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton4.toolTip = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton4.toolTip");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton5.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton5.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairyStaG.toolTip = _arg_1;
            }, "fairyStaG.toolTip");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton6.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton6.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton6.toolTip = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton6.toolTip");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton7.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton7.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairySteG.toolTip = _arg_1;
            }, "fairySteG.toolTip");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton8.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton8.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton8.toolTip = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton8.toolTip");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton9.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton9.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[60];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairyAgiG.toolTip = _arg_1;
            }, "fairyAgiG.toolTip");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton10.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton10.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[60];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton10.toolTip = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton10.toolTip");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton11.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton11.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairyInteG.toolTip = _arg_1;
            }, "fairyInteG.toolTip");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton12.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton12.label");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton12.toolTip = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton12.toolTip");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton13.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton13.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[62];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairyEnerG.toolTip = _arg_1;
            }, "fairyEnerG.toolTip");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton14.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton14.label");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[62];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton14.toolTip = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton14.toolTip");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[65];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairyEffect.toolTip = _arg_1;
            }, "fairyEffect.toolTip");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton15.label = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton15.label");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[65];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicTxtButton15.toolTip = _arg_1;
            }, "_FairyManagerPanel_BasicTxtButton15.toolTip");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyManagerPanel_BasicGlowButton4.label = _arg_1;
            }, "_FairyManagerPanel_BasicGlowButton4.label");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                funcBtn.label = _arg_1;
            }, "funcBtn.label");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[79];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                funcBtn1.label = _arg_1;
            }, "funcBtn1.label");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[89];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                funcBtn0.label = _arg_1;
            }, "funcBtn0.label");
            result[42] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

