// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MagicCrystalCanvas

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.containers.Canvas;
    import mx.controls.Image;
    import mx.controls.NumericStepper;
    import mx.controls.Alert;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.NumericStepperEvent;
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

    public class MagicCrystalCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _991744828perVal:Text;
        public var _MagicCrystalCanvas_Text11:Text;
        private var _2937411_lmc:Number = 0;
        public var _MagicCrystalCanvas_BasicGlowButton1:BasicGlowButton;
        public var _MagicCrystalCanvas_BasicGlowButton3:BasicGlowButton;
        public var _MagicCrystalCanvas_BasicGlowButton4:BasicGlowButton;
        private var _1285520421_active:Number = 0;
        private var _lv:Number = 0;
        private var _2944138_smc:Number = 0;
        public var _MagicCrystalCanvas_Canvas2:Canvas;
        private var _1422988188actBth:BasicGlowButton;
        public var _MagicCrystalCanvas_Text1:Text;
        private var _104387img:Image;
        public var _MagicCrystalCanvas_Text5:Text;
        public var _MagicCrystalCanvas_Text7:Text;
        public var _MagicCrystalCanvas_Text2:Text;
        public var _MagicCrystalCanvas_Text8:Text;
        public var _MagicCrystalCanvas_Text9:Text;
        private var _60073210jewelUpdateNum:NumericStepper;
        private var _index:Number = -1;
        public var _MagicCrystalCanvas_Canvas1:Canvas;
        private var _1164649830limitVal:Text;
        private var _alert:Alert;
        private var _2938021_max:Number = 0;
        private var _1289197386expBar:PropertyBar;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":175,
                    "height":150,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"_MagicCrystalCanvas_Text1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":28,
                                "x":63.5,
                                "y":21
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"_MagicCrystalCanvas_Text2",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFF0000;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":28,
                                "x":63.5,
                                "y":42
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"perVal",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFF00;
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":104.5,
                                "text":"+10000",
                                "x":100.5,
                                "y":21
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"limitVal",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFF0000;
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":104.5,
                                "text":"+10000",
                                "x":100.5,
                                "y":42
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PropertyBar,
                        "id":"expBar",
                        "stylesFactory":function ():void
                        {
                            this.cornerRadius = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":3,
                                "y":75,
                                "width":162,
                                "height":14,
                                "barCornerRadius":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"_MagicCrystalCanvas_Canvas1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":3,
                                "y":90,
                                "width":168,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_MagicCrystalCanvas_Text5",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "right";
                                        this.fontSize = 12;
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":32,
                                            "x":41.5,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":10,
                                            "text":"+",
                                            "x":70,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_MagicCrystalCanvas_Text7",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "left";
                                        this.fontSize = 12;
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":30,
                                            "x":81.5,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_MagicCrystalCanvas_Text8",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":48,
                                            "x":-1,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_MagicCrystalCanvas_Text9",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":32,
                                            "x":116,
                                            "y":0,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":11,
                                            "text":"/\n",
                                            "x":107,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_MagicCrystalCanvas_BasicGlowButton1",
                                    "events":{"click":"___MagicCrystalCanvas_BasicGlowButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":57,
                                            "width":50,
                                            "y":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"jewelUpdateNum",
                                    "events":{"change":"__jewelUpdateNum_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":28,
                                            "minimum":1,
                                            "maximum":9999,
                                            "x":2,
                                            "value":0,
                                            "width":55
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"actBth",
                                    "events":{"click":"__actBth_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":140.5,
                                            "label":"+",
                                            "width":24,
                                            "y":-1
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_MagicCrystalCanvas_BasicGlowButton3",
                                    "events":{"click":"___MagicCrystalCanvas_BasicGlowButton3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":115,
                                            "width":50,
                                            "y":28
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"_MagicCrystalCanvas_Canvas2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":9,
                                "y":90,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_MagicCrystalCanvas_Text11",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":48,
                                            "x":-1,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "right";
                                        this.fontSize = 12;
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":25,
                                            "text":"--",
                                            "x":41.5,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":32,
                                            "text":"--",
                                            "x":77,
                                            "y":0,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":11,
                                            "text":"/\n",
                                            "x":65.5,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_MagicCrystalCanvas_BasicGlowButton4",
                                    "events":{"click":"___MagicCrystalCanvas_BasicGlowButton4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":37,
                                            "width":86,
                                            "y":28,
                                            "height":20
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

        public function MagicCrystalCanvas()
        {
            mx_internal::_document = this;
            this.width = 175;
            this.height = 150;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MagicCrystalCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get jewelUpdateNum():NumericStepper
        {
            return (this._60073210jewelUpdateNum);
        }

        private function MagicCrystalNumChange():void
        {
            var _local_2:String;
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_MAGICCRYSTAL);
            if (_local_1)
            {
                _local_2 = _local_1.getSelectPointType();
                if (_local_2 == "1")
                {
                    if (jewelUpdateNum.value > _core.player.magiccystalpre)
                    {
                        jewelUpdateNum.value = _core.player.magiccystalpre;
                    };
                }
                else
                {
                    if (jewelUpdateNum.value > _core.player.magiccystallimit)
                    {
                        jewelUpdateNum.value = _core.player.magiccystallimit;
                    };
                };
            };
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        public function set perVal(_arg_1:Text):void
        {
            var _local_2:Object = this._991744828perVal;
            if (_local_2 !== _arg_1)
            {
                this._991744828perVal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "perVal", _local_2, _arg_1));
            };
        }

        public function ___MagicCrystalCanvas_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            MagicCrystalActive();
        }

        override public function initialize():void
        {
            var target:MagicCrystalCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MagicCrystalCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_MagicCrystalCanvasWatcherSetupUtil");
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
        private function get _smc():Number
        {
            return (this._2944138_smc);
        }

        private function set _lmc(_arg_1:Number):void
        {
            var _local_2:Object = this._2937411_lmc;
            if (_local_2 !== _arg_1)
            {
                this._2937411_lmc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_lmc", _local_2, _arg_1));
            };
        }

        public function set expBar(_arg_1:PropertyBar):void
        {
            var _local_2:Object = this._1289197386expBar;
            if (_local_2 !== _arg_1)
            {
                this._1289197386expBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expBar", _local_2, _arg_1));
            };
        }

        private function set _smc(_arg_1:Number):void
        {
            var _local_2:Object = this._2944138_smc;
            if (_local_2 !== _arg_1)
            {
                this._2944138_smc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_smc", _local_2, _arg_1));
            };
        }

        private function MagicCrystalRecovery():void
        {
            var handler:Function;
            if (((_lmc == 0) && (_smc == 0)))
            {
                return;
            };
            if (1 > _core.player.magiccystalrec)
            {
                _core.sysMsg(Language.MAGIC_CRYSTAL_PANEL[3]);
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("MagicCrystalRecovery", null, _index);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.MAGIC_CRYSTAL_PANEL[6].toString().replace("{num}", 1);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
        }

        private function updatePro():void
        {
            expBar.valueMax = _max;
            expBar.value = (_lmc + _smc);
            if (_max == 0)
            {
                perVal.text = "--";
                limitVal.text = "--";
            }
            else
            {
                perVal.text = ("+" + Number((Math.floor((((_lmc / _max) * GamePredef.MAGIC_CRYSTAL_UP[_index][_lv]["v"]) * 10000)) / 10000)).toFixed(4));
                limitVal.text = ("+" + Number((Math.floor((((_smc / _max) * GamePredef.MAGIC_CRYSTAL_UP[_index][_lv]["v"]) * 10000)) / 10000)).toFixed(4));
                if (ToolKit.isEqual(GamePredef.MAGIC_CRYSTAL_UP[_index][_lv]["num"], 0))
                {
                    actBth.visible = false;
                }
                else
                {
                    actBth.visible = true;
                };
            };
            img.source = ResManager.getIconUrl(GamePredef.MAGIC_CRYSTAL_PROP_ICON[_index]);
        }

        public function set limitVal(_arg_1:Text):void
        {
            var _local_2:Object = this._1164649830limitVal;
            if (_local_2 !== _arg_1)
            {
                this._1164649830limitVal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitVal", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _active():Number
        {
            return (this._1285520421_active);
        }

        public function __jewelUpdateNum_change(_arg_1:NumericStepperEvent):void
        {
            MagicCrystalNumChange();
        }

        [Bindable(event="propertyChange")]
        public function get expBar():PropertyBar
        {
            return (this._1289197386expBar);
        }

        private function _MagicCrystalCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[8];
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[9];
            _local_1 = (_active == 1);
            _local_1 = _lmc;
            _local_1 = _smc;
            _local_1 = (Language.MAGIC_CRYSTAL_PANEL[7] + ":\n");
            _local_1 = _max;
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[10];
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[11];
            _local_1 = (_active == 0);
            _local_1 = (Language.MAGIC_CRYSTAL_PANEL[7] + ":\n");
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[12];
        }

        [Bindable(event="propertyChange")]
        private function get _max():Number
        {
            return (this._2938021_max);
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        [Bindable(event="propertyChange")]
        public function get perVal():Text
        {
            return (this._991744828perVal);
        }

        public function set actBth(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1422988188actBth;
            if (_local_2 !== _arg_1)
            {
                this._1422988188actBth = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actBth", _local_2, _arg_1));
            };
        }

        public function ___MagicCrystalCanvas_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            MagicCrystalRecovery();
        }

        private function MagicCrystalActive():void
        {
            var handler:Function;
            if (GamePredef.MAGIC_CRYSTAL_ACTIVE[_index]["num"] > _core.player.magiccystalrec)
            {
                _core.sysMsg(Language.MAGIC_CRYSTAL_PANEL[3]);
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("MagicCrystalActive", null, _index);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.MAGIC_CRYSTAL_PANEL[4].toString().replace("{num}", GamePredef.MAGIC_CRYSTAL_ACTIVE[_index]["num"]);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
        }

        private function _MagicCrystalCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_Text1.text = _arg_1;
            }, "_MagicCrystalCanvas_Text1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_Text2.text = _arg_1;
            }, "_MagicCrystalCanvas_Text2.text");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_active == 1);
            }, function (_arg_1:Boolean):void
            {
                _MagicCrystalCanvas_Canvas1.visible = _arg_1;
            }, "_MagicCrystalCanvas_Canvas1.visible");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _lmc;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_Text5.text = _arg_1;
            }, "_MagicCrystalCanvas_Text5.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _smc;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_Text7.text = _arg_1;
            }, "_MagicCrystalCanvas_Text7.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_CRYSTAL_PANEL[7] + ":\n");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_Text8.text = _arg_1;
            }, "_MagicCrystalCanvas_Text8.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _max;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_Text9.text = _arg_1;
            }, "_MagicCrystalCanvas_Text9.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_BasicGlowButton1.label = _arg_1;
            }, "_MagicCrystalCanvas_BasicGlowButton1.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_BasicGlowButton3.label = _arg_1;
            }, "_MagicCrystalCanvas_BasicGlowButton3.label");
            result[8] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_active == 0);
            }, function (_arg_1:Boolean):void
            {
                _MagicCrystalCanvas_Canvas2.visible = _arg_1;
            }, "_MagicCrystalCanvas_Canvas2.visible");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_CRYSTAL_PANEL[7] + ":\n");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_Text11.text = _arg_1;
            }, "_MagicCrystalCanvas_Text11.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalCanvas_BasicGlowButton4.label = _arg_1;
            }, "_MagicCrystalCanvas_BasicGlowButton4.label");
            result[11] = binding;
            return (result);
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            _index = data.index;
            if (data.a == 0)
            {
                _active = 0;
                _max = 0;
            }
            else
            {
                _active = data.a;
                _max = data.max;
                _lmc = data.l;
                _smc = data.s;
                _lv = data.lv;
            };
            updatePro();
        }

        private function set _active(_arg_1:Number):void
        {
            var _local_2:Object = this._1285520421_active;
            if (_local_2 !== _arg_1)
            {
                this._1285520421_active = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_active", _local_2, _arg_1));
            };
        }

        public function __actBth_click(_arg_1:MouseEvent):void
        {
            MagicCrystalUp();
        }

        [Bindable(event="propertyChange")]
        public function get limitVal():Text
        {
            return (this._1164649830limitVal);
        }

        private function MagicCrystalUp():void
        {
            var handler:Function;
            if (ToolKit.isEqual(GamePredef.MAGIC_CRYSTAL_UP[_index][_lv]["num"], 0))
            {
                return;
            };
            if (GamePredef.MAGIC_CRYSTAL_UP[_index][_lv]["num"] > _core.player.magiccystalrec)
            {
                _core.sysMsg(Language.MAGIC_CRYSTAL_PANEL[3]);
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("MagicCrystalUp", null, _index);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.MAGIC_CRYSTAL_PANEL[5].toString().replace("{num}", GamePredef.MAGIC_CRYSTAL_UP[_index][_lv]["num"]);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
        }

        private function MagicCrystalAddPower():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_MAGICCRYSTAL);
            if (_local_1)
            {
                if (ToolKit.add(_lmc, _smc) == _max)
                {
                    return;
                };
                _core.remote.call("MagicCrystalAddPower", null, _index, jewelUpdateNum.value, _local_1.getSelectPointType());
            };
        }

        public function ___MagicCrystalCanvas_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            MagicCrystalAddPower();
        }

        [Bindable(event="propertyChange")]
        private function get _lmc():Number
        {
            return (this._2937411_lmc);
        }

        [Bindable(event="propertyChange")]
        public function get actBth():BasicGlowButton
        {
            return (this._1422988188actBth);
        }

        private function set _max(_arg_1:Number):void
        {
            var _local_2:Object = this._2938021_max;
            if (_local_2 !== _arg_1)
            {
                this._2938021_max = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_max", _local_2, _arg_1));
            };
        }

        public function set jewelUpdateNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._60073210jewelUpdateNum;
            if (_local_2 !== _arg_1)
            {
                this._60073210jewelUpdateNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelUpdateNum", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

