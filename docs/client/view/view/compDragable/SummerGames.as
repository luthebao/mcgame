// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SummerGames

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.MonopolyPlayerView;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import flash.display.Loader;
    import mx.controls.TextArea;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.Event;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.display.MovieClip;
    import mx.events.FlexEvent;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import com.qeedoo.ui.resource.ResManager;
    import mx.core.UIComponent;
    import flash.display.SimpleButton;
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

    public class SummerGames extends DragableCanvas implements IBindingClient 
    {

        public static var positions:Array = [[65, 185, 3], [110, 160, 3], [155, 135, 3], [200, 110, 3], [245, 85, 3], [290, 60, 1], [335, 85, 1], [380, 110, 1], [425, 135, 1], [470, 160, 7], [425, 185, 7], [380, 210, 7], [335, 235, 7], [290, 260, 7], [245, 285, 5], [200, 260, 5], [155, 235, 5], [110, 210, 5]];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var step_num:int = 0;
        public var _SummerGames_Image1:Image;
        public var _SummerGames_Label2:Label;
        private var _3034519btns:Canvas;
        private var _985752863player:MonopolyPlayerView;
        private var _2116189043itemNum:int = 0;
        private var _1927556941summerScoreTxt:Label;
        public var _SummerGames_BasicTitleCanvas1:BasicTitleCanvas;
        private var _132684933rankAwardOpen:Boolean = false;
        private var moving:Boolean = false;
        public var _SummerGames_BasicGlowButton2:BasicGlowButton;
        public var _SummerGames_BasicGlowButton3:BasicGlowButton;
        public var _SummerGames_BasicGlowButton1:BasicGlowButton;
        private var _1819703622shaiziNum:Label;
        private var load:Loader;
        private var _3343801main:Canvas;
        private var _993538143recordTxt:TextArea;
        private var load_state:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SummerGames_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":11,
                                "y":38,
                                "width":680,
                                "height":448,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"main",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":3,
                                            "width":530,
                                            "height":320,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SummerGames_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2,
                                                        "y":2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"shaiziNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":480,
                                                        "y":265,
                                                        "width":45,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":MonopolyPlayerView,
                                                "id":"player",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":35
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":538,
                                            "y":3,
                                            "width":130,
                                            "height":320,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_SummerGames_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "10";
                                                    this.textAlign = "center";
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"summerScoreTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "22";
                                                    this.textAlign = "center";
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.strokeColor = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":40,
                                                        "width":106,
                                                        "height":1
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"recordTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.leading = 0;
                                                    this.fontSize = 12;
                                                    this.borderThickness = 0;
                                                    this.backgroundAlpha = 0;
                                                    this.color = 0xFFFF;
                                                    this.left = "5";
                                                    this.right = "5";
                                                    this.top = "45";
                                                    this.bottom = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "wordWrap":true,
                                                        "selectable":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"btns",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":325,
                                            "width":660,
                                            "height":118,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_SummerGames_BasicGlowButton1",
                                                "events":{"click":"___SummerGames_BasicGlowButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":300,
                                                        "y":12,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_SummerGames_BasicGlowButton2",
                                                "events":{"click":"___SummerGames_BasicGlowButton2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":430,
                                                        "y":12,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_SummerGames_BasicGlowButton3",
                                                "events":{"click":"___SummerGames_BasicGlowButton3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":560,
                                                        "y":12,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            })]
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
        private var recordArr:Array = [];
        private var shaiziArr:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SummerGames()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 500;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___SummerGames_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SummerGames._watcherSetupUtil = _arg_1;
        }


        public function ___SummerGames_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            getHorseRankAward();
        }

        public function set main(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3343801main;
            if (_local_2 !== _arg_1)
            {
                this._3343801main = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "main", _local_2, _arg_1));
            };
        }

        public function getWastelandRankAward():void
        {
            _core.remote.call("wastelandGetRankAward", null);
        }

        private function gameHorseRace(_arg_1:MouseEvent):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_SUMMER_GAME_HORSE_RACE);
            if (_local_2)
            {
                _local_2.showPanel();
            };
        }

        private function shaiziComplete(_arg_1:Event):void
        {
            player.startMove(step_num);
        }

        public function showPanel():void
        {
            if (Number(_core.lineInfo.id) != 2)
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[14]);
                return;
            };
            initView();
            visible = true;
        }

        private function set itemNum(_arg_1:int):void
        {
            var _local_2:Object = this._2116189043itemNum;
            if (_local_2 !== _arg_1)
            {
                this._2116189043itemNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rankAwardOpen():Boolean
        {
            return (this._132684933rankAwardOpen);
        }

        private function refreshRecord():void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:int;
            var _local_9:String;
            recordTxt.htmlText = "";
            if (((!(recordArr)) || (recordArr.length == 0)))
            {
                return;
            };
            recordArr.reverse();
            var _local_1:* = "";
            var _local_2:int;
            while (_local_2 < recordArr.length)
            {
                _local_3 = recordArr[_local_2];
                _local_4 = _local_3["type"];
                _local_5 = _local_3["data"];
                if (_local_4 == 1)
                {
                    _local_1 = (_local_1 + (((Language.SUMMER_GAME_PANEL[33] + _local_5) + Language.SUMMER_GAME_PANEL[34]) + "\r\n"));
                }
                else
                {
                    if (_local_4 == 2)
                    {
                        _local_6 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_5];
                        _local_7 = _local_3["num"];
                        _local_8 = _local_3["q"];
                        _local_8 = int(Math.ceil((_local_8 / 5)));
                        if (_local_6.color >= 0)
                        {
                            _local_8 = (_local_6.color * 5);
                        };
                        _local_9 = GamePredef.MSG_ITEM_COLOR[_local_8];
                        if (_local_6.kind == GamePredef.ITEM_KIND_MATERIAL)
                        {
                            _local_1 = (_local_1 + (((((((((((Language.SUMMER_GAME_PANEL[37] + "<font color='") + _local_9) + "'>") + _local_6.name) + "[") + GamePredef.POSTFIX_MATERIAL_NAME[_local_8]) + "]") + "</font>") + "*") + _local_7) + "\r\n"));
                        }
                        else
                        {
                            _local_1 = (_local_1 + ((((((((Language.SUMMER_GAME_PANEL[37] + "<font color='") + _local_9) + "'>") + _local_6.name) + "</font>") + "*") + _local_7) + "\r\n"));
                        };
                    }
                    else
                    {
                        if (_local_4 == 3)
                        {
                            _local_1 = (_local_1 + (((Language.SUMMER_GAME_PANEL[35] + _local_5) + Language.SUMMER_GAME_PANEL[36]) + "\r\n"));
                        }
                        else
                        {
                            if (_local_4 == 4)
                            {
                            };
                        };
                    };
                };
                _local_2++;
            };
            recordTxt.htmlText = _local_1;
        }

        private function init():void
        {
            player.addEventListener("move_end", playerMpveEnd);
        }

        private function gameThreeDiabetes(_arg_1:MouseEvent):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_SUMMER_GAME_DIABETES);
            if (_local_2)
            {
                _local_2.showPanel();
            };
        }

        public function onItemNum(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(initialized))))
            {
                return;
            };
            itemNum = _arg_1["itemNum"];
            var _local_2:Boolean = _arg_1["close"];
            if (_local_2)
            {
                visible = false;
            };
        }

        override public function initialize():void
        {
            var target:SummerGames;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SummerGames_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SummerGamesWatcherSetupUtil");
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

        public function getDiabetesRankAward():void
        {
            _core.remote.call("diabetesGetRankAward", null);
        }

        private function shaiziE(_arg_1:int):void
        {
            var _local_2:MovieClip;
            _local_2 = shaiziArr[(_arg_1 - 1)];
            if (!_local_2)
            {
                return;
            };
            var _local_3:int;
            while (_local_3 < shaiziArr.length)
            {
                _local_2 = shaiziArr[_local_3];
                if ((_local_3 + 1) == _arg_1)
                {
                    _local_2.visible = true;
                    _local_2.gotoAndPlay(1);
                }
                else
                {
                    _local_2.visible = false;
                };
                _local_3++;
            };
        }

        public function set summerScoreTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1927556941summerScoreTxt;
            if (_local_2 !== _arg_1)
            {
                this._1927556941summerScoreTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "summerScoreTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btns():Canvas
        {
            return (this._3034519btns);
        }

        public function set shaiziNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1819703622shaiziNum;
            if (_local_2 !== _arg_1)
            {
                this._1819703622shaiziNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shaiziNum", _local_2, _arg_1));
            };
        }

        public function onRecordRefresh(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            recordArr = (_arg_1 as Array);
            refreshRecord();
        }

        private function onGo(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                moving = false;
                return;
            };
            if (!_arg_1["flag"])
            {
                visible = false;
                return;
            };
            step_num = _arg_1["num"];
            itemNum = int(_arg_1["itemNum"]);
            trace((" 移动至 :" + step_num));
            shaiziE(step_num);
        }

        public function ___SummerGames_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set btns(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3034519btns;
            if (_local_2 !== _arg_1)
            {
                this._3034519btns = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btns", _local_2, _arg_1));
            };
        }

        private function getMonopolyRes():void
        {
            if (load_state != 0)
            {
                _core.remote.call("summerGameMonopoly", null);
                return;
            };
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2080130000468)));
                load_state = 1;
            };
        }

        public function set recordTxt(_arg_1:TextArea):void
        {
            var _local_2:Object = this._993538143recordTxt;
            if (_local_2 !== _arg_1)
            {
                this._993538143recordTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recordTxt", _local_2, _arg_1));
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_12:Class;
            var _local_13:MovieClip;
            var _local_2:UIComponent = new UIComponent();
            var _local_3:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("game1") as Class);
            var _local_4:MovieClip = new (_local_3)();
            _local_2 = new UIComponent();
            _local_2.addChild(_local_4);
            _local_4.addEventListener(MouseEvent.CLICK, gameHorseRace);
            _local_2.x = 270;
            _local_2.y = 3;
            btns.addChildAt(_local_2, 0);
            var _local_5:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("game2") as Class);
            var _local_6:MovieClip = new (_local_5)();
            _local_2 = new UIComponent();
            _local_2.addChild(_local_6);
            _local_6.addEventListener(MouseEvent.CLICK, gameWasteland);
            _local_2.x = 400;
            _local_2.y = 3;
            btns.addChildAt(_local_2, 0);
            var _local_7:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("game3") as Class);
            var _local_8:MovieClip = new (_local_7)();
            _local_2 = new UIComponent();
            _local_2.addChild(_local_8);
            _local_8.addEventListener(MouseEvent.CLICK, gameThreeDiabetes);
            _local_2.x = 530;
            _local_2.y = 3;
            btns.addChildAt(_local_2, 0);
            var _local_9:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("info") as Class);
            var _local_10:MovieClip = new (_local_9)();
            _local_2 = new UIComponent();
            _local_2.addChild(_local_10);
            _local_2.x = 25;
            _local_2.y = 35;
            btns.addChild(_local_2);
            var _local_11:int;
            while (_local_11 < 6)
            {
                _local_12 = (load.contentLoaderInfo.applicationDomain.getDefinition(("shaizi" + (_local_11 + 1))) as Class);
                _local_13 = new (_local_12)();
                _local_2 = new UIComponent();
                _local_2.x = 22;
                _local_2.y = -111;
                _local_13.visible = (_local_11 == 0);
                _local_13.gotoAndStop(_local_13.totalFrames);
                _local_13.addEventListener("complete", shaiziComplete);
                _local_2.addEventListener(MouseEvent.CLICK, go);
                shaiziArr.push(_local_13);
                _local_2.addChild(_local_13);
                main.addChildAt(_local_2, 1);
                _local_11++;
            };
            load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            init();
            _core.remote.call("summerGameMonopoly", null);
        }

        public function onGetData(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(_arg_1.flag))))
            {
                rankAwardOpen = _arg_1["rankAwardOpen"];
                return;
            };
            trace((" start :" + _arg_1["data"]["index"]));
            rankAwardOpen = _arg_1["rankAwardOpen"];
            player.refresh(_arg_1["data"]["index"]);
            recordArr = _arg_1["data"]["record"];
            itemNum = int(_arg_1["itemNum"]);
            refreshRecord();
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" summerGames load res Error ");
        }

        private function playerMpveEnd(_arg_1:Event):void
        {
            moving = false;
        }

        public function ___SummerGames_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            getWastelandRankAward();
        }

        private function gameWasteland(_arg_1:MouseEvent):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_SUMMER_GAME_WASTELAND);
            if (_local_2)
            {
                _local_2.showPanel();
            };
        }

        [Bindable(event="propertyChange")]
        public function get summerScoreTxt():Label
        {
            return (this._1927556941summerScoreTxt);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            getMonopolyRes();
        }

        public function boxAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:int = _arg_1["score"];
            var _local_3:Boolean = _arg_1["isStart"];
            var _local_4:int = _arg_1["item"];
            var _local_5:int = _arg_1["go"];
            if (_local_5 > 0)
            {
                trace((" 继续前进 :" + _local_5));
                player.startMove(_local_5);
            };
            recordArr = _arg_1["record"];
            refreshRecord();
        }

        private function _SummerGames_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SummerGames_BasicTitleCanvas1.text = _arg_1;
            }, "_SummerGames_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000477));
            }, function (_arg_1:Object):void
            {
                _SummerGames_Image1.source = _arg_1;
            }, "_SummerGames_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = itemNum;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                shaiziNum.text = _arg_1;
            }, "shaiziNum.text");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                shaiziNum.filters = _arg_1;
            }, "shaiziNum.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SummerGames_Label2.text = _arg_1;
            }, "_SummerGames_Label2.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _SummerGames_Label2.filters = _arg_1;
            }, "_SummerGames_Label2.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.summerGameScore2015;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                summerScoreTxt.text = _arg_1;
            }, "summerScoreTxt.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                summerScoreTxt.filters = _arg_1;
            }, "summerScoreTxt.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                recordTxt.filters = _arg_1;
            }, "recordTxt.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (rankAwardOpen);
            }, function (_arg_1:Boolean):void
            {
                _SummerGames_BasicGlowButton1.visible = _arg_1;
            }, "_SummerGames_BasicGlowButton1.visible");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SummerGames_BasicGlowButton1.label = _arg_1;
            }, "_SummerGames_BasicGlowButton1.label");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (rankAwardOpen);
            }, function (_arg_1:Boolean):void
            {
                _SummerGames_BasicGlowButton2.visible = _arg_1;
            }, "_SummerGames_BasicGlowButton2.visible");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SummerGames_BasicGlowButton2.label = _arg_1;
            }, "_SummerGames_BasicGlowButton2.label");
            result[12] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (rankAwardOpen);
            }, function (_arg_1:Boolean):void
            {
                _SummerGames_BasicGlowButton3.visible = _arg_1;
            }, "_SummerGames_BasicGlowButton3.visible");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SummerGames_BasicGlowButton3.label = _arg_1;
            }, "_SummerGames_BasicGlowButton3.label");
            result[14] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get shaiziNum():Label
        {
            return (this._1819703622shaiziNum);
        }

        [Bindable(event="propertyChange")]
        public function get player():MonopolyPlayerView
        {
            return (this._985752863player);
        }

        public function getHorseRankAward():void
        {
            _core.remote.call("horseRaceGetRankAward", null);
        }

        public function set player(_arg_1:MonopolyPlayerView):void
        {
            var _local_2:Object = this._985752863player;
            if (_local_2 !== _arg_1)
            {
                this._985752863player = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "player", _local_2, _arg_1));
            };
        }

        private function _SummerGames_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SUMMER_GAME_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220000477);
            _local_1 = itemNum;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.SUMMER_GAME_PANEL[32];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = _core.player.summerGameScore2015;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = rankAwardOpen;
            _local_1 = Language.SUMMER_GAME_PANEL[68];
            _local_1 = rankAwardOpen;
            _local_1 = Language.SUMMER_GAME_PANEL[68];
            _local_1 = rankAwardOpen;
            _local_1 = Language.SUMMER_GAME_PANEL[68];
        }

        private function go(_arg_1:MouseEvent):void
        {
            if (!(_arg_1.target is SimpleButton))
            {
                return;
            };
            if (moving)
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[67]);
                return;
            };
            moving = true;
            _core.remote.call("monopolyGo", new Responder(onGo));
        }

        [Bindable(event="propertyChange")]
        private function get itemNum():int
        {
            return (this._2116189043itemNum);
        }

        [Bindable(event="propertyChange")]
        public function get recordTxt():TextArea
        {
            return (this._993538143recordTxt);
        }

        public function ___SummerGames_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            getDiabetesRankAward();
        }

        public function set rankAwardOpen(_arg_1:Boolean):void
        {
            var _local_2:Object = this._132684933rankAwardOpen;
            if (_local_2 !== _arg_1)
            {
                this._132684933rankAwardOpen = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankAwardOpen", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get main():Canvas
        {
            return (this._3343801main);
        }


    }
}//package com.qeedoo.ui.view.compDragable

