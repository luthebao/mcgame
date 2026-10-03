// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RuneClickBag

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Tile;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.data.GameData;
    import flash.net.Responder;
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

    public class RuneClickBag extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _109532662slot4:RuneClickSlot;
        private var _runeBagType:uint;
        private var _109532659slot1:RuneClickSlot;
        private var _899454786slot22:RuneClickSlot;
        private var _109532667slot9:RuneClickSlot;
        private var _899454813slot16:RuneClickSlot;
        public var _RuneClickBag_Label2:Label;
        private var _899454817slot12:RuneClickSlot;
        private var _itemDic:Object;
        private var _109532664slot6:RuneClickSlot;
        private var _899454787slot21:RuneClickSlot;
        private var _109532661slot3:RuneClickSlot;
        private var _899454818slot11:RuneClickSlot;
        private var _899454814slot15:RuneClickSlot;
        private var _899454810slot19:RuneClickSlot;
        private var _109532658slot0:RuneClickSlot;
        private var _109532666slot8:RuneClickSlot;
        private var _899454788slot20:RuneClickSlot;
        private var _109532663slot5:RuneClickSlot;
        private var _899454819slot10:RuneClickSlot;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _899454815slot14:RuneClickSlot;
        private var _109532660slot2:RuneClickSlot;
        private var _899454811slot18:RuneClickSlot;
        public var _RuneClickBag_BasicGlowButton1:BasicGlowButton;
        public var _RuneClickBag_BasicGlowButton2:BasicGlowButton;
        public var _RuneClickBag_BasicGlowButton3:BasicGlowButton;
        private var _1942312203totalResolveExp:Label;
        private var _899454785slot23:RuneClickSlot;
        private var _109532665slot7:RuneClickSlot;
        private var _899454816slot13:RuneClickSlot;
        private var _899454812slot17:RuneClickSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":550,
                    "height":295,
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
                                "x":6,
                                "height":200,
                                "width":540,
                                "y":8,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot12",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot13",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot14",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot15",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot16",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot17",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot18",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot19",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot20",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot21",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot22",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RuneClickSlot,
                                    "id":"slot23",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"SoulSlotOpen",
                                            "width":63,
                                            "height":63,
                                            "clickCall":clickHandler
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
                            this.bottom = "63";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":201.5,
                                "changeCall":updateBagView
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_RuneClickBag_BasicGlowButton1",
                        "events":{"click":"___RuneClickBag_BasicGlowButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "x":410,
                                "y":209
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"totalResolveExp",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":213,
                                "y":247
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_RuneClickBag_Label2",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":201,
                                "y":232
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_RuneClickBag_BasicGlowButton2",
                        "events":{"click":"___RuneClickBag_BasicGlowButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "x":285.5,
                                "y":265
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_RuneClickBag_BasicGlowButton3",
                        "events":{"click":"___RuneClickBag_BasicGlowButton3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "x":219,
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

        public function RuneClickBag()
        {
            mx_internal::_document = this;
            this.width = 550;
            this.height = 295;
            this.styleName = "CanvasBorder";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___RuneClickBag_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RuneClickBag._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get slot9():RuneClickSlot
        {
            return (this._109532667slot9);
        }

        public function set slot8(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot4():RuneClickSlot
        {
            return (this._109532662slot4);
        }

        public function set slot7(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
        }

        public function set totalResolveExp(_arg_1:Label):void
        {
            var _local_2:Object = this._1942312203totalResolveExp;
            if (_local_2 !== _arg_1)
            {
                this._1942312203totalResolveExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalResolveExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get totalResolveExp():Label
        {
            return (this._1942312203totalResolveExp);
        }

        public function set slot4(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }

        public function set slot9(_arg_1:RuneClickSlot):void
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

        private function updateTotalExp():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Number;
            var _local_1:Number = 0;
            if (_itemDic)
            {
                for (_local_2 in _itemDic)
                {
                    if (_itemDic[_local_2])
                    {
                        _local_3 = _itemDic[_local_2].slotData;
                        _local_4 = _itemDic[_local_2].stackNum;
                        _local_1 = (_local_1 + (Number(_local_3["exp"]) * _local_4));
                    };
                };
            };
            totalResolveExp.text = Language.DECORATE_PANEL[41].toString().replace("{num}", _local_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot8():RuneClickSlot
        {
            return (this._109532666slot8);
        }

        public function ___RuneClickBag_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            selectThisPage();
        }

        public function set slot11(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        public function set slot12(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        public function set slot13(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function set slot14(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
        }

        public function set slot15(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        public function clean():void
        {
            _itemDic = null;
            var _local_1:int;
            while (_local_1 < 24)
            {
                (this[("slot" + _local_1)] as RuneClickSlot).selectImg.visible = false;
                (this[("slot" + _local_1)] as RuneClickSlot).isSelected = false;
                _local_1++;
            };
            this.updateTotalExp();
        }

        public function set slot19(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454810slot19;
            if (_local_2 !== _arg_1)
            {
                this._899454810slot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot19", _local_2, _arg_1));
            };
        }

        public function set slot17(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        public function set slot18(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454811slot18;
            if (_local_2 !== _arg_1)
            {
                this._899454811slot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot18", _local_2, _arg_1));
            };
        }

        public function set slot10(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        private function resolveRune():void
        {
            var gfunc:Function;
            var i:Object;
            var id:Number;
            var pos:Number;
            if (!_core.delPass)
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                return;
            };
            var runeObj:Object = {};
            if (_itemDic)
            {
                for (i in _itemDic)
                {
                    if (_itemDic[i])
                    {
                        id = _itemDic[i].slotData.id;
                        pos = ((_runeBagType) ? _itemDic[i].runePetBagPos : _itemDic[i].runeChaBagPos);
                        runeObj[pos] = id;
                    };
                };
            };
            this.clean();
            _core.remote.call("runeResolve", null, runeObj, _runeBagType);
        }

        private function _RuneClickBag_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DECORATE_PANEL[39];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[40];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[42];
            _local_1 = Language.DECORATE_PANEL[48];
        }

        private function selectThisPage():void
        {
            var _local_2:RuneClickSlot;
            var _local_1:int;
            while (_local_1 < 24)
            {
                _local_2 = (this[("slot" + _local_1)] as RuneClickSlot);
                _local_2.hideTooltip();
                if (_local_2.slotData)
                {
                    _local_2.selectImg.visible = (!(_local_2.selectImg.visible));
                    _local_2.isSelected = (!(_local_2.isSelected));
                    ((_local_2.clickCall) && (_local_2.clickCall(_local_2)));
                };
                _local_1++;
            };
        }

        public function set slot20(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454788slot20;
            if (_local_2 !== _arg_1)
            {
                this._899454788slot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot20", _local_2, _arg_1));
            };
        }

        public function set slot22(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454786slot22;
            if (_local_2 !== _arg_1)
            {
                this._899454786slot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot22", _local_2, _arg_1));
            };
        }

        public function set slot16(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        public function set slot23(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454785slot23;
            if (_local_2 !== _arg_1)
            {
                this._899454785slot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot23", _local_2, _arg_1));
            };
        }

        private function _RuneClickBag_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RuneClickBag_BasicGlowButton1.label = _arg_1;
            }, "_RuneClickBag_BasicGlowButton1.label");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                totalResolveExp.filters = _arg_1;
            }, "totalResolveExp.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RuneClickBag_Label2.text = _arg_1;
            }, "_RuneClickBag_Label2.text");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _RuneClickBag_Label2.filters = _arg_1;
            }, "_RuneClickBag_Label2.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RuneClickBag_BasicGlowButton2.label = _arg_1;
            }, "_RuneClickBag_BasicGlowButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RuneClickBag_BasicGlowButton3.label = _arg_1;
            }, "_RuneClickBag_BasicGlowButton3.label");
            result[5] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:RuneClickBag;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RuneClickBag_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RuneClickBagWatcherSetupUtil");
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

        public function set slot21(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._899454787slot21;
            if (_local_2 !== _arg_1)
            {
                this._899454787slot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot21", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot13():RuneClickSlot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get slot14():RuneClickSlot
        {
            return (this._899454815slot14);
        }

        private function clickHandler(_arg_1:RuneClickSlot):void
        {
            if (!_itemDic)
            {
                _itemDic = {};
            };
            if (_arg_1.giid > 0)
            {
                if (_runeBagType == 0)
                {
                    _itemDic[_arg_1.runeChaBagPos] = ((_arg_1.isSelected) ? _arg_1 : null);
                }
                else
                {
                    _itemDic[_arg_1.runePetBagPos] = ((_arg_1.isSelected) ? _arg_1 : null);
                };
            };
            this.updateTotalExp();
        }

        [Bindable(event="propertyChange")]
        public function get slot10():RuneClickSlot
        {
            return (this._899454819slot10);
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

        public function set runeBagType(_arg_1:uint):void
        {
            _runeBagType = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get slot15():RuneClickSlot
        {
            return (this._899454814slot15);
        }

        [Bindable(event="propertyChange")]
        public function get slot17():RuneClickSlot
        {
            return (this._899454812slot17);
        }

        [Bindable(event="propertyChange")]
        public function get slot18():RuneClickSlot
        {
            return (this._899454811slot18);
        }

        [Bindable(event="propertyChange")]
        public function get slot11():RuneClickSlot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():RuneClickSlot
        {
            return (this._899454817slot12);
        }

        public function ___RuneClickBag_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            arrangeBag(_runeBagType);
        }

        [Bindable(event="propertyChange")]
        public function get slot19():RuneClickSlot
        {
            return (this._899454810slot19);
        }

        private function arrangeBag(_arg_1:int):void
        {
            this.clean();
            _core.remote.call("arrangeRuneBag", null, _core.cid, _arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot22():RuneClickSlot
        {
            return (this._899454786slot22);
        }

        [Bindable(event="propertyChange")]
        public function get slot23():RuneClickSlot
        {
            return (this._899454785slot23);
        }

        [Bindable(event="propertyChange")]
        public function get slot20():RuneClickSlot
        {
            return (this._899454788slot20);
        }

        private function updateBagView():void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Object;
            this.updateTotalExp();
            pageSelector.totalPage = Math.ceil((_runeArr.length / 24));
            var _local_1:int = pageSelector.curPage;
            var _local_2:int;
            while (_local_2 < 24)
            {
                _local_3 = (((_local_1 - 1) * 24) + _local_2);
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
            this.clean();
        }

        public function get runeBagType():uint
        {
            return (_runeBagType);
        }

        public function update():void
        {
            _core.remote.call("getRuneBagData", new Responder(initRuneArr), _core.cid);
        }

        [Bindable(event="propertyChange")]
        public function get slot16():RuneClickSlot
        {
            return (this._899454813slot16);
        }

        [Bindable(event="propertyChange")]
        public function get slot21():RuneClickSlot
        {
            return (this._899454787slot21);
        }

        public function set slot0(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._109532658slot0;
            if (_local_2 !== _arg_1)
            {
                this._109532658slot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0", _local_2, _arg_1));
            };
        }

        public function set slot1(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function set slot5(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        public function set slot2(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set slot6(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:RuneClickSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot0():RuneClickSlot
        {
            return (this._109532658slot0);
        }

        [Bindable(event="propertyChange")]
        public function get slot1():RuneClickSlot
        {
            return (this._109532659slot1);
        }

        public function ___RuneClickBag_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            resolveRune();
        }

        [Bindable(event="propertyChange")]
        public function get slot3():RuneClickSlot
        {
            return (this._109532661slot3);
        }

        public function ___RuneClickBag_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            update();
        }

        [Bindable(event="propertyChange")]
        public function get slot5():RuneClickSlot
        {
            return (this._109532663slot5);
        }

        [Bindable(event="propertyChange")]
        public function get slot6():RuneClickSlot
        {
            return (this._109532664slot6);
        }

        [Bindable(event="propertyChange")]
        public function get slot7():RuneClickSlot
        {
            return (this._109532665slot7);
        }

        [Bindable(event="propertyChange")]
        public function get slot2():RuneClickSlot
        {
            return (this._109532660slot2);
        }


    }
}//package com.qeedoo.ui.view.comp

