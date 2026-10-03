// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FairyItemCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.states.RemoveChild;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.core.IUITextField;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.logic.FairyLogic;
    import mx.binding.BindingManager;
    import flash.events.Event;
    import mx.binding.Binding;
    import flash.display.DisplayObject;
    import flash.utils.getDefinitionByName;
    import mx.states.State;
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

    public class FairyItemCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _102449glv:Label;
        private var _148334278useItem:ItemSlot;
        private var _100525950item1:ItemSlot;
        public var _FairyItemCanvas_RemoveChild1:RemoveChild;
        public var _FairyItemCanvas_RemoveChild2:RemoveChild;
        public var _FairyItemCanvas_RemoveChild3:RemoveChild;
        public var _FairyItemCanvas_RemoveChild4:RemoveChild;
        private var _3466lv:Label;
        private var _1289185239expNum:Label;
        private var _3519nm:Label;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var itemLimit:Object;
        private var _100525952item3:ItemSlot;
        public var _FairyItemCanvas_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3237038info:Label;
        private var _97884btn:BasicGlowButton;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _100525951item2:ItemSlot;
        private var _fairy:Object;
        private var _p:DragableCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":250,
                    "height":300,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FairyItemCanvas_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":60,
                                "x":5,
                                "width":240,
                                "height":220,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"nm",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":84,
                                            "width":89
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"lv",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":110,
                                            "width":80
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"glv",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":136,
                                            "width":80
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"info",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "y":136,
                                            "width":130
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"useItem",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":103,
                                            "y":84,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn",
                                    "events":{"click":"__btn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":122,
                                            "y":173,
                                            "styleName":"BtnNormalRed",
                                            "width":60
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"item1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "acceptable":false,
                                            "x":24,
                                            "y":19,
                                            "giid":3390
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"item2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "acceptable":false,
                                            "x":103,
                                            "y":19,
                                            "giid":3391
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"item3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "acceptable":false,
                                            "x":182,
                                            "y":19,
                                            "giid":3392
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"expNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16756247;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":12,
                                            "y":198,
                                            "width":218
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":40,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "width":45
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "width":45
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

        public function FairyItemCanvas()
        {
            mx_internal::_document = this;
            this.width = 250;
            this.height = 300;
            this.styleName = "StandardContent";
            this.states = [_FairyItemCanvas_State1_c()];
            this.addEventListener("creationComplete", ___FairyItemCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FairyItemCanvas._watcherSetupUtil = _arg_1;
        }


        public function set item3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525952item3;
            if (_local_2 !== _arg_1)
            {
                this._100525952item3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item3", _local_2, _arg_1));
            };
        }

        public function ___FairyItemCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            fairyRaise();
        }

        public function set item1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525950item1;
            if (_local_2 !== _arg_1)
            {
                this._100525950item1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item1", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            useItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, onItemChanged);
            currentState = "doh";
            item1.addEventListener(MouseEvent.CLICK, onExpItemClick);
            item2.addEventListener(MouseEvent.CLICK, onExpItemClick);
            item3.addEventListener(MouseEvent.CLICK, onExpItemClick);
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

        public function set lv(_arg_1:Label):void
        {
            var _local_2:Object = this._3466lv;
            if (_local_2 !== _arg_1)
            {
                this._3466lv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv", _local_2, _arg_1));
            };
        }

        private function onExpItemClick(_arg_1:MouseEvent):void
        {
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.stackNum > 0)
            {
                useItem.type = _local_2.type;
                useItem.giid = _local_2.giid;
                useItem.stackNum = _local_2.stackNum;
            }
            else
            {
                useItem.clean();
                _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[69]);
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

        private function fairyRaise():void
        {
            var func:Function;
            var itemIns:Object;
            var itemTemp:Object;
            var str:String;
            var _alert:Alert;
            var tf:IUITextField;
            var sidArr:Array;
            var obj:Object;
            var useSids:Array;
            var num:int;
            var i:int;
            var ins:Object;
            var temp:Object;
            if (tabBtn0.selected)
            {
                if (((useItem.slotData) && (_fairy)))
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (((!(_arg_1)) || (_arg_1.detail == Alert.YES)))
                        {
                            _core.remote.call("fairyRaise", new Responder(onFairyRaise), _fairy.id, useItem.slotData.id, 1);
                            btn.enabled = false;
                        };
                    };
                    itemIns = _core.data.getData(useItem.slotData.type, useItem.slotData.itemId);
                    itemTemp = _core.getTemplateData(useItem.slotData.type, useItem.slotData.itemId, false);
                    if ((((itemTemp) && (itemIns)) && (itemIns.color >= 3)))
                    {
                        str = Language.FAIRY_MANAGER_PANEL_U[75].replace("{name}", ToolKit.getColorTxt(GamePredef.MSG_ITEM_COLOR[itemIns.color], itemTemp.name));
                        _alert = Alert.show(Language.FAIRY_MANAGER_PANEL_U[75].replace("{name}", itemTemp.name), "", (Alert.YES | Alert.NO), null, func);
                        tf = _alert.mx_internal::alertForm.mx_internal::textField;
                        tf.htmlText = str;
                    }
                    else
                    {
                        (func(null));
                    };
                };
            }
            else
            {
                if (FairyLogic.expToLv(_fairy.exp) >= GamePredef.FAIRY_MAX_LEVEL)
                {
                    _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[41]);
                    return;
                };
                if (((useItem.stackNum > 0) && (_fairy)))
                {
                    sidArr = [];
                    for each (obj in _core.data.sList)
                    {
                        if ((((obj) && (_core.data.isBagSlot(obj.sid))) && (obj.type == GamePredef.TBL_ITEM_INSTANCE)))
                        {
                            ins = _core.data.gameData[obj.type][obj.itemId];
                            temp = _core.getTemplateData(obj.type, obj.itemId);
                            if (((temp) && (temp.id == useItem.giid)))
                            {
                                sidArr.push({
                                    "id":obj.id,
                                    "bind":ins.binded,
                                    "num":obj.stackNum
                                });
                            };
                        };
                    };
                    sidArr = sidArr.sortOn("bind", (Array.NUMERIC | Array.DESCENDING));
                    useSids = [];
                    num = 0;
                    i = 0;
                    while (i < sidArr.length)
                    {
                        num = (num + Number(sidArr[i].num));
                        useSids.push(sidArr[i].id);
                        if (num >= 1) break;
                        i = (i + 1);
                    };
                    if (num >= 1)
                    {
                        _core.remote.call("addFairyExp", new Responder(onAddFairyExp), _fairy.id, useSids, 1);
                        btn.enabled = false;
                    };
                };
            };
        }

        private function _FairyItemCanvas_RemoveChild2_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _FairyItemCanvas_RemoveChild2 = _local_1;
            BindingManager.executeBindings(this, "_FairyItemCanvas_RemoveChild2", _FairyItemCanvas_RemoveChild2);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get expNum():Label
        {
            return (this._1289185239expNum);
        }

        [Bindable(event="propertyChange")]
        public function get glv():Label
        {
            return (this._102449glv);
        }

        [Bindable(event="propertyChange")]
        public function get useItem():ItemSlot
        {
            return (this._148334278useItem);
        }

        public function hide():void
        {
            this.visible = false;
        }

        private function onMove(_arg_1:Event):void
        {
            this.x = (_p.x + _p.width);
            this.y = _p.y;
        }

        public function set expNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1289185239expNum;
            if (_local_2 !== _arg_1)
            {
                this._1289185239expNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expNum", _local_2, _arg_1));
            };
        }

        private function onFairyRaise(_arg_1:Object):void
        {
            var _local_2:String;
            btn.enabled = true;
            if (_arg_1.f)
            {
                if (_arg_1.num > 0)
                {
                    useItem.stackNum = _arg_1.num;
                }
                else
                {
                    useItem.clean();
                };
            }
            else
            {
                _local_2 = _arg_1.code;
                if (_local_2 == "full")
                {
                    _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[47]);
                }
                else
                {
                    if (_local_2 == "item")
                    {
                        _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[46]);
                    }
                    else
                    {
                        if (_local_2 == "num")
                        {
                            _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[48]);
                        }
                        else
                        {
                            _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[49]);
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn():BasicGlowButton
        {
            return (this._97884btn);
        }

        private function _FairyItemCanvas_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _FairyItemCanvas_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_FairyItemCanvas_RemoveChild1", _FairyItemCanvas_RemoveChild1);
            return (_local_1);
        }

        public function set info(_arg_1:Label):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        public function set glv(_arg_1:Label):void
        {
            var _local_2:Object = this._102449glv;
            if (_local_2 !== _arg_1)
            {
                this._102449glv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glv", _local_2, _arg_1));
            };
        }

        private function onAddFairyExp(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:String;
            btn.enabled = true;
            if (_arg_1.f)
            {
                if (_arg_1.num > 0)
                {
                    _fairy.flag["en"] = _arg_1.en;
                    expNum.text = Language.FAIRY_MANAGER_PANEL_U[73].replace("{fairy}", _fairy.name).replace("{num}", _arg_1.en);
                    if (_arg_1.en == 0)
                    {
                    };
                    useItem.stackNum = (useItem.stackNum - _arg_1.num);
                    _local_2 = 1;
                    while (_local_2 <= 3)
                    {
                        if (this[("item" + _local_2)].giid == useItem.giid)
                        {
                            this[("item" + _local_2)].stackNum = useItem.stackNum;
                        };
                        _local_2++;
                    };
                    if (useItem.stackNum <= 0)
                    {
                        useItem.clean();
                    };
                }
                else
                {
                    useItem.clean();
                };
            }
            else
            {
                _local_3 = _arg_1.code;
                if (_local_3 == "item")
                {
                    _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[46]);
                }
                else
                {
                    if (_local_3 == "num")
                    {
                        _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[48]);
                    }
                    else
                    {
                        if (_local_3 != "max")
                        {
                            if (_local_3 == "out")
                            {
                                _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[77]);
                            };
                        };
                    };
                };
            };
        }

        private function _FairyItemCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyItemCanvas_BasicTitleCanvas1.text = _arg_1;
            }, "_FairyItemCanvas_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (item1);
            }, function (_arg_1:DisplayObject):void
            {
                _FairyItemCanvas_RemoveChild1.target = _arg_1;
            }, "_FairyItemCanvas_RemoveChild1.target");
            result[1] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (item2);
            }, function (_arg_1:DisplayObject):void
            {
                _FairyItemCanvas_RemoveChild2.target = _arg_1;
            }, "_FairyItemCanvas_RemoveChild2.target");
            result[2] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (item3);
            }, function (_arg_1:DisplayObject):void
            {
                _FairyItemCanvas_RemoveChild3.target = _arg_1;
            }, "_FairyItemCanvas_RemoveChild3.target");
            result[3] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (expNum);
            }, function (_arg_1:DisplayObject):void
            {
                _FairyItemCanvas_RemoveChild4.target = _arg_1;
            }, "_FairyItemCanvas_RemoveChild4.target");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                nm.filters = _arg_1;
            }, "nm.filters");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                lv.filters = _arg_1;
            }, "lv.filters");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                glv.filters = _arg_1;
            }, "glv.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                info.filters = _arg_1;
            }, "info.filters");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                useItem.slotType = _arg_1;
            }, "useItem.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn.label = _arg_1;
            }, "btn.label");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                item1.type = _arg_1;
            }, "item1.type");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                item2.type = _arg_1;
            }, "item2.type");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                item3.type = _arg_1;
            }, "item3.type");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                expNum.filters = _arg_1;
            }, "expNum.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[16] = binding;
            return (result);
        }

        private function _FairyItemCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[42];
            _local_1 = item1;
            _local_1 = item2;
            _local_1 = item3;
            _local_1 = expNum;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[45];
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[43];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[44];
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            changeFunc(0);
        }

        public function set useItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._148334278useItem;
            if (_local_2 !== _arg_1)
            {
                this._148334278useItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useItem", _local_2, _arg_1));
            };
        }

        public function set nm(_arg_1:Label):void
        {
            var _local_2:Object = this._3519nm;
            if (_local_2 !== _arg_1)
            {
                this._3519nm = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nm", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item3():ItemSlot
        {
            return (this._100525952item3);
        }

        [Bindable(event="propertyChange")]
        public function get item2():ItemSlot
        {
            return (this._100525951item2);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get lv():Label
        {
            return (this._3466lv);
        }

        [Bindable(event="propertyChange")]
        public function get item1():ItemSlot
        {
            return (this._100525950item1);
        }

        override public function initialize():void
        {
            var target:FairyItemCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FairyItemCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FairyItemCanvasWatcherSetupUtil");
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

        private function changeFunc(_arg_1:int):void
        {
            if (_arg_1 == 0)
            {
                tabBtn0.selected = true;
                tabBtn1.selected = false;
                currentState = "doh";
                itemLimit = {"type":[601, 602, 603, 604, 605]};
                useItem.acceptable = true;
            }
            else
            {
                if (_arg_1 == 1)
                {
                    currentState = "";
                    tabBtn0.selected = false;
                    tabBtn1.selected = true;
                    itemLimit = null;
                    useItem.acceptable = false;
                    refreshExpItemNum();
                };
            };
            if (_fairy)
            {
                fairy = _fairy;
            };
            useItem.clean();
        }

        private function _FairyItemCanvas_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "doh";
            _local_1.overrides = [_FairyItemCanvas_RemoveChild1_i(), _FairyItemCanvas_RemoveChild2_i(), _FairyItemCanvas_RemoveChild3_i(), _FairyItemCanvas_RemoveChild4_i()];
            return (_local_1);
        }

        private function _FairyItemCanvas_RemoveChild4_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _FairyItemCanvas_RemoveChild4 = _local_1;
            BindingManager.executeBindings(this, "_FairyItemCanvas_RemoveChild4", _FairyItemCanvas_RemoveChild4);
            return (_local_1);
        }

        public function set fairy(_arg_1:Object):void
        {
            var _local_2:String;
            _fairy = _arg_1;
            nm.text = _fairy.name;
            if (tabBtn0.selected)
            {
                lv.text = ((Language.FAIRY_MANAGER_PANEL_U[8] + ":") + Math.round((_fairy.doh / 100)));
                glv.text = "";
                info.text = Language.FAIRY_MANAGER_PANEL_U[70];
                btn.enabled = true;
            }
            else
            {
                lv.text = ((Language.FAIRY_MANAGER_PANEL_U[30] + ":") + FairyLogic.expToLv(_fairy.exp).toString());
                glv.text = ((Language.FAIRY_MANAGER_PANEL_U[40] + ":") + FairyLogic.gexpToLv(_fairy.gexp).toString());
                info.text = Language.FAIRY_MANAGER_PANEL_U[71];
                _local_2 = "5";
                if (_fairy.flag)
                {
                    _local_2 = ((_fairy.flag["en"]) || ("0"));
                };
                expNum.text = Language.FAIRY_MANAGER_PANEL_U[73].replace("{fairy}", _fairy.name).replace("{num}", _local_2);
                btn.enabled = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get info():Label
        {
            return (this._3237038info);
        }

        public function follow(_arg_1:DragableCanvas):void
        {
            _p = _arg_1;
            this.x = (_arg_1.x + _arg_1.width);
            this.y = _arg_1.y;
            if (this.visible)
            {
                _arg_1.addEventListener(DragableCanvas.EVENT_MOVE, onMove);
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            changeFunc(1);
        }

        public function set btn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        private function onItemChanged(_arg_1:GameEvent):void
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_2:Object = useItem.slotData;
            if (_local_2)
            {
                _local_3 = _core.getTemplateData(_local_2.type, _local_2.itemId, false);
                if (_local_3)
                {
                    for (_local_4 in itemLimit)
                    {
                        if (!((_local_3[_local_4]) && (itemLimit[_local_4].indexOf(Number(_local_3[_local_4])) >= 0)))
                        {
                            _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[46]);
                            useItem.clean();
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get nm():Label
        {
            return (this._3519nm);
        }

        private function refreshExpItemNum():void
        {
            var _local_1:Object = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, 3390);
            item1.stackNum = _local_1.num;
            _local_1 = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, 3391);
            item2.stackNum = _local_1.num;
            _local_1 = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, 3392);
            item3.stackNum = _local_1.num;
        }

        private function _FairyItemCanvas_RemoveChild3_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _FairyItemCanvas_RemoveChild3 = _local_1;
            BindingManager.executeBindings(this, "_FairyItemCanvas_RemoveChild3", _FairyItemCanvas_RemoveChild3);
            return (_local_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_p)
            {
                super.visible = _arg_1;
                if (_arg_1)
                {
                    follow(_p);
                    if (this.parent)
                    {
                        this.parent.setChildIndex(this, (this.parent.numChildren - 1));
                    };
                    if (tabBtn1.selected)
                    {
                        refreshExpItemNum();
                    };
                }
                else
                {
                    _p.removeEventListener(DragableCanvas.EVENT_MOVE, onMove);
                };
            }
            else
            {
                super.visible = false;
            };
        }

        public function show():void
        {
            this.visible = (!(this.visible));
        }

        public function set item2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525951item2;
            if (_local_2 !== _arg_1)
            {
                this._100525951item2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item2", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

