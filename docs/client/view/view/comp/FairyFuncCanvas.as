// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FairyFuncCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.TextArea;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.core.UIComponent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.logic.FairyLogic;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
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

    public class FairyFuncCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _FairyFuncCanvas_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3034453btn1:DelayButton;
        public var _FairyFuncCanvas_Label2:Label;
        private var _1349149756curSte:BasicTxtButton;
        private var _3034455btn3:DelayButton;
        public var _FairyFuncCanvas_Label1:Label;
        private var _scrollText:ScrollText;
        private var _100893exp:PropertyBar;
        private var _1125727414curInte:BasicTxtButton;
        private var _293456499growNum:Label;
        private var _3466lv:Label;
        private var _1847045392nextAgi:BasicTxtButton;
        private var _1847063089nextSte:BasicTxtButton;
        private var yStart:Number = 200;
        private var _1349149760curSta:BasicTxtButton;
        private var _1349167453curAgi:BasicTxtButton;
        private var _1424077801nextInte:BasicTxtButton;
        private var _1125607798curEner:BasicTxtButton;
        private var yEnd:Number = 185;
        private var _numText:TextArea;
        private var _3034454btn2:DelayButton;
        private var _1423958185nextEner:BasicTxtButton;
        private var _fairy:Object;
        private var _1847063085nextSta:BasicTxtButton;
        private var _p:DragableCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":365,
                    "height":380,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FairyFuncCanvas_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_FairyFuncCanvas_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 14;
                            this.fontWeight = "bold";
                            this.horizontalCenter = "-73";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":50});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_FairyFuncCanvas_Label2",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 14;
                            this.fontWeight = "bold";
                            this.horizontalCenter = "77";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":50});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":192,
                                "y":85,
                                "styleName":"CanvasBorder",
                                "width":155,
                                "height":165,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"nextSte",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":5,
                                            "width":122,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"nextSta",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":35,
                                            "width":141
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"nextAgi",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":70,
                                            "width":122,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"nextInte",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":105,
                                            "width":122,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"nextEner",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":140,
                                            "width":122,
                                            "text":""
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"lv",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 14;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":265,
                                "width":90,
                                "height":25
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PropertyBar,
                        "id":"exp",
                        "stylesFactory":function ():void
                        {
                            this.cornerRadius = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":108,
                                "y":267,
                                "width":250,
                                "showTip":true,
                                "barCornerRadius":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"growNum",
                        "stylesFactory":function ():void
                        {
                            this.color = 16756247;
                            this.textAlign = "center";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":293});
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"btn1",
                        "events":{"click":"__btn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":1000,
                                "x":31,
                                "y":315,
                                "styleName":"BtnQuestItem",
                                "width":80,
                                "height":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"btn2",
                        "events":{"click":"__btn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":1000,
                                "x":148,
                                "y":315,
                                "styleName":"BtnQuestItem",
                                "width":80,
                                "height":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"btn3",
                        "events":{"click":"__btn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":1000,
                                "x":267,
                                "y":315,
                                "styleName":"BtnQuestItem",
                                "width":80,
                                "height":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":31,
                                "y":85,
                                "styleName":"CanvasBorder",
                                "width":153,
                                "height":165,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"curSte",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":5,
                                            "width":122,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"curSta",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":35,
                                            "width":140,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"curAgi",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":70,
                                            "width":122,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"curInte",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":105,
                                            "width":122,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"curEner",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":140,
                                            "width":122,
                                            "text":""
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

        public function FairyFuncCanvas()
        {
            mx_internal::_document = this;
            this.width = 365;
            this.height = 380;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FairyFuncCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get nextAgi():BasicTxtButton
        {
            return (this._1847045392nextAgi);
        }

        public function set lv(_arg_1:Label):void
        {
            var _local_2:Object = this._3466lv;
            if (_local_2 !== _arg_1)
            {
                this._3466lv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get exp():PropertyBar
        {
            return (this._100893exp);
        }

        public function set nextAgi(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1847045392nextAgi;
            if (_local_2 !== _arg_1)
            {
                this._1847045392nextAgi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextAgi", _local_2, _arg_1));
            };
        }

        private function _FairyFuncCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[32];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[34];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[35];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[39];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[36];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[50];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[37];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[51];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[38];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[52];
        }

        [Bindable(event="propertyChange")]
        public function get nextSta():BasicTxtButton
        {
            return (this._1847063085nextSta);
        }

        [Bindable(event="propertyChange")]
        public function get nextSte():BasicTxtButton
        {
            return (this._1847063089nextSte);
        }

        private function playExpEffect(_arg_1:int, _arg_2:int=0):void
        {
            var _local_3:UIComponent;
            if (!_scrollText)
            {
                _scrollText = new ScrollText();
                _scrollText.x = 200;
                _scrollText.y = 240;
                _local_3 = new UIComponent();
                _local_3.addChild(_scrollText);
                if (!_numText)
                {
                    _numText = new TextArea();
                    _numText.editable = false;
                    _numText.selectable = false;
                    _numText.setStyle("fontSize", 18);
                    _numText.setStyle("color", 0xFF00);
                    _numText.setStyle("backgroundAlpha", 0);
                    _numText.setStyle("fontWeight", "bold");
                    _numText.setStyle("borderStyle", "none");
                    _numText.x = 150;
                    addChild(_numText);
                };
                this.addChild(_local_3);
            };
            if (_arg_1 <= 0)
            {
                if (this.hasEventListener(Event.ENTER_FRAME))
                {
                    _numText.visible = false;
                    this.removeEventListener(Event.ENTER_FRAME, textMove);
                };
            }
            else
            {
                if (_arg_2 == 0)
                {
                    _numText.text = ("+" + _arg_1);
                    _numText.x = 150;
                    _numText.y = yStart;
                    _numText.visible = true;
                    this.addEventListener(Event.ENTER_FRAME, textMove);
                }
                else
                {
                    _scrollText.show(("+" + _arg_1));
                    if (_arg_2 == 1)
                    {
                        _numText.text = Language.FAIRY_MANAGER_PANEL_U[56];
                    }
                    else
                    {
                        if (_arg_2 == 2)
                        {
                            _numText.text = Language.FAIRY_MANAGER_PANEL_U[57];
                        };
                    };
                    _numText.x = 100;
                    _numText.y = yStart;
                    _numText.visible = true;
                    this.addEventListener(Event.ENTER_FRAME, textMove);
                };
            };
        }

        public function __btn2_click(_arg_1:MouseEvent):void
        {
            fairyGrowUp(1);
        }

        public function set exp(_arg_1:PropertyBar):void
        {
            var _local_2:Object = this._100893exp;
            if (_local_2 !== _arg_1)
            {
                this._100893exp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "exp", _local_2, _arg_1));
            };
        }

        public function hide():void
        {
            this.visible = false;
        }

        private function fairyGrowUp(type:int):void
        {
            var gfunc:Function;
            var moneyType:String;
            var moneyCost:int;
            var func:Function;
            if (((!(_core.delPass)) && ((type == 1) || (type == 2))))
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                return;
            };
            var lv:int = FairyLogic.gexpToLv(_fairy.gexp);
            if (lv >= GamePredef.FAIRY_GROW_LEVEL)
            {
                _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[41]);
            }
            else
            {
                if (type == 0)
                {
                    moneyType = "money";
                    moneyCost = 50000;
                }
                else
                {
                    if (type == 1)
                    {
                        moneyType = "gold";
                        moneyCost = 5;
                    }
                    else
                    {
                        if (type == 2)
                        {
                            moneyType = "gold";
                            moneyCost = 5;
                        };
                    };
                };
                if (_core.player.enoughMoney(moneyType, moneyCost))
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (((!(_arg_1)) || (_arg_1.detail == Alert.YES)))
                        {
                            _core.remote.call("fairyGrowUp", new Responder(onFairyGrow), _fairy.id, type);
                        };
                    };
                    if (type == 2)
                    {
                        Alert.show(Language.FAIRY_MANAGER_PANEL_U[78], "", (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        (func(null));
                    };
                }
                else
                {
                    _core.sysMidNote(Language.GAMEPREDEF_S[58]);
                };
            };
        }

        public function set curAgi(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1349167453curAgi;
            if (_local_2 !== _arg_1)
            {
                this._1349167453curAgi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curAgi", _local_2, _arg_1));
            };
        }

        private function onMove(_arg_1:Event):void
        {
            this.x = (_p.x + _p.width);
            this.y = _p.y;
        }

        public function set nextEner(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1423958185nextEner;
            if (_local_2 !== _arg_1)
            {
                this._1423958185nextEner = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextEner", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn1():DelayButton
        {
            return (this._3034453btn1);
        }

        [Bindable(event="propertyChange")]
        public function get btn3():DelayButton
        {
            return (this._3034455btn3);
        }

        public function set nextSta(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1847063085nextSta;
            if (_local_2 !== _arg_1)
            {
                this._1847063085nextSta = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextSta", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn2():DelayButton
        {
            return (this._3034454btn2);
        }

        public function set nextSte(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1847063089nextSte;
            if (_local_2 !== _arg_1)
            {
                this._1847063089nextSte = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextSte", _local_2, _arg_1));
            };
        }

        public function set curInte(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1125727414curInte;
            if (_local_2 !== _arg_1)
            {
                this._1125727414curInte = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curInte", _local_2, _arg_1));
            };
        }

        private function onFairyGrow(_arg_1:Object):void
        {
            var _local_2:String;
            if (_arg_1.f)
            {
                playExpEffect(_arg_1.exp, _arg_1.cri);
                _fairy.flag["gnum"] = _arg_1.gnum;
                growNum.text = Language.FAIRY_MANAGER_PANEL_U[72].replace("{fairy}", _fairy.name).replace("{num}", _arg_1.gnum);
                if (_arg_1.gnum == 0)
                {
                };
            }
            else
            {
                _local_2 = _arg_1.code;
                if (_local_2 == "rmb")
                {
                    _core.sysMidNote(Language.GAMEPREDEF_S[58]);
                }
                else
                {
                    if (_local_2 == "lv")
                    {
                        _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[54]);
                    }
                    else
                    {
                        if (_local_2 == "out")
                        {
                            _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[76]);
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get growNum():Label
        {
            return (this._293456499growNum);
        }

        [Bindable(event="propertyChange")]
        public function get curEner():BasicTxtButton
        {
            return (this._1125607798curEner);
        }

        public function __btn3_click(_arg_1:MouseEvent):void
        {
            fairyGrowUp(2);
        }

        public function set curSta(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1349149760curSta;
            if (_local_2 !== _arg_1)
            {
                this._1349149760curSta = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curSta", _local_2, _arg_1));
            };
        }

        public function set curSte(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1349149756curSte;
            if (_local_2 !== _arg_1)
            {
                this._1349149756curSte = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curSte", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lv():Label
        {
            return (this._3466lv);
        }

        override public function initialize():void
        {
            var target:FairyFuncCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FairyFuncCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FairyFuncCanvasWatcherSetupUtil");
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

        private function textMove(_arg_1:Event):void
        {
            if (_numText)
            {
                _numText.y--;
                if (_numText.y <= yEnd)
                {
                    _numText.visible = false;
                    this.removeEventListener(Event.ENTER_FRAME, textMove);
                };
            };
        }

        private function _FairyFuncCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyFuncCanvas_BasicTitleCanvas1.text = _arg_1;
            }, "_FairyFuncCanvas_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyFuncCanvas_Label1.text = _arg_1;
            }, "_FairyFuncCanvas_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _FairyFuncCanvas_Label1.filters = _arg_1;
            }, "_FairyFuncCanvas_Label1.filters");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairyFuncCanvas_Label2.text = _arg_1;
            }, "_FairyFuncCanvas_Label2.text");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _FairyFuncCanvas_Label2.filters = _arg_1;
            }, "_FairyFuncCanvas_Label2.filters");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                lv.filters = _arg_1;
            }, "lv.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                exp.propName = _arg_1;
            }, "exp.propName");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                growNum.filters = _arg_1;
            }, "growNum.filters");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn1.label = _arg_1;
            }, "btn1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn1.toolTip = _arg_1;
            }, "btn1.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn2.label = _arg_1;
            }, "btn2.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn2.toolTip = _arg_1;
            }, "btn2.toolTip");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn3.label = _arg_1;
            }, "btn3.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn3.toolTip = _arg_1;
            }, "btn3.toolTip");
            result[13] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get curAgi():BasicTxtButton
        {
            return (this._1349167453curAgi);
        }

        public function set btn2(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._3034454btn2;
            if (_local_2 !== _arg_1)
            {
                this._3034454btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local_2, _arg_1));
            };
        }

        public function set btn3(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._3034455btn3;
            if (_local_2 !== _arg_1)
            {
                this._3034455btn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextEner():BasicTxtButton
        {
            return (this._1423958185nextEner);
        }

        public function follow(_arg_1:DragableCanvas):void
        {
            _p = _arg_1;
            this.x = (_arg_1.x + _arg_1.width);
            this.y = _arg_1.y;
            if (this.visible)
            {
                _arg_1.addEventListener(DragableCanvas.EVENT_MOVE, onMove);
            };
        }

        public function set fairy(_arg_1:Object):void
        {
            var _local_2:int;
            _fairy = _arg_1;
            _local_2 = int(Math.floor(((FairyLogic.gexpToLv(_arg_1.gexp) - 1) / 10)));
            var _local_3:int = FairyLogic.expToLv(_fairy.exp);
            var _local_4:int = FairyLogic.gexpToLv(_fairy.gexp);
            var _local_5:Number = (Math.round(((0.2 * _local_4) * 10)) / 10);
            _local_2 = int(Math.floor((((_local_4 > 0) ? (_local_4 - 1) : 0) / 10)));
            this.lv.text = ((Language.FAIRY_MANAGER_PANEL_U[40] + ":") + _local_4);
            this.lv.setStyle("color", GamePredef.CODE_ITEM_COLOR[_local_2]);
            if (_local_4 == 0)
            {
                exp.valueMax = GamePredef.FAIRY_GROW_EXP[_local_4];
                exp.value = _fairy.gexp;
            }
            else
            {
                if (_local_4 >= GamePredef.FAIRY_GROW_LEVEL)
                {
                    exp.valueMax = GamePredef.FAIRY_GROW_EXP[(GamePredef.FAIRY_GROW_LEVEL - 1)];
                    exp.value = GamePredef.FAIRY_GROW_EXP[(GamePredef.FAIRY_GROW_LEVEL - 1)];
                }
                else
                {
                    exp.valueMax = (GamePredef.FAIRY_GROW_EXP[_local_4] - GamePredef.FAIRY_GROW_EXP[(_local_4 - 1)]);
                    exp.value = (_fairy.gexp - GamePredef.FAIRY_GROW_EXP[(_local_4 - 1)]);
                };
            };
            curSta.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[10] + " +<font color='#00ff00'>") + (Math.round((_local_5 * 10)) / 10)) + "</font>");
            curSte.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[12] + " +<font color='#00ff00'>") + (Math.round((_local_5 * 10)) / 10)) + "</font>");
            curAgi.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[14] + " +<font color='#00ff00'>") + (Math.round((_local_5 * 10)) / 10)) + "</font>");
            curInte.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[16] + " +<font color='#00ff00'>") + (Math.round((_local_5 * 10)) / 10)) + "</font>");
            curEner.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[18] + " +<font color='#00ff00'>") + (Math.round((_local_5 * 10)) / 10)) + "</font>");
            nextSta.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[10] + " +<font color='#00ff00'>") + (Math.round(((_local_5 + 0.2) * 10)) / 10)) + "</font>");
            nextSte.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[12] + " +<font color='#00ff00'>") + (Math.round(((_local_5 + 0.2) * 10)) / 10)) + "</font>");
            nextAgi.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[14] + " +<font color='#00ff00'>") + (Math.round(((_local_5 + 0.2) * 10)) / 10)) + "</font>");
            nextInte.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[16] + " +<font color='#00ff00'>") + (Math.round(((_local_5 + 0.2) * 10)) / 10)) + "</font>");
            nextEner.htmlText = (((Language.FAIRY_MANAGER_PANEL_U[18] + " +<font color='#00ff00'>") + (Math.round(((_local_5 + 0.2) * 10)) / 10)) + "</font>");
            var _local_6:* = "20";
            if (_fairy.flag)
            {
                _local_6 = ((_fairy.flag["gnum"]) || ("0"));
            };
            growNum.text = Language.FAIRY_MANAGER_PANEL_U[72].replace("{fairy}", _fairy.name).replace("{num}", _local_6);
            if (!((_fairy.flag) && (_fairy.flag["gnum"] <= 0)))
            {
                btn1.enabled = true;
                btn2.enabled = true;
                btn3.enabled = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get curInte():BasicTxtButton
        {
            return (this._1125727414curInte);
        }

        [Bindable(event="propertyChange")]
        public function get curSta():BasicTxtButton
        {
            return (this._1349149760curSta);
        }

        public function set btn1(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get curSte():BasicTxtButton
        {
            return (this._1349149756curSte);
        }

        public function set nextInte(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1424077801nextInte;
            if (_local_2 !== _arg_1)
            {
                this._1424077801nextInte = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextInte", _local_2, _arg_1));
            };
        }

        public function set growNum(_arg_1:Label):void
        {
            var _local_2:Object = this._293456499growNum;
            if (_local_2 !== _arg_1)
            {
                this._293456499growNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "growNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextInte():BasicTxtButton
        {
            return (this._1424077801nextInte);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_p)
            {
                super.visible = _arg_1;
                if (_arg_1)
                {
                    follow(_p);
                    if (this.parent)
                    {
                        this.parent.setChildIndex(this, (this.parent.numChildren - 1));
                    };
                }
                else
                {
                    _p.removeEventListener(DragableCanvas.EVENT_MOVE, onMove);
                };
            }
            else
            {
                super.visible = false;
            };
        }

        public function set curEner(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1125607798curEner;
            if (_local_2 !== _arg_1)
            {
                this._1125607798curEner = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curEner", _local_2, _arg_1));
            };
        }

        public function show():void
        {
            this.visible = (!(this.visible));
        }

        public function __btn1_click(_arg_1:MouseEvent):void
        {
            fairyGrowUp(0);
        }


    }
}//package com.qeedoo.ui.view.comp

