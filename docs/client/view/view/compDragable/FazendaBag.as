// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.FazendaBag

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.Button;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.event.GameEvent;
    import mx.events.FlexEvent;
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

    public class FazendaBag extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _899454816slot13:ItemSlot;
        private var _1424273442nextPage:Button;
        private var _109532659slot1:ItemSlot;
        private var _109532667slot9:ItemSlot;
        private var _maxNumOfBagIndex:int = 0;
        private var _899454817slot12:ItemSlot;
        private var _133022078firstTile:Tile;
        private var _109532664slot6:ItemSlot;
        private var _109532661slot3:ItemSlot;
        private var _899454818slot11:ItemSlot;
        private var _899454814slot15:ItemSlot;
        private var _109532658slot0:ItemSlot;
        private var _109532666slot8:ItemSlot;
        private var _2050561200bagtitle:BasicTitleCanvas;
        private var _109532663slot5:ItemSlot;
        private var _899454815slot14:ItemSlot;
        private var _899454819slot10:ItemSlot;
        private var _109532660slot2:ItemSlot;
        public var _FazendaBag_Label1:Label;
        private var _109532665slot7:ItemSlot;
        public var _FazendaBag_Button2:Button;
        private var _bagIdOffset:int = 0;
        private var _109532662slot4:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "height":260,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"bagtitle",
                        "events":{"creationComplete":"__bagtitle_creationComplete"}
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":163,
                                "height":153,
                                "y":40,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Tile,
                                    "id":"firstTile",
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalGap = 4;
                                        this.horizontalGap = 4;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":6,
                                            "y":1,
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "styleName":"TileBagItem",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot0"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot1"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot2"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot3"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot4"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot5"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot6"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot7"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot8"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot9"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot10"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot11"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot12"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot13"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot14"
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"slot15"
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"nextPage",
                        "events":{"click":"__nextPage_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "x":120,
                                "y":200
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_FazendaBag_Button2",
                        "events":{"click":"___FazendaBag_Button2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "x":25,
                                "y":200
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_FazendaBag_Label1",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":230});
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

        public function FazendaBag()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 200;
            this.height = 260;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FazendaBag._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get slot9():ItemSlot
        {
            return (this._109532667slot9);
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
        public function get slot8():ItemSlot
        {
            return (this._109532666slot8);
        }

        public function __nextPage_click(_arg_1:MouseEvent):void
        {
            toOtherPage();
        }

        public function set slot8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        private function updateView():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:Object;
            var _local_5:Object;
            if (!_core.player)
            {
                return;
            };
            var _local_1:Object = _core.player.farmBag;
            if (_local_1)
            {
                if (_maxNumOfBagIndex > 15)
                {
                    nextPage.visible = true;
                }
                else
                {
                    _bagIdOffset = 0;
                    nextPage.visible = false;
                };
                _local_2 = 0;
                while (_local_2 < 16)
                {
                    _local_3 = (_local_2 + _bagIdOffset);
                    if (_local_1[_local_3])
                    {
                        _local_4 = new Object();
                        _local_4.ti = GamePredef.TBL_ITEM_TEMPLATE;
                        _local_4.ii = _local_1[_local_3].tid;
                        _local_4.n = _local_1[_local_3].num;
                        _local_4.q = _local_1[_local_3].c;
                        _local_4.b = 1;
                        _local_4.bid = _local_3;
                        _local_5 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1[_local_3].tid];
                        if (_local_5)
                        {
                            this[("slot" + _local_2)].slotData = _local_4;
                            this[("slot" + _local_2)].type = GamePredef.TBL_ITEM_TEMPLATE;
                            this[("slot" + _local_2)].giid = _local_1[_local_3].tid;
                            this[("slot" + _local_2)].stackNum = _local_1[_local_3].num;
                        };
                    }
                    else
                    {
                        this[("slot" + _local_2)].clean();
                    };
                    _local_2++;
                };
            }
            else
            {
                clearView();
                _core.remote.call("getFarmBag", new Responder(onGetFarmBag));
            };
        }

        private function init():void
        {
            _core.remote.call("getFarmBag", new Responder(onGetFarmBag));
            var _local_1:int;
            while (_local_1 < 16)
            {
                this[("slot" + _local_1)].addEventListener(Slot.EVENT_SLOT_DCLICK, onSlotDClick);
                _local_1++;
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((initialized) && (_arg_1)))
            {
                updateView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot4():ItemSlot
        {
            return (this._109532662slot4);
        }

        private function _FazendaBag_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDABAG_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bagtitle.text = _arg_1;
            }, "bagtitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot0.slotType = _arg_1;
            }, "slot0.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot3.slotType = _arg_1;
            }, "slot3.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot4.slotType = _arg_1;
            }, "slot4.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot5.slotType = _arg_1;
            }, "slot5.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot6.slotType = _arg_1;
            }, "slot6.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot7.slotType = _arg_1;
            }, "slot7.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot8.slotType = _arg_1;
            }, "slot8.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot9.slotType = _arg_1;
            }, "slot9.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot10.slotType = _arg_1;
            }, "slot10.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot11.slotType = _arg_1;
            }, "slot11.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot12.slotType = _arg_1;
            }, "slot12.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot13.slotType = _arg_1;
            }, "slot13.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot14.slotType = _arg_1;
            }, "slot14.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FARM_BAG);
            }, function (_arg_1:int):void
            {
                slot15.slotType = _arg_1;
            }, "slot15.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDABAG_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nextPage.label = _arg_1;
            }, "nextPage.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDABAG_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FazendaBag_Button2.label = _arg_1;
            }, "_FazendaBag_Button2.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDABAG_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FazendaBag_Label1.text = _arg_1;
            }, "_FazendaBag_Label1.text");
            result[19] = binding;
            return (result);
        }

        public function set slot7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
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

        [Bindable(event="propertyChange")]
        public function get nextPage():Button
        {
            return (this._1424273442nextPage);
        }

        public function set slot9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
        }

        public function set slot10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        public function set slot11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        public function set slot12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        public function set slot13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function set slot14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
        }

        private function findMaxIndexOfBag():void
        {
            var _local_1:String;
            _maxNumOfBagIndex = 0;
            for (_local_1 in _core.player.farmBag)
            {
                if (Number(_local_1) > _maxNumOfBagIndex)
                {
                    _maxNumOfBagIndex = Number(_local_1);
                };
            };
        }

        public function set nextPage(_arg_1:Button):void
        {
            var _local_2:Object = this._1424273442nextPage;
            if (_local_2 !== _arg_1)
            {
                this._1424273442nextPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextPage", _local_2, _arg_1));
            };
        }

        public function ___FazendaBag_Button2_click(_arg_1:MouseEvent):void
        {
            _core.remote.getFarmBagAll();
        }

        [Bindable(event="propertyChange")]
        public function get bagtitle():BasicTitleCanvas
        {
            return (this._2050561200bagtitle);
        }

        public function set slot15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        private function onSlotDClick(_arg_1:GameEvent):void
        {
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.slotData)
            {
                _core.remote.call("getFromFarmBag", null, _local_2.slotData.bid, -1);
            };
        }

        public function __bagtitle_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get firstTile():Tile
        {
            return (this._133022078firstTile);
        }

        private function toOtherPage():void
        {
            if ((_bagIdOffset + 16) > _maxNumOfBagIndex)
            {
                _bagIdOffset = 0;
            }
            else
            {
                _bagIdOffset = (_bagIdOffset + 16);
            };
            updateView();
        }

        private function clearView():void
        {
            var _local_1:int;
            while (_local_1 < 16)
            {
                this[("slot" + _local_1)].clean();
                _local_1++;
            };
        }

        override public function initialize():void
        {
            var target:FazendaBag;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FazendaBag_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_FazendaBagWatcherSetupUtil");
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
        public function get slot11():ItemSlot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():ItemSlot
        {
            return (this._899454817slot12);
        }

        public function set bagtitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._2050561200bagtitle;
            if (_local_2 !== _arg_1)
            {
                this._2050561200bagtitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagtitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot14():ItemSlot
        {
            return (this._899454815slot14);
        }

        [Bindable(event="propertyChange")]
        public function get slot15():ItemSlot
        {
            return (this._899454814slot15);
        }

        [Bindable(event="propertyChange")]
        public function get slot10():ItemSlot
        {
            return (this._899454819slot10);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():ItemSlot
        {
            return (this._899454816slot13);
        }

        private function _FazendaBag_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAZENDABAG_U[0];
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Slot.SLOT_FARM_BAG;
            _local_1 = Language.FAZENDABAG_U[3];
            _local_1 = Language.FAZENDABAG_U[2];
            _local_1 = Language.FAZENDABAG_U[1];
        }

        public function onUpFarmBag(_arg_1:Object):void
        {
            var _local_3:String;
            var _local_2:Object = _core.player.farmBag;
            if (_local_2)
            {
                for (_local_3 in _arg_1)
                {
                    if (_arg_1[_local_3] == null)
                    {
                        delete _local_2[_local_3];
                        if (Number(_local_3) == _maxNumOfBagIndex)
                        {
                            findMaxIndexOfBag();
                        };
                    }
                    else
                    {
                        if (Number(_local_3) > _maxNumOfBagIndex)
                        {
                            _maxNumOfBagIndex = Number(_local_3);
                        };
                        _local_2[_local_3] = _arg_1[_local_3];
                    };
                };
                updateView();
            };
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

        public function set slot0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532658slot0;
            if (_local_2 !== _arg_1)
            {
                this._109532658slot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0", _local_2, _arg_1));
            };
        }

        public function set slot6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot0():ItemSlot
        {
            return (this._109532658slot0);
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

        [Bindable(event="propertyChange")]
        public function get slot3():ItemSlot
        {
            return (this._109532661slot3);
        }

        [Bindable(event="propertyChange")]
        public function get slot6():ItemSlot
        {
            return (this._109532664slot6);
        }

        [Bindable(event="propertyChange")]
        public function get slot7():ItemSlot
        {
            return (this._109532665slot7);
        }

        public function onGetFarmBag(_arg_1:Object):void
        {
            _core.player.farmBag = _arg_1;
            findMaxIndexOfBag();
            updateView();
        }

        public function set firstTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._133022078firstTile;
            if (_local_2 !== _arg_1)
            {
                this._133022078firstTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "firstTile", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot5():ItemSlot
        {
            return (this._109532663slot5);
        }


    }
}//package com.qeedoo.ui.view.compDragable

