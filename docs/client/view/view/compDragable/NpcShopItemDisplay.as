// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NpcShopItemDisplay

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.view.comp.FilterButton;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.net.Responder;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.LanguageUtil;
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

    public class NpcShopItemDisplay extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1177331774itemName:Label;
        private var _1177017728itemCost:Label;
        private var _3533310slot:Slot;
        private var _creditId:String;
        private var _1744351112limitText:Label;
        public var _NpcShopItemDisplay_FilterButton1:FilterButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":235,
                    "height":80,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Slot,
                        "id":"slot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":10,
                                "styleName":"TransparentSlot",
                                "movable":false,
                                "acceptable":false,
                                "stackNum":1,
                                "width":34,
                                "height":34
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"itemName",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":10,
                                "mouseEnabled":false,
                                "mouseChildren":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"itemCost",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":25,
                                "mouseEnabled":false,
                                "mouseChildren":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":225,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"_NpcShopItemDisplay_FilterButton1",
                        "events":{"click":"___NpcShopItemDisplay_FilterButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":165,
                                "y":15,
                                "width":60,
                                "height":23,
                                "styleName":"BtnStdGreen"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"limitText",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "mouseEnabled":false,
                                "mouseChildren":false,
                                "y":56
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

        public function NpcShopItemDisplay()
        {
            mx_internal::_document = this;
            this.width = 235;
            this.height = 80;
            this.styleName = "InputContent";
            this.clipContent = false;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NpcShopItemDisplay._watcherSetupUtil = _arg_1;
        }


        public function set itemName(_arg_1:Label):void
        {
            var _local_2:Object = this._1177331774itemName;
            if (_local_2 !== _arg_1)
            {
                this._1177331774itemName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemName", _local_2, _arg_1));
            };
        }

        private function onExchangeHandler(exNum:Number):void
        {
            var onExchangeItem:Function = function (_arg_1:Object=null):*
            {
                if (((!(_creditId)) || (!(_arg_1))))
                {
                    return;
                };
                var _local_2:Object = GameData.d[GamePredef.TBL_CREDIT][_creditId];
                if (((!(_local_2)) || (int(_local_2.limitType) < 0)))
                {
                    return;
                };
                var _local_3:int = _local_2.limitType;
                if (_local_3 == 1)
                {
                    _core.player.creditDayDict = _arg_1;
                }
                else
                {
                    if (_local_3 == 2)
                    {
                        _core.player.creditWeekDict = _arg_1;
                    }
                    else
                    {
                        if (_local_3 == 3)
                        {
                            _core.player.creditMonthDict = _arg_1;
                        }
                        else
                        {
                            if (_local_3 == 4)
                            {
                                _core.player.creditTotalDict = _arg_1;
                            };
                        };
                    };
                };
                onLimitChange();
            };
            _core.remote.call("exchangeItem", new Responder(onExchangeItem), _creditId, exNum);
        }

        private function getLeftNum():Number
        {
            var _local_4:Object;
            if (!_creditId)
            {
                return (0);
            };
            var _local_1:Object = GameData.d[GamePredef.TBL_CREDIT][_creditId];
            if (!_local_1)
            {
                return (0);
            };
            var _local_2:int = _local_1.limitType;
            var _local_3:int = _local_1.limitNum;
            if (_local_2 <= 0)
            {
                return (0);
            };
            if (_local_2 == 1)
            {
                _local_4 = _core.player.creditDayDict;
            }
            else
            {
                if (_local_2 == 2)
                {
                    _local_4 = _core.player.creditWeekDict;
                }
                else
                {
                    if (_local_2 == 3)
                    {
                        _local_4 = _core.player.creditMonthDict;
                    }
                    else
                    {
                        if (_local_2 == 4)
                        {
                            _local_4 = _core.player.creditTotalDict;
                        };
                    };
                };
            };
            var _local_5:int = (((_local_4) && (_local_4[_creditId])) ? Number(_local_4[_creditId]) : 0);
            var _local_6:int = ((_local_3 >= _local_5) ? (_local_3 - _local_5) : 0);
            return (_local_6);
        }

        public function set slot(_arg_1:Slot):void
        {
            var _local_2:Object = this._3533310slot;
            if (_local_2 !== _arg_1)
            {
                this._3533310slot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemName():Label
        {
            return (this._1177331774itemName);
        }

        public function updateView(_arg_1:String):void
        {
            var _local_3:int;
            var _local_4:Number;
            var _local_8:int;
            var _local_11:int;
            var _local_12:int;
            if (!_arg_1)
            {
                this.cleanView();
                return;
            };
            _creditId = _arg_1;
            var _local_2:Object = GameData.d[GamePredef.TBL_CREDIT][_arg_1];
            if (!_local_2)
            {
                this.cleanView();
                return;
            };
            _local_3 = int(_local_2.type);
            _local_4 = Number(_local_2.itemId);
            var _local_5:int = int(_local_2.quality);
            var _local_6:Object = GameData.d[_local_3];
            if (!_local_6)
            {
                this.cleanView();
                return;
            };
            var _local_7:Object = _local_6[_local_4];
            if (!_local_7)
            {
                this.cleanView();
                return;
            };
            this.visible = true;
            _local_8 = 0;
            if (_local_3 == GamePredef.TBL_EQUIPT_TEMPLATE)
            {
                _local_8 = _core.basic.getColorByQuality(_local_5);
            }
            else
            {
                if (_local_3 == GamePredef.TBL_ITEM_TEMPLATE)
                {
                    _local_8 = _local_7.color;
                }
                else
                {
                    if (_local_3 == GamePredef.TBL_CREATURE)
                    {
                        _local_8 = int(_core.basic.colorByGrowRate((_local_5 / 10)));
                    };
                };
            };
            slot.slotData = _local_7;
            slot.type = _local_3;
            slot.giid = _local_4;
            slot.tempColor = _local_8;
            slot.setStyleName(_local_8);
            itemName.htmlText = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_8]) + "'>") + _local_7.name) + "</font>");
            var _local_9:* = "";
            var _local_10:int = 1;
            while (_local_10 <= 2)
            {
                _local_11 = _local_2[("cType" + _local_10)];
                _local_12 = _local_2[("cNum" + _local_10)];
                if (((ViewManager.SCORENAME_CONFIG[_local_11]) && (_local_12 > 0)))
                {
                    if (_local_9)
                    {
                        _local_9 = (_local_9 + "");
                    };
                    _local_9 = (_local_9 + (_local_12 + ViewManager.SCORENAME_CONFIG[_local_11]));
                };
                _local_10++;
            };
            itemCost.text = _local_9;
            onLimitChange();
        }

        override public function initialize():void
        {
            var target:NpcShopItemDisplay;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NpcShopItemDisplay_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_NpcShopItemDisplayWatcherSetupUtil");
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

        public function cleanView():void
        {
            slot.clean();
            _creditId = null;
            this.visible = false;
        }

        private function _NpcShopItemDisplay_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                itemName.filters = _arg_1;
            }, "itemName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                itemCost.filters = _arg_1;
            }, "itemCost.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NPC_SHOP_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NpcShopItemDisplay_FilterButton1.label = _arg_1;
            }, "_NpcShopItemDisplay_FilterButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _NpcShopItemDisplay_FilterButton1.filters = _arg_1;
            }, "_NpcShopItemDisplay_FilterButton1.filters");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                limitText.filters = _arg_1;
            }, "limitText.filters");
            result[4] = binding;
            return (result);
        }

        private function _NpcShopItemDisplay_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.NPC_SHOP_PANEL[4];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get itemCost():Label
        {
            return (this._1177017728itemCost);
        }

        private function exchangeHandler(event:Event):void
        {
            var name:String;
            var num:Number;
            var func2:Function;
            event.stopImmediatePropagation();
            if (!_creditId)
            {
                return;
            };
            var creditMeta:Object = GameData.d[GamePredef.TBL_CREDIT][_creditId];
            var itemId:Number = creditMeta.itemId;
            var type:Number = creditMeta.type;
            name = GameData.d[type][itemId]["name"];
            num = creditMeta.cNum1;
            var func1:Function = function (result:uint):void
            {
                var func:Function = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        onExchangeHandler(result);
                    };
                };
                Alert.show(Language.NPC_SHOP_PANEL[208].toString().replace("{num}", (num * result)).replace("{num1}", result).replace("{name}", name), "", (Alert.YES | Alert.NO), null, func);
            };
            var leftNumH:Number = getLeftNum();
            var limitType:int = creditMeta.limitType;
            if (limitType <= 0)
            {
                leftNumH = 9999;
            };
            if (((leftNumH <= 0) && (limitType > 0)))
            {
                Alert.show(Language.NPC_SHOP_PANEL[211].toString(), "", Alert.YES);
                return;
            };
            if (type == 19)
            {
                func2 = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        onExchangeHandler(1);
                    };
                };
                Alert.show(Language.NPC_SHOP_PANEL[208].toString().replace("{num}", num).replace("{num1}", 1).replace("{name}", name), "", (Alert.YES | Alert.NO), null, func2);
            }
            else
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInputNum(Language.NPC_SHOP_PANEL[209].toString().replace("{name}", name), Language.NPC_SHOP_PANEL[210], func1, 1, 1, leftNumH);
            };
        }

        public function ___NpcShopItemDisplay_FilterButton1_click(_arg_1:MouseEvent):void
        {
            exchangeHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get limitText():Label
        {
            return (this._1744351112limitText);
        }

        [Bindable(event="propertyChange")]
        public function get slot():Slot
        {
            return (this._3533310slot);
        }

        public function set limitText(_arg_1:Label):void
        {
            var _local_2:Object = this._1744351112limitText;
            if (_local_2 !== _arg_1)
            {
                this._1744351112limitText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitText", _local_2, _arg_1));
            };
        }

        public function set itemCost(_arg_1:Label):void
        {
            var _local_2:Object = this._1177017728itemCost;
            if (_local_2 !== _arg_1)
            {
                this._1177017728itemCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemCost", _local_2, _arg_1));
            };
        }

        private function onLimitChange():void
        {
            var _local_5:Object;
            if (!_creditId)
            {
                return;
            };
            var _local_1:Object = GameData.d[GamePredef.TBL_CREDIT][_creditId];
            if (!_local_1)
            {
                return;
            };
            var _local_2:int = _local_1.limitType;
            var _local_3:int = _local_1.limitNum;
            if (_local_2 <= 0)
            {
                limitText.htmlText = Language.NPC_SHOP_PANEL[5];
                return;
            };
            var _local_4:int = 5;
            if (_local_2 == 1)
            {
                _local_4 = 6;
                _local_5 = _core.player.creditDayDict;
            }
            else
            {
                if (_local_2 == 2)
                {
                    _local_4 = 7;
                    _local_5 = _core.player.creditWeekDict;
                }
                else
                {
                    if (_local_2 == 3)
                    {
                        _local_4 = 8;
                        _local_5 = _core.player.creditMonthDict;
                    }
                    else
                    {
                        if (_local_2 == 4)
                        {
                            _local_4 = 207;
                            _local_5 = _core.player.creditTotalDict;
                        };
                    };
                };
            };
            var _local_6:int = (((_local_5) && (_local_5[_creditId])) ? Number(_local_5[_creditId]) : 0);
            var _local_7:int = ((_local_3 >= _local_6) ? (_local_3 - _local_6) : 0);
            var _local_8:String = ((_local_7 <= 0) ? "#FF0000" : "#FFFF00");
            limitText.htmlText = LanguageUtil.replace(Language.NPC_SHOP_PANEL[_local_4], {
                "color":_local_8,
                "num":_local_7
            });
        }


    }
}//package com.qeedoo.ui.view.compDragable

