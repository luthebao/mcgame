// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MysteryFurnace

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.ClickSlot;
    import com.qeedoo.ui.view.comp.PageSelectorOnly;
    import mx.controls.Label;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.FilterButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.containers.Tile;
    import mx.containers.VBox;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.utils.ChangeWatcher;
    import flash.net.Responder;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.event.DressEvent;
    import mx.managers.PopUpManager;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.CloseEvent;
    import flash.events.Event;
    import com.qeedoo.game.event.GameDataEvent;
    import com.qeedoo.game.data.GameData;
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

    public class MysteryFurnace extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const ITEM_PAGE_NUM:int = 18;
        private const SCORE_PAGE_NUM:int = 5;
        private const ITEM_TYPE:int = 1;
        private var _1584105757viewStack:ViewStack;
        private var _109532662slot4:ClickSlot;
        private var _1078781073scoreSelector:PageSelectorOnly;
        private var _scoreMetaDict:Object;
        private var _1080577661crystalText:Label;
        private var _109532659slot1:ClickSlot;
        private var _109532667slot9:ClickSlot;
        private var _scoreChanging:Boolean;
        private var _899454813slot16:ClickSlot;
        private var _899454817slot12:ClickSlot;
        private var _271682174mysteryItem4:MysteryItem;
        private var _1820004370itemSelector:PageSelectorOnly;
        private var _271682178mysteryItem0:MysteryItem;
        private var _271682176mysteryItem2:MysteryItem;
        private var _109532664slot6:ClickSlot;
        private var _alert:Alert;
        private var _899454818slot11:ClickSlot;
        private var _109532661slot3:ClickSlot;
        public var _MysteryFurnace_BasicTitleCanvas1:BasicTitleCanvas;
        private var _899454814slot15:ClickSlot;
        private var _itemMetaDict:Object;
        private var _803559802pageTab:HButtonTab;
        private var _109532658slot0:ClickSlot;
        private var _109532666slot8:ClickSlot;
        private var _itemChanging:Boolean;
        private var _109532663slot5:ClickSlot;
        private var _871500217introText:IntroText;
        public var _MysteryFurnace_Label1:Label;
        public var _MysteryFurnace_Label2:Label;
        private var _899454815slot14:ClickSlot;
        private var _271682175mysteryItem3:MysteryItem;
        private var _899454819slot10:ClickSlot;
        private var _271682177mysteryItem1:MysteryItem;
        private var _109532660slot2:ClickSlot;
        private var _itemDict:Object;
        private var _109532665slot7:ClickSlot;
        public var _MysteryFurnace_FilterButton1:FilterButton;
        public var _MysteryFurnace_FilterButton2:FilterButton;
        private var _scoreDict:Object;
        private var _899454816slot13:ClickSlot;
        private var _899454812slot17:ClickSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":350,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MysteryFurnace_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTab",
                        "events":{"tabChanged":"__pageTab_tabChanged"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":40,
                                "selectedIndex":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "x":15,
                                "y":59,
                                "width":320,
                                "height":375,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "clipContent":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"viewStack",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":116,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "width":300,
                                                        "height":180,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "clipContent":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_MysteryFurnace_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":8});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 6;
                                                                this.verticalGap = 6;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "direction":"horizontal",
                                                                    "width":240,
                                                                    "height":120,
                                                                    "y":30,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot14",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot16",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ClickSlot,
                                                                        "id":"slot17",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"clickCall":onItemClick});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelectorOnly,
                                                            "id":"itemSelector",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":150,
                                                                    "changeCall":updatePageOne
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
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "clipContent":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_MysteryFurnace_Label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":8});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 2;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":30,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":MysteryItem,
                                                                        "id":"mysteryItem0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "changeCall":onScoreChange,
                                                                                "visible":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MysteryItem,
                                                                        "id":"mysteryItem1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "changeCall":onScoreChange,
                                                                                "visible":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MysteryItem,
                                                                        "id":"mysteryItem2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "changeCall":onScoreChange,
                                                                                "visible":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MysteryItem,
                                                                        "id":"mysteryItem3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "changeCall":onScoreChange,
                                                                                "visible":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MysteryItem,
                                                                        "id":"mysteryItem4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "changeCall":onScoreChange,
                                                                                "visible":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelectorOnly,
                                                            "id":"scoreSelector",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":150,
                                                                    "changeCall":updatePageTwo
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
                        "type":IntroText,
                        "id":"introText",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":70,
                                "width":300,
                                "height":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"crystalText",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.color = 0xFFFF;
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":365});
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"_MysteryFurnace_FilterButton1",
                        "events":{"click":"___MysteryFurnace_FilterButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":115,
                                "y":390,
                                "height":23,
                                "styleName":"BtnStdGreen"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"_MysteryFurnace_FilterButton2",
                        "events":{"click":"___MysteryFurnace_FilterButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":180,
                                "y":390,
                                "height":23,
                                "styleName":"BtnStdGreen"
                            });
                        }
                    })]
                });
            }
        });
        private var _dm:DataManager = DataManager.getInstance();
        private var _core:Core = Core.getInstance();
        private var _watcherDict:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MysteryFurnace()
        {
            mx_internal::_document = this;
            this.width = 350;
            this.height = 450;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MysteryFurnace._watcherSetupUtil = _arg_1;
        }


        public function set mysteryItem2(_arg_1:MysteryItem):void
        {
            var _local_2:Object = this._271682176mysteryItem2;
            if (_local_2 !== _arg_1)
            {
                this._271682176mysteryItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysteryItem2", _local_2, _arg_1));
            };
        }

        public function set mysteryItem0(_arg_1:MysteryItem):void
        {
            var _local_2:Object = this._271682178mysteryItem0;
            if (_local_2 !== _arg_1)
            {
                this._271682178mysteryItem0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysteryItem0", _local_2, _arg_1));
            };
        }

        public function set crystalText(_arg_1:Label):void
        {
            var _local_2:Object = this._1080577661crystalText;
            if (_local_2 !== _arg_1)
            {
                this._1080577661crystalText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "crystalText", _local_2, _arg_1));
            };
        }

        public function set slot1(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function set slot7(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
        }

        public function set mysteryItem4(_arg_1:MysteryItem):void
        {
            var _local_2:Object = this._271682174mysteryItem4;
            if (_local_2 !== _arg_1)
            {
                this._271682174mysteryItem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysteryItem4", _local_2, _arg_1));
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

        public function set mysteryItem1(_arg_1:MysteryItem):void
        {
            var _local_2:Object = this._271682177mysteryItem1;
            if (_local_2 !== _arg_1)
            {
                this._271682177mysteryItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysteryItem1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot5():ClickSlot
        {
            return (this._109532663slot5);
        }

        [Bindable(event="propertyChange")]
        public function get viewStack():ViewStack
        {
            return (this._1584105757viewStack);
        }

        [Bindable(event="propertyChange")]
        public function get slot9():ClickSlot
        {
            return (this._109532667slot9);
        }

        [Bindable(event="propertyChange")]
        public function get slot1():ClickSlot
        {
            return (this._109532659slot1);
        }

        private function onItemClick(_arg_1:ClickSlot):void
        {
            var _local_2:Object = _arg_1.slotData;
            _itemDict[_local_2.id] = ((_arg_1.selected) ? _local_2 : null);
            this.updateTotal();
        }

        [Bindable(event="propertyChange")]
        public function get slot3():ClickSlot
        {
            return (this._109532661slot3);
        }

        [Bindable(event="propertyChange")]
        public function get slot4():ClickSlot
        {
            return (this._109532662slot4);
        }

        [Bindable(event="propertyChange")]
        public function get itemSelector():PageSelectorOnly
        {
            return (this._1820004370itemSelector);
        }

        public function set mysteryItem3(_arg_1:MysteryItem):void
        {
            var _local_2:Object = this._271682175mysteryItem3;
            if (_local_2 !== _arg_1)
            {
                this._271682175mysteryItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysteryItem3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot7():ClickSlot
        {
            return (this._109532665slot7);
        }

        public function set slot8(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        private function scoreStrategy():void
        {
            var _local_4:Object;
            var _local_5:Number;
            var _local_1:Array = Language.MYSTERY_FURNACE_PANEL[8];
            var _local_2:int = _local_1.length;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = _local_1[_local_3];
                _local_5 = 0;
                _scoreDict[_local_4.type] = _local_5;
                _local_3++;
            };
        }

        private function _MysteryFurnace_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MYSTERY_FURNACE_PANEL[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.MYSTERY_FURNACE_PANEL[1];
            _local_1 = pageTab.selectedIndex;
            _local_1 = Language.MYSTERY_FURNACE_PANEL[2];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.MYSTERY_FURNACE_PANEL[5];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.MYSTERY_FURNACE_PANEL[4];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.TRAIN_SOUL_PANEL[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function set scoreSelector(_arg_1:PageSelectorOnly):void
        {
            var _local_2:Object = this._1078781073scoreSelector;
            if (_local_2 !== _arg_1)
            {
                this._1078781073scoreSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreSelector", _local_2, _arg_1));
            };
        }

        public function set itemSelector(_arg_1:PageSelectorOnly):void
        {
            var _local_2:Object = this._1820004370itemSelector;
            if (_local_2 !== _arg_1)
            {
                this._1820004370itemSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemSelector", _local_2, _arg_1));
            };
        }

        public function set slot9(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
        }

        public function set slot4(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
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

        private function updatePageTwo():void
        {
            var _local_5:int;
            var _local_6:MysteryItem;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Number;
            var _local_1:Array = Language.MYSTERY_FURNACE_PANEL[8];
            scoreSelector.totalPage = Math.ceil((_local_1.length / SCORE_PAGE_NUM));
            var _local_2:int = (SCORE_PAGE_NUM * (scoreSelector.curPage - 1));
            var _local_3:int = (_local_2 + SCORE_PAGE_NUM);
            var _local_4:int = _local_2;
            while (_local_4 < _local_3)
            {
                _local_5 = (_local_4 - _local_2);
                _local_6 = this[("mysteryItem" + _local_5)];
                if (!_local_1[_local_4])
                {
                    _local_6.cleanView();
                }
                else
                {
                    _local_7 = _local_1[_local_4];
                    _local_8 = _watcherDict[_local_7.type];
                    _local_9 = ((_scoreDict[_local_7.type]) || (0));
                    _local_6.updateView(_local_4, _local_9);
                };
                _local_4++;
            };
        }

        public function set slot12(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        override public function hide():void
        {
            var _local_1:String;
            var _local_2:ChangeWatcher;
            super.hide();
            _core.data.removeEventListener(GamePredef.EVENT_REFRESH_FUNCSLOTS, onItemChange);
            for (_local_1 in _watcherDict)
            {
                _local_2 = _watcherDict[_local_1].watcher;
                if (_local_2)
                {
                    _local_2.unwatch();
                    _local_2 = null;
                };
            };
            _watcherDict = {};
        }

        public function set slot11(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        public function set slot15(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        public function set slot13(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function set slot10(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        private function updatePageOne():void
        {
            var initSlot:Function;
            if (!_dm.sInited)
            {
                initSlot = function (_arg_1:Object):void
                {
                    _dm.initSlotData(_arg_1);
                    updateItems();
                };
                _core.remote.call("getInitSlot", new Responder(initSlot));
                return;
            };
            this.updateItems();
        }

        public function set slot17(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        public function set slot14(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
        }

        private function updateItems():void
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:ClickSlot;
            var _local_1:Array = [];
            for each (_local_2 in _dm.sList)
            {
                if ((((ToolKit.isBigThan(_local_2.sid, GamePredef.SLOT_SID_BAG[0])) && (ToolKit.isSmallOrEqual(_local_2.sid, GamePredef.SLOT_SID_BAG[_core.player.bagSlotNum]))) || ((ToolKit.isBigThan(_local_2.sid, GamePredef.SLOT_SID_BAG[7])) && (ToolKit.isSmallOrEqual(_local_2.sid, GamePredef.SLOT_SID_BAG[8])))))
                {
                    if (_local_2.type == GamePredef.TBL_ITEM_INSTANCE)
                    {
                        if (_core.data.hasData(_local_2.type, _local_2.itemId))
                        {
                            _local_6 = _core.data.getGameData(_local_2.type, _local_2.itemId);
                            if (!(((!(_local_6)) || (!(_itemMetaDict[_local_6.tid]))) || (!(_itemMetaDict[_local_6.tid][_local_6.color]))))
                            {
                                _local_1.push(_local_2);
                            };
                        };
                    };
                };
            };
            _local_1.sortOn("sid", Array.NUMERIC);
            itemSelector.totalPage = Math.ceil((_local_1.length / ITEM_PAGE_NUM));
            _local_3 = (ITEM_PAGE_NUM * (itemSelector.curPage - 1));
            _local_4 = (_local_3 + ITEM_PAGE_NUM);
            _local_5 = _local_3;
            while (_local_5 < _local_4)
            {
                _local_7 = (_local_5 - _local_3);
                _local_8 = this[("slot" + _local_7)];
                if (!_local_1[_local_5])
                {
                    _local_8.clean();
                }
                else
                {
                    _local_2 = _local_1[_local_5];
                    _local_8.slotData = _local_2;
                    _local_8.type = _local_2.type;
                    _local_8.giid = _local_2.itemId;
                    _local_8.stackNum = _local_2.stackNum;
                    _local_8.selected = _itemDict[_local_2.id];
                };
                _local_5++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysteryItem2():MysteryItem
        {
            return (this._271682176mysteryItem2);
        }

        private function onExchangeItem(_arg_1:Object=null):void
        {
            _itemChanging = false;
            if (!_arg_1)
            {
                return;
            };
            _itemDict = {};
            _core.player.mysteryCrystal = _arg_1.num;
            this.updatePageOne();
            this.updateTotal();
        }

        private function onScoreChange(_arg_1:MysteryItem):void
        {
            _scoreDict[_arg_1.scoreType] = _arg_1.getInput();
            this.updateTotal();
        }

        [Bindable(event="propertyChange")]
        public function get mysteryItem0():MysteryItem
        {
            return (this._271682178mysteryItem0);
        }

        [Bindable(event="propertyChange")]
        public function get mysteryItem1():MysteryItem
        {
            return (this._271682177mysteryItem1);
        }

        [Bindable(event="propertyChange")]
        public function get mysteryItem3():MysteryItem
        {
            return (this._271682175mysteryItem3);
        }

        public function ___MysteryFurnace_FilterButton1_click(_arg_1:MouseEvent):void
        {
            exchangeHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get crystalText():Label
        {
            return (this._1080577661crystalText);
        }

        public function set slot16(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        override public function initialize():void
        {
            var target:MysteryFurnace;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MysteryFurnace_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MysteryFurnaceWatcherSetupUtil");
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
        public function get mysteryItem4():MysteryItem
        {
            return (this._271682174mysteryItem4);
        }

        private function watchScoreChange(_arg_1:PropertyChangeEvent):void
        {
            var _local_6:MysteryItem;
            if (((!(this.initialized)) || (_scoreChanging)))
            {
                return;
            };
            var _local_2:Object = _watcherDict[_arg_1.property];
            var _local_3:Object = Language.MYSTERY_FURNACE_PANEL[8][_local_2.index];
            var _local_4:Number = 0;
            _scoreDict[_local_3.type] = _local_4;
            var _local_5:int;
            while (_local_5 < SCORE_PAGE_NUM)
            {
                _local_6 = this[("mysteryItem" + _local_5)];
                if (_local_6.scoreType == _local_3.type)
                {
                    _local_6.updateView(_local_2.index, _scoreDict[_local_3.type]);
                    break;
                };
                _local_5++;
            };
            this.updateTotal();
        }

        public function __pageTab_tabChanged(_arg_1:DressEvent):void
        {
            tabHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot11():ClickSlot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get scoreSelector():PageSelectorOnly
        {
            return (this._1078781073scoreSelector);
        }

        [Bindable(event="propertyChange")]
        public function get slot14():ClickSlot
        {
            return (this._899454815slot14);
        }

        [Bindable(event="propertyChange")]
        public function get slot15():ClickSlot
        {
            return (this._899454814slot15);
        }

        private function exchangeHandler(event:Event):void
        {
            var itemDict:Object;
            var slotId:String;
            var itemCheckPass:Function;
            var scoreEmpty:Boolean;
            var scoreType:String;
            var scoreCheckPass:Function;
            event.stopImmediatePropagation();
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            if (pageTab.selectedIndex == 0)
            {
                itemDict = null;
                for (slotId in _itemDict)
                {
                    if (_itemDict[slotId])
                    {
                        itemDict = ((itemDict) || ({}));
                        itemDict[slotId] = true;
                    };
                };
                if (!itemDict)
                {
                    _core.sysMidNote(Language.MYSTERY_FURNACE_PANEL[13]);
                    return;
                };
                itemCheckPass = function (event:CloseEvent):void
                {
                    if (event.detail == Alert.NO)
                    {
                        return;
                    };
                    var itemHandler:Function = function (_arg_1:String):void
                    {
                        if (!_arg_1)
                        {
                            return;
                        };
                        _itemChanging = true;
                        var _local_2:String = MD5.hash(_arg_1);
                        _core.remote.call("MysteryExchangeItem", new Responder(onExchangeItem), itemDict, _local_2);
                    };
                    if (!_core.delPass)
                    {
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.MYSTERY_FURNACE_PANEL[4], itemHandler);
                        return;
                    };
                    _itemChanging = true;
                    _core.remote.call("MysteryExchangeItem", new Responder(onExchangeItem), itemDict, _core.delPass);
                };
                _alert = Alert.show(Language.MYSTERY_FURNACE_PANEL[14], "", (Alert.YES | Alert.NO), null, itemCheckPass);
            }
            else
            {
                if (pageTab.selectedIndex == 1)
                {
                    scoreEmpty = true;
                    for (scoreType in _scoreDict)
                    {
                        if (((_scoreDict[scoreType]) && (Number(_scoreDict[scoreType]) > 0)))
                        {
                            scoreEmpty = false;
                            break;
                        };
                    };
                    if (scoreEmpty)
                    {
                        _core.sysMidNote(Language.MYSTERY_FURNACE_PANEL[11]);
                        return;
                    };
                    scoreCheckPass = function (event:CloseEvent):void
                    {
                        if (event.detail == Alert.NO)
                        {
                            return;
                        };
                        var scoreHandler:Function = function (_arg_1:String):void
                        {
                            if (!_arg_1)
                            {
                                return;
                            };
                            _scoreChanging = true;
                            var _local_2:String = MD5.hash(_arg_1);
                            _core.remote.call("MysteryExchangeScore", new Responder(onExchangeScore), _scoreDict, _local_2);
                        };
                        if (!_core.delPass)
                        {
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.MYSTERY_FURNACE_PANEL[4], scoreHandler);
                            return;
                        };
                        _scoreChanging = true;
                        _core.remote.call("MysteryExchangeScore", new Responder(onExchangeScore), _scoreDict, _core.delPass);
                    };
                    _alert = Alert.show(Language.MYSTERY_FURNACE_PANEL[12], "", (Alert.YES | Alert.NO), null, scoreCheckPass);
                };
            };
        }

        private function onExchangeScore(_arg_1:Object=null):void
        {
            _scoreChanging = false;
            if (!_arg_1)
            {
                return;
            };
            _core.player.mysteryCrystal = _arg_1.num;
            this.scoreStrategy();
            this.updatePageTwo();
            this.updateTotal();
        }

        public function set introText(_arg_1:IntroText):void
        {
            var _local_2:Object = this._871500217introText;
            if (_local_2 !== _arg_1)
            {
                this._871500217introText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot10():ClickSlot
        {
            return (this._899454819slot10);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():ClickSlot
        {
            return (this._899454817slot12);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():ClickSlot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get slot17():ClickSlot
        {
            return (this._899454812slot17);
        }

        [Bindable(event="propertyChange")]
        public function get slot8():ClickSlot
        {
            return (this._109532666slot8);
        }

        [Bindable(event="propertyChange")]
        public function get introText():IntroText
        {
            return (this._871500217introText);
        }

        [Bindable(event="propertyChange")]
        public function get slot16():ClickSlot
        {
            return (this._899454813slot16);
        }

        public function ___MysteryFurnace_FilterButton2_click(_arg_1:MouseEvent):void
        {
            soulHandler(_arg_1);
        }

        private function soulHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_TRAIN_SOUL);
            ((_local_2) && (_local_2.show()));
        }

        private function onItemChange(_arg_1:GameDataEvent):void
        {
            if ((((!(initialized)) || (!(visible))) || (_itemChanging)))
            {
                return;
            };
            _itemDict = {};
            itemSelector.curPage = 1;
            ((pageTab.selectedIndex == 0) && (this.updateTotal()));
            this.updatePageOne();
        }

        public function set slot0(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532658slot0;
            if (_local_2 !== _arg_1)
            {
                this._109532658slot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0", _local_2, _arg_1));
            };
        }

        public function set slot5(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        private function _MysteryFurnace_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYSTERY_FURNACE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MysteryFurnace_BasicTitleCanvas1.text = _arg_1;
            }, "_MysteryFurnace_BasicTitleCanvas1.text");
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
                return (Language.MYSTERY_FURNACE_PANEL[1]);
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
                var _local_1:* = Language.MYSTERY_FURNACE_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MysteryFurnace_Label1.text = _arg_1;
            }, "_MysteryFurnace_Label1.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _MysteryFurnace_Label1.filters = _arg_1;
            }, "_MysteryFurnace_Label1.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYSTERY_FURNACE_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MysteryFurnace_Label2.text = _arg_1;
            }, "_MysteryFurnace_Label2.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _MysteryFurnace_Label2.filters = _arg_1;
            }, "_MysteryFurnace_Label2.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                crystalText.filters = _arg_1;
            }, "crystalText.filters");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYSTERY_FURNACE_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MysteryFurnace_FilterButton1.label = _arg_1;
            }, "_MysteryFurnace_FilterButton1.label");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _MysteryFurnace_FilterButton1.filters = _arg_1;
            }, "_MysteryFurnace_FilterButton1.filters");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRAIN_SOUL_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MysteryFurnace_FilterButton2.label = _arg_1;
            }, "_MysteryFurnace_FilterButton2.label");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _MysteryFurnace_FilterButton2.filters = _arg_1;
            }, "_MysteryFurnace_FilterButton2.filters");
            result[12] = binding;
            return (result);
        }

        public function set slot6(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2():ClickSlot
        {
            return (this._109532660slot2);
        }

        private function tabHandler(_arg_1:Event=null):void
        {
            var _local_2:int = pageTab.selectedIndex;
            var _local_3:String = Language.MYSTERY_FURNACE_PANEL[((_local_2 == 0) ? 6 : 7)];
            introText.htmlText = _local_3;
            this.updateTotal();
        }

        public function set slot2(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        private function updatePage():void
        {
            var _local_1:Array;
            var _local_2:Object;
            var _local_3:String;
            var _local_4:String;
            if (!this.initialized)
            {
                this.callLater(updatePage);
                return;
            };
            _itemDict = {};
            _scoreDict = {};
            pageTab.selectedIndex = 0;
            itemSelector.curPage = 1;
            scoreSelector.curPage = 1;
            this.tabHandler();
            if (((!(_itemMetaDict)) || (!(_scoreMetaDict))))
            {
                _itemMetaDict = {};
                _scoreMetaDict = {};
                _local_1 = GameData.d[GamePredef.TBL_RECYCLING];
                for each (_local_2 in _local_1)
                {
                    if (_local_2.type == ITEM_TYPE)
                    {
                        _local_3 = _local_2.itemId;
                        _local_4 = _local_2.color;
                        if (!_itemMetaDict[_local_3])
                        {
                            _itemMetaDict[_local_3] = {};
                        };
                        _itemMetaDict[_local_3][_local_4] = _local_2;
                    }
                    else
                    {
                        _scoreMetaDict[_local_2.type] = _local_2;
                    };
                };
            };
            this.scoreStrategy();
            this.updatePageOne();
            this.updatePageTwo();
        }

        [Bindable(event="propertyChange")]
        public function get slot0():ClickSlot
        {
            return (this._109532658slot0);
        }

        private function updateTotal():void
        {
            var _local_2:String;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Array;
            var _local_7:String;
            var _local_8:Number;
            var _local_9:Object;
            var _local_1:Number = 0;
            if (pageTab.selectedIndex == 0)
            {
                for (_local_2 in _itemDict)
                {
                    _local_3 = _itemDict[_local_2];
                    if (!((!(_local_3)) || (!(_core.data.hasData(_local_3.type, _local_3.itemId)))))
                    {
                        _local_4 = _core.data.getGameData(_local_3.type, _local_3.itemId);
                        if (!(((!(_local_4)) || (!(_itemMetaDict[_local_4.tid]))) || (!(_itemMetaDict[_local_4.tid][_local_4.color]))))
                        {
                            _local_5 = _itemMetaDict[_local_4.tid][_local_4.color];
                            _local_1 = (_local_1 + (Number(_local_5.value) * Number(_local_3.stackNum)));
                        };
                    };
                };
            }
            else
            {
                if (pageTab.selectedIndex == 1)
                {
                    _local_6 = Language.MYSTERY_FURNACE_PANEL[8];
                    for (_local_7 in _scoreDict)
                    {
                        _local_8 = ((_scoreDict[_local_7]) || (0));
                        if (_scoreMetaDict[_local_7])
                        {
                            _local_9 = _scoreMetaDict[_local_7];
                            _local_1 = (_local_1 + (Number(_local_9.value) * _local_8));
                        };
                    };
                };
            };
            crystalText.text = (Language.MYSTERY_FURNACE_PANEL[3] + _local_1);
        }

        override public function show():void
        {
            var _local_4:Object;
            var _local_5:ChangeWatcher;
            super.show();
            this.updatePage();
            _core.data.addEventListener(GamePredef.EVENT_REFRESH_FUNCSLOTS, onItemChange);
            var _local_1:Array = Language.MYSTERY_FURNACE_PANEL[8];
            var _local_2:int = _local_1.length;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = _local_1[_local_3];
                _local_5 = ChangeWatcher.watch(_core.player, _local_4.score, watchScoreChange);
                _watcherDict[_local_4.score] = {
                    "index":_local_3,
                    "watcher":_local_5
                };
                _local_3++;
            };
            _itemChanging = false;
            _scoreChanging = false;
        }

        [Bindable(event="propertyChange")]
        public function get slot6():ClickSlot
        {
            return (this._109532664slot6);
        }


    }
}//package com.qeedoo.ui.view.compDragable

