// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.VDAYPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.VDAYMoveCanva;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.LinkText;
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import mx.binding.BindingManager;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
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

    public class VDAYPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const MIN_CHECK_INTERVAL:Number = 30000;
        private var _lastCheckTime:Number = 0;
        public var _VDAYPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3773vs:ViewStack;
        private var _977658422ptype4:RoundedLabel;
        private var _1042054822moveCav10:VDAYMoveCanva;
        private var _fristFlag:Boolean = true;
        private var _763441754rankCavans:Canvas;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _977658423ptype3:RoundedLabel;
        private var _108280196rank0:RoundedLabel;
        private var _3492908rank:LinkText;
        private var _104932659moveCav4:VDAYMoveCanva;
        public var _VDAYPanel_BasicGlowButton3:BasicGlowButton;
        private var _104932654moveCav9:VDAYMoveCanva;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _830995295mainCav:Canvas;
        private var _104932658moveCav5:VDAYMoveCanva;
        private var _104932662moveCav1:VDAYMoveCanva;
        private var _104932656moveCav7:VDAYMoveCanva;
        private var _977658424ptype2:RoundedLabel;
        private var _104932661moveCav2:VDAYMoveCanva;
        private var _104932655moveCav8:VDAYMoveCanva;
        private var _104932660moveCav3:VDAYMoveCanva;
        private var _3366703mydg:DataGrid;
        public var _VDAYPanel_DataGridColumn1:DataGridColumn;
        public var _VDAYPanel_DataGridColumn2:DataGridColumn;
        public var _VDAYPanel_DataGridColumn3:DataGridColumn;
        public var _VDAYPanel_DataGridColumn4:DataGridColumn;
        public var _VDAYPanel_DataGridColumn5:DataGridColumn;
        public var _VDAYPanel_DataGridColumn6:DataGridColumn;
        private var _1146157165otherdg:DataGrid;
        private var _104932657moveCav6:VDAYMoveCanva;
        private var _977658425ptype1:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_VDAYPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "34";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "x":14,
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
                            this.top = "34";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "x":111,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vs",
                        "stylesFactory":function ():void
                        {
                            this.top = "53";
                            this.left = "0";
                            this.right = "0";
                            this.bottom = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"mainCav",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.bottom = "10";
                                                    this.top = "";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":-71,
                                                                    "y":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":86,
                                                                    "y":98
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":238,
                                                                    "y":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":247
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":224,
                                                                    "y":247
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":352,
                                                                    "y":138
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":480,
                                                                    "y":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":513,
                                                                    "y":0xFF
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":661,
                                                                    "y":21
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VDAYMoveCanva,
                                                            "id":"moveCav10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":630,
                                                                    "y":149
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_VDAYPanel_BasicGlowButton3",
                                                            "events":{"click":"___VDAYPanel_BasicGlowButton3_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CrystalYellowButton",
                                                                    "labelPlacement":"bottom",
                                                                    "width":75,
                                                                    "height":25,
                                                                    "x":312.5,
                                                                    "y":365
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
                                    "id":"rankCavans",
                                    "events":{"show":"__rankCavans_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "0";
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"otherPPanel",
                                                                    "width":500,
                                                                    "height":200,
                                                                    "x":14,
                                                                    "y":13,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"otherdg",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "x":90,
                                                                                "y":26,
                                                                                "selectable":false,
                                                                                "columns":[_VDAYPanel_DataGridColumn1_i(), _VDAYPanel_DataGridColumn2_i(), _VDAYPanel_DataGridColumn3_i()]
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
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"myPPanel",
                                                                    "width":500,
                                                                    "height":156,
                                                                    "x":15,
                                                                    "y":221,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"mydg",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "x":-30,
                                                                                "y":0,
                                                                                "selectable":false,
                                                                                "columns":[_VDAYPanel_DataGridColumn4_i(), _VDAYPanel_DataGridColumn5_i(), _VDAYPanel_DataGridColumn6_i()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "257";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":158,
                                                                    "text":"我的表白回应情况",
                                                                    "y":14
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "right";
                                                                this.right = "81";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":120,
                                                                    "text":"我发出的表白:",
                                                                    "height":18,
                                                                    "y":42
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "right";
                                                                this.right = "81";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":82,
                                                                    "text":"男男回应:",
                                                                    "height":18,
                                                                    "y":68
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "right";
                                                                this.right = "81";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":82,
                                                                    "text":"男女互表:",
                                                                    "height":18,
                                                                    "y":91
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "right";
                                                                this.right = "81";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":82,
                                                                    "text":"女女回应:",
                                                                    "height":18,
                                                                    "y":111
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"ptype1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":41,
                                                                    "text":"0",
                                                                    "height":18,
                                                                    "x":627,
                                                                    "y":42
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"ptype2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":41,
                                                                    "text":"0",
                                                                    "height":18,
                                                                    "x":627,
                                                                    "y":68
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"ptype3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":41,
                                                                    "text":"0",
                                                                    "height":18,
                                                                    "x":627,
                                                                    "y":91
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"ptype4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":41,
                                                                    "text":"0",
                                                                    "height":18,
                                                                    "x":627,
                                                                    "y":111
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkText,
                                                            "id":"rank",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                                this.right = "4";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":158,
                                                                    "text":"",
                                                                    "y":245,
                                                                    "selectable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"rank0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.right = "5";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":158,
                                                                    "text":"人气排行",
                                                                    "y":221
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
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _1146158286otherAC:ArrayCollection = new ArrayCollection();
        private var _3365582myAC:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function VDAYPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 450;
            this.styleName = "StandardContent";
            this.x = 550;
            this.y = 74;
            this.addEventListener("creationComplete", ___VDAYPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            VDAYPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get ptype3():RoundedLabel
        {
            return (this._977658423ptype3);
        }

        public function onGetMyProposals(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:*;
            otherAC.removeAll();
            myAC.removeAll();
            if (((_arg_1) && (_arg_1.data)))
            {
                _local_2 = _arg_1.data.other;
                if (((_local_2) && (_local_2.length > 0)))
                {
                    for (_local_4 in _local_2)
                    {
                        if ((_local_2[_local_4].gender == 1))
                        {
                            _local_2[_local_4].genderGWords = "女";
                        }
                        else
                        {
                            _local_2[_local_4].genderGWords = "男";
                        };
                        otherAC.addItem(_local_2[_local_4]);
                    };
                };
                _local_3 = _arg_1.data.my;
                if (((_local_3) && (_local_3.length > 0)))
                {
                    for (_local_4 in _local_3)
                    {
                        if ((_local_3[_local_4].gender == 1))
                        {
                            _local_3[_local_4].genderGWords = "女";
                        }
                        else
                        {
                            _local_3[_local_4].genderGWords = "男";
                        };
                        myAC.addItem(_local_3[_local_4]);
                    };
                };
            };
            if (_arg_1.r1)
            {
                ptype1.text = String(_arg_1.r1);
            }
            else
            {
                ptype1.text = "0";
            };
            if (_arg_1.r2)
            {
                ptype2.text = String(_arg_1.r2);
            }
            else
            {
                ptype2.text = "0";
            };
            if (_arg_1.r3)
            {
                ptype3.text = String(_arg_1.r3);
            }
            else
            {
                ptype3.text = "0";
            };
            if (_arg_1.r4)
            {
                ptype4.text = String(_arg_1.r4);
            }
            else
            {
                ptype4.text = "0";
            };
        }

        public function set rank0(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._108280196rank0;
            if (_local_2 !== _arg_1)
            {
                this._108280196rank0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank0", _local_2, _arg_1));
            };
        }

        public function init():void
        {
            if (visible)
            {
                _fristFlag = false;
                moveAll();
            };
            initMoveCanvas();
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

        private function showLove():void
        {
            var _local_1:SendVDAYWishPanel = SendVDAYWishPanel(_core.view.getUI(ViewManager.POP_SEND_VDAY));
            _local_1.show();
        }

        private function moveAll():void
        {
            var _local_1:int = 1;
            while (_local_1 < 11)
            {
                if (this[("moveCav" + _local_1)])
                {
                    this[("moveCav" + _local_1)].beginMove();
                };
                _local_1++;
            };
        }

        public function set ptype4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._977658422ptype4;
            if (_local_2 !== _arg_1)
            {
                this._977658422ptype4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ptype4", _local_2, _arg_1));
            };
        }

        public function set otherdg(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1146157165otherdg;
            if (_local_2 !== _arg_1)
            {
                this._1146157165otherdg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "otherdg", _local_2, _arg_1));
            };
        }

        private function _VDAYPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VDAYPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_VDAYPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VDAYPanel_BasicGlowButton3.label = _arg_1;
            }, "_VDAYPanel_BasicGlowButton3.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (otherAC);
            }, function (_arg_1:Object):void
            {
                otherdg.dataProvider = _arg_1;
            }, "otherdg.dataProvider");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VDAYPanel_DataGridColumn1.headerText = _arg_1;
            }, "_VDAYPanel_DataGridColumn1.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VDAYPanel_DataGridColumn2.headerText = _arg_1;
            }, "_VDAYPanel_DataGridColumn2.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VDAYPanel_DataGridColumn3.headerText = _arg_1;
            }, "_VDAYPanel_DataGridColumn3.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (myAC);
            }, function (_arg_1:Object):void
            {
                mydg.dataProvider = _arg_1;
            }, "mydg.dataProvider");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VDAYPanel_DataGridColumn4.headerText = _arg_1;
            }, "_VDAYPanel_DataGridColumn4.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VDAYPanel_DataGridColumn5.headerText = _arg_1;
            }, "_VDAYPanel_DataGridColumn5.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VDAYPANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VDAYPanel_DataGridColumn6.headerText = _arg_1;
            }, "_VDAYPanel_DataGridColumn6.headerText");
            result[11] = binding;
            return (result);
        }

        protected function rankCavans_showHandler():void
        {
            _core.remote.call("getMyProposals", new Responder(onGetMyProposals), _core.cid);
            _core.remote.call("getProposalsRank", new Responder(onGetRank));
        }

        [Bindable(event="propertyChange")]
        public function get mydg():DataGrid
        {
            return (this._3366703mydg);
        }

        private function _VDAYPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.VDAYPANEL_U[0];
            _local_1 = Language.VDAYPANEL_U[9];
            _local_1 = Language.VDAYPANEL_U[10];
            _local_1 = Language.VDAYPANEL_U[1];
            _local_1 = otherAC;
            _local_1 = Language.VDAYPANEL_U[13];
            _local_1 = Language.VDAYPANEL_U[15];
            _local_1 = Language.VDAYPANEL_U[17];
            _local_1 = myAC;
            _local_1 = Language.VDAYPANEL_U[14];
            _local_1 = Language.VDAYPANEL_U[15];
            _local_1 = Language.VDAYPANEL_U[17];
        }

        [Bindable(event="propertyChange")]
        private function get otherAC():ArrayCollection
        {
            return (this._1146158286otherAC);
        }

        private function stopAll():void
        {
            var _local_1:int = 1;
            while (_local_1 < 11)
            {
                if (this[("moveCav" + _local_1)])
                {
                    this[("moveCav" + _local_1)].stopMove();
                };
                _local_1++;
            };
        }

        private function _VDAYPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _VDAYPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 100;
            _local_1.sortable = false;
            BindingManager.executeBindings(this, "_VDAYPanel_DataGridColumn4", _VDAYPanel_DataGridColumn4);
            return (_local_1);
        }

        public function tabBtnClick(_arg_1:int):void
        {
            vs.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 2)
            {
                this[("tabBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("tabBtn" + _arg_1)].selected = true;
        }

        public function ___VDAYPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get rank():LinkText
        {
            return (this._3492908rank);
        }

        public function set moveCav10(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._1042054822moveCav10;
            if (_local_2 !== _arg_1)
            {
                this._1042054822moveCav10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav10", _local_2, _arg_1));
            };
        }

        public function set rank(_arg_1:LinkText):void
        {
            var _local_2:Object = this._3492908rank;
            if (_local_2 !== _arg_1)
            {
                this._3492908rank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rankCavans():Canvas
        {
            return (this._763441754rankCavans);
        }

        public function set mydg(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._3366703mydg;
            if (_local_2 !== _arg_1)
            {
                this._3366703mydg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mydg", _local_2, _arg_1));
            };
        }

        private function set otherAC(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1146158286otherAC;
            if (_local_2 !== _arg_1)
            {
                this._1146158286otherAC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "otherAC", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mainCav():Canvas
        {
            return (this._830995295mainCav);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        private function _VDAYPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _VDAYPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "genderGWords";
            _local_1.width = 50;
            _local_1.sortable = false;
            BindingManager.executeBindings(this, "_VDAYPanel_DataGridColumn3", _VDAYPanel_DataGridColumn3);
            return (_local_1);
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

        private function fixMoveCanvaPos():void
        {
            moveCav1.x = -71;
            moveCav2.x = 86;
            moveCav3.x = 238;
            moveCav4.x = 0;
            moveCav5.x = 224;
            moveCav6.x = 352;
            moveCav7.x = 480;
            moveCav8.x = 513;
            moveCav9.x = 661;
            moveCav10.x = 630;
        }

        [Bindable(event="propertyChange")]
        public function get rank0():RoundedLabel
        {
            return (this._108280196rank0);
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

        public function set ptype3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._977658423ptype3;
            if (_local_2 !== _arg_1)
            {
                this._977658423ptype3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ptype3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get otherdg():DataGrid
        {
            return (this._1146157165otherdg);
        }

        public function set ptype1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._977658425ptype1;
            if (_local_2 !== _arg_1)
            {
                this._977658425ptype1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ptype1", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:VDAYPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _VDAYPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_VDAYPanelWatcherSetupUtil");
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

        public function set moveCav8(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._104932655moveCav8;
            if (_local_2 !== _arg_1)
            {
                this._104932655moveCav8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav8", _local_2, _arg_1));
            };
        }

        public function set moveCav9(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._104932654moveCav9;
            if (_local_2 !== _arg_1)
            {
                this._104932654moveCav9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCav10():VDAYMoveCanva
        {
            return (this._1042054822moveCav10);
        }

        public function set moveCav5(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._104932658moveCav5;
            if (_local_2 !== _arg_1)
            {
                this._104932658moveCav5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav5", _local_2, _arg_1));
            };
        }

        public function set moveCav1(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._104932662moveCav1;
            if (_local_2 !== _arg_1)
            {
                this._104932662moveCav1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav1", _local_2, _arg_1));
            };
        }

        public function set moveCav6(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._104932657moveCav6;
            if (_local_2 !== _arg_1)
            {
                this._104932657moveCav6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav6", _local_2, _arg_1));
            };
        }

        public function ___VDAYPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            showLove();
        }

        public function onGetQxWishes(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1.length == 0)
            {
                return;
            };
            _core.VDAYWishesArr = [];
            for each (_local_2 in _arg_1)
            {
                _core.VDAYWishesArr.push(_local_2);
            };
        }

        public function set rankCavans(_arg_1:Canvas):void
        {
            var _local_2:Object = this._763441754rankCavans;
            if (_local_2 !== _arg_1)
            {
                this._763441754rankCavans = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankCavans", _local_2, _arg_1));
            };
        }

        private function _VDAYPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _VDAYPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "wish";
            _local_1.sortable = false;
            _local_1.dataTipField = "wish";
            _local_1.showDataTips = true;
            BindingManager.executeBindings(this, "_VDAYPanel_DataGridColumn2", _VDAYPanel_DataGridColumn2);
            return (_local_1);
        }

        private function initMoveCanvas():*
        {
            var _local_1:int = 1;
            while (_local_1 < 11)
            {
                if (this[("moveCav" + _local_1)])
                {
                    this[("moveCav" + _local_1)].setWishWords(Language.SHOWLOVEPANEL_S[(_local_1 + 3)]);
                };
                _local_1++;
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        public function set moveCav4(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._104932659moveCav4;
            if (_local_2 !== _arg_1)
            {
                this._104932659moveCav4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav4", _local_2, _arg_1));
            };
        }

        private function _VDAYPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _VDAYPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "genderGWords";
            _local_1.width = 50;
            _local_1.sortable = false;
            BindingManager.executeBindings(this, "_VDAYPanel_DataGridColumn6", _VDAYPanel_DataGridColumn6);
            return (_local_1);
        }

        public function set moveCav7(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._104932656moveCav7;
            if (_local_2 !== _arg_1)
            {
                this._104932656moveCav7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav7", _local_2, _arg_1));
            };
        }

        public function onGetRank(_arg_1:Array):void
        {
            var _local_3:*;
            var _local_4:int;
            if (_arg_1.length < 1)
            {
                rank.text = "";
                return;
            };
            var _local_2:* = "";
            for (_local_3 in _arg_1)
            {
                switch (_local_3)
                {
                    case 0:
                        _local_2 = (_local_2 + "花心萝卜: \n");
                        _local_2 = (_local_2 + (((((_arg_1[0].name + ", ") + _arg_1[0].gender) + ", 次数: ") + _arg_1[0].data) + "\n"));
                        break;
                    case 1:
                        _local_2 = (_local_2 + "心心相印: \n");
                        _local_2 = (_local_2 + (((((_arg_1[1].name + ", ") + _arg_1[1].gender) + ", 次数: ") + _arg_1[1].data) + "\n"));
                        break;
                    case 2:
                        _local_2 = (_local_2 + "万人倾心: \n");
                        _local_2 = (_local_2 + (((((_arg_1[2].name + ", ") + _arg_1[2].gender) + ", 次数: ") + _arg_1[2].data) + "\n"));
                        break;
                };
            };
            rank.text = _local_2;
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        [Bindable(event="propertyChange")]
        public function get ptype1():RoundedLabel
        {
            return (this._977658425ptype1);
        }

        [Bindable(event="propertyChange")]
        public function get ptype2():RoundedLabel
        {
            return (this._977658424ptype2);
        }

        public function set ptype2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._977658424ptype2;
            if (_local_2 !== _arg_1)
            {
                this._977658424ptype2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ptype2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCav1():VDAYMoveCanva
        {
            return (this._104932662moveCav1);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav4():VDAYMoveCanva
        {
            return (this._104932659moveCav4);
        }

        public function set mainCav(_arg_1:Canvas):void
        {
            var _local_2:Object = this._830995295mainCav;
            if (_local_2 !== _arg_1)
            {
                this._830995295mainCav = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainCav", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCav7():VDAYMoveCanva
        {
            return (this._104932656moveCav7);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav8():VDAYMoveCanva
        {
            return (this._104932655moveCav8);
        }

        public function set moveCav2(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._104932661moveCav2;
            if (_local_2 !== _arg_1)
            {
                this._104932661moveCav2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCav5():VDAYMoveCanva
        {
            return (this._104932658moveCav5);
        }

        public function set moveCav3(_arg_1:VDAYMoveCanva):void
        {
            var _local_2:Object = this._104932660moveCav3;
            if (_local_2 !== _arg_1)
            {
                this._104932660moveCav3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveCav3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moveCav9():VDAYMoveCanva
        {
            return (this._104932654moveCav9);
        }

        public function __rankCavans_show(_arg_1:FlexEvent):void
        {
            rankCavans_showHandler();
        }

        [Bindable(event="propertyChange")]
        public function get moveCav2():VDAYMoveCanva
        {
            return (this._104932661moveCav2);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:Number;
            super.visible = _arg_1;
            if (_arg_1)
            {
                fixMoveCanvaPos();
                if (!_fristFlag)
                {
                    moveAll();
                };
                if (((vs) && (vs.selectedIndex == 0)))
                {
                    _local_2 = (new Date().getTime() - _lastCheckTime);
                    trace(("interval:" + _local_2));
                    if (_local_2 >= MIN_CHECK_INTERVAL)
                    {
                        _lastCheckTime = new Date().getTime();
                        _core.remote.call("getVDAYWishes", new Responder(onGetQxWishes));
                    };
                };
            }
            else
            {
                stopAll();
            };
        }

        [Bindable(event="propertyChange")]
        private function get myAC():ArrayCollection
        {
            return (this._3365582myAC);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav6():VDAYMoveCanva
        {
            return (this._104932657moveCav6);
        }

        [Bindable(event="propertyChange")]
        public function get moveCav3():VDAYMoveCanva
        {
            return (this._104932660moveCav3);
        }

        private function set myAC(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._3365582myAC;
            if (_local_2 !== _arg_1)
            {
                this._3365582myAC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myAC", _local_2, _arg_1));
            };
        }

        private function _VDAYPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _VDAYPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 100;
            _local_1.sortable = false;
            BindingManager.executeBindings(this, "_VDAYPanel_DataGridColumn1", _VDAYPanel_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get ptype4():RoundedLabel
        {
            return (this._977658422ptype4);
        }

        private function _VDAYPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _VDAYPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "wish";
            _local_1.sortable = false;
            _local_1.dataTipField = "wish";
            _local_1.showDataTips = true;
            BindingManager.executeBindings(this, "_VDAYPanel_DataGridColumn5", _VDAYPanel_DataGridColumn5);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

