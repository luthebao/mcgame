// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MonthWelfarePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.containers.ViewStack;
    import mx.controls.Label;
    import mx.controls.TextInput;
    import mx.containers.VBox;
    import mx.controls.Button;
    import mx.effects.Rotate;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.net.Responder;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.view.comp.MonthWelfareLBCanvas;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.utils.TimeUtil;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.binding.BindingManager;
    import com.qeedoo.game.view.ViewManager;
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

    public class MonthWelfarePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1491390272myLotto:LinkTextArea;
        private var endZPRad:Number = 0;
        private var _115759uiC:Image;
        private var count:Number = 0;
        private var _86709745zpitem8:ItemSlot;
        private var _808329852vsFlop:ViewStack;
        private var _86709744zpitem9:ItemSlot;
        private var _1606965032zpitem10:ItemSlot;
        private var _3588577uiC0:Image;
        private var _1606289880endtime:Label;
        private var _1537286028guajiNum:TextInput;
        private var _86709752zpitem1:ItemSlot;
        public var _MonthWelfarePanel_Image1:Image;
        public var _MonthWelfarePanel_Image4:Image;
        private var run:Boolean = false;
        private var _3756vb:VBox;
        private var _86709749zpitem4:ItemSlot;
        private var _1134658361keynum:Button;
        private var _86709751zpitem2:ItemSlot;
        private var _1682357501changeAngle:Rotate;
        public var _MonthWelfarePanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _MonthWelfarePanel_BasicGlowButton5:BasicGlowButton;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _86709748zpitem5:ItemSlot;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _86709750zpitem3:ItemSlot;
        private var _1982241108BagBtn:BasicGlowButton;
        private var _1863324754bangBtn2:BasicGlowButton;
        private var _92960979angle:Number = 18;
        private var _789140625helpinfo:Label;
        private var _86709747zpitem6:ItemSlot;
        private var _92271712zpcsnum:Label;
        private var _133638349turnAll1:DelayButton;
        private var _2128341457starttime:Label;
        private var _86709746zpitem7:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":670,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MonthWelfarePanel_BasicTitleCanvas1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn0",
                        "events":{"click":"__bangBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "labelPlacement":"bottom",
                                "width":70,
                                "x":20,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn1",
                        "events":{"click":"__bangBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "width":70,
                                "x":89,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn2",
                        "events":{"click":"__bangBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "width":70,
                                "x":158,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsFlop",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":55,
                                "width":650,
                                "height":380,
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "y":60,
                                            "width":679.95,
                                            "height":420,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MonthWelfarePanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.5,
                                                        "y":2.5,
                                                        "width":645,
                                                        "height":375
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"uiC0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":10,
                                                        "width":346,
                                                        "height":343
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"uiC",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":93,
                                                        "y":102,
                                                        "width":160,
                                                        "height":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"turnAll1",
                                                "events":{"click":"__turnAll1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":123,
                                                        "y":132,
                                                        "width":100,
                                                        "height":100,
                                                        "styleName":"manjiujianBtn"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":423,
                                                        "y":63,
                                                        "width":200,
                                                        "height":210,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"myLotto",
                                                            "events":{"valueCommit":"__myLotto_valueCommit"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.top = "5";
                                                                this.right = "5";
                                                                this.bottom = "0";
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 14;
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selectable":false,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"auto"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"BagBtn",
                                                "events":{"click":"__BagBtn_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":560,
                                                        "y":3,
                                                        "width":83
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_MonthWelfarePanel_BasicGlowButton5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":480,
                                                        "y":40,
                                                        "width":80,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"guajiNum",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":280,
                                                        "y":297,
                                                        "width":38
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___MonthWelfarePanel_Button1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0x0101,
                                                        "y":318,
                                                        "styleName":"monthWelfareKaiShi",
                                                        "width":116,
                                                        "height":62
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":308,
                                                        "y":269,
                                                        "text":"一键挂机",
                                                        "width":57
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___MonthWelfarePanel_Button2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":326,
                                                        "y":288,
                                                        "styleName":"monthWelfareMax",
                                                        "width":34,
                                                        "height":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"endtime",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":384,
                                                        "y":325,
                                                        "text":"Label",
                                                        "width":239
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"starttime",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":384,
                                                        "y":308,
                                                        "text":"Label",
                                                        "width":239
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":157,
                                                        "y":62,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":216,
                                                        "y":81,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":132,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":194,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":219,
                                                        "y":245,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":158,
                                                        "y":265,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":97,
                                                        "y":245,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":62,
                                                        "y":194,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":62,
                                                        "y":130,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"zpitem10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":99,
                                                        "y":81,
                                                        "movable":false
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
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "y":60,
                                            "width":679.95,
                                            "height":420,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MonthWelfarePanel_Image4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.5,
                                                        "y":2.5,
                                                        "width":645,
                                                        "height":375
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vb",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.top = "0";
                                                    this.verticalGap = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "minHeight":0,
                                                        "minWidth":0,
                                                        "verticalScrollPolicy":"on",
                                                        "horizontalScrollPolicy":"off",
                                                        "x":0
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
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "y":60,
                                            "width":679.95,
                                            "height":420,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"helpinfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "width":630,
                                                        "height":360
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"zpcsnum",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFD700;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":537,
                                "y":35,
                                "text":"可转动次数：",
                                "width":123,
                                "visible":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"keynum",
                        "events":{"click":"__keynum_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0x0200,
                                "y":32,
                                "width":130,
                                "height":23,
                                "styleName":"changtiao",
                                "visible":false
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var monthWelfareConf:Object = {};
        private var monthWelfareData:Object = {};
        private var monthWelfareZpItem:Object = {};
        private var monthWelfareArr:Array = new Array();
        private var MonthWelfareCanvasObj:Object = {};
        private var timer:Timer = new Timer(50);
        private var timer1:Timer = new Timer(3000);
        private var zpItemArr:Array = new Array();
        private var itemList:ArrayCollection = new ArrayCollection();
        private var ChildArr:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MonthWelfarePanel()
        {
            mx_internal::_document = this;
            this.width = 670;
            this.height = 450;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            _MonthWelfarePanel_Rotate1_i();
            this.addEventListener("creationComplete", ___MonthWelfarePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MonthWelfarePanel._watcherSetupUtil = _arg_1;
        }


        public function showPanel():*
        {
            initView();
            visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get zpitem2():ItemSlot
        {
            return (this._86709751zpitem2);
        }

        [Bindable(event="propertyChange")]
        public function get zpitem4():ItemSlot
        {
            return (this._86709749zpitem4);
        }

        [Bindable(event="propertyChange")]
        public function get zpitem5():ItemSlot
        {
            return (this._86709748zpitem5);
        }

        public function set changeAngle(_arg_1:Rotate):void
        {
            var _local_2:Object = this._1682357501changeAngle;
            if (_local_2 !== _arg_1)
            {
                this._1682357501changeAngle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeAngle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get zpitem7():ItemSlot
        {
            return (this._86709746zpitem7);
        }

        public function set zpitem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709752zpitem1;
            if (_local_2 !== _arg_1)
            {
                this._86709752zpitem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get zpitem3():ItemSlot
        {
            return (this._86709750zpitem3);
        }

        public function __keynum_click(_arg_1:MouseEvent):void
        {
            ongetMonthWelfareZK();
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        public function set vsFlop(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._808329852vsFlop;
            if (_local_2 !== _arg_1)
            {
                this._808329852vsFlop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsFlop", _local_2, _arg_1));
            };
        }

        public function set zpitem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709751zpitem2;
            if (_local_2 !== _arg_1)
            {
                this._86709751zpitem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem2", _local_2, _arg_1));
            };
        }

        private function ongetMonthWelfareZK():void
        {
            _core.remote.call("getMonthWelfareZK", new Responder(showMonthWelfareZK));
        }

        [Bindable(event="propertyChange")]
        public function get zpitem6():ItemSlot
        {
            return (this._86709747zpitem6);
        }

        public function set zpitem4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709749zpitem4;
            if (_local_2 !== _arg_1)
            {
                this._86709749zpitem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem4", _local_2, _arg_1));
            };
        }

        public function set zpitem5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709748zpitem5;
            if (_local_2 !== _arg_1)
            {
                this._86709748zpitem5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem5", _local_2, _arg_1));
            };
        }

        public function set zpitem6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709747zpitem6;
            if (_local_2 !== _arg_1)
            {
                this._86709747zpitem6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem6", _local_2, _arg_1));
            };
        }

        public function set zpitem3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709750zpitem3;
            if (_local_2 !== _arg_1)
            {
                this._86709750zpitem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get changeAngle():Rotate
        {
            return (this._1682357501changeAngle);
        }

        [Bindable(event="propertyChange")]
        public function get endtime():Label
        {
            return (this._1606289880endtime);
        }

        [Bindable(event="propertyChange")]
        public function get zpitem1():ItemSlot
        {
            return (this._86709752zpitem1);
        }

        public function set zpitem7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709746zpitem7;
            if (_local_2 !== _arg_1)
            {
                this._86709746zpitem7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem7", _local_2, _arg_1));
            };
        }

        public function set zpitem8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709745zpitem8;
            if (_local_2 !== _arg_1)
            {
                this._86709745zpitem8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get starttime():Label
        {
            return (this._2128341457starttime);
        }

        [Bindable(event="propertyChange")]
        public function get zpitem8():ItemSlot
        {
            return (this._86709745zpitem8);
        }

        [Bindable(event="propertyChange")]
        public function get uiC():Image
        {
            return (this._115759uiC);
        }

        [Bindable(event="propertyChange")]
        public function get zpitem10():ItemSlot
        {
            return (this._1606965032zpitem10);
        }

        [Bindable(event="propertyChange")]
        public function get zpitem9():ItemSlot
        {
            return (this._86709744zpitem9);
        }

        public function set zpitem9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709744zpitem9;
            if (_local_2 !== _arg_1)
            {
                this._86709744zpitem9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem9", _local_2, _arg_1));
            };
        }

        private function _MonthWelfarePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MONTH_WELFARE_PANEL[0];
            _local_1 = Language.MONTH_WELFARE_PANEL[12];
            _local_1 = Language.MONTH_WELFARE_PANEL[13];
            _local_1 = Language.MONTH_WELFARE_PANEL[14];
            _local_1 = uiC;
            _local_1 = (angle - 18);
            _local_1 = angle;
            _local_1 = ResManager.getIconUrl(4130220000573);
            _local_1 = ResManager.getIconUrl(4130220000513);
            _local_1 = ResManager.getIconUrl(4130220000512);
            _local_1 = Language.MONTH_WELFARE_PANEL[16];
            _local_1 = Language.MONTH_WELFARE_PANEL[15];
            _local_1 = ResManager.getIconUrl(4130220000573);
        }

        [Bindable(event="propertyChange")]
        public function get myLotto():LinkTextArea
        {
            return (this._1491390272myLotto);
        }

        public function set zpcsnum(_arg_1:Label):void
        {
            var _local_2:Object = this._92271712zpcsnum;
            if (_local_2 !== _arg_1)
            {
                this._92271712zpcsnum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpcsnum", _local_2, _arg_1));
            };
        }

        public function set endtime(_arg_1:Label):void
        {
            var _local_2:Object = this._1606289880endtime;
            if (_local_2 !== _arg_1)
            {
                this._1606289880endtime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endtime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get BagBtn():BasicGlowButton
        {
            return (this._1982241108BagBtn);
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        public function set zpitem10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1606965032zpitem10;
            if (_local_2 !== _arg_1)
            {
                this._1606965032zpitem10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem10", _local_2, _arg_1));
            };
        }

        public function set bangBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324756bangBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1863324756bangBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn0", _local_2, _arg_1));
            };
        }

        public function set bangBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324755bangBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1863324755bangBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn1", _local_2, _arg_1));
            };
        }

        public function set starttime(_arg_1:Label):void
        {
            var _local_2:Object = this._2128341457starttime;
            if (_local_2 !== _arg_1)
            {
                this._2128341457starttime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starttime", _local_2, _arg_1));
            };
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

        public function ___MonthWelfarePanel_Button1_click(_arg_1:MouseEvent):void
        {
            playMonthWelfareTurnTableAll();
        }

        public function set bangBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324754bangBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1863324754bangBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn2", _local_2, _arg_1));
            };
        }

        private function onInitMonthWelfareData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Number;
            var _local_4:*;
            var _local_5:*;
            var _local_6:String;
            var _local_7:String;
            var _local_8:Number;
            var _local_9:*;
            var _local_10:Number;
            var _local_11:MonthWelfareLBCanvas;
            var _local_12:Array;
            var _local_13:Array;
            var _local_14:Array;
            var _local_15:Array;
            var _local_16:*;
            var _local_17:*;
            if (_arg_1)
            {
                if (_arg_1["data"])
                {
                    monthWelfareData = _arg_1["data"];
                    zpcsnum.htmlText = Language.MONTH_WELFARE_PANEL[21].replace("{num}", monthWelfareData.zpnum);
                    keynum.label = Language.MONTH_WELFARE_PANEL[23].replace("{num}", monthWelfareData.Keynum);
                    keynum.enabled = true;
                    if (monthWelfareData.Keynum <= 0)
                    {
                        keynum.enabled = false;
                    };
                    monthWelfareArr = new Array();
                    for (_local_4 in monthWelfareData.HadItemArr)
                    {
                        monthWelfareArr.push(monthWelfareData.HadItemArr[_local_4]);
                    };
                    _local_5 = monthWelfareArr.length;
                    _local_6 = "";
                    _local_7 = "获得1个";
                    _local_8 = 0;
                    myLotto.htmlText = "";
                    _local_3 = 0;
                    while (_local_3 < _local_5)
                    {
                        _local_9 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][monthWelfareArr[_local_3].haditem.iid];
                        if (_local_9)
                        {
                            _local_8 = _local_9.color;
                        };
                        if (_local_8 < 0)
                        {
                            _local_8 = 0;
                        };
                        _local_6 = (((((_local_7 + "<font color='") + GamePredef.MSG_ITEM_COLOR[_local_8]) + "'>") + _local_9.name) + "</font><br/>");
                        myLotto.htmlText = (myLotto.htmlText + _local_6);
                        _local_3++;
                    };
                };
                if (_arg_1["conf"])
                {
                    monthWelfareConf = _arg_1["conf"];
                    starttime.text = Language.MONTH_WELFARE_PANEL[17].replace("{time}", TimeUtil.dateTimeToString(new Date(monthWelfareConf.start)));
                    endtime.text = Language.MONTH_WELFARE_PANEL[18].replace("{time}", TimeUtil.dateTimeToString(new Date(monthWelfareConf.end)));
                    helpinfo.htmlText = Language.MONTH_WELFARE_PANEL[24].replace("{num}", (Number(monthWelfareConf.integralonce) * 10));
                };
                if (_arg_1["zpitem"])
                {
                    monthWelfareZpItem = _arg_1["zpitem"];
                    zpItemArr = new Array();
                    _local_10 = 0;
                    _local_3 = 1;
                    while (_local_3 <= 10)
                    {
                        zpItemArr[_local_3] = {};
                        zpItemArr[_local_3].r = _local_10;
                        _local_10 = (_local_10 + 36);
                        zpItemArr[_local_3].iid = monthWelfareZpItem[_local_3].iid;
                        this[("zpitem" + _local_3)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[("zpitem" + _local_3)].giid = monthWelfareZpItem[_local_3].iid;
                        this[("zpitem" + _local_3)].slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][monthWelfareZpItem[_local_3].iid];
                        _local_3++;
                    };
                };
                _local_2 = monthWelfareConf.iInfo;
                vb.removeAllChildren();
                _local_3 = 1;
                while (_local_3 <= 3)
                {
                    _local_11 = new MonthWelfareLBCanvas();
                    _local_12 = [];
                    _local_13 = [];
                    _local_14 = [];
                    _local_15 = [];
                    for (_local_16 in _local_2)
                    {
                        if (((_local_2[_local_16]) && (_local_2[_local_16].inc == _local_3)))
                        {
                            _local_12.push(_local_2[_local_16].iid);
                            _local_13.push(GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2[_local_16].iid].name);
                            _local_14.push(_local_2[_local_16].price);
                            for (_local_17 in monthWelfareData.xgnum)
                            {
                                if (monthWelfareData.xgnum[_local_17].iid == _local_2[_local_16].iid)
                                {
                                    _local_15.push(monthWelfareData.xgnum[_local_17].num);
                                    break;
                                };
                            };
                        };
                    };
                    _local_11.ZKShow = getShowZK(_local_3);
                    _local_11.Leixin = _local_3;
                    _local_11.ItemArr = _local_12;
                    _local_11.LabArr = _local_13;
                    _local_11.YuanJiaArr = _local_14;
                    _local_11.XGnumArr = _local_15;
                    vb.addChild(_local_11);
                    ChildArr[_local_3] = _local_11;
                    _local_3++;
                };
            };
        }

        public function set uiC(_arg_1:Image):void
        {
            var _local_2:Object = this._115759uiC;
            if (_local_2 !== _arg_1)
            {
                this._115759uiC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "uiC", _local_2, _arg_1));
            };
        }

        public function ___MonthWelfarePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get guajiNum():TextInput
        {
            return (this._1537286028guajiNum);
        }

        private function showMonthWelfareZK(_arg_1:Object):void
        {
            var _local_4:MonthWelfareLBCanvas;
            var _local_5:Array;
            var _local_6:Array;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:*;
            var _local_10:*;
            if (!_arg_1)
            {
                return;
            };
            monthWelfareData = _arg_1;
            var _local_2:Object = monthWelfareConf.iInfo;
            vb.removeAllChildren();
            var _local_3:Number = 1;
            while (_local_3 <= 3)
            {
                _local_4 = new MonthWelfareLBCanvas();
                _local_5 = [];
                _local_6 = [];
                _local_7 = [];
                _local_8 = [];
                for (_local_9 in _local_2)
                {
                    if (((_local_2[_local_9]) && (_local_2[_local_9].inc == _local_3)))
                    {
                        _local_5.push(_local_2[_local_9].iid);
                        _local_6.push(GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2[_local_9].iid].name);
                        _local_7.push(_local_2[_local_9].price);
                        for (_local_10 in monthWelfareData.xgnum)
                        {
                            if (monthWelfareData.xgnum[_local_10].iid == _local_2[_local_9].iid)
                            {
                                _local_8.push(monthWelfareData.xgnum[_local_10].num);
                                break;
                            };
                        };
                    };
                };
                _local_4.ZKShow = getShowZK(_local_3);
                _local_4.Leixin = _local_3;
                _local_4.ItemArr = _local_5;
                _local_4.LabArr = _local_6;
                _local_4.YuanJiaArr = _local_7;
                _local_4.XGnumArr = _local_8;
                vb.addChild(_local_4);
                ChildArr[_local_3] = _local_4;
                _local_3++;
            };
            keynum.label = Language.MONTH_WELFARE_PANEL[23].replace("{num}", monthWelfareData.Keynum);
            if (monthWelfareData.Keynum <= 0)
            {
                keynum.enabled = false;
            };
            Alert.show(((((((((("本次使用折扣钥匙获得" + "\n") + "稀有道具折扣：") + getShowZK(1)) + "\n") + "精品道具折扣：") + getShowZK(2)) + "\n") + "超值道具折扣：") + getShowZK(3)));
        }

        public function __turnAll1_click(_arg_1:MouseEvent):void
        {
            playMonthWelfareTurnTable();
        }

        private function setSlot():void
        {
        }

        private function addDataToList():ArrayCollection
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_1:ArrayCollection = new ArrayCollection();
            var _local_2:Object = ((monthWelfareConf["iInfo"]) ? monthWelfareConf["iInfo"] : null);
            for each (_local_3 in _local_2)
            {
                if (_local_3 != null)
                {
                    _local_4 = new Object();
                    _local_4.type = _local_3.tid;
                    _local_4.giid = _local_3.iid;
                    _local_4.point = _local_3.pt;
                    _local_4.limit = _local_3.lt;
                    _local_1.addItem(_local_4);
                };
            };
            return (_local_1);
        }

        private function moveTurnTable(_arg_1:Event):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:Number;
            var _local_5:*;
            var _local_6:*;
            count++;
            if (count <= 60)
            {
                changeAngle.stop();
                angle = (angle + 18);
                changeAngle.play();
            }
            else
            {
                if (count <= 50)
                {
                    if ((count % 2) == 0)
                    {
                        changeAngle.stop();
                        angle = (angle + 18);
                        changeAngle.play();
                    };
                }
                else
                {
                    if ((count % 3) == 0)
                    {
                        changeAngle.stop();
                        angle = (angle + 18);
                        changeAngle.play();
                        if (ToolKit.isEqual(((angle - 18) % 360), endZPRad))
                        {
                            changeAngle.stop();
                            run = false;
                            if (timer.running)
                            {
                                timer.stop();
                            };
                            if (timer.hasEventListener(TimerEvent.TIMER))
                            {
                                timer.removeEventListener(TimerEvent.TIMER, moveTurnTable);
                            };
                            _local_2 = "";
                            _local_3 = "获得1个";
                            _local_4 = 0;
                            myLotto.htmlText = "";
                            for (_local_5 in monthWelfareArr)
                            {
                                _local_6 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][monthWelfareArr[_local_5].haditem.iid];
                                if (_local_6)
                                {
                                    _local_4 = _local_6.color;
                                };
                                if (_local_4 < 0)
                                {
                                    _local_4 = 0;
                                };
                                _local_2 = (((((_local_3 + "<font color='") + GamePredef.MSG_ITEM_COLOR[_local_4]) + "'>") + _local_6.name) + "</font><br/>");
                                myLotto.htmlText = (myLotto.htmlText + _local_2);
                            };
                        };
                    };
                };
            };
        }

        public function onMWTurnTable(_arg_1:Object, _arg_2:Object):void
        {
            var _local_3:*;
            if (initialized)
            {
                monthWelfareData = _arg_2;
                run = true;
                if (timer.running)
                {
                    timer.stop();
                };
                if (timer.hasEventListener(TimerEvent.TIMER))
                {
                    timer.removeEventListener(TimerEvent.TIMER, moveTurnTable);
                };
                count = 0;
                for (_local_3 in zpItemArr)
                {
                    if (ToolKit.isEqual(zpItemArr[_local_3].iid, _arg_1.iid))
                    {
                        endZPRad = zpItemArr[_local_3].r;
                        break;
                    };
                };
                zpcsnum.htmlText = Language.MONTH_WELFARE_PANEL[21].replace("{num}", monthWelfareData.zpnum);
                keynum.label = Language.MONTH_WELFARE_PANEL[23].replace("{num}", monthWelfareData.Keynum);
                if (monthWelfareData.Keynum > 0)
                {
                    keynum.enabled = true;
                };
                timer.addEventListener(TimerEvent.TIMER, moveTurnTable);
                timer.start();
            };
        }

        private function changeView(_arg_1:Number):void
        {
            vsFlop.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 3)
            {
                this[("bangBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
            if (_arg_1 == 0)
            {
                zpcsnum.visible = true;
                keynum.visible = false;
            };
            if (_arg_1 == 1)
            {
                zpcsnum.visible = false;
                keynum.visible = true;
            };
            if (_arg_1 == 2)
            {
                zpcsnum.visible = false;
                keynum.visible = false;
            };
        }

        public function set keynum(_arg_1:Button):void
        {
            var _local_2:Object = this._1134658361keynum;
            if (_local_2 !== _arg_1)
            {
                this._1134658361keynum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "keynum", _local_2, _arg_1));
            };
        }

        public function set myLotto(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1491390272myLotto;
            if (_local_2 !== _arg_1)
            {
                this._1491390272myLotto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLotto", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vsFlop():ViewStack
        {
            return (this._808329852vsFlop);
        }

        public function onbuyMonthWelfareClient(_arg_1:Object, _arg_2:Number):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (initialized)
            {
                _local_3 = ChildArr[_arg_2].ItemArr;
                _local_4 = ChildArr[_arg_2].XGnumArr;
                for (_local_5 in _local_3)
                {
                    if (_local_3[_local_5] == _arg_1.iid)
                    {
                        _local_4[_local_5] = _arg_1.num;
                    };
                };
                ChildArr[_arg_2].ItemArr = _local_3;
                ChildArr[_arg_2].XGnumArr = _local_4;
            };
        }

        override public function initialize():void
        {
            var target:MonthWelfarePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MonthWelfarePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MonthWelfarePanelWatcherSetupUtil");
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

        private function _MonthWelfarePanel_Rotate1_i():Rotate
        {
            var _local_1:Rotate = new Rotate();
            changeAngle = _local_1;
            BindingManager.executeBindings(this, "changeAngle", changeAngle);
            return (_local_1);
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            changeView(2);
        }

        public function set turnAll1(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._133638349turnAll1;
            if (_local_2 !== _arg_1)
            {
                this._133638349turnAll1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "turnAll1", _local_2, _arg_1));
            };
        }

        public function ___MonthWelfarePanel_Button2_click(_arg_1:MouseEvent):void
        {
            getZPMaxNum();
        }

        [Bindable(event="propertyChange")]
        public function get zpcsnum():Label
        {
            return (this._92271712zpcsnum);
        }

        public function set BagBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1982241108BagBtn;
            if (_local_2 !== _arg_1)
            {
                this._1982241108BagBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "BagBtn", _local_2, _arg_1));
            };
        }

        public function __myLotto_valueCommit(_arg_1:FlexEvent):void
        {
            myLotto.verticalScrollPosition = myLotto.maxVerticalScrollPosition;
        }

        public function onbroadCastMonthWelfareMsg(_arg_1:Array):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (initialized)
            {
                if (_arg_1.length == 0)
                {
                    return;
                };
                if (_arg_1.length >= 10)
                {
                    monthWelfareArr = _arg_1.splice((_arg_1.length - 10), 10);
                }
                else
                {
                    _local_2 = _arg_1.length;
                    _local_3 = ((monthWelfareArr.length + _local_2) - 10);
                    if (_local_3 > 0)
                    {
                        monthWelfareArr.splice(0, _local_3);
                    };
                    _local_4 = 0;
                    while (_local_4 < _arg_1.length)
                    {
                        monthWelfareArr.push(_arg_1[_local_4]);
                        _local_4++;
                    };
                };
            };
        }

        private function getZPMaxNum():void
        {
            if (monthWelfareData.zpnum < 0)
            {
                return;
            };
            guajiNum.text = monthWelfareData.zpnum;
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn1():BasicGlowButton
        {
            return (this._1863324755bangBtn1);
        }

        public function __BagBtn_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_MONTHWELFARE_BAG);
        }

        public function set angle(_arg_1:Number):void
        {
            var _local_2:Object = this._92960979angle;
            if (_local_2 !== _arg_1)
            {
                this._92960979angle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "angle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get helpinfo():Label
        {
            return (this._789140625helpinfo);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn0():BasicGlowButton
        {
            return (this._1863324756bangBtn0);
        }

        private function showItemShop():void
        {
            if (initialized)
            {
                itemList.removeAll();
                itemList = addDataToList();
                setSlot();
            };
        }

        private function _MonthWelfarePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONTH_WELFARE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MonthWelfarePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MonthWelfarePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONTH_WELFARE_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONTH_WELFARE_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONTH_WELFARE_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (uiC);
            }, function (_arg_1:Object):void
            {
                changeAngle.target = _arg_1;
            }, "changeAngle.target");
            result[4] = binding;
            binding = new Binding(this, function ():Number
            {
                return (angle - 18);
            }, function (_arg_1:Number):void
            {
                changeAngle.angleFrom = _arg_1;
            }, "changeAngle.angleFrom");
            result[5] = binding;
            binding = new Binding(this, function ():Number
            {
                return (angle);
            }, function (_arg_1:Number):void
            {
                changeAngle.angleTo = _arg_1;
            }, "changeAngle.angleTo");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000573));
            }, function (_arg_1:Object):void
            {
                _MonthWelfarePanel_Image1.source = _arg_1;
            }, "_MonthWelfarePanel_Image1.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000513));
            }, function (_arg_1:Object):void
            {
                uiC0.source = _arg_1;
            }, "uiC0.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000512));
            }, function (_arg_1:Object):void
            {
                uiC.source = _arg_1;
            }, "uiC.source");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONTH_WELFARE_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                BagBtn.label = _arg_1;
            }, "BagBtn.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONTH_WELFARE_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MonthWelfarePanel_BasicGlowButton5.label = _arg_1;
            }, "_MonthWelfarePanel_BasicGlowButton5.label");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000573));
            }, function (_arg_1:Object):void
            {
                _MonthWelfarePanel_Image4.source = _arg_1;
            }, "_MonthWelfarePanel_Image4.source");
            result[12] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get turnAll1():DelayButton
        {
            return (this._133638349turnAll1);
        }

        [Bindable(event="propertyChange")]
        public function get keynum():Button
        {
            return (this._1134658361keynum);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn2():BasicGlowButton
        {
            return (this._1863324754bangBtn2);
        }

        public function set uiC0(_arg_1:Image):void
        {
            var _local_2:Object = this._3588577uiC0;
            if (_local_2 !== _arg_1)
            {
                this._3588577uiC0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "uiC0", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initMonthWelfarePanelData", new Responder(onInitMonthWelfareData));
        }

        [Bindable(event="propertyChange")]
        public function get vb():VBox
        {
            return (this._3756vb);
        }

        public function set helpinfo(_arg_1:Label):void
        {
            var _local_2:Object = this._789140625helpinfo;
            if (_local_2 !== _arg_1)
            {
                this._789140625helpinfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "helpinfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get angle():Number
        {
            return (this._92960979angle);
        }

        private function getShowZK(_arg_1:Number):Number
        {
            if (_arg_1 == 1)
            {
                return (monthWelfareData.zk.XY);
            };
            if (_arg_1 == 2)
            {
                return (monthWelfareData.zk.JP);
            };
            if (_arg_1 == 3)
            {
                return (monthWelfareData.zk.CZ);
            };
            return (0);
        }

        public function set guajiNum(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1537286028guajiNum;
            if (_local_2 !== _arg_1)
            {
                this._1537286028guajiNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guajiNum", _local_2, _arg_1));
            };
        }

        private function playMonthWelfareTurnTable():void
        {
            if (run)
            {
                _core.sysMsg(Language.MONTH_WELFARE_PANEL[19]);
                return;
            };
            if (ToolKit.isSmallOrEqual(monthWelfareData.zpnum, 0))
            {
                _core.sysMsg(Language.MONTH_WELFARE_PANEL[20]);
                return;
            };
            _core.remote.call("playMonthWelfareTurnTableOne", null);
        }

        private function playMonthWelfareTurnTableAll():void
        {
            var _local_1:* = Number(guajiNum.text);
            if (run)
            {
                _core.sysMsg(Language.MONTH_WELFARE_PANEL[19]);
                return;
            };
            if (ToolKit.isSmallOrEqual(monthWelfareData.zpnum, 0))
            {
                _core.sysMsg(Language.MONTH_WELFARE_PANEL[20]);
                return;
            };
            if (((_local_1 <= 0) || (!((_local_1 - Math.floor(_local_1)) == 0))))
            {
                _core.sysMsg(Language.MONTH_WELFARE_PANEL[22]);
                return;
            };
            _core.remote.call("playMonthWelfareTurnTableAll", null, _local_1);
        }

        [Bindable(event="propertyChange")]
        public function get uiC0():Image
        {
            return (this._3588577uiC0);
        }


    }
}//package com.qeedoo.ui.view.compDragable

