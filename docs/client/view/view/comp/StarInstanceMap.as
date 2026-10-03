// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.StarInstanceMap

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.containers.Tile;
    import mx.controls.Image;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class StarInstanceMap extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _180315225levelBtn12:MyButton;
        private var _1656751361levelBtn7:MyButton;
        private var _1452859372starPointNeed:Label;
        private var firstFlag:Boolean = true;
        private var _1256650571loaderCanvas:SimpleCanvas;
        private var _1656751359levelBtn9:MyButton;
        private var _1656751363levelBtn5:MyButton;
        private var _2126743388starIns11:StarInstanceCanvas;
        private var _1315853344starTile:Tile;
        private var _180315223levelBtn10:MyButton;
        private var _1656751365levelBtn3:MyButton;
        private var _1315530614starIns2:StarInstanceCanvas;
        private var _114892273_warMapMax:uint = 5;
        private var _1315530616starIns4:StarInstanceCanvas;
        private var _1315530618starIns6:StarInstanceCanvas;
        private var info:Object;
        private var _1315530621starIns9:StarInstanceCanvas;
        private var _1656751367levelBtn1:MyButton;
        private var _1656751360levelBtn8:MyButton;
        private var playerStarData:Object;
        private var _1438589353selectedLevel:uint = 0;
        private var _2126743387starIns10:StarInstanceCanvas;
        private var _180315224levelBtn11:MyButton;
        private var _114893843_warMapNum:uint = 0;
        private var _1656751362levelBtn6:MyButton;
        private var _1656751364levelBtn4:MyButton;
        private var _2126743389starIns12:StarInstanceCanvas;
        private var _1315530615starIns3:StarInstanceCanvas;
        private var _1315530613starIns1:StarInstanceCanvas;
        private var _1315530617starIns5:StarInstanceCanvas;
        private var _1315530619starIns7:StarInstanceCanvas;
        private var _1656751366levelBtn2:MyButton;
        private var _1315530620starIns8:StarInstanceCanvas;
        private var _347234980backImg:Image;
        public var _StarInstanceMap_Label4:Label;
        private var _2082343164btnClose:Button;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"backImg",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Tile,
                        "id":"starTile",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":10,
                                "width":780,
                                "height":516,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns1",
                                    "events":{"click":"__starIns1_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns2",
                                    "events":{"click":"__starIns2_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns3",
                                    "events":{"click":"__starIns3_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns4",
                                    "events":{"click":"__starIns4_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns5",
                                    "events":{"click":"__starIns5_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns6",
                                    "events":{"click":"__starIns6_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns7",
                                    "events":{"click":"__starIns7_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns8",
                                    "events":{"click":"__starIns8_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns9",
                                    "events":{"click":"__starIns9_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns10",
                                    "events":{"click":"__starIns10_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns11",
                                    "events":{"click":"__starIns11_click"}
                                }), new UIComponentDescriptor({
                                    "type":StarInstanceCanvas,
                                    "id":"starIns12",
                                    "events":{"click":"__starIns12_click"}
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 15;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":801,
                                "y":35,
                                "percentHeight":100,
                                "width":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn1",
                                    "events":{"click":"__levelBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn2",
                                    "events":{"click":"__levelBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn3",
                                    "events":{"click":"__levelBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn4",
                                    "events":{"click":"__levelBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn5",
                                    "events":{"click":"__levelBtn5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn6",
                                    "events":{"click":"__levelBtn6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn7",
                                    "events":{"click":"__levelBtn7_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn8",
                                    "events":{"click":"__levelBtn8_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn9",
                                    "events":{"click":"__levelBtn9_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn10",
                                    "events":{"click":"__levelBtn10_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn11",
                                    "events":{"click":"__levelBtn11_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MyButton,
                                    "id":"levelBtn12",
                                    "events":{"click":"__levelBtn12_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":28,
                                            "height":28
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "events":{"click":"___StarInstanceMap_BasicGlowButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":204,
                                "y":528,
                                "label":"Đổi Danh Hiệu",
                                "styleName":"CrystalYellowButton"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "stylesFactory":function ():void
                        {
                            this.color = 16187149;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16,
                                "y":531,
                                "text":"Điểm hiện tại/Điểm cần"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"starPointNeed",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":169,
                                "y":532,
                                "text":"0/0"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "stylesFactory":function ():void
                        {
                            this.color = 16187149;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":323,
                                "y":532,
                                "text":"Mỗi ngày miễn phí 5 lần,tối đa 10 lần 1 ngày"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_StarInstanceMap_Label4",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":588,
                                "y":533
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "events":{"click":"___StarInstanceMap_BasicGlowButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":673,
                                "y":527,
                                "label":"Tăng thêm",
                                "styleName":"CrystalYellowButton"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"loaderCanvas",
                        "stylesFactory":function ():void
                        {
                            this.backgroundColor = 0xA1A1A1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "alpha":0.5,
                                "mouseEnabled":true,
                                "visible":true,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 36;
                                        this.color = 0x48FF00;
                                        this.horizontalCenter = "0";
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"Đang tải dữ liệu....",
                                            "width":361,
                                            "height":63
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnClose",
                        "events":{
                            "mouseDown":"__btnClose_mouseDown",
                            "click":"__btnClose_click"
                        },
                        "stylesFactory":function ():void
                        {
                            this.right = "12";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":9,
                                "styleName":"BtnPanelClose"
                            });
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        private const progressPer:Array = [0, 0.2, 0.28, 0.38, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.9, 1];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function StarInstanceMap()
        {
            mx_internal::_document = this;
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.mouseEnabled = true;
            this.addEventListener("creationComplete", ___StarInstanceMap_Canvas1_creationComplete);
            this.addEventListener("show", ___StarInstanceMap_Canvas1_show);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StarInstanceMap._watcherSetupUtil = _arg_1;
        }


        public function set levelBtn8(_arg_1:MyButton):void
        {
            var _local_2:Object = this._1656751360levelBtn8;
            if (_local_2 !== _arg_1)
            {
                this._1656751360levelBtn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn8", _local_2, _arg_1));
            };
        }

        public function __levelBtn12_click(_arg_1:MouseEvent):void
        {
            if (levelBtn12.enabled)
            {
                levelClick(12);
            };
        }

        [Bindable(event="propertyChange")]
        private function get _warMapNum():uint
        {
            return (this._114893843_warMapNum);
        }

        [Bindable(event="propertyChange")]
        public function get starPointNeed():Label
        {
            return (this._1452859372starPointNeed);
        }

        public function set levelBtn9(_arg_1:MyButton):void
        {
            var _local_2:Object = this._1656751359levelBtn9;
            if (_local_2 !== _arg_1)
            {
                this._1656751359levelBtn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn9", _local_2, _arg_1));
            };
        }

        public function __starIns1_click(_arg_1:MouseEvent):void
        {
            warMapClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get starTile():Tile
        {
            return (this._1315853344starTile);
        }

        public function __starIns9_click(_arg_1:MouseEvent):void
        {
            warMapClick(9);
        }

        public function set starPointNeed(_arg_1:Label):void
        {
            var _local_2:Object = this._1452859372starPointNeed;
            if (_local_2 !== _arg_1)
            {
                this._1452859372starPointNeed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starPointNeed", _local_2, _arg_1));
            };
        }

        public function __levelBtn2_click(_arg_1:MouseEvent):void
        {
            if (levelBtn2.enabled)
            {
                levelClick(2);
            };
        }

        private function setPlayerData():void
        {
            var _local_2:uint;
            var _local_3:Object;
            var _local_1:Object = _core.player.starsData;
            if (_local_1)
            {
                playerStarData = new Object();
                _local_2 = 1;
                while (_local_2 < 13)
                {
                    if (_local_1[_local_2])
                    {
                        if (((_local_1[_local_2].tid) || (_local_1[_local_2].tid == 0)))
                        {
                            playerStarData[_local_2] = 0;
                            if (_local_1[_local_2].finishDate == -1)
                            {
                                _local_3 = GameData.d[GamePredef.TBL_STARS_TEMPLATE][_local_1[_local_2].tid];
                                if (((_local_3) && (_local_2 == _local_3.type)))
                                {
                                    playerStarData[_local_2] = _local_3.level;
                                }
                                else
                                {
                                    if (_local_1[_local_2].tid == 0)
                                    {
                                        playerStarData[_local_2] = 0;
                                    };
                                };
                            }
                            else
                            {
                                if (_local_1[_local_2].finishDate > 0)
                                {
                                    _local_3 = GameData.d[GamePredef.TBL_STARS_TEMPLATE][_local_1[_local_2].tid];
                                    if (((_local_3) && (_local_3.type)))
                                    {
                                        playerStarData[_local_2] = uint(_local_3.level);
                                    };
                                    playerStarData[_local_2]++;
                                };
                            };
                        };
                    };
                    _local_2++;
                };
            };
            showStarEnabled();
        }

        private function set _warMapNum(_arg_1:uint):void
        {
            var _local_2:Object = this._114893843_warMapNum;
            if (_local_2 !== _arg_1)
            {
                this._114893843_warMapNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_warMapNum", _local_2, _arg_1));
            };
        }

        private function setStarStyle():void
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_1:uint = 1;
            while (_local_1 < 13)
            {
                if (((info) && (info[_local_1])))
                {
                    _local_2 = 0;
                    _local_3 = 1;
                    while (_local_3 < 13)
                    {
                        if (((info[_local_1][_local_3]) && (info[_local_1][_local_3] > 0)))
                        {
                            _local_2++;
                        };
                        _local_3++;
                    };
                    if (0 == _local_2)
                    {
                        this[("levelBtn" + _local_1)].progress = 0;
                    }
                    else
                    {
                        if (_local_2 > 0)
                        {
                            this[("levelBtn" + _local_1)].progress = progressPer[_local_2];
                        };
                    };
                }
                else
                {
                    this[("levelBtn" + _local_1)].progress = 0;
                };
                _local_1++;
            };
        }

        public function set starTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._1315853344starTile;
            if (_local_2 !== _arg_1)
            {
                this._1315853344starTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starTile", _local_2, _arg_1));
            };
        }

        public function __starIns12_click(_arg_1:MouseEvent):void
        {
            warMapClick(12);
        }

        private function levelChange(_arg_1:uint):void
        {
            this.selectedLevel = _arg_1;
            var _local_2:uint = 1;
            while (_local_2 < 13)
            {
                this[("starIns" + _local_2)].level = selectedLevel;
                _local_2++;
            };
            setAllNum();
            showStarEnabled();
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn10():MyButton
        {
            return (this._180315223levelBtn10);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn12():MyButton
        {
            return (this._180315225levelBtn12);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn11():MyButton
        {
            return (this._180315224levelBtn11);
        }

        public function __starIns6_click(_arg_1:MouseEvent):void
        {
            warMapClick(6);
        }

        private function levelClick(_arg_1:uint):void
        {
            if (_arg_1 != selectedLevel)
            {
                if (selectedLevel)
                {
                    this[("levelBtn" + selectedLevel)].selected = false;
                };
                this[("levelBtn" + _arg_1)].selected = true;
                levelChange(_arg_1);
            };
        }

        public function __btnClose_click(_arg_1:MouseEvent):void
        {
            exit();
        }

        public function __levelBtn7_click(_arg_1:MouseEvent):void
        {
            if (levelBtn7.enabled)
            {
                levelClick(7);
            };
        }

        private function _StarInstanceMap_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn1.skin = _arg_1;
            }, "levelBtn1.skin");
            result[0] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn2.skin = _arg_1;
            }, "levelBtn2.skin");
            result[1] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn3.skin = _arg_1;
            }, "levelBtn3.skin");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn4.skin = _arg_1;
            }, "levelBtn4.skin");
            result[3] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn5.skin = _arg_1;
            }, "levelBtn5.skin");
            result[4] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn6.skin = _arg_1;
            }, "levelBtn6.skin");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn7.skin = _arg_1;
            }, "levelBtn7.skin");
            result[6] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn8.skin = _arg_1;
            }, "levelBtn8.skin");
            result[7] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn9.skin = _arg_1;
            }, "levelBtn9.skin");
            result[8] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn10.skin = _arg_1;
            }, "levelBtn10.skin");
            result[9] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn11.skin = _arg_1;
            }, "levelBtn11.skin");
            result[10] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_LEVEL_LIGHT);
            }, function (_arg_1:Class):void
            {
                levelBtn12.skin = _arg_1;
            }, "levelBtn12.skin");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((_warMapNum + "/") + _warMapMax);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarInstanceMap_Label4.text = _arg_1;
            }, "_StarInstanceMap_Label4.text");
            result[12] = binding;
            return (result);
        }

        public function set loaderCanvas(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._1256650571loaderCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1256650571loaderCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loaderCanvas", _local_2, _arg_1));
            };
        }

        private function warMapClick(id:Number):void
        {
            var func:Function;
            if (this[("starIns" + id)].enable)
            {
                if (this[("starIns" + id)]._isClick)
                {
                    if (((selectedLevel) && (selectedLevel > 0)))
                    {
                        this.visible = false;
                        _core.remote.call("initTaskSweepPanelByClient", null, 0, selectedLevel, id, 3);
                    };
                    return;
                };
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        startStarBattle(id);
                    };
                };
                if (_core.data.gameData[GamePredef.TBL_WAR_MAP][id])
                {
                    Alert.show(Language.STAR_MAP_INS[10].toString().replace("name", _core.data.gameData[GamePredef.TBL_WAR_MAP][id].name), "", (Alert.YES | Alert.NO), null, func);
                };
            };
        }

        public function __starIns3_click(_arg_1:MouseEvent):void
        {
            warMapClick(3);
        }

        public function __levelBtn4_click(_arg_1:MouseEvent):void
        {
            if (levelBtn4.enabled)
            {
                levelClick(4);
            };
        }

        public function set levelBtn12(_arg_1:MyButton):void
        {
            var _local_2:Object = this._180315225levelBtn12;
            if (_local_2 !== _arg_1)
            {
                this._180315225levelBtn12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn12", _local_2, _arg_1));
            };
        }

        public function set levelBtn10(_arg_1:MyButton):void
        {
            var _local_2:Object = this._180315223levelBtn10;
            if (_local_2 !== _arg_1)
            {
                this._180315223levelBtn10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn10", _local_2, _arg_1));
            };
        }

        public function set levelBtn11(_arg_1:MyButton):void
        {
            var _local_2:Object = this._180315224levelBtn11;
            if (_local_2 !== _arg_1)
            {
                this._180315224levelBtn11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn11", _local_2, _arg_1));
            };
        }

        public function set starIns11(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._2126743388starIns11;
            if (_local_2 !== _arg_1)
            {
                this._2126743388starIns11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns11", _local_2, _arg_1));
            };
        }

        public function set starIns10(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._2126743387starIns10;
            if (_local_2 !== _arg_1)
            {
                this._2126743387starIns10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns10", _local_2, _arg_1));
            };
        }

        private function onGetWarInfo(_arg_1:Object):void
        {
            levelClick(1);
            loaderCanvas.visible = false;
            this.info = _arg_1.d;
            _warMapMax = _arg_1.s.smax;
            _warMapNum = _arg_1.s.snum;
            setAllNum();
            setStarStyle();
        }

        public function __levelBtn11_click(_arg_1:MouseEvent):void
        {
            if (levelBtn11.enabled)
            {
                levelClick(11);
            };
        }

        private function _StarInstanceMap_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ResManager.IMG_STARS_LEVEL_LIGHT;
            _local_1 = ((_warMapNum + "/") + _warMapMax);
        }

        public function ___StarInstanceMap_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set starIns12(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._2126743389starIns12;
            if (_local_2 !== _arg_1)
            {
                this._2126743389starIns12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns12", _local_2, _arg_1));
            };
        }

        public function set backImg(_arg_1:Image):void
        {
            var _local_2:Object = this._347234980backImg;
            if (_local_2 !== _arg_1)
            {
                this._347234980backImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backImg", _local_2, _arg_1));
            };
        }

        public function ___StarInstanceMap_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            addWarMapTime();
        }

        public function __levelBtn1_click(_arg_1:MouseEvent):void
        {
            if (levelBtn1.enabled)
            {
                levelClick(1);
            };
        }

        public function __starIns8_click(_arg_1:MouseEvent):void
        {
            warMapClick(8);
        }

        public function set starIns1(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._1315530613starIns1;
            if (_local_2 !== _arg_1)
            {
                this._1315530613starIns1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns1", _local_2, _arg_1));
            };
        }

        public function set starIns2(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._1315530614starIns2;
            if (_local_2 !== _arg_1)
            {
                this._1315530614starIns2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns2", _local_2, _arg_1));
            };
        }

        public function set starIns3(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._1315530615starIns3;
            if (_local_2 !== _arg_1)
            {
                this._1315530615starIns3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns3", _local_2, _arg_1));
            };
        }

        public function set starIns4(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._1315530616starIns4;
            if (_local_2 !== _arg_1)
            {
                this._1315530616starIns4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns4", _local_2, _arg_1));
            };
        }

        public function __levelBtn9_click(_arg_1:MouseEvent):void
        {
            if (levelBtn9.enabled)
            {
                levelClick(9);
            };
        }

        public function set starIns5(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._1315530617starIns5;
            if (_local_2 !== _arg_1)
            {
                this._1315530617starIns5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns5", _local_2, _arg_1));
            };
        }

        public function set starIns6(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._1315530618starIns6;
            if (_local_2 !== _arg_1)
            {
                this._1315530618starIns6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns6", _local_2, _arg_1));
            };
        }

        public function set starIns7(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._1315530619starIns7;
            if (_local_2 !== _arg_1)
            {
                this._1315530619starIns7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns7", _local_2, _arg_1));
            };
        }

        public function set starIns8(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._1315530620starIns8;
            if (_local_2 !== _arg_1)
            {
                this._1315530620starIns8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn3():MyButton
        {
            return (this._1656751365levelBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get btnClose():Button
        {
            return (this._2082343164btnClose);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn5():MyButton
        {
            return (this._1656751363levelBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn6():MyButton
        {
            return (this._1656751362levelBtn6);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn7():MyButton
        {
            return (this._1656751361levelBtn7);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn8():MyButton
        {
            return (this._1656751360levelBtn8);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn4():MyButton
        {
            return (this._1656751364levelBtn4);
        }

        public function __starIns11_click(_arg_1:MouseEvent):void
        {
            warMapClick(11);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn9():MyButton
        {
            return (this._1656751359levelBtn9);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn2():MyButton
        {
            return (this._1656751366levelBtn2);
        }

        public function ___StarInstanceMap_Canvas1_show(_arg_1:FlexEvent):void
        {
            onShow();
        }

        private function init():void
        {
            var _local_1:uint = 1;
            while (_local_1 < 13)
            {
                this[("starIns" + _local_1)].starName = GameData.d[GamePredef.TBL_WAR_MAP][_local_1].name;
                this[("starIns" + _local_1)].level = selectedLevel;
                this[("starIns" + _local_1)].resCode = ResManager.STAR_BUILDER_ARRAY[_local_1];
                this[("starIns" + _local_1)].enabled = true;
                _local_1++;
            };
            starIns1.enabled = true;
            backImg.source = ResManager.hash(GamePredef.RES_STARRY_SKY);
            var _local_2:uint = 300;
        }

        [Bindable(event="propertyChange")]
        public function get levelBtn1():MyButton
        {
            return (this._1656751367levelBtn1);
        }

        public function set starIns9(_arg_1:StarInstanceCanvas):void
        {
            var _local_2:Object = this._1315530621starIns9;
            if (_local_2 !== _arg_1)
            {
                this._1315530621starIns9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starIns9", _local_2, _arg_1));
            };
        }

        public function setOneStar(_arg_1:uint, _arg_2:uint, _arg_3:uint):void
        {
            if (!info[_arg_2])
            {
                info[_arg_2] = [];
            };
            if (((info[_arg_2][_arg_1]) && (info[_arg_2][_arg_1] >= _arg_3)))
            {
                return;
            };
            info[_arg_2][_arg_1] = _arg_3;
            if (_arg_2 == this.selectedLevel)
            {
                this[("starIns" + _arg_1)].starNum = _arg_3;
            };
        }

        private function exit():void
        {
            this.visible = false;
        }

        public function __starIns5_click(_arg_1:MouseEvent):void
        {
            warMapClick(5);
        }

        private function setAllNum():void
        {
            var _local_1:uint = 1;
            while (_local_1 < 13)
            {
                if (((((info) && (info[selectedLevel])) && (info[selectedLevel][_local_1])) && (info[selectedLevel][_local_1] > 0)))
                {
                    this[("starIns" + _local_1)].starNum = info[selectedLevel][_local_1];
                }
                else
                {
                    this[("starIns" + _local_1)].starNum = 0;
                };
                _local_1++;
            };
        }

        public function __levelBtn6_click(_arg_1:MouseEvent):void
        {
            if (levelBtn6.enabled)
            {
                levelClick(6);
            };
        }

        public function __btnClose_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function reset():void
        {
            firstFlag = true;
            if (this.visible)
            {
                exit();
            };
        }

        private function showStarEnabled():void
        {
            var _local_1:uint;
            if (playerStarData)
            {
                _local_1 = 1;
                while (_local_1 < 13)
                {
                    if (((playerStarData[_local_1]) && (playerStarData[_local_1] >= selectedLevel)))
                    {
                        this[("starIns" + _local_1)].enabled = true;
                    }
                    else
                    {
                        this[("starIns" + _local_1)].enabled = false;
                    };
                    _local_1++;
                };
            }
            else
            {
                _local_1 = 1;
                while (_local_1 < 13)
                {
                    this[("starIns" + _local_1)].enabled = false;
                    _local_1++;
                };
            };
        }

        private function set selectedLevel(_arg_1:uint):void
        {
            var _local_2:Object = this._1438589353selectedLevel;
            if (_local_2 !== _arg_1)
            {
                this._1438589353selectedLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get loaderCanvas():SimpleCanvas
        {
            return (this._1256650571loaderCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get starIns10():StarInstanceCanvas
        {
            return (this._2126743387starIns10);
        }

        [Bindable(event="propertyChange")]
        public function get starIns12():StarInstanceCanvas
        {
            return (this._2126743389starIns12);
        }

        public function __starIns2_click(_arg_1:MouseEvent):void
        {
            warMapClick(2);
        }

        public function reFlashStarPoint():void
        {
            starPointNeed.text = ((_core.player.starPnt + "/") + GamePredef.TITLE_POINT[211][0]);
        }

        [Bindable(event="propertyChange")]
        public function get backImg():Image
        {
            return (this._347234980backImg);
        }

        public function __levelBtn3_click(_arg_1:MouseEvent):void
        {
            if (levelBtn3.enabled)
            {
                levelClick(3);
            };
        }

        [Bindable(event="propertyChange")]
        public function get starIns11():StarInstanceCanvas
        {
            return (this._2126743388starIns11);
        }

        [Bindable(event="propertyChange")]
        public function get starIns1():StarInstanceCanvas
        {
            return (this._1315530613starIns1);
        }

        [Bindable(event="propertyChange")]
        public function get starIns2():StarInstanceCanvas
        {
            return (this._1315530614starIns2);
        }

        [Bindable(event="propertyChange")]
        public function get starIns3():StarInstanceCanvas
        {
            return (this._1315530615starIns3);
        }

        [Bindable(event="propertyChange")]
        public function get starIns4():StarInstanceCanvas
        {
            return (this._1315530616starIns4);
        }

        [Bindable(event="propertyChange")]
        public function get starIns6():StarInstanceCanvas
        {
            return (this._1315530618starIns6);
        }

        [Bindable(event="propertyChange")]
        public function get starIns7():StarInstanceCanvas
        {
            return (this._1315530619starIns7);
        }

        private function onShow():void
        {
            if (starPointNeed)
            {
                starPointNeed.text = ((_core.player.starPnt + "/") + GamePredef.TITLE_POINT[211][0]);
            };
            if (firstFlag)
            {
                _core.remote.call("getWarMap", new Responder(onGetWarInfo));
                firstFlag = false;
            };
            setPlayerData();
        }

        public function __levelBtn10_click(_arg_1:MouseEvent):void
        {
            if (levelBtn10.enabled)
            {
                levelClick(10);
            };
        }

        [Bindable(event="propertyChange")]
        public function get starIns8():StarInstanceCanvas
        {
            return (this._1315530620starIns8);
        }

        [Bindable(event="propertyChange")]
        public function get starIns9():StarInstanceCanvas
        {
            return (this._1315530621starIns9);
        }

        [Bindable(event="propertyChange")]
        public function get starIns5():StarInstanceCanvas
        {
            return (this._1315530617starIns5);
        }

        override public function initialize():void
        {
            var target:StarInstanceMap;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StarInstanceMap_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_StarInstanceMapWatcherSetupUtil");
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

        public function ___StarInstanceMap_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            setCustomTitle();
        }

        private function onClickWarMap(_arg_1:Object):void
        {
            var _local_2:String;
            switch (_arg_1.c)
            {
                case 1:
                    _core.view.hide(ViewManager.POPU_STAR_INSTACE_MAP);
                    return;
                case -2:
                    if (((_core.player.inGroup) && (_core.player.isLeader)))
                    {
                        _local_2 = Language.STAR_MAP_INS[3];
                        if (_arg_1.d)
                        {
                            _local_2 = TextUtil.decode((((("[@PID|" + _arg_1.d.id) + "|") + _arg_1.d.name) + "|0|0|0]"));
                        };
                        _core.sysMidNote(Language.STAR_MAP_INS[4].toString().replace("name", _local_2));
                    }
                    else
                    {
                        _core.sysMidNote(Language.STAR_MAP_INS[5]);
                    };
                    return;
                case -3:
                    if (((_core.player.inGroup) && (_core.player.isLeader)))
                    {
                        _local_2 = Language.STAR_MAP_INS[3];
                        if (_arg_1.d)
                        {
                            _local_2 = TextUtil.decode((((("[@PID|" + _arg_1.d.id) + "|") + _arg_1.d.name) + "|0|0|0]"));
                        };
                        _core.sysMidNote(Language.STAR_MAP_INS[6].toString().replace("name", _local_2));
                    }
                    else
                    {
                        _core.sysMidNote(Language.STAR_MAP_INS[7]);
                    };
                    return;
                case -5:
                    if (((_core.player.inGroup) && (_core.player.isLeader)))
                    {
                        _local_2 = Language.STAR_MAP_INS[3];
                        if (_arg_1.d)
                        {
                            _local_2 = TextUtil.decode((((("[@PID|" + _arg_1.d.id) + "|") + _arg_1.d.name) + "|0|0|0]"));
                        };
                        _core.sysMidNote(Language.STAR_MAP_INS[8].toString().replace("name", _local_2));
                    }
                    else
                    {
                        _core.sysMidNote(Language.STAR_MAP_INS[9]);
                    };
                    return;
            };
        }

        private function setCustomTitle():void
        {
            if (!(((_core.player) && (_core.player.starPnt)) && (_core.player.starPnt >= GamePredef.TITLE_POINT[211][0])))
            {
                _core.sysMidNote(Language.TITLE_CUSTOM[3]);
                return;
            };
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_TITLE_CUSTOM);
            if (_local_1)
            {
                _local_1.initTitleContent(211);
                _local_1.parentCallback(this.reFlashStarPoint);
            };
        }

        public function __levelBtn8_click(_arg_1:MouseEvent):void
        {
            if (levelBtn8.enabled)
            {
                levelClick(8);
            };
        }

        public function __starIns7_click(_arg_1:MouseEvent):void
        {
            warMapClick(7);
        }

        private function startStarBattle(sid:uint):void
        {
            var func:Function;
            var cost:Number;
            if (((selectedLevel) && (selectedLevel > 0)))
            {
                if (((!(_core.player.inGroup)) || (_core.player.isLeader)))
                {
                    if (((!(_core.player.inGroup)) && (ToolKit.isBigOrEqual(_warMapNum, _warMapMax))))
                    {
                        if (_warMapMax < 10)
                        {
                            func = function (e:CloseEvent):void
                            {
                                var res:Function = function (_arg_1:int):void
                                {
                                    if (_arg_1 > 0)
                                    {
                                        _warMapMax = _arg_1;
                                        _core.remote.call("clickWarMap", new Responder(onClickWarMap), sid, selectedLevel);
                                    }
                                    else
                                    {
                                        _core.sysMidNote(Language.STAR_MAP_INS[0]);
                                    };
                                };
                                if (e.detail == Alert.YES)
                                {
                                    _core.remote.call("addWarMapTime", new Responder(res), _warMapMax);
                                };
                            };
                            cost = ((_warMapMax - 4) * 10);
                            Alert.show(Language.STAR_MAP_INS[1].toString().replace("{cost}", cost), "", (Alert.YES | Alert.NO), null, func);
                        }
                        else
                        {
                            _core.sysMidNote(Language.STAR_MAP_INS[2]);
                            return;
                        };
                    }
                    else
                    {
                        _core.remote.call("clickWarMap", new Responder(onClickWarMap), sid, selectedLevel);
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        private function get selectedLevel():uint
        {
            return (this._1438589353selectedLevel);
        }

        private function addWarMapTime():void
        {
            var func:Function;
            var cost:Number;
            if (_warMapMax < 10)
            {
                func = function (e:CloseEvent):void
                {
                    var res:Function = function (_arg_1:int):void
                    {
                        if (_arg_1 > 0)
                        {
                            _warMapMax = _arg_1;
                            _core.sysMidNote(Language.STAR_MAP_INS[11]);
                        };
                    };
                    if (e.detail == Alert.YES)
                    {
                        _core.remote.call("addWarMapTime", new Responder(res), _warMapMax);
                    };
                };
                cost = ((_warMapMax - 4) * 10);
                Alert.show(Language.STAR_MAP_INS[12].toString().replace("cost", cost), "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                _core.sysMidNote(Language.STAR_MAP_INS[13]);
            };
        }

        public function __starIns10_click(_arg_1:MouseEvent):void
        {
            warMapClick(10);
        }

        public function updateWarMapStatus(_arg_1:Object):void
        {
            if (_arg_1.smax)
            {
                _warMapMax = _arg_1.smax;
            };
            if (_arg_1.snum)
            {
                _warMapNum = _arg_1.snum;
            };
        }

        public function __starIns4_click(_arg_1:MouseEvent):void
        {
            warMapClick(4);
        }

        private function set _warMapMax(_arg_1:uint):void
        {
            var _local_2:Object = this._114892273_warMapMax;
            if (_local_2 !== _arg_1)
            {
                this._114892273_warMapMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_warMapMax", _local_2, _arg_1));
            };
        }

        public function __levelBtn5_click(_arg_1:MouseEvent):void
        {
            if (levelBtn5.enabled)
            {
                levelClick(5);
            };
        }

        [Bindable(event="propertyChange")]
        private function get _warMapMax():uint
        {
            return (this._114892273_warMapMax);
        }

        public function set levelBtn1(_arg_1:MyButton):void
        {
            var _local_2:Object = this._1656751367levelBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1656751367levelBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn1", _local_2, _arg_1));
            };
        }

        public function set levelBtn2(_arg_1:MyButton):void
        {
            var _local_2:Object = this._1656751366levelBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1656751366levelBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn2", _local_2, _arg_1));
            };
        }

        public function set btnClose(_arg_1:Button):void
        {
            var _local_2:Object = this._2082343164btnClose;
            if (_local_2 !== _arg_1)
            {
                this._2082343164btnClose = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnClose", _local_2, _arg_1));
            };
        }

        public function set levelBtn5(_arg_1:MyButton):void
        {
            var _local_2:Object = this._1656751363levelBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1656751363levelBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn5", _local_2, _arg_1));
            };
        }

        public function set levelBtn6(_arg_1:MyButton):void
        {
            var _local_2:Object = this._1656751362levelBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1656751362levelBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn6", _local_2, _arg_1));
            };
        }

        public function set levelBtn3(_arg_1:MyButton):void
        {
            var _local_2:Object = this._1656751365levelBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1656751365levelBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn3", _local_2, _arg_1));
            };
        }

        public function set levelBtn7(_arg_1:MyButton):void
        {
            var _local_2:Object = this._1656751361levelBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1656751361levelBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn7", _local_2, _arg_1));
            };
        }

        public function set levelBtn4(_arg_1:MyButton):void
        {
            var _local_2:Object = this._1656751364levelBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1656751364levelBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtn4", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

