// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FairySkillListComp

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.DragEvent;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
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

    public class FairySkillListComp extends Canvas implements IBindingClient 
    {

        private static const ITEM_NUM:int = 5;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3614s1:ItemSlot;
        private var _3616s3:ItemSlot;
        private var _790270159clearBtn:BasicGlowButton;
        private var _3313732lab1:Label;
        private var _3313733lab2:Label;
        private var _3313734lab3:Label;
        private var _3313731lab0:Label;
        private var _3313735lab4:Label;
        private var _836075691useBtn:BasicGlowButton;
        private var _3613s0:ItemSlot;
        private var _3615s2:ItemSlot;
        private var _3617s4:ItemSlot;
        private var _100346066index:int = -1;
        private var _110371416title:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":0xFF,
                    "height":75,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"title",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "width":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "y":15,
                                "width":260,
                                "height":50,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":8,
                                            "y":8,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s0",
                                                "events":{
                                                    "dragDrop":"__s0_dragDrop",
                                                    "mouseDown":"__s0_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":true,
                                                        "x":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "8";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"1",
                                                        "x":3,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s1",
                                                "events":{
                                                    "dragDrop":"__s1_dragDrop",
                                                    "mouseDown":"__s1_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":true,
                                                        "x":40
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "8";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"2",
                                                        "x":43,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s2",
                                                "events":{
                                                    "dragDrop":"__s2_dragDrop",
                                                    "mouseDown":"__s2_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":true,
                                                        "x":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "8";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"3",
                                                        "x":82,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s3",
                                                "events":{
                                                    "dragDrop":"__s3_dragDrop",
                                                    "mouseDown":"__s3_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":true,
                                                        "x":120
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "8";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"4",
                                                        "x":123,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s4",
                                                "events":{
                                                    "dragDrop":"__s4_dragDrop",
                                                    "mouseDown":"__s4_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":true,
                                                        "x":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "8";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"5",
                                                        "x":163,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"useBtn",
                                    "events":{"click":"__useBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":205,
                                            "y":6,
                                            "styleName":"BtnNormalBlue",
                                            "label":"",
                                            "width":45,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"clearBtn",
                                    "events":{"click":"__clearBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":205,
                                            "y":26,
                                            "styleName":"BtnNormalBlue",
                                            "width":45,
                                            "height":19
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

        public function FairySkillListComp()
        {
            mx_internal::_document = this;
            this.width = 0xFF;
            this.height = 75;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FairySkillListComp._watcherSetupUtil = _arg_1;
        }


        private function setSlot(_arg_1:DragEvent):void
        {
        }

        public function changeSkill(_arg_1:ItemSlot, _arg_2:ItemSlot):Boolean
        {
            var _local_5:ItemSlot;
            var _local_6:Object;
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < ITEM_NUM)
            {
                _local_5 = ItemSlot(this[("s" + _local_4)]);
                if (_arg_2 == _local_5)
                {
                    _local_3++;
                }
                else
                {
                    if (_arg_1 == _local_5)
                    {
                        _local_3++;
                    };
                };
                _local_4++;
            };
            if (2 == _local_3)
            {
                _local_6 = {};
                _local_6.slotData = _arg_2.slotData;
                _local_6.type = _arg_2.type;
                _local_6.giid = _arg_2.giid;
                _arg_2.slotData = _arg_1.slotData;
                _arg_2.type = _arg_1.type;
                _arg_2.giid = _arg_1.giid;
                _arg_1.slotData = _local_6.slotData;
                _arg_1.type = _local_6.type;
                _arg_1.giid = _local_6.giid;
                return (true);
            };
            return (false);
        }

        public function getConfigData():Object
        {
            var _local_3:ItemSlot;
            var _local_1:Object = {};
            var _local_2:int;
            while (_local_2 < ITEM_NUM)
            {
                _local_3 = ItemSlot(this[("s" + _local_2)]);
                if (((_local_3) && (_local_3.slotData)))
                {
                    _local_1[("c" + _local_2)] = _local_3.slotData.id;
                }
                else
                {
                    _local_1[("c" + _local_2)] = -1;
                };
                _local_2++;
            };
            return (_local_1);
        }

        public function set lab3(_arg_1:Label):void
        {
            var _local_2:Object = this._3313734lab3;
            if (_local_2 !== _arg_1)
            {
                this._3313734lab3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab3", _local_2, _arg_1));
            };
        }

        public function __useBtn_click(_arg_1:MouseEvent):void
        {
            select();
        }

        public function set lab1(_arg_1:Label):void
        {
            var _local_2:Object = this._3313732lab1;
            if (_local_2 !== _arg_1)
            {
                this._3313732lab1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab1", _local_2, _arg_1));
            };
        }

        public function set lab2(_arg_1:Label):void
        {
            var _local_2:Object = this._3313733lab2;
            if (_local_2 !== _arg_1)
            {
                this._3313733lab2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab2", _local_2, _arg_1));
            };
        }

        public function set lab0(_arg_1:Label):void
        {
            var _local_2:Object = this._3313731lab0;
            if (_local_2 !== _arg_1)
            {
                this._3313731lab0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s3():ItemSlot
        {
            return (this._3616s3);
        }

        [Bindable(event="propertyChange")]
        public function get s4():ItemSlot
        {
            return (this._3617s4);
        }

        public function getSkill(_arg_1:ItemSlot, _arg_2:ItemSlot):Boolean
        {
            var _local_3:ItemSlot;
            var _local_5:ItemSlot;
            var _local_4:int;
            _local_4 = 0;
            while (_local_4 < ITEM_NUM)
            {
                _local_5 = ItemSlot(this[("s" + _local_4)]);
                if (_arg_2 == _local_5)
                {
                    _local_3 = _local_5;
                    break;
                };
                _local_4++;
            };
            if (_local_3)
            {
                _local_4 = 0;
                while (_local_4 < ITEM_NUM)
                {
                    _local_3 = ItemSlot(this[("s" + _local_4)]);
                    if (_local_3 != _arg_2)
                    {
                        if (((((_local_3) && (_local_3.slotData)) && (_arg_1.slotData)) && (_local_3.slotData.name == _arg_1.slotData.name)))
                        {
                            _core.sysMsg(Language.FAIRY_MANAGER_PANEL_U[103]);
                            return (true);
                        };
                    };
                    _local_4++;
                };
                _arg_2.slotData = _arg_1.slotData;
                _arg_2.type = _arg_1.type;
                _arg_2.giid = _arg_1.giid;
                return (true);
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get s0():ItemSlot
        {
            return (this._3613s0);
        }

        public function __s2_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function beSelect(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                useBtn.label = Language.FAIRY_MANAGER_PANEL_U[102];
            }
            else
            {
                useBtn.label = Language.FAIRY_MANAGER_PANEL_U[99];
            };
            itemEnable(_arg_1);
        }

        public function __s2_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function init():void
        {
            if (index == -1)
            {
                title.text = Language.FAIRY_MANAGER_PANEL_U[98];
            }
            else
            {
                title.text = (Language.FAIRY_MANAGER_PANEL_U[98] + (index + 1));
            };
            clear();
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
        }

        public function set useBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._836075691useBtn;
            if (_local_2 !== _arg_1)
            {
                this._836075691useBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useBtn", _local_2, _arg_1));
            };
        }

        public function set index(_arg_1:int):void
        {
            var _local_2:Object = this._100346066index;
            if (_local_2 !== _arg_1)
            {
                this._100346066index = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "index", _local_2, _arg_1));
            };
        }

        public function __s0_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set clearBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._790270159clearBtn;
            if (_local_2 !== _arg_1)
            {
                this._790270159clearBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clearBtn", _local_2, _arg_1));
            };
        }

        public function __s4_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        override public function initialize():void
        {
            var target:FairySkillListComp;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FairySkillListComp_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FairySkillListCompWatcherSetupUtil");
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
        public function get s2():ItemSlot
        {
            return (this._3615s2);
        }

        private function _FairySkillListComp_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[98];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FAIRY_CONFIG_RIGHT);
            }, function (_arg_1:int):void
            {
                s0.slotType = _arg_1;
            }, "s0.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FAIRY_CONFIG_RIGHT);
            }, function (_arg_1:int):void
            {
                s1.slotType = _arg_1;
            }, "s1.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FAIRY_CONFIG_RIGHT);
            }, function (_arg_1:int):void
            {
                s2.slotType = _arg_1;
            }, "s2.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FAIRY_CONFIG_RIGHT);
            }, function (_arg_1:int):void
            {
                s3.slotType = _arg_1;
            }, "s3.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FAIRY_CONFIG_RIGHT);
            }, function (_arg_1:int):void
            {
                s4.slotType = _arg_1;
            }, "s4.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[100];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                clearBtn.label = _arg_1;
            }, "clearBtn.label");
            result[6] = binding;
            return (result);
        }

        public function set s1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3614s1;
            if (_local_2 !== _arg_1)
            {
                this._3614s1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s1", _local_2, _arg_1));
            };
        }

        public function set title(_arg_1:Label):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s1():ItemSlot
        {
            return (this._3614s1);
        }

        public function set s4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3617s4;
            if (_local_2 !== _arg_1)
            {
                this._3617s4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab0():Label
        {
            return (this._3313731lab0);
        }

        public function __s3_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get lab3():Label
        {
            return (this._3313734lab3);
        }

        [Bindable(event="propertyChange")]
        public function get lab4():Label
        {
            return (this._3313735lab4);
        }

        public function __s4_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get lab1():Label
        {
            return (this._3313732lab1);
        }

        public function __s0_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        private function clear():void
        {
            var _local_1:int;
            while (_local_1 < ITEM_NUM)
            {
                this[("s" + _local_1)].clean();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get clearBtn():BasicGlowButton
        {
            return (this._790270159clearBtn);
        }

        private function _FairySkillListComp_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[98];
            _local_1 = Slot.SLOT_FAIRY_CONFIG_RIGHT;
            _local_1 = Slot.SLOT_FAIRY_CONFIG_RIGHT;
            _local_1 = Slot.SLOT_FAIRY_CONFIG_RIGHT;
            _local_1 = Slot.SLOT_FAIRY_CONFIG_RIGHT;
            _local_1 = Slot.SLOT_FAIRY_CONFIG_RIGHT;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[100];
        }

        public function set s0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3613s0;
            if (_local_2 !== _arg_1)
            {
                this._3613s0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab2():Label
        {
            return (this._3313733lab2);
        }

        [Bindable(event="propertyChange")]
        public function get useBtn():BasicGlowButton
        {
            return (this._836075691useBtn);
        }

        public function set s2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3615s2;
            if (_local_2 !== _arg_1)
            {
                this._3615s2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s2", _local_2, _arg_1));
            };
        }

        public function set s3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3616s3;
            if (_local_2 !== _arg_1)
            {
                this._3616s3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get index():int
        {
            return (this._100346066index);
        }

        public function refresh(_arg_1:int, _arg_2:Object):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Object;
            title.text = (Language.FAIRY_MANAGER_PANEL_U[98] + (index + 1));
            beSelect((_arg_1 == index));
            if (_arg_2)
            {
                _local_3 = 0;
                while (_local_3 < ITEM_NUM)
                {
                    if (this[("s" + _local_3)])
                    {
                        _local_4 = int(_arg_2[("c" + _local_3)]);
                        _local_5 = _core.data.gameData[GamePredef.TBL_SKILL][_local_4];
                        if (_local_5)
                        {
                            this[("s" + _local_3)].slotData = _local_5;
                            this[("s" + _local_3)].type = GamePredef.TBL_SKILL;
                            this[("s" + _local_3)].giid = _local_5.id;
                        };
                    };
                    _local_3++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get title():Label
        {
            return (this._110371416title);
        }

        public function __s1_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s1_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s3_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set lab4(_arg_1:Label):void
        {
            var _local_2:Object = this._3313735lab4;
            if (_local_2 !== _arg_1)
            {
                this._3313735lab4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab4", _local_2, _arg_1));
            };
        }

        public function __clearBtn_click(_arg_1:MouseEvent):void
        {
            clear();
        }

        private function select():void
        {
            dispatchEvent(new MouseEvent("select"));
        }

        private function itemEnable(_arg_1:Boolean):void
        {
            var _local_2:int;
            while (_local_2 < ITEM_NUM)
            {
                this[("s" + _local_2)].enabled = _arg_1;
                _local_2++;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

