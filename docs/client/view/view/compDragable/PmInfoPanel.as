// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PmInfoPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.DataGrid;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
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

    public class PmInfoPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _112204332view1:Canvas;
        public var _PmInfoPanel_Label1:Label;
        public var _PmInfoPanel_Label2:Label;
        public var _PmInfoPanel_Label3:Label;
        public var _PmInfoPanel_Label4:Label;
        public var _PmInfoPanel_Label5:Label;
        public var _PmInfoPanel_Label6:Label;
        public var _PmInfoPanel_DataGridColumn10:DataGridColumn;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _1075281739vipInfoData:DataGrid;
        private var VIP_TEMP_LEVEL_DESC:String = "vip";
        public var _PmInfoPanel_Image1:Image;
        public var _PmInfoPanel_Image2:Image;
        public var _PmInfoPanel_Image3:Image;
        public var _PmInfoPanel_DataGridColumn1:DataGridColumn;
        public var _PmInfoPanel_DataGridColumn2:DataGridColumn;
        public var _PmInfoPanel_DataGridColumn3:DataGridColumn;
        public var _PmInfoPanel_DataGridColumn4:DataGridColumn;
        public var _PmInfoPanel_DataGridColumn5:DataGridColumn;
        public var _PmInfoPanel_DataGridColumn6:DataGridColumn;
        public var _PmInfoPanel_DataGridColumn7:DataGridColumn;
        public var _PmInfoPanel_DataGridColumn8:DataGridColumn;
        public var _PmInfoPanel_DataGridColumn9:DataGridColumn;
        private var _112204333view2:Canvas;
        private var VIP_TEMP_VALUE_DESC:String = "value";
        private var _1616773894view1Info:IntroText;
        private var _110371416title:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":585,
                    "height":340,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"title"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":39,
                                "width":565,
                                "height":285,
                                "styleName":"txtArea",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":120,
                                            "height":24,
                                            "x":20,
                                            "y":10
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
                                            "width":120,
                                            "height":24,
                                            "x":140,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"view1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":31,
                                            "width":545,
                                            "height":244,
                                            "visible":true,
                                            "styleName":"txtArea",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":169,
                                                        "height":68,
                                                        "x":10,
                                                        "y":3,
                                                        "styleName":"txtArea",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_PmInfoPanel_Image1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":54,
                                                                    "height":55,
                                                                    "x":15,
                                                                    "y":6
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PmInfoPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":77,
                                                                    "y":10,
                                                                    "width":60,
                                                                    "height":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PmInfoPanel_Label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":77,
                                                                    "y":33,
                                                                    "width":60,
                                                                    "height":25
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
                                                        "width":169,
                                                        "height":68,
                                                        "x":179,
                                                        "y":3,
                                                        "styleName":"txtArea",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_PmInfoPanel_Image2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":54,
                                                                    "height":55,
                                                                    "x":15,
                                                                    "y":6
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PmInfoPanel_Label3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":77,
                                                                    "y":10,
                                                                    "width":60,
                                                                    "height":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PmInfoPanel_Label4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":77,
                                                                    "y":33,
                                                                    "width":60,
                                                                    "height":25
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
                                                        "width":169,
                                                        "height":68,
                                                        "x":348,
                                                        "y":3,
                                                        "styleName":"txtArea",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_PmInfoPanel_Image3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":54,
                                                                    "height":55,
                                                                    "x":15,
                                                                    "y":6
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PmInfoPanel_Label5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":77,
                                                                    "y":10,
                                                                    "width":60,
                                                                    "height":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PmInfoPanel_Label6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":77,
                                                                    "y":33,
                                                                    "width":60,
                                                                    "height":25
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"view1Info",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":74,
                                                        "x":10,
                                                        "width":525,
                                                        "height":160
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"view2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":31,
                                            "width":545,
                                            "height":244,
                                            "styleName":"txtArea",
                                            "visible":false,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"vipInfoData",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "width":505,
                                                        "x":5,
                                                        "horizontalScrollPolicy":"off",
                                                        "columns":[_PmInfoPanel_DataGridColumn1_i(), _PmInfoPanel_DataGridColumn2_i(), _PmInfoPanel_DataGridColumn3_i(), _PmInfoPanel_DataGridColumn4_i(), _PmInfoPanel_DataGridColumn5_i(), _PmInfoPanel_DataGridColumn6_i(), _PmInfoPanel_DataGridColumn7_i(), _PmInfoPanel_DataGridColumn8_i(), _PmInfoPanel_DataGridColumn9_i(), _PmInfoPanel_DataGridColumn10_i()]
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
        private var rightArray:Array = new Array();
        private var carePic:Class = PmInfoPanel_carePic;
        private var powerPic:Class = PmInfoPanel_powerPic;
        private var richPic:Class = PmInfoPanel_richPic;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PmInfoPanel()
        {
            mx_internal::_document = this;
            this.width = 585;
            this.height = 340;
            this.styleName = "StandardContent";
            this.x = 92.5;
            this.y = 76;
            this.addEventListener("creationComplete", ___PmInfoPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PmInfoPanel._watcherSetupUtil = _arg_1;
        }


        private function init():void
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_4:*;
            var _local_1:Array = GameData.d[GamePredef.TBL_PM_RIGHT];
            _local_1.sortOn("sortIndex", Array.NUMERIC);
            for (_local_2 in _local_1)
            {
                if (((_local_1[_local_2]) && (!(Number(_local_1[_local_2].id) == 15))))
                {
                    _local_3 = new Object();
                    _local_3["desc"] = _local_1[_local_2]["desc2"];
                    _local_4 = 1;
                    while (_local_4 <= 9)
                    {
                        if (((_local_1[_local_2][("vip" + _local_4)]) && (Number(_local_1[_local_2][("vip" + _local_4)]) > 0)))
                        {
                            _local_3[("vip" + _local_4)] = "√";
                            if (((_local_1[_local_2][("value" + _local_4)]) && (!(Number(_local_1[_local_2].id) == 1))))
                            {
                                _local_3[("vip" + _local_4)] = _local_1[_local_2][("value" + _local_4)];
                                if (((_local_1[_local_2][("value" + _local_4)]) && (((((Number(_local_1[_local_2].id) == 3) || (Number(_local_1[_local_2].id) == 30)) || (Number(_local_1[_local_2].id) == 6)) || (Number(_local_1[_local_2].id) == 8)) || (Number(_local_1[_local_2].id) == 9))))
                                {
                                    _local_3[("vip" + _local_4)] = (_local_1[_local_2][("value" + _local_4)] + "%");
                                };
                            };
                        }
                        else
                        {
                            _local_3[("vip" + _local_4)] = "×";
                        };
                        _local_4++;
                    };
                    rightArray.push(_local_3);
                };
            };
            if (view2)
            {
                vipInfoData.dataProvider = rightArray;
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

        private function _PmInfoPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn1 = _local_1;
            _local_1.width = 140;
            _local_1.dataField = "desc";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn1", _PmInfoPanel_DataGridColumn1);
            return (_local_1);
        }

        private function _PmInfoPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn9 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "vip8";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn9", _PmInfoPanel_DataGridColumn9);
            return (_local_1);
        }

        private function _PmInfoPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn5 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "vip4";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn5", _PmInfoPanel_DataGridColumn5);
            return (_local_1);
        }

        private function _PmInfoPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PM_INFO_PANEL[0];
            _local_1 = Language.PM_INFO_PANEL[1];
            _local_1 = Language.PM_INFO_PANEL[2];
            _local_1 = richPic;
            _local_1 = Language.PM_INFO_PANEL[14];
            _local_1 = Language.PM_INFO_PANEL[17];
            _local_1 = carePic;
            _local_1 = Language.PM_INFO_PANEL[13];
            _local_1 = Language.PM_INFO_PANEL[16];
            _local_1 = powerPic;
            _local_1 = Language.PM_INFO_PANEL[12];
            _local_1 = Language.PM_INFO_PANEL[15];
            _local_1 = Language.PM_INFO_PANEL[18];
            _local_1 = Language.PM_INFO_PANEL[3];
            _local_1 = Language.PM_INFO_PANEL[4];
            _local_1 = Language.PM_INFO_PANEL[5];
            _local_1 = Language.PM_INFO_PANEL[6];
            _local_1 = Language.PM_INFO_PANEL[7];
            _local_1 = Language.PM_INFO_PANEL[8];
            _local_1 = Language.PM_INFO_PANEL[9];
            _local_1 = Language.PM_INFO_PANEL[10];
            _local_1 = Language.PM_INFO_PANEL[19];
            _local_1 = Language.PM_INFO_PANEL[20];
        }

        [Bindable(event="propertyChange")]
        public function get view2():Canvas
        {
            return (this._112204333view2);
        }

        [Bindable(event="propertyChange")]
        public function get view1():Canvas
        {
            return (this._112204332view1);
        }

        private function _PmInfoPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn8 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "vip7";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn8", _PmInfoPanel_DataGridColumn8);
            return (_local_1);
        }

        public function set view1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._112204332view1;
            if (_local_2 !== _arg_1)
            {
                this._112204332view1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "view1", _local_2, _arg_1));
            };
        }

        public function set view2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._112204333view2;
            if (_local_2 !== _arg_1)
            {
                this._112204333view2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "view2", _local_2, _arg_1));
            };
        }

        private function _PmInfoPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn4 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "vip3";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn4", _PmInfoPanel_DataGridColumn4);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get title():BasicTitleCanvas
        {
            return (this._110371416title);
        }

        public function set vipInfoData(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1075281739vipInfoData;
            if (_local_2 !== _arg_1)
            {
                this._1075281739vipInfoData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vipInfoData", _local_2, _arg_1));
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        override public function initialize():void
        {
            var target:PmInfoPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PmInfoPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PmInfoPanelWatcherSetupUtil");
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

        private function _PmInfoPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn3 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "vip2";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn3", _PmInfoPanel_DataGridColumn3);
            return (_local_1);
        }

        private function _PmInfoPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn7 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "vip6";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn7", _PmInfoPanel_DataGridColumn7);
            return (_local_1);
        }

        public function set title(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        private function _PmInfoPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (richPic);
            }, function (_arg_1:Object):void
            {
                _PmInfoPanel_Image1.source = _arg_1;
            }, "_PmInfoPanel_Image1.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_Label1.text = _arg_1;
            }, "_PmInfoPanel_Label1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_Label2.text = _arg_1;
            }, "_PmInfoPanel_Label2.text");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (carePic);
            }, function (_arg_1:Object):void
            {
                _PmInfoPanel_Image2.source = _arg_1;
            }, "_PmInfoPanel_Image2.source");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_Label3.text = _arg_1;
            }, "_PmInfoPanel_Label3.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_Label4.text = _arg_1;
            }, "_PmInfoPanel_Label4.text");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (powerPic);
            }, function (_arg_1:Object):void
            {
                _PmInfoPanel_Image3.source = _arg_1;
            }, "_PmInfoPanel_Image3.source");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_Label5.text = _arg_1;
            }, "_PmInfoPanel_Label5.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_Label6.text = _arg_1;
            }, "_PmInfoPanel_Label6.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                view1Info.text = _arg_1;
            }, "view1Info.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn1.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn1.headerText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn2.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn2.headerText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn3.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn3.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn4.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn4.headerText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn5.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn5.headerText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn6.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn6.headerText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn7.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn7.headerText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn8.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn8.headerText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn9.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn9.headerText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_INFO_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PmInfoPanel_DataGridColumn10.headerText = _arg_1;
            }, "_PmInfoPanel_DataGridColumn10.headerText");
            result[22] = binding;
            return (result);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabClick(2);
        }

        private function _PmInfoPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn10 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "vip9";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn10", _PmInfoPanel_DataGridColumn10);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get vipInfoData():DataGrid
        {
            return (this._1075281739vipInfoData);
        }

        private function _PmInfoPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn6 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "vip5";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn6", _PmInfoPanel_DataGridColumn6);
            return (_local_1);
        }

        private function _PmInfoPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PmInfoPanel_DataGridColumn2 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "vip1";
            BindingManager.executeBindings(this, "_PmInfoPanel_DataGridColumn2", _PmInfoPanel_DataGridColumn2);
            return (_local_1);
        }

        public function ___PmInfoPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function tabClick(_arg_1:Number):void
        {
            if (_arg_1 == 1)
            {
                view2.visible = false;
                view1.visible = true;
                tabBtn0.selected = true;
                tabBtn1.selected = false;
            }
            else
            {
                view2.visible = true;
                view1.visible = false;
                tabBtn1.selected = true;
                tabBtn0.selected = false;
            };
        }

        public function set view1Info(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1616773894view1Info;
            if (_local_2 !== _arg_1)
            {
                this._1616773894view1Info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "view1Info", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get view1Info():IntroText
        {
            return (this._1616773894view1Info);
        }


    }
}//package com.qeedoo.ui.view.compDragable

