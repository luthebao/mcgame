// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TempBagSlot

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.ItemSlotTempBag;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.core.Repeater;
    import mx.containers.Tile;
    import mx.controls.Text;
    import com.qeedoo.ui.view.comp.Currency;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.ItemSlotTemp;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.Event;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.binding.Binding;
    import mx.binding.RepeatableBinding;
    import com.qeedoo.ui.view.comp.ItemSlot;
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

    public class TempBagSlot extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _TempBagSlot_BasicDelayButton3:BasicDelayButton;
        public var _TempBagSlot_BasicDelayButton1:BasicDelayButton;
        private var _3773vs:ViewStack;
        public var _TempBagSlot_ItemSlotTemp1:Array;
        public var _TempBagSlot_ItemSlotTemp2:Array;
        public var last_selected:uint;
        private var _122708343mxbagSlot2:ItemSlotTempBag;
        private var _206080710btnOpen:BasicGlowButton;
        private var _2080952629bagSlot1:ItemSlotTempBag;
        private var _1509003505mxintroTxt:IntroText;
        private var tempItems:Object;
        private var _2080952625bagSlot5:ItemSlotTempBag;
        private var _2080952627bagSlot3:ItemSlotTempBag;
        public var mxlast_selected:uint;
        private var mxcurrentCost:uint;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _2113262145slotRep:Repeater;
        private var _1117107319mxslotTile:Tile;
        private var _122708346mxbagSlot5:ItemSlotTempBag;
        private var curr_bag_type:uint;
        public var firstTimeFlag:Boolean = true;
        private var _554117445mxbtnOpen:BasicGlowButton;
        private var currentCost:uint;
        private var def_can_height:uint = 400;
        private var _122708344mxbagSlot3:ItemSlotTempBag;
        private var _920352139mxnumTxt:Text;
        private var _1421506996mxslotRep:Repeater;
        private var _2080952628bagSlot2:ItemSlotTempBag;
        private var NUM_PER_PAGE:uint = 24;
        private var _915228088_TempBagSlot_Tile2:Tile;
        private var def_slot_height:uint = 174;
        private var _2080952626bagSlot4:ItemSlotTempBag;
        private var _956115763costCur:Currency;
        private var _1368045961cbDire:CheckBox;
        private var _582302820introTxt:IntroText;
        private var _122708342mxbagSlot1:ItemSlotTempBag;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _2050561200bagtitle:BasicTitleCanvas;
        private var _915228087_TempBagSlot_Tile1:Tile;
        private var slot_max:uint = 5;
        private var _607339634pageSelector:PageSelector;
        private var _1034376950numTxt:Text;
        private var _195917608mxcostCur:Currency;
        private var _122708345mxbagSlot4:ItemSlotTempBag;
        private var curr_bag_num:uint;
        private var _727277383mxpageSelector:PageSelector;
        private var _1086553652slotTile:Tile;
        public var _TempBagSlot_BasicDelayButton2:BasicDelayButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":278,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"bagtitle"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "33";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":21,
                                "width":90,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "33";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":111,
                                "width":90,
                                "selected":false,
                                "styleName":"HorizontalTab",
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vs",
                        "stylesFactory":function ():void
                        {
                            this.top = "51.2";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":278,
                                "height":350,
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"bagSlot1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":15,
                                                        "index":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"bagSlot2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "index":81
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"bagSlot3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":85,
                                                        "index":82
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"bagSlot4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":120,
                                                        "index":83
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"bagSlot5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155,
                                                        "index":84
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btnOpen",
                                                "events":{"click":"__btnOpen_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "189";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":197,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"costCur",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "211";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":202,
                                                        "width":71
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Tile,
                                                "id":"slotTile",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalGap = 4;
                                                    this.horizontalGap = 4;
                                                    this.paddingTop = 12;
                                                    this.paddingLeft = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":174,
                                                        "styleName":"CanvasBorder",
                                                        "y":158,
                                                        "width":248,
                                                        "x":15,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Repeater,
                                                            "id":"slotRep",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "true";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotTemp,
                                                                        "id":"_TempBagSlot_ItemSlotTemp1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "onDragDrop":onDragDropHandle,
                                                                                "DoubleFunc":onDoubleClick
                                                                            });
                                                                        }
                                                                    })]});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"numTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                    this.bottom = "221";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"selectable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"introTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "253.4";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":15,
                                                        "width":248,
                                                        "height":96
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_TempBagSlot_BasicDelayButton1",
                                                "events":{"click":"___TempBagSlot_BasicDelayButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "228";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":30000,
                                                        "styleName":"BtnStdRed",
                                                        "x":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"cbDire",
                                                "events":{"click":"__cbDire_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "226";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"x":80});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":322});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"mxbagSlot1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":15,
                                                        "index":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"mxbagSlot2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "index":101
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"mxbagSlot3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":85,
                                                        "index":102
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"mxbagSlot4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":120,
                                                        "index":103
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotTempBag,
                                                "id":"mxbagSlot5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155,
                                                        "index":104
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"mxbtnOpen",
                                                "events":{"click":"__mxbtnOpen_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "189";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":197,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"mxcostCur",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "211";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":202,
                                                        "width":71
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Tile,
                                                "id":"mxslotTile",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalGap = 4;
                                                    this.horizontalGap = 4;
                                                    this.paddingTop = 12;
                                                    this.paddingLeft = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "height":174,
                                                        "width":248,
                                                        "y":158,
                                                        "x":15,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Repeater,
                                                            "id":"mxslotRep",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "true";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotTemp,
                                                                        "id":"_TempBagSlot_ItemSlotTemp2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "onDragDrop":onmxDragDropHandle,
                                                                                "DoubleFunc":onmxDoubleClick
                                                                            });
                                                                        }
                                                                    })]});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"mxnumTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                    this.bottom = "221";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"selectable":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"mxintroTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "253";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":15,
                                                        "width":248,
                                                        "height":96
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_TempBagSlot_BasicDelayButton2",
                                                "events":{"click":"___TempBagSlot_BasicDelayButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "228";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":30000,
                                                        "styleName":"BtnStdRed",
                                                        "x":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_TempBagSlot_BasicDelayButton3",
                                                "events":{"click":"___TempBagSlot_BasicDelayButton3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "228";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":1000,
                                                        "styleName":"BtnStdRed",
                                                        "x":55
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"mxpageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":322});
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
        private var COST_ARR:Array = [10, 50, 100, 200, 500];
        private var _dm:DataManager = DataManager.getInstance();
        private var curr_bag_arr:ArrayCollection = new ArrayCollection();
        private var mxcurr_bag_arr:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TempBagSlot()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.fontSize = 12;
            };
            this.width = 278;
            this.height = 400;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TempBagSlot._watcherSetupUtil = _arg_1;
        }


        public function onDragDropHandle(_arg_1:Event):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:uint;
            var _local_8:uint;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:Object;
            var _local_2:* = _arg_1.target.dropSlot;
            if (_local_2)
            {
                if (_local_2.slotType == Slot.SLOT_BAG)
                {
                    if (_core.player.tBag.ot)
                    {
                        _core.sysMsg(Language.TEMP_BAG_U[2]);
                        return;
                    };
                    _local_3 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2.slotData.tid];
                    if (((_local_3) && (ToolKit.ableToTemp(_local_3))))
                    {
                        _local_4 = _arg_1.currentTarget.slotData;
                        if (((_local_4) && (_local_4.ii > 0)))
                        {
                            if (_local_4.ii == _local_3.id)
                            {
                                _local_5 = _core.data.getGameData(_local_2.type, _local_2.giid);
                                _local_6 = _core.player.tBag.tempList[_arg_1.currentTarget.posId];
                                if (((_local_5) && (_local_6)))
                                {
                                    if ((((_local_5.binded == _local_6.b) && (_local_5.color == _local_6.c)) && (ToolKit.add(_local_2.stackNum, _local_6.n) <= _local_3.stackMax)))
                                    {
                                        _core.remote.addtItemFromBag(_local_2.index, ToolKit.add((last_selected * 100), _arg_1.currentTarget.posId));
                                    };
                                };
                            };
                        }
                        else
                        {
                            _core.remote.addtItemFromBag(_local_2.index, ToolKit.add((last_selected * 100), _arg_1.currentTarget.posId));
                        };
                    }
                    else
                    {
                        _core.sysMidNote(Language.TEMP_BAG_U[3]);
                    };
                }
                else
                {
                    if (_local_2.slotType == Slot.SLOT_TEMP_SLOT)
                    {
                        _local_7 = uint(_local_2.posId);
                        _local_8 = uint(_arg_1.currentTarget.posId);
                        if (_local_7 == _local_8)
                        {
                            return;
                        };
                        _local_11 = _core.player.tBag.tempList;
                        if (((_local_11[_local_7]) && (_local_11[_local_8])))
                        {
                            _local_9 = _local_11[_local_7];
                            _local_10 = _local_11[_local_8];
                            if ((((_local_9.t == _local_10.t) && (_local_9.b == _local_10.b)) && (_local_9.c == _local_10.c)))
                            {
                                _local_12 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_9.t];
                                if (_local_12)
                                {
                                    if (_local_12.stackMax >= ToolKit.add(_local_9.n, _local_10.n))
                                    {
                                        if (ToolKit.isSmallOrEqual(_local_12.t, 0))
                                        {
                                            _core.remote.moveItemBtwTemp(_local_2.posId, _arg_1.currentTarget.posId);
                                        };
                                    };
                                };
                            };
                        }
                        else
                        {
                            if (_local_11[_local_7])
                            {
                                _core.remote.moveItemBtwTemp(_local_2.posId, _arg_1.currentTarget.posId);
                            };
                        };
                    };
                };
            };
        }

        private function onmxDoubleClick(_arg_1:*):void
        {
            var _local_2:uint;
            if (_core.player.enoughBag(1))
            {
                _local_2 = uint(_arg_1.data.currentTarget.posId);
                if (_local_2 > 0)
                {
                    _core.remote.mxtempToBag(_local_2);
                };
            };
        }

        private function mxopenSlot():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("openmxTempSlot", new Responder(onmxOpenSlot));
                };
            };
            var str:String = Language.TEMP_BAG_U[1];
            str = str.replace("{cost}", mxcurrentCost);
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        public function set numTxt(_arg_1:Text):void
        {
            var _local_2:Object = this._1034376950numTxt;
            if (_local_2 !== _arg_1)
            {
                this._1034376950numTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numTxt", _local_2, _arg_1));
            };
        }

        public function set mxintroTxt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1509003505mxintroTxt;
            if (_local_2 !== _arg_1)
            {
                this._1509003505mxintroTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxintroTxt", _local_2, _arg_1));
            };
        }

        public function set mxcostCur(_arg_1:Currency):void
        {
            var _local_2:Object = this._195917608mxcostCur;
            if (_local_2 !== _arg_1)
            {
                this._195917608mxcostCur = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxcostCur", _local_2, _arg_1));
            };
        }

        private function initTempBag():void
        {
            firstTimeFlag = false;
            cbDire.selected = Boolean(_core.player.tBag.dire);
            init();
            initBag();
        }

        public function set costCur(_arg_1:Currency):void
        {
            var _local_2:Object = this._956115763costCur;
            if (_local_2 !== _arg_1)
            {
                this._956115763costCur = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "costCur", _local_2, _arg_1));
            };
        }

        private function onOpenSlot(_arg_1:uint):void
        {
            _core.player.tBag.tempbagNum = _arg_1;
            init();
        }

        public function ___TempBagSlot_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            openAllMX();
        }

        [Bindable(event="propertyChange")]
        public function get introTxt():IntroText
        {
            return (this._582302820introTxt);
        }

        public function UpdatemxSlot(_arg_1:uint, _arg_2:Object):void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:*;
            var _local_7:uint;
            var _local_8:*;
            if (!_core.player.tBag.mx)
            {
                return;
            };
            _core.player.tBag.mx.tempList[_arg_1] = _arg_2;
            _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE).updateView();
            if (firstTimeFlag)
            {
                return;
            };
            if (_arg_2)
            {
                if (_arg_1 <= _core.player.tBag.mx.tempSlotNum)
                {
                    _local_3 = -1;
                    if (mxpageSelector.pageNo)
                    {
                        _local_3 = ((_arg_1 - (mxpageSelector.pageNo * NUM_PER_PAGE)) - 1);
                    }
                    else
                    {
                        _local_3 = (_arg_1 - 1);
                    };
                    if (((_local_3 >= 0) && (_local_3 < NUM_PER_PAGE)))
                    {
                        _local_6 = mxslotTile.getChildAt(_local_3);
                    };
                    _local_4 = new Object();
                    _local_4.type = GamePredef.TBL_ITEM_TEMPLATE;
                    _local_4.itemId = _arg_2.t;
                    _local_4.num = _arg_2.n;
                    _local_4.binded = _arg_2.b;
                    _local_4.color = _arg_2.c;
                    _local_4.sid = ("tempSlot" + _arg_1);
                    _local_4.idx = _arg_1;
                    _local_5 = new Object();
                    _local_5.ti = GamePredef.TBL_ITEM_TEMPLATE;
                    _local_5.ii = _arg_2.t;
                    _local_5.n = _arg_2.n;
                    _local_5.q = (_arg_2.c * 5);
                    _local_5.b = _arg_2.b;
                    _local_4.slotData = _local_5;
                    if (_local_6)
                    {
                        _local_6.sData = _local_4;
                    };
                    if (((_arg_1 <= mxcurr_bag_arr.length) && (mxcurr_bag_arr[(_arg_1 - 1)])))
                    {
                        mxcurr_bag_arr[(_arg_1 - 1)] = _local_4;
                    };
                };
            }
            else
            {
                if (_arg_1 > _core.player.tBag.mx.tempSlotNum)
                {
                    if (mxpageSelector.pageNo)
                    {
                        if ((mxpageSelector.pageNo * NUM_PER_PAGE) > _core.player.tBag.mx.tempSlotNum)
                        {
                            _local_7 = 0;
                            while (_local_7 <= NUM_PER_PAGE)
                            {
                                if (((mxslotTile[_local_7]) && (mxslotTile[_local_7].posId == _arg_1)))
                                {
                                    mxslotTile[_local_7].clean();
                                    if (mxcurr_bag_arr[_local_7])
                                    {
                                        mxcurr_bag_arr[_local_7].type = GamePredef.TBL_ITEM_TEMPLATE;
                                        mxcurr_bag_arr[_local_7].itemId = -1;
                                        mxcurr_bag_arr[_local_7].num = 0;
                                        mxcurr_bag_arr[_local_7].binded = 0;
                                        mxcurr_bag_arr[_local_7].color = 0;
                                        mxcurr_bag_arr[_local_7].slotData = new Object();
                                        mxcurr_bag_arr[_local_7].slotData.q = 0;
                                    };
                                    break;
                                };
                                _local_7++;
                            };
                        };
                    }
                    else
                    {
                        if (NUM_PER_PAGE > _core.player.tBag.mx.tempSlotNum)
                        {
                            _local_7 = 0;
                            while (_local_7 <= NUM_PER_PAGE)
                            {
                                _local_8 = mxslotTile.getChildAt(_local_7);
                                if (((_local_8) && (_local_8.posId == _arg_1)))
                                {
                                    _local_8.clean();
                                    if (mxcurr_bag_arr[_local_7])
                                    {
                                        mxcurr_bag_arr[_local_7].type = GamePredef.TBL_ITEM_TEMPLATE;
                                        mxcurr_bag_arr[_local_7].itemId = -1;
                                        mxcurr_bag_arr[_local_7].num = 0;
                                        mxcurr_bag_arr[_local_7].binded = 0;
                                        mxcurr_bag_arr[_local_7].color = 0;
                                        mxcurr_bag_arr[_local_7].slotData = new Object();
                                        mxcurr_bag_arr[_local_7].slotData.q = 0;
                                    };
                                    break;
                                };
                                _local_7++;
                            };
                        };
                    };
                }
                else
                {
                    _local_3 = -1;
                    if (mxpageSelector.pageNo)
                    {
                        _local_3 = ((_arg_1 - (mxpageSelector.pageNo * NUM_PER_PAGE)) - 1);
                    }
                    else
                    {
                        _local_3 = (_arg_1 - 1);
                    };
                    if (_local_3 >= 0)
                    {
                        _local_6 = mxslotTile.getChildAt(_local_3);
                    };
                    if (_local_6)
                    {
                        _local_6.clean();
                    };
                    if (((_arg_1 <= mxcurr_bag_arr.length) && (mxcurr_bag_arr[(_arg_1 - 1)])))
                    {
                        mxcurr_bag_arr[(_arg_1 - 1)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        mxcurr_bag_arr[(_arg_1 - 1)].itemId = -1;
                        mxcurr_bag_arr[(_arg_1 - 1)].num = 0;
                        mxcurr_bag_arr[(_arg_1 - 1)].binded = 0;
                        mxcurr_bag_arr[(_arg_1 - 1)].color = 0;
                        mxcurr_bag_arr[(_arg_1 - 1)].slotData = new Object();
                        mxcurr_bag_arr[(_arg_1 - 1)].slotData.q = 0;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get mxnumTxt():Text
        {
            return (this._920352139mxnumTxt);
        }

        [Bindable(event="propertyChange")]
        public function get cbDire():CheckBox
        {
            return (this._1368045961cbDire);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        public function updateBag():void
        {
            var _local_1:uint;
            var _local_4:*;
            var _local_7:Object;
            var _local_8:uint;
            var _local_9:Object;
            var _local_10:int;
            var _local_11:ArrayCollection;
            if (((_core.player.tBag) && (_core.player.tBag.tempBag)))
            {
                _local_1 = 1;
                while (_local_1 <= _core.player.tBag.tempbagNum)
                {
                    if (((_core.player.tBag.tempBag[_local_1]) && (_core.player.tBag.tempBag[_local_1].tid)))
                    {
                        this[("bagSlot" + _local_1)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[("bagSlot" + _local_1)].giid = uint(_core.player.tBag.tempBag[_local_1].tid);
                        if (_core.player.tBag.tempBag[_local_1].ot)
                        {
                            this[("bagSlot" + _local_1)].enabled = false;
                        }
                        else
                        {
                            this[("bagSlot" + _local_1)].enabled = true;
                        };
                    };
                    _local_1++;
                };
            };
            if (((_core.player.tBag) && (_core.player.tBag.mx.tempBag)))
            {
                _local_1 = 1;
                while (_local_1 <= _core.player.tBag.mx.tempbagNum)
                {
                    if (((_core.player.tBag.mx.tempBag[_local_1]) && (_core.player.tBag.mx.tempBag[_local_1].tid)))
                    {
                        this[("mxbagSlot" + _local_1)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[("mxbagSlot" + _local_1)].giid = uint(_core.player.tBag.mx.tempBag[_local_1].tid);
                        if (_core.player.tBag.mx.tempBag[_local_1].ot)
                        {
                            this[("mxbagSlot" + _local_1)].enabled = false;
                        }
                        else
                        {
                            this[("mxbagSlot" + _local_1)].enabled = true;
                        };
                    };
                    _local_1++;
                };
            };
            curr_bag_arr = new ArrayCollection();
            _local_1 = 1;
            while (_local_1 <= _core.player.tBag.tempSlotNum)
            {
                _local_7 = new Object();
                _local_7.sid = ("tempSlot" + _local_1);
                _local_7.idx = _local_1;
                curr_bag_arr.addItem(_local_7);
                _local_1++;
            };
            var _local_2:uint = _core.player.tBag.tempSlotNum;
            var _local_3:Object = _core.player.tBag.tempList;
            for (_local_4 in _local_3)
            {
                if (_local_3[_local_4])
                {
                    _local_8 = (uint(_local_4) - 1);
                    if (((_local_8 < curr_bag_arr.length) && (curr_bag_arr[_local_8])))
                    {
                        curr_bag_arr[_local_8].type = GamePredef.TBL_ITEM_TEMPLATE;
                        curr_bag_arr[_local_8].itemId = _local_3[_local_4].t;
                        curr_bag_arr[_local_8].num = _local_3[_local_4].n;
                        curr_bag_arr[_local_8].binded = _local_3[_local_4].b;
                        curr_bag_arr[_local_8].color = _local_3[_local_4].c;
                        _local_9 = new Object();
                        _local_9.ti = GamePredef.TBL_ITEM_TEMPLATE;
                        _local_9.ii = _local_3[_local_4].t;
                        _local_9.n = _local_3[_local_4].n;
                        _local_9.q = (_local_3[_local_4].c * 5);
                        _local_9.b = _local_3[_local_4].b;
                        curr_bag_arr[_local_8].slotData = _local_9;
                    }
                    else
                    {
                        _local_7 = new Object();
                        _local_7.sid = ("tempSlot" + _local_4);
                        _local_7.idx = _local_4;
                        _local_7.en = true;
                        _local_7.type = GamePredef.TBL_ITEM_TEMPLATE;
                        _local_7.itemId = _local_3[_local_4].t;
                        _local_7.num = _local_3[_local_4].n;
                        _local_7.binded = _local_3[_local_4].b;
                        _local_7.color = _local_3[_local_4].c;
                        _local_9 = new Object();
                        _local_9.ti = GamePredef.TBL_ITEM_TEMPLATE;
                        _local_9.ii = _local_3[_local_4].t;
                        _local_9.n = _local_3[_local_4].n;
                        _local_9.q = (_local_3[_local_4].c * 5);
                        _local_9.b = _local_3[_local_4].b;
                        _local_7.slotData = _local_9;
                        curr_bag_arr.addItem(_local_7);
                        _local_2++;
                    };
                };
            };
            if (_local_2 > 0)
            {
                if (_local_2 > NUM_PER_PAGE)
                {
                    _local_2 = NUM_PER_PAGE;
                };
                _local_10 = int((Math.ceil((_local_2 / 6)) - 4));
                slotTile.height = (def_slot_height + (38 * _local_10));
            }
            else
            {
                slotTile.height = def_slot_height;
            };
            if (curr_bag_arr.length <= NUM_PER_PAGE)
            {
                slotRep.dataProvider = curr_bag_arr;
                pageSelector.visible = false;
            }
            else
            {
                _local_11 = new ArrayCollection();
                _local_1 = 0;
                while (_local_1 < NUM_PER_PAGE)
                {
                    _local_11.addItem(curr_bag_arr[_local_1]);
                    _local_1++;
                };
                slotRep.dataProvider = _local_11;
                pageSelector.visible = true;
                pageSelector.initPageSeletor(curr_bag_arr.length, NUM_PER_PAGE);
            };
            mxcurr_bag_arr = new ArrayCollection();
            _local_1 = 1;
            while (_local_1 <= _core.player.tBag.mx.tempSlotNum)
            {
                _local_7 = new Object();
                _local_7.sid = ("tempSlot" + _local_1);
                _local_7.idx = _local_1;
                mxcurr_bag_arr.addItem(_local_7);
                _local_1++;
            };
            var _local_5:uint = _core.player.tBag.mx.tempSlotNum;
            var _local_6:Object = _core.player.tBag.mx.tempList;
            for (_local_4 in _local_6)
            {
                if (_local_6[_local_4])
                {
                    _local_8 = (uint(_local_4) - 1);
                    if (((_local_8 < mxcurr_bag_arr.length) && (mxcurr_bag_arr[_local_8])))
                    {
                        mxcurr_bag_arr[_local_8].type = GamePredef.TBL_ITEM_TEMPLATE;
                        mxcurr_bag_arr[_local_8].itemId = _local_6[_local_4].t;
                        mxcurr_bag_arr[_local_8].num = _local_6[_local_4].n;
                        mxcurr_bag_arr[_local_8].binded = _local_6[_local_4].b;
                        mxcurr_bag_arr[_local_8].color = _local_6[_local_4].c;
                        _local_9 = new Object();
                        _local_9.ti = GamePredef.TBL_ITEM_TEMPLATE;
                        _local_9.ii = _local_6[_local_4].t;
                        _local_9.n = _local_6[_local_4].n;
                        _local_9.q = (_local_6[_local_4].c * 5);
                        _local_9.b = _local_6[_local_4].b;
                        mxcurr_bag_arr[_local_8].slotData = _local_9;
                    }
                    else
                    {
                        _local_7 = new Object();
                        _local_7.sid = ("tempSlot" + _local_4);
                        _local_7.idx = _local_4;
                        _local_7.en = true;
                        _local_7.type = GamePredef.TBL_ITEM_TEMPLATE;
                        _local_7.itemId = _local_6[_local_4].t;
                        _local_7.num = _local_6[_local_4].n;
                        _local_7.binded = _local_6[_local_4].b;
                        _local_7.color = _local_6[_local_4].c;
                        _local_9 = new Object();
                        _local_9.ti = GamePredef.TBL_ITEM_TEMPLATE;
                        _local_9.ii = _local_6[_local_4].t;
                        _local_9.n = _local_6[_local_4].n;
                        _local_9.q = (_local_6[_local_4].c * 5);
                        _local_9.b = _local_6[_local_4].b;
                        _local_7.slotData = _local_9;
                        mxcurr_bag_arr.addItem(_local_7);
                        _local_5++;
                    };
                };
            };
            if (_local_5 > 0)
            {
                if (_local_5 > NUM_PER_PAGE)
                {
                    _local_5 = NUM_PER_PAGE;
                };
                _local_10 = int((Math.ceil((_local_5 / 6)) - 4));
                mxslotTile.height = (def_slot_height + (38 * _local_10));
            }
            else
            {
                mxslotTile.height = def_slot_height;
            };
            if (mxcurr_bag_arr.length <= NUM_PER_PAGE)
            {
                mxslotRep.dataProvider = mxcurr_bag_arr;
                mxpageSelector.visible = false;
            }
            else
            {
                _local_11 = new ArrayCollection();
                _local_1 = 0;
                while (_local_1 < NUM_PER_PAGE)
                {
                    _local_11.addItem(mxcurr_bag_arr[_local_1]);
                    _local_1++;
                };
                mxslotRep.dataProvider = _local_11;
                mxpageSelector.visible = true;
                mxpageSelector.initPageSeletor(mxcurr_bag_arr.length, NUM_PER_PAGE);
            };
            setnTxt();
        }

        public function UpdateSlot(_arg_1:uint, _arg_2:Object):void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:*;
            var _local_7:uint;
            var _local_8:*;
            if (!_core.player.tBag)
            {
                return;
            };
            _core.player.tBag.tempList[_arg_1] = _arg_2;
            _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE).updateView();
            if (firstTimeFlag)
            {
                return;
            };
            if (_arg_2)
            {
                if (_arg_1 <= _core.player.tBag.tempSlotNum)
                {
                    _local_3 = -1;
                    if (pageSelector.pageNo)
                    {
                        _local_3 = ((_arg_1 - (pageSelector.pageNo * NUM_PER_PAGE)) - 1);
                    }
                    else
                    {
                        _local_3 = (_arg_1 - 1);
                    };
                    if (((_local_3 >= 0) && (_local_3 < NUM_PER_PAGE)))
                    {
                        _local_6 = slotTile.getChildAt(_local_3);
                    };
                    _local_4 = new Object();
                    _local_4.type = GamePredef.TBL_ITEM_TEMPLATE;
                    _local_4.itemId = _arg_2.t;
                    _local_4.num = _arg_2.n;
                    _local_4.binded = _arg_2.b;
                    _local_4.color = _arg_2.c;
                    _local_4.sid = ("tempSlot" + _arg_1);
                    _local_4.idx = _arg_1;
                    _local_5 = new Object();
                    _local_5.ti = GamePredef.TBL_ITEM_TEMPLATE;
                    _local_5.ii = _arg_2.t;
                    _local_5.n = _arg_2.n;
                    _local_5.q = (_arg_2.c * 5);
                    _local_5.b = _arg_2.b;
                    _local_4.slotData = _local_5;
                    if (_local_6)
                    {
                        _local_6.sData = _local_4;
                    };
                    if (((_arg_1 <= curr_bag_arr.length) && (curr_bag_arr[(_arg_1 - 1)])))
                    {
                        curr_bag_arr[(_arg_1 - 1)] = _local_4;
                    };
                };
            }
            else
            {
                if (_arg_1 > _core.player.tBag.tempSlotNum)
                {
                    if (pageSelector.pageNo)
                    {
                        if ((pageSelector.pageNo * NUM_PER_PAGE) > _core.player.tBag.tempSlotNum)
                        {
                            _local_7 = 0;
                            while (_local_7 <= NUM_PER_PAGE)
                            {
                                if (((slotTile[_local_7]) && (slotTile[_local_7].posId == _arg_1)))
                                {
                                    slotTile[_local_7].clean();
                                    if (curr_bag_arr[_local_7])
                                    {
                                        curr_bag_arr[_local_7].type = GamePredef.TBL_ITEM_TEMPLATE;
                                        curr_bag_arr[_local_7].itemId = -1;
                                        curr_bag_arr[_local_7].num = 0;
                                        curr_bag_arr[_local_7].binded = 0;
                                        curr_bag_arr[_local_7].color = 0;
                                        curr_bag_arr[_local_7].slotData = new Object();
                                        curr_bag_arr[_local_7].slotData.q = 0;
                                    };
                                    break;
                                };
                                _local_7++;
                            };
                        };
                    }
                    else
                    {
                        if (NUM_PER_PAGE > _core.player.tBag.tempSlotNum)
                        {
                            _local_7 = 0;
                            while (_local_7 <= NUM_PER_PAGE)
                            {
                                _local_8 = slotTile.getChildAt(_local_7);
                                if (((_local_8) && (_local_8.posId == _arg_1)))
                                {
                                    _local_8.clean();
                                    if (curr_bag_arr[_local_7])
                                    {
                                        curr_bag_arr[_local_7].type = GamePredef.TBL_ITEM_TEMPLATE;
                                        curr_bag_arr[_local_7].itemId = -1;
                                        curr_bag_arr[_local_7].num = 0;
                                        curr_bag_arr[_local_7].binded = 0;
                                        curr_bag_arr[_local_7].color = 0;
                                        curr_bag_arr[_local_7].slotData = new Object();
                                        curr_bag_arr[_local_7].slotData.q = 0;
                                    };
                                    break;
                                };
                                _local_7++;
                            };
                        };
                    };
                }
                else
                {
                    _local_3 = -1;
                    if (pageSelector.pageNo)
                    {
                        _local_3 = ((_arg_1 - (pageSelector.pageNo * NUM_PER_PAGE)) - 1);
                    }
                    else
                    {
                        _local_3 = (_arg_1 - 1);
                    };
                    if (_local_3 >= 0)
                    {
                        _local_6 = slotTile.getChildAt(_local_3);
                    };
                    if (_local_6)
                    {
                        _local_6.clean();
                    };
                    if (((_arg_1 <= curr_bag_arr.length) && (curr_bag_arr[(_arg_1 - 1)])))
                    {
                        curr_bag_arr[(_arg_1 - 1)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        curr_bag_arr[(_arg_1 - 1)].itemId = -1;
                        curr_bag_arr[(_arg_1 - 1)].num = 0;
                        curr_bag_arr[(_arg_1 - 1)].binded = 0;
                        curr_bag_arr[(_arg_1 - 1)].color = 0;
                        curr_bag_arr[(_arg_1 - 1)].slotData = new Object();
                        curr_bag_arr[(_arg_1 - 1)].slotData.q = 0;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        private function onGetTBag(_arg_1:Object):void
        {
            _core.player.tBag = _arg_1;
            initTempBag();
        }

        private function _TempBagSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.BAGPANEL_U[14];
            _local_1 = Language.TEMP_BAG_U[11];
            _local_1 = Language.TEMP_BAG_U[12];
            _local_1 = Language.TEMP_BAG_U[4];
            _local_1 = Currency.TYPE_GOLDALL;
            _local_1 = slotRep.currentItem;
            _local_1 = Language.TEMP_BAG_U[7];
            _local_1 = Language.TEMP_BAG_U[5];
            _local_1 = Language.TEMP_BAG_U[6];
            _local_1 = Language.TEMP_BAG_U[4];
            _local_1 = Currency.TYPE_GOLDALL;
            _local_1 = mxslotRep.currentItem;
            _local_1 = Language.TEMP_BAG_U[7];
            _local_1 = Language.TEMP_BAG_U[5];
            _local_1 = Language.TEMP_BAG_U[8];
            _local_1 = Language.TEMP_BAG_U[9];
        }

        [Bindable(event="propertyChange")]
        public function get mxslotTile():Tile
        {
            return (this._1117107319mxslotTile);
        }

        public function setnTxt():void
        {
            var _local_1:String;
            _local_1 = ((uint(_core.player.tBag.curNum).toString() + "/") + _core.player.tBag.tempSlotNum);
            numTxt.text = _local_1;
            if (ToolKit.isBigOrEqual(_core.player.tBag.curNum, _core.player.tBag.tempSlotNum))
            {
                numTxt.setStyle("color", "0xFF0000");
                _core.player.tBag.ot = true;
            }
            else
            {
                numTxt.setStyle("color", "0x00FF00");
                _core.player.tBag.ot = false;
            };
            _local_1 = ((uint(_core.player.tBag.mx.curNum).toString() + "/") + _core.player.tBag.mx.tempSlotNum);
            mxnumTxt.text = _local_1;
            if (ToolKit.isBigOrEqual(_core.player.tBag.mx.curNum, _core.player.tBag.mx.tempSlotNum))
            {
                mxnumTxt.setStyle("color", "0xFF0000");
                _core.player.tBag.mx.ot = true;
            }
            else
            {
                mxnumTxt.setStyle("color", "0x00FF00");
                _core.player.tBag.mx.ot = false;
            };
        }

        public function set bagtitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._2050561200bagtitle;
            if (_local_2 !== _arg_1)
            {
                this._2050561200bagtitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagtitle", _local_2, _arg_1));
            };
        }

        public function onmxDragDropHandle(_arg_1:Event):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:uint;
            var _local_8:uint;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:Object;
            var _local_2:* = _arg_1.target.dropSlot;
            if (_local_2)
            {
                if (_local_2.slotType == Slot.SLOT_BAG)
                {
                    if (_core.player.tBag.mx.ot)
                    {
                        _core.sysMsg(Language.TEMP_BAG_U[2]);
                        return;
                    };
                    _local_3 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2.slotData.tid];
                    if (((_local_3) && (ToolKit.ableTomxTemp(_local_3))))
                    {
                        _local_4 = _arg_1.currentTarget.slotData;
                        if (((_local_4) && (_local_4.ii > 0)))
                        {
                            if (_local_4.ii == _local_3.id)
                            {
                                _local_5 = _core.data.getGameData(_local_2.type, _local_2.giid);
                                _local_6 = _core.player.tBag.mx.tempList[_arg_1.currentTarget.posId];
                                if (((_local_5) && (_local_6)))
                                {
                                    if ((((_local_5.binded == _local_6.b) && (_local_5.color == _local_6.c)) && (ToolKit.add(_local_2.stackNum, _local_6.n) <= _local_3.stackMax)))
                                    {
                                        _core.remote.addmxFromBag(_local_2.index, ToolKit.add((mxlast_selected * 100), _arg_1.currentTarget.posId));
                                    };
                                };
                            };
                        }
                        else
                        {
                            _core.remote.addmxFromBag(_local_2.index, ToolKit.add((mxlast_selected * 100), _arg_1.currentTarget.posId));
                        };
                    }
                    else
                    {
                        _core.sysMidNote(Language.TEMP_BAG_U[13]);
                    };
                }
                else
                {
                    if (_local_2.slotType == Slot.SLOT_TEMP_SLOT)
                    {
                        _local_7 = uint(_local_2.posId);
                        _local_8 = uint(_arg_1.currentTarget.posId);
                        if (_local_7 == _local_8)
                        {
                            return;
                        };
                        _local_11 = _core.player.tBag.mx.tempList;
                        if (((_local_11[_local_7]) && (_local_11[_local_8])))
                        {
                            _local_9 = _local_11[_local_7];
                            _local_10 = _local_11[_local_8];
                            if ((((_local_9.t == _local_10.t) && (_local_9.b == _local_10.b)) && (_local_9.c == _local_10.c)))
                            {
                                _local_12 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_9.t];
                                if (_local_12)
                                {
                                    if (_local_12.stackMax >= ToolKit.add(_local_9.n, _local_10.n))
                                    {
                                        if (ToolKit.isSmallOrEqual(_local_12.t, 0))
                                        {
                                            _core.remote.movemxBtwTemp(_local_2.posId, _arg_1.currentTarget.posId);
                                        };
                                    };
                                };
                            };
                        }
                        else
                        {
                            if (_local_11[_local_7])
                            {
                                _core.remote.movemxBtwTemp(_local_2.posId, _arg_1.currentTarget.posId);
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get mxpageSelector():PageSelector
        {
            return (this._727277383mxpageSelector);
        }

        [Bindable(event="propertyChange")]
        public function get mxbtnOpen():BasicGlowButton
        {
            return (this._554117445mxbtnOpen);
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        private function onPageCleared():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get btnOpen():BasicGlowButton
        {
            return (this._206080710btnOpen);
        }

        public function set introTxt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._582302820introTxt;
            if (_local_2 !== _arg_1)
            {
                this._582302820introTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bagSlot1():ItemSlotTempBag
        {
            return (this._2080952629bagSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get bagSlot2():ItemSlotTempBag
        {
            return (this._2080952628bagSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get bagSlot3():ItemSlotTempBag
        {
            return (this._2080952627bagSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get bagSlot4():ItemSlotTempBag
        {
            return (this._2080952626bagSlot4);
        }

        private function initBag():void
        {
            updateBag();
        }

        [Bindable(event="propertyChange")]
        public function get bagSlot5():ItemSlotTempBag
        {
            return (this._2080952625bagSlot5);
        }

        private function onDoubleClick(_arg_1:*):void
        {
            var _local_2:uint;
            if (_core.player.enoughBag(1))
            {
                _local_2 = uint(_arg_1.data.currentTarget.posId);
                if (_local_2 > 0)
                {
                    _core.remote.tempToBag(_local_2);
                };
            };
        }

        private function openAllMX():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("oneKeyOpenAllMXTemp", new Responder(onTBagSort));
                };
            };
            var str:String = Language.TEMP_BAG_U[14];
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                if (((firstTimeFlag) || (!(_core.player.tBag))))
                {
                    if (!_core.player.tBag)
                    {
                        _core.remote.call("getTBag", new Responder(onGetTBag));
                    }
                    else
                    {
                        initTempBag();
                    };
                    introTxt.htmlText = Language.TEMP_BAG_U[0];
                    mxintroTxt.htmlText = Language.TEMP_BAG_U[10];
                    pageSelector.onPageChanged = onPageChanged;
                    pageSelector.onPageCleared = onPageCleared;
                    mxpageSelector.onPageChanged = mxonPageChanged;
                    mxpageSelector.onPageCleared = onPageCleared;
                };
            };
        }

        public function set mxbagSlot1(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._122708342mxbagSlot1;
            if (_local_2 !== _arg_1)
            {
                this._122708342mxbagSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxbagSlot1", _local_2, _arg_1));
            };
        }

        public function set mxbagSlot2(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._122708343mxbagSlot2;
            if (_local_2 !== _arg_1)
            {
                this._122708343mxbagSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxbagSlot2", _local_2, _arg_1));
            };
        }

        public function __btnOpen_click(_arg_1:MouseEvent):void
        {
            openSlot();
        }

        public function set mxnumTxt(_arg_1:Text):void
        {
            var _local_2:Object = this._920352139mxnumTxt;
            if (_local_2 !== _arg_1)
            {
                this._920352139mxnumTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxnumTxt", _local_2, _arg_1));
            };
        }

        public function set mxbagSlot4(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._122708345mxbagSlot4;
            if (_local_2 !== _arg_1)
            {
                this._122708345mxbagSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxbagSlot4", _local_2, _arg_1));
            };
        }

        private function tabClick(_arg_1:uint):void
        {
            vs.selectedIndex = _arg_1;
            tabBtn1.selected = ((_arg_1) ? true : false);
            tabBtn0.selected = ((_arg_1) ? false : true);
        }

        public function set mxbagSlot5(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._122708346mxbagSlot5;
            if (_local_2 !== _arg_1)
            {
                this._122708346mxbagSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxbagSlot5", _local_2, _arg_1));
            };
        }

        public function set cbDire(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1368045961cbDire;
            if (_local_2 !== _arg_1)
            {
                this._1368045961cbDire = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbDire", _local_2, _arg_1));
            };
        }

        public function set mxbagSlot3(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._122708344mxbagSlot3;
            if (_local_2 !== _arg_1)
            {
                this._122708344mxbagSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxbagSlot3", _local_2, _arg_1));
            };
        }

        public function setDire():void
        {
            _core.remote.setTbagDire(cbDire.selected);
        }

        public function set mxslotTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._1117107319mxslotTile;
            if (_local_2 !== _arg_1)
            {
                this._1117107319mxslotTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxslotTile", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numTxt():Text
        {
            return (this._1034376950numTxt);
        }

        [Bindable(event="propertyChange")]
        public function get mxintroTxt():IntroText
        {
            return (this._1509003505mxintroTxt);
        }

        private function init():void
        {
            var _local_2:uint;
            var _local_1:uint = _core.player.tBag.tempbagNum;
            _local_2 = 1;
            while (_local_2 <= slot_max)
            {
                if (!_core.player.tBag.tempBag[_local_2])
                {
                    if (_local_2 <= _local_1)
                    {
                        this[("bagSlot" + _local_2)].enabled = true;
                    }
                    else
                    {
                        this[("bagSlot" + _local_2)].enabled = false;
                    };
                };
                _local_2++;
            };
            if (_local_1 >= slot_max)
            {
                btnOpen.visible = false;
                costCur.visible = false;
                numTxt.y = 169;
            }
            else
            {
                btnOpen.visible = true;
                costCur.visible = true;
                currentCost = COST_ARR[_local_1];
                costCur.value = COST_ARR[_local_1];
                numTxt.y = 149;
            };
            var _local_3:uint = _core.player.tBag.mx.tempbagNum;
            _local_2 = 1;
            while (_local_2 <= slot_max)
            {
                if (!_core.player.tBag.mx.tempBag[_local_2])
                {
                    if (_local_2 <= _local_3)
                    {
                        this[("mxbagSlot" + _local_2)].enabled = true;
                    }
                    else
                    {
                        this[("mxbagSlot" + _local_2)].enabled = false;
                    };
                };
                _local_2++;
            };
            if (_local_3 >= slot_max)
            {
                mxbtnOpen.visible = false;
                mxcostCur.visible = false;
                mxnumTxt.y = 169;
            }
            else
            {
                mxbtnOpen.visible = true;
                mxcostCur.visible = true;
                mxcurrentCost = COST_ARR[_local_3];
                mxcostCur.value = COST_ARR[_local_3];
                mxnumTxt.y = 149;
            };
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

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        private function _TempBagSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BAGPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bagtitle.text = _arg_1;
            }, "bagtitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnOpen.label = _arg_1;
            }, "btnOpen.label");
            result[3] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLDALL);
            }, function (_arg_1:uint):void
            {
                costCur.type = _arg_1;
            }, "costCur.type");
            result[4] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (slotRep.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _TempBagSlot_ItemSlotTemp1[_arg_2[0]].sData = _arg_1;
            }, "_TempBagSlot_ItemSlotTemp1.sData");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TempBagSlot_BasicDelayButton1.toolTip = _arg_1;
            }, "_TempBagSlot_BasicDelayButton1.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TempBagSlot_BasicDelayButton1.label = _arg_1;
            }, "_TempBagSlot_BasicDelayButton1.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cbDire.label = _arg_1;
            }, "cbDire.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mxbtnOpen.label = _arg_1;
            }, "mxbtnOpen.label");
            result[9] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLDALL);
            }, function (_arg_1:uint):void
            {
                mxcostCur.type = _arg_1;
            }, "mxcostCur.type");
            result[10] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (mxslotRep.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _TempBagSlot_ItemSlotTemp2[_arg_2[0]].sData = _arg_1;
            }, "_TempBagSlot_ItemSlotTemp2.sData");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TempBagSlot_BasicDelayButton2.toolTip = _arg_1;
            }, "_TempBagSlot_BasicDelayButton2.toolTip");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TempBagSlot_BasicDelayButton2.label = _arg_1;
            }, "_TempBagSlot_BasicDelayButton2.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TempBagSlot_BasicDelayButton3.toolTip = _arg_1;
            }, "_TempBagSlot_BasicDelayButton3.toolTip");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMP_BAG_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TempBagSlot_BasicDelayButton3.label = _arg_1;
            }, "_TempBagSlot_BasicDelayButton3.label");
            result[15] = binding;
            return (result);
        }

        public function __mxbtnOpen_click(_arg_1:MouseEvent):void
        {
            mxopenSlot();
        }

        public function ___TempBagSlot_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            _core.remote.call("mxBagSort", new Responder(onTBagSort));
        }

        [Bindable(event="propertyChange")]
        public function get costCur():Currency
        {
            return (this._956115763costCur);
        }

        [Bindable(event="propertyChange")]
        public function get mxcostCur():Currency
        {
            return (this._195917608mxcostCur);
        }

        public function reset():void
        {
            firstTimeFlag = true;
        }

        [Bindable(event="propertyChange")]
        public function get bagtitle():BasicTitleCanvas
        {
            return (this._2050561200bagtitle);
        }

        private function onmxOpenSlot(_arg_1:uint):void
        {
            _core.player.tBag.mx.tempbagNum = _arg_1;
            init();
        }

        private function openSlot():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("openTempSlot", new Responder(onOpenSlot));
                };
            };
            var str:String = Language.TEMP_BAG_U[1];
            str = str.replace("{cost}", currentCost);
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        public function set _TempBagSlot_Tile1(_arg_1:Tile):void
        {
            var _local_2:Object = this._915228087_TempBagSlot_Tile1;
            if (_local_2 !== _arg_1)
            {
                this._915228087_TempBagSlot_Tile1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TempBagSlot_Tile1", _local_2, _arg_1));
            };
        }

        public function set mxslotRep(_arg_1:Repeater):void
        {
            var _local_2:Object = this._1421506996mxslotRep;
            if (_local_2 !== _arg_1)
            {
                this._1421506996mxslotRep = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxslotRep", _local_2, _arg_1));
            };
        }

        public function set _TempBagSlot_Tile2(_arg_1:Tile):void
        {
            var _local_2:Object = this._915228088_TempBagSlot_Tile2;
            if (_local_2 !== _arg_1)
            {
                this._915228088_TempBagSlot_Tile2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TempBagSlot_Tile2", _local_2, _arg_1));
            };
        }

        public function set mxpageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._727277383mxpageSelector;
            if (_local_2 !== _arg_1)
            {
                this._727277383mxpageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxpageSelector", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mxbagSlot2():ItemSlotTempBag
        {
            return (this._122708343mxbagSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get mxbagSlot3():ItemSlotTempBag
        {
            return (this._122708344mxbagSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get mxbagSlot4():ItemSlotTempBag
        {
            return (this._122708345mxbagSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get mxbagSlot1():ItemSlotTempBag
        {
            return (this._122708342mxbagSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get mxbagSlot5():ItemSlotTempBag
        {
            return (this._122708346mxbagSlot5);
        }

        public function putmxDirect(_arg_1:ItemSlot):void
        {
            var _local_4:*;
            if (_core.player.tBag.mx.ot)
            {
                _core.sysMsg(Language.TEMP_BAG_U[2]);
                return;
            };
            var _local_2:* = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_1.slotData.tid];
            var _local_3:* = _core.data.getGameData(_arg_1.type, _arg_1.giid);
            if ((((_local_2) && (_local_3)) && (ToolKit.ableTomxTemp(_local_2))))
            {
                for (_local_4 in mxcurr_bag_arr)
                {
                    if ((((mxcurr_bag_arr[_local_4]) && (mxcurr_bag_arr[_local_4].idx)) && ((!(mxcurr_bag_arr[_local_4].type)) || (mxcurr_bag_arr[_local_4].itemId == -1))))
                    {
                        _core.remote.addmxFromBag(_arg_1.index, mxcurr_bag_arr[_local_4].idx);
                        break;
                    };
                    if (mxcurr_bag_arr[_local_4].itemId == _local_2.id)
                    {
                        if ((((_local_3.color == mxcurr_bag_arr[_local_4].color) && (_local_3.binded == mxcurr_bag_arr[_local_4].binded)) && (ToolKit.add(mxcurr_bag_arr[_local_4].num, _arg_1.slotData.stackNum) < _local_2.stackMax)))
                        {
                            _core.remote.addmxFromBag(_arg_1.index, mxcurr_bag_arr[_local_4].idx);
                            break;
                        };
                    };
                };
            }
            else
            {
                _core.sysMsg(Language.TEMP_BAG_U[13]);
            };
        }

        public function set mxbtnOpen(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._554117445mxbtnOpen;
            if (_local_2 !== _arg_1)
            {
                this._554117445mxbtnOpen = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mxbtnOpen", _local_2, _arg_1));
            };
        }

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        public function set btnOpen(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._206080710btnOpen;
            if (_local_2 !== _arg_1)
            {
                this._206080710btnOpen = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnOpen", _local_2, _arg_1));
            };
        }

        public function set slotRep(_arg_1:Repeater):void
        {
            var _local_2:Object = this._2113262145slotRep;
            if (_local_2 !== _arg_1)
            {
                this._2113262145slotRep = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotRep", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:TempBagSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TempBagSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TempBagSlotWatcherSetupUtil");
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

        public function set bagSlot3(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._2080952627bagSlot3;
            if (_local_2 !== _arg_1)
            {
                this._2080952627bagSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagSlot3", _local_2, _arg_1));
            };
        }

        public function set bagSlot4(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._2080952626bagSlot4;
            if (_local_2 !== _arg_1)
            {
                this._2080952626bagSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagSlot4", _local_2, _arg_1));
            };
        }

        public function set bagSlot1(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._2080952629bagSlot1;
            if (_local_2 !== _arg_1)
            {
                this._2080952629bagSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagSlot1", _local_2, _arg_1));
            };
        }

        public function __cbDire_click(_arg_1:MouseEvent):void
        {
            setDire();
        }

        public function set bagSlot5(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._2080952625bagSlot5;
            if (_local_2 !== _arg_1)
            {
                this._2080952625bagSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagSlot5", _local_2, _arg_1));
            };
        }

        public function set bagSlot2(_arg_1:ItemSlotTempBag):void
        {
            var _local_2:Object = this._2080952628bagSlot2;
            if (_local_2 !== _arg_1)
            {
                this._2080952628bagSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagSlot2", _local_2, _arg_1));
            };
        }

        public function set slotTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._1086553652slotTile;
            if (_local_2 !== _arg_1)
            {
                this._1086553652slotTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotTile", _local_2, _arg_1));
            };
        }

        private function onTBagSort(_arg_1:Object):void
        {
            if (_arg_1)
            {
                onGetTBag(_arg_1);
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get mxslotRep():Repeater
        {
            return (this._1421506996mxslotRep);
        }

        [Bindable(event="propertyChange")]
        public function get _TempBagSlot_Tile1():Tile
        {
            return (this._915228087_TempBagSlot_Tile1);
        }

        [Bindable(event="propertyChange")]
        public function get _TempBagSlot_Tile2():Tile
        {
            return (this._915228088_TempBagSlot_Tile2);
        }

        [Bindable(event="propertyChange")]
        public function get slotRep():Repeater
        {
            return (this._2113262145slotRep);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:ArrayCollection = new ArrayCollection();
            var _local_4:uint;
            while (_local_4 < _arg_2)
            {
                if (curr_bag_arr[(_arg_1 + _local_4)])
                {
                    _local_3.addItem(curr_bag_arr[(_arg_1 + _local_4)]);
                };
                _local_4++;
            };
            slotRep.dataProvider = _local_3;
        }

        public function putDirect(_arg_1:ItemSlot):void
        {
            var _local_4:*;
            if (_core.player.tBag.ot)
            {
                _core.sysMsg(Language.TEMP_BAG_U[2]);
                return;
            };
            var _local_2:* = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_1.slotData.tid];
            var _local_3:* = _core.data.getGameData(_arg_1.type, _arg_1.giid);
            if ((((_local_2) && (_local_3)) && (ToolKit.ableToTemp(_local_2))))
            {
                for (_local_4 in curr_bag_arr)
                {
                    if ((((curr_bag_arr[_local_4]) && (curr_bag_arr[_local_4].idx)) && ((!(curr_bag_arr[_local_4].type)) || (curr_bag_arr[_local_4].itemId == -1))))
                    {
                        _core.remote.addtItemFromBag(_arg_1.index, curr_bag_arr[_local_4].idx);
                        break;
                    };
                    if (curr_bag_arr[_local_4].itemId == _local_2.id)
                    {
                        if ((((_local_3.color == curr_bag_arr[_local_4].color) && (_local_3.binded == curr_bag_arr[_local_4].binded)) && (ToolKit.add(curr_bag_arr[_local_4].num, _arg_1.slotData.stackNum) < _local_2.stackMax)))
                        {
                            _core.remote.addtItemFromBag(_arg_1.index, curr_bag_arr[_local_4].idx);
                            break;
                        };
                    };
                };
            }
            else
            {
                _core.sysMsg(Language.TEMP_BAG_U[3]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get slotTile():Tile
        {
            return (this._1086553652slotTile);
        }

        public function ___TempBagSlot_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            _core.remote.call("tempBagSort", new Responder(onTBagSort));
        }

        private function mxonPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:ArrayCollection = new ArrayCollection();
            var _local_4:uint;
            while (_local_4 < _arg_2)
            {
                if (mxcurr_bag_arr[(_arg_1 + _local_4)])
                {
                    _local_3.addItem(mxcurr_bag_arr[(_arg_1 + _local_4)]);
                };
                _local_4++;
            };
            mxslotRep.dataProvider = _local_3;
        }


    }
}//package com.qeedoo.ui.view.compDragable

