// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MazeLotteryPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.resource.ResManager;
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

    public class MazeLotteryPanel extends DragableCanvas implements IBindingClient 
    {

        public static const ChouJiang:Class = MazeLotteryPanel_ChouJiang;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1934594272imgBackGround1:Image;
        private var _1934594276imgBackGround5:Image;
        private var _109532659slot1:ItemSlot;
        private var _95858468drop3:Button;
        private var _1934594273imgBackGround2:Image;
        private var _109532661slot3:ItemSlot;
        private var backImg:Number = 3130090000061;
        private var _95858470drop5:Button;
        private var _1934594274imgBackGround3:Image;
        private var _95858467drop2:Button;
        private var _109532663slot5:ItemSlot;
        private var _maxDropNum:int = 4;
        private var _109532660slot2:ItemSlot;
        private var _354670409lottery:Button;
        private var _1934594275imgBackGround4:Image;
        private var _95858469drop4:Button;
        private var _dropNum:int = 0;
        public var _MazeLotteryPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _95858466drop1:Button;
        private var _433044644dropCost:RoundedLabel;
        private var _109532662slot4:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":540,
                    "height":260,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MazeLotteryPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":95,
                                "height":120,
                                "x":15,
                                "y":55,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imgBackGround1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":12,
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot1",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":35,
                                            "movable":false
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
                                "width":95,
                                "height":120,
                                "x":120,
                                "y":55,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imgBackGround2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":12,
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot2",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":35,
                                            "movable":false
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
                                "width":95,
                                "height":120,
                                "x":225,
                                "y":55,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imgBackGround3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":12,
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot3",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":35,
                                            "movable":false
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
                                "width":95,
                                "height":120,
                                "x":330,
                                "y":55,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imgBackGround4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":12,
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot4",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":35,
                                            "movable":false
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
                                "width":95,
                                "height":120,
                                "x":435,
                                "y":55,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imgBackGround5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":12,
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot5",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":35,
                                            "movable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"drop1",
                        "events":{"click":"__drop1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":40,
                                "y":180,
                                "enabled":false,
                                "x":45
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"drop2",
                        "events":{"click":"__drop2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":40,
                                "y":180,
                                "enabled":false,
                                "x":150
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"drop3",
                        "events":{"click":"__drop3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":40,
                                "y":180,
                                "enabled":false,
                                "x":0xFF
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"drop4",
                        "events":{"click":"__drop4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":40,
                                "y":180,
                                "enabled":false,
                                "x":360
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"drop5",
                        "events":{"click":"__drop5_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":40,
                                "y":180,
                                "enabled":false,
                                "x":465
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"dropCost",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":225,
                                "y":208
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"lottery",
                        "events":{"click":"__lottery_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":60,
                                "y":230,
                                "x":250
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _dropCost:Object = {};
        private var _drop:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MazeLotteryPanel()
        {
            mx_internal::_document = this;
            this.width = 540;
            this.height = 260;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___MazeLotteryPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MazeLotteryPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get slot3():ItemSlot
        {
            return (this._109532661slot3);
        }

        public function set slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        public function showPanel(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:Object;
            this.visible = true;
            if (((!(_arg_1)) || (!(_arg_1.planId))))
            {
                return;
            };
            _dropNum = 0;
            for (_local_2 in _arg_1.drop)
            {
                _dropNum++;
            };
            if (_arg_1.cost)
            {
                _dropCost = _arg_1.cost;
            };
            if (_arg_1.drop)
            {
                _drop = _arg_1.drop;
            };
            for (_local_2 in _arg_1.planId)
            {
                _local_3 = GameData.d[GamePredef.TBL_PLAN][_arg_1.planId[_local_2]];
                if (((_local_3) && (!(_arg_1.drop[_local_2]))))
                {
                    this[("slot" + _local_2)].type = _local_3.ti;
                    this[("slot" + _local_2)].giid = _local_3.ii;
                    this[("slot" + _local_2)].stackNum = _local_3.n;
                    this[("drop" + _local_2)].enabled = true;
                };
            };
            if (((_dropNum < _maxDropNum) && (_dropCost[(_dropNum + 1)])))
            {
                this["dropCost"].text = Language.MAZE_LOTTERY_PANEL_U[2].toString().replace("{num}", _dropCost[(_dropNum + 1)]);
            }
            else
            {
                this["dropCost"].text = "";
            };
            if (!_arg_1.finished)
            {
                lottery.enabled = true;
            };
        }

        public function __drop4_click(_arg_1:MouseEvent):void
        {
            drop(4);
        }

        [Bindable(event="propertyChange")]
        public function get slot4():ItemSlot
        {
            return (this._109532662slot4);
        }

        [Bindable(event="propertyChange")]
        public function get drop1():Button
        {
            return (this._95858466drop1);
        }

        [Bindable(event="propertyChange")]
        public function get drop2():Button
        {
            return (this._95858467drop2);
        }

        [Bindable(event="propertyChange")]
        public function get drop4():Button
        {
            return (this._95858469drop4);
        }

        [Bindable(event="propertyChange")]
        public function get drop5():Button
        {
            return (this._95858470drop5);
        }

        [Bindable(event="propertyChange")]
        public function get drop3():Button
        {
            return (this._95858468drop3);
        }

        public function __lottery_click(_arg_1:MouseEvent):void
        {
            getMazeLottery();
        }

        public function set drop1(_arg_1:Button):void
        {
            var _local_2:Object = this._95858466drop1;
            if (_local_2 !== _arg_1)
            {
                this._95858466drop1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "drop1", _local_2, _arg_1));
            };
        }

        public function set drop2(_arg_1:Button):void
        {
            var _local_2:Object = this._95858467drop2;
            if (_local_2 !== _arg_1)
            {
                this._95858467drop2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "drop2", _local_2, _arg_1));
            };
        }

        public function set drop3(_arg_1:Button):void
        {
            var _local_2:Object = this._95858468drop3;
            if (_local_2 !== _arg_1)
            {
                this._95858468drop3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "drop3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lottery():Button
        {
            return (this._354670409lottery);
        }

        public function __drop1_click(_arg_1:MouseEvent):void
        {
            drop(1);
        }

        public function set drop5(_arg_1:Button):void
        {
            var _local_2:Object = this._95858470drop5;
            if (_local_2 !== _arg_1)
            {
                this._95858470drop5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "drop5", _local_2, _arg_1));
            };
        }

        public function __drop5_click(_arg_1:MouseEvent):void
        {
            drop(5);
        }

        public function set drop4(_arg_1:Button):void
        {
            var _local_2:Object = this._95858469drop4;
            if (_local_2 !== _arg_1)
            {
                this._95858469drop4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "drop4", _local_2, _arg_1));
            };
        }

        public function getMazeLottery():void
        {
            _core.remote.call("getMazeLottery", new Responder(onLottery), null);
        }

        [Bindable(event="propertyChange")]
        public function get dropCost():RoundedLabel
        {
            return (this._433044644dropCost);
        }

        public function onLottery(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.index)))
            {
                this[("slot" + _arg_1.index)].giid = 0;
                this[("drop" + _arg_1.index)].enabled = false;
                this[("slot" + _arg_1.index)].reset();
            };
            lottery.enabled = false;
            this.visible = false;
        }

        public function onDrop(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.index)
            {
                this[("slot" + _arg_1.index)].giid = 0;
                this[("drop" + _arg_1.index)].enabled = false;
                this[("slot" + _arg_1.index)].reset();
            };
            if (_arg_1.dropNum)
            {
                _dropNum = _arg_1.dropNum;
            };
            if (((_dropNum < _maxDropNum) && (_dropCost[(_dropNum + 1)])))
            {
                this["dropCost"].text = Language.MAZE_LOTTERY_PANEL_U[2].toString().replace("{num}", _dropCost[(_dropNum + 1)]);
            };
        }

        public function __drop2_click(_arg_1:MouseEvent):void
        {
            drop(2);
        }

        public function set lottery(_arg_1:Button):void
        {
            var _local_2:Object = this._354670409lottery;
            if (_local_2 !== _arg_1)
            {
                this._354670409lottery = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lottery", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:MazeLotteryPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MazeLotteryPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MazeLotteryPanelWatcherSetupUtil");
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

        public function set dropCost(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._433044644dropCost;
            if (_local_2 !== _arg_1)
            {
                this._433044644dropCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropCost", _local_2, _arg_1));
            };
        }

        public function set imgBackGround1(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594272imgBackGround1;
            if (_local_2 !== _arg_1)
            {
                this._1934594272imgBackGround1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround1", _local_2, _arg_1));
            };
        }

        public function set imgBackGround2(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594273imgBackGround2;
            if (_local_2 !== _arg_1)
            {
                this._1934594273imgBackGround2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround2", _local_2, _arg_1));
            };
        }

        public function set imgBackGround3(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594274imgBackGround3;
            if (_local_2 !== _arg_1)
            {
                this._1934594274imgBackGround3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround3", _local_2, _arg_1));
            };
        }

        public function set imgBackGround4(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594275imgBackGround4;
            if (_local_2 !== _arg_1)
            {
                this._1934594275imgBackGround4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround4", _local_2, _arg_1));
            };
        }

        public function __drop3_click(_arg_1:MouseEvent):void
        {
            drop(3);
        }

        public function set imgBackGround5(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594276imgBackGround5;
            if (_local_2 !== _arg_1)
            {
                this._1934594276imgBackGround5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround1():Image
        {
            return (this._1934594272imgBackGround1);
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround2():Image
        {
            return (this._1934594273imgBackGround2);
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround3():Image
        {
            return (this._1934594274imgBackGround3);
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround4():Image
        {
            return (this._1934594275imgBackGround4);
        }

        override public function initView():void
        {
        }

        public function set slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function set slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround5():Image
        {
            return (this._1934594276imgBackGround5);
        }

        public function drop(index:int):void
        {
            var obj:* = undefined;
            if (((_dropNum >= _maxDropNum) || (!(_dropCost[(_dropNum + 1)]))))
            {
                Alert.show(Language.MAZE_LOTTERY_PANEL_U[4], "", Alert.YES, null, null);
                return;
            };
            if (_drop[index])
            {
                Alert.show(Language.MAZE_LOTTERY_PANEL_U[5], "", Alert.YES, null, null);
                return;
            };
            obj = {};
            obj.index = index;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("mazeDrop", new Responder(onDrop), obj);
                };
            };
            Alert.show(Language.MAZE_LOTTERY_PANEL_U[6].toString().replace("{num}", _dropCost[(_dropNum + 1)]), "", (Alert.YES | Alert.NO), null, func);
        }

        private function _MazeLotteryPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_LOTTERY_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeLotteryPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MazeLotteryPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(backImg)));
            }, function (_arg_1:Object):void
            {
                imgBackGround1.source = _arg_1;
            }, "imgBackGround1.source");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                slot1.type = _arg_1;
            }, "slot1.type");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(backImg)));
            }, function (_arg_1:Object):void
            {
                imgBackGround2.source = _arg_1;
            }, "imgBackGround2.source");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                slot2.type = _arg_1;
            }, "slot2.type");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(backImg)));
            }, function (_arg_1:Object):void
            {
                imgBackGround3.source = _arg_1;
            }, "imgBackGround3.source");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                slot3.type = _arg_1;
            }, "slot3.type");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(backImg)));
            }, function (_arg_1:Object):void
            {
                imgBackGround4.source = _arg_1;
            }, "imgBackGround4.source");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                slot4.type = _arg_1;
            }, "slot4.type");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(backImg)));
            }, function (_arg_1:Object):void
            {
                imgBackGround5.source = _arg_1;
            }, "imgBackGround5.source");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                slot5.type = _arg_1;
            }, "slot5.type");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_LOTTERY_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                drop1.label = _arg_1;
            }, "drop1.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_LOTTERY_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                drop2.label = _arg_1;
            }, "drop2.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_LOTTERY_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                drop3.label = _arg_1;
            }, "drop3.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_LOTTERY_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                drop4.label = _arg_1;
            }, "drop4.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_LOTTERY_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                drop5.label = _arg_1;
            }, "drop5.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_LOTTERY_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dropCost.text = _arg_1;
            }, "dropCost.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_LOTTERY_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lottery.label = _arg_1;
            }, "lottery.label");
            result[17] = binding;
            return (result);
        }

        public function ___MazeLotteryPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get slot1():ItemSlot
        {
            return (this._109532659slot1);
        }

        [Bindable(event="propertyChange")]
        public function get slot2():ItemSlot
        {
            return (this._109532660slot2);
        }

        public function set slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot5():ItemSlot
        {
            return (this._109532663slot5);
        }

        private function _MazeLotteryPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAZE_LOTTERY_PANEL_U[0];
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(backImg));
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(backImg));
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(backImg));
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(backImg));
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(backImg));
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = Language.MAZE_LOTTERY_PANEL_U[1];
            _local_1 = Language.MAZE_LOTTERY_PANEL_U[1];
            _local_1 = Language.MAZE_LOTTERY_PANEL_U[1];
            _local_1 = Language.MAZE_LOTTERY_PANEL_U[1];
            _local_1 = Language.MAZE_LOTTERY_PANEL_U[1];
            _local_1 = Language.MAZE_LOTTERY_PANEL_U[2];
            _local_1 = Language.MAZE_LOTTERY_PANEL_U[3];
        }


    }
}//package com.qeedoo.ui.view.compDragable

