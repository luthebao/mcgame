// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.FarmMaster

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.Event;
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

    public class FarmMaster extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _FarmMaster_IntroText1:IntroText;
        public var _FarmMaster_Image2:Image;
        private var _564289872curLastNum:Label;
        public var _FarmMaster_Label2:Label;
        private var _938645478rabbit:Image;
        private var _2141875252cubeContainer:Tile;
        private var _1835012049todayScore:Label;
        public var _FarmMaster_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":560,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FarmMaster_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":400,
                                "height":370,
                                "x":9,
                                "y":36,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Tile,
                                    "id":"cubeContainer",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 0;
                                        this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":360,
                                            "height":360,
                                            "y":5,
                                            "x":4
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"rabbit",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "events":{"click":"___FarmMaster_BasicDelayButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdGreen",
                                            "label":"Dừng",
                                            "x":364,
                                            "y":341
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
                                    "id":"_FarmMaster_Label2",
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
                                    "id":"_FarmMaster_Image2",
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
                                    "events":{"click":"___FarmMaster_BasicDelayButton2_click"},
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
                                    "id":"_FarmMaster_IntroText1",
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
        private const _sourceArr:Array = [4130220000715, 4130220000712, 4130220000714, 4130220000713];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FarmMaster()
        {
            mx_internal::_document = this;
            this.width = 560;
            this.height = 430;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FarmMaster._watcherSetupUtil = _arg_1;
        }


        private function onSetTimes(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:int;
            if (_arg_1)
            {
                _local_2 = _arg_1["cnum"];
                _local_3 = _arg_1["lnum"];
                curLastNum.text = Language.ANNIVERSARY_LANG[7].toString().replace("{cnum}", _local_2).replace("{lnum}", _local_3);
            };
        }

        public function ___FarmMaster_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            addTimes();
        }

        override public function initialize():void
        {
            var target:FarmMaster;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FarmMaster_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_FarmMasterWatcherSetupUtil");
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
        public function get rabbit():Image
        {
            return (this._938645478rabbit);
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

        private function addTimes():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("addFarmMasterTimes", new Responder(onSetTimes));
                };
            };
            Alert.show(Language.ANNIVERSARY_LANG[10].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        public function set cubeContainer(_arg_1:Tile):void
        {
            var _local_2:Object = this._2141875252cubeContainer;
            if (_local_2 !== _arg_1)
            {
                this._2141875252cubeContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cubeContainer", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            _core.remote.call("getFarmMasterData", new Responder(onGetData));
        }

        [Bindable(event="propertyChange")]
        public function get curLastNum():Label
        {
            return (this._564289872curLastNum);
        }

        public function set rabbit(_arg_1:Image):void
        {
            var _local_2:Object = this._938645478rabbit;
            if (_local_2 !== _arg_1)
            {
                this._938645478rabbit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rabbit", _local_2, _arg_1));
            };
        }

        private function onGetData(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:FarmMasterCube;
            if (_arg_1)
            {
                visible = true;
                if (cubeContainer.numChildren > 0)
                {
                    cubeContainer.removeAllChildren();
                };
                _local_2 = _arg_1["map"];
                _local_3 = 0;
                while (_local_3 < 7)
                {
                    _local_7 = 0;
                    while (_local_7 < 7)
                    {
                        _local_8 = new FarmMasterCube();
                        _local_8.type = _local_2[_local_3][_local_7];
                        _local_8.rowIndex = _local_3;
                        _local_8.columnIndex = _local_7;
                        _local_8.clickFunc = cubeClick;
                        _local_8.name = (("fmCube" + _local_3) + _local_7);
                        cubeContainer.addChild(_local_8);
                        _local_7++;
                    };
                    _local_3++;
                };
                rabbit.source = ResManager.getIconUrl(_sourceArr[Number(_arg_1["dir"])]);
                rabbit.x = (_arg_1["pos"][1] * 50);
                rabbit.y = (_arg_1["pos"][0] * 50);
                _local_4 = _arg_1["lastNum"];
                _local_5 = _arg_1["totalNum"];
                curLastNum.text = Language.ANNIVERSARY_LANG[7].toString().replace("{cnum}", _local_4).replace("{lnum}", _local_5);
                _local_6 = _arg_1["score"];
                todayScore.text = todayScore.text.replace("{num}", _local_6);
            };
        }

        public function ___FarmMaster_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            endGame();
        }

        [Bindable(event="propertyChange")]
        public function get todayScore():Label
        {
            return (this._1835012049todayScore);
        }

        [Bindable(event="propertyChange")]
        public function get cubeContainer():Tile
        {
            return (this._2141875252cubeContainer);
        }

        private function _FarmMaster_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FarmMaster_BasicTitleCanvas1.text = _arg_1;
            }, "_FarmMaster_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                todayScore.text = _arg_1;
            }, "todayScore.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FarmMaster_Label2.text = _arg_1;
            }, "_FarmMaster_Label2.text");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000720));
            }, function (_arg_1:Object):void
            {
                _FarmMaster_Image2.source = _arg_1;
            }, "_FarmMaster_Image2.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curLastNum.text = _arg_1;
            }, "curLastNum.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FarmMaster_IntroText1.htmlText = _arg_1;
            }, "_FarmMaster_IntroText1.htmlText");
            result[5] = binding;
            return (result);
        }

        public function cubeClick(event:Event):void
        {
            var cube:FarmMasterCube;
            var func:Function;
            cube = (event.target as FarmMasterCube);
            if (cube.type == 3)
            {
                _core.remote.call("openUpWasteland", new Responder(onGetData), cube.rowIndex, cube.columnIndex);
            };
            if (cube.type == 2)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("clearRock", new Responder(onGetData), cube.rowIndex, cube.columnIndex);
                    };
                };
                Alert.show(Language.ANNIVERSARY_LANG[6].toString(), "", (Alert.YES | Alert.NO), null, func);
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

        private function _FarmMaster_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ANNIVERSARY_LANG[5];
            _local_1 = Language.ANNIVERSARY_LANG[8];
            _local_1 = Language.ANNIVERSARY_LANG[9];
            _local_1 = ResManager.getIconUrl(4130220000720);
            _local_1 = Language.ANNIVERSARY_LANG[7];
            _local_1 = Language.ANNIVERSARY_LANG[22];
        }

        public function endGame():void
        {
            _core.remote.call("endFarmMaster", new Responder(setGameScore));
        }

        private function setGameScore(_arg_1:int):void
        {
            if (_arg_1)
            {
                todayScore.text = Language.ANNIVERSARY_LANG[8].toString().replace("{num}", _arg_1);
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

