// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CubeMaster

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import flash.events.EventDispatcher;
    import mx.binding.IWatcherSetupUtil;
    import flash.display.Loader;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.MagicCell;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.net.Responder;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import flash.display.MovieClip;
    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import mx.core.UIComponent;
    import com.qeedoo.ui.view.comp.CubeMasterButton;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.event.GameEvent;
    import mx.events.FlexEvent;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.net.URLRequest;
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

    public class CubeMaster extends DragableCanvas implements IBindingClient 
    {

        public static var smallCubeBMD:Object = {};
        public static var bigCubeBMD:Object = {};
        public static var buttonBMD:Object = {};
        public static var buttonLightBMD:Object = {};
        private static const colorStr:Array = ["Blue", "Green", "Purple", "Red", "White"];
        private static const dirStr:Array = ["shang", "xia", "zuo", "you"];
        public static var decoProxy:EventDispatcher = new EventDispatcher();
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var loader:Loader;
        private var _type:int = -1;
        private var _564289872curLastNum:Label;
        private var _1835012049todayScore:Label;
        private var _2132428494changeCell:MagicCell;
        public var _CubeMaster_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1219476858smallUITop:Canvas;
        private var loadCompleteFlag:Boolean = false;
        private var _1404137631bigContainer:Canvas;
        private var _endCount:int = 0;
        private var _610842367smallUIRight:Canvas;
        private var _409271709totalContainer:Canvas;
        private var _state:uint = 0;
        private var _851171198smallUILeft:Canvas;
        private var _loadCid:int = 0;
        private var _index:int = -1;
        private var _lastNum:int = 0;
        public var _CubeMaster_IntroText1:IntroText;
        private var _2086596582smallUIBottom:Canvas;
        private var _direc:int = -1;
        public var _CubeMaster_Image1:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":560,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_CubeMaster_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"totalContainer",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":400,
                                "height":375,
                                "x":9,
                                "y":36,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_CubeMaster_Image1"
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"bigContainer",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":275,
                                            "height":275,
                                            "x":62.5,
                                            "y":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"smallUILeft",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":100,
                                            "height":130,
                                            "x":17.5,
                                            "y":123.5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"smallUIRight",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":100,
                                            "height":130,
                                            "x":282.5,
                                            "y":123.5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"smallUITop",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":130,
                                            "height":100,
                                            "x":135,
                                            "y":6
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"smallUIBottom",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":130,
                                            "height":100,
                                            "x":135,
                                            "y":271
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"curLastNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                        this.horizontalCenter = "127";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":7});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "events":{"click":"___CubeMaster_BasicDelayButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdGreen",
                                            "label":"Xác nhận",
                                            "x":302.5,
                                            "y":24
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "events":{"click":"___CubeMaster_BasicDelayButton2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnAdd",
                                            "x":367,
                                            "y":6
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
                                "styleName":"CanvasBorder",
                                "width":140,
                                "height":173,
                                "x":412,
                                "y":35,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"todayScore",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":8});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":39,
                                            "text":"Đổi ô"
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
                                            "width":100,
                                            "height":1,
                                            "y":30
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MagicCell,
                                    "id":"changeCell",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":45,
                                            "y":65,
                                            "mouseEnabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "events":{"click":"___CubeMaster_BasicDelayButton3_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"Đổi màu",
                                            "y":141,
                                            "styleName":"BtnStdGreen"
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
                                "styleName":"CanvasBorder",
                                "width":140,
                                "height":190,
                                "x":412,
                                "y":216,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"_CubeMaster_IntroText1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "5";
                                        this.top = "5";
                                        this.right = "5";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":180,
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
        private var big:Array = [[], [], [], [], []];
        private var smallLeft:Array = [[], [], []];
        private var smallRight:Array = [[], [], []];
        private var smallTop:Array = [[], [], [], [], []];
        private var smallBottom:Array = [[], [], [], [], []];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CubeMaster()
        {
            mx_internal::_document = this;
            this.width = 560;
            this.height = 430;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CubeMaster_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CubeMaster._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get smallUIRight():Canvas
        {
            return (this._610842367smallUIRight);
        }

        public function set smallUIRight(_arg_1:Canvas):void
        {
            var _local_2:Object = this._610842367smallUIRight;
            if (_local_2 !== _arg_1)
            {
                this._610842367smallUIRight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "smallUIRight", _local_2, _arg_1));
            };
        }

        public function set smallUILeft(_arg_1:Canvas):void
        {
            var _local_2:Object = this._851171198smallUILeft;
            if (_local_2 !== _arg_1)
            {
                this._851171198smallUILeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "smallUILeft", _local_2, _arg_1));
            };
        }

        public function ___CubeMaster_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            endGame();
        }

        public function showPanel():void
        {
            getCubeRes();
            if (_loadCid != _core.cid)
            {
                _loadCid = _core.cid;
                _endCount = 0;
            };
            if (loadCompleteFlag)
            {
                _core.remote.call("getMagicCubeData", new Responder(onGetData));
            };
        }

        private function addTimes():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("addmoveMagicCubeTimes", new Responder(onGetData));
                };
            };
            Alert.show(Language.ANNIVERSARY_LANG[21].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get changeCell():MagicCell
        {
            return (this._2132428494changeCell);
        }

        public function set totalContainer(_arg_1:Canvas):void
        {
            var _local_2:Object = this._409271709totalContainer;
            if (_local_2 !== _arg_1)
            {
                this._409271709totalContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalContainer", _local_2, _arg_1));
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:Class;
            var _local_5:MovieClip;
            var _local_6:BitmapData;
            _local_2 = 0;
            while (_local_2 < 5)
            {
                _local_3 = (("cube" + colorStr[_local_2]) + "Small");
                _local_4 = (loader.contentLoaderInfo.applicationDomain.getDefinition(_local_3) as Class);
                _local_5 = new (_local_4)();
                _local_6 = new BitmapData(_local_5.width, _local_5.height, true, 0xFFFFFF);
                _local_6.draw(_local_5);
                smallCubeBMD[_local_2] = _local_6;
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < 5)
            {
                _local_3 = (("cube" + colorStr[_local_2]) + "Big");
                _local_4 = (loader.contentLoaderInfo.applicationDomain.getDefinition(_local_3) as Class);
                _local_5 = new (_local_4)();
                _local_6 = new BitmapData(_local_5.width, _local_5.height, true, 0xFFFFFF);
                _local_6.draw(_local_5);
                bigCubeBMD[_local_2] = _local_6;
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < 4)
            {
                _local_3 = dirStr[_local_2];
                _local_4 = (loader.contentLoaderInfo.applicationDomain.getDefinition(_local_3) as Class);
                _local_5 = new (_local_4)();
                _local_6 = new BitmapData(_local_5.width, _local_5.height, true, 0xFFFFFF);
                _local_6.draw(_local_5);
                buttonBMD[_local_2] = _local_6;
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < 4)
            {
                _local_3 = (dirStr[_local_2] + "L");
                _local_4 = (loader.contentLoaderInfo.applicationDomain.getDefinition(_local_3) as Class);
                _local_5 = new (_local_4)();
                _local_6 = new BitmapData(_local_5.width, _local_5.height, true, 0xFFFFFF);
                _local_6.draw(_local_5);
                buttonLightBMD[_local_2] = _local_6;
                _local_2++;
            };
            loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            loadCompleteFlag = true;
            _core.remote.call("getMagicCubeData", new Responder(onGetData));
        }

        public function onGetData(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:Array;
            var _local_5:Array;
            var _local_6:Array;
            var _local_7:UIComponent;
            var _local_8:int;
            var _local_9:UIComponent;
            var _local_10:UIComponent;
            var _local_11:int;
            var _local_12:UIComponent;
            var _local_13:UIComponent;
            var _local_14:int;
            var _local_15:UIComponent;
            var _local_16:UIComponent;
            var _local_17:int;
            var _local_18:UIComponent;
            var _local_19:UIComponent;
            var _local_20:int;
            var _local_21:UIComponent;
            var _local_22:int;
            var _local_23:int;
            var _local_24:int;
            var _local_25:int;
            var _local_26:int;
            var _local_27:int;
            var _local_28:int;
            var _local_29:int;
            var _local_30:int;
            var _local_31:int;
            var _local_32:int;
            var _local_33:int;
            var _local_34:MagicCell;
            var _local_35:int;
            var _local_36:int;
            var _local_37:int;
            var _local_38:int;
            var _local_39:CubeMasterButton;
            if (_arg_1)
            {
                visible = true;
                while (bigContainer.numChildren > 0)
                {
                    bigContainer.removeChildAt((bigContainer.numChildren - 1));
                };
                while (smallUILeft.numChildren > 0)
                {
                    smallUILeft.removeChildAt((smallUILeft.numChildren - 1));
                };
                while (smallUIRight.numChildren > 0)
                {
                    smallUIRight.removeChildAt((smallUIRight.numChildren - 1));
                };
                while (smallUITop.numChildren > 0)
                {
                    smallUITop.removeChildAt((smallUITop.numChildren - 1));
                };
                while (smallBottom.numChildren > 0)
                {
                    smallBottom.removeChildAt((smallBottom.numChildren - 1));
                };
                _lastNum = _arg_1.lastNum;
                _state = int(_arg_1["state"]);
                _local_2 = _arg_1.middle;
                _local_3 = _arg_1.left;
                _local_4 = _arg_1.right;
                _local_5 = _arg_1.top;
                _local_6 = _arg_1.bottom;
                _local_7 = new UIComponent();
                bigContainer.addChild(_local_7);
                _local_8 = 0;
                while (_local_8 < 5)
                {
                    _local_33 = 0;
                    while (_local_33 < 5)
                    {
                        if (!(((((_local_8 == 0) && (_local_33 == 0)) || ((_local_8 == 0) && (_local_33 == 4))) || ((_local_8 == 4) && (_local_33 == 0))) || ((_local_8 == 4) && (_local_33 == 4))))
                        {
                            _local_34 = new MagicCell();
                            _local_34.type = 2;
                            _local_34.register();
                            _local_34.x = (_local_34.width * _local_33);
                            _local_34.y = (_local_34.height * _local_8);
                            big[_local_8][_local_33] = _local_34;
                            if (((((_local_33 > 0) && (_local_33 < 4)) && (_local_8 > 0)) && (_local_8 < 4)))
                            {
                                _local_34.color = _local_2[(_local_8 - 1)][(_local_33 - 1)];
                                _local_34.row = (_local_8 - 1);
                                _local_34.col = (_local_33 - 1);
                            }
                            else
                            {
                                if ((((_local_8 == 0) && (_local_33 >= 1)) && (_local_33 < 4)))
                                {
                                    _local_34.color = _local_5[2][(_local_33 - 1)];
                                }
                                else
                                {
                                    if ((((_local_8 == 4) && (_local_33 >= 1)) && (_local_33 < 4)))
                                    {
                                        _local_34.color = _local_6[0][(_local_33 - 1)];
                                    }
                                    else
                                    {
                                        if ((((_local_33 == 0) && (_local_8 >= 1)) && (_local_8 < 4)))
                                        {
                                            _local_34.color = _local_3[(_local_8 - 1)][2];
                                        }
                                        else
                                        {
                                            if ((((_local_33 == 4) && (_local_8 >= 1)) && (_local_8 < 4)))
                                            {
                                                _local_34.color = _local_4[(_local_8 - 1)][0];
                                            };
                                        };
                                    };
                                };
                            };
                            _local_7.addChild(_local_34);
                        };
                        _local_33++;
                    };
                    _local_8++;
                };
                _local_9 = new UIComponent();
                _local_9.graphics.beginFill(0, 1);
                _local_9.graphics.drawRect(55, 55, 165, 165);
                _local_9.graphics.endFill();
                _local_7.mask = _local_9;
                bigContainer.addChild(_local_9);
                _local_10 = new UIComponent();
                smallUILeft.addChild(_local_10);
                _local_11 = 0;
                while (_local_11 < 3)
                {
                    _local_35 = 0;
                    while (_local_35 < 5)
                    {
                        _local_34 = new MagicCell();
                        _local_34.type = 1;
                        _local_34.register();
                        _local_34.x = (_local_34.width * _local_35);
                        _local_34.y = (55 * _local_11);
                        smallLeft[_local_11][_local_35] = _local_34;
                        if (((_local_35 < 4) && (_local_35 > 0)))
                        {
                            _local_34.color = _local_3[_local_11][(_local_35 - 1)];
                        }
                        else
                        {
                            if (_local_35 == 0)
                            {
                                _local_34.color = _local_4[_local_11][2];
                            }
                            else
                            {
                                if (_local_35 == 4)
                                {
                                    _local_34.color = _local_2[_local_11][0];
                                };
                            };
                        };
                        _local_10.addChild(_local_34);
                        _local_35++;
                    };
                    _local_11++;
                };
                _local_12 = new UIComponent();
                _local_12.graphics.beginFill(0, 1);
                _local_12.graphics.drawRect(20, 0, 60, 130);
                _local_12.graphics.endFill();
                _local_10.mask = _local_12;
                smallUILeft.addChild(_local_12);
                _local_13 = new UIComponent();
                smallUIRight.addChild(_local_13);
                _local_14 = 0;
                while (_local_14 < 3)
                {
                    _local_36 = 0;
                    while (_local_36 < 5)
                    {
                        _local_34 = new MagicCell();
                        _local_34.type = 1;
                        _local_34.register();
                        _local_34.x = (_local_34.width * _local_36);
                        _local_34.y = (55 * _local_14);
                        smallRight[_local_14][_local_36] = _local_34;
                        if (((_local_36 < 4) && (_local_36 > 0)))
                        {
                            _local_34.color = _local_4[_local_14][(_local_36 - 1)];
                        }
                        else
                        {
                            if (_local_36 == 4)
                            {
                                _local_34.color = _local_3[_local_14][0];
                            }
                            else
                            {
                                if (_local_36 == 0)
                                {
                                    _local_34.color = _local_2[_local_14][2];
                                };
                            };
                        };
                        _local_13.addChild(_local_34);
                        _local_36++;
                    };
                    _local_14++;
                };
                _local_15 = new UIComponent();
                _local_15.graphics.beginFill(0, 1);
                _local_15.graphics.drawRect(20, 0, 60, 130);
                _local_15.graphics.endFill();
                _local_13.mask = _local_15;
                smallUIRight.addChild(_local_15);
                _local_16 = new UIComponent();
                smallUITop.addChild(_local_16);
                _local_17 = 0;
                while (_local_17 < 5)
                {
                    _local_37 = 0;
                    while (_local_37 < 3)
                    {
                        _local_34 = new MagicCell();
                        _local_34.type = 1;
                        _local_34.register();
                        _local_34.x = (55 * _local_37);
                        _local_34.y = (20 * _local_17);
                        smallTop[_local_17][_local_37] = _local_34;
                        if (((_local_17 < 4) && (_local_17 > 0)))
                        {
                            _local_34.color = _local_5[(_local_17 - 1)][_local_37];
                        }
                        else
                        {
                            if (_local_17 == 4)
                            {
                                _local_34.color = _local_2[0][_local_37];
                            }
                            else
                            {
                                if (_local_17 == 0)
                                {
                                    _local_34.color = _local_6[2][_local_37];
                                };
                            };
                        };
                        _local_16.addChild(_local_34);
                        _local_37++;
                    };
                    _local_17++;
                };
                _local_18 = new UIComponent();
                _local_18.graphics.beginFill(0, 1);
                _local_18.graphics.drawRect(0, 20, 130, 60);
                _local_18.graphics.endFill();
                _local_16.mask = _local_18;
                smallUITop.addChild(_local_18);
                _local_19 = new UIComponent();
                smallUIBottom.addChild(_local_19);
                _local_20 = 0;
                while (_local_20 < 5)
                {
                    _local_38 = 0;
                    while (_local_38 < 3)
                    {
                        _local_34 = new MagicCell();
                        _local_34.type = 1;
                        _local_34.register();
                        _local_34.x = (55 * _local_38);
                        _local_34.y = (20 * _local_20);
                        smallBottom[_local_20][_local_38] = _local_34;
                        if (((_local_20 < 4) && (_local_20 > 0)))
                        {
                            _local_34.color = _local_6[(_local_20 - 1)][_local_38];
                        }
                        else
                        {
                            if (_local_20 == 0)
                            {
                                _local_34.color = _local_2[2][_local_38];
                            }
                            else
                            {
                                if (_local_20 == 4)
                                {
                                    _local_34.color = _local_5[0][_local_38];
                                };
                            };
                        };
                        _local_19.addChild(_local_34);
                        _local_38++;
                    };
                    _local_20++;
                };
                _local_21 = new UIComponent();
                _local_21.graphics.beginFill(0, 1);
                _local_21.graphics.drawRect(0, 20, 130, 60);
                _local_21.graphics.endFill();
                _local_19.mask = _local_21;
                smallUIBottom.addChild(_local_21);
                _local_22 = 0;
                while (_local_22 < 3)
                {
                    _local_39 = new CubeMasterButton();
                    _local_39.type = 2;
                    _local_39.index = _local_22;
                    _local_39.x = ((bigContainer.x + 55) - _local_39.width);
                    _local_39.y = (bigContainer.y + (55 * (_local_22 + 1)));
                    totalContainer.addChild(_local_39);
                    _local_22++;
                };
                _local_23 = 0;
                while (_local_23 < 3)
                {
                    _local_39 = new CubeMasterButton();
                    _local_39.type = 2;
                    _local_39.index = _local_23;
                    _local_39.x = (bigContainer.x + (4 * 55));
                    _local_39.y = (bigContainer.y + (55 * (_local_23 + 1)));
                    totalContainer.addChild(_local_39);
                    _local_23++;
                };
                _local_24 = 0;
                while (_local_24 < 3)
                {
                    _local_39 = new CubeMasterButton();
                    _local_39.type = 3;
                    _local_39.index = _local_24;
                    _local_39.x = ((bigContainer.x + 55) - _local_39.width);
                    _local_39.y = ((bigContainer.y + (55 * (_local_24 + 1))) + _local_39.height);
                    totalContainer.addChild(_local_39);
                    _local_24++;
                };
                _local_25 = 0;
                while (_local_25 < 3)
                {
                    _local_39 = new CubeMasterButton();
                    _local_39.type = 3;
                    _local_39.index = _local_25;
                    _local_39.x = (bigContainer.x + (4 * 55));
                    _local_39.y = ((bigContainer.y + (55 * (_local_25 + 1))) + _local_39.height);
                    totalContainer.addChild(_local_39);
                    _local_25++;
                };
                _local_26 = 0;
                while (_local_26 < 3)
                {
                    _local_39 = new CubeMasterButton();
                    _local_39.type = 0;
                    _local_39.index = _local_26;
                    _local_39.x = (bigContainer.x + (55 * (_local_26 + 1)));
                    _local_39.y = ((bigContainer.y + 55) - _local_39.height);
                    totalContainer.addChild(_local_39);
                    _local_26++;
                };
                _local_27 = 0;
                while (_local_27 < 3)
                {
                    _local_39 = new CubeMasterButton();
                    _local_39.type = 0;
                    _local_39.index = _local_27;
                    _local_39.x = (bigContainer.x + (55 * (_local_27 + 1)));
                    _local_39.y = (bigContainer.y + (55 * 4));
                    totalContainer.addChild(_local_39);
                    _local_27++;
                };
                _local_28 = 0;
                while (_local_28 < 3)
                {
                    _local_39 = new CubeMasterButton();
                    _local_39.type = 1;
                    _local_39.index = _local_28;
                    _local_39.x = ((bigContainer.x + (55 * (_local_28 + 1))) + _local_39.width);
                    _local_39.y = ((bigContainer.y + 55) - _local_39.height);
                    totalContainer.addChild(_local_39);
                    _local_28++;
                };
                _local_29 = 0;
                while (_local_29 < 3)
                {
                    _local_39 = new CubeMasterButton();
                    _local_39.type = 1;
                    _local_39.index = _local_29;
                    _local_39.x = ((bigContainer.x + (55 * (_local_29 + 1))) + _local_39.width);
                    _local_39.y = (bigContainer.y + (55 * 4));
                    totalContainer.addChild(_local_39);
                    _local_29++;
                };
                _local_30 = _arg_1["lastNum"];
                _local_31 = _arg_1["totalNum"];
                curLastNum.text = Language.ANNIVERSARY_LANG[7].toString().replace("{cnum}", _local_30).replace("{lnum}", _local_31);
                _local_32 = _arg_1["score"];
                todayScore.text = todayScore.text.replace("{num}", _local_32);
                changeCell.type = 2;
                changeCell.color = int(_arg_1["replaceCube"]);
            };
        }

        public function ___CubeMaster_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            addTimes();
        }

        public function set curLastNum(_arg_1:Label):void
        {
            var _local_2:Object = this._564289872curLastNum;
            if (_local_2 !== _arg_1)
            {
                this._564289872curLastNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curLastNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bigContainer():Canvas
        {
            return (this._1404137631bigContainer);
        }

        public function set changeCell(_arg_1:MagicCell):void
        {
            var _local_2:Object = this._2132428494changeCell;
            if (_local_2 !== _arg_1)
            {
                this._2132428494changeCell = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeCell", _local_2, _arg_1));
            };
        }

        public function endGame():void
        {
            _core.remote.call("endMagicCubeGame", new Responder(setGameScore));
            _state = 0;
        }

        [Bindable(event="propertyChange")]
        public function get smallUITop():Canvas
        {
            return (this._1219476858smallUITop);
        }

        private function setGameScore(_arg_1:int):void
        {
            if (_arg_1)
            {
                todayScore.text = Language.ANNIVERSARY_LANG[8].toString().replace("{num}", _arg_1);
            };
        }

        private function _CubeMaster_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ANNIVERSARY_LANG[12];
            _local_1 = ResManager.getIconUrl(4130220000722);
            _local_1 = Language.ANNIVERSARY_LANG[7];
            _local_1 = Language.ANNIVERSARY_LANG[8];
            _local_1 = Language.ANNIVERSARY_LANG[24];
        }

        [Bindable(event="propertyChange")]
        public function get smallUILeft():Canvas
        {
            return (this._851171198smallUILeft);
        }

        override public function initialize():void
        {
            var target:CubeMaster;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CubeMaster_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CubeMasterWatcherSetupUtil");
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

        public function ___CubeMaster_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            changeMagicCube();
        }

        private function register():void
        {
            CubeMaster.decoProxy.addEventListener(GameEvent.CUBE_MOVE_END, onCubeMoveEnd);
        }

        [Bindable(event="propertyChange")]
        public function get totalContainer():Canvas
        {
            return (this._409271709totalContainer);
        }

        public function set todayScore(_arg_1:Label):void
        {
            var _local_2:Object = this._1835012049todayScore;
            if (_local_2 !== _arg_1)
            {
                this._1835012049todayScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "todayScore", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get curLastNum():Label
        {
            return (this._564289872curLastNum);
        }

        public function changeMagicCube():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("changeMagicCube", new Responder(onGetData));
                };
            };
            Alert.show(Language.ANNIVERSARY_LANG[18].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        public function moveCube(_arg_1:uint, _arg_2:uint, _arg_3:uint):void
        {
            var _local_4:Object;
            var _local_5:MagicCell;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            if (!_state)
            {
                _core.sysMidNote("Sự kiện đã kết thúc");
                return;
            };
            if (_lastNum <= 0)
            {
                _core.sysMidNote("Không đủ lượt");
                return;
            };
            _type = _arg_1;
            _index = _arg_2;
            _direc = _arg_3;
            switch (_arg_1)
            {
                case 0:
                    switch (_arg_3)
                    {
                        case 0:
                            for (_local_4 in smallLeft[_arg_2])
                            {
                                _local_5 = (smallLeft[_arg_2][_local_4] as MagicCell);
                                _local_5.moveType = 1;
                                _local_5.moving = true;
                            };
                            for (_local_6 in big[(_arg_2 + 1)])
                            {
                                _local_5 = (big[(_arg_2 + 1)][_local_6] as MagicCell);
                                _local_5.moveType = 1;
                                _local_5.moving = true;
                            };
                            for (_local_7 in smallRight[_arg_2])
                            {
                                _local_5 = (smallRight[_arg_2][_local_7] as MagicCell);
                                _local_5.moveType = 1;
                                _local_5.moving = true;
                            };
                            break;
                        case 1:
                            for (_local_8 in smallLeft[_arg_2])
                            {
                                _local_5 = (smallLeft[_arg_2][_local_8] as MagicCell);
                                _local_5.moveType = 0;
                                _local_5.moving = true;
                            };
                            for (_local_9 in big[(_arg_2 + 1)])
                            {
                                _local_5 = (big[(_arg_2 + 1)][_local_9] as MagicCell);
                                _local_5.moveType = 0;
                                _local_5.moving = true;
                            };
                            for (_local_10 in smallRight[_arg_2])
                            {
                                _local_5 = (smallRight[_arg_2][_local_10] as MagicCell);
                                _local_5.moveType = 0;
                                _local_5.moving = true;
                            };
                            break;
                    };
                    break;
                case 1:
                    switch (_arg_3)
                    {
                        case 0:
                            _local_11 = 0;
                            while (_local_11 < 5)
                            {
                                _local_5 = (smallTop[_local_11][_arg_2] as MagicCell);
                                _local_5.moveType = 3;
                                _local_5.moving = true;
                                _local_11++;
                            };
                            _local_12 = 0;
                            while (_local_12 < 5)
                            {
                                _local_5 = (big[_local_12][(_arg_2 + 1)] as MagicCell);
                                _local_5.moveType = 3;
                                _local_5.moving = true;
                                _local_12++;
                            };
                            _local_13 = 0;
                            while (_local_13 < 5)
                            {
                                _local_5 = (smallBottom[_local_13][_arg_2] as MagicCell);
                                _local_5.moveType = 3;
                                _local_5.moving = true;
                                _local_13++;
                            };
                            break;
                        case 1:
                            _local_14 = 0;
                            while (_local_14 < 5)
                            {
                                _local_5 = (smallTop[_local_14][_arg_2] as MagicCell);
                                _local_5.moveType = 2;
                                _local_5.moving = true;
                                _local_14++;
                            };
                            _local_15 = 0;
                            while (_local_15 < 5)
                            {
                                _local_5 = (big[_local_15][(_arg_2 + 1)] as MagicCell);
                                _local_5.moveType = 2;
                                _local_5.moving = true;
                                _local_15++;
                            };
                            _local_16 = 0;
                            while (_local_16 < 5)
                            {
                                _local_5 = (smallBottom[_local_16][_arg_2] as MagicCell);
                                _local_5.moveType = 2;
                                _local_5.moving = true;
                                _local_16++;
                            };
                            break;
                    };
                    break;
            };
            _lastNum--;
        }

        private function _CubeMaster_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CubeMaster_BasicTitleCanvas1.text = _arg_1;
            }, "_CubeMaster_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000722));
            }, function (_arg_1:Object):void
            {
                _CubeMaster_Image1.source = _arg_1;
            }, "_CubeMaster_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curLastNum.text = _arg_1;
            }, "curLastNum.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                todayScore.text = _arg_1;
            }, "todayScore.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CubeMaster_IntroText1.htmlText = _arg_1;
            }, "_CubeMaster_IntroText1.htmlText");
            result[4] = binding;
            return (result);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" stone master load res Error ");
        }

        [Bindable(event="propertyChange")]
        public function get todayScore():Label
        {
            return (this._1835012049todayScore);
        }

        public function set smallUIBottom(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2086596582smallUIBottom;
            if (_local_2 !== _arg_1)
            {
                this._2086596582smallUIBottom = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "smallUIBottom", _local_2, _arg_1));
            };
        }

        public function set bigContainer(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1404137631bigContainer;
            if (_local_2 !== _arg_1)
            {
                this._1404137631bigContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bigContainer", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get smallUIBottom():Canvas
        {
            return (this._2086596582smallUIBottom);
        }

        public function set smallUITop(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1219476858smallUITop;
            if (_local_2 !== _arg_1)
            {
                this._1219476858smallUITop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "smallUITop", _local_2, _arg_1));
            };
        }

        public function ___CubeMaster_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            register();
        }

        private function getCubeRes():void
        {
            var _local_1:LoaderContext;
            if (!loader)
            {
                loader = new Loader();
                _local_1 = new LoaderContext();
                _local_1.applicationDomain = ApplicationDomain.currentDomain;
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                loader.load(new URLRequest(ResManager.getResUrl(2080130106014)), _local_1);
            };
        }

        private function onCubeMoveEnd(_arg_1:Event):void
        {
            _endCount++;
            if (_endCount == 15)
            {
                if ((((_type > -1) && (_index > -1)) && (_direc > -1)))
                {
                    _core.remote.call("moveMagicCubeByClient", new Responder(onGetData), _type, _index, _direc);
                    _endCount = 0;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

