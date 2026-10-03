// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.Wasteland

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import flash.display.BitmapData;
    import mx.binding.IWatcherSetupUtil;
    import flash.events.EventDispatcher;
    import mx.controls.CheckBox;
    import flash.display.Sprite;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.Wasterlandbox;
    import mx.controls.Label;
    import mx.core.UIComponent;
    import mx.containers.Canvas;
    import flash.utils.Dictionary;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import flash.display.Loader;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import flash.display.Bitmap;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import flash.events.IEventDispatcher;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.effects.EnterFrameMove;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.net.URLRequest;
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

    public class Wasteland extends DragableCanvas implements IBindingClient 
    {

        private static var _1931275169showAlert:Boolean = true;
        public static var yellowBMD:BitmapData;
        public static var backBMD:BitmapData;
        public static var pic_bmds:Object;
        public static var picc_bmds:Object;
        private static var _watcherSetupUtil:IWatcherSetupUtil;
        private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();

        private var _763435276showAlertbox:CheckBox;
        private var moveSp:Sprite;
        private var rankData:Array;
        private var _3536377sour:Image;
        private var _115312txt:IntroText;
        private var _948696769queue0:Wasterlandbox;
        public var _Wasteland_Image1:Image;
        public var _Wasteland_Image2:Image;
        private var moveMask:Sprite;
        private var wasteland_load_state:int = 0;
        private var _351784881coverNum:Label;
        private var _145245136container1:UIComponent;
        private var _106433028panel:Canvas;
        private var boxes:Dictionary;
        public var _Wasteland_BasicGlowButton1:BasicGlowButton;
        private var wData:Object;
        private var _109264530score:Label;
        public var _Wasteland_Label4:Label;
        private var load:Loader;
        public var _Wasteland_BasicTitleCanvas1:BasicTitleCanvas;
        private var ddx:Number = 13;
        private var ddy:Number = 115;
        private var moveBm:Bitmap;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_Wasteland_BasicTitleCanvas1"
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
                                            "width":265,
                                            "height":290,
                                            "x":8,
                                            "y":8,
                                            "styleName":"CanvasBorder",
                                            "mouseEnabled":false,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_Wasteland_Image1"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":265,
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
                                            "width":400,
                                            "height":430,
                                            "x":275,
                                            "y":8,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_Wasteland_Image2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2,
                                                        "y":2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"sour",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "7";
                                                    this.top = "13";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":UIComponent,
                                                "id":"container1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Wasterlandbox,
                                                "id":"queue0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":330,
                                                        "y":55
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "150";
                                                    this.right = "0";
                                                    this.color = 0xFFFF;
                                                    this.fontWeight = "bold";
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"20 vàng/lần",
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"coverNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "225";
                                                    this.right = "0";
                                                    this.color = 0xFFFF;
                                                    this.fontWeight = "bold";
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":80});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"score",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "293";
                                                    this.right = "0";
                                                    this.color = 0xFFFF;
                                                    this.fontWeight = "bold";
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":80});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_Wasteland_BasicGlowButton1",
                                                "events":{"click":"___Wasteland_BasicGlowButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-80";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":20,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"showAlertbox",
                                                "events":{"click":"__showAlertbox_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":320,
                                                        "y":340
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_Wasteland_Label4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":338,
                                                        "y":340
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
        private var _978091684rankTxt:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function Wasteland()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 500;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            Wasteland._watcherSetupUtil = _arg_1;
        }

        public static function set showAlert(_arg_1:Boolean):void
        {
            var _local_3:IEventDispatcher;
            var _local_2:Object = Wasteland._1931275169showAlert;
            if (_local_2 !== _arg_1)
            {
                Wasteland._1931275169showAlert = _arg_1;
                _local_3 = Wasteland.staticEventDispatcher;
                if (_local_3 != null)
                {
                    _local_3.dispatchEvent(PropertyChangeEvent.createUpdateEvent(Wasteland, "showAlert", _local_2, _arg_1));
                };
            };
        }

        public static function get staticEventDispatcher():IEventDispatcher
        {
            return (_staticBindingEventDispatcher);
        }

        [Bindable(event="propertyChange")]
        public static function get showAlert():Boolean
        {
            return (Wasteland._1931275169showAlert);
        }


        [Bindable(event="propertyChange")]
        public function get sour():Image
        {
            return (this._3536377sour);
        }

        public function set sour(_arg_1:Image):void
        {
            var _local_2:Object = this._3536377sour;
            if (_local_2 !== _arg_1)
            {
                this._3536377sour = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sour", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get panel():Canvas
        {
            return (this._106433028panel);
        }

        private function refreshQueue(_arg_1:Array):void
        {
            var _local_3:int;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:int;
            while (_local_2 < _arg_1.length)
            {
                _local_3 = _arg_1[((_arg_1.length - 1) - _local_2)];
                this[("queue" + _local_2)].setType(_local_3, false);
                _local_2++;
            };
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get showAlertbox():CheckBox
        {
            return (this._763435276showAlertbox);
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
            var _local_2:int;
            var _local_3:int;
            var _local_4:Wasterlandbox;
            coverNum.htmlText = "0/36";
            txt.htmlText = Language.SUMMER_GAME_PANEL[28];
            boxes = new Dictionary();
            var _local_1:int;
            while (_local_1 < 6)
            {
                _local_2 = 0;
                while (_local_2 < 6)
                {
                    _local_3 = ((_local_1 * 6) + _local_2);
                    _local_4 = new Wasterlandbox();
                    _local_4.setIndex(_local_3);
                    _local_4.setType(-1, false);
                    _local_4.register();
                    _local_4.buttonMode = true;
                    _local_4.x = (ddx + (50 * _local_2));
                    _local_4.y = (ddy + (50 * _local_1));
                    boxes[_local_3] = _local_4;
                    container1.addChild(_local_4);
                    _local_2++;
                };
                _local_1++;
            };
        }

        public function set showAlertbox(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._763435276showAlertbox;
            if (_local_2 !== _arg_1)
            {
                this._763435276showAlertbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showAlertbox", _local_2, _arg_1));
            };
        }

        public function set score(_arg_1:Label):void
        {
            var _local_2:Object = this._109264530score;
            if (_local_2 !== _arg_1)
            {
                this._109264530score = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "score", _local_2, _arg_1));
            };
        }

        private function onBuy(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Boolean = _arg_1["flag"];
            if (!_local_2)
            {
                this.visible = false;
            };
        }

        private function setAlertShow():void
        {
            showAlert = (!(showAlertbox.selected));
        }

        [Bindable(event="propertyChange")]
        public function get queue0():Wasterlandbox
        {
            return (this._948696769queue0);
        }

        public function onGetData(_arg_1:Object):void
        {
            var _local_2:String;
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
                _local_2 = Language.SUMMER_GAME_PANEL[56];
                Alert.show(_local_2, "", Alert.YES, null);
            };
            wData = _arg_1["data"];
            refreshQueue(wData["queue"]);
            refreshLand(wData["data"]);
            score.text = wData["score"];
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_7:String;
            var _local_8:Class;
            var _local_9:MovieClip;
            var _local_10:BitmapData;
            var _local_11:Class;
            var _local_12:MovieClip;
            var _local_13:BitmapData;
            var _local_2:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("pic_yellow") as Class);
            var _local_3:MovieClip = new (_local_2)();
            yellowBMD = new BitmapData(_local_3.width, _local_3.height, true, 0xFFFFFF);
            yellowBMD.draw(_local_3);
            var _local_4:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("back") as Class);
            var _local_5:MovieClip = new (_local_4)();
            backBMD = new BitmapData(_local_5.width, _local_5.height, true, 0xFFFFFF);
            backBMD.draw(_local_5);
            pic_bmds = {};
            picc_bmds = {};
            var _local_6:int;
            while (_local_6 < 11)
            {
                _local_7 = ("pic" + _local_6);
                _local_8 = (load.contentLoaderInfo.applicationDomain.getDefinition(_local_7) as Class);
                _local_9 = new (_local_8)();
                _local_10 = new BitmapData(_local_9.width, _local_9.height, true, 0xFFFFFF);
                _local_10.draw(_local_9);
                pic_bmds[_local_6] = _local_10;
                _local_7 = ("picc" + _local_6);
                _local_11 = (load.contentLoaderInfo.applicationDomain.getDefinition(_local_7) as Class);
                _local_12 = new (_local_11)();
                _local_13 = new BitmapData(_local_12.width, _local_12.height, true, 0xFFFFFF);
                _local_13.draw(_local_12);
                picc_bmds[_local_6] = _local_13;
                _local_6++;
            };
            wasteland_load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            init();
            _core.remote.call("summerGameWasteland", null);
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

        private function clean():void
        {
            var _local_2:Wasterlandbox;
            if (!boxes)
            {
                return;
            };
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < 36)
            {
                _local_2 = boxes[_local_1];
                if (_local_2)
                {
                    _local_2.setType(-1, false);
                };
                _local_1++;
            };
        }

        private function askBuy(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("wastelandBuy", new Responder(onBuy));
            };
        }

        private function startMove():void
        {
            var _local_1:EnterFrameMove = new EnterFrameMove();
            _local_1.target = moveMask;
            _local_1.stepLength = 8;
            _local_1.xBy = (ddx - moveMask.x);
            _local_1.yBy = ((ddy + 300) - moveMask.y);
            _local_1.addEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
            _local_1.play(true);
        }

        [Bindable(event="propertyChange")]
        public function get coverNum():Label
        {
            return (this._351784881coverNum);
        }

        private function askAward(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("wastelandGetAward", null);
            };
        }

        private function refreshLand(_arg_1:Array):void
        {
            var _local_3:Wasterlandbox;
            var _local_6:Object;
            if (!_arg_1)
            {
                return;
            };
            clean();
            var _local_2:int;
            var _local_4:int;
            var _local_5:Boolean;
            _local_2 = 0;
            while (_local_2 < _arg_1.length)
            {
                _local_3 = boxes[_local_2];
                if (_arg_1[_local_2])
                {
                    _local_6 = _arg_1[_local_2];
                    if (_local_3)
                    {
                        _local_3.setType(_local_6.type, _local_6.covered);
                    };
                    if (_local_6.covered)
                    {
                        _local_4++;
                        if (!_local_5)
                        {
                            _local_5 = true;
                            sour.source = ResManager.getIconUrl(4130220000434);
                        };
                    };
                };
                _local_2++;
            };
            coverNum.htmlText = (_local_4 + "/36");
        }

        [Bindable(event="propertyChange")]
        public function get txt():IntroText
        {
            return (this._115312txt);
        }

        public function __showAlertbox_click(_arg_1:MouseEvent):void
        {
            setAlertShow();
        }

        private function _Wasteland_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Wasteland_BasicTitleCanvas1.text = _arg_1;
            }, "_Wasteland_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000725));
            }, function (_arg_1:Object):void
            {
                _Wasteland_Image1.source = _arg_1;
            }, "_Wasteland_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000433));
            }, function (_arg_1:Object):void
            {
                _Wasteland_Image2.source = _arg_1;
            }, "_Wasteland_Image2.source");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000435));
            }, function (_arg_1:Object):void
            {
                sour.source = _arg_1;
            }, "sour.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Wasteland_BasicGlowButton1.label = _arg_1;
            }, "_Wasteland_BasicGlowButton1.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Wasteland_Label4.text = _arg_1;
            }, "_Wasteland_Label4.text");
            result[5] = binding;
            return (result);
        }

        private function clearPage():void
        {
            rankTxt.removeAll();
        }

        public function set queue0(_arg_1:Wasterlandbox):void
        {
            var _local_2:Object = this._948696769queue0;
            if (_local_2 !== _arg_1)
            {
                this._948696769queue0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "queue0", _local_2, _arg_1));
            };
        }

        private function buy():void
        {
            var _local_1:String = Language.SUMMER_GAME_PANEL[29];
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, askBuy);
        }

        public function onWastelandSetBox(_arg_1:Object):void
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
            refreshQueue(_arg_1["queue"]);
            var _local_2:int = _arg_1["index"];
            var _local_3:int = _arg_1["type"];
            var _local_4:Wasterlandbox = boxes[_local_2];
            if (_local_4)
            {
                _local_4.setType(_local_3, false);
            };
        }

        override public function initialize():void
        {
            var target:Wasteland;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _Wasteland_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WastelandWatcherSetupUtil");
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
        public function get score():Label
        {
            return (this._109264530score);
        }

        [Bindable(event="propertyChange")]
        private function get rankTxt():ArrayCollection
        {
            return (this._978091684rankTxt);
        }

        public function set coverNum(_arg_1:Label):void
        {
            var _local_2:Object = this._351784881coverNum;
            if (_local_2 !== _arg_1)
            {
                this._351784881coverNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "coverNum", _local_2, _arg_1));
            };
        }

        public function onGetAward(_arg_1:Object):void
        {
            var _local_4:Wasterlandbox;
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
            sour.source = ResManager.getIconUrl(4130220000434);
            if (!moveSp)
            {
                moveSp = new Sprite();
                moveBm = new Bitmap(new BitmapData(300, 300, true, 0xFFFFFF));
                moveSp.addChild(moveBm);
                moveMask = new Sprite();
                moveMask.graphics.beginFill(0xFFFFFF, 0);
                moveMask.graphics.drawRect(0, 0, 300, 300);
                moveMask.graphics.endFill();
            };
            moveMask.x = ddx;
            moveMask.y = ddy;
            moveSp.x = moveMask.x;
            moveSp.y = moveMask.y;
            container1.addChild(moveMask);
            container1.addChild(moveSp);
            moveSp.mask = moveMask;
            var _local_2:Matrix = new Matrix();
            moveBm.bitmapData.fillRect(new Rectangle(0, 0, 300, 300), 0xFFFFFF);
            var _local_3:int;
            while (_local_3 < 36)
            {
                _local_4 = boxes[_local_3];
                if (_local_4)
                {
                    _local_2.tx = (_local_4.x - moveMask.x);
                    _local_2.ty = (_local_4.y - moveMask.y);
                    moveBm.bitmapData.draw(_local_4, _local_2);
                };
                _local_3++;
            };
            refreshLand(_arg_1["data"]);
            wData["score"] = _arg_1["score"];
            score.text = wData["score"];
            startMove();
        }

        private function getAward():void
        {
            var _local_1:Object;
            var _local_2:String;
            var _local_3:Wasterlandbox;
            if (((wData) && (wData.state == 2)))
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[7]);
                return;
            };
            for (_local_1 in boxes)
            {
                _local_3 = boxes[_local_1];
                if (((!(_local_3)) || (_local_3.type == -1)))
                {
                    _core.sysMidNote(Language.SUMMER_GAME_PANEL[3]);
                    return;
                };
            };
            _local_2 = Language.SUMMER_GAME_PANEL[6];
            Alert.show(_local_2, "", (Alert.YES | Alert.NO), null, askAward);
        }

        public function ___Wasteland_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        private function refreshRank():void
        {
            rankData.sort(sortByScore);
        }

        private function moveEndHandler(_arg_1:Event):void
        {
            var _local_2:EnterFrameMove = (_arg_1.currentTarget as EnterFrameMove);
            _local_2.removeEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
            _local_2.destroy();
            _local_2 = null;
            if (((moveSp) && (moveSp.parent)))
            {
                moveSp.parent.removeChild(moveSp);
                moveSp.mask = null;
            };
            if (((moveMask) && (moveMask.parent)))
            {
                moveMask.parent.removeChild(moveMask);
            };
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

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" wasteland load res Error ");
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

        [Bindable(event="propertyChange")]
        public function get container1():UIComponent
        {
            return (this._145245136container1);
        }

        private function getWastelandRes():void
        {
            if (wasteland_load_state != 0)
            {
                _core.remote.call("summerGameWasteland", null);
                return;
            };
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2080130000466)));
                wasteland_load_state = 1;
            };
        }

        private function _Wasteland_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SUMMER_GAME_PANEL[1];
            _local_1 = ResManager.getIconUrl(4130220000725);
            _local_1 = ResManager.getIconUrl(4130220000433);
            _local_1 = ResManager.getIconUrl(4130220000435);
            _local_1 = Language.SUMMER_GAME_PANEL[2];
            _local_1 = Language.SUMMER_GAME_PANEL[8];
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            getWastelandRes();
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

