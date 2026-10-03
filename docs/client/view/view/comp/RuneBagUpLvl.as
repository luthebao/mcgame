// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RuneBagUpLvl

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Tile;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.net.Responder;
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

    public class RuneBagUpLvl extends SimpleCanvas implements IBindingClient 
    {

        public static const RUNE_CHAR_BAG:uint = 0;
        public static const RUNE_PET_BAG:uint = 1;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _109532666slot8:RuneSlot;
        private var _109532659slot1:RuneSlot;
        private var _runeBagType:uint;
        private var _109532663slot5:RuneSlot;
        private var _899454819slot10:RuneSlot;
        private var _899454815slot14:RuneSlot;
        private var _109532667slot9:RuneSlot;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _899454817slot12:RuneSlot;
        public var _RuneBagUpLvl_BasicDelayButton1:BasicDelayButton;
        private var _109532664slot6:RuneSlot;
        private var _109532660slot2:RuneSlot;
        private var _109532661slot3:RuneSlot;
        private var _899454818slot11:RuneSlot;
        private var _899454816slot13:RuneSlot;
        private var _109532658slot0:RuneSlot;
        private var _109532665slot7:RuneSlot;
        private var _109532662slot4:RuneSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":360,
                    "height":300,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Tile,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 5;
                            this.verticalGap = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "direction":"horizontal",
                                "x":10,
                                "height":206,
                                "width":340,
                                "y":23,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot12",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot13",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneSlot,
                                    "id":"slot14",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63
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
                            this.bottom = "32";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":104.5,
                                "changeCall":updateBagView
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"_RuneBagUpLvl_BasicDelayButton1",
                        "events":{"click":"___RuneBagUpLvl_BasicDelayButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "x":271,
                                "y":265
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _runeArr:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RuneBagUpLvl()
        {
            mx_internal::_document = this;
            this.width = 360;
            this.height = 300;
            this.styleName = "CanvasBorder";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___RuneBagUpLvl_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RuneBagUpLvl._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get slot7():RuneSlot
        {
            return (this._109532665slot7);
        }

        [Bindable(event="propertyChange")]
        public function get slot1():RuneSlot
        {
            return (this._109532659slot1);
        }

        public function set slot8(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot4():RuneSlot
        {
            return (this._109532662slot4);
        }

        public function set slot7(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
        }

        public function ___RuneBagUpLvl_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            arrangeBag(_runeBagType);
        }

        [Bindable(event="propertyChange")]
        public function get slot3():RuneSlot
        {
            return (this._109532661slot3);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        [Bindable(event="propertyChange")]
        public function get slot9():RuneSlot
        {
            return (this._109532667slot9);
        }

        private function initRuneArr(_arg_1:Object):void
        {
            var _local_4:*;
            _runeArr = [];
            var _local_2:String = ((_runeBagType) ? "petBag" : "chaBag");
            var _local_3:Object = _arg_1[_local_2];
            for (_local_4 in _local_3)
            {
                _runeArr[Number(_local_4)] = _local_3[Number(_local_4)];
            };
            updateBagView();
        }

        override public function initialize():void
        {
            var target:RuneBagUpLvl;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RuneBagUpLvl_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RuneBagUpLvlWatcherSetupUtil");
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
        public function get slot13():RuneSlot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get slot14():RuneSlot
        {
            return (this._899454815slot14);
        }

        [Bindable(event="propertyChange")]
        public function get slot11():RuneSlot
        {
            return (this._899454818slot11);
        }

        public function ___RuneBagUpLvl_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            update();
        }

        public function set runeBagType(_arg_1:uint):void
        {
            _runeBagType = _arg_1;
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

        [Bindable(event="propertyChange")]
        public function get slot12():RuneSlot
        {
            return (this._899454817slot12);
        }

        public function set slot9(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot10():RuneSlot
        {
            return (this._899454819slot10);
        }

        [Bindable(event="propertyChange")]
        public function get slot8():RuneSlot
        {
            return (this._109532666slot8);
        }

        private function arrangeBag(_arg_1:int):void
        {
            _core.remote.call("arrangeRuneBag", null, _core.cid, _arg_1);
        }

        public function set slot12(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        private function _RuneBagUpLvl_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DECORATE_PANEL[39];
        }

        public function set slot14(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
        }

        public function set slot11(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        private function updateBagView():void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Object;
            pageSelector.totalPage = Math.ceil((_runeArr.length / 15));
            var _local_1:int = pageSelector.curPage;
            var _local_2:int;
            while (_local_2 < 15)
            {
                _local_3 = (((_local_1 - 1) * 15) + _local_2);
                this[("slot" + _local_2)].clean();
                if (_runeBagType)
                {
                    this[("slot" + _local_2)].runePetBagPos = _local_3;
                    this[("slot" + _local_2)].slotType = Slot.SLOT_RUNE_PET;
                }
                else
                {
                    this[("slot" + _local_2)].runeChaBagPos = _local_3;
                    this[("slot" + _local_2)].slotType = Slot.SLOT_RUNE_CHA;
                };
                if (_runeArr.length > 0)
                {
                    if (_runeArr[_local_3])
                    {
                        _local_4 = Number(_runeArr[_local_3]["r"]);
                        _local_5 = GameData.d[GamePredef.TBL_DECO_RUNE][_local_4];
                        this[("slot" + _local_2)].type = GamePredef.TBL_DECO_RUNE;
                        this[("slot" + _local_2)].giid = _local_4;
                        this[("slot" + _local_2)].slotData = _local_5;
                        this[("slot" + _local_2)].stackNum = Number(_runeArr[_local_3]["n"]);
                    };
                };
                _local_2++;
            };
        }

        public function set slot13(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function get runeBagType():uint
        {
            return (_runeBagType);
        }

        public function update():void
        {
            _core.remote.call("getRuneBagData", new Responder(initRuneArr), _core.cid);
        }

        private function _RuneBagUpLvl_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RuneBagUpLvl_BasicDelayButton1.label = _arg_1;
            }, "_RuneBagUpLvl_BasicDelayButton1.label");
            result[0] = binding;
            return (result);
        }

        public function set slot1(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function set slot10(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        public function set slot0(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532658slot0;
            if (_local_2 !== _arg_1)
            {
                this._109532658slot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0", _local_2, _arg_1));
            };
        }

        public function set slot5(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        public function set slot2(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set slot6(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2():RuneSlot
        {
            return (this._109532660slot2);
        }

        [Bindable(event="propertyChange")]
        public function get slot5():RuneSlot
        {
            return (this._109532663slot5);
        }

        [Bindable(event="propertyChange")]
        public function get slot6():RuneSlot
        {
            return (this._109532664slot6);
        }

        [Bindable(event="propertyChange")]
        public function get slot0():RuneSlot
        {
            return (this._109532658slot0);
        }

        public function set slot4(_arg_1:RuneSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

