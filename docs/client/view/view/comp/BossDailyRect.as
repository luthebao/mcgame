// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BossDailyRect

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
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

    public class BossDailyRect extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _104961017nname:Label;
        private var _97884btn:Button;
        private var _892482111state2:Label;
        private var _3034454btn2:Button;
        private var _109757585state:Label;
        private var _401544427_selectedURL:CharactorShowCanvas;
        public var bid:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":125,
                    "height":220,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":CharactorShowCanvas,
                        "id":"_selectedURL",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":10,
                                "width":10,
                                "y":136
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nname",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.horizontalCenter = "0";
                            this.bottom = "50";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":120,
                                "height":25
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn",
                        "events":{"click":"__btn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "-3";
                            this.bottom = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "width":58,
                                "height":26,
                                "styleName":"bossDailyBattle"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"state",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.bottom = "30";
                            this.left = "-1";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":60,
                                "height":26,
                                "mouseChildren":false,
                                "mouseEnabled":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn2",
                        "events":{"click":"__btn2_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "7";
                            this.bottom = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "width":58,
                                "height":26,
                                "styleName":"bossDailyBattle"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"state2",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.bottom = "30";
                            this.right = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":60,
                                "height":26,
                                "mouseChildren":false,
                                "mouseEnabled":false
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var BOSS_DAILY_CONFIG_WILD_LIST:Array = [2262, 2263, 2264, 2269, 2270, 2271, 2272, 2273, 2274, 2275, 2468];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function BossDailyRect()
        {
            mx_internal::_document = this;
            this.width = 125;
            this.height = 220;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BossDailyRect._watcherSetupUtil = _arg_1;
        }


        public function set state2(_arg_1:Label):void
        {
            var _local_2:Object = this._892482111state2;
            if (_local_2 !== _arg_1)
            {
                this._892482111state2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "state2", _local_2, _arg_1));
            };
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            click();
        }

        private function _BossDailyRect_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        private function click():void
        {
            var str:String = Language.BOSS_DAILY_PANEL[18];
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("bossDailyBattle", null, bid);
                };
            };
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        override public function initialize():void
        {
            var target:BossDailyRect;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BossDailyRect_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_BossDailyRectWatcherSetupUtil");
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
        public function get state():Label
        {
            return (this._109757585state);
        }

        [Bindable(event="propertyChange")]
        public function get _selectedURL():CharactorShowCanvas
        {
            return (this._401544427_selectedURL);
        }

        public function set state(_arg_1:Label):void
        {
            var _local_2:Object = this._109757585state;
            if (_local_2 !== _arg_1)
            {
                this._109757585state = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "state", _local_2, _arg_1));
            };
        }

        private function click2():void
        {
            var str:String = Language.BOSS_DAILY_PANEL[23];
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("bossDailyFinishByCard", null, bid);
                };
            };
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        public function set _selectedURL(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._401544427_selectedURL;
            if (_local_2 !== _arg_1)
            {
                this._401544427_selectedURL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_selectedURL", _local_2, _arg_1));
            };
        }

        public function set btn2(_arg_1:Button):void
        {
            var _local_2:Object = this._3034454btn2;
            if (_local_2 !== _arg_1)
            {
                this._3034454btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local_2, _arg_1));
            };
        }

        public function set btn(_arg_1:Button):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        public function __btn2_click(_arg_1:MouseEvent):void
        {
            click2();
        }

        [Bindable(event="propertyChange")]
        public function get state2():Label
        {
            return (this._892482111state2);
        }

        public function clean():void
        {
            _selectedURL.url = "";
            _selectedURL.toolTip = "";
            btn.toolTip = "";
            nname.text = "";
            state.htmlText = "";
            btn.visible = false;
            btn2.visible = false;
            state2.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get btn2():Button
        {
            return (this._3034454btn2);
        }

        public function refresh(_arg_1:Object, _arg_2:Object, _arg_3:Object):void
        {
            var _local_4:Object;
            var _local_6:String;
            var _local_7:*;
            var _local_8:*;
            var _local_9:int;
            bid = int(_arg_1["id"]);
            _local_4 = GameData.d[GamePredef.TBL_NPC][bid];
            _selectedURL.url = ResManager.getResUrl(_local_4.resCode);
            _selectedURL.scaleX = _arg_3["s"];
            _selectedURL.scaleY = _arg_3["s"];
            _selectedURL.x = _arg_3["x"];
            _selectedURL.y = (136 + _arg_3["y"]);
            _selectedURL.toolTip = _arg_3["award"];
            btn.toolTip = _selectedURL.toolTip;
            nname.text = _local_4.name;
            btn.visible = true;
            var _local_5:Object = _arg_2["data"][bid];
            _local_6 = Language.BOSS_DAILY_PANEL[13];
            btn.enabled = true;
            if (int(_arg_3["type"]) == 1)
            {
                if (!_local_5)
                {
                    state.htmlText = (((("<font color='#FFFF00'>" + _local_6) + "(") + _arg_3["num"]) + ")</font>");
                }
                else
                {
                    if (int(_arg_3["num"]) > int(_local_5["n"]))
                    {
                        _local_7 = _local_4.lv;
                        _local_8 = int(_core.player.level);
                        if ((((BOSS_DAILY_CONFIG_WILD_LIST.indexOf(bid) >= 0) && (int(_local_5["n"]) == 1)) && ((_local_8 + 10) < _local_7)))
                        {
                            state.htmlText = (((("<font color='#FFFF00'>" + "Thưởng suy giảm") + "(") + (int(_arg_3["num"]) - int(_local_5["n"]))) + ")</font>");
                            btn.toolTip = (_selectedURL.toolTip + "\n Nếu lv nhân vật nhỏ hơn boss 10 cấp, phần thưởng sẽ suy giảm");
                        }
                        else
                        {
                            state.htmlText = (((("<font color='#FFFF00'>" + _local_6) + "(") + (int(_arg_3["num"]) - int(_local_5["n"]))) + ")</font>");
                        };
                    }
                    else
                    {
                        btn.enabled = false;
                        state.htmlText = (("<font color='#888888'>" + _local_6) + "(0)</font>");
                    };
                };
            }
            else
            {
                if ((((!(_local_5)) || (Number(_local_5["t"]) == 0)) || (ToolKit.isBigThan(_arg_2["now"], ToolKit.add(_local_5["t"], _arg_3["step"])))))
                {
                    state.htmlText = (("<font color='#FFFF00'>" + _local_6) + "(0s)</font>");
                }
                else
                {
                    _local_9 = ((int(_local_5["t"]) + int(_arg_3["step"])) - int(_arg_2["now"]));
                    btn.enabled = false;
                    state.htmlText = (((("<font color='#888888'>" + _local_6) + "(") + getLeftTime(_local_9)) + ")</font>");
                };
            };
            if (((_arg_2) && (_arg_2["dfd"])))
            {
                btn2.visible = (state2.visible = true);
                if (_arg_2["dfd"][bid] == bid)
                {
                    btn2.enabled = true;
                    _local_6 = Language.BOSS_DAILY_PANEL[20];
                    state2.htmlText = (("<font color='#FFFF00'>" + _local_6) + "</font>");
                    btn2.toolTip = Language.BOSS_DAILY_PANEL[25];
                }
                else
                {
                    btn2.enabled = false;
                    _local_6 = Language.BOSS_DAILY_PANEL[21];
                    state2.htmlText = (("<font color='#FFFF00'>" + _local_6) + "</font>");
                    btn2.toolTip = Language.BOSS_DAILY_PANEL[22];
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn():Button
        {
            return (this._97884btn);
        }

        private function _BossDailyRect_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                nname.filters = _arg_1;
            }, "nname.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                state.filters = _arg_1;
            }, "state.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                state2.filters = _arg_1;
            }, "state2.filters");
            result[2] = binding;
            return (result);
        }

        private function getLeftTime(_arg_1:int):String
        {
            var _local_2:* = "";
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:* = "00";
            var _local_7:* = "00";
            var _local_8:* = "00";
            _arg_1 = int((_arg_1 / 1000));
            if (_arg_1 >= 3600)
            {
                _local_3 = int(Math.ceil((_arg_1 / 3600)));
                return (_local_3 + "H");
            };
            if (_arg_1 >= 60)
            {
                _local_4 = int(Math.ceil((_arg_1 / 60)));
                return (_local_4 + "m");
            };
            if (_arg_1 > 0)
            {
                return (_arg_1 + "s");
            };
            return (_local_2);
        }

        public function set nname(_arg_1:Label):void
        {
            var _local_2:Object = this._104961017nname;
            if (_local_2 !== _arg_1)
            {
                this._104961017nname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nname", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nname():Label
        {
            return (this._104961017nname);
        }


    }
}//package com.qeedoo.ui.view.comp

