// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RedEnvelopeSingle

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.List;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import mx.core.ClassFactory;
    import mx.controls.Alert;
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

    public class RedEnvelopeSingle extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1847077513nextbtn:BasicGlowButton;
        private var _2036402605goldText:String;
        private var _1221052567infoText2:String;
        private var _93797281cList:List;
        private var _112734re1:Canvas;
        private var _1221052568infoText3:String;
        public var cid:* = 0;
        private var _1037073632re3Gold:RoundedLabel;
        private var _2039088282re1Title:RoundedLabel;
        private var _112736re3:Canvas;
        private var _177936123infoText:String;
        private var _2096346584re3Title:RoundedLabel;
        private var _1036208557re2Info:RoundedLabel;
        private var _112735re2:Canvas;
        private var _1037132078re3Info:RoundedLabel;
        public var REData:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":410,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"re1",
                        "stylesFactory":function ():void
                        {
                            this.top = "0";
                            this.right = "0";
                            this.left = "0";
                            this.bottom = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"re1",
                                "visible":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"re1Title",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 16;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76.5,
                                            "y":45,
                                            "width":0x0101
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "events":{"click":"___RedEnvelopeSingle_BasicDelayButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":1500,
                                            "styleName":"rebtnopen",
                                            "x":128,
                                            "y":188,
                                            "width":153,
                                            "height":160
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___RedEnvelopeSingle_Button1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"rebtnclose",
                                            "x":335,
                                            "y":10,
                                            "width":29,
                                            "height":29
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"re2",
                        "stylesFactory":function ():void
                        {
                            this.top = "0";
                            this.right = "0";
                            this.left = "0";
                            this.bottom = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"re2",
                                "visible":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"nextbtn",
                                    "events":{"click":"__nextbtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnNormalRed",
                                            "x":155,
                                            "y":350,
                                            "width":98,
                                            "height":30,
                                            "label":"确定"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"re2Info",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 22;
                                        this.textAlign = "center";
                                        this.horizontalCenter = "-7";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":150,
                                            "width":306,
                                            "height":42
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"re3",
                        "stylesFactory":function ():void
                        {
                            this.top = "0";
                            this.right = "0";
                            this.left = "0";
                            this.bottom = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"re3",
                                "visible":true,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___RedEnvelopeSingle_Button2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"rebtnclose",
                                            "x":335,
                                            "y":10,
                                            "width":29,
                                            "height":29
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"re3Title",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 16;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":64,
                                            "y":33,
                                            "width":0x0101
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"re3Info",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":41,
                                            "y":120,
                                            "width":300
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"re3Gold",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 22;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":183,
                                            "y":74,
                                            "width":168
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":List,
                                    "id":"cList",
                                    "events":{"mouseDown":"__cList_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderSides = "0";
                                        this.borderStyle = "none";
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "selectable":false,
                                            "horizontalScrollPolicy":"off",
                                            "width":0x0101,
                                            "height":230,
                                            "y":155,
                                            "x":64,
                                            "itemRenderer":_RedEnvelopeSingle_ClassFactory1_c()
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
        private var _3212dp:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RedEnvelopeSingle()
        {
            mx_internal::_document = this;
            this.width = 410;
            this.height = 430;
            this.addEventListener("creationComplete", ___RedEnvelopeSingle_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RedEnvelopeSingle._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get re3Gold():RoundedLabel
        {
            return (this._1037073632re3Gold);
        }

        public function set infoText(_arg_1:String):void
        {
            var _local_2:Object = this._177936123infoText;
            if (_local_2 !== _arg_1)
            {
                this._177936123infoText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoText", _local_2, _arg_1));
            };
        }

        public function set goldText(_arg_1:String):void
        {
            var _local_2:Object = this._2036402605goldText;
            if (_local_2 !== _arg_1)
            {
                this._2036402605goldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get re1():Canvas
        {
            return (this._112734re1);
        }

        [Bindable(event="propertyChange")]
        public function get dp():ArrayCollection
        {
            return (this._3212dp);
        }

        public function REChangeState(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case 1:
                    re1.visible = true;
                    re2.visible = (re3.visible = false);
                    return;
                case 2:
                    re2.visible = true;
                    re1.visible = (re3.visible = false);
                    return;
                case 3:
                    re3.visible = true;
                    re1.visible = (re2.visible = false);
                    return;
            };
        }

        override public function initialize():void
        {
            var target:RedEnvelopeSingle;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RedEnvelopeSingle_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RedEnvelopeSingleWatcherSetupUtil");
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

        private function mouseUpHandler(_arg_1:MouseEvent):void
        {
            stopDrag();
            this.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        }

        private function creationCompleteHandler(_arg_1:Event):void
        {
            addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
        }

        public function onREopenHandler(_arg_1:*):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            if (((!(_arg_1)) || (!(_arg_1.data))))
            {
                return;
            };
            var _local_2:* = _arg_1.code;
            _local_3 = _arg_1.data;
            REData = _local_3;
            switch (_local_2)
            {
                case -1:
                    re2.visible = true;
                    re1.visible = (re3.visible = false);
                    infoText = Language.RE_PANEL[2];
                    infoText3 = Language.RE_PANEL[2];
                    goldText = Language.RE_PANEL[2];
                    dp = new ArrayCollection();
                    return;
                case 3:
                    re1.visible = true;
                    re2.visible = (re3.visible = false);
                    infoText = _local_3.d;
                    return;
                case 0:
                    re2.visible = true;
                    re1.visible = (re3.visible = false);
                    _local_4 = 0;
                    _local_5 = 0;
                    _local_6 = 0;
                    _local_7 = new ArrayCollection();
                    for (_local_9 in _local_3.clist)
                    {
                        _local_4++;
                        if (_local_9 == _core.cid)
                        {
                            _local_6 = _local_3.clist[_local_9].cash;
                        };
                        _local_5 = (_local_5 + int(_local_3.clist[_local_9].cash));
                        _local_7.addItem(_local_3.clist[_local_9]);
                    };
                    dp = _local_7;
                    _local_8 = (_local_5 + _local_3.g);
                    _local_5 = _local_3.g;
                    if ((_local_5 < 0))
                    {
                        _local_5 = 0;
                    };
                    infoText = _local_3.d;
                    goldText = Language.RE_PANEL[3].replace("{num}", String(_local_6));
                    infoText2 = Language.RE_PANEL[5].replace("{num1}", String(((_local_4 + "/") + _local_3.c))).replace("{num2}", String(((_local_5 + "/") + _local_8)));
                    infoText3 = Language.RE_PANEL[3].replace("{num}", int(_local_6));
                    return;
                case 1:
                    re3.visible = true;
                    re1.visible = (re2.visible = false);
                    _local_4 = 0;
                    _local_5 = 0;
                    _local_6 = 0;
                    _local_7 = new ArrayCollection();
                    for (_local_9 in _local_3.clist)
                    {
                        _local_4++;
                        if (_local_9 == _core.cid)
                        {
                            _local_6 = _local_3.clist[_local_9].cash;
                        };
                        _local_5 = (_local_5 + int(_local_3.clist[_local_9].cash));
                        _local_7.addItem(_local_3.clist[_local_9]);
                    };
                    _local_8 = (_local_5 + _local_3.g);
                    _local_5 = _local_3.g;
                    if ((_local_5 < 0))
                    {
                        _local_5 = 0;
                    };
                    dp = _local_7;
                    infoText = _local_3.d;
                    goldText = Language.RE_PANEL[7].replace("{num}", String(_local_6));
                    infoText2 = Language.RE_PANEL[5].replace("{num1}", String(((_local_4 + "/") + _local_3.c))).replace("{num2}", String(((_local_5 + "/") + _local_8)));
                    return;
                case 2:
                    re2.visible = true;
                    re1.visible = (re3.visible = false);
                    _local_4 = 0;
                    _local_5 = 0;
                    _local_6 = 0;
                    _local_7 = new ArrayCollection();
                    for (_local_9 in _local_3.clist)
                    {
                        _local_4++;
                        if (_local_9 == _core.cid)
                        {
                            _local_6 = _local_3.clist[_local_9].cash;
                        };
                        _local_5 = (_local_5 + int(_local_3.clist[_local_9].cash));
                        _local_7.addItem(_local_3.clist[_local_9]);
                    };
                    dp = _local_7;
                    _local_8 = (_local_5 + _local_3.g);
                    _local_5 = (_local_3.g - _local_5);
                    if ((_local_5 < 0))
                    {
                        _local_5 = 0;
                    };
                    infoText = _local_3.d;
                    goldText = ((_local_6 != 0) ? Language.RE_PANEL[7].replace("{num}", String(_local_6)) : Language.RE_PANEL[4]);
                    infoText2 = Language.RE_PANEL[5].replace("{num1}", String(((_local_4 + "/") + _local_3.c))).replace("{num2}", String(((_local_5 + "/") + _local_8)));
                    infoText3 = Language.RE_PANEL[4];
                    return;
            };
        }

        private function _RedEnvelopeSingle_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoText;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                re1Title.text = _arg_1;
            }, "re1Title.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoText3;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                re2Info.text = _arg_1;
            }, "re2Info.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoText;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                re3Title.text = _arg_1;
            }, "re3Title.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoText2;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                re3Info.text = _arg_1;
            }, "re3Info.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = goldText;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                re3Gold.text = _arg_1;
            }, "re3Gold.text");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (dp);
            }, function (_arg_1:Object):void
            {
                cList.dataProvider = _arg_1;
            }, "cList.dataProvider");
            result[5] = binding;
            return (result);
        }

        public function ___RedEnvelopeSingle_Button2_click(_arg_1:MouseEvent):void
        {
            re3close_clickHandler(_arg_1);
        }

        public function __nextbtn_click(_arg_1:MouseEvent):void
        {
            re2Confirm_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get cList():List
        {
            return (this._93797281cList);
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
            setToFront();
            startDrag();
            this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        }

        public function ___RedEnvelopeSingle_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            re1open_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get infoText2():String
        {
            return (this._1221052567infoText2);
        }

        [Bindable(event="propertyChange")]
        public function get infoText3():String
        {
            return (this._1221052568infoText3);
        }

        [Bindable(event="propertyChange")]
        public function get re1Title():RoundedLabel
        {
            return (this._2039088282re1Title);
        }

        [Bindable(event="propertyChange")]
        public function get nextbtn():BasicGlowButton
        {
            return (this._1847077513nextbtn);
        }

        private function setToFront():void
        {
            if (parent)
            {
                parent.setChildIndex(this, (parent.numChildren - 1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get re2Info():RoundedLabel
        {
            return (this._1036208557re2Info);
        }

        private function _RedEnvelopeSingle_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = infoText;
            _local_1 = infoText3;
            _local_1 = infoText;
            _local_1 = infoText2;
            _local_1 = goldText;
            _local_1 = dp;
        }

        public function set re3Title(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2096346584re3Title;
            if (_local_2 !== _arg_1)
            {
                this._2096346584re3Title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "re3Title", _local_2, _arg_1));
            };
        }

        public function set nextbtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1847077513nextbtn;
            if (_local_2 !== _arg_1)
            {
                this._1847077513nextbtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextbtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get re3Info():RoundedLabel
        {
            return (this._1037132078re3Info);
        }

        public function set infoText3(_arg_1:String):void
        {
            var _local_2:Object = this._1221052568infoText3;
            if (_local_2 !== _arg_1)
            {
                this._1221052568infoText3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoText3", _local_2, _arg_1));
            };
        }

        public function ___RedEnvelopeSingle_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            creationCompleteHandler(_arg_1);
        }

        public function set re1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._112734re1;
            if (_local_2 !== _arg_1)
            {
                this._112734re1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "re1", _local_2, _arg_1));
            };
        }

        public function set infoText2(_arg_1:String):void
        {
            var _local_2:Object = this._1221052567infoText2;
            if (_local_2 !== _arg_1)
            {
                this._1221052567infoText2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoText2", _local_2, _arg_1));
            };
        }

        protected function re2Confirm_clickHandler(_arg_1:MouseEvent):void
        {
            REChangeState(3);
        }

        public function set cList(_arg_1:List):void
        {
            var _local_2:Object = this._93797281cList;
            if (_local_2 !== _arg_1)
            {
                this._93797281cList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cList", _local_2, _arg_1));
            };
        }

        public function set re1Title(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2039088282re1Title;
            if (_local_2 !== _arg_1)
            {
                this._2039088282re1Title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "re1Title", _local_2, _arg_1));
            };
        }

        public function set re2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._112735re2;
            if (_local_2 !== _arg_1)
            {
                this._112735re2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "re2", _local_2, _arg_1));
            };
        }

        public function set re3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._112736re3;
            if (_local_2 !== _arg_1)
            {
                this._112736re3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "re3", _local_2, _arg_1));
            };
        }

        private function _RedEnvelopeSingle_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RedEnvelopeSingleItemRenderer;
            return (_local_1);
        }

        public function set re3Gold(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1037073632re3Gold;
            if (_local_2 !== _arg_1)
            {
                this._1037073632re3Gold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "re3Gold", _local_2, _arg_1));
            };
        }

        public function set dp(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._3212dp;
            if (_local_2 !== _arg_1)
            {
                this._3212dp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dp", _local_2, _arg_1));
            };
        }

        public function ___RedEnvelopeSingle_Button1_click(_arg_1:MouseEvent):void
        {
            re1close_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get re3Title():RoundedLabel
        {
            return (this._2096346584re3Title);
        }

        [Bindable(event="propertyChange")]
        public function get re2():Canvas
        {
            return (this._112735re2);
        }

        public function set re2Info(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1036208557re2Info;
            if (_local_2 !== _arg_1)
            {
                this._1036208557re2Info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "re2Info", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldText():String
        {
            return (this._2036402605goldText);
        }

        protected function re1close_clickHandler(_arg_1:MouseEvent):void
        {
            this.parent.removeChild(this);
        }

        protected function re1open_clickHandler(_arg_1:MouseEvent):void
        {
            if ((((!(REData)) || (REData.v == null)) || (!(_core.cid == cid))))
            {
                Alert.show("该红包不存在或不属于您");
                return;
            };
            _core.remote.call("getRedEnvelope", null, REData.v, REData.type);
        }

        protected function re3close_clickHandler(_arg_1:MouseEvent):void
        {
            this.parent.removeChild(this);
        }

        public function __cList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set re3Info(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1037132078re3Info;
            if (_local_2 !== _arg_1)
            {
                this._1037132078re3Info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "re3Info", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get re3():Canvas
        {
            return (this._112736re3);
        }

        [Bindable(event="propertyChange")]
        public function get infoText():String
        {
            return (this._177936123infoText);
        }


    }
}//package com.qeedoo.ui.view.comp

