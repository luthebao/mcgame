// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipMount

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.controls.Text;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.events.ResizeEvent;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class TipMount extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3059440con2:Canvas;
        private var _1699273611basicPro4:Label;
        public var _TipMount_Label1:Label;
        public var _TipMount_Label8:Label;
        private var _1699273612basicPro3:Label;
        private var _1148692632addPro4:Label;
        private var _1148692635addPro1:Label;
        private var _1139881950topText:RoundedLabel;
        private var _1148692631addPro5:Label;
        private var _1699273609basicPro6:Label;
        private var _1699273613basicPro2:Label;
        private var _1148692634addPro2:Label;
        private var _1148692630addPro6:Label;
        private var _3059439con1:Canvas;
        private var _1699273614basicPro1:Label;
        private var _1699273610basicPro5:Label;
        private var _3079825desc:Text;
        private var _1148692633addPro3:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":250,
                    "height":332,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"topText",
                        "stylesFactory":function ():void
                        {
                            this.top = "5";
                            this.left = "5";
                            this.fontSize = 16;
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"htmlText":""});
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___TipMount_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.top = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnToolTipClose",
                                "width":15,
                                "height":15
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"desc",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"坐骑描述",
                                "includeInLayout":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"con1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":30,
                                "height":142,
                                "width":238,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TipMount_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":50,
                                            "y":0,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"basicPro1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":20,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"basicPro2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":40,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"basicPro3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":60,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"basicPro4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":80,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"basicPro5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":100,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"basicPro6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":120,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"con2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":180,
                                "width":238,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TipMount_Label8",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":50,
                                            "y":0,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"addPro1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":20,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"addPro2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":40,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"addPro3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":60,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"addPro4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":80,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"addPro5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":100,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"addPro6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 1961723;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":120,
                                            "width":213,
                                            "height":20,
                                            "text":""
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _buffType:Array = ["lifeBasic", "phyAttackBasic", "magAttackBasic", "phyDefenseBasic", "magDefenseBasic", "debuffBasic", "lifePer", "phyAttackPer", "magAttackPer", "phyDefensePer", "magDefensePer", "debuffPer"];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipMount()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.width = 250;
            this.height = 332;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("resize", ___TipMount_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipMount._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get basicPro5():Label
        {
            return (this._1699273610basicPro5);
        }

        public function ___TipMount_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get basicPro2():Label
        {
            return (this._1699273613basicPro2);
        }

        private function _TipMount_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMount_Label1.text = _arg_1;
            }, "_TipMount_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _TipMount_Label1.filters = _arg_1;
            }, "_TipMount_Label1.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMount_Label8.text = _arg_1;
            }, "_TipMount_Label8.text");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _TipMount_Label8.filters = _arg_1;
            }, "_TipMount_Label8.filters");
            result[3] = binding;
            return (result);
        }

        public function set basicPro5(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273610basicPro5;
            if (_local_2 !== _arg_1)
            {
                this._1699273610basicPro5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro5", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:TipMount;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipMount_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipMountWatcherSetupUtil");
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
        public function get con1():Canvas
        {
            return (this._3059439con1);
        }

        public function ___TipMount_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function set basicPro6(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273609basicPro6;
            if (_local_2 !== _arg_1)
            {
                this._1699273609basicPro6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get desc():Text
        {
            return (this._3079825desc);
        }

        public function set desc(_arg_1:Text):void
        {
            var _local_2:Object = this._3079825desc;
            if (_local_2 !== _arg_1)
            {
                this._3079825desc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "desc", _local_2, _arg_1));
            };
        }

        public function set basicPro4(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273611basicPro4;
            if (_local_2 !== _arg_1)
            {
                this._1699273611basicPro4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get topText():RoundedLabel
        {
            return (this._1139881950topText);
        }

        public function set topText(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1139881950topText;
            if (_local_2 !== _arg_1)
            {
                this._1139881950topText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "topText", _local_2, _arg_1));
            };
        }

        public function set addPro4(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692632addPro4;
            if (_local_2 !== _arg_1)
            {
                this._1148692632addPro4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro4", _local_2, _arg_1));
            };
        }

        public function set addPro1(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692635addPro1;
            if (_local_2 !== _arg_1)
            {
                this._1148692635addPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro1", _local_2, _arg_1));
            };
        }

        public function set addPro6(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692630addPro6;
            if (_local_2 !== _arg_1)
            {
                this._1148692630addPro6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro6", _local_2, _arg_1));
            };
        }

        public function set addPro3(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692633addPro3;
            if (_local_2 !== _arg_1)
            {
                this._1148692633addPro3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro3", _local_2, _arg_1));
            };
        }

        public function set addPro5(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692631addPro5;
            if (_local_2 !== _arg_1)
            {
                this._1148692631addPro5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro5", _local_2, _arg_1));
            };
        }

        public function set con1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3059439con1;
            if (_local_2 !== _arg_1)
            {
                this._3059439con1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "con1", _local_2, _arg_1));
            };
        }

        private function _TipMount_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MOUNTPANEL_U[12];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MOUNTPANEL_U[13];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        public function set addPro2(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692634addPro2;
            if (_local_2 !== _arg_1)
            {
                this._1148692634addPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addPro1():Label
        {
            return (this._1148692635addPro1);
        }

        [Bindable(event="propertyChange")]
        public function get addPro2():Label
        {
            return (this._1148692634addPro2);
        }

        [Bindable(event="propertyChange")]
        public function get addPro3():Label
        {
            return (this._1148692633addPro3);
        }

        [Bindable(event="propertyChange")]
        public function get addPro4():Label
        {
            return (this._1148692632addPro4);
        }

        public function set basicPro3(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273612basicPro3;
            if (_local_2 !== _arg_1)
            {
                this._1699273612basicPro3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addPro5():Label
        {
            return (this._1148692631addPro5);
        }

        [Bindable(event="propertyChange")]
        public function get addPro6():Label
        {
            return (this._1148692630addPro6);
        }

        public function set basicPro1(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273614basicPro1;
            if (_local_2 !== _arg_1)
            {
                this._1699273614basicPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro1", _local_2, _arg_1));
            };
        }

        public function set basicPro2(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273613basicPro2;
            if (_local_2 !== _arg_1)
            {
                this._1699273613basicPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get basicPro6():Label
        {
            return (this._1699273609basicPro6);
        }

        public function set con2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3059440con2;
            if (_local_2 !== _arg_1)
            {
                this._3059440con2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "con2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get basicPro1():Label
        {
            return (this._1699273614basicPro1);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro3():Label
        {
            return (this._1699273612basicPro3);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro4():Label
        {
            return (this._1699273611basicPro4);
        }

        public function set object(_arg_1:Object):void
        {
            var _local_8:Number;
            if (!_arg_1)
            {
                visible = false;
                return;
            };
            var _local_2:Object = GameData.d[GamePredef.TBL_MOUNT_DRESS][int(_arg_1.id)];
            topText.htmlText = (((((_local_2.name + "     ") + Language.MOUNTPANEL_U[54]) + ":") + (_local_2.effectiveTime / 24)) + Language.MOUNTPANEL_U[55]);
            desc.htmlText = _local_2.description;
            var _local_3:Number = 0;
            var _local_4:Number = 0;
            while (_local_4 <= 5)
            {
                this[("basicPro" + ToolKit.add(_local_4, 1))].text = "";
                if (((_local_2[_buffType[_local_4]]) && (Number(_local_2[_buffType[_local_4]]) >= 0)))
                {
                    if (((!(_local_3)) || (_local_3 == 0)))
                    {
                        _local_3 = 1;
                    };
                    _local_8 = (56 + _local_4);
                    this[("basicPro" + _local_3)].text = ((Language.MOUNTPANEL_U[_local_8] + ":") + _local_2[_buffType[_local_4]]);
                    _local_3++;
                };
                _local_4++;
            };
            con2.y = ((_local_3 * 20) + 50);
            var _local_5:Number = 0;
            var _local_6:Number = 6;
            while (_local_6 <= 11)
            {
                this[("addPro" + ToolKit.add(ToolKit.minus(_local_6, 11), 6))].text = "";
                if (((_local_2[_buffType[_local_6]]) && (Number(_local_2[_buffType[_local_6]]) >= 0)))
                {
                    if (((!(_local_5)) || (_local_5 == 0)))
                    {
                        _local_5 = 1;
                    };
                    _local_8 = (56 + _local_6);
                    this[("addPro" + _local_5)].text = (((Language.MOUNTPANEL_U[_local_8] + ":") + _local_2[_buffType[_local_6]]) + "%");
                    _local_5++;
                };
                _local_6++;
            };
            var _local_7:Number = ToolKit.add(100, (ToolKit.add(_local_3, _local_5) * 20));
            this.height = _local_7;
            setPos();
            visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get con2():Canvas
        {
            return (this._3059440con2);
        }


    }
}//package com.qeedoo.ui.view.comp

