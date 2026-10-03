// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compFore.LineSelectCanvas

package com.qeedoo.ui.view.compFore
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.VBox;
    import mx.controls.Label;
    import mx.core.Repeater;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.view.compMain.WaitingPanel;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import flash.utils.setTimeout;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import flash.events.MouseEvent;
    import mx.binding.RepeatableBinding;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Debug;
    import com.qeedoo.game.rpc.RemoteObj;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
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

    public class LineSelectCanvas extends Canvas implements IBindingClient 
    {

        private static const SERVER_STATUS_ON:int = 10;
        private static const SERVER_STATUS_OFF:int = 20;
        private static const SERVER_STATUS_FULL:int = 30;
        private static const SERVER_STATUS_UNNONE:int = 40;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3756vb:VBox;
        private var _1917950559logInfoText:Label;
        private var _3646rp:Repeater;
        public var _LineSelectCanvas_LineButton1:Array;
        private var _1780505860_LineSelectCanvas_VBox1:VBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":220,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"vb",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.verticalGap = 8;
                            this.horizontalAlign = "center";
                            this.paddingTop = 20;
                            this.paddingBottom = 20;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Repeater,
                                    "id":"rp",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":LineButton,
                                                "id":"_LineSelectCanvas_LineButton1",
                                                "events":{"click":"___LineSelectCanvas_LineButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":175});
                                                }
                                            })]});
                                    }
                                })]});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"logInfoText",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.fontWeight = "bold";
                            this.textAlign = "center";
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":19,
                                "selectable":false,
                                "height":34
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___LineSelectCanvas_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "4";
                            this.top = "17";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnPanelClose"});
                        }
                    })]
                });
            }
        });
        private var _397287852lineListAC:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LineSelectCanvas()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasChooseChannel";
            this.width = 220;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LineSelectCanvas._watcherSetupUtil = _arg_1;
        }


        public function dnsResolve(_arg_1:String):String
        {
            var _local_9:String;
            var _local_12:XML;
            var _local_13:XMLList;
            var _local_14:XML;
            if (GamePredef.CONNECT_BY_DOMAIN == GamePredef.CONNECT_METHOD)
            {
                return (null);
            };
            var _local_2:String;
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:String = _arg_1.substr(0, 7);
            if (_local_3 != "rtmp://")
            {
                return (null);
            };
            _local_2 = _arg_1.substr(7);
            var _local_4:int = _local_2.indexOf(":");
            var _local_5:String = _local_2.substr(0, _local_4);
            var _local_6:String = _local_2.substr(_local_4);
            var _local_7:XMLList = GamePredef.dnsConfig.elements();
            var _local_8:* = "";
            _local_9 = "";
            var _local_10:int;
            var _local_11:Array = new Array();
            for each (_local_12 in _local_7)
            {
                _local_8 = _local_12.@domain;
                if (_local_5 == _local_8)
                {
                    while (_local_11.length != 0)
                    {
                        _local_11.pop();
                    };
                    _local_13 = _local_12.elements();
                    for each (_local_14 in _local_13)
                    {
                        _local_9 = _local_14.@sp;
                        _local_11[_local_9] = _local_14.text().toString();
                        _local_10++;
                    };
                    break;
                };
            };
            if (_local_10 == 0)
            {
                return (null);
            };
            _local_9 = null;
            switch (GamePredef.CONNECT_METHOD)
            {
                case GamePredef.CONNECT_BY_DOMAIN:
                    break;
                case GamePredef.CONNECT_BY_CNC:
                    _local_9 = GamePredef.SP_CNC;
                    break;
                case GamePredef.CONNECT_BY_CH_TELCOM:
                    _local_9 = GamePredef.SP_TEL;
                    break;
            };
            if (_local_11[_local_9] != null)
            {
                return ((_local_3 + _local_11[_local_9]) + _local_6);
            };
            return (null);
        }

        private function connect2(_arg_1:LineButton):void
        {
            var _local_2:WaitingPanel;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:String;
            if (_core.remote.nc.connected)
            {
                _core.remote.close();
                _local_2 = WaitingPanel(_core.view.getUI(ViewManager.POPU_WAIT));
                _local_2.showText(Language.LINESELECTCANVAS_S[3]);
                _local_2.showTime(15);
                setTimeout(changeLineLater, 15000, _arg_1);
                _core.view.getUI(ViewManager.MAIN_AWARD_WARN).reset();
                _core.view.getUI(ViewManager.PANEL_AWARD).reset();
                _core.view.getUI(ViewManager.MAIN_TEMP_BAG_WARN).reset();
                _local_3 = _core.view.getUI(ViewManager.PANEL_TRIPLE_TURN);
                ((_local_3) && (_local_3.tripleHideUI(false)));
            }
            else
            {
                _local_4 = _arg_1.lineInfo.url;
                _local_5 = dnsResolve(_local_4);
                if (_local_5 != null)
                {
                    _local_4 = _local_5;
                };
                if (GamePredef.SERVER_ISACTING)
                {
                    _local_4 = _local_4.replace("rtmp", "rtmpte");
                    if (((GamePredef.SERVER_ADD_PROXY) && (GamePredef.SERVER_USE_PROXYSERVER)))
                    {
                        _local_4 = (((GamePredef.SERVER_PROTOCAL_LOGIC2 + GamePredef.SERVER_ADD_PROXY) + "/?") + _local_4);
                    };
                }
                else
                {
                    _local_4 = _local_4.replace("rtmp", "rtmpe");
                    if (((GamePredef.SERVER_ADD_PROXY) && (GamePredef.SERVER_USE_PROXYSERVER)))
                    {
                        _local_4 = (((GamePredef.SERVER_PROTOCAL_LOGIC + GamePredef.SERVER_ADD_PROXY) + "/?") + _local_4);
                    };
                };
                _core.remote.connect(_local_4, ["L", _core.user, _core.pass, _core.time, _core.by_session, _arg_1.lineInfo.id]);
                _core.view.show(ViewManager.POPU_WAIT);
            };
            _core.global.close();
            visible = false;
            _core.lineInfo = _arg_1.lineInfo;
        }

        [Bindable(event="propertyChange")]
        public function get _LineSelectCanvas_VBox1():VBox
        {
            return (this._1780505860_LineSelectCanvas_VBox1);
        }

        public function set _LineSelectCanvas_VBox1(_arg_1:VBox):void
        {
            var _local_2:Object = this._1780505860_LineSelectCanvas_VBox1;
            if (_local_2 !== _arg_1)
            {
                this._1780505860_LineSelectCanvas_VBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_LineSelectCanvas_VBox1", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:LineSelectCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LineSelectCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compFore_LineSelectCanvasWatcherSetupUtil");
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

        private function changeLineLater(_arg_1:LineButton):void
        {
            var _local_2:String;
            var _local_3:String;
            _core.view.hide(ViewManager.POPU_WAIT);
            if (((_core.remote.nc.connected) && (_core.remote.nc.uri == _arg_1.lineInfo.url)))
            {
                _core.remote.changeLine(_arg_1.lineInfo.id);
            }
            else
            {
                if (_core.cid > 0)
                {
                    _core.remote.showAlert = false;
                    _core.resetLine();
                    _local_2 = _arg_1.lineInfo.url;
                    _local_3 = dnsResolve(_local_2);
                    if (_local_3 != null)
                    {
                        _local_2 = _local_3;
                    };
                    if (GamePredef.SERVER_ISACTING)
                    {
                        _local_2 = _local_2.replace("rtmp", "rtmpte");
                    }
                    else
                    {
                        _local_2 = _local_2.replace("rtmp", "rtmpe");
                    };
                    _core.remote.connect(_local_2, ["C", _core.user, _core.pass, _core.time, _core.by_session, _arg_1.lineInfo.id, _core.cid]);
                    _core.remote.showAlert = true;
                }
                else
                {
                    _core.returnToCharList();
                    _core.remote.connect(_arg_1.lineInfo.url, ["L", _core.user, _core.pass, _core.time, _core.by_session, _arg_1.lineInfo.id]);
                    _core.view.show(ViewManager.POPU_WAIT);
                };
            };
        }

        private function getBtnStyle(_arg_1:Object):String
        {
            var _local_2:String;
            var _local_3:int = _arg_1.clients;
            if (_arg_1.status == SERVER_STATUS_OFF)
            {
                return ("ChannelOrange");
            };
            if (_local_3 <= (_arg_1.max * 0.2))
            {
                return ("ChannelBlue");
            };
            if (((_local_3 > (_arg_1.max * 0.2)) && (_local_3 <= (_arg_1.max * 0.5))))
            {
                return ("ChannelGreen");
            };
            if (_local_3 > (_arg_1.max * 0.5))
            {
                return ("ChannelOrange");
            };
            return ("ChannelOrange");
        }

        public function set lineListAC(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._397287852lineListAC;
            if (_local_2 !== _arg_1)
            {
                this._397287852lineListAC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lineListAC", _local_2, _arg_1));
            };
        }

        private function onLineList(_arg_1:Array):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:LineButton;
            var _local_2:int;
            for (_local_3 in _arg_1)
            {
                if (_arg_1[_local_3].status == SERVER_STATUS_OFF)
                {
                    _local_2++;
                };
            };
            if (_local_2 >= 16)
            {
                visible = false;
                Alert.show(Language.LINESELECTCANVAS_S[0]);
            }
            else
            {
                _core.view.hide(ViewManager.POPU_WAIT);
                lineListAC.source = _arg_1;
                _core._lineList.source = _arg_1;
                callLater(setCurrentLine);
            };
            if (Core.getInstance().tg_User)
            {
                _local_4 = _arg_1[getMiniLine(_arg_1)];
                if (!_local_4)
                {
                    _local_4 = _arg_1[0];
                };
                _local_5 = new LineButton();
                _local_5.lineInfo = _local_4;
                connect2(_local_5);
                Core.getInstance().tg_User = false;
            };
        }

        private function getBtnEnabled(_arg_1:Object):Boolean
        {
            var _local_3:String;
            var _local_2:String = rp.currentItem.name;
            var _local_4:int = _arg_1.clients;
            if (_arg_1.status == SERVER_STATUS_OFF)
            {
                return (false);
            };
            return (true);
        }

        public function ___LineSelectCanvas_LineButton1_click(_arg_1:MouseEvent):void
        {
            connect(_arg_1);
        }

        public function set logInfoText(_arg_1:Label):void
        {
            var _local_2:Object = this._1917950559logInfoText;
            if (_local_2 !== _arg_1)
            {
                this._1917950559logInfoText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "logInfoText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vb():VBox
        {
            return (this._3756vb);
        }

        [Bindable(event="propertyChange")]
        public function get rp():Repeater
        {
            return (this._3646rp);
        }

        private function setCurrentLine():void
        {
            var _local_1:Object;
            if (_core.lineInfo)
            {
                for each (_local_1 in vb.getChildren())
                {
                    if (_local_1.lineInfo.id == _core.lineInfo.id)
                    {
                        _local_1.filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
                    }
                    else
                    {
                        _local_1.filters = [];
                    };
                };
            };
        }

        public function ___LineSelectCanvas_Button1_click(_arg_1:MouseEvent):void
        {
            back();
        }

        private function _LineSelectCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = lineListAC;
            _local_1 = rp.currentItem;
            _local_1 = getBtnText(rp.currentItem);
            _local_1 = getBtnEnabled(rp.currentItem);
            _local_1 = getBtnStyle(rp.currentItem);
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }

        private function _LineSelectCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (lineListAC);
            }, function (_arg_1:Object):void
            {
                rp.dataProvider = _arg_1;
            }, "rp.dataProvider");
            result[0] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (rp.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _LineSelectCanvas_LineButton1[_arg_2[0]].lineInfo = _arg_1;
            }, "_LineSelectCanvas_LineButton1.lineInfo");
            result[1] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = getBtnText(rp.mx_internal::getItemAt(_arg_2[0]));
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _LineSelectCanvas_LineButton1[_arg_2[0]].label = _arg_1;
            }, "_LineSelectCanvas_LineButton1.label");
            result[2] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Boolean
            {
                return (getBtnEnabled(rp.mx_internal::getItemAt(_arg_2[0])));
            }, function (_arg_1:Boolean, _arg_2:Array):void
            {
                _LineSelectCanvas_LineButton1[_arg_2[0]].enabled = _arg_1;
            }, "_LineSelectCanvas_LineButton1.enabled");
            result[3] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (getBtnStyle(rp.mx_internal::getItemAt(_arg_2[0])));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _LineSelectCanvas_LineButton1[_arg_2[0]].styleName = _arg_1;
            }, "_LineSelectCanvas_LineButton1.styleName");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                logInfoText.filters = _arg_1;
            }, "logInfoText.filters");
            result[5] = binding;
            return (result);
        }

        public function set vb(_arg_1:VBox):void
        {
            var _local_2:Object = this._3756vb;
            if (_local_2 !== _arg_1)
            {
                this._3756vb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vb", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lineListAC():ArrayCollection
        {
            return (this._397287852lineListAC);
        }

        [Bindable(event="propertyChange")]
        public function get logInfoText():Label
        {
            return (this._1917950559logInfoText);
        }

        private function back():void
        {
            _core.global.close();
            visible = false;
        }

        private function getMiniLine(_arg_1:Array):uint
        {
            var _local_4:*;
            var _local_2:uint = 999;
            var _local_3:uint;
            for (_local_4 in _arg_1)
            {
                if (ToolKit.isSmallThan(_arg_1[_local_4].clients, _local_2))
                {
                    _local_3 = uint(_local_4);
                    _local_2 = _arg_1[_local_4].clients;
                };
            };
            return (_local_3);
        }

        private function connect(_arg_1:MouseEvent):void
        {
            var _local_3:WaitingPanel;
            var _local_4:Object;
            var _local_5:String;
            var _local_6:String;
            var _local_2:LineButton = LineButton(_arg_1.currentTarget);
            _core.logined = false;
            if (((!(_arg_1.altKey)) && (!(Debug.DEBUG_MODE))))
            {
                if (((_core.lineInfo) && (_core.lineInfo.id == _local_2.lineInfo.id)))
                {
                    _core.sysMidNote(Language.LINESELECTCANVAS_S[1]);
                    return;
                };
                if (_local_2.lineInfo.clients >= _local_2.lineInfo.max)
                {
                    Alert.show(Language.LINESELECTCANVAS_S[2]);
                    return;
                };
            };
            if (_core.remote.nc.connected)
            {
                _core.remote.close();
                _local_3 = WaitingPanel(_core.view.getUI(ViewManager.POPU_WAIT));
                _local_3.showText(Language.LINESELECTCANVAS_S[3]);
                _local_3.showTime(10);
                setTimeout(changeLineLater, 10000, _local_2);
                _core.view.getUI(ViewManager.MAIN_AWARD_WARN).reset();
                _core.view.getUI(ViewManager.PANEL_AWARD).reset();
                _core.view.getUI(ViewManager.MAIN_TEMP_BAG_WARN).reset();
                _local_4 = _core.view.getUI(ViewManager.PANEL_TRIPLE_TURN);
                ((_local_4) && (_local_4.tripleHideUI(false)));
            }
            else
            {
                _local_5 = _local_2.lineInfo.url;
                _local_6 = dnsResolve(_local_5);
                if (_local_6 != null)
                {
                    _local_5 = _local_6;
                };
                if (GamePredef.SERVER_ISACTING)
                {
                    _local_5 = _local_5.replace("rtmp", "rtmpte");
                    if (((GamePredef.SERVER_ADD_PROXY) && (GamePredef.SERVER_USE_PROXYSERVER)))
                    {
                        _local_5 = (((GamePredef.SERVER_PROTOCAL_LOGIC2 + GamePredef.SERVER_ADD_PROXY) + "/?") + _local_5);
                    };
                }
                else
                {
                    _local_5 = _local_5.replace("rtmp", "rtmpe");
                    if (((GamePredef.SERVER_ADD_PROXY) && (GamePredef.SERVER_USE_PROXYSERVER)))
                    {
                        _local_5 = (((GamePredef.SERVER_PROTOCAL_LOGIC + GamePredef.SERVER_ADD_PROXY) + "/?") + _local_5);
                    };
                };
                _core.remote.connect(_local_5, ["L", _core.user, _core.pass, _core.time, _core.by_session, _local_2.lineInfo.id]);
                trace(_local_5);
                _core.view.show(ViewManager.POPU_WAIT);
            };
            _core.global.close();
            visible = false;
            _core.lineInfo = _local_2.lineInfo;
        }

        public function set lineList(_arg_1:Array):void
        {
            lineListAC.source = _arg_1;
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:RemoteObj;
            var _local_3:String;
            super.visible = _arg_1;
            if (_arg_1)
            {
                if ("" == logInfoText.text)
                {
                    vb.y = 26;
                    logInfoText.visible = false;
                }
                else
                {
                    vb.y = 34;
                    logInfoText.visible = true;
                };
                _core.view.getUI(ViewManager.FORE_L_R).clearForce();
                callLater(setCurrentLine);
                if (_core.global.nc.connected)
                {
                    _local_2 = _core.global;
                    _local_2.call("getLineInfo", new Responder(onLineList));
                    _core.view.hide(ViewManager.POPU_WAIT);
                }
                else
                {
                    if (_core.remote.nc.connected)
                    {
                        _local_3 = "C";
                    }
                    else
                    {
                        _local_3 = "G";
                    };
                    _core.global.connect(GamePredef.SERVER_ADD_GLOBAL, [_local_3, _core.user, _core.pass, _core.time, _core.by_session, MD5.hash((GamePredef.msg_button + GamePredef.msg_chanel))]);
                    return;
                };
            };
        }

        private function getBtnText(_arg_1:Object):String
        {
            var _local_2:String = _arg_1.name;
            var _local_3:String = Language.LINESELECTCANVAS_S[4];
            var _local_4:int = _arg_1.clients;
            if (_arg_1.auction)
            {
                _local_2 = Language.LINESELECTCANVAS_S[5];
            }
            else
            {
                if (_arg_1.guild)
                {
                    _local_2 = Language.LINESELECTCANVAS_S[11];
                }
                else
                {
                    _local_2 = ((GamePredef.SERVER_NAME + (Number(_arg_1.id) + 1)) + Language.MINIMAPCANVAS_S[5]);
                };
            };
            if (_arg_1.status == SERVER_STATUS_OFF)
            {
                return (_local_2 + Language.LINESELECTCANVAS_S[6]);
            };
            if (_local_4 <= (_arg_1.max / 10))
            {
                _local_3 = Language.LINESELECTCANVAS_S[7];
            }
            else
            {
                if (((_local_4 > (_arg_1.max * 0.1)) && (_local_4 <= (_arg_1.max * 0.5))))
                {
                    _local_3 = Language.LINESELECTCANVAS_S[8];
                }
                else
                {
                    if (((_local_4 > (_arg_1.max * 0.5)) && (_local_4 <= (_arg_1.max * 0.7))))
                    {
                        _local_3 = Language.LINESELECTCANVAS_S[9];
                    }
                    else
                    {
                        if (_local_4 > (_arg_1.max * 0.7))
                        {
                            _local_3 = Language.LINESELECTCANVAS_S[10];
                        };
                    };
                };
            };
            return (_local_2 + _local_3);
        }

        public function set rp(_arg_1:Repeater):void
        {
            var _local_2:Object = this._3646rp;
            if (_local_2 !== _arg_1)
            {
                this._3646rp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rp", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compFore

