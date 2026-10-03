// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.FazendaLogPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ReplayListDetail;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Menu;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.containers.Canvas;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.utils.ArrayQueue;
    import mx.formatters.DateFormatter;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.utils.TextUtil;
    import mx.events.MenuEvent;
    import com.adobe.crypto.MD5;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.system.System;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.view.comp.CustomMenu;
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

    public class FazendaLogPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3586r4:ReplayListDetail;
        private var _3034453btn1:BasicGlowButton;
        private var myMenu:Menu;
        private var _3585r3:ReplayListDetail;
        private var _3589r7:ReplayListDetail;
        private var _3584r2:ReplayListDetail;
        private var _114581tab:ViewStack;
        private var _3588r6:ReplayListDetail;
        private var _3591r9:ReplayListDetail;
        private var _3034452btn0:BasicGlowButton;
        private var _107332log:LinkTextArea;
        private var _3583r1:ReplayListDetail;
        private var _3587r5:ReplayListDetail;
        private var _3590r8:ReplayListDetail;
        public var _FazendaLogPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3582r0:ReplayListDetail;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":350,
                    "height":440,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FazendaLogPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":40,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn0",
                                    "events":{"click":"__btn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn1",
                                    "events":{"click":"__btn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"styleName":"HorizontalTab"});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tab",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":60,
                                "width":340,
                                "height":370,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":340,
                                            "height":370,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":LinkTextArea,
                                                "id":"log",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0.3;
                                                    this.backgroundColor = 0;
                                                    this.borderStyle = "none";
                                                    this.color = 16774324;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":5,
                                                        "width":330,
                                                        "height":355,
                                                        "mouseEnabled":false,
                                                        "editable":false,
                                                        "enabled":true,
                                                        "selectable":false
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
                                            "x":0,
                                            "y":0,
                                            "width":340,
                                            "height":370,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":VBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "width":340,
                                                        "height":370,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ReplayListDetail,
                                                            "id":"r9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"visible":false});
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
                    })]
                });
            }
        });
        private var firstTimeFlag:Array = [true, true];
        private var _core:Core = Core.getInstance();
        private var _logStrArr:ArrayQueue = new ArrayQueue(30);
        private var formatter:DateFormatter = new DateFormatter();
        private var _replayLists:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FazendaLogPanel()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 350;
            this.height = 440;
            this.addEventListener("creationComplete", ___FazendaLogPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FazendaLogPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get r2():ReplayListDetail
        {
            return (this._3584r2);
        }

        public function onSaveReplay(_arg_1:Object):void
        {
            _replayLists[_arg_1.id] = _arg_1;
            onGetReplayList(_replayLists);
        }

        public function set r4(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3586r4;
            if (_local_2 !== _arg_1)
            {
                this._3586r4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r7():ReplayListDetail
        {
            return (this._3589r7);
        }

        public function set r5(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3587r5;
            if (_local_2 !== _arg_1)
            {
                this._3587r5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r5", _local_2, _arg_1));
            };
        }

        public function set r2(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3584r2;
            if (_local_2 !== _arg_1)
            {
                this._3584r2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r2", _local_2, _arg_1));
            };
        }

        public function set r6(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3588r6;
            if (_local_2 !== _arg_1)
            {
                this._3588r6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r6", _local_2, _arg_1));
            };
        }

        public function set r3(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3585r3;
            if (_local_2 !== _arg_1)
            {
                this._3585r3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r6():ReplayListDetail
        {
            return (this._3588r6);
        }

        public function set r8(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3590r8;
            if (_local_2 !== _arg_1)
            {
                this._3590r8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r8", _local_2, _arg_1));
            };
        }

        public function set r1(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3583r1;
            if (_local_2 !== _arg_1)
            {
                this._3583r1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r1", _local_2, _arg_1));
            };
        }

        public function set r9(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3591r9;
            if (_local_2 !== _arg_1)
            {
                this._3591r9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r9", _local_2, _arg_1));
            };
        }

        private function init():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get r4():ReplayListDetail
        {
            return (this._3586r4);
        }

        [Bindable(event="propertyChange")]
        public function get r5():ReplayListDetail
        {
            return (this._3587r5);
        }

        public function set r0(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3582r0;
            if (_local_2 !== _arg_1)
            {
                this._3582r0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r8():ReplayListDetail
        {
            return (this._3590r8);
        }

        [Bindable(event="propertyChange")]
        public function get r9():ReplayListDetail
        {
            return (this._3591r9);
        }

        public function addOneLog(_arg_1:Object):void
        {
            if (!_arg_1.logTime)
            {
                _arg_1.logTime = new Date().getTime();
            };
            var _local_2:String = logObjectToString(_arg_1);
            _logStrArr.push(_local_2);
            if (visible)
            {
                log.htmlText = _logStrArr.join();
            };
        }

        [Bindable(event="propertyChange")]
        public function get r3():ReplayListDetail
        {
            return (this._3585r3);
        }

        [Bindable(event="propertyChange")]
        public function get r0():ReplayListDetail
        {
            return (this._3582r0);
        }

        public function set r7(_arg_1:ReplayListDetail):void
        {
            var _local_2:Object = this._3589r7;
            if (_local_2 !== _arg_1)
            {
                this._3589r7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r7", _local_2, _arg_1));
            };
        }

        public function set tab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._114581tab;
            if (_local_2 !== _arg_1)
            {
                this._114581tab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab", _local_2, _arg_1));
            };
        }

        private function logObjectToString(_arg_1:Object):String
        {
            var _local_3:Number;
            var _local_6:String;
            var _local_7:Object;
            var _local_2:String = formatter.format(new Date(_arg_1.logTime));
            var _local_4:* = "";
            var _local_5:* = "";
            if (_arg_1.result == GamePredef.BATTLE_WIN)
            {
                if (_arg_1.guest)
                {
                    _local_3 = _arg_1.cid;
                    _local_4 = Language.PETFIGHT_PANEL_U[10];
                }
                else
                {
                    _local_3 = _arg_1.tid;
                    _local_4 = Language.PETFIGHT_PANEL_U[4];
                };
                _local_5 = TextUtil.decode((((("[@PID|" + _local_3) + "|") + _arg_1.name) + "|0|0|0]"));
                _local_6 = "";
                _local_7 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_arg_1.id];
                if (_local_7)
                {
                    _local_6 = _local_7.name;
                };
                _local_4 = _local_4.replace("{enemy}", _local_5).replace("{num}", _arg_1.num).replace("{item}", _local_6);
            }
            else
            {
                if (_arg_1.result == GamePredef.BATTLE_LOSE)
                {
                    if (_arg_1.guest)
                    {
                        _local_3 = _arg_1.cid;
                        _local_4 = Language.PETFIGHT_PANEL_U[12];
                    }
                    else
                    {
                        _local_3 = _arg_1.tid;
                        _local_4 = Language.PETFIGHT_PANEL_U[6];
                    };
                    _local_5 = TextUtil.decode((((("[@PID|" + _local_3) + "|") + _arg_1.name) + "|0|0|0]"));
                    _local_4 = _local_4.replace("{enemy}", _local_5);
                }
                else
                {
                    if (_arg_1.guest)
                    {
                        _local_3 = _arg_1.cid;
                        _local_4 = Language.PETFIGHT_PANEL_U[20];
                    }
                    else
                    {
                        _local_3 = _arg_1.tid;
                        _local_4 = Language.PETFIGHT_PANEL_U[19];
                    };
                    _local_5 = TextUtil.decode((((("[@PID|" + _local_3) + "|") + _arg_1.name) + "|0|0|0]"));
                    _local_4 = _local_4.replace("{enemy}", _local_5);
                };
            };
            if (((!(_arg_1.noreplay)) && (_arg_1.bid)))
            {
                _local_4 = (_local_4 + ("\n\t\t\t\t\t\t\t\t\t" + String(Language.PETFIGHT_PANEL_U[11]).replace("{bid}", _arg_1.bid)));
                _local_4 = (_local_4 + String(Language.PETFIGHT_PANEL_U[16]).replace("{bid}", _arg_1.bid));
            };
            return (((_local_2 + ":") + _local_4) + "\n");
        }

        public function onGetFarmLog(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:String;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:*;
            if (_arg_1)
            {
                _local_2 = [];
                _logStrArr.clear();
                for (_local_3 in _arg_1)
                {
                    _local_2.push(_arg_1[_local_3]);
                };
                _local_2 = _local_2.sortOn("logTime");
                _local_4 = 0;
                while (_local_4 < _local_2.length)
                {
                    _local_5 = _local_2[_local_4];
                    _local_6 = logObjectToString(_local_5);
                    _logStrArr.push(_local_6);
                    _local_4++;
                };
                log.htmlText = _logStrArr.join();
            };
        }

        private function menuHide(_arg_1:MenuEvent):void
        {
            var _local_2:Menu = Menu(_arg_1.currentTarget);
            _local_2.removeEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
            _local_2.removeEventListener(MenuEvent.MENU_HIDE, menuHide);
        }

        [Bindable(event="propertyChange")]
        public function get log():LinkTextArea
        {
            return (this._107332log);
        }

        public function reset():void
        {
            firstTimeFlag = [true, true];
            if (log)
            {
                log.htmlText = "";
            };
            _logStrArr.clear();
            _replayLists = {};
            var _local_1:int;
            while (_local_1 < 10)
            {
                if (this[("r" + _local_1)])
                {
                    this[("r" + _local_1)].clear();
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn0():BasicGlowButton
        {
            return (this._3034452btn0);
        }

        [Bindable(event="propertyChange")]
        public function get btn1():BasicGlowButton
        {
            return (this._3034453btn1);
        }

        private function initTab(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case 0:
                    if (firstTimeFlag[_arg_1])
                    {
                        formatter.formatString = "MM-DD JJ:NN";
                        firstTimeFlag[_arg_1] = false;
                        _core.remote.call("getFarmLog", null);
                    }
                    else
                    {
                        if (_logStrArr.dataUpdated)
                        {
                            log.htmlText = _logStrArr.join();
                        };
                    };
                    return;
                case 1:
                    if (firstTimeFlag[_arg_1])
                    {
                        firstTimeFlag[_arg_1] = false;
                        _core.remote.call("getReplayList", null);
                    };
                    return;
            };
        }

        private function changeView(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 <= 1)
            {
                if (_arg_1 == _local_2)
                {
                    this[("btn" + _local_2)].selected = true;
                }
                else
                {
                    this[("btn" + _local_2)].selected = false;
                };
                _local_2++;
            };
            tab.selectedIndex = _arg_1;
            initTab(_arg_1);
        }

        private function outsideKey(_arg_1:String, _arg_2:String):String
        {
            var _local_7:Number;
            var _local_8:Number;
            var _local_3:String = MD5.hash(_arg_2);
            var _local_4:int;
            var _local_5:* = "";
            var _local_6:int;
            while (_local_6 < _arg_1.length)
            {
                if (_local_4 >= _local_3.length)
                {
                    _local_4 = 0;
                };
                _local_7 = Number(("0x" + _arg_1.charAt(_local_6)));
                _local_8 = Number(("0x" + _local_3.charAt(_local_4++)));
                _local_5 = (_local_5 + (_local_7 ^ _local_8).toString(16));
                _local_6++;
            };
            return (_local_5);
        }

        public function onGetReplayList(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:String;
            var _local_4:int;
            if (!initialized)
            {
                return;
            };
            if (_arg_1)
            {
                _local_2 = [];
                _replayLists = {};
                for (_local_3 in _arg_1)
                {
                    if (_arg_1[_local_3])
                    {
                        _local_2.push(_arg_1[_local_3]);
                        _replayLists[_local_3] = _arg_1[_local_3];
                    };
                };
                _local_2 = _local_2.sortOn("timestamp");
                _local_4 = 0;
                while (_local_4 < 10)
                {
                    if (_local_2[_local_4])
                    {
                        this[("r" + _local_4)].replay = _local_2[_local_4];
                        this[("r" + _local_4)].visible = true;
                    }
                    else
                    {
                        this[("r" + _local_4)].visible = false;
                    };
                    _local_4++;
                };
            };
        }

        public function set log(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._107332log;
            if (_local_2 !== _arg_1)
            {
                this._107332log = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "log", _local_2, _arg_1));
            };
        }

        public function ___FazendaLogPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        override public function initialize():void
        {
            var target:FazendaLogPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FazendaLogPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_FazendaLogPanelWatcherSetupUtil");
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
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        private function _FazendaLogPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDA_LOG_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FazendaLogPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_FazendaLogPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDA_LOG_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn0.label = _arg_1;
            }, "btn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDA_LOG_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn1.label = _arg_1;
            }, "btn1.label");
            result[2] = binding;
            return (result);
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:int;
            var _local_5:String;
            var _local_6:int;
            var _local_7:String;
            if (_arg_1.label == GamePredef.MENU_DEL_REPLAY)
            {
                _core.remote.call("delReplay", null, _arg_1.item.id);
            }
            else
            {
                if (_arg_1.label == GamePredef.MENU_COPY_REPLAY)
                {
                    _local_2 = _arg_1.item.id;
                    _local_3 = MD5.hash(Math.floor((Math.random() * 0x7D00)).toString());
                    _local_4 = 0;
                    _local_5 = "";
                    _local_6 = 0;
                    while (_local_6 < _local_2.length)
                    {
                        if (_local_4 >= _local_3.length)
                        {
                            _local_4 = 0;
                        };
                        _local_5 = (_local_5 + (_local_3.charAt(_local_4) + (Number(("0x" + _local_2.charAt(_local_6))) ^ Number(("0x" + _local_3.charAt(_local_4++)))).toString(16)));
                        _local_6++;
                    };
                    _local_5 = outsideKey(_local_5, "funcity");
                    _local_7 = GamePredef.BATTLE_REPLAY_URL;
                    _local_7 = (_local_7 + ("&id=" + _local_5));
                    System.setClipboard(_local_7);
                };
            };
        }

        public function set btn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034452btn0;
            if (_local_2 !== _arg_1)
            {
                this._3034452btn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn0", _local_2, _arg_1));
            };
        }

        public function set btn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        public function onDelReplay(_arg_1:String):void
        {
            var _local_2:String;
            for (_local_2 in _replayLists)
            {
                if (_replayLists[_local_2].battleId == _arg_1)
                {
                    delete _replayLists[_local_2];
                    this.onGetReplayList(_replayLists);
                    break;
                };
            };
        }

        public function __btn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        private function _FazendaLogPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAZENDA_LOG_PANEL_U[0];
            _local_1 = Language.FAZENDA_LOG_PANEL_U[1];
            _local_1 = Language.FAZENDA_LOG_PANEL_U[2];
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:int;
            if (_arg_1)
            {
                _local_2 = ((tab) ? tab.selectedIndex : 0);
                initTab(_local_2);
            };
            super.visible = _arg_1;
        }

        public function moreAction(_arg_1:String):void
        {
            var _local_2:Array;
            if (_arg_1 != "")
            {
                _local_2 = [{
                    "label":GamePredef.MENU_DEL_REPLAY,
                    "id":_arg_1
                }, {
                    "label":GamePredef.MENU_COPY_REPLAY,
                    "id":_arg_1
                }];
                if (myMenu)
                {
                    myMenu.hide();
                };
                myMenu = CustomMenu.createMenu(null, _local_2);
                myMenu.show((stage.mouseX + 25), ((stage.mouseY > 390) ? 390 : stage.mouseY));
                myMenu.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
                myMenu.addEventListener(MenuEvent.MENU_HIDE, menuHide);
                return;
            };
        }

        public function __btn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        [Bindable(event="propertyChange")]
        public function get r1():ReplayListDetail
        {
            return (this._3583r1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

