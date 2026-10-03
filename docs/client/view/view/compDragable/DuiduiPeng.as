// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DuiduiPeng

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.ui.view.comp.DuiduipengCard;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.resource.ResManager;
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

    public class DuiduiPeng extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _DuiduiPeng_Image1:Image;
        private var _1910284839duiduipengMoveTimes:RoundedLabel;
        private var _553906331cardBox:Canvas;
        public var _DuiduiPeng_BasicTitleCanvas1:BasicTitleCanvas;
        private var DUIDUI_TOTAL_TIME:int = 10;
        public var isFlippingOver:Boolean = false;
        private var inited:Boolean = false;
        private var panelOldCid:int = -1;
        private var _1324207164duiduipengScore:RoundedLabel;
        private var _firstClickId:int = -1;
        public var isTimeZero:Boolean = false;
        public var _DuiduiPeng_IntroText1:IntroText;
        public var _DuiduiPeng_BasicDelayButton2:BasicDelayButton;
        private var cardsArr:Array;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":560,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_DuiduiPeng_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cardBox",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":320,
                                "height":380,
                                "x":15,
                                "y":40,
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":200,
                                "height":190,
                                "x":345,
                                "y":40,
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"duiduipengScore",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_DuiduiPeng_Image1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":90,
                                            "height":90,
                                            "y":33
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"duiduipengMoveTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "-10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":135});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "events":{"click":"___DuiduiPeng_BasicDelayButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "68";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnAdd",
                                            "y":134
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"_DuiduiPeng_BasicDelayButton2",
                                    "events":{"click":"___DuiduiPeng_BasicDelayButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":700,
                                            "styleName":"BtnStdGreen",
                                            "y":155
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"_DuiduiPeng_IntroText1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":200,
                                "height":180,
                                "x":345,
                                "y":237
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var cardPointsX:Array = [16, 92, 168, 244];
        private var cardPointsY:Array = [12, 104, 196, 288];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DuiduiPeng()
        {
            mx_internal::_document = this;
            this.width = 560;
            this.height = 430;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DuiduiPeng._watcherSetupUtil = _arg_1;
        }


        private function _setCards(_arg_1:*):void
        {
            var _local_2:*;
            var _local_3:int;
            var _local_4:int;
            var _local_5:*;
            var _local_6:*;
            cardsArr = _arg_1;
            for (_local_2 in cardsArr)
            {
                _local_3 = (_local_2 % 4);
                _local_4 = int(Math.floor((_local_2 / 4)));
                _local_5 = _local_2;
                _local_6 = cardBox.getChildByName(String(_local_5));
                _local_6 = DuiduipengCard(_local_6);
                _local_6.inited = false;
                _local_6.initDuiduipengCard(_local_2, cardsArr[_local_2]);
            };
        }

        public function onCheckMatchDuiduipengGame(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag == true)))
            {
                if (_arg_1.times < 1)
                {
                    isTimeZero = true;
                };
            };
            if (((_arg_1) && (_arg_1.flag == false)))
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[13]);
            };
            reverseCards(_arg_1.notMatched);
            _firstClickId = -1;
        }

        private function buy():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyTimesDuiduipengGame", null, _core.cid);
                };
            };
            var str:String = Language.SUMMER_GAME_PANEL[73];
            var _alert:Alert = Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        public function set duiduipengScore(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1324207164duiduipengScore;
            if (_local_2 !== _arg_1)
            {
                this._1324207164duiduipengScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "duiduipengScore", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:DuiduiPeng;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DuiduiPeng_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DuiduiPengWatcherSetupUtil");
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
        public function get cardBox():Canvas
        {
            return (this._553906331cardBox);
        }

        private function reverseCards(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            if (_arg_1)
            {
                if (((_arg_1.id1 < 0) || (_arg_1.id1 > 15)))
                {
                    return;
                };
                _local_2 = cardBox.getChildByName(String(_arg_1.id1));
                if (_local_2)
                {
                    _local_2 = DuiduipengCard(_local_2);
                }
                else
                {
                    _local_2 = null;
                };
                _local_3 = cardBox.getChildByName(String(_arg_1.id2));
                if (_local_3)
                {
                    _local_3 = DuiduipengCard(_local_3);
                }
                else
                {
                    _local_3 = null;
                };
                ((_local_2) && (_local_2.flipCard(false)));
                ((_local_3) && (_local_3.flipCard(false)));
            }
            else
            {
                isFlippingOver = false;
            };
        }

        private function setCardsAvavilable(_arg_1:Boolean):void
        {
            var _local_4:DuiduipengCard;
            var _local_2:Array = cardBox.getChildren();
            var _local_3:* = _local_2.length;
            if (_local_3 > 0)
            {
                for each (_local_4 in _local_2)
                {
                    _local_4.setDuiduiCardEnable(_arg_1);
                };
            };
        }

        public function onbuyTimesDuiduipengGame(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag)))
            {
                duiduipengMoveTimes.text = Language.SUMMER_GAME_PANEL[77].replace("{left}", _arg_1.times).replace("{total}", DUIDUI_TOTAL_TIME);
                isTimeZero = false;
            };
        }

        public function ___DuiduiPeng_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            buy();
        }

        public function onDuiduipengGetData(_arg_1:Object):void
        {
            if (!_arg_1.flag)
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[7]);
                duiduipengMoveTimes.text = Language.SYSTEMSHOPPANEL_U[58];
                duiduipengScore.text = (Language.SUMMER_GAME_PANEL[76] + String(_arg_1.score));
                setCardsAvavilable(false);
                return;
            };
            duiduipengMoveTimes.text = Language.SUMMER_GAME_PANEL[77].replace("{left}", _arg_1.times).replace("{total}", DUIDUI_TOTAL_TIME);
            duiduipengScore.text = (Language.SUMMER_GAME_PANEL[76] + String(_arg_1.score));
            if (((!(inited)) || ((panelOldCid < 0) || (!(_core.cid == panelOldCid)))))
            {
                _initCards(_arg_1.data);
                inited = true;
                panelOldCid = _core.cid;
            }
            else
            {
                _setCards(_arg_1.data);
            };
        }

        private function _initCards(_arg_1:*):void
        {
            var _local_2:*;
            var _local_3:int;
            var _local_4:int;
            var _local_5:*;
            var _local_6:DuiduipengCard;
            var _local_7:*;
            cardsArr = _arg_1;
            for (_local_2 in cardsArr)
            {
                _local_3 = (_local_2 % 4);
                _local_4 = int(Math.floor((_local_2 / 4)));
                _local_5 = _local_2;
                _local_6 = new DuiduipengCard();
                _local_7 = cardBox.getChildByName(String(_local_5));
                _local_7 = DuiduipengCard(_local_7);
                if (_local_7)
                {
                    cardBox.removeChild(_local_7);
                    _local_7 = null;
                };
                cardBox.addChild(_local_6);
                _local_6.x = cardPointsX[_local_3];
                _local_6.y = cardPointsY[_local_4];
                _local_6.name = _local_2;
                _local_6.initDuiduipengCard(_local_2, cardsArr[_local_2]);
            };
        }

        private function _DuiduiPeng_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DuiduiPeng_BasicTitleCanvas1.text = _arg_1;
            }, "_DuiduiPeng_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[76];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                duiduipengScore.text = _arg_1;
            }, "duiduipengScore.text");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001139));
            }, function (_arg_1:Object):void
            {
                _DuiduiPeng_Image1.source = _arg_1;
            }, "_DuiduiPeng_Image1.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[77];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                duiduipengMoveTimes.text = _arg_1;
            }, "duiduipengMoveTimes.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[70];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DuiduiPeng_BasicDelayButton2.label = _arg_1;
            }, "_DuiduiPeng_BasicDelayButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DuiduiPeng_IntroText1.htmlText = _arg_1;
            }, "_DuiduiPeng_IntroText1.htmlText");
            result[5] = binding;
            return (result);
        }

        private function getAward():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("getDuiduipengGameAward", null, _core.cid);
                };
            };
            var str:String = Language.SUMMER_GAME_PANEL[80];
            var _alert:Alert = Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        public function set cardBox(_arg_1:Canvas):void
        {
            var _local_2:Object = this._553906331cardBox;
            if (_local_2 !== _arg_1)
            {
                this._553906331cardBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardBox", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get duiduipengMoveTimes():RoundedLabel
        {
            return (this._1910284839duiduipengMoveTimes);
        }

        public function onGetDuiduipengGameAward(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.score >= 0)))
            {
                duiduipengScore.text = (Language.SUMMER_GAME_PANEL[76] + String(_arg_1.score));
            };
        }

        override public function initView():void
        {
            _core.remote.call("getDuiduipengGameInfo", null);
            this.addEventListener("duiduipengCardClick", duiduipengCardClickHandler);
        }

        private function _DuiduiPeng_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SUMMER_GAME_PANEL[71];
            _local_1 = Language.SUMMER_GAME_PANEL[76];
            _local_1 = ResManager.getIconUrl(4130220001139);
            _local_1 = Language.SUMMER_GAME_PANEL[77];
            _local_1 = Language.SUMMER_GAME_PANEL[70];
            _local_1 = Language.SUMMER_GAME_PANEL[72];
        }

        [Bindable(event="propertyChange")]
        public function get duiduipengScore():RoundedLabel
        {
            return (this._1324207164duiduipengScore);
        }

        public function set duiduipengMoveTimes(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1910284839duiduipengMoveTimes;
            if (_local_2 !== _arg_1)
            {
                this._1910284839duiduipengMoveTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "duiduipengMoveTimes", _local_2, _arg_1));
            };
        }

        private function duiduipengCardClickHandler(_arg_1:GameDataEvent):void
        {
            var _local_3:Object;
            var _local_2:int = int(_arg_1.data);
            if (_firstClickId == _local_2)
            {
                return;
            };
            if (((_firstClickId >= 0) && (_local_2 >= 0)))
            {
                _local_3 = {};
                _local_3.id1 = _firstClickId;
                _local_3.id2 = _local_2;
                _core.remote.call("checkMatchDuiduipengGame", null, _local_3);
            }
            else
            {
                _firstClickId = _local_2;
                isFlippingOver = false;
                _local_3 = {};
                _local_3.id1 = _firstClickId;
                _local_3.id2 = -1;
                _core.remote.call("minusDuiduipengGame", null, _local_3);
            };
        }

        public function ___DuiduiPeng_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        public function onMinusTimeDuiduipengGame(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag == false)))
            {
                duiduipengMoveTimes.text = Language.SUMMER_GAME_PANEL[77].replace("{left}", _arg_1.times).replace("{total}", DUIDUI_TOTAL_TIME);
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

