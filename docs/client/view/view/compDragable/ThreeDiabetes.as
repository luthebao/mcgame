// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ThreeDiabetes

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.ThreeDiabetesBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponent;
    import mx.controls.Image;
    import mx.containers.Canvas;
    import flash.utils.Dictionary;
    import flash.display.Bitmap;
    import flash.display.Loader;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.display.Sprite;
    import com.qeedoo.game.config.Language;
    import flash.display.BitmapData;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import com.qeedoo.effects.EnterFrameMove;
    import flash.display.MovieClip;
    import flash.geom.Matrix;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import flash.net.URLRequest;
    import flash.geom.Rectangle;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class ThreeDiabetes extends DragableCanvas implements IBindingClient 
    {

        public static var rects:Array = [];
        private static const EFFECT_BM_WIDTH:Number = 400;
        private static const EFFECT_BM_HEIGHT:Number = 400;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _ThreeDiabetes_BasicGlowButton1:BasicGlowButton;
        private var diabetes:Boolean = false;
        private var rankData:Array;
        public var _ThreeDiabetes_Label2:Label;
        private var steps:Array;
        private var _115312txt:IntroText;
        private var moveBox1:ThreeDiabetesBox;
        private var moveBox2:ThreeDiabetesBox;
        public var _ThreeDiabetes_BasicTitleCanvas1:BasicTitleCanvas;
        private var _485512578scoreTxt:Label;
        private var _145245136container1:UIComponent;
        public var _ThreeDiabetes_Image1:Image;
        public var _ThreeDiabetes_Image2:Image;
        private var stepData:Object;
        private var _549570497canMove:Boolean = true;
        private var _106433028panel:Canvas;
        private var effect_arr:Array;
        private var boxes:Dictionary;
        private var effect_bm:Bitmap;
        private var wData:Object;
        private var _1975768049leftNumTxt:Label;
        private var load:Loader;
        private var _321863295refreshBtn:BasicGlowButton;
        private var moveNum:int = 0;
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
                        "id":"_ThreeDiabetes_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "38";
                            this.bottom = "16";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":290,
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":320,
                                            "height":290,
                                            "x":8,
                                            "y":8,
                                            "styleName":"CanvasBorder",
                                            "mouseEnabled":false,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_ThreeDiabetes_Image1"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":320,
                                            "height":130,
                                            "x":8,
                                            "y":300,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"txt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "5";
                                                    this.top = "5";
                                                    this.right = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":115,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"panel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":336,
                                            "height":422,
                                            "x":334,
                                            "y":8,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_ThreeDiabetes_Image2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2,
                                                        "y":2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":UIComponent,
                                                "id":"container1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "width":300,
                                                        "height":300,
                                                        "x":18,
                                                        "y":49
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"leftNumTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "24";
                                                    this.left = "140";
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":40});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "events":{"click":"___ThreeDiabetes_BasicDelayButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "24";
                                                    this.left = "163";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"styleName":"BtnAdd"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_ThreeDiabetes_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "24";
                                                    this.left = "185";
                                                    this.color = 0xFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":75});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"scoreTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "24";
                                                    this.left = "260";
                                                    this.color = 0xFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":70});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_ThreeDiabetes_BasicGlowButton1",
                                                "events":{"click":"___ThreeDiabetes_BasicGlowButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "5";
                                                    this.top = "15";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"styleName":"BtnStdRed"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"refreshBtn",
                                                "events":{"click":"__refreshBtn_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":270,
                                                        "y":362,
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
        public var effects:Array = [];
        private var _core:Core = Core.getInstance();
        private var moveHandlers:Array = [];
        private var _978091684rankTxt:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ThreeDiabetes()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 500;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ThreeDiabetes._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get leftNumTxt():Label
        {
            return (this._1975768049leftNumTxt);
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        public function set panel(_arg_1:Canvas):void
        {
            var _local_2:Object = this._106433028panel;
            if (_local_2 !== _arg_1)
            {
                this._106433028panel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panel", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            var _local_2:Sprite;
            var _local_3:UIComponent;
            var _local_5:int;
            var _local_6:int;
            var _local_7:ThreeDiabetesBox;
            txt.htmlText = Language.SUMMER_GAME_PANEL[19];
            boxes = new Dictionary();
            var _local_1:int;
            while (_local_1 < (6 * 2))
            {
                _local_5 = 0;
                while (_local_5 < 6)
                {
                    _local_6 = ((_local_1 * 6) + _local_5);
                    _local_7 = new ThreeDiabetesBox();
                    _local_7.setIndex(_local_6);
                    _local_7.setParam(false, 1);
                    _local_7.setType(-1);
                    _local_7.x = (50 * _local_5);
                    _local_7.y = ((50 * _local_1) - 300);
                    boxes[_local_6] = _local_7;
                    container1.addChild(_local_7);
                    _local_5++;
                };
                _local_1++;
            };
            _local_2 = new Sprite();
            _local_2.graphics.beginFill(0xFFFFFF, 1);
            _local_2.graphics.drawRect(0, 0, 300, 300);
            _local_2.graphics.endFill();
            _local_3 = new UIComponent();
            _local_3.x = container1.x;
            _local_3.y = container1.y;
            _local_3.addChild(_local_2);
            panel.addChild(_local_3);
            container1.mask = _local_2;
            effect_bm = new Bitmap(new BitmapData(EFFECT_BM_WIDTH, EFFECT_BM_HEIGHT, true, 0xFFFFFF));
            effect_bm.x = (container1.x - 50);
            effect_bm.y = (container1.y - 50);
            var _local_4:UIComponent = new UIComponent();
            _local_4.addChild(effect_bm);
            _local_4.mouseChildren = false;
            _local_4.mouseEnabled = false;
            panel.addChild(_local_4);
        }

        public function set refreshBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._321863295refreshBtn;
            if (_local_2 !== _arg_1)
            {
                this._321863295refreshBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get panel():Canvas
        {
            return (this._106433028panel);
        }

        public function set scoreTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._485512578scoreTxt;
            if (_local_2 !== _arg_1)
            {
                this._485512578scoreTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreTxt", _local_2, _arg_1));
            };
        }

        private function _ThreeDiabetes_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SUMMER_GAME_PANEL[9];
            _local_1 = ResManager.getIconUrl(4130220000726);
            _local_1 = ResManager.getIconUrl(4130220000478);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.SUMMER_GAME_PANEL[18];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.SUMMER_GAME_PANEL[16];
            _local_1 = canMove;
            _local_1 = Language.SUMMER_GAME_PANEL[11];
        }

        private function onBuy(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Boolean = _arg_1["flag"];
            if (_local_2)
            {
                wData.leftNum = _arg_1["num"];
                leftNumTxt.text = wData.leftNum;
            }
            else
            {
                this.visible = false;
            };
        }

        public function __refreshBtn_click(_arg_1:MouseEvent):void
        {
            allRefresh();
        }

        public function checkDiabetes(_arg_1:int, _arg_2:int):void
        {
            if (!canMove)
            {
                return;
            };
            if (((wData) && (int(wData.leftNum) == 0)))
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[13]);
                return;
            };
            if (((!(moveBox1 == null)) || (!(moveBox2 == null))))
            {
                return;
            };
            moveBox1 = boxes[_arg_1];
            moveBox2 = boxes[_arg_2];
            swapBoxes(moveEndHandler);
        }

        private function dropDown():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:ThreeDiabetesBox;
            var _local_8:EnterFrameMove;
            var _local_1:int;
            while (_local_1 < 6)
            {
                _local_2 = ((11 * 6) + _local_1);
                _local_3 = 11;
                _local_4 = 0;
                _local_5 = 0;
                while (_local_5 < 12)
                {
                    _local_6 = (_local_2 - (_local_5 * 6));
                    _local_7 = boxes[_local_6];
                    if (!_local_7)
                    {
                        _local_4++;
                    }
                    else
                    {
                        if (_local_4 > 0)
                        {
                            moveNum++;
                            _local_8 = new EnterFrameMove();
                            _local_8.target = _local_7;
                            _local_8.stepLength = 10;
                            _local_8.xBy = 0;
                            _local_8.yBy = (50 * _local_4);
                            boxes[_local_6] = null;
                            boxes[(_local_6 + (_local_4 * 6))] = _local_7;
                            _local_7.setIndex((_local_6 + (_local_4 * 6)));
                            _local_8.addEventListener(EnterFrameMove.EFFECT_END, stepMoveEnd);
                            _local_8.play(true);
                            moveHandlers.push(_local_8);
                        };
                    };
                    _local_5++;
                };
                _local_1++;
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_8:Class;
            var _local_9:MovieClip;
            var _local_10:BitmapData;
            var _local_11:BitmapData;
            var _local_2:Array = ["yellow", "blue", "green", "zi", "red", "bomb", "num2"];
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_8 = (load.contentLoaderInfo.applicationDomain.getDefinition(_local_2[_local_3]) as Class);
                _local_9 = new (_local_8)();
                _local_10 = new BitmapData(_local_9.width, _local_9.height, true, 0xFFFFFF);
                _local_10.draw(_local_9);
                rects[_local_3] = _local_10;
                _local_3++;
            };
            var _local_4:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("bomb_eff") as Class);
            var _local_5:MovieClip = new (_local_4)();
            var _local_6:Matrix = new Matrix();
            var _local_7:int = 1;
            while (_local_7 <= _local_5.totalFrames)
            {
                _local_5.gotoAndStop(_local_7);
                if ((_local_5.width * _local_5.height) > 0)
                {
                    _local_11 = new BitmapData(_local_5.width, _local_5.height, true, 0xFFFFFF);
                    _local_6.tx = 200;
                    _local_6.ty = 200;
                    _local_11.draw(_local_5, _local_6);
                    effects[(_local_7 - 1)] = _local_11;
                };
                _local_7++;
            };
            load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            init();
            _core.remote.call("summerGameDiabetes", null);
        }

        public function onGetData(_arg_1:Object):void
        {
            var _local_3:String;
            var _local_4:EnterFrameMove;
            if (!_arg_1)
            {
                return;
            };
            if (!_arg_1["data"])
            {
                visible = false;
                return;
            };
            clean();
            if (!_arg_1["flag"])
            {
                _local_3 = Language.SUMMER_GAME_PANEL[56];
                Alert.show(_local_3, "", Alert.YES, null);
            };
            var _local_2:int;
            while (_local_2 < moveHandlers.length)
            {
                _local_4 = moveHandlers[_local_2];
                if (_local_4)
                {
                    _local_4.stop();
                    _local_4.destroy();
                };
                _local_2++;
            };
            moveHandlers.length = 0;
            wData = _arg_1["data"];
            leftNumTxt.text = wData.leftNum;
            scoreTxt.text = (Math.floor((int(wData.score) * 10)) / 10).toString();
            canMove = true;
            refreshLand(wData["data"]);
            checkPosition();
        }

        private function checkDiabete(_arg_1:int):Boolean
        {
            var _local_4:Object;
            var _local_2:Object = wData["data"][_arg_1];
            var _local_3:int = 1;
            _local_4 = wData["data"][(_arg_1 - 6)];
            while (((_local_4) && (_local_4.type == _local_2.type)))
            {
                _local_3++;
                if ((_local_4.index - 6) < 36) break;
                _local_4 = wData["data"][(_local_4.index - 6)];
            };
            _local_4 = wData["data"][(_arg_1 + 6)];
            while (((_local_4) && (_local_4.type == _local_2.type)))
            {
                _local_3++;
                _local_4 = wData["data"][(_local_4.index + 6)];
            };
            if (_local_3 >= 3)
            {
                return (true);
            };
            _local_3 = 1;
            _local_4 = wData["data"][(_arg_1 - 1)];
            while ((((_local_4) && (_local_4.type == _local_2.type)) && (!(((_local_4.index + 1) % 6) == 0))))
            {
                _local_3++;
                _local_4 = wData["data"][(_local_4.index - 1)];
            };
            _local_4 = wData["data"][(_arg_1 + 1)];
            while ((((_local_4) && (_local_4.type == _local_2.type)) && (!((_local_4.index % 6) == 0))))
            {
                _local_3++;
                _local_4 = wData["data"][(_local_4.index + 1)];
            };
            if (_local_3 >= 3)
            {
                return (true);
            };
            return (false);
        }

        private function clean():void
        {
            var _local_1:ThreeDiabetesBox;
            var _local_3:int;
            var _local_4:int;
            if (!boxes)
            {
                return;
            };
            var _local_2:int;
            while (_local_2 < 6)
            {
                _local_3 = 0;
                while (_local_3 < 6)
                {
                    _local_4 = ((_local_2 * 6) + _local_3);
                    _local_1 = boxes[_local_4];
                    if (_local_1)
                    {
                        _local_1.x = (50 * _local_3);
                        _local_1.y = ((50 * _local_2) - 300);
                        _local_1.setParam(false, 1);
                        _local_1.setType(-1);
                    }
                    else
                    {
                        _local_1 = new ThreeDiabetesBox();
                        _local_1.setIndex(_local_4);
                        boxes[_local_4] = _local_1;
                        _local_1.x = (50 * _local_3);
                        _local_1.y = ((50 * _local_2) - 300);
                        container1.addChild(_local_1);
                    };
                    _local_3++;
                };
                _local_2++;
            };
        }

        private function askBuy(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("diabetesBuy", new Responder(onBuy));
            };
        }

        private function set rankTxt(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._978091684rankTxt;
            if (_local_2 !== _arg_1)
            {
                this._978091684rankTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankTxt", _local_2, _arg_1));
            };
        }

        private function checkPosition():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ThreeDiabetesBox;
            var _local_1:int;
            while (_local_1 < 12)
            {
                _local_2 = 0;
                while (_local_2 < 6)
                {
                    _local_3 = ((_local_1 * 6) + _local_2);
                    _local_4 = boxes[_local_3];
                    if (_local_4)
                    {
                        _local_4.x = (50 * _local_2);
                        _local_4.y = ((50 * _local_1) - 300);
                    };
                    _local_2++;
                };
                _local_1++;
            };
        }

        private function askAward(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("diabetesRefresh", new Responder(onRefresh));
            };
        }

        private function getDiabetesRes():void
        {
            if (load_state != 0)
            {
                _core.remote.call("summerGameDiabetes", null);
                return;
            };
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2080130000467)));
                load_state = 1;
            };
        }

        private function showStep():void
        {
            var _local_5:int;
            var _local_6:ThreeDiabetesBox;
            if (((!(steps)) || (steps.length == 0)))
            {
                canMove = true;
                wData["data"] = stepData;
                wData.leftNum = (int(wData.leftNum) - 1);
                leftNumTxt.text = wData.leftNum;
                return;
            };
            var _local_1:Object = steps.shift();
            stepData = _local_1["data"];
            wData.score = _local_1["score"];
            scoreTxt.text = (Math.floor((int(wData.score) * 10)) / 10).toString();
            effect_arr = [];
            if (!hasEventListener(Event.ENTER_FRAME))
            {
                addEventListener(Event.ENTER_FRAME, effectHandler);
            };
            var _local_2:Matrix = new Matrix();
            var _local_3:Array = _local_1["remove"];
            var _local_4:int;
            while (_local_4 < _local_3.length)
            {
                _local_5 = _local_3[_local_4];
                _local_6 = boxes[_local_5];
                if (_local_6)
                {
                    boxes[_local_5] = null;
                    _local_6.destroy();
                    effect_arr.push({
                        "_x":_local_6.x,
                        "_y":_local_6.y,
                        "counter":0
                    });
                };
                _local_4++;
            };
            dropDown();
        }

        private function refreshLand(_arg_1:Array):void
        {
            var _local_3:ThreeDiabetesBox;
            var _local_4:Object;
            if (!_arg_1)
            {
                return;
            };
            clean();
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.length)
            {
                _local_3 = boxes[_local_2];
                if (_arg_1[_local_2])
                {
                    _local_4 = _arg_1[_local_2];
                    if (_local_3)
                    {
                        _local_3.setParam(_local_4.bomb, _local_4.num);
                        _local_3.setType(_local_4.type);
                        _local_3.setIndex(_local_2);
                    };
                }
                else
                {
                    if (_local_3)
                    {
                        _local_3.setParam(false, 1);
                        _local_3.setType(-1);
                    };
                };
                _local_2++;
            };
        }

        private function effectHandler(_arg_1:Event):void
        {
            var _local_4:Object;
            var _local_5:BitmapData;
            if (effect_arr.length == 0)
            {
                removeEventListener(Event.ENTER_FRAME, effectHandler);
                return;
            };
            effect_bm.bitmapData.fillRect(new Rectangle(0, 0, EFFECT_BM_WIDTH, EFFECT_BM_HEIGHT), 0xFFFFFF);
            var _local_2:Matrix = new Matrix();
            var _local_3:int;
            while (_local_3 < effect_arr.length)
            {
                if (effects.length == 0) break;
                _local_4 = effect_arr[_local_3];
                if (_local_4.counter >= effects.length)
                {
                    effect_arr.splice(_local_3, 1);
                    _local_3--;
                }
                else
                {
                    _local_5 = effects[_local_4.counter++];
                    _local_2.tx = (_local_4._x - 125);
                    _local_2.ty = (_local_4._y - 125);
                    effect_bm.bitmapData.draw(_local_5, _local_2);
                };
                _local_3++;
            };
        }

        private function clearPage():void
        {
            rankTxt.removeAll();
        }

        [Bindable(event="propertyChange")]
        public function get txt():IntroText
        {
            return (this._115312txt);
        }

        private function buy():void
        {
            var _local_1:String = Language.SUMMER_GAME_PANEL[27];
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, askBuy);
        }

        [Bindable(event="propertyChange")]
        public function get refreshBtn():BasicGlowButton
        {
            return (this._321863295refreshBtn);
        }

        private function set canMove(_arg_1:Boolean):void
        {
            var _local_2:Object = this._549570497canMove;
            if (_local_2 !== _arg_1)
            {
                this._549570497canMove = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canMove", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get scoreTxt():Label
        {
            return (this._485512578scoreTxt);
        }

        override public function initialize():void
        {
            var target:ThreeDiabetes;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ThreeDiabetes_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ThreeDiabetesWatcherSetupUtil");
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

        private function moveEndHandler2(_arg_1:Event):void
        {
            moveBox1 = null;
            moveBox2 = null;
            checkPosition();
        }

        private function moveEndHandler(_arg_1:Event):void
        {
            var _local_2:Array = wData["data"];
            diabetes = ((checkDiabete(moveBox1.index)) || (checkDiabete(moveBox2.index)));
            if (diabetes)
            {
                canMove = false;
                Core.getInstance().remote.call("diabetesMoveBox", null, moveBox1.index, moveBox2.index);
                checkPosition();
                moveBox1 = null;
                moveBox2 = null;
                return;
            };
            swapBoxes(moveEndHandler2);
        }

        [Bindable(event="propertyChange")]
        private function get rankTxt():ArrayCollection
        {
            return (this._978091684rankTxt);
        }

        public function onGetAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (!_arg_1["flag"])
            {
                this.visible = false;
                return;
            };
            if (wData)
            {
                wData.state = 2;
            };
        }

        private function getAward():void
        {
            if (((wData) && (wData.state == 2)))
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[7]);
                return;
            };
            if (int(wData.leftNum) > 0)
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[15]);
                return;
            };
            _core.remote.call("diaBetesGetAward", null);
        }

        private function refreshRank():void
        {
            rankData.sort(sortByScore);
        }

        public function set container1(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._145245136container1;
            if (_local_2 !== _arg_1)
            {
                this._145245136container1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container1", _local_2, _arg_1));
            };
        }

        private function _ThreeDiabetes_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ThreeDiabetes_BasicTitleCanvas1.text = _arg_1;
            }, "_ThreeDiabetes_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000726));
            }, function (_arg_1:Object):void
            {
                _ThreeDiabetes_Image1.source = _arg_1;
            }, "_ThreeDiabetes_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000478));
            }, function (_arg_1:Object):void
            {
                _ThreeDiabetes_Image2.source = _arg_1;
            }, "_ThreeDiabetes_Image2.source");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                leftNumTxt.filters = _arg_1;
            }, "leftNumTxt.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ThreeDiabetes_Label2.text = _arg_1;
            }, "_ThreeDiabetes_Label2.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _ThreeDiabetes_Label2.filters = _arg_1;
            }, "_ThreeDiabetes_Label2.filters");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                scoreTxt.filters = _arg_1;
            }, "scoreTxt.filters");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ThreeDiabetes_BasicGlowButton1.label = _arg_1;
            }, "_ThreeDiabetes_BasicGlowButton1.label");
            result[7] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (canMove);
            }, function (_arg_1:Boolean):void
            {
                refreshBtn.enabled = _arg_1;
            }, "refreshBtn.enabled");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                refreshBtn.label = _arg_1;
            }, "refreshBtn.label");
            result[9] = binding;
            return (result);
        }

        public function ___ThreeDiabetes_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            buy();
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" diabetes load res Error ");
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            rankTxt.removeAll();
            var _local_3:int;
            while (_local_3 < 10)
            {
                _local_4 = rankData[(_local_3 + _arg_1)];
                if (_local_4)
                {
                    rankTxt.addItem(_local_4);
                };
                _local_3++;
            };
        }

        public function onSetBox(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Boolean = _arg_1["flag"];
            if (_local_2)
            {
                steps = _arg_1["steps"];
                showStep();
            }
            else
            {
                this.visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get container1():UIComponent
        {
            return (this._145245136container1);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            getDiabetesRes();
        }

        [Bindable(event="propertyChange")]
        private function get canMove():Boolean
        {
            return (this._549570497canMove);
        }

        private function stepMoveEnd(_arg_1:Event):void
        {
            moveNum--;
            if (moveNum > 0)
            {
                return;
            };
            moveHandlers.length = 0;
            refreshQueue();
            checkPosition();
            showStep();
        }

        public function set leftNumTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1975768049leftNumTxt;
            if (_local_2 !== _arg_1)
            {
                this._1975768049leftNumTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftNumTxt", _local_2, _arg_1));
            };
        }

        private function swapBoxes(_arg_1:Function):void
        {
            var _local_2:Object = boxes[moveBox1.index];
            var _local_3:int = moveBox1.index;
            var _local_4:int = moveBox2.index;
            boxes[moveBox1.index] = boxes[moveBox2.index];
            boxes[moveBox2.index] = _local_2;
            var _local_5:int = moveBox1.index;
            moveBox1.index = moveBox2.index;
            moveBox2.index = _local_5;
            var _local_6:Object = wData["data"][moveBox1.index];
            wData["data"][moveBox1.index] = wData["data"][moveBox2.index];
            wData["data"][moveBox2.index] = _local_6;
            var _local_7:int = wData["data"][moveBox1.index].index;
            wData["data"][moveBox1.index].index = wData["data"][moveBox2.index].index;
            wData["data"][moveBox2.index].index = _local_7;
            var _local_8:EnterFrameMove = new EnterFrameMove();
            _local_8.target = moveBox1;
            _local_8.stepLength = 10;
            _local_8.xBy = (moveBox2.x - moveBox1.x);
            _local_8.yBy = (moveBox2.y - moveBox1.y);
            _local_8.addEventListener(EnterFrameMove.EFFECT_END, _arg_1);
            _local_8.play(true);
            var _local_9:EnterFrameMove = new EnterFrameMove();
            _local_9.target = moveBox2;
            _local_9.stepLength = 10;
            _local_9.xBy = (moveBox1.x - moveBox2.x);
            _local_9.yBy = (moveBox1.y - moveBox2.y);
            _local_9.play(true);
        }

        public function set txt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._115312txt;
            if (_local_2 !== _arg_1)
            {
                this._115312txt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt", _local_2, _arg_1));
            };
        }

        public function ___ThreeDiabetes_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        private function refreshQueue():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ThreeDiabetesBox;
            var _local_5:Object;
            var _local_1:int;
            while (_local_1 < 6)
            {
                _local_2 = 0;
                while (_local_2 < 6)
                {
                    _local_3 = ((_local_1 * 6) + _local_2);
                    _local_4 = boxes[_local_3];
                    if (!_local_4)
                    {
                        _local_4 = new ThreeDiabetesBox();
                        _local_5 = stepData[_local_3];
                        _local_4.setIndex(_local_3);
                        _local_4.setParam(_local_5.bomb, _local_5.num);
                        _local_4.setType(_local_5.type);
                        boxes[_local_3] = _local_4;
                        _local_4.x = (50 * _local_2);
                        _local_4.y = ((50 * _local_1) - 300);
                        container1.addChild(_local_4);
                    };
                    _local_2++;
                };
                _local_1++;
            };
        }

        private function allRefresh():void
        {
            if (!canMove)
            {
                return;
            };
            if (((wData) && (wData.state == 2)))
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[7]);
                return;
            };
            var _local_1:String = Language.SUMMER_GAME_PANEL[10];
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, askAward);
        }

        private function onRefresh(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (!_arg_1["flag"])
            {
                this.visible = false;
                return;
            };
            wData = _arg_1["data"];
            leftNumTxt.text = wData.leftNum;
            refreshLand(wData["data"]);
            checkPosition();
        }

        private function sortByScore(_arg_1:Object, _arg_2:Object):Number
        {
            if (_arg_1.rank == _arg_2.rank)
            {
                return (0);
            };
            if (_arg_1.rank > _arg_2.rank)
            {
                return (1);
            };
            return (-1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

