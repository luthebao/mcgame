// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.HelpPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.List;
    import mx.containers.Canvas;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.ViewStack;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.ButtonTree;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HDividedBox;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import mx.events.PropertyChangeEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import flash.net.URLLoader;
    import flash.events.Event;
    import mx.controls.Alert;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.setTimeout;
    import mx.events.CloseEvent;
    import mx.events.ListEvent;
    import mx.events.FlexEvent;
    import flash.events.IOErrorEvent;
    import mx.binding.Binding;
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

    public class HelpPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _HelpPanel_Object17:Object;
        public var _HelpPanel_Object18:Object;
        public var _HelpPanel_Object19:Object;
        private var _1096322398resList:List;
        public var _HelpPanel_Object11:Object;
        private var _361518594contactGMCanvas:ContactGMCanvas;
        public var _HelpPanel_Object20:Object;
        public var _HelpPanel_Object21:Object;
        public var _HelpPanel_Object22:Object;
        public var _HelpPanel_Object23:Object;
        public var _HelpPanel_Object24:Object;
        public var _HelpPanel_Object25:Object;
        public var _HelpPanel_Canvas1:Canvas;
        public var _HelpPanel_Object27:Object;
        public var _HelpPanel_Canvas3:Canvas;
        public var _HelpPanel_Object29:Object;
        public var _HelpPanel_Canvas5:Canvas;
        public var _HelpPanel_Object26:Object;
        public var _HelpPanel_Object28:Object;
        private var _1946144776xmlHelp:XMLList;
        public var str:String;
        private var _710472971searchText:TextInput;
        public var _HelpPanel_Object30:Object;
        private var _939616718searchedContent:IntroText;
        public var _HelpPanel_Object31:Object;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var bbsurl:String;
        private var _114581tab:ViewStack;
        private var _1554141557tabBtn2:BasicGlowButton;
        public var firstTimeFlag:int = 0;
        public var _HelpPanel_DataGridColumn1:DataGridColumn;
        public var _HelpPanel_DataGridColumn2:DataGridColumn;
        private var _51902346selectTextArea:IntroText;
        private var _1554141555tabBtn4:BasicGlowButton;
        private var csurl:String;
        public var _HelpPanel_Object1:Object;
        public var _HelpPanel_Object2:Object;
        public var _HelpPanel_Object3:Object;
        public var _HelpPanel_Object4:Object;
        public var _HelpPanel_Object5:Object;
        public var _HelpPanel_Object6:Object;
        public var _HelpPanel_Object7:Object;
        public var _HelpPanel_Object8:Object;
        public var _HelpPanel_Object9:Object;
        public var _HelpPanel_BasicGlowButton1:BasicGlowButton;
        public var submitQuestionEnable:Boolean = false;
        public var _HelpPanel_BasicGlowButton7:BasicGlowButton;
        private var _1554141558tabBtn1:BasicGlowButton;
        public var _HelpPanel_LinkButton1:LinkButton;
        public var _HelpPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var _2028527347shortCuts:DataGrid;
        private var _1789063784dataTree:ButtonTree;
        public var _HelpPanel_Object10:Object;
        public var _HelpPanel_Object12:Object;
        public var _HelpPanel_Object13:Object;
        public var _HelpPanel_Object14:Object;
        public var _HelpPanel_Object15:Object;
        public var _HelpPanel_Object16:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":600,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_HelpPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tab",
                        "events":{"mouseDown":"__tab_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "60";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_HelpPanel_Canvas1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":HDividedBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":35,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ButtonTree,
                                                                        "id":"dataTree",
                                                                        "events":{"itemClick":"__dataTree_itemClick"},
                                                                        "effects":["creationCompleteEffect"],
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "5";
                                                                            this.top = "8";
                                                                            this.bottom = "8";
                                                                            this.creationCompleteEffect = "";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "labelField":"@label",
                                                                                "showRoot":false,
                                                                                "width":140
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"selectTextArea",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "8";
                                                                            this.left = "153";
                                                                            this.top = "8";
                                                                            this.bottom = "8";
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
                                    "type":Canvas,
                                    "id":"_HelpPanel_Canvas3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":HDividedBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":40,
                                                                    "percentHeight":100,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":List,
                                                                        "id":"resList",
                                                                        "events":{"change":"__resList_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "6";
                                                                            this.right = "293.6";
                                                                            this.bottom = "3.9833221";
                                                                            this.top = "33.95";
                                                                            this.backgroundAlpha = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"styleName":"CSSBorder"});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"searchText",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.cornerRadius = 0;
                                                                            this.backgroundAlpha = 0;
                                                                            this.borderColor = 0;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":103.06667,
                                                                                "x":6,
                                                                                "y":9,
                                                                                "height":22
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_HelpPanel_BasicGlowButton1",
                                                                        "events":{"click":"___HelpPanel_BasicGlowButton1_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":112.05,
                                                                                "y":5.5,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"searchedContent",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "10";
                                                                            this.bottom = "5";
                                                                            this.left = "164.3";
                                                                            this.right = "7.0333557";
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
                                    "type":Canvas,
                                    "id":"_HelpPanel_Canvas5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"shortCuts",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "y":6,
                                                        "dataProvider":[_HelpPanel_Object1_i(), _HelpPanel_Object2_i(), _HelpPanel_Object3_i(), _HelpPanel_Object4_i(), _HelpPanel_Object5_i(), _HelpPanel_Object6_i(), _HelpPanel_Object7_i(), _HelpPanel_Object8_i(), _HelpPanel_Object9_i(), _HelpPanel_Object10_i(), _HelpPanel_Object11_i(), _HelpPanel_Object12_i(), _HelpPanel_Object13_i(), _HelpPanel_Object14_i(), _HelpPanel_Object15_i(), _HelpPanel_Object16_i(), _HelpPanel_Object17_i(), _HelpPanel_Object18_i(), _HelpPanel_Object19_i(), _HelpPanel_Object20_i(), _HelpPanel_Object21_i(), _HelpPanel_Object22_i(), _HelpPanel_Object23_i(), _HelpPanel_Object24_i(), _HelpPanel_Object25_i(), _HelpPanel_Object26_i(), _HelpPanel_Object27_i(), _HelpPanel_Object28_i(), _HelpPanel_Object29_i(), _HelpPanel_Object30_i(), _HelpPanel_Object31_i()],
                                                        "columns":[_HelpPanel_DataGridColumn1_i(), _HelpPanel_DataGridColumn2_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ContactGMCanvas,
                                    "id":"contactGMCanvas",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                })]});
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_HelpPanel_LinkButton1",
                        "events":{"click":"___HelpPanel_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"DescriptionText",
                                "x":320,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":315,
                                "x":25,
                                "y":40,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":46
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":46
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":46
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "enabled":false,
                                            "width":46
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn4",
                                    "events":{"click":"__tabBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":46
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_HelpPanel_BasicGlowButton7",
                                    "events":{"click":"___HelpPanel_BasicGlowButton7_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":290,
                                            "styleName":"HorizontalTab",
                                            "width":65
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function HelpPanel()
        {
            mx_internal::_document = this;
            this.width = 600;
            this.height = 400;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___HelpPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            HelpPanel._watcherSetupUtil = _arg_1;
        }


        private function _HelpPanel_Object6_i():Object
        {
            var _local_1:Object = {
                "label":"K",
                "data":null
            };
            _HelpPanel_Object6 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object6", _HelpPanel_Object6);
            return (_local_1);
        }

        private function _HelpPanel_Object28_i():Object
        {
            var _local_1:Object = {
                "label":null,
                "data":null
            };
            _HelpPanel_Object28 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object28", _HelpPanel_Object28);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get xmlHelp():XMLList
        {
            return (this._1946144776xmlHelp);
        }

        private function _HelpPanel_Object20_i():Object
        {
            var _local_1:Object = {
                "label":"H",
                "data":null
            };
            _HelpPanel_Object20 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object20", _HelpPanel_Object20);
            return (_local_1);
        }

        public function set contactGMCanvas(_arg_1:ContactGMCanvas):void
        {
            var _local_2:Object = this._361518594contactGMCanvas;
            if (_local_2 !== _arg_1)
            {
                this._361518594contactGMCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contactGMCanvas", _local_2, _arg_1));
            };
        }

        private function gotoCustomerCenter():void
        {
            navigateToURL(new URLRequest(csurl), "_blank");
        }

        private function _HelpPanel_Object16_i():Object
        {
            var _local_1:Object = {
                "label":"G",
                "data":null
            };
            _HelpPanel_Object16 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object16", _HelpPanel_Object16);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get contactGMCanvas():ContactGMCanvas
        {
            return (this._361518594contactGMCanvas);
        }

        public function ___HelpPanel_BasicGlowButton7_click(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(GamePredef.SERVER_ADD_GUIDE), "_blank");
        }

        private function helpSearch(_arg_1:String):void
        {
            var _local_2:XML;
            resList.dataProvider = null;
            for each (_local_2 in XMLList(dataTree.dataProvider).descendants())
            {
                if (String(_local_2.@label).indexOf(_arg_1) >= 0)
                {
                    resList.dataProvider.addItem({
                        "label":_local_2.@label,
                        "data":_local_2.@data
                    });
                };
            };
        }

        public function onGetQuestionList(_arg_1:int, _arg_2:Object):void
        {
            contactGMCanvas.updateQuestionList(_arg_1, _arg_2);
        }

        private function _HelpPanel_Object5_i():Object
        {
            var _local_1:Object = {
                "label":"Q",
                "data":null
            };
            _HelpPanel_Object5 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object5", _HelpPanel_Object5);
            return (_local_1);
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
        }

        public function selectPetArena():void
        {
            var _local_1:*;
            var _local_2:int;
            var _local_3:*;
            var _local_4:XML;
            var _local_5:XML;
            this.tabBtnClick(0);
            for each (_local_1 in dataTree.openItems)
            {
                dataTree.expandItem(_local_1, false);
            };
            _local_2 = xmlHelp.children().length();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                if (xmlHelp.child("node")[_local_3].@id == "22")
                {
                    _local_4 = (xmlHelp.child("node")[_local_3] as XML);
                    dataTree.selectedItem = _local_4;
                    _local_2 = _local_4.children().length();
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        if (_local_4.child("node")[_local_3].@id == "2201")
                        {
                            _local_5 = _local_4.child("node")[_local_3];
                            selectTextArea.htmlText = _local_5.@data;
                            break;
                        };
                        _local_3++;
                    };
                };
                _local_3++;
            };
        }

        private function _HelpPanel_Object27_i():Object
        {
            var _local_1:Object = {
                "label":null,
                "data":null
            };
            _HelpPanel_Object27 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object27", _HelpPanel_Object27);
            return (_local_1);
        }

        private function _HelpPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _HelpPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "data";
            BindingManager.executeBindings(this, "_HelpPanel_DataGridColumn2", _HelpPanel_DataGridColumn2);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get searchedContent():IntroText
        {
            return (this._939616718searchedContent);
        }

        private function _HelpPanel_Object30_i():Object
        {
            var _local_1:Object = {
                "label":null,
                "data":null
            };
            _HelpPanel_Object30 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object30", _HelpPanel_Object30);
            return (_local_1);
        }

        public function set searchedContent(_arg_1:IntroText):void
        {
            var _local_2:Object = this._939616718searchedContent;
            if (_local_2 !== _arg_1)
            {
                this._939616718searchedContent = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchedContent", _local_2, _arg_1));
            };
        }

        public function selectGuildHelp():void
        {
            var _local_1:*;
            var _local_2:int;
            var _local_3:*;
            var _local_4:XML;
            var _local_5:XML;
            this.tabBtnClick(0);
            for each (_local_1 in dataTree.openItems)
            {
                dataTree.expandItem(_local_1, false);
            };
            _local_2 = xmlHelp.children().length();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                if (xmlHelp.child("node")[_local_3].@id == "09")
                {
                    _local_4 = (xmlHelp.child("node")[_local_3] as XML);
                    dataTree.selectedItem = _local_4;
                    _local_2 = _local_4.children().length();
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        if (_local_4.child("node")[_local_3].@id == "0901")
                        {
                            _local_5 = _local_4.child("node")[_local_3];
                            selectTextArea.htmlText = _local_5.@data;
                            break;
                        };
                        _local_3++;
                    };
                    return;
                };
                _local_3++;
            };
        }

        private function _HelpPanel_Object15_i():Object
        {
            var _local_1:Object = {
                "label":"ESC",
                "data":null
            };
            _HelpPanel_Object15 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object15", _HelpPanel_Object15);
            return (_local_1);
        }

        private function _HelpPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.HELPPANEL_U[7];
            _local_1 = Language.HELPPANEL_U[2];
            _local_1 = xmlHelp;
            _local_1 = Language.HELPPANEL_U[3];
            _local_1 = Language.HELPPANEL_U[0];
            _local_1 = Language.HELPPANEL_U[4];
            _local_1 = Language.HELPPANEL_S[4];
            _local_1 = Language.HELPPANEL_S[5];
            _local_1 = Language.HELPPANEL_S[6];
            _local_1 = Language.HELPPANEL_S[7];
            _local_1 = Language.HELPPANEL_S[8];
            _local_1 = Language.HELPPANEL_S[9];
            _local_1 = Language.HELPPANEL_S[10];
            _local_1 = Language.HELPPANEL_S[44];
            _local_1 = Language.HELPPANEL_S[47];
            _local_1 = Language.HELPPANEL_S[11];
            _local_1 = Language.HELPPANEL_S[12];
            _local_1 = Language.HELPPANEL_S[13];
            _local_1 = Language.HELPPANEL_S[14];
            _local_1 = Language.HELPPANEL_S[15];
            _local_1 = Language.HELPPANEL_S[16];
            _local_1 = Language.HELPPANEL_S[17];
            _local_1 = Language.HELPPANEL_S[18];
            _local_1 = Language.HELPPANEL_S[19];
            _local_1 = Language.HELPPANEL_S[20];
            _local_1 = Language.HELPPANEL_S[21];
            _local_1 = Language.HELPPANEL_S[22];
            _local_1 = Language.HELPPANEL_S[45];
            _local_1 = Language.HELPPANEL_S[46];
            _local_1 = Language.HELPPANEL_S[23];
            _local_1 = Language.HELPPANEL_S[24];
            _local_1 = Language.HELPPANEL_S[31];
            _local_1 = Language.HELPPANEL_S[25];
            _local_1 = Language.HELPPANEL_S[32];
            _local_1 = Language.HELPPANEL_S[26];
            _local_1 = Language.HELPPANEL_S[33];
            _local_1 = Language.HELPPANEL_S[27];
            _local_1 = Language.HELPPANEL_S[34];
            _local_1 = Language.HELPPANEL_S[28];
            _local_1 = Language.HELPPANEL_S[35];
            _local_1 = Language.HELPPANEL_S[29];
            _local_1 = Language.HELPPANEL_S[36];
            _local_1 = Language.HELPPANEL_S[30];
            _local_1 = Language.HELPPANEL_S[37];
            _local_1 = Language.HELPPANEL_S[38];
            _local_1 = Language.HELPPANEL_U[5];
            _local_1 = Language.HELPPANEL_S[43];
            _local_1 = Language.HELPPANEL_U[2];
            _local_1 = Language.HELPPANEL_U[3];
            _local_1 = Language.HELPPANEL_U[4];
            _local_1 = Language.HELPPANEL_U[5];
            _local_1 = Language.HELPPANEL_U[6];
            _local_1 = Language.ACTIVEPANEL_U[15];
        }

        [Bindable(event="propertyChange")]
        public function get dataTree():ButtonTree
        {
            return (this._1789063784dataTree);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        private function _HelpPanel_Object31_i():Object
        {
            var _local_1:Object = {
                "label":null,
                "data":null
            };
            _HelpPanel_Object31 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object31", _HelpPanel_Object31);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get selectTextArea():IntroText
        {
            return (this._51902346selectTextArea);
        }

        private function _HelpPanel_Object4_i():Object
        {
            var _local_1:Object = {
                "label":"S",
                "data":null
            };
            _HelpPanel_Object4 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object4", _HelpPanel_Object4);
            return (_local_1);
        }

        private function _HelpPanel_Object26_i():Object
        {
            var _local_1:Object = {
                "label":null,
                "data":null
            };
            _HelpPanel_Object26 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object26", _HelpPanel_Object26);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        public function set shortCuts(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._2028527347shortCuts;
            if (_local_2 !== _arg_1)
            {
                this._2028527347shortCuts = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shortCuts", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        public function ___HelpPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(bbsurl), "_blank");
        }

        private function _HelpPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _HelpPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "label";
            BindingManager.executeBindings(this, "_HelpPanel_DataGridColumn1", _HelpPanel_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicGlowButton
        {
            return (this._1554141555tabBtn4);
        }

        private function _HelpPanel_Object14_i():Object
        {
            var _local_1:Object = {
                "label":"M/TAB",
                "data":null
            };
            _HelpPanel_Object14 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object14", _HelpPanel_Object14);
            return (_local_1);
        }

        public function ___HelpPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            helpSearch(searchText.text);
        }

        public function set resList(_arg_1:List):void
        {
            var _local_2:Object = this._1096322398resList;
            if (_local_2 !== _arg_1)
            {
                this._1096322398resList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resList", _local_2, _arg_1));
            };
        }

        private function _HelpPanel_Object3_i():Object
        {
            var _local_1:Object = {
                "label":"B",
                "data":null
            };
            _HelpPanel_Object3 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object3", _HelpPanel_Object3);
            return (_local_1);
        }

        private function _HelpPanel_Object25_i():Object
        {
            var _local_1:Object = {
                "label":"CTRL+↓",
                "data":null
            };
            _HelpPanel_Object25 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object25", _HelpPanel_Object25);
            return (_local_1);
        }

        public function set dataTree(_arg_1:ButtonTree):void
        {
            var _local_2:Object = this._1789063784dataTree;
            if (_local_2 !== _arg_1)
            {
                this._1789063784dataTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataTree", _local_2, _arg_1));
            };
        }

        private function errorInfo(_arg_1:Event):void
        {
            removeLoaderEvent((_arg_1.target as URLLoader));
        }

        public function __tab_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        private function _HelpPanel_Object13_i():Object
        {
            var _local_1:Object = {
                "label":"D",
                "data":null
            };
            _HelpPanel_Object13 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object13", _HelpPanel_Object13);
            return (_local_1);
        }

        private function startTransport(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                core.view.getUI(ViewManager.POPU_WAIT).showText(Language.HELPPANEL_S[2]);
                core.view.getUI(ViewManager.POPU_WAIT).showTime(20);
                setTimeout(transport, 20000);
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((_arg_1 == true) && (firstTimeFlag == 0)))
            {
                firstTimeFlag = 1;
                initView();
            };
        }

        public function set selectTextArea(_arg_1:IntroText):void
        {
            var _local_2:Object = this._51902346selectTextArea;
            if (_local_2 !== _arg_1)
            {
                this._51902346selectTextArea = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectTextArea", _local_2, _arg_1));
            };
        }

        private function tabClick(_arg_1:uint):void
        {
            tabBtn0.selected = false;
            tabBtn1.selected = false;
            tabBtn2.selected = false;
            tabBtn3.selected = false;
            this[("tabBtn" + _arg_1)].selected = true;
            tab.selectedIndex = _arg_1;
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        [Bindable(event="propertyChange")]
        public function get searchText():TextInput
        {
            return (this._710472971searchText);
        }

        public function __dataTree_itemClick(_arg_1:ListEvent):void
        {
            treeClickHandle(_arg_1);
        }

        private function _HelpPanel_Object2_i():Object
        {
            var _local_1:Object = {
                "label":"W",
                "data":null
            };
            _HelpPanel_Object2 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object2", _HelpPanel_Object2);
            return (_local_1);
        }

        private function xmlLoaded(_arg_1:Event):void
        {
            removeLoaderEvent((_arg_1.target as URLLoader));
            xmlHelp = XML(_arg_1.target.data).nodes;
            csurl = XML(_arg_1.target.data).csurl.@add;
            if (GamePredef.bbsurl)
            {
                bbsurl = GamePredef.bbsurl;
            }
            else
            {
                bbsurl = XML(_arg_1.target.data).url.@add;
            };
        }

        private function _HelpPanel_Object24_i():Object
        {
            var _local_1:Object = {
                "label":"CTRL+↑",
                "data":null
            };
            _HelpPanel_Object24 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object24", _HelpPanel_Object24);
            return (_local_1);
        }

        public function ___HelpPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function changeVisble(_arg_1:String):void
        {
            visible = (!(visible));
            str = _arg_1;
            if (visible)
            {
                setTimeout(autoClick, 100);
            };
        }

        [Bindable(event="propertyChange")]
        public function get shortCuts():DataGrid
        {
            return (this._2028527347shortCuts);
        }

        public function init():void
        {
            helpInitialize();
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

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function autoClick():void
        {
            var _local_1:String = str;
            var _local_2:Number = Number((_local_1.charAt(0) + _local_1.charAt(1)));
            var _local_3:Number = Number((_local_1.charAt(2) + _local_1.charAt(3)));
            var _local_4:XML = xmlHelp.child("node")[(_local_2 - 1)];
            var _local_5:XML = _local_4.child("node")[(_local_3 - 1)];
            dataTree.expandChildrenOf(_local_4, true);
            dataTree.selectedItem = _local_5;
            var _local_6:* = dataTree.selectedIndex;
            if (_local_6 >= 0)
            {
                dataTree.scrollToIndex(_local_6);
            };
            selectTextArea.htmlText = (dataTree.selectedItem as XML).@data;
        }

        public function set tabBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141555tabBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1554141555tabBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn4", _local_2, _arg_1));
            };
        }

        private function removeLoaderEvent(_arg_1:URLLoader):void
        {
            _arg_1.removeEventListener(IOErrorEvent.IO_ERROR, errorInfo);
            _arg_1.removeEventListener(Event.COMPLETE, xmlLoaded);
        }

        private function _HelpPanel_Object12_i():Object
        {
            var _local_1:Object = {
                "label":"X",
                "data":null
            };
            _HelpPanel_Object12 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object12", _HelpPanel_Object12);
            return (_local_1);
        }

        public function set tabBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        private function transport():void
        {
            core.view.hide(ViewManager.POPU_WAIT);
            if (core.state == GamePredef.ST_CORE_NORMAL)
            {
                core.remote.toMovable();
            }
            else
            {
                core.sysMidNote(Language.HELPPANEL_S[3]);
            };
        }

        public function set tab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._114581tab;
            if (_local_2 !== _arg_1)
            {
                this._114581tab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab", _local_2, _arg_1));
            };
        }

        private function alertTransport():void
        {
            if (core.state == GamePredef.ST_CORE_NORMAL)
            {
                Alert.show(Language.HELPPANEL_S[1], "", (Alert.YES | Alert.NO), null, startTransport);
            };
        }

        private function _HelpPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HelpPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_HelpPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HelpPanel_Canvas1.label = _arg_1;
            }, "_HelpPanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (xmlHelp);
            }, function (_arg_1:Object):void
            {
                dataTree.dataProvider = _arg_1;
            }, "dataTree.dataProvider");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HelpPanel_Canvas3.label = _arg_1;
            }, "_HelpPanel_Canvas3.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HelpPanel_BasicGlowButton1.label = _arg_1;
            }, "_HelpPanel_BasicGlowButton1.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HelpPanel_Canvas5.label = _arg_1;
            }, "_HelpPanel_Canvas5.label");
            result[5] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[4]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object1.data = _arg_1;
            }, "_HelpPanel_Object1.data");
            result[6] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[5]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object2.data = _arg_1;
            }, "_HelpPanel_Object2.data");
            result[7] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[6]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object3.data = _arg_1;
            }, "_HelpPanel_Object3.data");
            result[8] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[7]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object4.data = _arg_1;
            }, "_HelpPanel_Object4.data");
            result[9] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[8]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object5.data = _arg_1;
            }, "_HelpPanel_Object5.data");
            result[10] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[9]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object6.data = _arg_1;
            }, "_HelpPanel_Object6.data");
            result[11] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[10]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object7.data = _arg_1;
            }, "_HelpPanel_Object7.data");
            result[12] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[44]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object8.data = _arg_1;
            }, "_HelpPanel_Object8.data");
            result[13] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[47]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object9.data = _arg_1;
            }, "_HelpPanel_Object9.data");
            result[14] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[11]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object10.data = _arg_1;
            }, "_HelpPanel_Object10.data");
            result[15] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[12]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object11.data = _arg_1;
            }, "_HelpPanel_Object11.data");
            result[16] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[13]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object12.data = _arg_1;
            }, "_HelpPanel_Object12.data");
            result[17] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[14]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object13.data = _arg_1;
            }, "_HelpPanel_Object13.data");
            result[18] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[15]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object14.data = _arg_1;
            }, "_HelpPanel_Object14.data");
            result[19] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[16]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object15.data = _arg_1;
            }, "_HelpPanel_Object15.data");
            result[20] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[17]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object16.data = _arg_1;
            }, "_HelpPanel_Object16.data");
            result[21] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[18]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object17.data = _arg_1;
            }, "_HelpPanel_Object17.data");
            result[22] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[19]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object18.data = _arg_1;
            }, "_HelpPanel_Object18.data");
            result[23] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[20]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object19.data = _arg_1;
            }, "_HelpPanel_Object19.data");
            result[24] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[21]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object20.data = _arg_1;
            }, "_HelpPanel_Object20.data");
            result[25] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[22]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object21.data = _arg_1;
            }, "_HelpPanel_Object21.data");
            result[26] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[45]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object22.data = _arg_1;
            }, "_HelpPanel_Object22.data");
            result[27] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[46]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object23.data = _arg_1;
            }, "_HelpPanel_Object23.data");
            result[28] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[23]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object24.data = _arg_1;
            }, "_HelpPanel_Object24.data");
            result[29] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[24]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object25.data = _arg_1;
            }, "_HelpPanel_Object25.data");
            result[30] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[31]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object26.label = _arg_1;
            }, "_HelpPanel_Object26.label");
            result[31] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[25]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object26.data = _arg_1;
            }, "_HelpPanel_Object26.data");
            result[32] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[32]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object27.label = _arg_1;
            }, "_HelpPanel_Object27.label");
            result[33] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[26]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object27.data = _arg_1;
            }, "_HelpPanel_Object27.data");
            result[34] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[33]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object28.label = _arg_1;
            }, "_HelpPanel_Object28.label");
            result[35] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[27]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object28.data = _arg_1;
            }, "_HelpPanel_Object28.data");
            result[36] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[34]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object29.label = _arg_1;
            }, "_HelpPanel_Object29.label");
            result[37] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[28]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object29.data = _arg_1;
            }, "_HelpPanel_Object29.data");
            result[38] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[35]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object30.label = _arg_1;
            }, "_HelpPanel_Object30.label");
            result[39] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[29]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object30.data = _arg_1;
            }, "_HelpPanel_Object30.data");
            result[40] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[36]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object31.label = _arg_1;
            }, "_HelpPanel_Object31.label");
            result[41] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.HELPPANEL_S[30]);
            }, function (_arg_1:*):void
            {
                _HelpPanel_Object31.data = _arg_1;
            }, "_HelpPanel_Object31.data");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_S[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HelpPanel_DataGridColumn1.headerText = _arg_1;
            }, "_HelpPanel_DataGridColumn1.headerText");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_S[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HelpPanel_DataGridColumn2.headerText = _arg_1;
            }, "_HelpPanel_DataGridColumn2.headerText");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                contactGMCanvas.label = _arg_1;
            }, "contactGMCanvas.label");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_S[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HelpPanel_LinkButton1.label = _arg_1;
            }, "_HelpPanel_LinkButton1.label");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HELPPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HelpPanel_BasicGlowButton7.label = _arg_1;
            }, "_HelpPanel_BasicGlowButton7.label");
            result[52] = binding;
            return (result);
        }

        public function tabBtnClick(_arg_1:int):void
        {
            if (((_arg_1 == 3) && (submitQuestionEnable == false)))
            {
                gotoCustomerCenter();
                return;
            };
            tab.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= (tab.numChildren - 1))
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

        private function _HelpPanel_Object9_i():Object
        {
            var _local_1:Object = {
                "label":"F",
                "data":null
            };
            _HelpPanel_Object9 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object9", _HelpPanel_Object9);
            return (_local_1);
        }

        private function _HelpPanel_Object23_i():Object
        {
            var _local_1:Object = {
                "label":"Z",
                "data":null
            };
            _HelpPanel_Object23 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object23", _HelpPanel_Object23);
            return (_local_1);
        }

        private function _HelpPanel_Object1_i():Object
        {
            var _local_1:Object = {
                "label":"C",
                "data":null
            };
            _HelpPanel_Object1 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object1", _HelpPanel_Object1);
            return (_local_1);
        }

        private function treeClickHandle(_arg_1:Event):void
        {
            var _local_2:*;
            trace(("item:" + dataTree.selectedItem));
            if (dataTree.selectedItem)
            {
                if ((dataTree.selectedItem as XML).children().length() > 0)
                {
                    for each (_local_2 in dataTree.openItems)
                    {
                        if (dataTree.selectedItem != _local_2)
                        {
                            dataTree.expandItem(_local_2, false);
                        };
                    };
                    dataTree.expandItem(dataTree.selectedItem, (!(dataTree.isItemOpen(dataTree.selectedItem))));
                };
            };
            selectTextArea.htmlText = (_arg_1.target.selectedItem as XML).@data;
        }

        [Bindable(event="propertyChange")]
        public function get resList():List
        {
            return (this._1096322398resList);
        }

        private function _HelpPanel_Object11_i():Object
        {
            var _local_1:Object = {
                "label":"T",
                "data":null
            };
            _HelpPanel_Object11 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object11", _HelpPanel_Object11);
            return (_local_1);
        }

        private function _HelpPanel_Object19_i():Object
        {
            var _local_1:Object = {
                "label":"I",
                "data":null
            };
            _HelpPanel_Object19 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object19", _HelpPanel_Object19);
            return (_local_1);
        }

        public function selectAIConf():void
        {
            var _local_1:*;
            var _local_2:int;
            var _local_3:*;
            var _local_4:XML;
            var _local_5:XML;
            this.tabBtnClick(0);
            for each (_local_1 in dataTree.openItems)
            {
                dataTree.expandItem(_local_1, false);
            };
            _local_2 = xmlHelp.children().length();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                if (xmlHelp.child("node")[_local_3].@id == "21")
                {
                    _local_4 = (xmlHelp.child("node")[_local_3] as XML);
                    dataTree.selectedItem = _local_4;
                    _local_2 = _local_4.children().length();
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        if (_local_4.child("node")[_local_3].@id == "2105")
                        {
                            _local_5 = _local_4.child("node")[_local_3];
                            selectTextArea.htmlText = _local_5.@data;
                            break;
                        };
                        _local_3++;
                    };
                    return;
                };
                _local_3++;
            };
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            ViewManager.getInstance().show(ViewManager.POPU_UIHELP);
        }

        private function _HelpPanel_Object8_i():Object
        {
            var _local_1:Object = {
                "label":"R",
                "data":null
            };
            _HelpPanel_Object8 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object8", _HelpPanel_Object8);
            return (_local_1);
        }

        private function _HelpPanel_Object22_i():Object
        {
            var _local_1:Object = {
                "label":"O",
                "data":null
            };
            _HelpPanel_Object22 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object22", _HelpPanel_Object22);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:HelpPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _HelpPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_HelpPanelWatcherSetupUtil");
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

        public function __resList_change(_arg_1:ListEvent):void
        {
            clickSearchHandle(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        private function clickSearchHandle(_arg_1:Event):void
        {
            searchedContent.htmlText = _arg_1.target.selectedItem.data;
        }

        private function _HelpPanel_Object10_i():Object
        {
            var _local_1:Object = {
                "label":"A",
                "data":null
            };
            _HelpPanel_Object10 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object10", _HelpPanel_Object10);
            return (_local_1);
        }

        private function _HelpPanel_Object18_i():Object
        {
            var _local_1:Object = {
                "label":"P",
                "data":null
            };
            _HelpPanel_Object18 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object18", _HelpPanel_Object18);
            return (_local_1);
        }

        private function helpInitialize():void
        {
            var _local_1:URLLoader = new URLLoader();
            _local_1.addEventListener(IOErrorEvent.IO_ERROR, errorInfo);
            _local_1.addEventListener(Event.COMPLETE, xmlLoaded);
            _local_1.load(new URLRequest(GamePredef.HELP_PANEL_XML_LINK));
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        private function _HelpPanel_Object21_i():Object
        {
            var _local_1:Object = {
                "label":"N",
                "data":null
            };
            _HelpPanel_Object21 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object21", _HelpPanel_Object21);
            return (_local_1);
        }

        private function _HelpPanel_Object7_i():Object
        {
            var _local_1:Object = {
                "label":"E",
                "data":null
            };
            _HelpPanel_Object7 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object7", _HelpPanel_Object7);
            return (_local_1);
        }

        private function _HelpPanel_Object29_i():Object
        {
            var _local_1:Object = {
                "label":null,
                "data":null
            };
            _HelpPanel_Object29 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object29", _HelpPanel_Object29);
            return (_local_1);
        }

        override public function completeHandler(_arg_1:FlexEvent):void
        {
            removeEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                core.player.normalView.pause();
                return;
            };
            callLater(core.player.normalView.resume);
        }

        private function _HelpPanel_Object17_i():Object
        {
            var _local_1:Object = {
                "label":"V",
                "data":null
            };
            _HelpPanel_Object17 = _local_1;
            BindingManager.executeBindings(this, "_HelpPanel_Object17", _HelpPanel_Object17);
            return (_local_1);
        }

        private function set xmlHelp(_arg_1:XMLList):void
        {
            var _local_2:Object = this._1946144776xmlHelp;
            if (_local_2 !== _arg_1)
            {
                this._1946144776xmlHelp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xmlHelp", _local_2, _arg_1));
            };
        }

        public function set searchText(_arg_1:TextInput):void
        {
            var _local_2:Object = this._710472971searchText;
            if (_local_2 !== _arg_1)
            {
                this._710472971searchText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchText", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

