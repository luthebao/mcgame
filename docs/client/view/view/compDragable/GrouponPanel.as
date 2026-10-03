// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GrouponPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.ToggleButtonBar;
    import mx.controls.DataGrid;
    import mx.controls.TileList;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.formatters.DateFormatter;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.VRule;
    import mx.controls.HRule;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import flash.net.Responder;
    import mx.binding.BindingManager;
    import mx.core.ClassFactory;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.LanguageUtil;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
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

    public class GrouponPanel extends DragableCanvas implements IBindingClient 
    {

        public static var isRenRen:Boolean;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const CHAMP_INDEX:String = "champ";
        private var _1584105757viewStack:ViewStack;
        public var _GrouponPanel_BasicGlowButton1:BasicGlowButton;
        public var _GrouponPanel_DataGridColumn1:DataGridColumn;
        public var _GrouponPanel_DataGridColumn2:DataGridColumn;
        public var _GrouponPanel_DataGridColumn3:DataGridColumn;
        public var _GrouponPanel_DataGridColumn4:DataGridColumn;
        public var _GrouponPanel_DataGridColumn5:DataGridColumn;
        public var _GrouponPanel_DataGridColumn6:DataGridColumn;
        public var _GrouponPanel_DataGridColumn7:DataGridColumn;
        public var _GrouponPanel_DataGridColumn8:DataGridColumn;
        private var _champDict:Object;
        private var _grouponConf:Object;
        private var _11548545buttonBar:ToggleButtonBar;
        public var _GrouponPanel_DataGrid1:DataGrid;
        private var _grouponStat:Object;
        public var _GrouponPanel_TileList1:TileList;
        private var _1017317214descText:IntroText;
        public var _GrouponPanel_TileList2:TileList;
        private var _selfOCid:String;
        private var _848973974giftGrid:DataGrid;
        private var _dateFormatter:DateFormatter;
        private var _27380931giftBar:ToggleButtonBar;
        public var _GrouponPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _778500089totalRebate:Label;
        public var _GrouponPanel_BasicGlowButton2:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":750,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GrouponPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ToggleButtonBar,
                        "id":"buttonBar",
                        "stylesFactory":function ():void
                        {
                            this.buttonStyleName = "HorizontalTab";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":55
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"viewStack",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "74";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
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
                                                "type":TileList,
                                                "id":"_GrouponPanel_TileList1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "30";
                                                    this.right = "30";
                                                    this.top = "20";
                                                    this.bottom = "55";
                                                    this.borderStyle = "none";
                                                    this.backgroundAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "variableRowHeight":true,
                                                        "itemRenderer":_GrouponPanel_ClassFactory1_c(),
                                                        "selectable":false
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
                                                "type":DataGrid,
                                                "id":"_GrouponPanel_DataGrid1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "undefined";
                                                    this.borderStyle = "solid";
                                                    this.borderThickness = 1;
                                                    this.verticalGridLines = true;
                                                    this.horizontalGridLineColor = 0xFFFFFF;
                                                    this.horizontalGridLines = true;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "rowHeight":83,
                                                        "rowCount":4,
                                                        "selectable":false,
                                                        "headerHeight":25,
                                                        "styleName":"GrouponGrid",
                                                        "columns":[_GrouponPanel_DataGridColumn1_i(), _GrouponPanel_DataGridColumn2_i(), _GrouponPanel_DataGridColumn3_i()]
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
                                                "type":ToggleButtonBar,
                                                "id":"giftBar",
                                                "stylesFactory":function ():void
                                                {
                                                    this.buttonStyleName = "HorizontalTab";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":80,
                                                        "y":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "70";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":85,
                                                        "y":41
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "70";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":85,
                                                        "y":41
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "70";
                                                    this.right = "70";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":41});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TileList,
                                                "id":"_GrouponPanel_TileList2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.backgroundAlpha = 0;
                                                    this.left = "70";
                                                    this.right = "70";
                                                    this.top = "40";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "columnCount":3,
                                                        "rowCount":3,
                                                        "selectable":false,
                                                        "labelField":"record",
                                                        "height":95
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"giftGrid",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "70";
                                                    this.right = "70";
                                                    this.top = "135";
                                                    this.bottom = "undefined";
                                                    this.borderStyle = "solid";
                                                    this.borderThickness = 1;
                                                    this.verticalGridLines = true;
                                                    this.horizontalGridLineColor = 0xFFFFFF;
                                                    this.horizontalGridLines = true;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "rowCount":10,
                                                        "headerHeight":25,
                                                        "styleName":"GrouponGrid",
                                                        "selectable":false,
                                                        "columns":[_GrouponPanel_DataGridColumn4_i(), _GrouponPanel_DataGridColumn5_i(), _GrouponPanel_DataGridColumn6_i(), _GrouponPanel_DataGridColumn7_i(), _GrouponPanel_DataGridColumn8_i()]
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
                                                "type":IntroText,
                                                "id":"descText",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "20";
                                                    this.right = "20";
                                                    this.top = "20";
                                                    this.bottom = "40";
                                                }
                                            })]
                                        });
                                    }
                                })]});
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.right = "20";
                            this.bottom = "25";
                            this.horizontalGap = 15;
                            this.verticalAlign = "middle";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"totalRebate",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_GrouponPanel_BasicGlowButton1",
                                    "events":{"click":"___GrouponPanel_BasicGlowButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CrystalYellowButton",
                                            "width":80,
                                            "height":30
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_GrouponPanel_BasicGlowButton2",
                                    "events":{"click":"___GrouponPanel_BasicGlowButton2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CrystalYellowButton",
                                            "width":80,
                                            "height":30
                                        });
                                    }
                                })]});
                        }
                    })]
                });
            }
        });
        private const GRADE_INFO:Array = ["first", "second", "third"];
        private var _core:Core = Core.getInstance();
        private var _270866343_confCollect:ArrayCollection = new ArrayCollection();
        private var _1724267016_rebateCollect:ArrayCollection = new ArrayCollection();
        private var _1031834979_buyCollect:ArrayCollection = new ArrayCollection();
        private var _465467622_giveCollect:ArrayCollection = new ArrayCollection();
        private var _1220349293_getCollect:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GrouponPanel()
        {
            mx_internal::_document = this;
            this.width = 750;
            this.height = 500;
            this.x = 75;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___GrouponPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GrouponPanel._watcherSetupUtil = _arg_1;
        }


        override public function show():void
        {
            super.show();
            _core.remote.call("getGrouponInfo", new Responder(onGetGrouponInfo));
        }

        private function _GrouponPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GrouponPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "index";
            _local_1.width = 50;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_GrouponPanel_DataGridColumn4", _GrouponPanel_DataGridColumn4);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get totalRebate():Label
        {
            return (this._778500089totalRebate);
        }

        private function _GrouponPanel_ClassFactory4_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = GrouponPanel_inlineComponent3;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function set totalRebate(_arg_1:Label):void
        {
            var _local_2:Object = this._778500089totalRebate;
            if (_local_2 !== _arg_1)
            {
                this._778500089totalRebate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalRebate", _local_2, _arg_1));
            };
        }

        public function changeVersion(_arg_1:Object):void
        {
            if (!this.visible)
            {
                return;
            };
            _grouponConf = _arg_1;
            _grouponStat = {};
            _champDict = {};
            this.updateTotal();
            this.updatePageOne();
            this.updatePageTwo();
            this.updatePageThree();
        }

        private function set _rebateCollect(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1724267016_rebateCollect;
            if (_local_2 !== _arg_1)
            {
                this._1724267016_rebateCollect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_rebateCollect", _local_2, _arg_1));
            };
        }

        private function _GrouponPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GrouponPanel_DataGridColumn8 = _local_1;
            _local_1.dataField = "num";
            _local_1.width = 50;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_GrouponPanel_DataGridColumn8", _GrouponPanel_DataGridColumn8);
            return (_local_1);
        }

        private function getHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            _core.remote.call("getGrouponMoney", new Responder(onGetGiftAlert));
        }

        [Bindable(event="propertyChange")]
        private function get _rebateCollect():ArrayCollection
        {
            return (this._1724267016_rebateCollect);
        }

        [Bindable(event="propertyChange")]
        private function get _giveCollect():ArrayCollection
        {
            return (this._465467622_giveCollect);
        }

        private function set _getCollect(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1220349293_getCollect;
            if (_local_2 !== _arg_1)
            {
                this._1220349293_getCollect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_getCollect", _local_2, _arg_1));
            };
        }

        public function ___GrouponPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            receiveHandler(_arg_1);
        }

        private function _GrouponPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GrouponPanel_DataGridColumn3 = _local_1;
            _local_1.itemRenderer = _GrouponPanel_ClassFactory4_c();
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_GrouponPanel_DataGridColumn3", _GrouponPanel_DataGridColumn3);
            return (_local_1);
        }

        private function _GrouponPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GrouponPanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "itemName";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_GrouponPanel_DataGridColumn7", _GrouponPanel_DataGridColumn7);
            return (_local_1);
        }

        private function updatePageTwo():void
        {
            var _local_2:String;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:String;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:int;
            var _local_9:String;
            var _local_10:Object;
            _rebateCollect.removeAll();
            var _local_1:Object = _grouponConf.itemConf;
            for (_local_2 in _local_1)
            {
                _local_3 = _local_1[_local_2];
                if (_local_3)
                {
                    _local_4 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2];
                    _local_5 = ((_local_4) ? _local_4.name : "");
                    _local_6 = {"name":_local_5};
                    _local_7 = GRADE_INFO.length;
                    _local_8 = 0;
                    while (_local_8 < _local_7)
                    {
                        _local_9 = GRADE_INFO[_local_8];
                        _local_10 = _local_3[_local_9];
                        _local_6[("num" + _local_8)] = _local_10.num;
                        _local_6[("rebate" + _local_8)] = _local_10.gain;
                        _local_8++;
                    };
                    _rebateCollect.addItem(_local_6);
                };
            };
        }

        public function set buttonBar(_arg_1:ToggleButtonBar):void
        {
            var _local_2:Object = this._11548545buttonBar;
            if (_local_2 !== _arg_1)
            {
                this._11548545buttonBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonBar", _local_2, _arg_1));
            };
        }

        private function _GrouponPanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = GrouponPanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function set _giveCollect(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._465467622_giveCollect;
            if (_local_2 !== _arg_1)
            {
                this._465467622_giveCollect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_giveCollect", _local_2, _arg_1));
            };
        }

        private function updatePageOne():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:*;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:String;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:int;
            var _local_14:int;
            var _local_15:Object;
            var _local_16:String;
            var _local_17:Object;
            var _local_18:Object;
            var _local_19:Object;
            if (!_grouponConf)
            {
                return;
            };
            var _local_1:Object = {};
            for each (_local_2 in _grouponStat)
            {
                _local_5 = _local_2.sendStat;
                for (_local_4 in _local_5)
                {
                    if (!_local_1[_local_4])
                    {
                        _local_1[_local_4] = 0;
                    };
                    _local_1[_local_4] = (_local_1[_local_4] + Number(_local_5[_local_4]));
                };
            };
            ((_confCollect) && (_confCollect.removeAll()));
            _local_3 = _grouponConf.itemConf;
            for (_local_4 in _local_3)
            {
                _local_6 = _local_1[_local_4];
                _local_7 = ((_local_6) ? Number(_local_6) : 0);
                _local_8 = _local_3[_local_4];
                if (_local_8)
                {
                    _local_9 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_4];
                    _local_10 = ((_local_9) ? _local_9.name : "");
                    _local_11 = {};
                    _local_11.itemId = _local_4;
                    _local_11.name = _local_10;
                    _local_11.point = _local_8.point;
                    _local_11.desc = _local_8.desc;
                    _local_11.sold = _local_7;
                    _local_11.unitGold = 0;
                    _local_12 = _local_8.first;
                    _local_11.left = (int(_local_12.num) - _local_7);
                    _local_11.nextUnit = _local_12.gain;
                    if (((_champDict) && (_champDict[_local_4])))
                    {
                        _local_15 = _champDict[_local_4];
                        _local_11.champName = _local_15.name;
                        _local_11.champBuy = _local_15.num;
                        _local_11.serverId = _local_15.psId;
                    };
                    _local_13 = GRADE_INFO.length;
                    _local_14 = (_local_13 - 1);
                    while (_local_14 >= 0)
                    {
                        _local_16 = GRADE_INFO[_local_14];
                        _local_17 = _local_8[_local_16];
                        if (_local_7 >= Number(_local_17.num))
                        {
                            _local_11.unitGold = _local_17.gain;
                            if (GRADE_INFO[(_local_14 + 1)])
                            {
                                _local_18 = GRADE_INFO[(_local_14 + 1)];
                                _local_19 = _local_8[_local_18];
                                _local_11.left = (_local_19.num - _local_7);
                                _local_11.nextUnit = _local_19.gain;
                            }
                            else
                            {
                                _local_11.left = -1;
                                _local_11.nextUnit = _local_17.gain;
                            };
                            break;
                        };
                        _local_14--;
                    };
                    _confCollect.addItem(_local_11);
                };
            };
        }

        private function set _confCollect(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._270866343_confCollect;
            if (_local_2 !== _arg_1)
            {
                this._270866343_confCollect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_confCollect", _local_2, _arg_1));
            };
        }

        public function set giftGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._848973974giftGrid;
            if (_local_2 !== _arg_1)
            {
                this._848973974giftGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "giftGrid", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _buyCollect():ArrayCollection
        {
            return (this._1031834979_buyCollect);
        }

        public function grouponAlert(_arg_1:String):void
        {
            GrouponAlert.show(_arg_1, this);
        }

        [Bindable(event="propertyChange")]
        public function get descText():IntroText
        {
            return (this._1017317214descText);
        }

        private function _GrouponPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GrouponPanel_DataGridColumn2 = _local_1;
            _local_1.itemRenderer = _GrouponPanel_ClassFactory3_c();
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_GrouponPanel_DataGridColumn2", _GrouponPanel_DataGridColumn2);
            return (_local_1);
        }

        private function _GrouponPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GrouponPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "name";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_GrouponPanel_DataGridColumn6", _GrouponPanel_DataGridColumn6);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get buttonBar():ToggleButtonBar
        {
            return (this._11548545buttonBar);
        }

        private function updatePageThree():void
        {
            var _local_2:String;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:String;
            var _local_6:String;
            var _local_7:Array;
            var _local_8:Object;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Array;
            var _local_12:Object;
            var _local_13:int;
            _buyCollect.removeAll();
            _giveCollect.removeAll();
            _getCollect.removeAll();
            if (((!(_selfOCid)) || (!(_grouponStat[_selfOCid]))))
            {
                return;
            };
            var _local_1:Object = _grouponStat[_selfOCid];
            for (_local_2 in _local_1.sendStat)
            {
                _local_3 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2];
                _local_4 = _local_1.sendStat[_local_2];
                _local_5 = ((_local_3) ? _local_3.name : "");
                _local_6 = LanguageUtil.replace(Language.GROUPON_PANEL[35], {
                    "item":_local_5,
                    "num":_local_4
                });
                _buyCollect.addItem({"record":_local_6});
            };
            if (_local_1.sendTrack)
            {
                _local_7 = [];
                for each (_local_8 in _local_1.sendTrack)
                {
                    _local_7.push(_local_8);
                };
                _local_7.sortOn("time", Array.DESCENDING);
                _local_9 = _local_7.length;
                _local_10 = 0;
                while (_local_10 < _local_9)
                {
                    _local_8 = _local_7[_local_10];
                    _local_8.index = (_local_10 + 1);
                    _local_8.time = getUtcTimeStr(_local_8.time);
                    _local_3 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_8.itemId];
                    _local_8.itemName = ((_local_3) ? _local_3.name : "");
                    _giveCollect.addItem(_local_8);
                    _local_10++;
                };
            };
            if (_local_1.getTrack)
            {
                _local_11 = [];
                for each (_local_12 in _local_1.getTrack)
                {
                    _local_11.push(_local_12);
                };
                _local_11.sortOn("time", Array.DESCENDING);
                _local_13 = _local_11.length;
                _local_10 = 0;
                while (_local_10 < _local_13)
                {
                    _local_12 = _local_11[_local_10];
                    _local_12.index = (_local_10 + 1);
                    _local_12.time = getUtcTimeStr(_local_12.time);
                    _local_3 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_12.itemId];
                    _local_12.itemName = ((_local_3) ? _local_3.name : "");
                    _getCollect.addItem(_local_12);
                    _local_10++;
                };
            };
        }

        private function _GrouponPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = GrouponPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function updateConf(_arg_1:Object):void
        {
            if (!this.visible)
            {
                return;
            };
            _grouponConf = _arg_1;
            this.updateTotal();
            this.updatePageOne();
            this.updatePageTwo();
        }

        override public function initialize():void
        {
            var target:GrouponPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GrouponPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GrouponPanelWatcherSetupUtil");
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

        private function _GrouponPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GROUPON_PANEL[0];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.GROUPON_PANEL[1];
            _local_1 = buttonBar.selectedIndex;
            _local_1 = _confCollect;
            _local_1 = _rebateCollect;
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT];
            _local_1 = Language.GROUPON_PANEL[8];
            _local_1 = Language.GROUPON_PANEL[9];
            _local_1 = Language.GROUPON_PANEL[10];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.GROUPON_PANEL[13];
            _local_1 = _buyCollect;
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = ((giftBar.selectedIndex == 0) ? _giveCollect : _getCollect);
            _local_1 = Language.GROUPON_PANEL[14];
            _local_1 = ((giftBar.selectedIndex == 0) ? Language.GROUPON_PANEL[15] : Language.GROUPON_PANEL[36]);
            _local_1 = Language.GROUPON_PANEL[16];
            _local_1 = Language.GROUPON_PANEL[17];
            _local_1 = Language.GROUPON_PANEL[18];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT];
            _local_1 = Language.GROUPON_PANEL[2];
            _local_1 = Language.GROUPON_PANEL[38];
        }

        public function ___GrouponPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            onCompelete(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get giftGrid():DataGrid
        {
            return (this._848973974giftGrid);
        }

        public function set giftBar(_arg_1:ToggleButtonBar):void
        {
            var _local_2:Object = this._27380931giftBar;
            if (_local_2 !== _arg_1)
            {
                this._27380931giftBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "giftBar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _confCollect():ArrayCollection
        {
            return (this._270866343_confCollect);
        }

        [Bindable(event="propertyChange")]
        private function get _getCollect():ArrayCollection
        {
            return (this._1220349293_getCollect);
        }

        private function _GrouponPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GrouponPanel_DataGridColumn1 = _local_1;
            _local_1.itemRenderer = _GrouponPanel_ClassFactory2_c();
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_GrouponPanel_DataGridColumn1", _GrouponPanel_DataGridColumn1);
            return (_local_1);
        }

        private function _GrouponPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GrouponPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "time";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_GrouponPanel_DataGridColumn5", _GrouponPanel_DataGridColumn5);
            return (_local_1);
        }

        private function onCompelete(_arg_1:FlexEvent):void
        {
            buttonBar.selectedIndex = 0;
            giftBar.selectedIndex = 0;
        }

        public function set descText(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1017317214descText;
            if (_local_2 !== _arg_1)
            {
                this._1017317214descText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descText", _local_2, _arg_1));
            };
        }

        public function updateStat(_arg_1:Object):void
        {
            if (!this.visible)
            {
                return;
            };
            if (_arg_1.diffVer)
            {
                _grouponStat = {};
            };
            _grouponStat = ((_grouponStat) || ({}));
            _grouponStat[_arg_1.fromOCid] = _arg_1.fromInfo;
            if (((_arg_1.toOCid) && (_arg_1.toInfo)))
            {
                _grouponStat[_arg_1.toOCid] = _arg_1.toInfo;
            };
            _champDict = ((_champDict) || ({}));
            _champDict[_arg_1.itemId] = _arg_1.champInfo;
            this.updateTotal();
            this.updatePageOne();
            this.updatePageThree();
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

        private function _GrouponPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = GrouponItem;
            return (_local_1);
        }

        private function set _buyCollect(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1031834979_buyCollect;
            if (_local_2 !== _arg_1)
            {
                this._1031834979_buyCollect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_buyCollect", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get giftBar():ToggleButtonBar
        {
            return (this._27380931giftBar);
        }

        private function onGetGiftAlert(_arg_1:String):void
        {
            Alert.show(_arg_1);
        }

        private function getUtcTimeStr(_arg_1:Number):String
        {
            if (!_dateFormatter)
            {
                _dateFormatter = new DateFormatter();
                _dateFormatter.formatString = "YYYY年MM月DD日HH:NN";
            };
            return (_dateFormatter.format(new Date(_arg_1)));
        }

        [Bindable(event="propertyChange")]
        public function get viewStack():ViewStack
        {
            return (this._1584105757viewStack);
        }

        private function receiveHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            _core.remote.call("getAllGrouponGift", new Responder(onGetGiftAlert));
        }

        private function _GrouponPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GrouponPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                buttonBar.filters = _arg_1;
            }, "buttonBar.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Language.GROUPON_PANEL[1]);
            }, function (_arg_1:Object):void
            {
                buttonBar.dataProvider = _arg_1;
            }, "buttonBar.dataProvider");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (buttonBar.selectedIndex);
            }, function (_arg_1:int):void
            {
                viewStack.selectedIndex = _arg_1;
            }, "viewStack.selectedIndex");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_confCollect);
            }, function (_arg_1:Object):void
            {
                _GrouponPanel_TileList1.dataProvider = _arg_1;
            }, "_GrouponPanel_TileList1.dataProvider");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_rebateCollect);
            }, function (_arg_1:Object):void
            {
                _GrouponPanel_DataGrid1.dataProvider = _arg_1;
            }, "_GrouponPanel_DataGrid1.dataProvider");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT]);
            }, function (_arg_1:Array):void
            {
                _GrouponPanel_DataGrid1.filters = _arg_1;
            }, "_GrouponPanel_DataGrid1.filters");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_DataGridColumn1.headerText = _arg_1;
            }, "_GrouponPanel_DataGridColumn1.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_DataGridColumn2.headerText = _arg_1;
            }, "_GrouponPanel_DataGridColumn2.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_DataGridColumn3.headerText = _arg_1;
            }, "_GrouponPanel_DataGridColumn3.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                giftBar.filters = _arg_1;
            }, "giftBar.filters");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Language.GROUPON_PANEL[13]);
            }, function (_arg_1:Object):void
            {
                giftBar.dataProvider = _arg_1;
            }, "giftBar.dataProvider");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_buyCollect);
            }, function (_arg_1:Object):void
            {
                _GrouponPanel_TileList2.dataProvider = _arg_1;
            }, "_GrouponPanel_TileList2.dataProvider");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                _GrouponPanel_TileList2.filters = _arg_1;
            }, "_GrouponPanel_TileList2.filters");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return ((giftBar.selectedIndex == 0) ? _giveCollect : _getCollect);
            }, function (_arg_1:Object):void
            {
                giftGrid.dataProvider = _arg_1;
            }, "giftGrid.dataProvider");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_DataGridColumn4.headerText = _arg_1;
            }, "_GrouponPanel_DataGridColumn4.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((giftBar.selectedIndex == 0) ? Language.GROUPON_PANEL[15] : Language.GROUPON_PANEL[36]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_DataGridColumn5.headerText = _arg_1;
            }, "_GrouponPanel_DataGridColumn5.headerText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_DataGridColumn6.headerText = _arg_1;
            }, "_GrouponPanel_DataGridColumn6.headerText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_DataGridColumn7.headerText = _arg_1;
            }, "_GrouponPanel_DataGridColumn7.headerText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_DataGridColumn8.headerText = _arg_1;
            }, "_GrouponPanel_DataGridColumn8.headerText");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT]);
            }, function (_arg_1:Array):void
            {
                totalRebate.filters = _arg_1;
            }, "totalRebate.filters");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_BasicGlowButton1.label = _arg_1;
            }, "_GrouponPanel_BasicGlowButton1.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_BasicGlowButton2.label = _arg_1;
            }, "_GrouponPanel_BasicGlowButton2.label");
            result[22] = binding;
            return (result);
        }

        public function ___GrouponPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            getHandler(_arg_1);
        }

        private function onGetGrouponInfo(_arg_1:Object):void
        {
            isRenRen = (int(_arg_1.cf) == 2);
            _grouponConf = _arg_1.conf;
            _grouponStat = _arg_1.stat;
            _selfOCid = _arg_1.ocid;
            _champDict = _grouponStat[CHAMP_INDEX];
            this.updateTotal();
            this.updatePageOne();
            this.updatePageTwo();
            this.updatePageThree();
            descText.htmlText = _grouponConf.descript;
        }

        public function updateChamp(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:String;
            var _local_4:Object;
            if (((!(this.visible)) || (!(_arg_1))))
            {
                return;
            };
            _champDict = _arg_1;
            for each (_local_2 in _confCollect)
            {
                _local_3 = _local_2.itemId;
                if (!((!(_local_3)) || (!(_arg_1[_local_3]))))
                {
                    _local_4 = _arg_1[_local_3];
                    _local_2.champName = _local_4.name;
                    _local_2.champBuy = _local_4.num;
                    _local_2.serverId = _local_4.psId;
                };
            };
            _confCollect.refresh();
            this.updateTotal();
        }

        private function updateTotal():void
        {
            var _local_6:Object;
            var _local_7:String;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:String;
            var _local_15:Object;
            var _local_16:*;
            var _local_17:Object;
            var _local_18:Object;
            var _local_19:int;
            var _local_20:Number;
            var _local_1:int;
            var _local_2:Object = _grouponConf.itemConf;
            var _local_3:Object = (((_selfOCid) && (_grouponStat)) ? _grouponStat[_selfOCid] : null);
            var _local_4:Object = ((_local_3) ? _local_3.sendStat : null);
            var _local_5:Object = {};
            for each (_local_6 in _grouponStat)
            {
                _local_8 = _local_6.sendStat;
                for (_local_7 in _local_8)
                {
                    if (!_local_5[_local_7])
                    {
                        _local_5[_local_7] = 0;
                    };
                    _local_5[_local_7] = (_local_5[_local_7] + Number(_local_8[_local_7]));
                };
            };
            for (_local_7 in _local_5)
            {
                _local_9 = _local_2[_local_7];
                if (_local_9)
                {
                    _local_10 = _local_5[_local_7];
                    _local_11 = (((_local_4) && (_local_4[_local_7])) ? Number(_local_4[_local_7]) : 0);
                    _local_12 = GRADE_INFO.length;
                    _local_13 = (_local_12 - 1);
                    while (_local_13 >= 0)
                    {
                        _local_14 = GRADE_INFO[_local_13];
                        _local_15 = _local_9[_local_14];
                        if (_local_10 >= Number(_local_15.num))
                        {
                            _local_16 = _local_15.gain;
                            _local_1 = (_local_1 + (_local_11 * _local_16));
                            break;
                        };
                        _local_13--;
                    };
                };
            };
            for (_local_7 in _champDict)
            {
                _local_17 = _champDict[_local_7];
                _local_9 = _local_2[_local_7];
                if ((((_local_9) && (_local_9.champ)) && (_local_17.ocid == _selfOCid)))
                {
                    _local_18 = _local_9.champ;
                    _local_19 = int(_local_17.num);
                    _local_20 = Number(_local_18.gain);
                    _local_1 = (_local_1 + (_local_19 * _local_20));
                };
            };
            totalRebate.text = LanguageUtil.replace(Language.GROUPON_PANEL[3], {"num":_local_1});
        }


    }
}//package com.qeedoo.ui.view.compDragable

