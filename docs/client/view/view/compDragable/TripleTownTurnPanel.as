// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TripleTownTurnPanel

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.FilterButton;
    import mx.controls.Label;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.LanguageUtil;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
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

    public class TripleTownTurnPanel extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const CONST_TURN_BY_KILL:int = 3;
        private const CONST_DIR_TOTAL:int = 8;
        public var _TripleTownTurnPanel_FilterButton2:FilterButton;
        public var _TripleTownTurnPanel_FilterButton4:FilterButton;
        public var _TripleTownTurnPanel_FilterButton1:FilterButton;
        public var _TripleTownTurnPanel_Label5:Label;
        public var _TripleTownTurnPanel_FilterButton3:FilterButton;
        public var _TripleTownTurnPanel_FilterButton5:FilterButton;
        public var _TripleTownTurnPanel_Label4:Label;
        public var _TripleTownTurnPanel_Label1:Label;
        private var _2048529025chanceText:Label;
        private var _1528018603_isHide:Boolean;
        private var _134198090turnText:Label;
        private var _1670000474dirText:Label;
        public var _TripleTownTurnPanel_Canvas2:Canvas;
        public var _TripleTownTurnPanel_Canvas3:Canvas;
        private var _1300750333showHideBtn:Button;
        private var _isHideUI:Boolean;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":217,
                    "height":210,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"_TripleTownTurnPanel_Canvas2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":12,
                                "styleName":"RoundedGradientBorder",
                                "width":205,
                                "height":110,
                                "clipContent":false,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TripleTownTurnPanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFF00;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":8});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"turnText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"dirText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":43
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TripleTownTurnPanel_Label4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":19,
                                            "y":67
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"_TripleTownTurnPanel_FilterButton1",
                                    "events":{"click":"___TripleTownTurnPanel_FilterButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":83,
                                            "width":35,
                                            "height":22,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"_TripleTownTurnPanel_Canvas3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":12,
                                "y":110,
                                "styleName":"RoundedGradientBorder",
                                "width":205,
                                "height":100,
                                "clipContent":false,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TripleTownTurnPanel_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFF00;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"chanceText",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFFFF;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":35});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"_TripleTownTurnPanel_FilterButton2",
                                    "events":{"click":"___TripleTownTurnPanel_FilterButton2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":66,
                                            "width":35,
                                            "height":22,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"_TripleTownTurnPanel_FilterButton3",
                                    "events":{"click":"___TripleTownTurnPanel_FilterButton3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":45,
                                            "y":66,
                                            "width":35,
                                            "height":22,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"_TripleTownTurnPanel_FilterButton4",
                                    "events":{"click":"___TripleTownTurnPanel_FilterButton4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":66,
                                            "width":35,
                                            "height":22,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"_TripleTownTurnPanel_FilterButton5",
                                    "events":{"click":"___TripleTownTurnPanel_FilterButton5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":115,
                                            "y":66,
                                            "width":82,
                                            "height":22,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"showHideBtn",
                        "events":{"click":"__showHideBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":79,
                                "width":12,
                                "height":25,
                                "styleName":"BtnHideButtons"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private const CONST_TURN_DICT:Array = [1, 1, 2, 3, 3];
        private const CONST_DIR_NAME:Object = {
            "1":1,
            "3":4,
            "5":3,
            "7":2
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TripleTownTurnPanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.right = "0";
                this.verticalCenter = "0";
            };
            this.width = 217;
            this.height = 210;
            this.clipContent = false;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TripleTownTurnPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get showHideBtn():Button
        {
            return (this._1300750333showHideBtn);
        }

        private function turnHandler(_arg_1:int):void
        {
            _core.remote.call("tripleTownChangeTurn", null, _arg_1);
        }

        public function set chanceText(_arg_1:Label):void
        {
            var _local_2:Object = this._2048529025chanceText;
            if (_local_2 !== _arg_1)
            {
                this._2048529025chanceText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chanceText", _local_2, _arg_1));
            };
        }

        public function set turnText(_arg_1:Label):void
        {
            var _local_2:Object = this._134198090turnText;
            if (_local_2 !== _arg_1)
            {
                this._134198090turnText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "turnText", _local_2, _arg_1));
            };
        }

        public function updateView(_arg_1:Object):void
        {
            this.tripleHideUI();
            var _local_2:int = (_arg_1.turnTime % CONST_TURN_DICT.length);
            var _local_3:int = ((_arg_1.turnType) ? _arg_1.turnType : CONST_TURN_DICT[_local_2]);
            var _local_4:String = Language.TRIPLE_TOWN_PANEL[26][_local_3];
            turnText.htmlText = LanguageUtil.replace(Language.TRIPLE_TOWN_PANEL[18], {
                "num":_arg_1.turnAfter,
                "name":_local_4
            });
            var _local_5:int = _arg_1.npcDir;
            if (_local_3 == 1)
            {
                _local_5 = (Number(_arg_1.npcDir) + 6);
            }
            else
            {
                if (_local_3 == 2)
                {
                    _local_5 = (Number(_arg_1.npcDir) + 4);
                }
                else
                {
                    if (_local_3 == 3)
                    {
                        _local_5 = (Number(_arg_1.npcDir) + 2);
                    };
                };
            };
            _local_5 = (_local_5 % CONST_DIR_TOTAL);
            dirText.htmlText = LanguageUtil.replace(Language.TRIPLE_TOWN_PANEL[17], {"dir":CONST_DIR_NAME[_local_5]});
            chanceText.htmlText = LanguageUtil.replace(Language.TRIPLE_TOWN_PANEL[21], {"num":_arg_1.turnChance});
        }

        override public function initialize():void
        {
            var target:TripleTownTurnPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TripleTownTurnPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TripleTownTurnPanelWatcherSetupUtil");
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
        public function get chanceText():Label
        {
            return (this._2048529025chanceText);
        }

        public function ___TripleTownTurnPanel_FilterButton2_click(_arg_1:MouseEvent):void
        {
            turnHandler(1);
        }

        [Bindable(event="propertyChange")]
        private function get _isHide():Boolean
        {
            return (this._1528018603_isHide);
        }

        public function set dirText(_arg_1:Label):void
        {
            var _local_2:Object = this._1670000474dirText;
            if (_local_2 !== _arg_1)
            {
                this._1670000474dirText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dirText", _local_2, _arg_1));
            };
        }

        private function _TripleTownTurnPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Boolean
            {
                return (!(_isHide));
            }, function (_arg_1:Boolean):void
            {
                _TripleTownTurnPanel_Canvas2.visible = _arg_1;
            }, "_TripleTownTurnPanel_Canvas2.visible");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownTurnPanel_Label1.text = _arg_1;
            }, "_TripleTownTurnPanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownTurnPanel_Label1.filters = _arg_1;
            }, "_TripleTownTurnPanel_Label1.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                turnText.filters = _arg_1;
            }, "turnText.filters");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                dirText.filters = _arg_1;
            }, "dirText.filters");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownTurnPanel_Label4.htmlText = _arg_1;
            }, "_TripleTownTurnPanel_Label4.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownTurnPanel_Label4.filters = _arg_1;
            }, "_TripleTownTurnPanel_Label4.filters");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownTurnPanel_FilterButton1.label = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton1.label");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownTurnPanel_FilterButton1.filters = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton1.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_isHide));
            }, function (_arg_1:Boolean):void
            {
                _TripleTownTurnPanel_Canvas3.visible = _arg_1;
            }, "_TripleTownTurnPanel_Canvas3.visible");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownTurnPanel_Label5.text = _arg_1;
            }, "_TripleTownTurnPanel_Label5.text");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownTurnPanel_Label5.filters = _arg_1;
            }, "_TripleTownTurnPanel_Label5.filters");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                chanceText.filters = _arg_1;
            }, "chanceText.filters");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownTurnPanel_FilterButton2.label = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton2.label");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownTurnPanel_FilterButton2.filters = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton2.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownTurnPanel_FilterButton3.label = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton3.label");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownTurnPanel_FilterButton3.filters = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton3.filters");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownTurnPanel_FilterButton4.label = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton4.label");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownTurnPanel_FilterButton4.filters = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton4.filters");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIPLE_TOWN_PANEL[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TripleTownTurnPanel_FilterButton5.label = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton5.label");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                _TripleTownTurnPanel_FilterButton5.filters = _arg_1;
            }, "_TripleTownTurnPanel_FilterButton5.filters");
            result[20] = binding;
            return (result);
        }

        public function ___TripleTownTurnPanel_FilterButton4_click(_arg_1:MouseEvent):void
        {
            turnHandler(2);
        }

        private function _TripleTownTurnPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = (!(_isHide));
            _local_1 = Language.TRIPLE_TOWN_PANEL[16];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[27];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[19];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = (!(_isHide));
            _local_1 = Language.TRIPLE_TOWN_PANEL[20];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[22];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[23];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[24];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = Language.TRIPLE_TOWN_PANEL[25];
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get turnText():Label
        {
            return (this._134198090turnText);
        }

        public function tripleHideUI(_arg_1:Boolean=true):void
        {
            if (_isHideUI == _arg_1)
            {
                return;
            };
            _isHideUI = _arg_1;
            this.visible = _arg_1;
            var _local_2:Object = _core.view.getUI(ViewManager.MAIN_SYS);
            _local_2.sysBtnBar.visible = (!(_arg_1));
            _local_2 = _core.view.getUI(ViewManager.MAIN_MINIMAP);
            _local_2.visible = (!(_arg_1));
            _local_2 = _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE);
            if (_arg_1)
            {
                _local_2.hide();
            }
            else
            {
                _local_2.show();
            };
            _local_2 = _core.view.getUI(ViewManager.MAIN_USER_BAR);
            _local_2.visible = (!(_arg_1));
            _local_2 = _core.view.getUI(ViewManager.MAIN_ACTIVITY);
            _local_2.hideIcons(_arg_1);
        }

        private function set _isHide(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1528018603_isHide;
            if (_local_2 !== _arg_1)
            {
                this._1528018603_isHide = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_isHide", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dirText():Label
        {
            return (this._1670000474dirText);
        }

        public function ___TripleTownTurnPanel_FilterButton1_click(_arg_1:MouseEvent):void
        {
            refreshHandler(_arg_1);
        }

        private function showHideHandler(_arg_1:Event):void
        {
            _isHide = (!(_isHide));
            if (_isHide)
            {
                showHideBtn.x = 205;
                showHideBtn.styleName = "BtnShowButtons";
            }
            else
            {
                showHideBtn.x = 0;
                showHideBtn.styleName = "BtnHideButtons";
            };
        }

        public function ___TripleTownTurnPanel_FilterButton5_click(_arg_1:MouseEvent):void
        {
            turnHandler(4);
        }

        private function refreshHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            _core.remote.call("tripleTownSyncTrunInfo", null);
        }

        public function ___TripleTownTurnPanel_FilterButton3_click(_arg_1:MouseEvent):void
        {
            turnHandler(3);
        }

        public function __showHideBtn_click(_arg_1:MouseEvent):void
        {
            showHideHandler(_arg_1);
        }

        public function set showHideBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1300750333showHideBtn;
            if (_local_2 !== _arg_1)
            {
                this._1300750333showHideBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHideBtn", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

