// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ExtractCardActivity

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.ExtractCardAwardPanel;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.containers.HBox;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ExtractCardMovePanel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.CheckBox;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.ui.view.comp.ExtractCharactor;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import mx.containers.Box;
    import mx.events.FlexEvent;
    import flash.net.Responder;
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

    public class ExtractCardActivity extends DragableCanvas implements IBindingClient 
    {

        public static var EXTRACT_DATE:String = "";
        public static var EXTRACT_CARD_FREE_TIME:int = 1;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var rule:Object = null;
        private var _3704tl:VBox;
        private var _360765025awardLine2:ExtractCardAwardPanel;
        private var _3773vs:ViewStack;
        public var _ExtractCardActivity_IntroText1:IntroText;
        private var config:Object = null;
        private var _360765024awardLine1:ExtractCardAwardPanel;
        private var _3696td:HBox;
        public var _ExtractCardActivity_Label1:Label;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var award:Object = null;
        private var _3710tr:VBox;
        public var _ExtractCardActivity_Label2:Label;
        private var _104087199moveP:ExtractCardMovePanel;
        public var flag:Object = null;
        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _360765023awardLine0:ExtractCardAwardPanel;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _1893917964alertCheck:CheckBox;
        private var _3713tu:HBox;
        private var _360765026awardLine3:ExtractCardAwardPanel;
        private var _951530617content:Canvas;
        private var _110371416title:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":660,
                    "height":580,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "width":68,
                                "y":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "85";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "styleName":"HorizontalTab",
                                "width":68,
                                "y":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn2",
                        "events":{"click":"__tabBtn2_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "155";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "styleName":"HorizontalTab",
                                "width":68,
                                "y":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"content",
                        "stylesFactory":function ():void
                        {
                            this.top = "50";
                            this.left = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":650,
                                "height":520,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"vs",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "19";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"RoundedGradientBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"title",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "10";
                                                                this.fontSize = 28;
                                                                this.textAlign = "center";
                                                                this.fontWeight = "bold";
                                                                this.fontFamily = "黑体";
                                                                this.color = 16739179;
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "id":"tu",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "15";
                                                                this.horizontalAlign = "center";
                                                                this.verticalAlign = "middle";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":420,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "id":"td",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.bottom = "15";
                                                                this.horizontalAlign = "center";
                                                                this.verticalAlign = "middle";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":420,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "id":"tl",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalCenter = "0";
                                                                this.left = "15";
                                                                this.verticalAlign = "middle";
                                                                this.horizontalAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":60,
                                                                    "height":420
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "id":"tr",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalCenter = "0";
                                                                this.right = "15";
                                                                this.verticalAlign = "middle";
                                                                this.horizontalAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":60,
                                                                    "height":420
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":450,
                                                                    "height":361,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ExtractCardMovePanel,
                                                                        "id":"moveP",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_ExtractCardActivity_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.left = "3";
                                                                this.bottom = "3";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"width":270});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"alertCheck",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "3";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"x":270});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_ExtractCardActivity_Label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.left = "285";
                                                                this.bottom = "3";
                                                                this.color = 0xFFFFFF;
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"RoundedGradientBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ExtractCardAwardPanel,
                                                            "id":"awardLine0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "3";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"lvl":0});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ExtractCardAwardPanel,
                                                            "id":"awardLine1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "127";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"lvl":1});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ExtractCardAwardPanel,
                                                            "id":"awardLine2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "252";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"lvl":2});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ExtractCardAwardPanel,
                                                            "id":"awardLine3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "377";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"lvl":3});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"RoundedGradientBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_ExtractCardActivity_IntroText1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
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
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var charactors:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ExtractCardActivity()
        {
            mx_internal::_document = this;
            this.width = 660;
            this.height = 580;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___ExtractCardActivity_DragableCanvas1_creationComplete);
            this.addEventListener("removed", ___ExtractCardActivity_DragableCanvas1_removed);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ExtractCardActivity._watcherSetupUtil = _arg_1;
        }


        private function getStr(_arg_1:Object):Array
        {
            var _local_3:Object;
            if (!_arg_1)
            {
                return ([]);
            };
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_2.push({
                    "key":_arg_1[_local_3],
                    "c":rule[_arg_1[_local_3]]
                });
            };
            return (_local_2);
        }

        public function refreshPlayerNumber():void
        {
            var _local_2:ExtractCharactor;
            var _local_1:int;
            while (_local_1 < charactors.length)
            {
                _local_2 = charactors[_local_1];
                if (_local_2)
                {
                    _local_2.refreshNum(flag);
                };
                _local_1++;
            };
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        public function set tu(_arg_1:HBox):void
        {
            var _local_2:Object = this._3713tu;
            if (_local_2 !== _arg_1)
            {
                this._3713tu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tu", _local_2, _arg_1));
            };
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get alertCheck():CheckBox
        {
            return (this._1893917964alertCheck);
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        private function init():void
        {
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function set tr(_arg_1:VBox):void
        {
            var _local_2:Object = this._3710tr;
            if (_local_2 !== _arg_1)
            {
                this._3710tr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tr", _local_2, _arg_1));
            };
        }

        public function set alertCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1893917964alertCheck;
            if (_local_2 !== _arg_1)
            {
                this._1893917964alertCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "alertCheck", _local_2, _arg_1));
            };
        }

        private function refreshAwardNumber():void
        {
            var _local_1:Object;
            var _local_2:Object;
            for (_local_1 in award)
            {
                _local_2 = award[_local_1];
                if (_local_2)
                {
                    this[("awardLine" + _local_1)].refreshAwardNumber(_local_2);
                };
            };
        }

        private function refreshCharactors():void
        {
            charactors.length = 0;
            var _local_1:Array = getStr(config.str_up);
            addCharactor(tu, _local_1);
            var _local_2:Array = getStr(config.str_down);
            addCharactor(td, _local_2);
            var _local_3:Array = getStr(config.str_left);
            addCharactor(tl, _local_3);
            var _local_4:Array = getStr(config.str_right);
            addCharactor(tr, _local_4);
        }

        public function set moveP(_arg_1:ExtractCardMovePanel):void
        {
            var _local_2:Object = this._104087199moveP;
            if (_local_2 !== _arg_1)
            {
                this._104087199moveP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveP", _local_2, _arg_1));
            };
        }

        public function onGetData(_arg_1:Object):void
        {
            if (((((!(_arg_1)) || (!(_arg_1.flag))) || (!(_arg_1.config))) || (!(_arg_1.config.key))))
            {
                return;
            };
            award = _arg_1.award;
            EXTRACT_CARD_FREE_TIME = _arg_1.freeTime;
            EXTRACT_DATE = _arg_1.date;
            initAwardIndex();
            if ((((!(config)) || (!(config.key))) || (!(config.key == _arg_1.config.key))))
            {
                config = _arg_1.config;
                rule = _arg_1.rule;
                refreshCharactors();
                refreshPic();
                refreshAwardPanel();
            };
            refreshAwardNumber();
            flag = _arg_1.flag;
            refreshPlayerNumber();
            visible = true;
        }

        private function _ExtractCardActivity_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXTRACT_CARD_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXTRACT_CARD_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXTRACT_CARD_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXTRACT_CARD_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXTRACT_CARD_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExtractCardActivity_Label1.text = _arg_1;
            }, "_ExtractCardActivity_Label1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXTRACT_CARD_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExtractCardActivity_Label2.text = _arg_1;
            }, "_ExtractCardActivity_Label2.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXTRACT_CARD_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExtractCardActivity_IntroText1.htmlText = _arg_1;
            }, "_ExtractCardActivity_IntroText1.htmlText");
            result[6] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get title():RoundedLabel
        {
            return (this._110371416title);
        }

        [Bindable(event="propertyChange")]
        public function get awardLine0():ExtractCardAwardPanel
        {
            return (this._360765023awardLine0);
        }

        [Bindable(event="propertyChange")]
        public function get awardLine2():ExtractCardAwardPanel
        {
            return (this._360765025awardLine2);
        }

        [Bindable(event="propertyChange")]
        public function get awardLine3():ExtractCardAwardPanel
        {
            return (this._360765026awardLine3);
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardLine1():ExtractCardAwardPanel
        {
            return (this._360765024awardLine1);
        }

        [Bindable(event="propertyChange")]
        public function get td():HBox
        {
            return (this._3696td);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            viewChange(0);
        }

        [Bindable(event="propertyChange")]
        public function get tl():VBox
        {
            return (this._3704tl);
        }

        [Bindable(event="propertyChange")]
        public function get content():Canvas
        {
            return (this._951530617content);
        }

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tu():HBox
        {
            return (this._3713tu);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        public function ___ExtractCardActivity_DragableCanvas1_removed(_arg_1:Event):void
        {
            close();
        }

        override public function initialize():void
        {
            var target:ExtractCardActivity;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ExtractCardActivity_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ExtractCardActivityWatcherSetupUtil");
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

        public function checkFree():Boolean
        {
            if (((((flag) && (flag.free)) && (flag.free.day == EXTRACT_DATE)) && (int(flag.free.num) < EXTRACT_CARD_FREE_TIME)))
            {
                return (true);
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get moveP():ExtractCardMovePanel
        {
            return (this._104087199moveP);
        }

        private function initAwardIndex():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            if (!award)
            {
                return;
            };
            for (_local_1 in award)
            {
                _local_2 = award[_local_1];
                if (_local_2)
                {
                    for (_local_3 in _local_2)
                    {
                        _local_4 = _local_2[_local_3];
                        if (_local_4)
                        {
                            _local_4.awardId = int(_local_3);
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get tr():VBox
        {
            return (this._3710tr);
        }

        private function refreshPic():void
        {
            moveP.getRes();
        }

        public function set title(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            viewChange(1);
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        private function viewChange(_arg_1:int):void
        {
            vs.selectedIndex = _arg_1;
            this["tabBtn0"].selected = (_arg_1 == 0);
            this["tabBtn1"].selected = (_arg_1 == 1);
            this["tabBtn2"].selected = (_arg_1 == 2);
        }

        private function _ExtractCardActivity_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.EXTRACT_CARD_PANEL_U[0];
            _local_1 = Language.EXTRACT_CARD_PANEL_U[1];
            _local_1 = Language.EXTRACT_CARD_PANEL_U[2];
            _local_1 = Language.EXTRACT_CARD_PANEL_U[3];
            _local_1 = Language.EXTRACT_CARD_PANEL_U[4];
            _local_1 = Language.EXTRACT_CARD_PANEL_U[5];
            _local_1 = Language.EXTRACT_CARD_PANEL_U[20];
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        private function addCharactor(_arg_1:Box, _arg_2:Array):void
        {
            var _local_4:ExtractCharactor;
            var _local_5:Object;
            _arg_1.removeAllChildren();
            if (((!(_arg_2)) || (_arg_2.length == 0)))
            {
                return;
            };
            var _local_3:int;
            while (_local_3 < _arg_2.length)
            {
                _local_4 = new ExtractCharactor();
                _local_5 = _arg_2[_local_3];
                _local_4.refresh(_local_5["key"], _local_5["c"], 0);
                charactors.push(_local_4);
                _arg_1.addChild(_local_4);
                _local_3++;
            };
        }

        public function set awardLine2(_arg_1:ExtractCardAwardPanel):void
        {
            var _local_2:Object = this._360765025awardLine2;
            if (_local_2 !== _arg_1)
            {
                this._360765025awardLine2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardLine2", _local_2, _arg_1));
            };
        }

        public function set awardLine3(_arg_1:ExtractCardAwardPanel):void
        {
            var _local_2:Object = this._360765026awardLine3;
            if (_local_2 !== _arg_1)
            {
                this._360765026awardLine3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardLine3", _local_2, _arg_1));
            };
        }

        public function set awardLine0(_arg_1:ExtractCardAwardPanel):void
        {
            var _local_2:Object = this._360765023awardLine0;
            if (_local_2 !== _arg_1)
            {
                this._360765023awardLine0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardLine0", _local_2, _arg_1));
            };
        }

        public function onEextractCardActivityExtract(_arg_1:Object):void
        {
            var _local_2:String;
            if (((_arg_1) && (_arg_1.gid)))
            {
                _local_2 = rule[_arg_1.gid];
                if (_local_2)
                {
                    _core.sysMsg(Language.EXTRACT_CARD_PANEL_U[7].toString().replace("{c}", _local_2));
                    if (((_arg_1.type) && (_arg_1.type == 1)))
                    {
                        _core.sysMsg(Language.EXTRACT_CARD_PANEL_U[18].toString().replace("{num}", _arg_1.left));
                    };
                    moveP.showGet(_local_2, _arg_1.index);
                };
                if (!flag["data"][_arg_1.gid])
                {
                    flag["data"][_arg_1.gid] = 0;
                };
                flag["data"][_arg_1.gid] = (int(flag["data"][_arg_1.gid]) + 1);
                if (flag.free)
                {
                    flag.free.num++;
                };
                refreshPlayerNumber();
            };
        }

        public function onExtractCardActivityGetAward(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(_arg_1.flag))))
            {
                if (((_arg_1) && (int(_arg_1.type) == 1)))
                {
                    if (_arg_1.award)
                    {
                        award = _arg_1.award;
                        initAwardIndex();
                        refreshAwardNumber();
                    };
                    _core.sysMsg(Language.EXTRACT_CARD_PANEL_U[19]);
                }
                else
                {
                    _core.sysMsg(Language.EXTRACT_CARD_PANEL_U[13]);
                };
                return;
            };
            _core.sysMsg(Language.EXTRACT_CARD_PANEL_U[14]);
            flag = _arg_1.data;
            award = _arg_1.award;
            initAwardIndex();
            refreshPlayerNumber();
            refreshAwardNumber();
        }

        public function ___ExtractCardActivity_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set awardLine1(_arg_1:ExtractCardAwardPanel):void
        {
            var _local_2:Object = this._360765024awardLine1;
            if (_local_2 !== _arg_1)
            {
                this._360765024awardLine1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardLine1", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("extractCardActivityGetData", new Responder(onGetData));
        }

        public function set td(_arg_1:HBox):void
        {
            var _local_2:Object = this._3696td;
            if (_local_2 !== _arg_1)
            {
                this._3696td = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "td", _local_2, _arg_1));
            };
        }

        private function refreshAwardPanel():void
        {
            var _local_1:Object;
            var _local_2:Object;
            for (_local_1 in award)
            {
                _local_2 = award[_local_1];
                if (_local_2)
                {
                    this[("awardLine" + _local_1)].refreshAward(_local_2);
                };
            };
        }

        public function set tl(_arg_1:VBox):void
        {
            var _local_2:Object = this._3704tl;
            if (_local_2 !== _arg_1)
            {
                this._3704tl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tl", _local_2, _arg_1));
            };
        }

        public function set content(_arg_1:Canvas):void
        {
            var _local_2:Object = this._951530617content;
            if (_local_2 !== _arg_1)
            {
                this._951530617content = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "content", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            viewChange(2);
        }

        private function close():void
        {
            moveP.close();
        }


    }
}//package com.qeedoo.ui.view.compDragable

