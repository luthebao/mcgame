// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PetStoneBag

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
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

    public class PetStoneBag extends Canvas implements IBindingClient 
    {

        private static const PAGE_NUM:uint = 20;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _109532662slot4:PetStoneSlot;
        private var _899454816slot13:PetStoneSlot;
        private var _109532659slot1:PetStoneSlot;
        private var _109532667slot9:PetStoneSlot;
        private var _899454817slot12:PetStoneSlot;
        private var _899454813slot16:PetStoneSlot;
        private var _109532664slot6:PetStoneSlot;
        private var _109532661slot3:PetStoneSlot;
        private var _899454818slot11:PetStoneSlot;
        private var _899454814slot15:PetStoneSlot;
        private var _899454810slot19:PetStoneSlot;
        private var _totalPage:int;
        private var _109532666slot8:PetStoneSlot;
        private var _bagData:Array;
        private var _899454788slot20:PetStoneSlot;
        private var _109532663slot5:PetStoneSlot;
        private var _899454819slot10:PetStoneSlot;
        private var _899454815slot14:PetStoneSlot;
        private var _curPage:int = 1;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _899454811slot18:PetStoneSlot;
        private var _109532660slot2:PetStoneSlot;
        private var _109532665slot7:PetStoneSlot;
        private var _899454812slot17:PetStoneSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":160,
                    "height":235,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":84,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":122,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":48
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot6",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":48
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot7",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":84,
                                "y":48
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot8",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":122,
                                "y":48
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot9",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":86
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot10",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":86
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot11",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":84,
                                "y":86
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot12",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":122,
                                "y":86
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot13",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":124
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot14",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":124
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot15",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":84,
                                "y":124
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot16",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":122,
                                "y":124
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot17",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":162
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot18",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":162
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot19",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":84,
                                "y":162
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneSlot,
                        "id":"slot20",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":122,
                                "y":162
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelectorOnly,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":205,
                                "changeCall":updatePage
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetStoneBag()
        {
            mx_internal::_document = this;
            this.width = 160;
            this.height = 235;
            this.styleName = "CanvasBorder";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetStoneBag._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get slot9():PetStoneSlot
        {
            return (this._109532667slot9);
        }

        public function set slot8(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot8():PetStoneSlot
        {
            return (this._109532666slot8);
        }

        public function set slot9(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
        }

        private function _PetStoneBag_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot3.slotType = _arg_1;
            }, "slot3.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot4.slotType = _arg_1;
            }, "slot4.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot5.slotType = _arg_1;
            }, "slot5.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot6.slotType = _arg_1;
            }, "slot6.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot7.slotType = _arg_1;
            }, "slot7.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot8.slotType = _arg_1;
            }, "slot8.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot9.slotType = _arg_1;
            }, "slot9.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot10.slotType = _arg_1;
            }, "slot10.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot11.slotType = _arg_1;
            }, "slot11.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot12.slotType = _arg_1;
            }, "slot12.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot13.slotType = _arg_1;
            }, "slot13.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot14.slotType = _arg_1;
            }, "slot14.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot15.slotType = _arg_1;
            }, "slot15.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot16.slotType = _arg_1;
            }, "slot16.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot17.slotType = _arg_1;
            }, "slot17.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot18.slotType = _arg_1;
            }, "slot18.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot19.slotType = _arg_1;
            }, "slot19.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_BAG);
            }, function (_arg_1:int):void
            {
                slot20.slotType = _arg_1;
            }, "slot20.slotType");
            result[19] = binding;
            return (result);
        }

        public function set pageSelector(_arg_1:PageSelectorOnly):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        public function set slot11(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        public function set slot12(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        public function set slot13(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function set slot14(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
        }

        public function set slot15(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        public function set slot17(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        public function set slot10(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        public function set slot19(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454810slot19;
            if (_local_2 !== _arg_1)
            {
                this._899454810slot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot19", _local_2, _arg_1));
            };
        }

        public function set slot16(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        public function set slot18(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454811slot18;
            if (_local_2 !== _arg_1)
            {
                this._899454811slot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot18", _local_2, _arg_1));
            };
        }

        public function set slot20(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._899454788slot20;
            if (_local_2 !== _arg_1)
            {
                this._899454788slot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot20", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        private function _PetStoneBag_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
            _local_1 = Slot.SLOT_PET_STONE_BAG;
        }

        override public function initialize():void
        {
            var target:PetStoneBag;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetStoneBag_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PetStoneBagWatcherSetupUtil");
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
        public function get slot11():PetStoneSlot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():PetStoneSlot
        {
            return (this._899454817slot12);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():PetStoneSlot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get slot14():PetStoneSlot
        {
            return (this._899454815slot14);
        }

        [Bindable(event="propertyChange")]
        public function get slot15():PetStoneSlot
        {
            return (this._899454814slot15);
        }

        [Bindable(event="propertyChange")]
        public function get slot10():PetStoneSlot
        {
            return (this._899454819slot10);
        }

        [Bindable(event="propertyChange")]
        public function get slot18():PetStoneSlot
        {
            return (this._899454811slot18);
        }

        [Bindable(event="propertyChange")]
        public function get slot19():PetStoneSlot
        {
            return (this._899454810slot19);
        }

        [Bindable(event="propertyChange")]
        public function get slot17():PetStoneSlot
        {
            return (this._899454812slot17);
        }

        [Bindable(event="propertyChange")]
        public function get slot16():PetStoneSlot
        {
            return (this._899454813slot16);
        }

        [Bindable(event="propertyChange")]
        public function get slot20():PetStoneSlot
        {
            return (this._899454788slot20);
        }

        public function set slot1(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        public function set slot4(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }

        public function set slot5(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        public function set slot2(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set slot6(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        public function set slot7(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1():PetStoneSlot
        {
            return (this._109532659slot1);
        }

        [Bindable(event="propertyChange")]
        public function get slot2():PetStoneSlot
        {
            return (this._109532660slot2);
        }

        [Bindable(event="propertyChange")]
        public function get slot3():PetStoneSlot
        {
            return (this._109532661slot3);
        }

        [Bindable(event="propertyChange")]
        public function get slot4():PetStoneSlot
        {
            return (this._109532662slot4);
        }

        [Bindable(event="propertyChange")]
        public function get slot5():PetStoneSlot
        {
            return (this._109532663slot5);
        }

        [Bindable(event="propertyChange")]
        public function get slot6():PetStoneSlot
        {
            return (this._109532664slot6);
        }

        [Bindable(event="propertyChange")]
        public function get slot7():PetStoneSlot
        {
            return (this._109532665slot7);
        }

        public function updatePage(_arg_1:Array=null):void
        {
            var _local_3:Number;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:PetStoneSlot;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Object;
            var _local_2:* = 0;
            if (_arg_1)
            {
                _bagData = _arg_1;
            };
            if (_bagData)
            {
                for (_local_5 in _bagData)
                {
                    _local_2++;
                };
            };
            _totalPage = (pageSelector.totalPage = Math.ceil((_local_2 / PAGE_NUM)));
            _curPage = pageSelector.curPage;
            _local_3 = ((_curPage - 1) * PAGE_NUM);
            _local_4 = 0;
            while (_local_4 < PAGE_NUM)
            {
                _local_6 = (this[("slot" + (_local_4 + 1))] as PetStoneSlot);
                _local_6.clean();
                if (_bagData[(_local_3 + _local_4)])
                {
                    _local_7 = _bagData[(_local_3 + _local_4)][0];
                    _local_8 = _bagData[(_local_3 + _local_4)][1];
                    _local_9 = _bagData[(_local_3 + _local_4)][2];
                    _local_10 = GameData.d[GamePredef.TBL_PET_STONE][_local_7];
                    _local_6.type = GamePredef.TBL_PET_STONE;
                    _local_6.quality = (Number(_local_10["level"]) - 1);
                    _local_6.giid = _local_7;
                    _local_6.slotData = _local_10;
                    _local_6.stackNum = _local_8;
                    _local_6.sid = (_local_3 + _local_4);
                    _local_6.skillId = _local_9;
                };
                _local_4++;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

