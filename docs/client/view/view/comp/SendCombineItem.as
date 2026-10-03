// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SendCombineItem

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.CheckBox;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.compDragable.BagPanel;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import mx.binding.Binding;
    import flash.events.Event;
    import com.adobe.crypto.MD5;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
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

    public class SendCombineItem extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _98228cb3:CheckBox;
        private var _1872948374savingP:Label;
        public var buyNum:int = 0;
        private var _908765957scName:Label;
        private var _3046233cav1:Canvas;
        private var _100525950item1:ItemSlot;
        private var _3046235cav3:Canvas;
        private var _98226cb1:CheckBox;
        private var _1377586698buyBtn:BasicGlowButton;
        private var _1547939475oldTotalP:Label;
        private var _1435867406oldPrice0:Label;
        private var _100525952item3:ItemSlot;
        private var _100525949item0:ItemSlot;
        private var _191869972curTotalP:Label;
        private var _1435867407oldPrice1:Label;
        private var _98227cb2:CheckBox;
        private var _303942040curPrice1:Label;
        private var _1435867408oldPrice2:Label;
        private var _3046232cav0:Canvas;
        private var _3046234cav2:Canvas;
        public var combineId:* = -1;
        public var curTP:int = 0;
        private var _303942041curPrice0:Label;
        private var _1435867409oldPrice3:Label;
        private var _100525951item2:ItemSlot;
        public var combineIndex:* = -1;
        private var _303942038curPrice3:Label;
        public var buyLimit:int = 0;
        public var oldTP:int = 0;
        public var buyType:String = "";
        private var _303942039curPrice2:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":605,
                    "height":100,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"scName",
                        "stylesFactory":function ():void
                        {
                            this.color = 1961723;
                            this.fontSize = 14;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":40,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":120,
                                "y":5,
                                "styleName":"RoundedGradientBorder",
                                "height":90,
                                "width":485,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"cav0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"oldPrice0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":45
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"curPrice0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.strokeColor = 0xCCCCCC;
                                                    this.shadowColor = 0xCCCCCC;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":54,
                                                        "width":70,
                                                        "height":1
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"cav1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":0,
                                            "visible":false,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 15;
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":15,
                                                        "text":"+"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"cb1",
                                                "events":{"change":"__cb1_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":27,
                                                        "y":15,
                                                        "selected":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":48,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"oldPrice1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":45
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"curPrice1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "24";
                                                    this.strokeColor = 0xCCCCCC;
                                                    this.shadowColor = 0xCCCCCC;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":54,
                                                        "width":70,
                                                        "height":1
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"cav2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":175,
                                            "y":0,
                                            "visible":false,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 15;
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":15,
                                                        "text":"+"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"cb2",
                                                "events":{"change":"__cb2_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":27,
                                                        "y":15,
                                                        "selected":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":48,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"oldPrice2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":45
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"curPrice2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "24";
                                                    this.strokeColor = 0xCCCCCC;
                                                    this.shadowColor = 0xCCCCCC;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":54,
                                                        "width":70,
                                                        "height":1
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"cav3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":270,
                                            "y":0,
                                            "visible":false,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 15;
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":15,
                                                        "text":"+"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"cb3",
                                                "events":{"change":"__cb3_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":27,
                                                        "y":15,
                                                        "selected":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":48,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"oldPrice3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":45
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"curPrice3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "24";
                                                    this.strokeColor = 0xCCCCCC;
                                                    this.shadowColor = 0xCCCCCC;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":54,
                                                        "width":70,
                                                        "height":1
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 15;
                                        this.color = 16775802;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":380,
                                            "y":15,
                                            "text":"="
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"oldTotalP",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 11;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":400,
                                            "y":8
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"curTotalP",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":400,
                                            "y":25
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"savingP",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 11;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":400,
                                            "y":42
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HRule,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "399";
                                        this.strokeColor = 0xCCCCCC;
                                        this.shadowColor = 0xCCCCCC;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":17,
                                            "width":70,
                                            "height":1
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"buyBtn",
                                    "events":{"click":"__buyBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.right = "17";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":65,
                                            "styleName":"BtnStdRed"
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
        public var scObj:Object = new Object();
        public var currency_arr:Object = {
            "gold":Language.SEND_COMBINE_PANEL[3],
            "point":Language.SEND_COMBINE_PANEL[4],
            "integral":Language.SEND_COMBINE_PANEL[5]
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SendCombineItem()
        {
            mx_internal::_document = this;
            this.scaleX = 1;
            this.scaleY = 1;
            this.width = 605;
            this.height = 100;
            this.addEventListener("creationComplete", ___SendCombineItem_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SendCombineItem._watcherSetupUtil = _arg_1;
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

        public function set item1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525950item1;
            if (_local_2 !== _arg_1)
            {
                this._100525950item1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item1", _local_2, _arg_1));
            };
        }

        public function set scName(_arg_1:Label):void
        {
            var _local_2:Object = this._908765957scName;
            if (_local_2 !== _arg_1)
            {
                this._908765957scName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scName", _local_2, _arg_1));
            };
        }

        public function set item0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525949item0;
            if (_local_2 !== _arg_1)
            {
                this._100525949item0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get oldPrice1():Label
        {
            return (this._1435867407oldPrice1);
        }

        [Bindable(event="propertyChange")]
        public function get oldPrice2():Label
        {
            return (this._1435867408oldPrice2);
        }

        [Bindable(event="propertyChange")]
        public function get oldPrice3():Label
        {
            return (this._1435867409oldPrice3);
        }

        [Bindable(event="propertyChange")]
        public function get scName():Label
        {
            return (this._908765957scName);
        }

        [Bindable(event="propertyChange")]
        public function get oldPrice0():Label
        {
            return (this._1435867406oldPrice0);
        }

        public function onBuyCombine(_arg_1:int):void
        {
            buyNum = _arg_1;
            buyBtn.label = (((Language.SEND_COMBINE_PANEL[6] + _arg_1) + "/") + buyLimit);
            if (buyNum == buyLimit)
            {
                buyBtn.enabled = false;
            };
        }

        public function set oldPrice0(_arg_1:Label):void
        {
            var _local_2:Object = this._1435867406oldPrice0;
            if (_local_2 !== _arg_1)
            {
                this._1435867406oldPrice0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPrice0", _local_2, _arg_1));
            };
        }

        public function set oldPrice1(_arg_1:Label):void
        {
            var _local_2:Object = this._1435867407oldPrice1;
            if (_local_2 !== _arg_1)
            {
                this._1435867407oldPrice1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPrice1", _local_2, _arg_1));
            };
        }

        public function subBuy(flag:Boolean):void
        {
            var bagPanel:BagPanel;
            if (!flag)
            {
                return;
            };
            if (buyType == Language.SEND_COMBINE_PANEL[3])
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                if (bagPanel.goldLockFlag)
                {
                    bagPanel.goldLockFlag = false;
                };
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buySendCombine", new Responder(onBuyCombine), combineId, cb1.selected, cb2.selected, cb3.selected);
                };
            };
            Alert.show(Language.SEND_COMBINE_PANEL[10].replace("{num}", GamePredef.SEND_COMBINE_ARR[combineIndex]), null, (Alert.YES | Alert.NO), null, func);
        }

        public function set oldPrice2(_arg_1:Label):void
        {
            var _local_2:Object = this._1435867408oldPrice2;
            if (_local_2 !== _arg_1)
            {
                this._1435867408oldPrice2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPrice2", _local_2, _arg_1));
            };
        }

        public function set oldPrice3(_arg_1:Label):void
        {
            var _local_2:Object = this._1435867409oldPrice3;
            if (_local_2 !== _arg_1)
            {
                this._1435867409oldPrice3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPrice3", _local_2, _arg_1));
            };
        }

        public function changeTotalPrice(_arg_1:int):void
        {
            if (this[("cb" + _arg_1)].selected)
            {
                oldTP = (oldTP + scObj.award[_arg_1].original);
                curTP = (curTP + scObj.award[_arg_1].discount);
            }
            else
            {
                oldTP = (oldTP - scObj.award[_arg_1].original);
                curTP = (curTP - scObj.award[_arg_1].discount);
            };
            oldTotalP.htmlText = (((("<font color='#1deefb' >" + Language.SEND_COMBINE_PANEL[0]) + oldTP) + buyType) + "</font>");
            curTotalP.htmlText = (((((("<font color='#1deefb' >" + Language.SEND_COMBINE_PANEL[1]) + "<font color='#FF9900' >") + curTP) + "</font>") + buyType) + "</font>");
            savingP.htmlText = (((("<font color='#1deefb' >" + Language.SEND_COMBINE_PANEL[2]) + (oldTP - curTP)) + buyType) + "</font>");
        }

        public function testBbb():void
        {
            var _local_1:*;
            var _local_2:String;
            if (!scObj)
            {
                return;
            };
            for (_local_1 in scObj.award)
            {
                buyType = currency_arr[scObj.currency];
                if (scObj.award[_local_1].itemId == "-1")
                {
                    _local_2 = ResManager.getIconUrl(Number(scObj[_local_1].iconCode));
                    this[("item" + _local_1)].setIconToolTip(_local_2, scObj[_local_1].description);
                }
                else
                {
                    this[("item" + _local_1)].setStyleName(0);
                    this[("item" + _local_1)].data = scObj.award[_local_1];
                    this[("item" + _local_1)].stackNum = scObj.award[_local_1].stackNum;
                    this[("item" + _local_1)].type = scObj.award[_local_1].itemType;
                    this[("item" + _local_1)].giid = scObj.award[_local_1].itemId;
                    this[("item" + _local_1)].movable = false;
                    this[("item" + _local_1)].slotData = scObj.award[_local_1];
                    this[("item" + _local_1)].slotType = Slot.SLOT_TEMP_SLOT;
                    this[("item" + _local_1)].quality = scObj.award[_local_1].quality;
                    this[("oldPrice" + _local_1)].htmlText = (((("<font color='#1deefb' >" + Language.SEND_COMBINE_PANEL[0]) + scObj.award[_local_1].original) + buyType) + "</font>");
                    this[("curPrice" + _local_1)].htmlText = (((((("<font color='#1deefb' >" + Language.SEND_COMBINE_PANEL[1]) + "<font color='#FF9900' >") + scObj.award[_local_1].discount) + "</font>") + buyType) + "</font>");
                    if (_local_1 > 0)
                    {
                        if (scObj.award[_local_1].checkable == "false")
                        {
                            this[("cb" + _local_1)].visible = true;
                            this[("cb" + _local_1)].selected = true;
                        }
                        else
                        {
                            this[("cb" + _local_1)].visible = false;
                            this[("cb" + _local_1)].selected = false;
                        };
                    };
                    this[("cav" + _local_1)].visible = true;
                };
                oldTP = (oldTP + scObj.award[_local_1].original);
                curTP = (curTP + scObj.award[_local_1].discount);
            };
            buyLimit = scObj.limit;
            buyNum = scObj.buyNum;
            oldTotalP.htmlText = (((("<font color='#1deefb' >" + Language.SEND_COMBINE_PANEL[0]) + oldTP) + buyType) + "</font>");
            curTotalP.htmlText = (((((("<font color='#1deefb' >" + Language.SEND_COMBINE_PANEL[1]) + "<font color='#FF9900' >") + curTP) + "</font>") + buyType) + "</font>");
            savingP.htmlText = (((("<font color='#1deefb' >" + Language.SEND_COMBINE_PANEL[2]) + (oldTP - curTP)) + buyType) + "</font>");
            buyBtn.label = (((Language.SEND_COMBINE_PANEL[6] + buyNum) + "/") + buyLimit);
            if (buyNum == buyLimit)
            {
                buyBtn.enabled = false;
            }
            else
            {
                buyBtn.enabled = true;
            };
            combineId = scObj.id;
            combineIndex = scObj.index;
            scName.text = (Language.SEND_COMBINE_PANEL[8] + GamePredef.SEND_COMBINE_ARR[combineIndex]);
        }

        private function _SendCombineItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                scName.text = _arg_1;
            }, "scName.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                oldPrice0.text = _arg_1;
            }, "oldPrice0.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curPrice0.text = _arg_1;
            }, "curPrice0.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                oldPrice1.text = _arg_1;
            }, "oldPrice1.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curPrice1.text = _arg_1;
            }, "curPrice1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                oldPrice2.text = _arg_1;
            }, "oldPrice2.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curPrice2.text = _arg_1;
            }, "curPrice2.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                oldPrice3.text = _arg_1;
            }, "oldPrice3.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curPrice3.text = _arg_1;
            }, "curPrice3.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                oldTotalP.text = _arg_1;
            }, "oldTotalP.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curTotalP.text = _arg_1;
            }, "curTotalP.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                savingP.text = _arg_1;
            }, "savingP.text");
            result[11] = binding;
            return (result);
        }

        public function set oldTotalP(_arg_1:Label):void
        {
            var _local_2:Object = this._1547939475oldTotalP;
            if (_local_2 !== _arg_1)
            {
                this._1547939475oldTotalP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldTotalP", _local_2, _arg_1));
            };
        }

        private function initV():void
        {
            testBbb();
        }

        public function set savingP(_arg_1:Label):void
        {
            var _local_2:Object = this._1872948374savingP;
            if (_local_2 !== _arg_1)
            {
                this._1872948374savingP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "savingP", _local_2, _arg_1));
            };
        }

        override public function set data(_arg_1:Object):void
        {
            scObj = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get cav0():Canvas
        {
            return (this._3046232cav0);
        }

        public function set cb1(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._98226cb1;
            if (_local_2 !== _arg_1)
            {
                this._98226cb1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get curPrice0():Label
        {
            return (this._303942041curPrice0);
        }

        [Bindable(event="propertyChange")]
        public function get cav1():Canvas
        {
            return (this._3046233cav1);
        }

        [Bindable(event="propertyChange")]
        public function get cav3():Canvas
        {
            return (this._3046235cav3);
        }

        private function _SendCombineItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SEND_COMBINE_PANEL[8];
            _local_1 = Language.SEND_COMBINE_PANEL[0];
            _local_1 = Language.SEND_COMBINE_PANEL[1];
            _local_1 = Language.SEND_COMBINE_PANEL[0];
            _local_1 = Language.SEND_COMBINE_PANEL[1];
            _local_1 = Language.SEND_COMBINE_PANEL[0];
            _local_1 = Language.SEND_COMBINE_PANEL[1];
            _local_1 = Language.SEND_COMBINE_PANEL[0];
            _local_1 = Language.SEND_COMBINE_PANEL[1];
            _local_1 = Language.SEND_COMBINE_PANEL[0];
            _local_1 = Language.SEND_COMBINE_PANEL[1];
            _local_1 = Language.SEND_COMBINE_PANEL[2];
        }

        public function set cb3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._98228cb3;
            if (_local_2 !== _arg_1)
            {
                this._98228cb3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get curPrice3():Label
        {
            return (this._303942038curPrice3);
        }

        [Bindable(event="propertyChange")]
        public function get cav2():Canvas
        {
            return (this._3046234cav2);
        }

        public function set cb2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._98227cb2;
            if (_local_2 !== _arg_1)
            {
                this._98227cb2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get curPrice1():Label
        {
            return (this._303942040curPrice1);
        }

        [Bindable(event="propertyChange")]
        public function get item0():ItemSlot
        {
            return (this._100525949item0);
        }

        [Bindable(event="propertyChange")]
        public function get item2():ItemSlot
        {
            return (this._100525951item2);
        }

        [Bindable(event="propertyChange")]
        public function get item3():ItemSlot
        {
            return (this._100525952item3);
        }

        [Bindable(event="propertyChange")]
        public function get curPrice2():Label
        {
            return (this._303942039curPrice2);
        }

        public function __cb3_change(_arg_1:Event):void
        {
            changeTotalPrice(3);
        }

        public function checkDeletePass():void
        {
            var bagPanel:BagPanel;
            var func:Function;
            if (combineId < 0)
            {
                return;
            };
            if (buyType == Language.SEND_COMBINE_PANEL[3])
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                func = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", new Responder(subBuy), MD5.hash(_arg_1));
                };
                if (bagPanel.goldLockFlag)
                {
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.NUMPANEL_U[1], func);
                }
                else
                {
                    subBuy(true);
                };
            }
            else
            {
                subBuy(true);
            };
        }

        [Bindable(event="propertyChange")]
        public function get item1():ItemSlot
        {
            return (this._100525950item1);
        }

        [Bindable(event="propertyChange")]
        public function get oldTotalP():Label
        {
            return (this._1547939475oldTotalP);
        }

        override public function initialize():void
        {
            var target:SendCombineItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SendCombineItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_SendCombineItemWatcherSetupUtil");
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
        public function get savingP():Label
        {
            return (this._1872948374savingP);
        }

        public function __cb2_change(_arg_1:Event):void
        {
            changeTotalPrice(2);
        }

        public function set cav0(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046232cav0;
            if (_local_2 !== _arg_1)
            {
                this._3046232cav0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cb2():CheckBox
        {
            return (this._98227cb2);
        }

        public function set cav3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046235cav3;
            if (_local_2 !== _arg_1)
            {
                this._3046235cav3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav3", _local_2, _arg_1));
            };
        }

        public function set cav1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046233cav1;
            if (_local_2 !== _arg_1)
            {
                this._3046233cav1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav1", _local_2, _arg_1));
            };
        }

        public function set cav2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046234cav2;
            if (_local_2 !== _arg_1)
            {
                this._3046234cav2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav2", _local_2, _arg_1));
            };
        }

        public function __cb1_change(_arg_1:Event):void
        {
            changeTotalPrice(1);
        }

        [Bindable(event="propertyChange")]
        public function get cb3():CheckBox
        {
            return (this._98228cb3);
        }

        [Bindable(event="propertyChange")]
        public function get cb1():CheckBox
        {
            return (this._98226cb1);
        }

        public function set curPrice0(_arg_1:Label):void
        {
            var _local_2:Object = this._303942041curPrice0;
            if (_local_2 !== _arg_1)
            {
                this._303942041curPrice0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPrice0", _local_2, _arg_1));
            };
        }

        public function set curPrice3(_arg_1:Label):void
        {
            var _local_2:Object = this._303942038curPrice3;
            if (_local_2 !== _arg_1)
            {
                this._303942038curPrice3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPrice3", _local_2, _arg_1));
            };
        }

        public function set curPrice1(_arg_1:Label):void
        {
            var _local_2:Object = this._303942040curPrice1;
            if (_local_2 !== _arg_1)
            {
                this._303942040curPrice1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPrice1", _local_2, _arg_1));
            };
        }

        public function set curTotalP(_arg_1:Label):void
        {
            var _local_2:Object = this._191869972curTotalP;
            if (_local_2 !== _arg_1)
            {
                this._191869972curTotalP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curTotalP", _local_2, _arg_1));
            };
        }

        public function set curPrice2(_arg_1:Label):void
        {
            var _local_2:Object = this._303942039curPrice2;
            if (_local_2 !== _arg_1)
            {
                this._303942039curPrice2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPrice2", _local_2, _arg_1));
            };
        }

        public function __buyBtn_click(_arg_1:MouseEvent):void
        {
            checkDeletePass();
        }

        public function set buyBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1377586698buyBtn;
            if (_local_2 !== _arg_1)
            {
                this._1377586698buyBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buyBtn", _local_2, _arg_1));
            };
        }

        public function ___SendCombineItem_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initV();
        }

        [Bindable(event="propertyChange")]
        public function get curTotalP():Label
        {
            return (this._191869972curTotalP);
        }

        [Bindable(event="propertyChange")]
        public function get buyBtn():BasicGlowButton
        {
            return (this._1377586698buyBtn);
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

