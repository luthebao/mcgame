// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RuneChipBag

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import mx.containers.Tile;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
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

    public class RuneChipBag extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _RuneChipBag_Label2:Label;
        private var _109532659slot1:Slot;
        private var _899454786slot22:Slot;
        private var _109532667slot9:Slot;
        private var _899454817slot12:Slot;
        private var _chipBagData:Object;
        private var _899454813slot16:Slot;
        private var _109532664slot6:Slot;
        private var _899454787slot21:Slot;
        private var _109532661slot3:Slot;
        private var _899454783slot25:Slot;
        private var _899454810slot19:Slot;
        private var _899454814slot15:Slot;
        private var _899454818slot11:Slot;
        private var _109532666slot8:Slot;
        private var _899454788slot20:Slot;
        private var _109532663slot5:Slot;
        private var _899454784slot24:Slot;
        private var _899454819slot10:Slot;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _899454815slot14:Slot;
        private var _109532660slot2:Slot;
        private var _899454811slot18:Slot;
        public var _RuneChipBag_BasicDelayButton1:BasicDelayButton;
        private var _899454785slot23:Slot;
        private var _109532665slot7:Slot;
        private var _899454816slot13:Slot;
        private var _899454812slot17:Slot;
        public var _RuneChipBag_Label1:Label;
        private var _109532662slot4:Slot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":215,
                    "height":310,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_RuneChipBag_Label1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                            this.color = 0xFFFF00;
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":79.5,
                                "y":5
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
                                "styleName":"StandardTitle",
                                "mouseEnabled":false,
                                "y":8,
                                "width":128,
                                "mouseChildren":false,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":190,
                                "height":3,
                                "y":26,
                                "x":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_RuneChipBag_Label2",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":11,
                                "y":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Tile,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 4;
                            this.verticalGap = 6;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":190,
                                "height":200,
                                "x":10,
                                "y":52,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot12",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot13",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot14",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot15",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot16",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot17",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot18",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot19",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot20",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot21",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot22",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot23",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot24",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Slot,
                                    "id":"slot25",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "styleName":"TransparentSlot",
                                            "movable":false,
                                            "acceptable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelectorOnly,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "6";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":33,
                                "changeCall":updatePage
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"_RuneChipBag_BasicDelayButton1",
                        "events":{"click":"___RuneChipBag_BasicDelayButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "x":78.5,
                                "y":258
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

        public function RuneChipBag()
        {
            mx_internal::_document = this;
            this.width = 215;
            this.height = 310;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RuneChipBag._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get slot7():Slot
        {
            return (this._109532665slot7);
        }

        [Bindable(event="propertyChange")]
        public function get slot1():Slot
        {
            return (this._109532659slot1);
        }

        public function set slot8(_arg_1:Slot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        public function set slot4(_arg_1:Slot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot4():Slot
        {
            return (this._109532662slot4);
        }

        public function set slot7(_arg_1:Slot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
        }

        public function updateView():void
        {
            var _local_2:*;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:Slot;
            var _local_8:Object;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:int;
            var _local_13:Object;
            var _local_1:int;
            for (_local_2 in _chipBagData)
            {
                _local_1++;
            };
            _local_3 = (pageSelector.totalPage = Math.ceil((_local_1 / 25)));
            _local_4 = pageSelector.curPage;
            _local_5 = ((_local_4 - 1) * 25);
            _local_6 = 1;
            while (_local_6 <= 25)
            {
                _local_7 = (this[("slot" + _local_6)] as Slot);
                _local_8 = _chipBagData[(_local_6 + _local_5)];
                _local_7.clean();
                if (_local_8)
                {
                    _local_9 = _local_8["chipId"];
                    _local_10 = _local_8["num"];
                    _local_11 = GameData.d[GamePredef.TBL_RUNE_CHIP][_local_9];
                    _local_12 = _local_11["rid"];
                    _local_13 = GameData.d[GamePredef.TBL_DECO_RUNE][_local_12];
                    _local_7.slotData = _local_11;
                    _local_7.quality = (int(_local_13["runeTmp"]) - 1);
                    _local_7.type = GamePredef.TBL_RUNE_CHIP;
                    _local_7.giid = _local_9;
                    _local_7.stackNum = _local_10;
                };
                _local_6++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot9():Slot
        {
            return (this._109532667slot9);
        }

        public function set slot9(_arg_1:Slot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
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

        public function set slot11(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        public function set slot12(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        public function set slot13(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function set slot14(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
        }

        public function set slot15(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        public function set slot16(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        public function set slot17(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        public function set slot19(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454810slot19;
            if (_local_2 !== _arg_1)
            {
                this._899454810slot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot19", _local_2, _arg_1));
            };
        }

        public function set slot18(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454811slot18;
            if (_local_2 !== _arg_1)
            {
                this._899454811slot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot18", _local_2, _arg_1));
            };
        }

        public function set slot10(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot8():Slot
        {
            return (this._109532666slot8);
        }

        public function set slot20(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454788slot20;
            if (_local_2 !== _arg_1)
            {
                this._899454788slot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot20", _local_2, _arg_1));
            };
        }

        public function set slot22(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454786slot22;
            if (_local_2 !== _arg_1)
            {
                this._899454786slot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot22", _local_2, _arg_1));
            };
        }

        public function exchangeAll():void
        {
            _core.remote.call("exchangeRune", null);
        }

        public function set slot24(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454784slot24;
            if (_local_2 !== _arg_1)
            {
                this._899454784slot24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot24", _local_2, _arg_1));
            };
        }

        public function set slot25(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454783slot25;
            if (_local_2 !== _arg_1)
            {
                this._899454783slot25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot25", _local_2, _arg_1));
            };
        }

        public function set slot21(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454787slot21;
            if (_local_2 !== _arg_1)
            {
                this._899454787slot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot21", _local_2, _arg_1));
            };
        }

        public function set slot23(_arg_1:Slot):void
        {
            var _local_2:Object = this._899454785slot23;
            if (_local_2 !== _arg_1)
            {
                this._899454785slot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot23", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:RuneChipBag;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RuneChipBag_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RuneChipBagWatcherSetupUtil");
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
        public function get slot11():Slot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():Slot
        {
            return (this._899454817slot12);
        }

        [Bindable(event="propertyChange")]
        public function get slot14():Slot
        {
            return (this._899454815slot14);
        }

        [Bindable(event="propertyChange")]
        public function get slot15():Slot
        {
            return (this._899454814slot15);
        }

        [Bindable(event="propertyChange")]
        public function get slot17():Slot
        {
            return (this._899454812slot17);
        }

        [Bindable(event="propertyChange")]
        public function get slot18():Slot
        {
            return (this._899454811slot18);
        }

        [Bindable(event="propertyChange")]
        public function get slot19():Slot
        {
            return (this._899454810slot19);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():Slot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get slot10():Slot
        {
            return (this._899454819slot10);
        }

        private function _RuneChipBag_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DECORATE_PANEL[112];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[113];
            _local_1 = Language.DECORATE_PANEL[114];
        }

        public function ___RuneChipBag_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            exchangeAll();
        }

        [Bindable(event="propertyChange")]
        public function get slot20():Slot
        {
            return (this._899454788slot20);
        }

        [Bindable(event="propertyChange")]
        public function get slot22():Slot
        {
            return (this._899454786slot22);
        }

        [Bindable(event="propertyChange")]
        public function get slot23():Slot
        {
            return (this._899454785slot23);
        }

        [Bindable(event="propertyChange")]
        public function get slot24():Slot
        {
            return (this._899454784slot24);
        }

        [Bindable(event="propertyChange")]
        public function get slot21():Slot
        {
            return (this._899454787slot21);
        }

        [Bindable(event="propertyChange")]
        public function get slot25():Slot
        {
            return (this._899454783slot25);
        }

        public function set chipBagData(_arg_1:Object):void
        {
            _chipBagData = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get slot16():Slot
        {
            return (this._899454813slot16);
        }

        public function set slot1(_arg_1:Slot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function set slot5(_arg_1:Slot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        public function set slot2(_arg_1:Slot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set slot6(_arg_1:Slot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:Slot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        private function _RuneChipBag_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[112];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RuneChipBag_Label1.text = _arg_1;
            }, "_RuneChipBag_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _RuneChipBag_Label1.filters = _arg_1;
            }, "_RuneChipBag_Label1.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[113];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RuneChipBag_Label2.text = _arg_1;
            }, "_RuneChipBag_Label2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[114];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RuneChipBag_BasicDelayButton1.label = _arg_1;
            }, "_RuneChipBag_BasicDelayButton1.label");
            result[3] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get slot3():Slot
        {
            return (this._109532661slot3);
        }

        [Bindable(event="propertyChange")]
        public function get slot5():Slot
        {
            return (this._109532663slot5);
        }

        public function updatePage():void
        {
            updateView();
        }

        [Bindable(event="propertyChange")]
        public function get slot2():Slot
        {
            return (this._109532660slot2);
        }

        [Bindable(event="propertyChange")]
        public function get slot6():Slot
        {
            return (this._109532664slot6);
        }


    }
}//package com.qeedoo.ui.view.comp

