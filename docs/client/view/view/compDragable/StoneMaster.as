// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.StoneMaster

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.containers.Canvas;
    import flash.display.BitmapData;
    import com.qeedoo.ui.view.comp.IntroText;
    import flash.display.Loader;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.controls.HRule;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.net.Responder;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import mx.events.PropertyChangeEvent;
    import mx.core.UIComponent;
    import flash.display.Bitmap;
    import com.qeedoo.ui.view.comp.StoneMasterCube;
    import flash.events.MouseEvent;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.net.URLRequest;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class StoneMaster extends DragableCanvas implements IBindingClient 
    {

        public static var stoneBMD:Object = {};
        public static var stoneBMDLight:Object = {};
        public static var stoneBMDGray:Object = {};
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1278466497steelyardNum:Label;
        private var _1656874708stoneType3:Canvas;
        private var _176491618stoneType10:Canvas;
        private var goalNumBMD:BitmapData;
        public var _StoneMaster_IntroText1:IntroText;
        private var _1576922576stoneBox6:Canvas;
        private var loader:Loader;
        private var _564289872curLastNum:Label;
        private var _865535507goalNumCvs:Canvas;
        public var _StoneMaster_Image1:Image;
        public var _StoneMaster_Image2:Image;
        private var _1576922577stoneBox7:Canvas;
        private var _1656874711stoneType6:Canvas;
        private var _1835012049todayScore:Label;
        private var _1639959493stoneBox10:Canvas;
        private var _1656874707stoneType2:Canvas;
        private var loadCompleteFlag:Boolean = false;
        private var _1576922578stoneBox8:Canvas;
        public var _StoneMaster_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1656874714stoneType9:Canvas;
        private var _2100909011currentNumCvs:Canvas;
        private var _1656874710stoneType5:Canvas;
        private var _865527485goalNumLbl:Label;
        private var _1576922571stoneBox1:Canvas;
        private var _1656874706stoneType1:Canvas;
        private var _1576922579stoneBox9:Canvas;
        private var _1576922572stoneBox2:Canvas;
        private var _2100917033currentNumLbl:Label;
        private var _176491617stoneType11:Canvas;
        private var _1656874713stoneType8:Canvas;
        private var _1576922573stoneBox3:Canvas;
        public var _StoneMaster_Label5:Label;
        private var _1656874709stoneType4:Canvas;
        private var _1576922574stoneBox4:Canvas;
        private var _1656874712stoneType7:Canvas;
        private var _1576922575stoneBox5:Canvas;
        private var currentNumBMD:BitmapData;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":560,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_StoneMaster_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
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
                                    "id":"_StoneMaster_Image1"
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27,
                                            "y":10,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27,
                                            "y":74,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27,
                                            "y":139,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27,
                                            "y":204,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27,
                                            "y":271,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "y":300,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "y":242,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "y":184,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "y":126,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "y":68,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneType11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "y":10,
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":207,
                                            "y":170
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":248,
                                            "y":170
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":287,
                                            "y":171
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":322,
                                            "y":171
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":226,
                                            "y":137
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":263,
                                            "y":137
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":300,
                                            "y":137
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":247,
                                            "y":97
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":280,
                                            "y":97
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"stoneBox10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50,
                                            "x":261,
                                            "y":64
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"goalNumCvs",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":155,
                                            "height":40,
                                            "x":207,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"goalNumLbl",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 18;
                                        this.color = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"0000",
                                            "x":272,
                                            "y":17
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"currentNumCvs",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":135,
                                            "height":130,
                                            "x":226,
                                            "y":230
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"currentNumLbl",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 18;
                                        this.color = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"0000",
                                            "x":270,
                                            "y":282
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"steelyardNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":243,
                                            "y":342
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___StoneMaster_Button1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"Xem",
                                            "styleName":"BtnStdGreen",
                                            "x":0x0101,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___StoneMaster_Button2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"Dừng",
                                            "styleName":"BtnStdGreen",
                                            "x":298,
                                            "y":315
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
                                    "id":"_StoneMaster_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":39});
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
                                    "type":Image,
                                    "id":"_StoneMaster_Image2",
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
                                    "type":Label,
                                    "id":"curLastNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":128});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "events":{"click":"___StoneMaster_BasicDelayButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnAdd",
                                            "x":110,
                                            "y":128
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
                                    "id":"_StoneMaster_IntroText1",
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function StoneMaster()
        {
            mx_internal::_document = this;
            this.width = 560;
            this.height = 430;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StoneMaster._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get todayScore():Label
        {
            return (this._1835012049todayScore);
        }

        public function showPanel():void
        {
            getStoneRes();
            if (loadCompleteFlag)
            {
                _core.remote.call("getWeightMasterData", new Responder(onGetData));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stoneType2():Canvas
        {
            return (this._1656874707stoneType2);
        }

        private function addTimes():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("addWeightMasterTimes", new Responder(onGetData));
                };
            };
            Alert.show(Language.ANNIVERSARY_LANG[15].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get currentNumLbl():Label
        {
            return (this._2100917033currentNumLbl);
        }

        private function _StoneMaster_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ANNIVERSARY_LANG[11];
            _local_1 = ResManager.getIconUrl(4130220000721);
            _local_1 = Language.ANNIVERSARY_LANG[14];
            _local_1 = Language.ANNIVERSARY_LANG[8];
            _local_1 = Language.ANNIVERSARY_LANG[25];
            _local_1 = ResManager.getIconUrl(4130220000719);
            _local_1 = Language.ANNIVERSARY_LANG[7];
            _local_1 = Language.ANNIVERSARY_LANG[23];
        }

        private function seeThrTrueWeight():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("seeTheTrueWeight", new Responder(onGetData));
                };
            };
            Alert.show(Language.ANNIVERSARY_LANG[16].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_10:String;
            var _local_11:Class;
            var _local_12:MovieClip;
            var _local_13:BitmapData;
            var _local_2:int = 1;
            while (_local_2 <= 11)
            {
                _local_10 = ("shitou" + _local_2);
                _local_11 = (loader.contentLoaderInfo.applicationDomain.getDefinition(_local_10) as Class);
                _local_12 = new (_local_11)();
                _local_13 = new BitmapData(_local_12.width, _local_12.height, true, 0xFFFFFF);
                _local_13.draw(_local_12);
                stoneBMD[_local_2] = _local_13;
                _local_2++;
            };
            var _local_3:int = 1;
            while (_local_3 <= 11)
            {
                _local_10 = (("shitou" + _local_3) + "L");
                _local_11 = (loader.contentLoaderInfo.applicationDomain.getDefinition(_local_10) as Class);
                _local_12 = new (_local_11)();
                _local_13 = new BitmapData(_local_12.width, _local_12.height, true, 0xFFFFFF);
                _local_13.draw(_local_12);
                stoneBMDLight[_local_3] = _local_13;
                _local_3++;
            };
            var _local_4:Class = (loader.contentLoaderInfo.applicationDomain.getDefinition("goalNum") as Class);
            var _local_5:MovieClip = new (_local_4)();
            var _local_6:BitmapData = new BitmapData(_local_5.width, _local_5.height, true, 0xFFFFFF);
            _local_6.draw(_local_5);
            goalNumBMD = _local_6;
            var _local_7:Class = (loader.contentLoaderInfo.applicationDomain.getDefinition("currentNum") as Class);
            var _local_8:MovieClip = new (_local_7)();
            var _local_9:BitmapData = new BitmapData(_local_8.width, _local_8.height, true, 0xFFFFFF);
            _local_9.draw(_local_8);
            currentNumBMD = _local_9;
            loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            loadCompleteFlag = true;
            _core.remote.call("getWeightMasterData", new Responder(onGetData));
        }

        public function set stoneType11(_arg_1:Canvas):void
        {
            var _local_2:Object = this._176491617stoneType11;
            if (_local_2 !== _arg_1)
            {
                this._176491617stoneType11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType11", _local_2, _arg_1));
            };
        }

        public function onGetData(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:UIComponent;
            var _local_6:Bitmap;
            var _local_7:int;
            var _local_8:UIComponent;
            var _local_9:Bitmap;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:Canvas;
            var _local_15:StoneMasterCube;
            if (_arg_1)
            {
                visible = true;
                _local_2 = 1;
                while (_local_2 <= 11)
                {
                    _local_14 = (this[("stoneType" + _local_2)] as Canvas);
                    _local_15 = new StoneMasterCube();
                    _local_15.register();
                    _local_15.type = 1;
                    _local_15.index = _local_2;
                    if (_local_14.numChildren > 0)
                    {
                        _local_14.removeAllChildren();
                    };
                    _local_14.addChild(_local_15);
                    _local_2++;
                };
                _local_3 = _arg_1["steelyardArr"];
                _local_4 = 1;
                while (_local_4 <= 10)
                {
                    _local_14 = (this[("stoneBox" + _local_4)] as Canvas);
                    if (_local_14.numChildren > 0)
                    {
                        _local_14.removeAllChildren();
                    };
                    if (Number(_local_3[(_local_4 - 1)]))
                    {
                        _local_15 = new StoneMasterCube();
                        _local_15.register();
                        _local_15.type = 2;
                        _local_15.position = _local_4;
                        _local_15.index = _local_3[(_local_4 - 1)];
                        _local_14.addChild(_local_15);
                    };
                    _local_4++;
                };
                _local_5 = new UIComponent();
                _local_6 = new Bitmap(goalNumBMD);
                _local_5.addChild(_local_6);
                if (goalNumCvs.numChildren > 0)
                {
                    goalNumCvs.removeAllChildren();
                };
                goalNumCvs.addChild(_local_5);
                _local_7 = _arg_1["targetWeight"];
                goalNumLbl.text = String(_local_7);
                _local_8 = new UIComponent();
                _local_9 = new Bitmap(currentNumBMD);
                _local_8.addChild(_local_9);
                if (currentNumCvs.numChildren > 0)
                {
                    currentNumCvs.removeAllChildren();
                };
                currentNumCvs.addChild(_local_8);
                _local_10 = _arg_1["steelyardWeight"];
                if (_arg_1["openFlag"])
                {
                    currentNumLbl.text = (_local_10 + "");
                }
                else
                {
                    currentNumLbl.text = hideSomeNum(_local_10);
                };
                if (_arg_1["state"] == 0)
                {
                    currentNumLbl.text = (_local_10 + "");
                };
                steelyardNum.text = Language.ANNIVERSARY_LANG[14].toString().replace("{cnum}", _arg_1["stoneNum"]);
                _local_11 = _arg_1["lastNum"];
                _local_12 = _arg_1["totalNum"];
                curLastNum.text = Language.ANNIVERSARY_LANG[7].toString().replace("{cnum}", _local_11).replace("{lnum}", _local_12);
                _local_13 = _arg_1["score"];
                todayScore.text = todayScore.text.replace("{num}", _local_13);
            };
        }

        public function set currentNumLbl(_arg_1:Label):void
        {
            var _local_2:Object = this._2100917033currentNumLbl;
            if (_local_2 !== _arg_1)
            {
                this._2100917033currentNumLbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentNumLbl", _local_2, _arg_1));
            };
        }

        private function hideSomeNum(_arg_1:int):String
        {
            var _local_2:* = "";
            var _local_3:int = int((_arg_1 / 1000));
            var _local_4:int = int(((_arg_1 - (_local_3 * 1000)) / 100));
            var _local_5:int = int((((_arg_1 - (_local_3 * 1000)) - (_local_4 * 100)) / 10));
            var _local_6:int = (((_arg_1 - (_local_3 * 1000)) - (_local_4 * 100)) - (_local_5 * 10));
            if (((_arg_1 >= 2000) && (_arg_1 < 2500)))
            {
                _local_2 = ((((_local_2 + _local_3) + _local_4) + _local_5) + "*");
            }
            else
            {
                if (_arg_1 >= 2500)
                {
                    _local_2 = ((((_local_2 + _local_3) + _local_4) + "*") + "*");
                }
                else
                {
                    _local_2 = ((((_local_2 + _local_3) + _local_4) + _local_5) + _local_6);
                };
            };
            return (_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get goalNumLbl():Label
        {
            return (this._865527485goalNumLbl);
        }

        public function ___StoneMaster_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            addTimes();
        }

        public function set stoneType10(_arg_1:Canvas):void
        {
            var _local_2:Object = this._176491618stoneType10;
            if (_local_2 !== _arg_1)
            {
                this._176491618stoneType10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType10", _local_2, _arg_1));
            };
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

        private function getStoneRes():void
        {
            var _local_1:LoaderContext;
            if (!loader)
            {
                loader = new Loader();
                _local_1 = new LoaderContext();
                _local_1.applicationDomain = ApplicationDomain.currentDomain;
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                loader.load(new URLRequest(ResManager.getResUrl(2080130106013)), _local_1);
            };
        }

        public function endGame():void
        {
            _core.remote.call("endWeightMasterGame", new Responder(onGetData));
        }

        public function set goalNumLbl(_arg_1:Label):void
        {
            var _local_2:Object = this._865527485goalNumLbl;
            if (_local_2 !== _arg_1)
            {
                this._865527485goalNumLbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goalNumLbl", _local_2, _arg_1));
            };
        }

        public function set steelyardNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1278466497steelyardNum;
            if (_local_2 !== _arg_1)
            {
                this._1278466497steelyardNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "steelyardNum", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:StoneMaster;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StoneMaster_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_StoneMasterWatcherSetupUtil");
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

        public function ___StoneMaster_Button1_click(_arg_1:MouseEvent):void
        {
            seeThrTrueWeight();
        }

        public function set stoneBox10(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1639959493stoneBox10;
            if (_local_2 !== _arg_1)
            {
                this._1639959493stoneBox10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox10", _local_2, _arg_1));
            };
        }

        public function set stoneBox4(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1576922574stoneBox4;
            if (_local_2 !== _arg_1)
            {
                this._1576922574stoneBox4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox4", _local_2, _arg_1));
            };
        }

        public function set stoneBox2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1576922572stoneBox2;
            if (_local_2 !== _arg_1)
            {
                this._1576922572stoneBox2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox2", _local_2, _arg_1));
            };
        }

        public function set stoneBox6(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1576922576stoneBox6;
            if (_local_2 !== _arg_1)
            {
                this._1576922576stoneBox6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox6", _local_2, _arg_1));
            };
        }

        public function set stoneBox3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1576922573stoneBox3;
            if (_local_2 !== _arg_1)
            {
                this._1576922573stoneBox3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox3", _local_2, _arg_1));
            };
        }

        public function set stoneBox8(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1576922578stoneBox8;
            if (_local_2 !== _arg_1)
            {
                this._1576922578stoneBox8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox8", _local_2, _arg_1));
            };
        }

        public function set stoneBox1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1576922571stoneBox1;
            if (_local_2 !== _arg_1)
            {
                this._1576922571stoneBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox1", _local_2, _arg_1));
            };
        }

        public function set stoneType3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1656874708stoneType3;
            if (_local_2 !== _arg_1)
            {
                this._1656874708stoneType3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType3", _local_2, _arg_1));
            };
        }

        public function set stoneBox7(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1576922577stoneBox7;
            if (_local_2 !== _arg_1)
            {
                this._1576922577stoneBox7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox7", _local_2, _arg_1));
            };
        }

        public function set stoneType4(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1656874709stoneType4;
            if (_local_2 !== _arg_1)
            {
                this._1656874709stoneType4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType4", _local_2, _arg_1));
            };
        }

        public function set stoneType1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1656874706stoneType1;
            if (_local_2 !== _arg_1)
            {
                this._1656874706stoneType1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType1", _local_2, _arg_1));
            };
        }

        public function set stoneType5(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1656874710stoneType5;
            if (_local_2 !== _arg_1)
            {
                this._1656874710stoneType5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stoneType11():Canvas
        {
            return (this._176491617stoneType11);
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

        public function set stoneType8(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1656874713stoneType8;
            if (_local_2 !== _arg_1)
            {
                this._1656874713stoneType8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType8", _local_2, _arg_1));
            };
        }

        public function set stoneType9(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1656874714stoneType9;
            if (_local_2 !== _arg_1)
            {
                this._1656874714stoneType9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType9", _local_2, _arg_1));
            };
        }

        public function set currentNumCvs(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2100909011currentNumCvs;
            if (_local_2 !== _arg_1)
            {
                this._2100909011currentNumCvs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentNumCvs", _local_2, _arg_1));
            };
        }

        public function set stoneBox5(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1576922575stoneBox5;
            if (_local_2 !== _arg_1)
            {
                this._1576922575stoneBox5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get curLastNum():Label
        {
            return (this._564289872curLastNum);
        }

        public function set stoneType6(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1656874711stoneType6;
            if (_local_2 !== _arg_1)
            {
                this._1656874711stoneType6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType6", _local_2, _arg_1));
            };
        }

        public function set stoneBox9(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1576922579stoneBox9;
            if (_local_2 !== _arg_1)
            {
                this._1576922579stoneBox9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneBox9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get steelyardNum():Label
        {
            return (this._1278466497steelyardNum);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" stone master load res Error ");
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox1():Canvas
        {
            return (this._1576922571stoneBox1);
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox3():Canvas
        {
            return (this._1576922573stoneBox3);
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox5():Canvas
        {
            return (this._1576922575stoneBox5);
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox6():Canvas
        {
            return (this._1576922576stoneBox6);
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox7():Canvas
        {
            return (this._1576922577stoneBox7);
        }

        public function ___StoneMaster_Button2_click(_arg_1:MouseEvent):void
        {
            endGame();
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox10():Canvas
        {
            return (this._1639959493stoneBox10);
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox4():Canvas
        {
            return (this._1576922574stoneBox4);
        }

        [Bindable(event="propertyChange")]
        public function get stoneType5():Canvas
        {
            return (this._1656874710stoneType5);
        }

        [Bindable(event="propertyChange")]
        public function get stoneType10():Canvas
        {
            return (this._176491618stoneType10);
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox8():Canvas
        {
            return (this._1576922578stoneBox8);
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox2():Canvas
        {
            return (this._1576922572stoneBox2);
        }

        [Bindable(event="propertyChange")]
        public function get stoneType4():Canvas
        {
            return (this._1656874709stoneType4);
        }

        public function set stoneType7(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1656874712stoneType7;
            if (_local_2 !== _arg_1)
            {
                this._1656874712stoneType7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stoneType6():Canvas
        {
            return (this._1656874711stoneType6);
        }

        private function _StoneMaster_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StoneMaster_BasicTitleCanvas1.text = _arg_1;
            }, "_StoneMaster_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000721));
            }, function (_arg_1:Object):void
            {
                _StoneMaster_Image1.source = _arg_1;
            }, "_StoneMaster_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                steelyardNum.text = _arg_1;
            }, "steelyardNum.text");
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
                var _local_1:* = Language.ANNIVERSARY_LANG[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StoneMaster_Label5.text = _arg_1;
            }, "_StoneMaster_Label5.text");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000719));
            }, function (_arg_1:Object):void
            {
                _StoneMaster_Image2.source = _arg_1;
            }, "_StoneMaster_Image2.source");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curLastNum.text = _arg_1;
            }, "curLastNum.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StoneMaster_IntroText1.htmlText = _arg_1;
            }, "_StoneMaster_IntroText1.htmlText");
            result[7] = binding;
            return (result);
        }

        public function set goalNumCvs(_arg_1:Canvas):void
        {
            var _local_2:Object = this._865535507goalNumCvs;
            if (_local_2 !== _arg_1)
            {
                this._865535507goalNumCvs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goalNumCvs", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get currentNumCvs():Canvas
        {
            return (this._2100909011currentNumCvs);
        }

        [Bindable(event="propertyChange")]
        public function get stoneType3():Canvas
        {
            return (this._1656874708stoneType3);
        }

        [Bindable(event="propertyChange")]
        public function get stoneType7():Canvas
        {
            return (this._1656874712stoneType7);
        }

        [Bindable(event="propertyChange")]
        public function get stoneType8():Canvas
        {
            return (this._1656874713stoneType8);
        }

        [Bindable(event="propertyChange")]
        public function get stoneType9():Canvas
        {
            return (this._1656874714stoneType9);
        }

        [Bindable(event="propertyChange")]
        public function get stoneType1():Canvas
        {
            return (this._1656874706stoneType1);
        }

        [Bindable(event="propertyChange")]
        public function get stoneBox9():Canvas
        {
            return (this._1576922579stoneBox9);
        }

        [Bindable(event="propertyChange")]
        public function get goalNumCvs():Canvas
        {
            return (this._865535507goalNumCvs);
        }

        public function set stoneType2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1656874707stoneType2;
            if (_local_2 !== _arg_1)
            {
                this._1656874707stoneType2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneType2", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

