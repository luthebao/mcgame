// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MarriageManagerPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.DataGrid;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.FlowerAndEggHBox;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import mx.formatters.DateFormatter;
    import com.qeedoo.ui.view.comp.MarriageFeedHBox;
    import mx.collections.SortField;
    import mx.collections.Sort;
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

    public class MarriageManagerPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _MarriageManagerPanel_BasicGlowButton3:BasicGlowButton;
        public var _MarriageManagerPanel_BasicGlowButton4:BasicGlowButton;
        public var _MarriageManagerPanel_BasicGlowButton5:BasicGlowButton;
        private var firstFlag:Boolean = true;
        private var charMarriageSekInfo:Object;
        public var _MarriageManagerPanel_DataGridColumn1:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn2:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn4:DataGridColumn;
        public var _MarriageManagerPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _MarriageManagerPanel_DataGridColumn6:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn7:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn9:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn3:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn5:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn8:DataGridColumn;
        private var _99343dg2:DataGrid;
        private var _1605835155charMarirageReqListA:ArrayCollection;
        private var _1554141559tabBtn0:BasicGlowButton;
        public var _MarriageManagerPanel_DataGridColumn10:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn11:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn12:DataGridColumn;
        public var _MarriageManagerPanel_DataGridColumn13:DataGridColumn;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _1284475336itxt_other:IntroText;
        private var _2036880164itxt_self:IntroText;
        private var _3629556vstk:ViewStack;
        private var charMarriageReqListB:ArrayCollection;
        private var _911018726itxt_personalInfo:IntroText;
        public var _MarriageManagerPanel_RoundedLabel1:RoundedLabel;
        private var _99342dg1:DataGrid;
        private var _3243367itxt:IntroText;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":600,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MarriageManagerPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":21,
                                "y":39,
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "width":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":69,
                                "y":39,
                                "styleName":"HorizontalTab",
                                "selected":false,
                                "width":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vstk",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.bottom = "20";
                            this.top = "60";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.top = "10";
                                                    this.bottom = "38";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "width":397,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"dg1",
                                                            "events":{
                                                                "doubleClick":"__dg1_doubleClick",
                                                                "click":"__dg1_click"
                                                            },
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.top = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "doubleClickEnabled":true,
                                                                    "columns":[_MarriageManagerPanel_DataGridColumn1_i(), _MarriageManagerPanel_DataGridColumn2_i(), _MarriageManagerPanel_DataGridColumn3_i(), _MarriageManagerPanel_DataGridColumn4_i(), _MarriageManagerPanel_DataGridColumn5_i(), _MarriageManagerPanel_DataGridColumn6_i(), _MarriageManagerPanel_DataGridColumn7_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"itxt_self",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "415";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":150,
                                                        "height":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"itxt_other",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "415";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":10,
                                                        "height":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_MarriageManagerPanel_BasicGlowButton3",
                                                "events":{"click":"___MarriageManagerPanel_BasicGlowButton3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.left = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_MarriageManagerPanel_BasicGlowButton4",
                                                "events":{"click":"___MarriageManagerPanel_BasicGlowButton4_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.left = "78";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_MarriageManagerPanel_BasicGlowButton5",
                                                "events":{"click":"___MarriageManagerPanel_BasicGlowButton5_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.left = "146";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_MarriageManagerPanel_RoundedLabel1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":292,
                                                        "width":300
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "events":{"show":"___MarriageManagerPanel_SimpleCanvas2_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "width":390,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"dg2",
                                                            "events":{"click":"__dg2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.top = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_MarriageManagerPanel_DataGridColumn8_i(), _MarriageManagerPanel_DataGridColumn9_i(), _MarriageManagerPanel_DataGridColumn10_i(), _MarriageManagerPanel_DataGridColumn11_i(), _MarriageManagerPanel_DataGridColumn12_i(), _MarriageManagerPanel_DataGridColumn13_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"itxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "408";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":10,
                                                        "height":145
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"itxt_personalInfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "408";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":165,
                                                        "height":145
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]});
                        }
                    })]
                });
            }
        });
        private var _90794110_core:Core = Core.getInstance();
        private var _595107704marriageList:ArrayCollection = new ArrayCollection();
        private var marriageListAdvanced:ArrayCollection = new ArrayCollection();
        private var marriageListNormal:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MarriageManagerPanel()
        {
            mx_internal::_document = this;
            this.width = 600;
            this.height = 400;
            this.styleName = "StandardContent";
            this.x = 135;
            this.y = 308;
            this.addEventListener("creationComplete", ___MarriageManagerPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MarriageManagerPanel._watcherSetupUtil = _arg_1;
        }


        private function _MarriageManagerPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = FlowerAndEggHBox;
            return (_local_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                initMarriage();
            };
        }

        [Bindable(event="propertyChange")]
        public function get dg1():DataGrid
        {
            return (this._99342dg1);
        }

        public function ___MarriageManagerPanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            cancelMarriageSekInfo();
        }

        public function init():void
        {
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        private function _MarriageManagerPanel_DataGridColumn11_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn11 = _local_1;
            _local_1.dataField = "level";
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn11", _MarriageManagerPanel_DataGridColumn11);
            return (_local_1);
        }

        private function set marriageList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._595107704marriageList;
            if (_local_2 !== _arg_1)
            {
                this._595107704marriageList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "marriageList", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set dg1(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._99342dg1;
            if (_local_2 !== _arg_1)
            {
                this._99342dg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dg1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itxt_self():IntroText
        {
            return (this._2036880164itxt_self);
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

        public function set dg2(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._99343dg2;
            if (_local_2 !== _arg_1)
            {
                this._99343dg2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dg2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dg2():DataGrid
        {
            return (this._99343dg2);
        }

        private function set charMarirageReqListA(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1605835155charMarirageReqListA;
            if (_local_2 !== _arg_1)
            {
                this._1605835155charMarirageReqListA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charMarirageReqListA", _local_2, _arg_1));
            };
        }

        private function _MarriageManagerPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 80;
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn1", _MarriageManagerPanel_DataGridColumn1);
            return (_local_1);
        }

        public function __dg1_click(_arg_1:MouseEvent):void
        {
            handleDG1Click();
        }

        private function _MarriageManagerPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.IMPANEL_U[32];
            _local_1 = Language.MARRIAGE_PANEL_U[1];
            _local_1 = Language.MARRIAGE_PANEL_U[0];
            _local_1 = marriageList;
            _local_1 = Language.MARRIAGE_PANEL_U[5];
            _local_1 = Language.MARRIAGE_PANEL_U[6];
            _local_1 = Language.MARRIAGE_PANEL_U[7];
            _local_1 = Language.MARRIAGE_PANEL_U[8];
            _local_1 = Language.MARRIAGE_PANEL_U[9];
            _local_1 = Language.MARRIAGE_PANEL_U[19];
            _local_1 = Language.MARRIAGE_PANEL_U[21];
            _local_1 = Language.MARRIAGE_PANEL_U[10];
            _local_1 = Language.MARRIAGE_PANEL_U[15];
            _local_1 = Language.MARRIAGE_PANEL_U[11];
            _local_1 = Language.MARRIAGE_PANEL_U[42];
            _local_1 = charMarirageReqListA;
            _local_1 = Language.MARRIAGE_PANEL_U[5];
            _local_1 = Language.MARRIAGE_PANEL_U[6];
            _local_1 = Language.MARRIAGE_PANEL_U[7];
            _local_1 = Language.MARRIAGE_PANEL_U[8];
            _local_1 = Language.MARRIAGE_PANEL_U[9];
            _local_1 = Language.MARRIAGE_PANEL_U[14];
        }

        private function _MarriageManagerPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "state";
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn5", _MarriageManagerPanel_DataGridColumn5);
            return (_local_1);
        }

        private function _MarriageManagerPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn9 = _local_1;
            _local_1.dataField = "cClass";
            _local_1.width = 60;
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn9", _MarriageManagerPanel_DataGridColumn9);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get itxt_other():IntroText
        {
            return (this._1284475336itxt_other);
        }

        private function clickMarriager():void
        {
            menuPop([{"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}]);
        }

        public function set itxt_self(_arg_1:IntroText):void
        {
            var _local_2:Object = this._2036880164itxt_self;
            if (_local_2 !== _arg_1)
            {
                this._2036880164itxt_self = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itxt_self", _local_2, _arg_1));
            };
        }

        private function handleDG1Click():void
        {
            if (dg1.selectedItem)
            {
                itxt_other.content.text = (Language.MARRIAGE_PANEL_U[22] + dg1.selectedItem.content);
            };
        }

        public function ___MarriageManagerPanel_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            sendMarriageReqInfo();
        }

        [Bindable(event="propertyChange")]
        public function get itxt():IntroText
        {
            return (this._3243367itxt);
        }

        private function _MarriageManagerPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn10 = _local_1;
            _local_1.dataField = "sex";
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn10", _MarriageManagerPanel_DataGridColumn10);
            return (_local_1);
        }

        private function menuPop(_arg_1:Object):void
        {
            var _local_2:Menu = CustomMenu.createMenu(null, _arg_1);
            _local_2.show(stage.mouseX, stage.mouseY);
            _local_2.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        public function ___MarriageManagerPanel_SimpleCanvas2_show(_arg_1:FlexEvent):void
        {
            showCharMarriageReqInfo();
        }

        public function set itxt_other(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1284475336itxt_other;
            if (_local_2 !== _arg_1)
            {
                this._1284475336itxt_other = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itxt_other", _local_2, _arg_1));
            };
        }

        private function _MarriageManagerPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "level";
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn4", _MarriageManagerPanel_DataGridColumn4);
            return (_local_1);
        }

        private function _MarriageManagerPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn8 = _local_1;
            _local_1.dataField = "cname";
            _local_1.width = 80;
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn8", _MarriageManagerPanel_DataGridColumn8);
            return (_local_1);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        public function __dg2_click(_arg_1:MouseEvent):void
        {
            handleDG2Click();
        }

        [Bindable(event="propertyChange")]
        private function get marriageList():ArrayCollection
        {
            return (this._595107704marriageList);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        private function get _core():Core
        {
            return (this._90794110_core);
        }

        private function _MarriageManagerPanel_DataGridColumn13_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn13 = _local_1;
            _local_1.dataField = "";
            _local_1.width = 45;
            _local_1.itemRenderer = _MarriageManagerPanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn13", _MarriageManagerPanel_DataGridColumn13);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get charMarirageReqListA():ArrayCollection
        {
            return (this._1605835155charMarirageReqListA);
        }

        override public function initialize():void
        {
            var target:MarriageManagerPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MarriageManagerPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MarriageManagerPanelWatcherSetupUtil");
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
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        private function cancelMarriageSekInfo():void
        {
            _core.remote.cancelMarriageSekInfo();
        }

        private function sendMarriageReqInfo():void
        {
            if (_core.player.level < 30)
            {
                Alert.show(Language.MARRIAGE_PANEL_U[29]);
                return;
            };
            if (!dg1.selectedItem)
            {
                Alert.show(Language.MARRIAGE_PANEL_U[24]);
                return;
            };
            if (dg1.selectedItem.gender == _core.player.gender)
            {
                Alert.show(Language.MARRIAGE_PANEL_U[25]);
                return;
            };
            var _local_1:MarriageSeekingPanel = MarriageSeekingPanel(_core.view.getUI(ViewManager.POP_MARRIAGE_SEEKING));
            _local_1.type = GamePredef.TYPE_MARRIAGE_REQUEST;
            _local_1.item = dg1.selectedItem;
            _local_1.show();
        }

        public function ___MarriageManagerPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function onInitCharMarriageList(_arg_1:Object):void
        {
            var _local_3:Object;
            firstFlag = false;
            charMarirageReqListA = new ArrayCollection();
            charMarriageReqListB = new ArrayCollection();
            var _local_2:Boolean;
            for each (_local_3 in _arg_1)
            {
                if (_local_3.type == GamePredef.TYPE_MARRIAGE_SEEKING)
                {
                    if (_local_3.cid == _core.player.id)
                    {
                        charMarriageSekInfo = _local_3;
                        itxt_self.text = ((Language.MARRIAGE_PANEL_U[23] + Language.MARRIAGE_PANEL_U[22]) + _local_3.content);
                        _local_2 = true;
                    };
                }
                else
                {
                    if (_local_3.type == GamePredef.TYPE_MARRIAGE_REQUEST)
                    {
                        if (_local_3.cid == _core.player.id)
                        {
                            charMarriageReqListB.addItem(_local_3);
                        }
                        else
                        {
                            if (_local_3.targetId == _core.player.id)
                            {
                                charMarirageReqListA.addItem(_local_3);
                            };
                        };
                    };
                };
            };
            if (!_local_2)
            {
                itxt_self.text = (Language.MARRIAGE_PANEL_U[23] + Language.MARRIAGE_PANEL_U[22]);
            };
            showCharMarriageReqInfo();
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            if (!dg1.selectedItem)
            {
                return;
            };
            if (_arg_1.index == 0)
            {
                _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(dg1.selectedItem.name);
            }
            else
            {
                if (_arg_1.index == 1)
                {
                    ChatPanelUtil.createChatPanel(dg1.selectedItem.cid);
                }
                else
                {
                    if (_arg_1.index == 2)
                    {
                        _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(dg1.selectedItem.cid);
                    };
                };
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        private function _MarriageManagerPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "sex";
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn3", _MarriageManagerPanel_DataGridColumn3);
            return (_local_1);
        }

        private function get dateFormatter():DateFormatter
        {
            var _local_1:DateFormatter;
            if (_local_1 == null)
            {
                _local_1 = new DateFormatter();
                _local_1.formatString = "MM.DD HH:NN";
            };
            return (_local_1);
        }

        public function __dg1_doubleClick(_arg_1:MouseEvent):void
        {
            clickMarriager();
        }

        private function _MarriageManagerPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "";
            _local_1.itemRenderer = _MarriageManagerPanel_ClassFactory1_c();
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn7", _MarriageManagerPanel_DataGridColumn7);
            return (_local_1);
        }

        private function _MarriageManagerPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MarriageFeedHBox;
            return (_local_1);
        }

        private function _MarriageManagerPanel_DataGridColumn12_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn12 = _local_1;
            _local_1.dataField = "state";
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn12", _MarriageManagerPanel_DataGridColumn12);
            return (_local_1);
        }

        private function sendMarriageSekInfo():void
        {
            if (_core.player.level < GamePredef.MARRIAGE_MIN_LEVEL)
            {
                Alert.show(Language.MARRIAGE_PANEL_U[27]);
                return;
            };
            if ((_core.player.moneyBind + _core.player.money) <= GamePredef.MARRIAGE_MIN_MONEY)
            {
                Alert.show(Language.MARRIAGE_PANEL_U[28]);
                return;
            };
            var _local_1:MarriageSeekingPanel = MarriageSeekingPanel(_core.view.getUI(ViewManager.POP_MARRIAGE_SEEKING));
            _local_1.type = GamePredef.TYPE_MARRIAGE_SEEKING;
            _local_1.show();
        }

        private function _MarriageManagerPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MarriageManagerPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (marriageList);
            }, function (_arg_1:Object):void
            {
                dg1.dataProvider = _arg_1;
            }, "dg1.dataProvider");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn1.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn1.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn2.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn2.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn3.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn3.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn4.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn4.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn5.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn5.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn6.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn6.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn7.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn7.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_BasicGlowButton3.label = _arg_1;
            }, "_MarriageManagerPanel_BasicGlowButton3.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_BasicGlowButton4.label = _arg_1;
            }, "_MarriageManagerPanel_BasicGlowButton4.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_BasicGlowButton5.label = _arg_1;
            }, "_MarriageManagerPanel_BasicGlowButton5.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_RoundedLabel1.text = _arg_1;
            }, "_MarriageManagerPanel_RoundedLabel1.text");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (charMarirageReqListA);
            }, function (_arg_1:Object):void
            {
                dg2.dataProvider = _arg_1;
            }, "dg2.dataProvider");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn8.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn8.headerText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn9.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn9.headerText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn10.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn10.headerText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn11.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn11.headerText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn12.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn12.headerText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageManagerPanel_DataGridColumn13.headerText = _arg_1;
            }, "_MarriageManagerPanel_DataGridColumn13.headerText");
            result[21] = binding;
            return (result);
        }

        public function set itxt_personalInfo(_arg_1:IntroText):void
        {
            var _local_2:Object = this._911018726itxt_personalInfo;
            if (_local_2 !== _arg_1)
            {
                this._911018726itxt_personalInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itxt_personalInfo", _local_2, _arg_1));
            };
        }

        public function ___MarriageManagerPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            sendMarriageSekInfo();
        }

        public function onInitMarriageSekList(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:SortField;
            var _local_4:Sort;
            var _local_5:*;
            var _local_6:int;
            var _local_7:int;
            marriageList.removeAll();
            marriageListAdvanced.removeAll();
            marriageListNormal.removeAll();
            for each (_local_2 in _arg_1)
            {
                if (_local_2.cid == _core.player.id)
                {
                    itxt_self.text = ((Language.MARRIAGE_PANEL_U[23] + Language.MARRIAGE_PANEL_U[22]) + _local_2.content);
                };
                _local_2.cClass = _core.getClassName(_local_2.classId);
                _local_2.sex = GamePredef.GENDER_NAME[_local_2.gender];
                _local_2.level = _core.basic.expToLevel(_local_2.exp).toString();
                if (_local_2.online)
                {
                    _local_2.state = Language.IMPANEL_S[69];
                }
                else
                {
                    _local_2.state = Language.IMPANEL_S[70];
                };
                if (_local_2.flag != 0)
                {
                    marriageListAdvanced.addItem(_local_2);
                }
                else
                {
                    marriageListNormal.addItem(_local_2);
                };
            };
            _local_3 = new SortField();
            _local_3.name = "addDate";
            _local_3.numeric = true;
            _local_3.descending = true;
            _local_4 = new Sort();
            _local_4.fields = [_local_3];
            marriageListAdvanced.sort = _local_4;
            marriageListAdvanced.refresh();
            marriageListNormal.sort = _local_4;
            marriageListNormal.refresh();
            for (_local_5 in marriageListAdvanced.length)
            {
                marriageList.addItem(marriageListAdvanced.getItemAt(_local_5));
            };
            _local_6 = (GamePredef.MARRIAGE_LIST_MAX_LENGTH - marriageListAdvanced.length);
            if (_local_6 <= marriageListNormal.length)
            {
                _local_7 = _local_6;
            }
            else
            {
                _local_7 = marriageListNormal.length;
            };
            var _local_8:int;
            while (_local_8 < _local_7)
            {
                marriageList.addItem(marriageListNormal.getItemAt(_local_8));
                _local_8++;
            };
        }

        private function handleDG2Click():void
        {
            if (dg2.selectedItem)
            {
                itxt.content.text = (Language.MARRIAGE_PANEL_U[26] + dg2.selectedItem.content);
            };
        }

        public function set itxt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._3243367itxt;
            if (_local_2 !== _arg_1)
            {
                this._3243367itxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itxt", _local_2, _arg_1));
            };
        }

        private function showCharMarriageReqInfo():void
        {
            var _local_1:*;
            var _local_2:String;
            var _local_3:Date;
            var _local_4:String;
            var _local_5:String;
            var _local_6:String;
            var _local_7:*;
            for (_local_1 in charMarirageReqListA)
            {
                charMarirageReqListA.getItemAt(_local_1).cname = String(charMarirageReqListA.getItemAt(_local_1).name).split("|")[0];
                charMarirageReqListA.getItemAt(_local_1).cClass = _core.getClassName(charMarirageReqListA.getItemAt(_local_1).classId);
                charMarirageReqListA.getItemAt(_local_1).sex = GamePredef.GENDER_NAME[charMarirageReqListA.getItemAt(_local_1).gender];
                charMarirageReqListA.getItemAt(_local_1).level = _core.basic.expToLevel(charMarirageReqListA.getItemAt(_local_1).exp).toString();
                if (charMarirageReqListA.getItemAt(_local_1).online)
                {
                    charMarirageReqListA.getItemAt(_local_1).state = Language.IMPANEL_S[69];
                }
                else
                {
                    charMarirageReqListA.getItemAt(_local_1).state = Language.IMPANEL_S[70];
                };
            };
            _local_2 = Language.MARRIAGE_PANEL_U[30];
            _local_6 = "";
            for (_local_7 in charMarriageReqListB)
            {
                _local_3 = new Date();
                _local_3.setTime(charMarriageReqListB.getItemAt(_local_7).addDate);
                _local_5 = dateFormatter.format(_local_3);
                _local_4 = String(charMarriageReqListB.getItemAt(_local_7).name).split("|")[1];
                if (charMarriageReqListB.getItemAt(_local_7).flag == 0)
                {
                    _local_6 = Language.MARRIAGE_PANEL_U[20].toString().replace("{time}", _local_5).replace("{targetName}", _local_4);
                }
                else
                {
                    if (charMarriageReqListB.getItemAt(_local_7).flag == 1)
                    {
                        _local_6 = (Language.MARRIAGE_PANEL_U[20].toString().replace("{time}", _local_5).replace("{targetName}", _local_4) + Language.MARRIAGE_PANEL_U[35]);
                    }
                    else
                    {
                        if (charMarriageReqListB.getItemAt(_local_7).flag == 2)
                        {
                            _local_6 = (Language.MARRIAGE_PANEL_U[20].toString().replace("{time}", _local_5).replace("{targetName}", _local_4) + Language.MARRIAGE_PANEL_U[36]);
                        };
                    };
                };
                _local_2 = (_local_2 + (_local_6 + "\n"));
            };
            itxt_personalInfo.htmlText = _local_2;
        }

        public function set vstk(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3629556vstk;
            if (_local_2 !== _arg_1)
            {
                this._3629556vstk = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vstk", _local_2, _arg_1));
            };
        }

        private function tabClick(_arg_1:int):void
        {
            vstk.selectedIndex = _arg_1;
            tabBtn0.selected = false;
            tabBtn1.selected = false;
            this[("tabBtn" + _arg_1)].selected = true;
        }

        [Bindable(event="propertyChange")]
        public function get vstk():ViewStack
        {
            return (this._3629556vstk);
        }

        [Bindable(event="propertyChange")]
        public function get itxt_personalInfo():IntroText
        {
            return (this._911018726itxt_personalInfo);
        }

        private function _MarriageManagerPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "cClass";
            _local_1.width = 60;
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn2", _MarriageManagerPanel_DataGridColumn2);
            return (_local_1);
        }

        public function initMarriage():void
        {
            _core.remote.initMarriage(firstFlag);
        }

        private function _MarriageManagerPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MarriageManagerPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "pop";
            BindingManager.executeBindings(this, "_MarriageManagerPanel_DataGridColumn6", _MarriageManagerPanel_DataGridColumn6);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

