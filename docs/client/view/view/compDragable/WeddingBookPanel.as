// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WeddingBookPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.ComboBox;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.controls.CheckBox;
    import mx.collections.ArrayCollection;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.controls.Alert;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import mx.formatters.DateFormatter;
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

    public class WeddingBookPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2070514658ns_hour:NumericStepper;
        public var _WeddingBookPanel_BasicGlowButton2:BasicGlowButton;
        private var _565264340cb_line:ComboBox;
        public var _WeddingBookPanel_DataGridColumn1:DataGridColumn;
        public var _WeddingBookPanel_DataGridColumn3:DataGridColumn;
        public var _WeddingBookPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _709352686isBooked:Boolean = false;
        public var _WeddingBookPanel_DataGridColumn2:DataGridColumn;
        private var _3203dg:DataGrid;
        public var _WeddingBookPanel_RoundedLabel1:RoundedLabel;
        public var _WeddingBookPanel_RoundedLabel3:RoundedLabel;
        public var _WeddingBookPanel_RoundedLabel4:RoundedLabel;
        public var _WeddingBookPanel_RoundedLabel2:RoundedLabel;
        private var _1057325618ns_minute:NumericStepper;
        private var _1237572437cav_reserve:SimpleCanvas;
        private var _1480776481_cbIdx:int;
        private var _736862982ch_flag:CheckBox;
        private var bookedArr:ArrayCollection;
        public var _WeddingBookPanel_BasicGlowButton1:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":400,
                    "height":370,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_WeddingBookPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.bottom = "85";
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"dg",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "resizableColumns":false,
                                            "draggableColumns":false,
                                            "x":10,
                                            "y":10,
                                            "columns":[_WeddingBookPanel_DataGridColumn1_i(), _WeddingBookPanel_DataGridColumn2_i(), _WeddingBookPanel_DataGridColumn3_i(), _WeddingBookPanel_DataGridColumn4_c()]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"cav_reserve",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":true,
                                "styleName":"CanvasBorder",
                                "height":60,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_WeddingBookPanel_RoundedLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "5";
                                        this.horizontalCenter = "0";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"cb_line",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42,
                                            "y":25,
                                            "labelField":"name",
                                            "width":95
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_hour",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":145,
                                            "y":28,
                                            "minimum":0,
                                            "maximum":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_minute",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":225,
                                            "y":28,
                                            "minimum":0,
                                            "maximum":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_WeddingBookPanel_RoundedLabel2",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "30";
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"x":201});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_WeddingBookPanel_RoundedLabel3",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "29";
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "width":30,
                                            "height":21
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_WeddingBookPanel_RoundedLabel4",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "30";
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"x":280});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_WeddingBookPanel_BasicGlowButton1",
                                    "events":{"click":"___WeddingBookPanel_BasicGlowButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.left = "310";
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
                                    "id":"_WeddingBookPanel_BasicGlowButton2",
                                    "events":{"click":"___WeddingBookPanel_BasicGlowButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.left = "310";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":60
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"ch_flag",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":294,
                                            "y":4
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

        public function WeddingBookPanel()
        {
            mx_internal::_document = this;
            this.width = 400;
            this.height = 370;
            this.styleName = "StandardContent";
            this.x = 135;
            this.y = 308;
            this.addEventListener("creationComplete", ___WeddingBookPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WeddingBookPanel._watcherSetupUtil = _arg_1;
        }


        private function bookWeddingHall():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:Date;
                var _local_3:Object;
                if (_arg_1.detail == Alert.YES)
                {
                    _local_2 = new Date();
                    _local_3 = new Object();
                    _local_3.line = cb_line.selectedItem.id;
                    _local_3.hour = ns_hour.value;
                    _local_3.minute = ns_minute.value;
                    if (ch_flag.selected)
                    {
                        _local_3.flag = GamePredef.FLAG_PEOPLE_ENTER_INVITATION;
                    }
                    else
                    {
                        _local_3.flag = GamePredef.FLAG_PEOPLE_ENTER_FREE;
                    };
                    _core.remote.bookWeddingHall(_local_3);
                };
            };
            var msg:String = Language.WEDDING_BOOK_PANEL_U[18];
            msg = msg.replace("{line}", cb_line.selectedItem.name).replace("{hour}", ns_hour.value).replace("{minute}", ns_minute.value);
            Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
        }

        private function setEnable(_arg_1:Boolean):void
        {
            ns_hour.enabled = _arg_1;
            ns_minute.enabled = _arg_1;
            cb_line.enabled = _arg_1;
            ch_flag.enabled = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get ch_flag():CheckBox
        {
            return (this._736862982ch_flag);
        }

        [Bindable(event="propertyChange")]
        public function get dg():DataGrid
        {
            return (this._3203dg);
        }

        public function set cb_line(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._565264340cb_line;
            if (_local_2 !== _arg_1)
            {
                this._565264340cb_line = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb_line", _local_2, _arg_1));
            };
        }

        public function ___WeddingBookPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        override public function initialize():void
        {
            var target:WeddingBookPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WeddingBookPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WeddingBookPanelWatcherSetupUtil");
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

        private function _WeddingBookPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WEDDING_BOOK_PANEL_U[0];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[1];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[2];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[3];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[4];
            _local_1 = _cbIdx;
            _local_1 = _core._lineList;
            _local_1 = Language.WEDDING_BOOK_PANEL_U[16];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[15];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[17];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[5];
            _local_1 = (!(isBooked));
            _local_1 = Language.WEDDING_BOOK_PANEL_U[6];
            _local_1 = isBooked;
            _local_1 = Language.WEDDING_BOOK_PANEL_U[7];
            _local_1 = Language.WEDDING_BOOK_PANEL_U[8];
        }

        public function set ch_flag(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._736862982ch_flag;
            if (_local_2 !== _arg_1)
            {
                this._736862982ch_flag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ch_flag", _local_2, _arg_1));
            };
        }

        public function set dg(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._3203dg;
            if (_local_2 !== _arg_1)
            {
                this._3203dg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get isBooked():Boolean
        {
            return (this._709352686isBooked);
        }

        private function _WeddingBookPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WeddingBookPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "lineName";
            BindingManager.executeBindings(this, "_WeddingBookPanel_DataGridColumn1", _WeddingBookPanel_DataGridColumn1);
            return (_local_1);
        }

        private function _WeddingBookPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WeddingBookPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "time";
            _local_1.width = 85;
            BindingManager.executeBindings(this, "_WeddingBookPanel_DataGridColumn3", _WeddingBookPanel_DataGridColumn3);
            return (_local_1);
        }

        public function init():void
        {
        }

        public function set ns_minute(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1057325618ns_minute;
            if (_local_2 !== _arg_1)
            {
                this._1057325618ns_minute = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns_minute", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ns_hour():NumericStepper
        {
            return (this._2070514658ns_hour);
        }

        public function set cav_reserve(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._1237572437cav_reserve;
            if (_local_2 !== _arg_1)
            {
                this._1237572437cav_reserve = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav_reserve", _local_2, _arg_1));
            };
        }

        private function set isBooked(_arg_1:Boolean):void
        {
            var _local_2:Object = this._709352686isBooked;
            if (_local_2 !== _arg_1)
            {
                this._709352686isBooked = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isBooked", _local_2, _arg_1));
            };
        }

        public function ___WeddingBookPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            bookWeddingHall();
        }

        private function setValue(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:Date;
            for (_local_2 in _core._lineList)
            {
                if (_core._lineList.getItemAt(_local_2).id == _arg_1.line)
                {
                    _cbIdx = _local_2;
                    break;
                };
            };
            _local_3 = new Date();
            _local_3.setTime(_arg_1.date);
            ns_hour.value = _local_3.getHours();
            ns_minute.value = _local_3.getMinutes();
            if (_arg_1.flag == GamePredef.FLAG_PEOPLE_ENTER_FREE)
            {
                ch_flag.selected = false;
            }
            else
            {
                ch_flag.selected = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get ns_minute():NumericStepper
        {
            return (this._1057325618ns_minute);
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

        private function _WeddingBookPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_WeddingBookPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_DataGridColumn1.headerText = _arg_1;
            }, "_WeddingBookPanel_DataGridColumn1.headerText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_DataGridColumn2.headerText = _arg_1;
            }, "_WeddingBookPanel_DataGridColumn2.headerText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_DataGridColumn3.headerText = _arg_1;
            }, "_WeddingBookPanel_DataGridColumn3.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_RoundedLabel1.text = _arg_1;
            }, "_WeddingBookPanel_RoundedLabel1.text");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (_cbIdx);
            }, function (_arg_1:int):void
            {
                cb_line.selectedIndex = _arg_1;
            }, "cb_line.selectedIndex");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_core._lineList);
            }, function (_arg_1:Object):void
            {
                cb_line.dataProvider = _arg_1;
            }, "cb_line.dataProvider");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_RoundedLabel2.text = _arg_1;
            }, "_WeddingBookPanel_RoundedLabel2.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_RoundedLabel3.text = _arg_1;
            }, "_WeddingBookPanel_RoundedLabel3.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_RoundedLabel4.text = _arg_1;
            }, "_WeddingBookPanel_RoundedLabel4.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_BasicGlowButton1.label = _arg_1;
            }, "_WeddingBookPanel_BasicGlowButton1.label");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isBooked));
            }, function (_arg_1:Boolean):void
            {
                _WeddingBookPanel_BasicGlowButton1.visible = _arg_1;
            }, "_WeddingBookPanel_BasicGlowButton1.visible");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_BasicGlowButton2.label = _arg_1;
            }, "_WeddingBookPanel_BasicGlowButton2.label");
            result[12] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (isBooked);
            }, function (_arg_1:Boolean):void
            {
                _WeddingBookPanel_BasicGlowButton2.visible = _arg_1;
            }, "_WeddingBookPanel_BasicGlowButton2.visible");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                ch_flag.label = _arg_1;
            }, "ch_flag.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                ch_flag.toolTip = _arg_1;
            }, "ch_flag.toolTip");
            result[15] = binding;
            return (result);
        }

        private function set _cbIdx(_arg_1:int):void
        {
            var _local_2:Object = this._1480776481_cbIdx;
            if (_local_2 !== _arg_1)
            {
                this._1480776481_cbIdx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_cbIdx", _local_2, _arg_1));
            };
        }

        public function set ns_hour(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._2070514658ns_hour;
            if (_local_2 !== _arg_1)
            {
                this._2070514658ns_hour = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns_hour", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cav_reserve():SimpleCanvas
        {
            return (this._1237572437cav_reserve);
        }

        public function onInitBookList(_arg_1:Object):void
        {
            var _local_2:Date;
            var _local_3:Object;
            var _local_4:*;
            var _local_5:*;
            isBooked = false;
            setEnable(true);
            bookedArr = new ArrayCollection();
            _local_2 = new Date();
            for each (_local_3 in _arg_1)
            {
                if (_local_3)
                {
                    if (((_local_3.cid == _core.player.id) || (_local_3.pid == _core.player.id)))
                    {
                        isBooked = true;
                        setEnable(false);
                        setValue(_local_3);
                    };
                    _local_3.couples = ((_local_3.cname + ",") + _local_3.pname);
                    _local_2.setTime(_local_3.date);
                    _local_3.time = dateFormatter.format(_local_2);
                    for (_local_4 in _core._lineList)
                    {
                        if (_core._lineList.getItemAt(_local_4).id == _local_3.line)
                        {
                            _local_3.lineName = _core._lineList.getItemAt(_local_4).name;
                            break;
                        };
                    };
                    bookedArr.addItem(_local_3);
                };
            };
            if (!isBooked)
            {
                _local_5 = new Date().getTime();
                _local_2 = new Date();
                _local_2.setTime((_local_5 + ((15 * 60) * 1000)));
                ns_hour.value = _local_2.getHours();
                ns_minute.value = _local_2.getMinutes();
            };
            dg.dataProvider = bookedArr;
        }

        private function cancelWeddingHall():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.cancelWeddingHall();
                };
            };
            Alert.show(Language.WEDDING_BOOK_PANEL_U[19], "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get cb_line():ComboBox
        {
            return (this._565264340cb_line);
        }

        private function _WeddingBookPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WeddingBookPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "couples";
            BindingManager.executeBindings(this, "_WeddingBookPanel_DataGridColumn2", _WeddingBookPanel_DataGridColumn2);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get _cbIdx():int
        {
            return (this._1480776481_cbIdx);
        }

        private function _WeddingBookPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = WeddingBookPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function _WeddingBookPanel_DataGridColumn4_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "";
            _local_1.width = 60;
            _local_1.itemRenderer = _WeddingBookPanel_ClassFactory1_c();
            return (_local_1);
        }

        public function ___WeddingBookPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            cancelWeddingHall();
        }


    }
}//package com.qeedoo.ui.view.compDragable

