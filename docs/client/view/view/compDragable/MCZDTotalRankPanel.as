// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MCZDTotalRankPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.HBox;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.view.comp.Slot;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class MCZDTotalRankPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3586r4:HBox;
        private var _1554141554tabBtn5:BasicGlowButton;
        private var _111122r11:ItemSlot;
        private var _111184r31:ItemSlot;
        private var _type:*;
        private var _111156r24:ItemSlot;
        private var _3585r3:HBox;
        private var _111214r40:ItemSlot;
        private var _111276r60:ItemSlot;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _111123r12:ItemSlot;
        private var _111185r32:ItemSlot;
        private var _3584r2:HBox;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _1194431643idData:DataGrid;
        private var _111215r41:ItemSlot;
        private var _111277r61:ItemSlot;
        private var _111152r20:ItemSlot;
        private var _3583r1:HBox;
        private var _111124r13:ItemSlot;
        private var _111186r33:ItemSlot;
        private var _1554141555tabBtn4:BasicGlowButton;
        private var _3704tl:BasicTitleCanvas;
        private var _111216r42:ItemSlot;
        private var _111278r62:ItemSlot;
        private var _111153r21:ItemSlot;
        private var _111125r14:ItemSlot;
        private var _111187r34:ItemSlot;
        public var _MCZDTotalRankPanel_DataGridColumn1:DataGridColumn;
        public var _MCZDTotalRankPanel_DataGridColumn2:DataGridColumn;
        public var _MCZDTotalRankPanel_DataGridColumn3:DataGridColumn;
        private var _111154r22:ItemSlot;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _3588r6:HBox;
        private var _111121r10:ItemSlot;
        private var _111183r30:ItemSlot;
        public var _MCZDTotalRankPanel_RoundedLabel2:RoundedLabel;
        public var _MCZDTotalRankPanel_RoundedLabel3:RoundedLabel;
        public var _MCZDTotalRankPanel_RoundedLabel4:RoundedLabel;
        public var _MCZDTotalRankPanel_RoundedLabel5:RoundedLabel;
        public var _MCZDTotalRankPanel_RoundedLabel6:RoundedLabel;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var _111155r23:ItemSlot;
        private var _110371416title:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":480,
                    "height":518,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"tl"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "width":75,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":83,
                                "width":75,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn2",
                        "events":{"click":"__tabBtn2_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":157,
                                "width":75,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn3",
                        "events":{"click":"__tabBtn3_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":231,
                                "width":85,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn4",
                        "events":{"click":"__tabBtn4_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":314,
                                "width":85,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn5",
                        "events":{"click":"__tabBtn5_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":398,
                                "width":75,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "65";
                            this.left = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":470,
                                "height":250,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"idData",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "sortableColumns":false,
                                            "resizableColumns":false,
                                            "draggableColumns":false,
                                            "doubleClickEnabled":false,
                                            "columns":[_MCZDTotalRankPanel_DataGridColumn1_i(), _MCZDTotalRankPanel_DataGridColumn2_i(), _MCZDTotalRankPanel_DataGridColumn3_i()]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "323";
                            this.left = "5";
                            this.right = "5";
                            this.bottom = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"title",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":3,
                                            "text":"奖励:"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"r1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":108.3,
                                            "y":22.75,
                                            "width":341,
                                            "height":35,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r10"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r11"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r12"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r13"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r14"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"r2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":108.3,
                                            "y":55.05,
                                            "width":341,
                                            "height":35,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r20"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r21"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r22"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r23"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r24"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"r3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":108.3,
                                            "y":91.1,
                                            "width":341,
                                            "height":35,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r30"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r31"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r32"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r33"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r34"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"r4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":108.3,
                                            "y":123.4,
                                            "width":341,
                                            "height":35,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r40"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r41"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r42"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"r6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":108.3,
                                            "y":155.7,
                                            "width":341,
                                            "height":35,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r60"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r61"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"r62"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDTotalRankPanel_RoundedLabel2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":36,
                                            "y":25
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDTotalRankPanel_RoundedLabel3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":36,
                                            "y":57
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDTotalRankPanel_RoundedLabel4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":36,
                                            "y":93
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDTotalRankPanel_RoundedLabel5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":36,
                                            "y":125
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MCZDTotalRankPanel_RoundedLabel6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":36,
                                            "y":158
                                        });
                                    }
                                })]});
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _1185599352aRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _167710345bRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _1521020042cRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _1420637557dRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _67327860eRankDataProvider:ArrayCollection = new ArrayCollection();
        private var _1285981837fRankDataProvider:ArrayCollection = new ArrayCollection();
        public var MCZD_ALLRANK_AWARD:Array = [{
            "1":{
                "6936":1,
                "4913":50,
                "5":500,
                "2335":10,
                "6918":1
            },
            "2":{
                "6937":1,
                "4913":40,
                "5":400,
                "2335":6,
                "6919":1
            },
            "3":{
                "6938":1,
                "4913":30,
                "5":300,
                "2335":2,
                "6920":1
            },
            "4":{
                "4913":10,
                "5":100,
                "2335":1
            },
            "6":{
                "4913":5,
                "5":50
            }
        }, {
            "1":{
                "0x1B1B":1,
                "4913":60,
                "5":600,
                "2335":14,
                "6921":1
            },
            "2":{
                "6940":1,
                "4913":50,
                "5":500,
                "2335":10,
                "6922":1
            },
            "3":{
                "6941":1,
                "4913":40,
                "5":400,
                "2335":6,
                "6923":1
            },
            "4":{
                "4913":20,
                "5":200,
                "2335":1
            },
            "6":{
                "4913":40,
                "5":100
            }
        }, {
            "1":{
                "6942":1,
                "4913":70,
                "5":700,
                "2335":18,
                "6924":1
            },
            "2":{
                "6943":1,
                "4913":60,
                "5":600,
                "2335":14,
                "6925":1
            },
            "3":{
                "6944":1,
                "4913":50,
                "5":500,
                "2335":10,
                "6926":1
            },
            "4":{
                "4913":30,
                "5":300,
                "2335":2
            },
            "6":{
                "4913":20,
                "5":200,
                "2335":1
            }
        }, {
            "1":{
                "6945":1,
                "4913":80,
                "5":800,
                "2335":22,
                "6927":1
            },
            "2":{
                "6946":1,
                "4913":70,
                "5":700,
                "2335":18,
                "6928":1
            },
            "3":{
                "6947":1,
                "4913":60,
                "5":600,
                "2335":14,
                "6929":1
            },
            "4":{
                "4913":40,
                "5":400,
                "2335":6
            },
            "6":{
                "4913":30,
                "5":300,
                "2335":2
            }
        }, {
            "1":{
                "6948":1,
                "4913":90,
                "5":900,
                "2335":26,
                "6930":1
            },
            "2":{
                "6949":1,
                "4913":80,
                "5":800,
                "2335":22,
                "6931":1
            },
            "3":{
                "6950":1,
                "4913":70,
                "5":700,
                "2335":18,
                "6932":1
            },
            "4":{
                "4913":50,
                "5":500,
                "2335":10
            },
            "6":{
                "4913":40,
                "5":400,
                "2335":6
            }
        }, {
            "1":{
                "6951":1,
                "4913":100,
                "5":1000,
                "2335":30,
                "6933":1
            },
            "2":{
                "6952":1,
                "4913":90,
                "5":900,
                "2335":26,
                "6934":1
            },
            "3":{
                "6953":1,
                "4913":80,
                "5":800,
                "2335":22,
                "6935":1
            },
            "4":{
                "4913":60,
                "5":600,
                "2335":14
            },
            "6":{
                "4913":50,
                "5":500,
                "2335":10
            }
        }];
        public var MCZD_TODAYRANK_AWARD:Array = [{
            "1":{"5":70},
            "2":{"5":50},
            "3":{"5":30},
            "4":{"5":10},
            "6":{"5":5}
        }, {
            "1":{"5":150},
            "2":{"5":100},
            "3":{"5":60},
            "4":{"5":20},
            "6":{"5":10}
        }, {
            "1":{"2906":70},
            "2":{"2906":50},
            "3":{"2906":30},
            "4":{"2906":10},
            "6":{"2906":5}
        }, {
            "1":{"2906":80},
            "2":{"2906":60},
            "3":{"2906":40},
            "4":{"2906":20},
            "6":{"2906":10}
        }, {
            "1":{"2906":90},
            "2":{"2906":70},
            "3":{"2906":50},
            "4":{"2906":30},
            "6":{"2906":20}
        }, {
            "1":{"2906":100},
            "2":{"2906":80},
            "3":{"2906":60},
            "4":{"2906":40},
            "6":{"2906":30}
        }];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MCZDTotalRankPanel()
        {
            mx_internal::_document = this;
            this.width = 480;
            this.height = 518;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MCZDTotalRankPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get r2():HBox
        {
            return (this._3584r2);
        }

        public function set r4(_arg_1:HBox):void
        {
            var _local_2:Object = this._3586r4;
            if (_local_2 !== _arg_1)
            {
                this._3586r4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r4", _local_2, _arg_1));
            };
        }

        private function _MCZDTotalRankPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[60];
            _local_1 = Language.PET_ARENA_RANK_U[9];
            _local_1 = Language.PET_ARENA_RANK_U[10];
            _local_1 = Language.PET_ARENA_RANK_U[11];
            _local_1 = Language.PET_ARENA_RANK_U[12];
            _local_1 = Language.PET_ARENA_RANK_U[13];
            _local_1 = Language.PET_ARENA_RANK_U[14];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[62];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[63];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[64];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[71];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[72];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[73];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[74];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[75];
        }

        public function set r2(_arg_1:HBox):void
        {
            var _local_2:Object = this._3584r2;
            if (_local_2 !== _arg_1)
            {
                this._3584r2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r3():HBox
        {
            return (this._3585r3);
        }

        public function set r3(_arg_1:HBox):void
        {
            var _local_2:Object = this._3585r3;
            if (_local_2 !== _arg_1)
            {
                this._3585r3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r6():HBox
        {
            return (this._3588r6);
        }

        public function set r6(_arg_1:HBox):void
        {
            var _local_2:Object = this._3588r6;
            if (_local_2 !== _arg_1)
            {
                this._3588r6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r10():ItemSlot
        {
            return (this._111121r10);
        }

        [Bindable(event="propertyChange")]
        public function get r11():ItemSlot
        {
            return (this._111122r11);
        }

        [Bindable(event="propertyChange")]
        public function get r13():ItemSlot
        {
            return (this._111124r13);
        }

        [Bindable(event="propertyChange")]
        public function get r14():ItemSlot
        {
            return (this._111125r14);
        }

        public function set r10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111121r10;
            if (_local_2 !== _arg_1)
            {
                this._111121r10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r10", _local_2, _arg_1));
            };
        }

        public function set r11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111122r11;
            if (_local_2 !== _arg_1)
            {
                this._111122r11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r12():ItemSlot
        {
            return (this._111123r12);
        }

        public function set r12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111123r12;
            if (_local_2 !== _arg_1)
            {
                this._111123r12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r12", _local_2, _arg_1));
            };
        }

        public function set r13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111124r13;
            if (_local_2 !== _arg_1)
            {
                this._111124r13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r20():ItemSlot
        {
            return (this._111152r20);
        }

        public function set r14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111125r14;
            if (_local_2 !== _arg_1)
            {
                this._111125r14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r14", _local_2, _arg_1));
            };
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
        }

        [Bindable(event="propertyChange")]
        public function get r21():ItemSlot
        {
            return (this._111153r21);
        }

        [Bindable(event="propertyChange")]
        public function get r23():ItemSlot
        {
            return (this._111155r23);
        }

        [Bindable(event="propertyChange")]
        public function get r24():ItemSlot
        {
            return (this._111156r24);
        }

        [Bindable(event="propertyChange")]
        public function get r22():ItemSlot
        {
            return (this._111154r22);
        }

        [Bindable(event="propertyChange")]
        public function get r4():HBox
        {
            return (this._3586r4);
        }

        [Bindable(event="propertyChange")]
        public function get r30():ItemSlot
        {
            return (this._111183r30);
        }

        [Bindable(event="propertyChange")]
        public function get r31():ItemSlot
        {
            return (this._111184r31);
        }

        [Bindable(event="propertyChange")]
        public function get r32():ItemSlot
        {
            return (this._111185r32);
        }

        [Bindable(event="propertyChange")]
        public function get r33():ItemSlot
        {
            return (this._111186r33);
        }

        [Bindable(event="propertyChange")]
        public function get r34():ItemSlot
        {
            return (this._111187r34);
        }

        [Bindable(event="propertyChange")]
        public function get title():RoundedLabel
        {
            return (this._110371416title);
        }

        public function set r20(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111152r20;
            if (_local_2 !== _arg_1)
            {
                this._111152r20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r20", _local_2, _arg_1));
            };
        }

        public function set r21(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111153r21;
            if (_local_2 !== _arg_1)
            {
                this._111153r21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r21", _local_2, _arg_1));
            };
        }

        public function set r22(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111154r22;
            if (_local_2 !== _arg_1)
            {
                this._111154r22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r22", _local_2, _arg_1));
            };
        }

        public function set r23(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111155r23;
            if (_local_2 !== _arg_1)
            {
                this._111155r23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r23", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r40():ItemSlot
        {
            return (this._111214r40);
        }

        public function set r24(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111156r24;
            if (_local_2 !== _arg_1)
            {
                this._111156r24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r24", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r42():ItemSlot
        {
            return (this._111216r42);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get r41():ItemSlot
        {
            return (this._111215r41);
        }

        public function setRankData(_arg_1:*, _arg_2:*):void
        {
            var _local_3:int;
            var _local_4:ArrayCollection;
            var _local_5:Object;
            _type = _arg_1;
            if ((_arg_1 == 1))
            {
                tl.text = Language.MCZDPETFIGHT_PANEL_U[60];
            }
            else
            {
                tl.text = Language.MCZDPETFIGHT_PANEL_U[61];
            };
            if (_arg_2)
            {
                while (_local_3 < 6)
                {
                    if (_arg_2[_local_3])
                    {
                        _local_4 = new ArrayCollection();
                        for each (_local_5 in _arg_2[_local_3])
                        {
                            _local_4.addItem(_local_5);
                        };
                        switch (_local_3)
                        {
                            case 0:
                                aRankDataProvider = _local_4;
                                break;
                            case 1:
                                bRankDataProvider = _local_4;
                                break;
                            case 2:
                                cRankDataProvider = _local_4;
                                break;
                            case 3:
                                dRankDataProvider = _local_4;
                                break;
                            case 4:
                                eRankDataProvider = _local_4;
                                break;
                            case 5:
                                fRankDataProvider = _local_4;
                                break;
                        };
                    };
                    _local_3++;
                };
                tabBtnClick(getPrevPetRankTypeId());
            };
        }

        [Bindable(event="propertyChange")]
        public function get tl():BasicTitleCanvas
        {
            return (this._3704tl);
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

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicGlowButton
        {
            return (this._1554141555tabBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn5():BasicGlowButton
        {
            return (this._1554141554tabBtn5);
        }

        [Bindable(event="propertyChange")]
        private function get aRankDataProvider():ArrayCollection
        {
            return (this._1185599352aRankDataProvider);
        }

        [Bindable(event="propertyChange")]
        private function get bRankDataProvider():ArrayCollection
        {
            return (this._167710345bRankDataProvider);
        }

        [Bindable(event="propertyChange")]
        private function get dRankDataProvider():ArrayCollection
        {
            return (this._1420637557dRankDataProvider);
        }

        [Bindable(event="propertyChange")]
        private function get eRankDataProvider():ArrayCollection
        {
            return (this._67327860eRankDataProvider);
        }

        [Bindable(event="propertyChange")]
        private function get cRankDataProvider():ArrayCollection
        {
            return (this._1521020042cRankDataProvider);
        }

        [Bindable(event="propertyChange")]
        private function get fRankDataProvider():ArrayCollection
        {
            return (this._1285981837fRankDataProvider);
        }

        public function set r30(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111183r30;
            if (_local_2 !== _arg_1)
            {
                this._111183r30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r30", _local_2, _arg_1));
            };
        }

        public function set r33(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111186r33;
            if (_local_2 !== _arg_1)
            {
                this._111186r33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r33", _local_2, _arg_1));
            };
        }

        public function set r34(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111187r34;
            if (_local_2 !== _arg_1)
            {
                this._111187r34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r34", _local_2, _arg_1));
            };
        }

        public function set r31(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111184r31;
            if (_local_2 !== _arg_1)
            {
                this._111184r31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r31", _local_2, _arg_1));
            };
        }

        public function set r32(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111185r32;
            if (_local_2 !== _arg_1)
            {
                this._111185r32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r32", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r60():ItemSlot
        {
            return (this._111276r60);
        }

        [Bindable(event="propertyChange")]
        public function get r62():ItemSlot
        {
            return (this._111278r62);
        }

        public function __tabBtn5_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(5);
        }

        [Bindable(event="propertyChange")]
        public function get r61():ItemSlot
        {
            return (this._111277r61);
        }

        public function set title(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function set idData(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1194431643idData;
            if (_local_2 !== _arg_1)
            {
                this._1194431643idData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idData", _local_2, _arg_1));
            };
        }

        public function set r41(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111215r41;
            if (_local_2 !== _arg_1)
            {
                this._111215r41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r41", _local_2, _arg_1));
            };
        }

        public function set r42(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111216r42;
            if (_local_2 !== _arg_1)
            {
                this._111216r42 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r42", _local_2, _arg_1));
            };
        }

        public function set r40(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111214r40;
            if (_local_2 !== _arg_1)
            {
                this._111214r40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r40", _local_2, _arg_1));
            };
        }

        public function set tl(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._3704tl;
            if (_local_2 !== _arg_1)
            {
                this._3704tl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tl", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        public function MCZDRank_str(_arg_1:*):*
        {
            if (_arg_1 == 1)
            {
                return ("1");
            };
            if (_arg_1 == 2)
            {
                return ("2");
            };
            if (_arg_1 == 3)
            {
                return ("3");
            };
            if (_arg_1 == 4)
            {
                return ("4-5");
            };
            if (_arg_1 == 6)
            {
                return ("6-20");
            };
        }

        private function _MCZDTotalRankPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MCZDTotalRankPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "s";
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_MCZDTotalRankPanel_DataGridColumn3", _MCZDTotalRankPanel_DataGridColumn3);
            return (_local_1);
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

        private function set aRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1185599352aRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1185599352aRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aRankDataProvider", _local_2, _arg_1));
            };
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

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
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

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set tabBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141554tabBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1554141554tabBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn5", _local_2, _arg_1));
            };
        }

        private function set dRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1420637557dRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1420637557dRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dRankDataProvider", _local_2, _arg_1));
            };
        }

        private function set eRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._67327860eRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._67327860eRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eRankDataProvider", _local_2, _arg_1));
            };
        }

        private function set bRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._167710345bRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._167710345bRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bRankDataProvider", _local_2, _arg_1));
            };
        }

        private function set cRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1521020042cRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1521020042cRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cRankDataProvider", _local_2, _arg_1));
            };
        }

        private function set fRankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1285981837fRankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1285981837fRankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fRankDataProvider", _local_2, _arg_1));
            };
        }

        private function tabBtnClick(_arg_1:int):void
        {
            var _local_5:String;
            var _local_6:*;
            var _local_7:String;
            var _local_8:Object;
            var _local_2:* = 6;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this[("tabBtn" + _local_3)].selected = false;
                _local_3++;
            };
            switch (_arg_1)
            {
                case 0:
                    idData.dataProvider = aRankDataProvider;
                    break;
                case 1:
                    idData.dataProvider = bRankDataProvider;
                    break;
                case 2:
                    idData.dataProvider = cRankDataProvider;
                    break;
                case 3:
                    idData.dataProvider = dRankDataProvider;
                    break;
                case 4:
                    idData.dataProvider = eRankDataProvider;
                    break;
                case 5:
                    idData.dataProvider = fRankDataProvider;
                    break;
            };
            this[("tabBtn" + _arg_1)].selected = true;
            var _local_4:Object = {};
            if (_type == 1)
            {
                _local_4 = MCZD_TODAYRANK_AWARD[_arg_1];
            }
            else
            {
                if (_type == 2)
                {
                    _local_4 = MCZD_ALLRANK_AWARD[_arg_1];
                };
            };
            title.text = (MCZDRegion_str(_arg_1) + "组奖励");
            cleanSlot();
            if (_local_4)
            {
                for (_local_5 in _local_4)
                {
                    _local_6 = 0;
                    for (_local_7 in _local_4[_local_5])
                    {
                        _local_8 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][int(_local_7)];
                        this[(("r" + String(_local_5)) + String(_local_6))].slotType = Slot.SLOT_EQUFUNC_ITEM;
                        this[(("r" + String(_local_5)) + String(_local_6))].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[(("r" + String(_local_5)) + String(_local_6))].giid = int(_local_7);
                        this[(("r" + String(_local_5)) + String(_local_6))].slotData = _local_8;
                        this[(("r" + String(_local_5)) + String(_local_6))].stackNum = int(_local_4[_local_5][_local_7]);
                        _local_6++;
                    };
                };
            };
        }

        private function _MCZDTotalRankPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MCZDTotalRankPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "sn";
            BindingManager.executeBindings(this, "_MCZDTotalRankPanel_DataGridColumn2", _MCZDTotalRankPanel_DataGridColumn2);
            return (_local_1);
        }

        public function set r62(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111278r62;
            if (_local_2 !== _arg_1)
            {
                this._111278r62 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r62", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idData():DataGrid
        {
            return (this._1194431643idData);
        }

        public function set r60(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111276r60;
            if (_local_2 !== _arg_1)
            {
                this._111276r60 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r60", _local_2, _arg_1));
            };
        }

        public function set r61(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._111277r61;
            if (_local_2 !== _arg_1)
            {
                this._111277r61 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r61", _local_2, _arg_1));
            };
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(4);
        }

        private function _MCZDTotalRankPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MCZDTotalRankPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "r";
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_MCZDTotalRankPanel_DataGridColumn1", _MCZDTotalRankPanel_DataGridColumn1);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:MCZDTotalRankPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MCZDTotalRankPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MCZDTotalRankPanelWatcherSetupUtil");
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

        private function getPrevPetRankTypeId():int
        {
            var _local_1:int = _core.player.level;
            var _local_2:* = 0;
            if (((_local_1 >= 35) && (_local_1 <= 74)))
            {
                _local_2 = 0;
            }
            else
            {
                if (((_local_1 >= 75) && (_local_1 <= 94)))
                {
                    _local_2 = 1;
                }
                else
                {
                    if (((_local_1 >= 95) && (_local_1 <= 114)))
                    {
                        _local_2 = 2;
                    }
                    else
                    {
                        if (((_local_1 >= 115) && (_local_1 <= 134)))
                        {
                            _local_2 = 3;
                        }
                        else
                        {
                            if (((_local_1 >= 135) && (_local_1 <= 154)))
                            {
                                _local_2 = 4;
                            }
                            else
                            {
                                if (_local_1 >= 155)
                                {
                                    _local_2 = 5;
                                };
                            };
                        };
                    };
                };
            };
            return (_local_2);
        }

        private function _MCZDTotalRankPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[60];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tl.text = _arg_1;
            }, "tl.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn5.label = _arg_1;
            }, "tabBtn5.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[62];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDTotalRankPanel_DataGridColumn1.headerText = _arg_1;
            }, "_MCZDTotalRankPanel_DataGridColumn1.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[63];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDTotalRankPanel_DataGridColumn2.headerText = _arg_1;
            }, "_MCZDTotalRankPanel_DataGridColumn2.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[64];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDTotalRankPanel_DataGridColumn3.headerText = _arg_1;
            }, "_MCZDTotalRankPanel_DataGridColumn3.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDTotalRankPanel_RoundedLabel2.text = _arg_1;
            }, "_MCZDTotalRankPanel_RoundedLabel2.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDTotalRankPanel_RoundedLabel3.text = _arg_1;
            }, "_MCZDTotalRankPanel_RoundedLabel3.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[73];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDTotalRankPanel_RoundedLabel4.text = _arg_1;
            }, "_MCZDTotalRankPanel_RoundedLabel4.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[74];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDTotalRankPanel_RoundedLabel5.text = _arg_1;
            }, "_MCZDTotalRankPanel_RoundedLabel5.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[75];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDTotalRankPanel_RoundedLabel6.text = _arg_1;
            }, "_MCZDTotalRankPanel_RoundedLabel6.text");
            result[14] = binding;
            return (result);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        public function MCZDRegion_str(_arg_1:*):*
        {
            if (_arg_1 == 0)
            {
                return ("A");
            };
            if (_arg_1 == 1)
            {
                return ("B");
            };
            if (_arg_1 == 2)
            {
                return ("C");
            };
            if (_arg_1 == 3)
            {
                return ("D");
            };
            if (_arg_1 == 4)
            {
                return ("E");
            };
            if (_arg_1 == 5)
            {
                return ("F");
            };
        }

        private function cleanSlot():void
        {
            r10.clean();
            r11.clean();
            r12.clean();
            r13.clean();
            r14.clean();
            r20.clean();
            r21.clean();
            r22.clean();
            r23.clean();
            r24.clean();
            r30.clean();
            r31.clean();
            r32.clean();
            r33.clean();
            r34.clean();
            r40.clean();
            r41.clean();
            r42.clean();
            r60.clean();
            r61.clean();
            r62.clean();
        }

        public function set r1(_arg_1:HBox):void
        {
            var _local_2:Object = this._3583r1;
            if (_local_2 !== _arg_1)
            {
                this._3583r1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r1():HBox
        {
            return (this._3583r1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

