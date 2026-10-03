// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GroupPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import mx.containers.HBox;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.DataGrid;
    import mx.effects.Glow;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.collections.ArrayCollection;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
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

    public class GroupPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _GroupPanel_Canvas3:Canvas;
        public var _GroupPanel_Canvas4:Canvas;
        public var _GroupPanel_Canvas1:Canvas;
        private var _881418178tabBar:HBox;
        private var _11565827buttonTab:ViewStack;
        private var _1554141559tabBtn0:BasicGlowButton;
        public var _GroupPanel_BasicGlowButton1:BasicGlowButton;
        public var _GroupPanel_BasicGlowButton3:BasicGlowButton;
        public var _GroupPanel_BasicGlowButton4:BasicGlowButton;
        public var _GroupPanel_BasicGlowButton5:BasicGlowButton;
        public var _GroupPanel_BasicGlowButton6:BasicGlowButton;
        public var _GroupPanel_BasicGlowButton7:BasicGlowButton;
        public var _GroupPanel_BasicGlowButton8:BasicGlowButton;
        private var _1483226179groupList:DataGrid;
        private var _207684226glowEffect:Glow;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _1378839318btnAfk:BasicGlowButton;
        private var _1138936882groupRequestList:DataGrid;
        public var _GroupPanel_DataGridColumn1:DataGridColumn;
        public var _GroupPanel_DataGridColumn2:DataGridColumn;
        public var _GroupPanel_DataGridColumn3:DataGridColumn;
        public var _GroupPanel_DataGridColumn4:DataGridColumn;
        public var _GroupPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _GroupPanel_DataGridColumn6:DataGridColumn;
        public var _GroupPanel_DataGridColumn5:DataGridColumn;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _506350742groupTab:ViewStack;
        public var _GroupPanel_Canvas2:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":310,
                    "height":290,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GroupPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"groupTab",
                        "events":{"mouseMove":"__groupTab_mouseMove"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "60";
                            this.bottom = "50";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_GroupPanel_Canvas1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"groupList",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "columns":[_GroupPanel_DataGridColumn1_i(), _GroupPanel_DataGridColumn2_i(), _GroupPanel_DataGridColumn3_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_GroupPanel_Canvas2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"groupRequestList",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "columns":[_GroupPanel_DataGridColumn4_i(), _GroupPanel_DataGridColumn5_i(), _GroupPanel_DataGridColumn6_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"buttonTab",
                        "events":{"mouseMove":"__buttonTab_mouseMove"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "y":240,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_GroupPanel_Canvas3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_GroupPanel_BasicGlowButton1",
                                                "events":{"click":"___GroupPanel_BasicGlowButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CrystalBlueButton",
                                                        "x":10,
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btnAfk",
                                                "events":{"click":"__btnAfk_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CrystalBlueButton",
                                                        "label":"Tạm rời",
                                                        "x":75
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_GroupPanel_BasicGlowButton3",
                                                "events":{"click":"___GroupPanel_BasicGlowButton3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CrystalBlueButton",
                                                        "x":75,
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_GroupPanel_BasicGlowButton4",
                                                "events":{"click":"___GroupPanel_BasicGlowButton4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CrystalBlueButton",
                                                        "x":140,
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_GroupPanel_BasicGlowButton5",
                                                "events":{"click":"___GroupPanel_BasicGlowButton5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CrystalBlueButton",
                                                        "x":205,
                                                        "width":60
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_GroupPanel_Canvas4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "0";
                                                    this.horizontalGap = 5;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_GroupPanel_BasicGlowButton6",
                                                            "events":{"click":"___GroupPanel_BasicGlowButton6_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CrystalBlueButton",
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_GroupPanel_BasicGlowButton7",
                                                            "events":{"click":"___GroupPanel_BasicGlowButton7_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CrystalBlueButton",
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_GroupPanel_BasicGlowButton8",
                                                            "events":{"click":"___GroupPanel_BasicGlowButton8_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CrystalBlueButton",
                                                                    "width":60
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
                        "type":HBox,
                        "id":"tabBar",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
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
                                            "width":60
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
                                            "width":60
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn2",
                        "events":{"click":"__tabBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "width":60,
                                "x":235,
                                "y":35
                            });
                        }
                    })]
                });
            }
        });
        private var _vm:ViewManager = ViewManager.getInstance();
        private var _90794110_core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GroupPanel()
        {
            mx_internal::_document = this;
            this.width = 310;
            this.height = 290;
            this.styleName = "StandardContent";
            _GroupPanel_Glow1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GroupPanel._watcherSetupUtil = _arg_1;
        }


        public function set buttonTab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._11565827buttonTab;
            if (_local_2 !== _arg_1)
            {
                this._11565827buttonTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonTab", _local_2, _arg_1));
            };
        }

        private function leaveGroup():void
        {
            _vm.hide(ViewManager.PANEL_GROUP);
            _core.remote.call("groupLeave", null);
        }

        private function invite():void
        {
            if (_core.state == GamePredef.ST_BATTLE)
            {
                return;
            };
            _core.view.showSelect();
            _core.view.actionState = GamePredef.ACTION_INVITE;
        }

        public function ___GroupPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            kick();
        }

        private function _GroupPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "className";
            BindingManager.executeBindings(this, "_GroupPanel_DataGridColumn3", _GroupPanel_DataGridColumn3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get buttonTab():ViewStack
        {
            return (this._11565827buttonTab);
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

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        private function _GroupPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GroupPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_Canvas1.label = _arg_1;
            }, "_GroupPanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_core.player.groupAC);
            }, function (_arg_1:Object):void
            {
                groupList.dataProvider = _arg_1;
            }, "groupList.dataProvider");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_DataGridColumn1.headerText = _arg_1;
            }, "_GroupPanel_DataGridColumn1.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_DataGridColumn2.headerText = _arg_1;
            }, "_GroupPanel_DataGridColumn2.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_DataGridColumn3.headerText = _arg_1;
            }, "_GroupPanel_DataGridColumn3.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_Canvas2.label = _arg_1;
            }, "_GroupPanel_Canvas2.label");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_core.player.groupRequestAC);
            }, function (_arg_1:Object):void
            {
                groupRequestList.dataProvider = _arg_1;
            }, "groupRequestList.dataProvider");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_DataGridColumn4.headerText = _arg_1;
            }, "_GroupPanel_DataGridColumn4.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_DataGridColumn5.headerText = _arg_1;
            }, "_GroupPanel_DataGridColumn5.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_DataGridColumn6.headerText = _arg_1;
            }, "_GroupPanel_DataGridColumn6.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_Canvas3.label = _arg_1;
            }, "_GroupPanel_Canvas3.label");
            result[11] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.player.inGroup);
            }, function (_arg_1:Boolean):void
            {
                _GroupPanel_Canvas3.visible = _arg_1;
            }, "_GroupPanel_Canvas3.visible");
            result[12] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.player.isLeader);
            }, function (_arg_1:Boolean):void
            {
                _GroupPanel_BasicGlowButton1.visible = _arg_1;
            }, "_GroupPanel_BasicGlowButton1.visible");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_BasicGlowButton1.label = _arg_1;
            }, "_GroupPanel_BasicGlowButton1.label");
            result[14] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.player.inGroup);
            }, function (_arg_1:Boolean):void
            {
                btnAfk.visible = _arg_1;
            }, "btnAfk.visible");
            result[15] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.player.isLeader);
            }, function (_arg_1:Boolean):void
            {
                _GroupPanel_BasicGlowButton3.visible = _arg_1;
            }, "_GroupPanel_BasicGlowButton3.visible");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_BasicGlowButton3.label = _arg_1;
            }, "_GroupPanel_BasicGlowButton3.label");
            result[17] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.player.inGroup);
            }, function (_arg_1:Boolean):void
            {
                _GroupPanel_BasicGlowButton4.visible = _arg_1;
            }, "_GroupPanel_BasicGlowButton4.visible");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_BasicGlowButton4.label = _arg_1;
            }, "_GroupPanel_BasicGlowButton4.label");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.player.isLeader);
            }, function (_arg_1:Boolean):void
            {
                _GroupPanel_BasicGlowButton5.visible = _arg_1;
            }, "_GroupPanel_BasicGlowButton5.visible");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_BasicGlowButton5.label = _arg_1;
            }, "_GroupPanel_BasicGlowButton5.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_S[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_Canvas4.label = _arg_1;
            }, "_GroupPanel_Canvas4.label");
            result[22] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_core.player.isLeader) || (!(_core.player.inGroup)));
            }, function (_arg_1:Boolean):void
            {
                _GroupPanel_BasicGlowButton6.visible = _arg_1;
            }, "_GroupPanel_BasicGlowButton6.visible");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_BasicGlowButton6.label = _arg_1;
            }, "_GroupPanel_BasicGlowButton6.label");
            result[24] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_core.player.isLeader) || (!(_core.player.inGroup)));
            }, function (_arg_1:Boolean):void
            {
                _GroupPanel_BasicGlowButton7.visible = _arg_1;
            }, "_GroupPanel_BasicGlowButton7.visible");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_BasicGlowButton7.label = _arg_1;
            }, "_GroupPanel_BasicGlowButton7.label");
            result[26] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_core.player.isLeader) || (!(_core.player.inGroup)));
            }, function (_arg_1:Boolean):void
            {
                _GroupPanel_BasicGlowButton8.visible = _arg_1;
            }, "_GroupPanel_BasicGlowButton8.visible");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupPanel_BasicGlowButton8.label = _arg_1;
            }, "_GroupPanel_BasicGlowButton8.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[31] = binding;
            return (result);
        }

        public function ___GroupPanel_BasicGlowButton7_click(_arg_1:MouseEvent):void
        {
            rejectRequest();
        }

        public function set glowEffect(_arg_1:Glow):void
        {
            var _local_2:Object = this._207684226glowEffect;
            if (_local_2 !== _arg_1)
            {
                this._207684226glowEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local_2, _arg_1));
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

        private function set _core(_arg_1:Core):void
        {
            var _local_2:Object = this._90794110_core;
            if (_local_2 !== _arg_1)
            {
                this._90794110_core = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_core", _local_2, _arg_1));
            };
        }

        private function giveLeaderResult(_arg_1:Boolean):void
        {
            if (!_arg_1)
            {
                _core.sysMidNote(Language.GROUPPANEL_S[2]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBar():HBox
        {
            return (this._881418178tabBar);
        }

        private function _GroupPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "className";
            BindingManager.executeBindings(this, "_GroupPanel_DataGridColumn6", _GroupPanel_DataGridColumn6);
            return (_local_1);
        }

        private function _GroupPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "level";
            BindingManager.executeBindings(this, "_GroupPanel_DataGridColumn2", _GroupPanel_DataGridColumn2);
            return (_local_1);
        }

        public function set groupTab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._506350742groupTab;
            if (_local_2 !== _arg_1)
            {
                this._506350742groupTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupTab", _local_2, _arg_1));
            };
        }

        private function kick():void
        {
            if (!groupList.selectedItem)
            {
                return;
            };
            var _local_1:Number = groupList.selectedItem.id;
            if (_local_1 != _core.player.id)
            {
                if (groupList.numChildren < 2)
                {
                    _vm.changeVisible(ViewManager.PANEL_GROUP);
                };
                _core.remote.call("groupKick", null, _local_1);
            }
            else
            {
                _core.sysMidNote(Language.GROUPPANEL_S[0]);
            };
        }

        private function clearRequestList():void
        {
            _core.player.groupRequestAC = new ArrayCollection();
        }

        public function ___GroupPanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            leaveGroup();
        }

        public function ___GroupPanel_BasicGlowButton8_click(_arg_1:MouseEvent):void
        {
            clearRequestList();
        }

        private function _GroupPanel_Glow1_i():Glow
        {
            var _local_1:Glow = new Glow();
            glowEffect = _local_1;
            _local_1.repeatCount = 10000;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 1;
            _local_1.blurXFrom = 0;
            _local_1.blurXTo = 10;
            _local_1.blurYFrom = 0;
            _local_1.blurYTo = 10;
            _local_1.color = 16135947;
            return (_local_1);
        }

        private function acceptRequest():void
        {
            var cid:* = undefined;
            var checkEndHandler:* = function (_arg_1:*):*
            {
                if (_arg_1)
                {
                    removeGroupRequest(cid);
                }
                else
                {
                    _core.sysBlueMsg(Language.GROUPPANEL_S[6]);
                };
            };
            if (groupRequestList.selectedItem)
            {
                cid = groupRequestList.selectedItem.id;
                _core.remote.call("groupAdd", new Responder(checkEndHandler), cid);
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        private function _GroupPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GROUPPANEL_U[4];
            _local_1 = Language.GROUPPANEL_S[6];
            _local_1 = _core.player.groupAC;
            _local_1 = Language.GROUPPANEL_S[3];
            _local_1 = Language.GROUPPANEL_S[4];
            _local_1 = Language.GROUPPANEL_S[5];
            _local_1 = Language.GROUPPANEL_S[7];
            _local_1 = _core.player.groupRequestAC;
            _local_1 = Language.GROUPPANEL_S[3];
            _local_1 = Language.GROUPPANEL_S[4];
            _local_1 = Language.GROUPPANEL_S[5];
            _local_1 = Language.GROUPPANEL_S[8];
            _local_1 = _core.player.inGroup;
            _local_1 = _core.player.isLeader;
            _local_1 = Language.GROUPPANEL_U[0];
            _local_1 = _core.player.inGroup;
            _local_1 = _core.player.isLeader;
            _local_1 = Language.GROUPPANEL_U[1];
            _local_1 = _core.player.inGroup;
            _local_1 = Language.GROUPPANEL_U[2];
            _local_1 = _core.player.isLeader;
            _local_1 = Language.GROUPPANEL_U[3];
            _local_1 = Language.GROUPPANEL_S[9];
            _local_1 = ((_core.player.isLeader) || (!(_core.player.inGroup)));
            _local_1 = Language.GROUPPANEL_U[5];
            _local_1 = ((_core.player.isLeader) || (!(_core.player.inGroup)));
            _local_1 = Language.GROUPPANEL_U[6];
            _local_1 = ((_core.player.isLeader) || (!(_core.player.inGroup)));
            _local_1 = Language.GROUPPANEL_U[7];
            _local_1 = Language.GROUPPANEL_U[8];
            _local_1 = Language.GROUPPANEL_U[9];
            _local_1 = Language.GROUPPANEL_U[10];
        }

        private function _GroupPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_GroupPanel_DataGridColumn1", _GroupPanel_DataGridColumn1);
            return (_local_1);
        }

        public function set groupList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1483226179groupList;
            if (_local_2 !== _arg_1)
            {
                this._1483226179groupList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupList", _local_2, _arg_1));
            };
        }

        public function set tabBar(_arg_1:HBox):void
        {
            var _local_2:Object = this._881418178tabBar;
            if (_local_2 !== _arg_1)
            {
                this._881418178tabBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBar", _local_2, _arg_1));
            };
        }

        private function _GroupPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "level";
            BindingManager.executeBindings(this, "_GroupPanel_DataGridColumn5", _GroupPanel_DataGridColumn5);
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

        public function ___GroupPanel_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            invite();
        }

        public function __groupTab_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        public function onGroupRequest(obj:Object):void
        {
            var ac:ArrayCollection;
            if (!obj)
            {
                return;
            };
            ac = _core.player.groupRequestAC;
            if (null == ac)
            {
                ac = new ArrayCollection();
                _core.player.groupRequestAC = ac;
            };
            var exist:* = function ():*
            {
                var _local_2:int;
                var _local_1:Array = ac.source;
                if (null != _local_1)
                {
                    _local_2 = 0;
                    while (_local_2 < _local_1.length)
                    {
                        if (_local_1[_local_2].id == obj.id)
                        {
                            return (true);
                        };
                        _local_2++;
                    };
                };
                return (false);
            };
            if (!exist())
            {
                ac.addItem(obj);
                _core.sysMsg(Language.GROUPPANEL_S[11].replace("{name}", obj.name));
                _core.remote.groupReqSuccNotice(obj.id);
                _core.view.getUI(ViewManager.MAIN_SYS).setTeamButtonBig();
            };
        }

        private function giveGroupLeader():void
        {
            if (!groupList.selectedItem)
            {
                return;
            };
            if (groupList.selectedItem.id != _core.player.id)
            {
                _core.remote.call("groupGiveLeader", new Responder(giveLeaderResult), groupList.selectedItem.id);
                _core.player.groupRequestAC = new ArrayCollection();
            }
            else
            {
                _core.sysMidNote(Language.GROUPPANEL_S[1]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        public function set groupRequestList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1138936882groupRequestList;
            if (_local_2 !== _arg_1)
            {
                this._1138936882groupRequestList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupRequestList", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:GroupPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GroupPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GroupPanelWatcherSetupUtil");
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
        public function get groupTab():ViewStack
        {
            return (this._506350742groupTab);
        }

        private function unGroupAfk(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.cid)))
            {
                btnAfk.label = Language.GROUPPANEL_U[12];
            };
        }

        public function ___GroupPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            giveGroupLeader();
        }

        [Bindable(event="propertyChange")]
        public function get glowEffect():Glow
        {
            return (this._207684226glowEffect);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        private function removeGroupRequest(_arg_1:*):void
        {
            var _local_4:int;
            var _local_2:ArrayCollection = _core.player.groupRequestAC;
            var _local_3:Array = _local_2.source;
            if (null != _local_3)
            {
                _local_4 = 0;
                while (_local_4 < _local_3.length)
                {
                    if (_local_3[_local_4].id == _arg_1)
                    {
                        _local_2.removeItemAt(_local_4);
                    };
                    _local_4++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        private function get _core():Core
        {
            return (this._90794110_core);
        }

        private function _GroupPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GroupPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_GroupPanel_DataGridColumn4", _GroupPanel_DataGridColumn4);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get groupRequestList():DataGrid
        {
            return (this._1138936882groupRequestList);
        }

        public function playGlowEffect():void
        {
            if (!glowEffect.isPlaying)
            {
                glowEffect.play([tabBtn2]);
            };
        }

        public function __btnAfk_click(_arg_1:MouseEvent):void
        {
            afk();
        }

        public function ___GroupPanel_BasicGlowButton6_click(_arg_1:MouseEvent):void
        {
            acceptRequest();
        }

        [Bindable(event="propertyChange")]
        public function get groupList():DataGrid
        {
            return (this._1483226179groupList);
        }

        public function setTab(_arg_1:uint):void
        {
            tabClick(_arg_1);
        }

        public function set btnAfk(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1378839318btnAfk;
            if (_local_2 !== _arg_1)
            {
                this._1378839318btnAfk = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAfk", _local_2, _arg_1));
            };
        }

        override public function set visible(value:Boolean):void
        {
            super.visible = value;
            try
            {
                if (((this) && (this.btnAfk)))
                {
                    if ((((_core) && (_core.player)) && (_core.player.groupAfk)))
                    {
                        btnAfk.label = "Hồi nhóm";
                    }
                    else
                    {
                        btnAfk.label = "Tạm rời";
                    };
                };
            }
            catch(e)
            {
                trace("btnAfk.label 初始化出错");
            };
        }

        private function afk():void
        {
            var groupAc:ArrayCollection;
            var leader:Charactor;
            var i:* = undefined;
            var can_back:Boolean;
            var dis:Number;
            var func:Function;
            if (((_core.player.inGroup) && (!(_core.player.isLeader))))
            {
                if (!_core.player.groupAfk)
                {
                    _core.remote.call("groupAFK", new Responder(onGroupAfk));
                }
                else
                {
                    groupAc = _core.player.groupAC;
                    for (i in groupAc)
                    {
                        if (((groupAc[i]) && (groupAc[i].isLeader)))
                        {
                            if (groupAc[i].id)
                            {
                                leader = _core.getCharactor(groupAc[i].id);
                            }
                            else
                            {
                                leader = Charactor(groupAc[i]);
                            };
                        };
                    };
                    can_back = false;
                    if (leader)
                    {
                        if (leader.posMapId == _core.player.posMapId)
                        {
                            dis = ToolKit.getDisByXY(_core.player.posX, _core.player.posY, leader.posX, leader.posY);
                            if (dis < GamePredef.AFK_CAN_BACK_DIS)
                            {
                                can_back = true;
                            };
                        };
                    };
                    if (!can_back)
                    {
                        if ((((_core.groupMemberListArr) && (_core.groupMemberListArr[_core.cid])) && (_core.groupMemberListArr[_core.cid].groupAfk)))
                        {
                            _core.player.groupAfk = _core.groupMemberListArr[_core.cid].groupAfk;
                        };
                        if (!_core.player.groupAfk)
                        {
                            _core.sysMidNote(Language.GROUPPANEL_U[15]);
                            return;
                        };
                        if (((_core.player.state) && ((_core.player.state == GamePredef.ST_BATTLE) || (_core.player.state == GamePredef.ST_WATCH))))
                        {
                            _core.sysMidNote(Language.GROUPPANEL_U[17]);
                            return;
                        };
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("unGroupAFK", new Responder(unGroupAfk));
                            };
                        };
                        Alert.show(Language.GROUPPANEL_U[13], "", (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        _core.remote.call("unGroupAFK", new Responder(unGroupAfk), true);
                    };
                };
            };
        }

        private function openGroupPlatform():void
        {
            if (_core.player.level < 30)
            {
                Alert.show(Language.GROUP_RECRUIT_PANEL_S[11]);
                return;
            };
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_GROUP_RECRUIT);
            _local_1.show();
            if (glowEffect.isPlaying)
            {
                glowEffect.end();
                _local_1.playGlowEffect();
                tabBtn2.filters = [];
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnAfk():BasicGlowButton
        {
            return (this._1378839318btnAfk);
        }

        private function onGroupAfk(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.cid)))
            {
                btnAfk.label = Language.GROUPPANEL_U[11];
            };
        }

        private function rejectRequest():void
        {
            var _local_1:*;
            if (groupRequestList.selectedItem)
            {
                _local_1 = groupRequestList.selectedItem.id;
                _core.remote.groupReqDeny(_local_1);
                removeGroupRequest(_local_1);
            };
        }

        private function tabClick(_arg_1:uint):void
        {
            tabBtn0.selected = false;
            tabBtn1.selected = false;
            this[("tabBtn" + _arg_1)].selected = true;
            groupTab.selectedIndex = _arg_1;
            buttonTab.selectedIndex = _arg_1;
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            openGroupPlatform();
        }

        public function __buttonTab_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }


    }
}//package com.qeedoo.ui.view.compDragable

