// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ShowTimePnael

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ShowTimeCard;
    import mx.controls.Alert;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.LinkButton;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.config.Language;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.ItemConfig;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.event.GameDataEvent;
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

    public class ShowTimePnael extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1925399228stCard5:ShowTimeCard;
        private var _helpAlert2:Alert;
        private var _helpAlert:Alert;
        private var _1081500497cardContainer:Canvas;
        private var _1925399230stCard3:ShowTimeCard;
        private var neededItemId:int = 8888;
        private var _607339634pageSelector:PageSelector;
        private var inited:Boolean = false;
        private var _1925399227stCard6:ShowTimeCard;
        private var _1925399233stCard0:ShowTimeCard;
        public var _ShowTimePnael_BasicDelayButton1:BasicDelayButton;
        private var _1925399232stCard1:ShowTimeCard;
        private var _1925399226stCard7:ShowTimeCard;
        private var itemNumPrePage:int = 8;
        public var _ShowTimePnael_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1925399229stCard4:ShowTimeCard;
        private var _1925399231stCard2:ShowTimeCard;
        private var _pageNumberNow:int = -1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":770,
                    "height":550,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ShowTimePnael_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cardContainer",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "30";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ShowTimeCard,
                                    "id":"stCard0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ShowTimeCard,
                                    "id":"stCard1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":192.5,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ShowTimeCard,
                                    "id":"stCard2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":375,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ShowTimeCard,
                                    "id":"stCard3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":557.5,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ShowTimeCard,
                                    "id":"stCard4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":246
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ShowTimeCard,
                                    "id":"stCard5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":192.5,
                                            "y":246
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ShowTimeCard,
                                    "id":"stCard6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":375,
                                            "y":246
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ShowTimeCard,
                                    "id":"stCard7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":557.5,
                                            "y":246
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "stylesFactory":function ():void
                        {
                            this.bottom = "15";
                            this.left = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"text":"投票时间: 2024-2-1 10:00 ~ 2024-2-21 22:00"});
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelector,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "15";
                            this.horizontalCenter = "-7";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"onPageChanged":onPageChanged});
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"_ShowTimePnael_BasicDelayButton1",
                        "events":{"click":"___ShowTimePnael_BasicDelayButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "15";
                            this.right = "160";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":7000,
                                "styleName":"BtnStdGreen"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "events":{"click":"___ShowTimePnael_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "20";
                            this.bottom = "15";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"label":"规则说明"});
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "events":{"click":"___ShowTimePnael_LinkButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "90";
                            this.bottom = "15";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"label":"奖励说明"});
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _showTimeArray:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ShowTimePnael()
        {
            mx_internal::_document = this;
            this.width = 770;
            this.height = 550;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ShowTimePnael._watcherSetupUtil = _arg_1;
        }


        public function set stCard1(_arg_1:ShowTimeCard):void
        {
            var _local_2:Object = this._1925399232stCard1;
            if (_local_2 !== _arg_1)
            {
                this._1925399232stCard1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stCard1", _local_2, _arg_1));
            };
        }

        public function set stCard2(_arg_1:ShowTimeCard):void
        {
            var _local_2:Object = this._1925399231stCard2;
            if (_local_2 !== _arg_1)
            {
                this._1925399231stCard2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stCard2", _local_2, _arg_1));
            };
        }

        private function helpInfo2():void
        {
            if (_helpAlert2)
            {
                PopUpManager.removePopUp(_helpAlert2);
                _helpAlert2 = null;
            };
            var _local_1:String = Language.SHOW_TIME_PANEL[9].toString();
            _helpAlert2 = Alert.show(_local_1, Language.CARD_GAME_P[19].toString(), Alert.YES, null, null);
        }

        public function set stCard3(_arg_1:ShowTimeCard):void
        {
            var _local_2:Object = this._1925399230stCard3;
            if (_local_2 !== _arg_1)
            {
                this._1925399230stCard3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stCard3", _local_2, _arg_1));
            };
        }

        public function set stCard4(_arg_1:ShowTimeCard):void
        {
            var _local_2:Object = this._1925399229stCard4;
            if (_local_2 !== _arg_1)
            {
                this._1925399229stCard4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stCard4", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            visible = true;
            initView();
        }

        public function set stCard5(_arg_1:ShowTimeCard):void
        {
            var _local_2:Object = this._1925399228stCard5;
            if (_local_2 !== _arg_1)
            {
                this._1925399228stCard5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stCard5", _local_2, _arg_1));
            };
        }

        public function set stCard6(_arg_1:ShowTimeCard):void
        {
            var _local_2:Object = this._1925399227stCard6;
            if (_local_2 !== _arg_1)
            {
                this._1925399227stCard6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stCard6", _local_2, _arg_1));
            };
        }

        protected function image1_clickHandler(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest("http://www.lezi.com/campaign/mc/2022/202211cp/"), "_blank");
        }

        public function set stCard7(_arg_1:ShowTimeCard):void
        {
            var _local_2:Object = this._1925399226stCard7;
            if (_local_2 !== _arg_1)
            {
                this._1925399226stCard7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stCard7", _local_2, _arg_1));
            };
        }

        public function set stCard0(_arg_1:ShowTimeCard):void
        {
            var _local_2:Object = this._1925399233stCard0;
            if (_local_2 !== _arg_1)
            {
                this._1925399233stCard0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stCard0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.SHOW_TIME_PANEL[8].toString();
            _helpAlert = Alert.show(_local_1, Language.CARD_GAME_P[19].toString(), Alert.YES, null, null);
        }

        override public function initialize():void
        {
            var target:ShowTimePnael;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ShowTimePnael_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ShowTimePnaelWatcherSetupUtil");
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

        public function ___ShowTimePnael_LinkButton2_click(_arg_1:MouseEvent):void
        {
            helpInfo2();
        }

        public function set cardContainer(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1081500497cardContainer;
            if (_local_2 !== _arg_1)
            {
                this._1081500497cardContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardContainer", _local_2, _arg_1));
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        private function clearAllCards():void
        {
            var _local_1:int;
            while (_local_1 < 8)
            {
                this[("stCard" + _local_1)].visible = false;
                _local_1++;
            };
        }

        public function ___ShowTimePnael_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            _core.remote.call("getShowTimeInfo", null);
        }

        [Bindable(event="propertyChange")]
        public function get stCard1():ShowTimeCard
        {
            return (this._1925399232stCard1);
        }

        [Bindable(event="propertyChange")]
        public function get stCard2():ShowTimeCard
        {
            return (this._1925399231stCard2);
        }

        [Bindable(event="propertyChange")]
        public function get stCard3():ShowTimeCard
        {
            return (this._1925399230stCard3);
        }

        [Bindable(event="propertyChange")]
        public function get stCard4():ShowTimeCard
        {
            return (this._1925399229stCard4);
        }

        [Bindable(event="propertyChange")]
        public function get stCard5():ShowTimeCard
        {
            return (this._1925399228stCard5);
        }

        [Bindable(event="propertyChange")]
        public function get stCard6():ShowTimeCard
        {
            return (this._1925399227stCard6);
        }

        public function onGetShowTimeData(_arg_1:Object, _arg_2:Boolean=false):void
        {
            var _local_4:*;
            var _local_5:int;
            var _local_6:*;
            if (!_arg_1)
            {
                return;
            };
            var _local_3:Array = [];
            for (_local_4 in _arg_1)
            {
                _local_6 = _arg_1[_local_4];
                if (_local_6)
                {
                    _local_6.id = _local_4;
                    _local_3.push(_local_6);
                };
            };
            _local_3.sortOn("v", Array.NUMERIC);
            _local_3.reverse();
            _showTimeArray = _local_3;
            _pageNumberNow = pageSelector.pageNo;
            _local_5 = _showTimeArray.length;
            pageSelector.initPageSeletor(_local_5, itemNumPrePage);
            if (_arg_2)
            {
                _core.sysMidNote(Language.SHOW_TIME_PANEL[6]);
            }
            else
            {
                _core.sysMidNote(Language.SHOW_TIME_PANEL[7]);
            };
            if (_pageNumberNow >= 0)
            {
                pageSelector.pageNo = _pageNumberNow;
            };
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_6:int;
            var _local_7:ShowTimeCard;
            var _local_3:* = (_arg_1 + _arg_2);
            var _local_4:* = _arg_1;
            if (((_showTimeArray.length <= 0) || (_showTimeArray.length < _local_3)))
            {
                return;
            };
            clearAllCards();
            var _local_5:int = _local_4;
            while (_local_5 < _local_3)
            {
                _local_6 = (_local_5 - _local_4);
                _local_7 = this[("stCard" + _local_6)];
                if (_local_7)
                {
                    _showTimeArray[_local_5].r = (_local_5 + 1);
                    _local_7.cardData = _showTimeArray[_local_5];
                    _local_7.visible = true;
                };
                _local_5++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get stCard0():ShowTimeCard
        {
            return (this._1925399233stCard0);
        }

        public function ___ShowTimePnael_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        [Bindable(event="propertyChange")]
        public function get cardContainer():Canvas
        {
            return (this._1081500497cardContainer);
        }

        override public function initView():void
        {
            this.addEventListener("showTimeCardClick", showTimeCardClickHandler);
            _core.remote.call("getShowTimeInfo", null);
            _pageNumberNow = -1;
        }

        private function showTimeCardClickHandler(event:GameDataEvent):void
        {
            var cardData:Object;
            var slotObj:Object;
            var stackNum:* = undefined;
            var useMultiFunc:Function;
            cardData = event.data;
            if (!cardData)
            {
                return;
            };
            var slotList:Array = _core.basic.getItemSlotList(ItemConfig.ITEM_AIMUZHIXIN);
            var slotList_yushou:Array = _core.basic.getItemSlotList(ItemConfig.ITEM_AIMUZHIXIN_YUSHOU);
            if (slotList.length > 0)
            {
                slotObj = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_AIMUZHIXIN);
                if (((!(slotObj.slot)) || (!(slotObj.slot.cid == _core.cid))))
                {
                    return;
                };
                stackNum = slotObj.num;
                if (stackNum > 1)
                {
                    useMultiFunc = function (_arg_1:uint):void
                    {
                        _core.remote.call("voteForShowTime", null, cardData.id, Number(_arg_1), ItemConfig.ITEM_AIMUZHIXIN);
                    };
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInputNum(Language.PLAYER_S[31], Language.SHOW_TIME_PANEL[5], useMultiFunc, 1, 1, stackNum);
                }
                else
                {
                    if (stackNum == 1)
                    {
                        _core.remote.call("voteForShowTime", null, cardData.id, stackNum, ItemConfig.ITEM_AIMUZHIXIN);
                    }
                    else
                    {
                        _core.sysMidNote(Language.SHOW_TIME_PANEL[4]);
                        return;
                    };
                };
            }
            else
            {
                if (slotList_yushou.length > 0)
                {
                    slotObj = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_AIMUZHIXIN_YUSHOU);
                    if (((!(slotObj.slot)) || (!(slotObj.slot.cid == _core.cid))))
                    {
                        return;
                    };
                    stackNum = slotObj.num;
                    if (stackNum > 1)
                    {
                        useMultiFunc = function (_arg_1:uint):void
                        {
                            _core.remote.call("voteForShowTime", null, cardData.id, Number(_arg_1), ItemConfig.ITEM_AIMUZHIXIN_YUSHOU);
                        };
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInputNum(Language.PLAYER_S[31], Language.SHOW_TIME_PANEL[10], useMultiFunc, 1, 1, stackNum);
                    }
                    else
                    {
                        if (stackNum == 1)
                        {
                            _core.remote.call("voteForShowTime", null, cardData.id, stackNum, ItemConfig.ITEM_AIMUZHIXIN_YUSHOU);
                        }
                        else
                        {
                            _core.sysMidNote(Language.SHOW_TIME_PANEL[4]);
                            return;
                        };
                    };
                }
                else
                {
                    _core.sysMidNote(Language.SHOW_TIME_PANEL[4]);
                    return;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get stCard7():ShowTimeCard
        {
            return (this._1925399226stCard7);
        }

        private function _ShowTimePnael_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SHOW_TIME_PANEL[0];
            _local_1 = Language.TRIPLE_TOWN_PANEL[19];
        }

        private function _ShowTimePnael_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOW_TIME_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShowTimePnael_BasicTitleCanvas1.text = _arg_1;
            }, "_ShowTimePnael_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShowTimePnael_BasicDelayButton1.label = _arg_1;
            }, "_ShowTimePnael_BasicDelayButton1.label");
            result[1] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

