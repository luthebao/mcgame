// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.VipSuccinctPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ItemSlotEquFunc;
    import mx.controls.DataGrid;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import flash.events.MouseEvent;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.RendererLabel3;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
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

    public class VipSuccinctPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var resultArr:Object;
        private var _1978100406select2:CheckBox;
        public var oldPro:Object;
        private var _1978100405select1:CheckBox;
        public var _VipSuccinctPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1978100404select0:CheckBox;
        private var _1326029586dpSucc:Canvas;
        private var _103145573lock0:CheckBox;
        private var _1379509782oldPro0:Label;
        public var _alert:Alert;
        public var mwId:int = -1;
        private var _1978100413select9:CheckBox;
        public var _VipSuccinctPanel_BasicGlowButton1:BasicGlowButton;
        private var _1379509781oldPro1:Label;
        private var _1420671817succinctVipBtn:BasicGlowButton;
        public var _VipSuccinctPanel_Label1:Label;
        private var _273317502MwSuccinct:ItemSlotEquFunc;
        private var _1978100412select8:CheckBox;
        private var _425010661costInfo:Label;
        private var _103145575lock2:CheckBox;
        private var _1379509780oldPro2:Label;
        private var _1978100409select5:CheckBox;
        private var _646343081autoBuy:CheckBox;
        private var _1978100411select7:CheckBox;
        private var _1978100408select4:CheckBox;
        private var _1177195105itemInfo:Label;
        private var _1978100410select6:CheckBox;
        public var succinctId:int = -1;
        public var isChangeSlot:Boolean = false;
        private var _1978100407select3:CheckBox;
        private var _103145574lock1:CheckBox;
        private var _936841453vipSuccinctList:DataGrid;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":450,
                    "height":360,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_VipSuccinctPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ItemSlotEquFunc,
                        "id":"MwSuccinct",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":35,
                                "movable":false,
                                "x":20,
                                "dragable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"lock0",
                        "events":{"change":"__lock0_change"},
                        "stylesFactory":function ():void
                        {
                            this.left = "65";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "y":54
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"lock1",
                        "events":{"change":"__lock1_change"},
                        "stylesFactory":function ():void
                        {
                            this.left = "183";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "y":54
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"lock2",
                        "events":{"change":"__lock2_change"},
                        "stylesFactory":function ():void
                        {
                            this.left = "301";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "y":54
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_VipSuccinctPanel_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":75
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"oldPro0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":65,
                                "y":75
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"oldPro1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":183,
                                "y":75
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"oldPro2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":301,
                                "y":75
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"dpSucc",
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                            this.top = "90";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":410,
                                "styleName":"RoundedGradientBorder",
                                "height":210,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select0",
                                    "events":{"change":"__select0_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select1",
                                    "events":{"change":"__select1_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":25
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select2",
                                    "events":{"change":"__select2_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select3",
                                    "events":{"change":"__select3_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":65
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select4",
                                    "events":{"change":"__select4_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":85
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select5",
                                    "events":{"change":"__select5_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":105
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select6",
                                    "events":{"change":"__select6_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":125
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select7",
                                    "events":{"change":"__select7_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":145
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select8",
                                    "events":{"change":"__select8_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":165
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"select9",
                                    "events":{"change":"__select9_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "y":185
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"vipSuccinctList",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "45";
                                        this.top = "5";
                                        this.bottom = "5";
                                        this.right = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "headerHeight":0,
                                            "columns":[_VipSuccinctPanel_DataGridColumn1_c()]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"itemInfo",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "40";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":55});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"costInfo",
                        "stylesFactory":function ():void
                        {
                            this.right = "67";
                            this.bottom = "40";
                            this.color = 0xFFFFFF;
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_VipSuccinctPanel_BasicGlowButton1",
                        "events":{"click":"___VipSuccinctPanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "155";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "width":45
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"succinctVipBtn",
                        "events":{"click":"__succinctVipBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "75";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "width":65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"autoBuy",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "15";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":35});
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

        public function VipSuccinctPanel()
        {
            mx_internal::_document = this;
            this.width = 450;
            this.height = 360;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___VipSuccinctPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            VipSuccinctPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get oldPro0():Label
        {
            return (this._1379509782oldPro0);
        }

        public function set MwSuccinct(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object = this._273317502MwSuccinct;
            if (_local_2 !== _arg_1)
            {
                this._273317502MwSuccinct = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MwSuccinct", _local_2, _arg_1));
            };
        }

        public function clearSuccDb():void
        {
            if (!this.initialized)
            {
                return;
            };
            dpSucc.visible = false;
            this.vipSuccinctList.dataProvider = null;
            var _local_1:int;
            while (_local_1 < 10)
            {
                this[("select" + _local_1)].visible = false;
                this[("select" + _local_1)].selected = false;
                _local_1++;
            };
        }

        public function init():void
        {
            this.visible = true;
            if (this.mwId > 0)
            {
                this.eid = this.mwId;
            };
            this.updateMWSuccView(oldPro, resultArr);
        }

        [Bindable(event="propertyChange")]
        public function get vipSuccinctList():DataGrid
        {
            return (this._936841453vipSuccinctList);
        }

        public function __select3_change(_arg_1:Event):void
        {
            checkBoxChanged(3);
        }

        [Bindable(event="propertyChange")]
        public function get oldPro2():Label
        {
            return (this._1379509780oldPro2);
        }

        [Bindable(event="propertyChange")]
        public function get costInfo():Label
        {
            return (this._425010661costInfo);
        }

        public function set vipSuccinctList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._936841453vipSuccinctList;
            if (_local_2 !== _arg_1)
            {
                this._936841453vipSuccinctList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vipSuccinctList", _local_2, _arg_1));
            };
        }

        public function getColorIndex(_arg_1:Number, _arg_2:Object):int
        {
            var _local_3:int = -1;
            var _local_4:int;
            while (_local_4 < 4)
            {
                if (_arg_1 <= _arg_2[("top" + _local_4)])
                {
                    _local_3 = _local_4;
                    break;
                };
                _local_4++;
            };
            return (_local_3);
        }

        private function _VipSuccinctPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "pro";
            _local_1.itemRenderer = _VipSuccinctPanel_ClassFactory1_c();
            return (_local_1);
        }

        public function saveSuccinct():void
        {
            var saveFlag:int;
            if ((((!(this.MwSuccinct.giid)) || (this.MwSuccinct.giid < 0)) || (!(vipSuccinctList.dataProvider.length))))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[217], "", Alert.YES, null, null);
                return;
            };
            saveFlag = -1;
            var i:int;
            while (i < 10)
            {
                if (this[("select" + i)].selected)
                {
                    saveFlag = i;
                };
                i = (i + 1);
            };
            if (saveFlag < 0)
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[222], "", Alert.YES, null, null);
                return;
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.nc.call("onSureSuccinctMW", new Responder(onSureSuccinctMW), 1, saveFlag);
                };
            };
            _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[229], "", (Alert.YES | Alert.NO), null, func);
        }

        public function ___VipSuccinctPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            saveSuccinct();
        }

        public function __select2_change(_arg_1:Event):void
        {
            checkBoxChanged(2);
        }

        public function set costInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._425010661costInfo;
            if (_local_2 !== _arg_1)
            {
                this._425010661costInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "costInfo", _local_2, _arg_1));
            };
        }

        public function __select9_change(_arg_1:Event):void
        {
            checkBoxChanged(9);
        }

        [Bindable(event="propertyChange")]
        public function get autoBuy():CheckBox
        {
            return (this._646343081autoBuy);
        }

        public function updateMWSuccView(_arg_1:Object, _arg_2:Object, _arg_3:Boolean=true):void
        {
            var _local_6:int;
            var _local_7:int;
            var _local_8:ArrayCollection;
            var _local_9:int;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:int;
            if (!initialized)
            {
                this.oldPro = _arg_1;
                this.resultArr = _arg_2;
                return;
            };
            succinctVipBtn.enabled = true;
            if (_arg_1)
            {
                _local_7 = 0;
                while (_local_7 < 3)
                {
                    if (_arg_1[("succ" + _local_7)])
                    {
                        this[("oldPro" + _local_7)].htmlText = this.encodePropInfo(_arg_1[("succ" + _local_7)]);
                        this[("lock" + _local_7)].visible = true;
                        if (isChangeSlot)
                        {
                            this[("lock" + _local_7)].selected = false;
                        };
                    }
                    else
                    {
                        this[("oldPro" + _local_7)].htmlText = "";
                        this[("lock" + _local_7)].visible = false;
                        this[("lock" + _local_7)].selected = false;
                    };
                    _local_7++;
                };
            };
            if (_arg_2)
            {
                _local_8 = new ArrayCollection();
                _local_9 = 0;
                while (_local_9 < 10)
                {
                    if (_arg_2[("vip" + _local_9)])
                    {
                        this[("select" + _local_9)].visible = true;
                        this[("select" + _local_9)].selected = false;
                        _local_11 = {};
                        _local_6 = 0;
                        while (_local_6 < 3)
                        {
                            if (_arg_2[("vip" + _local_9)][("succ" + _local_6)])
                            {
                                _local_12 = GamePredef.ACTIVATE_MW_PRO[_arg_2[("vip" + _local_9)][("succ" + _local_6)]["propType"]];
                                _local_13 = getColorIndex(_arg_2[("vip" + _local_9)][("succ" + _local_6)]["propVal"], _local_12);
                                _local_11[("pro" + _local_6)] = (((GamePredef.EQUIPT_PROP_NAME[_arg_2[("vip" + _local_9)][("succ" + _local_6)]["propType"]] + " +") + _arg_2[("vip" + _local_9)][("succ" + _local_6)]["propVal"]) + ((_local_13 == 3) ? Language.EQUIPTFUNCPANEL_U[223] : ""));
                                _local_11[("color" + _local_6)] = GamePredef.MW_PRO_COLOR[_local_13];
                            }
                            else
                            {
                                if (_arg_1[("succ" + _local_6)])
                                {
                                    _local_12 = GamePredef.ACTIVATE_MW_PRO[_arg_1[("succ" + _local_6)]["propType"]];
                                    _local_13 = getColorIndex(_arg_1[("succ" + _local_6)]["propVal"], _local_12);
                                    _local_11[("pro" + _local_6)] = (((GamePredef.EQUIPT_PROP_NAME[_arg_1[("succ" + _local_6)]["propType"]] + " +") + _arg_1[("succ" + _local_6)]["propVal"]) + ((_local_13 == 3) ? Language.EQUIPTFUNCPANEL_U[223] : ""));
                                    _local_11[("color" + _local_6)] = GamePredef.MW_PRO_COLOR[_local_13];
                                }
                                else
                                {
                                    _local_11[("pro" + _local_6)] = "";
                                    _local_11[("color" + _local_6)] = GamePredef.MW_PRO_COLOR[0];
                                };
                            };
                            _local_6++;
                        };
                        _local_11.id = _local_9;
                        _local_8.addItem(_local_11);
                    }
                    else
                    {
                        this[("select" + _local_9)].visible = false;
                    };
                    _local_9++;
                };
                vipSuccinctList.dataProvider = _local_8;
                dpSucc.visible = true;
                _local_10 = _core.view.getUI(ViewManager.PANEL_EQUIPTFUNC);
                if (_local_10)
                {
                    _local_10.updateItemNum();
                };
            }
            else
            {
                if (_arg_3)
                {
                    clearSuccDb();
                };
            };
            var _local_4:int = _core.getItemNum(29, GamePredef.MW_SUCC_ITEM).num;
            itemInfo.text = (Language.EQUIPTFUNCPANEL_U[208] + _local_4);
            var _local_5:int;
            _local_6 = 0;
            while (_local_6 < 3)
            {
                if (this[("lock" + _local_6)].visible)
                {
                    _local_5 = (_local_5 + 10);
                };
                if (this[("lock" + _local_6)].selected)
                {
                    _local_5 = (_local_5 + 10);
                };
                _local_6++;
            };
            costInfo.text = Language.EQUIPTFUNCPANEL_U[209].replace("{num}", _local_5);
            isChangeSlot = false;
        }

        public function __select1_change(_arg_1:Event):void
        {
            checkBoxChanged(1);
        }

        public function succinctVip():void
        {
            var func:Function;
            if (((!(this.MwSuccinct.giid)) || (this.MwSuccinct.giid < 0)))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[226], "", Alert.YES, null, null);
                return;
            };
            var view:Object = _core.view.getUI(ViewManager.PANEL_EQUIPTFUNC);
            if (view)
            {
                if (view.haveSuccData())
                {
                    func = function (_arg_1:CloseEvent):*
                    {
                        var _local_2:Object;
                        if (_arg_1.detail == Alert.YES)
                        {
                            _succinctVip();
                            _local_2 = _core.view.getUI(ViewManager.PANEL_EQUIPTFUNC);
                            if (_local_2)
                            {
                                _local_2.cleanSuccData();
                            };
                        };
                    };
                    if (_alert)
                    {
                        PopUpManager.removePopUp(_alert);
                        _alert = null;
                    };
                    _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[220], "", (Alert.YES | Alert.NO), null, func);
                }
                else
                {
                    _succinctVip();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get lock1():CheckBox
        {
            return (this._103145574lock1);
        }

        [Bindable(event="propertyChange")]
        public function get lock2():CheckBox
        {
            return (this._103145575lock2);
        }

        public function __lock2_change(_arg_1:Event):void
        {
            changeSelected(2);
        }

        public function updateItemNum():void
        {
            if (!this.initialized)
            {
                return;
            };
            var _local_1:int = _core.getItemNum(29, GamePredef.MW_SUCC_ITEM).num;
            itemInfo.text = (Language.EQUIPTFUNCPANEL_U[208] + _local_1);
        }

        public function changeSelected(_arg_1:int):void
        {
            var _local_2:Array = new Array();
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < 3)
            {
                if (this[("lock" + _local_4)].visible)
                {
                    _local_3++;
                };
                if (this[("lock" + _local_4)].selected)
                {
                    _local_2.push(_local_4);
                };
                _local_4++;
            };
            if (((_local_3 == 1) || ((_local_3 - _local_2.length) == 0)))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[228], "", Alert.YES, null, null);
                this[("lock" + _arg_1)].selected = false;
                return;
            };
            var _local_5:int = ((_local_2.length + _local_3) * 10);
            costInfo.text = Language.EQUIPTFUNCPANEL_U[209].replace("{num}", _local_5);
        }

        public function set select3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100407select3;
            if (_local_2 !== _arg_1)
            {
                this._1978100407select3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select3", _local_2, _arg_1));
            };
        }

        public function set select0(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100404select0;
            if (_local_2 !== _arg_1)
            {
                this._1978100404select0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select0", _local_2, _arg_1));
            };
        }

        public function set select1(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100405select1;
            if (_local_2 !== _arg_1)
            {
                this._1978100405select1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select1", _local_2, _arg_1));
            };
        }

        private function _VipSuccinctPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererLabel3;
            return (_local_1);
        }

        public function __select8_change(_arg_1:Event):void
        {
            checkBoxChanged(8);
        }

        [Bindable(event="propertyChange")]
        public function get lock0():CheckBox
        {
            return (this._103145573lock0);
        }

        public function set select4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100408select4;
            if (_local_2 !== _arg_1)
            {
                this._1978100408select4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select4", _local_2, _arg_1));
            };
        }

        public function set select8(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100412select8;
            if (_local_2 !== _arg_1)
            {
                this._1978100412select8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemInfo():Label
        {
            return (this._1177195105itemInfo);
        }

        public function set select9(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100413select9;
            if (_local_2 !== _arg_1)
            {
                this._1978100413select9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select9", _local_2, _arg_1));
            };
        }

        public function __select0_change(_arg_1:Event):void
        {
            checkBoxChanged(0);
        }

        public function set select7(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100411select7;
            if (_local_2 !== _arg_1)
            {
                this._1978100411select7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select7", _local_2, _arg_1));
            };
        }

        public function set eid(_arg_1:int):*
        {
            this.visible = true;
            if (!initialized)
            {
                this.mwId = _arg_1;
                return;
            };
            if (_arg_1 < 0)
            {
                return;
            };
            if (_arg_1 != MwSuccinct.giid)
            {
                MwSuccinct.type = GamePredef.TBL_EQUIPT_INSTANCE;
                MwSuccinct.giid = _arg_1;
                succinctId = _arg_1;
            };
        }

        public function set select5(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100409select5;
            if (_local_2 !== _arg_1)
            {
                this._1978100409select5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get MwSuccinct():ItemSlotEquFunc
        {
            return (this._273317502MwSuccinct);
        }

        public function set select6(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100410select6;
            if (_local_2 !== _arg_1)
            {
                this._1978100410select6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select6", _local_2, _arg_1));
            };
        }

        public function set select2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1978100406select2;
            if (_local_2 !== _arg_1)
            {
                this._1978100406select2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "select2", _local_2, _arg_1));
            };
        }

        public function set succinctVipBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1420671817succinctVipBtn;
            if (_local_2 !== _arg_1)
            {
                this._1420671817succinctVipBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "succinctVipBtn", _local_2, _arg_1));
            };
        }

        public function __lock1_change(_arg_1:Event):void
        {
            changeSelected(1);
        }

        public function haveSuccData():Boolean
        {
            if ((((vipSuccinctList) && (vipSuccinctList.dataProvider)) && (vipSuccinctList.dataProvider.length)))
            {
                return (true);
            };
            return (false);
        }

        override public function initialize():void
        {
            var target:VipSuccinctPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _VipSuccinctPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_VipSuccinctPanelWatcherSetupUtil");
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

        private function _VipSuccinctPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.VIP_SUCCINCT_P[0];
            _local_1 = ItemSlotEquFunc.EQUIP_MW_SUB;
            _local_1 = Language.EQUIPTFUNCPANEL_U[210];
            _local_1 = Language.EQUIPTFUNCPANEL_U[210];
            _local_1 = Language.EQUIPTFUNCPANEL_U[210];
            _local_1 = Language.EQUIPTFUNCPANEL_U[206];
            _local_1 = Language.EQUIPTFUNCPANEL_U[212];
            _local_1 = Language.EQUIPTFUNCPANEL_U[213];
            _local_1 = Language.VIP_SUCCINCT_P[1];
            _local_1 = Language.EQUIPTFUNCPANEL_U[224];
        }

        public function __select7_change(_arg_1:Event):void
        {
            checkBoxChanged(7);
        }

        public function checkBoxChanged(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < 10)
            {
                this[("select" + _local_2)].selected = false;
                _local_2++;
            };
            this[("select" + _arg_1)].selected = true;
        }

        public function __lock0_change(_arg_1:Event):void
        {
            changeSelected(0);
        }

        public function _succinctVip():void
        {
            var _local_1:Boolean;
            var _local_2:Array = new Array();
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < 3)
            {
                if (((!(this[("lock" + _local_4)].visible)) || ((this[("lock" + _local_4)].visible) && (this[("lock" + _local_4)].selected))))
                {
                    _local_2[_local_4] = true;
                }
                else
                {
                    _local_2[_local_4] = false;
                    _local_1 = true;
                };
                if (this[("lock" + _local_4)].visible)
                {
                    _local_3 = (_local_3 + 10);
                };
                if (this[("lock" + _local_4)].selected)
                {
                    _local_3 = (_local_3 + 10);
                };
                _local_4++;
            };
            if (!_local_1)
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[215], "", Alert.YES, null, null);
                return;
            };
            var _local_5:int = _core.getItemNum(29, GamePredef.MW_SUCC_ITEM).num;
            if (((_local_5 < _local_3) && (!(this.autoBuy.selected))))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[227], "", Alert.YES, null, null);
                itemInfo.text = (Language.EQUIPTFUNCPANEL_U[208] + _local_5);
                return;
            };
            _core.remote.nc.call("succinctMWByVip", null, ((MwSuccinct.giid > 0) ? MwSuccinct.giid : this.succinctId), _local_2, autoBuy.selected);
            succinctVipBtn.enabled = false;
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

        public function viewClear(_arg_1:Boolean=false):void
        {
            if (!this.initialized)
            {
                return;
            };
            if (costInfo)
            {
                this.costInfo.text = Language.EQUIPTFUNCPANEL_U[209].replace("{num}", 0);
            };
            if (this.MwSuccinct)
            {
                this.MwSuccinct.clean();
            };
            clearSuccDb();
            if (!_arg_1)
            {
                succinctId = -1;
            };
            var _local_2:int;
            while (_local_2 < 3)
            {
                this[("lock" + _local_2)].visible = false;
                this[("lock" + _local_2)].selected = false;
                this[("oldPro" + _local_2)].htmlText = "";
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get select0():CheckBox
        {
            return (this._1978100404select0);
        }

        public function __select6_change(_arg_1:Event):void
        {
            checkBoxChanged(6);
        }

        [Bindable(event="propertyChange")]
        public function get select2():CheckBox
        {
            return (this._1978100406select2);
        }

        [Bindable(event="propertyChange")]
        public function get select3():CheckBox
        {
            return (this._1978100407select3);
        }

        [Bindable(event="propertyChange")]
        public function get select4():CheckBox
        {
            return (this._1978100408select4);
        }

        [Bindable(event="propertyChange")]
        public function get select5():CheckBox
        {
            return (this._1978100409select5);
        }

        [Bindable(event="propertyChange")]
        public function get select7():CheckBox
        {
            return (this._1978100411select7);
        }

        [Bindable(event="propertyChange")]
        public function get select1():CheckBox
        {
            return (this._1978100405select1);
        }

        [Bindable(event="propertyChange")]
        public function get select9():CheckBox
        {
            return (this._1978100413select9);
        }

        private function _VipSuccinctPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIP_SUCCINCT_P[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipSuccinctPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_VipSuccinctPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW_SUB);
            }, function (_arg_1:Object):void
            {
                MwSuccinct.acceptObj = _arg_1;
            }, "MwSuccinct.acceptObj");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[210];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lock0.label = _arg_1;
            }, "lock0.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[210];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lock1.label = _arg_1;
            }, "lock1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[210];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lock2.label = _arg_1;
            }, "lock2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[206];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipSuccinctPanel_Label1.text = _arg_1;
            }, "_VipSuccinctPanel_Label1.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[212];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipSuccinctPanel_BasicGlowButton1.label = _arg_1;
            }, "_VipSuccinctPanel_BasicGlowButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[213];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                succinctVipBtn.label = _arg_1;
            }, "succinctVipBtn.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIP_SUCCINCT_P[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                autoBuy.label = _arg_1;
            }, "autoBuy.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[224];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                autoBuy.toolTip = _arg_1;
            }, "autoBuy.toolTip");
            result[9] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get select6():CheckBox
        {
            return (this._1978100410select6);
        }

        public function unselectAutoBuy():void
        {
            if (((this.autoBuy) && (this.autoBuy.selected)))
            {
                this.autoBuy.selected = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get select8():CheckBox
        {
            return (this._1978100412select8);
        }

        [Bindable(event="propertyChange")]
        public function get succinctVipBtn():BasicGlowButton
        {
            return (this._1420671817succinctVipBtn);
        }

        public function set lock2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._103145575lock2;
            if (_local_2 !== _arg_1)
            {
                this._103145575lock2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lock2", _local_2, _arg_1));
            };
        }

        public function set oldPro0(_arg_1:Label):void
        {
            var _local_2:Object = this._1379509782oldPro0;
            if (_local_2 !== _arg_1)
            {
                this._1379509782oldPro0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPro0", _local_2, _arg_1));
            };
        }

        public function __select5_change(_arg_1:Event):void
        {
            checkBoxChanged(5);
        }

        public function set oldPro2(_arg_1:Label):void
        {
            var _local_2:Object = this._1379509780oldPro2;
            if (_local_2 !== _arg_1)
            {
                this._1379509780oldPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPro2", _local_2, _arg_1));
            };
        }

        public function set lock0(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._103145573lock0;
            if (_local_2 !== _arg_1)
            {
                this._103145573lock0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lock0", _local_2, _arg_1));
            };
        }

        public function set lock1(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._103145574lock1;
            if (_local_2 !== _arg_1)
            {
                this._103145574lock1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lock1", _local_2, _arg_1));
            };
        }

        public function set dpSucc(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1326029586dpSucc;
            if (_local_2 !== _arg_1)
            {
                this._1326029586dpSucc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dpSucc", _local_2, _arg_1));
            };
        }

        public function set oldPro1(_arg_1:Label):void
        {
            var _local_2:Object = this._1379509781oldPro1;
            if (_local_2 !== _arg_1)
            {
                this._1379509781oldPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPro1", _local_2, _arg_1));
            };
        }

        public function set itemInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1177195105itemInfo;
            if (_local_2 !== _arg_1)
            {
                this._1177195105itemInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemInfo", _local_2, _arg_1));
            };
        }

        public function encodePropInfo(_arg_1:Object, _arg_2:Boolean=false):String
        {
            var _local_4:int;
            var _local_3:Object = GamePredef.ACTIVATE_MW_PRO[_arg_1["propType"]];
            var _local_5:int;
            while (_local_5 < 4)
            {
                if (Number(_arg_1["propVal"]) <= _local_3[("top" + _local_5)])
                {
                    _local_4 = _local_5;
                    break;
                };
                _local_5++;
            };
            var _local_6:* = ((((((("<font color='" + GamePredef.MW_PRO_COLOR[_local_4]) + "'>") + GamePredef.EQUIPT_PROP_NAME[_arg_1["propType"]]) + " +") + _arg_1["propVal"]) + ((_local_4 == 3) ? Language.EQUIPTFUNCPANEL_U[223] : "")) + "</font>");
            if (_arg_2)
            {
                _local_6 = (_local_6 + (((("<font color='#ffffff'>(" + _local_3.valMin) + "~") + _local_3.valMax) + ")</font>"));
            };
            return (_local_6);
        }

        [Bindable(event="propertyChange")]
        public function get oldPro1():Label
        {
            return (this._1379509781oldPro1);
        }

        [Bindable(event="propertyChange")]
        public function get dpSucc():Canvas
        {
            return (this._1326029586dpSucc);
        }

        public function __succinctVipBtn_click(_arg_1:MouseEvent):void
        {
            succinctVip();
        }

        public function updateSuccData(_arg_1:int, _arg_2:Object):void
        {
            if (!this.MwSuccinct)
            {
                return;
            };
            if (this.MwSuccinct.giid != _arg_1)
            {
                return;
            };
            if (!initialized)
            {
                oldPro = _arg_2;
            }
            else
            {
                this.updateMWSuccView(_arg_2, null);
            };
        }

        public function onSureSuccinctMW(_arg_1:Object):*
        {
            if (((!(_arg_1)) || (!(_arg_1.f))))
            {
                return;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_EQUIPTFUNC);
            if (_local_2)
            {
                _local_2.updateSuccData(this.MwSuccinct.giid, _arg_1.flag);
            };
            this.updateMWSuccView(_arg_1.flag, null);
        }

        public function __select4_change(_arg_1:Event):void
        {
            checkBoxChanged(4);
        }

        public function clearOldProView():void
        {
            var _local_1:int;
            while (_local_1 < 3)
            {
                this[("oldPro" + _local_1)].htmlText = "";
                this[("lock" + _local_1)].visible = false;
                this[("lock" + _local_1)].selected = false;
                _local_1++;
            };
        }

        public function ___VipSuccinctPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.compDragable

