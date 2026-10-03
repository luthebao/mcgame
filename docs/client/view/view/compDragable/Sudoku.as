// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.Sudoku

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.ui.view.comp.SudokuCard;
    import flash.events.Event;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.event.GameDataEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.effects.EnterFrameMove;
    import com.qeedoo.ui.resource.ResManager;
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

    public class Sudoku extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _553906331cardBox:Canvas;
        private var _1328791778sudokuMoveTimes:RoundedLabel;
        private var inited:Boolean = false;
        private var SUDOKU_TOTAL_TIME:* = 30;
        private var cardArr:Array;
        private var panelOldCid:int = -1;
        public var _Sudoku_IntroText1:IntroText;
        public var _Sudoku_BasicDelayButton2:BasicDelayButton;
        private var monsterNum:int = 8;
        public var _Sudoku_Image1:Image;
        public var _Sudoku_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1716315195sudokuScore:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_Sudoku_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":285,
                                "height":285,
                                "x":14,
                                "y":40,
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_Sudoku_Image1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "1";
                                        this.left = "1";
                                        this.right = "1";
                                        this.bottom = "1";
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"_Sudoku_IntroText1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":285,
                                "height":155,
                                "x":14,
                                "y":330
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":380,
                                "height":445,
                                "x":302,
                                "y":40,
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"sudokuMoveTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "35";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "events":{"click":"___Sudoku_BasicDelayButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "34";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnAdd",
                                            "x":150
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"sudokuScore",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "35";
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"x":180});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"_Sudoku_BasicDelayButton2",
                                    "events":{"click":"___Sudoku_BasicDelayButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "32";
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":700,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"cardBox",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.right = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":360,
                                            "styleName":"CanvasBorder",
                                            "mouseEnabled":false
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
        private var cardPoint:Array = [10, 125, 240];
        private var SUDOKU_CLICK_RESTRICT_LIST:* = {
            "0":{
                "0":1,
                "1":3
            },
            "1":{
                "0":0,
                "1":2,
                "2":4
            },
            "2":{
                "0":1,
                "1":5
            },
            "3":{
                "0":0,
                "1":4,
                "2":6
            },
            "4":{
                "0":1,
                "1":3,
                "2":5,
                "3":7
            },
            "5":{
                "0":2,
                "1":4,
                "2":8
            },
            "6":{
                "0":3,
                "1":7
            },
            "7":{
                "0":4,
                "1":6,
                "2":8
            },
            "8":{
                "0":5,
                "1":7
            }
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function Sudoku()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 500;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            Sudoku._watcherSetupUtil = _arg_1;
        }


        private function _setCards(_arg_1:Array, _arg_2:int=-1):void
        {
            var _local_8:int;
            var _local_9:int;
            var _local_10:*;
            var _local_11:*;
            var _local_3:Boolean;
            cardArr = _arg_1;
            var _local_4:int = cardArr.length;
            var _local_5:int = -1;
            var _local_6:int = -1;
            if (((_arg_2 >= 0) && (_arg_2 < 9)))
            {
                _local_3 = true;
            };
            var _local_7:int;
            while (_local_7 < _local_4)
            {
                _local_8 = (_local_7 % 3);
                _local_9 = int(Math.floor((_local_7 / 3)));
                _local_10 = cardArr[_local_7];
                if (_local_10 == monsterNum)
                {
                    _local_5 = _local_7;
                };
                if (_local_10 == _arg_2)
                {
                    _local_6 = _local_7;
                };
                _local_11 = cardBox.getChildByName(String(_local_10));
                _local_11 = SudokuCard(_local_11);
                _local_11.initSudokuCard(_local_7, _local_10);
                _local_11.setTileEnable(false);
                _local_11.x = cardPoint[_local_8];
                _local_11.y = cardPoint[_local_9];
                if (((_local_3) && ((_local_7 == _local_6) || (_local_7 == _local_5))))
                {
                    _local_11.visible = false;
                };
                _local_7++;
            };
            if (_arg_2 < 0)
            {
                _setTileEnable(_local_5, cardArr);
            }
            else
            {
                _triggerTileMoveEffect(cardArr, _local_6, _local_5);
            };
        }

        private function moveCardEffectEndHandler(_arg_1:Event):void
        {
            var _local_2:* = cardBox.getChildByName(String(monsterNum));
            _local_2 = SudokuCard(_local_2);
            var _local_3:int = _local_2.cardIndex;
            _setTileEnable(_local_3, cardArr);
        }

        private function buy():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyTimesSudokuGame", null, _core.cid);
                };
            };
            var str:String = Language.SUMMER_GAME_PANEL[78];
            var _alert:Alert = Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        public function set sudokuScore(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1716315195sudokuScore;
            if (_local_2 !== _arg_1)
            {
                this._1716315195sudokuScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sudokuScore", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:Sudoku;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _Sudoku_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SudokuWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get sudokuMoveTimes():RoundedLabel
        {
            return (this._1328791778sudokuMoveTimes);
        }

        private function sudokuCardClickHandler(_arg_1:GameDataEvent):void
        {
            var _local_2:int = int(_arg_1.data);
            if (((_local_2 >= 0) && (_local_2 < 9)))
            {
                setCardsAvavilable(false);
                _core.remote.call("moveTileSudokuGame", null, _local_2);
            };
        }

        private function getAward():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("getSudokuGameAward", null, _core.cid);
                };
            };
            var str:String = Language.SUMMER_GAME_PANEL[79];
            var _alert:Alert = Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        private function setCardsAvavilable(_arg_1:Boolean):void
        {
            var _local_4:SudokuCard;
            var _local_2:Array = cardBox.getChildren();
            var _local_3:* = _local_2.length;
            if (_local_3 > 0)
            {
                for each (_local_4 in _local_2)
                {
                    _local_4.clickAvailable = _arg_1;
                };
            };
        }

        public function ___Sudoku_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            buy();
        }

        private function _initCards(_arg_1:*):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:*;
            var _local_8:SudokuCard;
            var _local_9:*;
            cardArr = _arg_1;
            var _local_2:int = cardArr.length;
            var _local_3:int = -1;
            var _local_4:int;
            while (_local_4 < _local_2)
            {
                _local_5 = (_local_4 % 3);
                _local_6 = int(Math.floor((_local_4 / 3)));
                _local_7 = cardArr[_local_4];
                if (_local_7 == monsterNum)
                {
                    _local_3 = _local_4;
                };
                _local_8 = new SudokuCard();
                _local_9 = cardBox.getChildByName(String(_local_7));
                _local_9 = SudokuCard(_local_9);
                if (_local_9)
                {
                    cardBox.removeChild(_local_9);
                    _local_9 = null;
                };
                cardBox.addChild(_local_8);
                _local_8.x = cardPoint[_local_5];
                _local_8.y = cardPoint[_local_6];
                _local_8.name = _local_7;
                _local_8.initSudokuCard(_local_4, _local_7);
                _local_8.setTileEnable(false);
                _local_4++;
            };
            _setTileEnable(_local_3, cardArr);
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

        public function set sudokuMoveTimes(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1328791778sudokuMoveTimes;
            if (_local_2 !== _arg_1)
            {
                this._1328791778sudokuMoveTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sudokuMoveTimes", _local_2, _arg_1));
            };
        }

        public function onGetSudokuGameAward(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.score >= 0)))
            {
                sudokuScore.text = (Language.SUMMER_GAME_PANEL[76] + String(_arg_1.score));
            };
        }

        public function onbuyTimesSudokuGame(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag)))
            {
                sudokuMoveTimes.text = Language.SUMMER_GAME_PANEL[74].replace("{left}", _arg_1.times).replace("{total}", SUDOKU_TOTAL_TIME);
            };
        }

        public function onMoveCardSudokuGame(_arg_1:Object):void
        {
            var _local_2:int;
            if (((_arg_1) && (_arg_1.flag == true)))
            {
                sudokuMoveTimes.text = Language.SUMMER_GAME_PANEL[74].replace("{left}", _arg_1.times).replace("{total}", SUDOKU_TOTAL_TIME);
                _local_2 = -1;
                if (((_arg_1.clickTileNum >= 0) && (_arg_1.clickTileNum < 9)))
                {
                    _local_2 = _arg_1.clickTileNum;
                };
                _setCards(_arg_1.data, _local_2);
            };
            if (((_arg_1) && (_arg_1.flag == false)))
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[13]);
                sudokuMoveTimes.text = Language.SUMMER_GAME_PANEL[74].replace("{left}", 0).replace("{total}", SUDOKU_TOTAL_TIME);
                _setCards(cardArr);
            };
        }

        private function _setTileEnable(_arg_1:int, _arg_2:Array):void
        {
            var _local_3:*;
            var _local_4:int;
            var _local_5:*;
            var _local_6:*;
            if (((_arg_1 >= 0) && (_arg_1 < 9)))
            {
                _local_3 = SUDOKU_CLICK_RESTRICT_LIST[_arg_1];
                for each (_local_4 in _local_3)
                {
                    _local_5 = _arg_2[_local_4];
                    if (_local_5 < 0)
                    {
                        return;
                    };
                    _local_6 = cardBox.getChildByName(String(_local_5));
                    _local_6 = SudokuCard(_local_6);
                    _local_6.setTileEnable(true);
                };
            };
        }

        override public function initView():void
        {
            _core.remote.call("getSudokuGameInfo", null);
            this.addEventListener("sudokuCardClick", sudokuCardClickHandler);
        }

        [Bindable(event="propertyChange")]
        public function get sudokuScore():RoundedLabel
        {
            return (this._1716315195sudokuScore);
        }

        private function _triggerTileMoveEffect(_arg_1:Array, _arg_2:int, _arg_3:int):void
        {
            if (((((_arg_1[_arg_2] < 0) || (_arg_1[_arg_2] > 8)) || (_arg_1[_arg_3] < 0)) || (_arg_1[_arg_3] > 8)))
            {
                return;
            };
            var _local_4:* = _arg_1[_arg_2];
            var _local_5:* = cardBox.getChildByName(String(_local_4));
            _local_5 = SudokuCard(_local_5);
            var _local_6:* = cardBox.getChildByName(String(monsterNum));
            _local_6 = SudokuCard(_local_6);
            var _local_7:int = _local_5.x;
            var _local_8:int = _local_5.y;
            _local_5.x = _local_6.x;
            _local_5.y = _local_6.y;
            _local_6.x = _local_7;
            _local_6.y = _local_8;
            _local_5.visible = (_local_6.visible = true);
            _local_5.setCardImg(1);
            var _local_9:EnterFrameMove = new EnterFrameMove();
            _local_9.target = _local_5;
            _local_9.stepLength = 20;
            _local_9.xBy = (_local_6.x - _local_5.x);
            _local_9.yBy = (_local_6.y - _local_5.y);
            _local_9.addEventListener(EnterFrameMove.EFFECT_END, moveCardEffectEndHandler);
            _local_9.play(true);
            var _local_10:EnterFrameMove = new EnterFrameMove();
            _local_10.target = _local_6;
            _local_10.stepLength = 20;
            _local_10.xBy = (_local_5.x - _local_6.x);
            _local_10.yBy = (_local_5.y - _local_6.y);
            _local_10.play(true);
        }

        public function onSudokuGetData(_arg_1:*):void
        {
            if (!_arg_1.flag)
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[7]);
                sudokuMoveTimes.text = Language.SUMMER_GAME_PANEL[74].replace("{left}", 0).replace("{total}", SUDOKU_TOTAL_TIME);
                sudokuScore.text = (Language.SUMMER_GAME_PANEL[76] + String(_arg_1.score));
                return;
            };
            sudokuMoveTimes.text = Language.SUMMER_GAME_PANEL[74].replace("{left}", _arg_1.times).replace("{total}", SUDOKU_TOTAL_TIME);
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

        public function ___Sudoku_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        private function _Sudoku_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[69];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Sudoku_BasicTitleCanvas1.text = _arg_1;
            }, "_Sudoku_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001129));
            }, function (_arg_1:Object):void
            {
                _Sudoku_Image1.source = _arg_1;
            }, "_Sudoku_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[75];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Sudoku_IntroText1.htmlText = _arg_1;
            }, "_Sudoku_IntroText1.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[74];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                sudokuMoveTimes.text = _arg_1;
            }, "sudokuMoveTimes.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[76];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                sudokuScore.text = _arg_1;
            }, "sudokuScore.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[70];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Sudoku_BasicDelayButton2.label = _arg_1;
            }, "_Sudoku_BasicDelayButton2.label");
            result[5] = binding;
            return (result);
        }

        private function _Sudoku_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SUMMER_GAME_PANEL[69];
            _local_1 = ResManager.getIconUrl(4130220001129);
            _local_1 = Language.SUMMER_GAME_PANEL[75];
            _local_1 = Language.SUMMER_GAME_PANEL[74];
            _local_1 = Language.SUMMER_GAME_PANEL[76];
            _local_1 = Language.SUMMER_GAME_PANEL[70];
        }


    }
}//package com.qeedoo.ui.view.compDragable

