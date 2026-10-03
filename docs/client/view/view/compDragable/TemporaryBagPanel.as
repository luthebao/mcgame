// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TemporaryBagPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.DescriptionLabel;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.event.GameEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
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

    public class TemporaryBagPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public const SLOT_NUM:int = 30;
        private var _899454779slot29:ItemSlot;
        private var _109532659slot1:ItemSlot;
        private var _899454782slot26:ItemSlot;
        private var _109532667slot9:ItemSlot;
        private var _899454786slot22:ItemSlot;
        private var _899454817slot12:ItemSlot;
        private var _899454813slot16:ItemSlot;
        private var _133022078firstTile:Tile;
        private var _109532664slot6:ItemSlot;
        private var _899454783slot25:ItemSlot;
        private var _109532661slot3:ItemSlot;
        private var _899454787slot21:ItemSlot;
        private var _899454814slot15:ItemSlot;
        public var _TemporaryBagPanel_DescriptionLabel1:DescriptionLabel;
        private var _899454810slot19:ItemSlot;
        private var _1249367445getAll:BasicGlowButton;
        private var _899454818slot11:ItemSlot;
        private var _changed:Boolean = false;
        private var _109532666slot8:ItemSlot;
        private var _2050561200bagtitle:BasicTitleCanvas;
        private var _899454788slot20:ItemSlot;
        private var _109532663slot5:ItemSlot;
        private var _899454819slot10:ItemSlot;
        private var _899454784slot24:ItemSlot;
        private var _899454811slot18:ItemSlot;
        private var _899454780slot28:ItemSlot;
        private var _899454815slot14:ItemSlot;
        private var _109532660slot2:ItemSlot;
        private var _899454785slot23:ItemSlot;
        private var _899454757slot30:ItemSlot;
        private var _109532665slot7:ItemSlot;
        private var _899454781slot27:ItemSlot;
        private var _899454816slot13:ItemSlot;
        private var _899454812slot17:ItemSlot;
        private var _109532662slot4:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":258,
                    "height":290,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"bagtitle"
                    }), new UIComponentDescriptor({
                        "type":Tile,
                        "id":"firstTile",
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 4;
                            this.horizontalGap = 4;
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":228,
                                "height":193,
                                "direction":"horizontal",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "styleName":"TileBagItem",
                                "y":39,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1101,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1102,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1103,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1104,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1105,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1106,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1107,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1108,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1109,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1110,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1111,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot12",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1112,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot13",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1113,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot14",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1114,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot15",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1115,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot16",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1116,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot17",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1117,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot18",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1118,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot19",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1119,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot20",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1120,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot21",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1121,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot22",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1122,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot23",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1123,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot24",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1124,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot25",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1125,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot26",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1126,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot27",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1127,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot28",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1128,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot29",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1129,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot30",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":1130,
                                            "movable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"getAll",
                        "events":{"click":"__getAll_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "30";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnStdRed"});
                        }
                    }), new UIComponentDescriptor({
                        "type":DescriptionLabel,
                        "id":"_TemporaryBagPanel_DescriptionLabel1",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "5";
                            this.horizontalCenter = "0";
                        }
                    })]
                });
            }
        });
        private var itemAC:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TemporaryBagPanel()
        {
            mx_internal::_document = this;
            this.width = 258;
            this.height = 290;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TemporaryBagPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get slot7():ItemSlot
        {
            return (this._109532665slot7);
        }

        [Bindable(event="propertyChange")]
        public function get slot9():ItemSlot
        {
            return (this._109532667slot9);
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
        public function get slot4():ItemSlot
        {
            return (this._109532662slot4);
        }

        [Bindable(event="propertyChange")]
        public function get slot8():ItemSlot
        {
            return (this._109532666slot8);
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

        public function set slot8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
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

        private function addSlotListener():void
        {
            var _local_1:int = 1;
            while (_local_1 < SLOT_NUM)
            {
                if (this[("slot" + _local_1)])
                {
                    this[("slot" + _local_1)].addEventListener(Slot.EVENT_SLOT_DCLICK, dClickHandler);
                };
                _local_1++;
            };
        }

        private function dClickHandler(_arg_1:GameEvent):void
        {
            var _local_3:int;
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.slotData)
            {
                _local_3 = (_local_2.index - 1101);
                _core.remote.call("addSingleItemToBag", null, _local_3);
            };
        }

        private function addAllToBag():void
        {
            _core.remote.call("addAllToBag", null);
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

        public function set slot15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        public function set slot17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        public function set slot19(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454810slot19;
            if (_local_2 !== _arg_1)
            {
                this._899454810slot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot19", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bagtitle():BasicTitleCanvas
        {
            return (this._2050561200bagtitle);
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

        public function set slot18(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454811slot18;
            if (_local_2 !== _arg_1)
            {
                this._899454811slot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot18", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get getAll():BasicGlowButton
        {
            return (this._1249367445getAll);
        }

        private function removeSlotListener():void
        {
            var _local_1:int = 1;
            while (_local_1 < SLOT_NUM)
            {
                if (this[("slot" + _local_1)])
                {
                    this[("slot" + _local_1)].removeEventListener(Slot.EVENT_SLOT_DCLICK, dClickHandler);
                };
                _local_1++;
            };
        }

        public function set slot20(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454788slot20;
            if (_local_2 !== _arg_1)
            {
                this._899454788slot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot20", _local_2, _arg_1));
            };
        }

        public function set slot16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        public function set slot24(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454784slot24;
            if (_local_2 !== _arg_1)
            {
                this._899454784slot24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot24", _local_2, _arg_1));
            };
        }

        public function set slot25(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454783slot25;
            if (_local_2 !== _arg_1)
            {
                this._899454783slot25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot25", _local_2, _arg_1));
            };
        }

        public function set slot22(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454786slot22;
            if (_local_2 !== _arg_1)
            {
                this._899454786slot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot22", _local_2, _arg_1));
            };
        }

        public function set slot26(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454782slot26;
            if (_local_2 !== _arg_1)
            {
                this._899454782slot26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot26", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get firstTile():Tile
        {
            return (this._133022078firstTile);
        }

        public function set slot27(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454781slot27;
            if (_local_2 !== _arg_1)
            {
                this._899454781slot27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot27", _local_2, _arg_1));
            };
        }

        public function set slot28(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454780slot28;
            if (_local_2 !== _arg_1)
            {
                this._899454780slot28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot28", _local_2, _arg_1));
            };
        }

        public function set slot21(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454787slot21;
            if (_local_2 !== _arg_1)
            {
                this._899454787slot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot21", _local_2, _arg_1));
            };
        }

        public function set slot23(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454785slot23;
            if (_local_2 !== _arg_1)
            {
                this._899454785slot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot23", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:TemporaryBagPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TemporaryBagPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TemporaryBagPanelWatcherSetupUtil");
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

        private function _TemporaryBagPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TEMPORARYBAGPANEL_U[0];
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Slot.SLOT_TEMPORARY_BAG;
            _local_1 = Language.TEMPORARYBAGPANEL_U[1];
            _local_1 = Language.TEMPORARYBAGPANEL_U[2];
        }

        public function __getAll_click(_arg_1:MouseEvent):void
        {
            addAllToBag();
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

        public function set itemList(_arg_1:ArrayCollection):void
        {
            itemAC = _arg_1;
            if (this.visible)
            {
                updateSlotList();
            }
            else
            {
                _changed = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot10():ItemSlot
        {
            return (this._899454819slot10);
        }

        [Bindable(event="propertyChange")]
        public function get slot19():ItemSlot
        {
            return (this._899454810slot19);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():ItemSlot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get slot15():ItemSlot
        {
            return (this._899454814slot15);
        }

        [Bindable(event="propertyChange")]
        public function get slot17():ItemSlot
        {
            return (this._899454812slot17);
        }

        private function updateSlotList():void
        {
            var _local_1:int;
            var _local_2:Object;
            _local_1 = 0;
            while (_local_1 < itemAC.length)
            {
                this[("slot" + (_local_1 + 1))].type = itemAC[_local_1].ti;
                this[("slot" + (_local_1 + 1))].giid = itemAC[_local_1].ii;
                this[("slot" + (_local_1 + 1))].stackNum = itemAC[_local_1].n;
                this[("slot" + (_local_1 + 1))].quality = itemAC[_local_1].q;
                this[("slot" + (_local_1 + 1))].slotData = itemAC[_local_1];
                _local_2 = _core.getTemplateData(itemAC[_local_1].ti, itemAC[_local_1].ii);
                if (_local_2)
                {
                    if (_local_2.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
                    {
                        if (_local_2.type == GamePredef.ITEM_TYPE_MAIN_MAGICWEAPON)
                        {
                            if (itemAC[_local_1].q > 8)
                            {
                                itemAC[_local_1].q = 8;
                            };
                        }
                        else
                        {
                            itemAC[_local_1].q = 0;
                        };
                    }
                    else
                    {
                        this[("slot" + (_local_1 + 1))].setStyleName(_core.basic.getColorByQuality(itemAC[_local_1].q));
                    };
                };
                _local_1++;
            };
            while (_local_1 < SLOT_NUM)
            {
                this[("slot" + (_local_1 + 1))].clean();
                _local_1++;
            };
        }

        public function set slot30(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454757slot30;
            if (_local_2 !== _arg_1)
            {
                this._899454757slot30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot30", _local_2, _arg_1));
            };
        }

        public function set slot29(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454779slot29;
            if (_local_2 !== _arg_1)
            {
                this._899454779slot29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot29", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot20():ItemSlot
        {
            return (this._899454788slot20);
        }

        private function _TemporaryBagPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMPORARYBAGPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bagtitle.text = _arg_1;
            }, "bagtitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot3.slotType = _arg_1;
            }, "slot3.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot4.slotType = _arg_1;
            }, "slot4.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot5.slotType = _arg_1;
            }, "slot5.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot6.slotType = _arg_1;
            }, "slot6.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot7.slotType = _arg_1;
            }, "slot7.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot8.slotType = _arg_1;
            }, "slot8.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot9.slotType = _arg_1;
            }, "slot9.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot10.slotType = _arg_1;
            }, "slot10.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot11.slotType = _arg_1;
            }, "slot11.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot12.slotType = _arg_1;
            }, "slot12.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot13.slotType = _arg_1;
            }, "slot13.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot14.slotType = _arg_1;
            }, "slot14.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot15.slotType = _arg_1;
            }, "slot15.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot16.slotType = _arg_1;
            }, "slot16.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot17.slotType = _arg_1;
            }, "slot17.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot18.slotType = _arg_1;
            }, "slot18.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot19.slotType = _arg_1;
            }, "slot19.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot20.slotType = _arg_1;
            }, "slot20.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot21.slotType = _arg_1;
            }, "slot21.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot22.slotType = _arg_1;
            }, "slot22.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot23.slotType = _arg_1;
            }, "slot23.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot24.slotType = _arg_1;
            }, "slot24.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot25.slotType = _arg_1;
            }, "slot25.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot26.slotType = _arg_1;
            }, "slot26.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot27.slotType = _arg_1;
            }, "slot27.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot28.slotType = _arg_1;
            }, "slot28.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot29.slotType = _arg_1;
            }, "slot29.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMPORARY_BAG);
            }, function (_arg_1:int):void
            {
                slot30.slotType = _arg_1;
            }, "slot30.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMPORARYBAGPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getAll.label = _arg_1;
            }, "getAll.label");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMPORARYBAGPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TemporaryBagPanel_DescriptionLabel1.text = _arg_1;
            }, "_TemporaryBagPanel_DescriptionLabel1.text");
            result[32] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get slot23():ItemSlot
        {
            return (this._899454785slot23);
        }

        [Bindable(event="propertyChange")]
        public function get slot24():ItemSlot
        {
            return (this._899454784slot24);
        }

        [Bindable(event="propertyChange")]
        public function get slot26():ItemSlot
        {
            return (this._899454782slot26);
        }

        [Bindable(event="propertyChange")]
        public function get slot27():ItemSlot
        {
            return (this._899454781slot27);
        }

        [Bindable(event="propertyChange")]
        public function get slot21():ItemSlot
        {
            return (this._899454787slot21);
        }

        [Bindable(event="propertyChange")]
        public function get slot16():ItemSlot
        {
            return (this._899454813slot16);
        }

        [Bindable(event="propertyChange")]
        public function get slot18():ItemSlot
        {
            return (this._899454811slot18);
        }

        [Bindable(event="propertyChange")]
        public function get slot25():ItemSlot
        {
            return (this._899454783slot25);
        }

        [Bindable(event="propertyChange")]
        public function get slot28():ItemSlot
        {
            return (this._899454780slot28);
        }

        [Bindable(event="propertyChange")]
        public function get slot29():ItemSlot
        {
            return (this._899454779slot29);
        }

        public function set getAll(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1249367445getAll;
            if (_local_2 !== _arg_1)
            {
                this._1249367445getAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getAll", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot30():ItemSlot
        {
            return (this._899454757slot30);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (visible)
            {
                addSlotListener();
                if (_changed)
                {
                    updateSlotList();
                    _changed = false;
                };
            }
            else
            {
                removeSlotListener();
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

        public function set slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
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
        public function get slot22():ItemSlot
        {
            return (this._899454786slot22);
        }

        [Bindable(event="propertyChange")]
        public function get slot6():ItemSlot
        {
            return (this._109532664slot6);
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


    }
}//package com.qeedoo.ui.view.compDragable

