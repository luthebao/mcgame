// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AnniversaryTurntable

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.Alert;
    import mx.controls.LinkButton;
    import mx.controls.Label;
    import mx.effects.Rotate;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import flash.utils.Timer;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import mx.managers.PopUpManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.BindingManager;
    import com.qeedoo.game.data.GameData;
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

    public class AnniversaryTurntable extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1491390272myLotto:LinkTextArea;
        private var endZPRad:Number = 0;
        private var _115759uiC:Image;
        private var count:Number = 0;
        private var _86709745zpitem8:ItemSlot;
        private var _helpAlert:Alert;
        private var _108873975rules:LinkButton;
        private var _86709744zpitem9:ItemSlot;
        public var _AnniversaryTurntable_Label1:Label;
        private var awardItemId:* = -1;
        private var _86709753zpitem0:ItemSlot;
        private var _3588577uiC0:Image;
        private var _1606289880endtime:Label;
        private var _86709752zpitem1:ItemSlot;
        private var run:Boolean = false;
        private var _1139748787ticketsLabel:Label;
        private var _86709749zpitem4:ItemSlot;
        private var _86709751zpitem2:ItemSlot;
        private var _1682357501changeAngle:Rotate;
        private var _86709748zpitem5:ItemSlot;
        public var _AnniversaryTurntable_Image1:Image;
        private var _86709750zpitem3:ItemSlot;
        public var _AnniversaryTurntable_BasicTitleCanvas1:BasicTitleCanvas;
        private var _92960979angle:Number = 18;
        private var _86709747zpitem6:ItemSlot;
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
                        "id":"_AnniversaryTurntable_BasicTitleCanvas1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "40";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "label":"Hornor",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_AnniversaryTurntable_Image1",
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
                                            "clickDelay":8000,
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
                                            "height":15,
                                            "y":48,
                                            "styleName":"StandardTitle",
                                            "width":200,
                                            "x":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_AnniversaryTurntable_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xF9F900;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":47,
                                            "width":153,
                                            "x":423
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
                                    "type":Label,
                                    "id":"ticketsLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":310,
                                            "y":325
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":310,
                                            "y":340,
                                            "text":"Mỗi lần quay cần 1 phiếu"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"endtime",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFD700;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":454,
                                            "y":325,
                                            "text":"Mỗi loại phần thưởng chỉ nhận 1 lần",
                                            "width":239
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"starttime",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFD700;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":454,
                                            "y":340,
                                            "text":"Kết thúc: 23:59, 17/07/2019",
                                            "width":239
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"zpitem0",
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
                                    "id":"zpitem1",
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
                                    "id":"zpitem2",
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
                                    "id":"zpitem3",
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
                                    "id":"zpitem4",
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
                                    "id":"zpitem5",
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
                                    "id":"zpitem6",
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
                                    "id":"zpitem7",
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
                                    "id":"zpitem8",
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
                                    "id":"zpitem9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":99,
                                            "y":81,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"rules",
                                    "events":{"click":"__rules_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":560,
                                            "y":3
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var timer:Timer = new Timer(50);
        private var _core:Core = Core.getInstance();
        private var ATAwardList:Array = [5262, 5949, 5357, 3837, 5948, 5905, 4786, 5906, 6252, 3755];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AnniversaryTurntable()
        {
            mx_internal::_document = this;
            this.width = 670;
            this.height = 450;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            _AnniversaryTurntable_Rotate1_i();
            this.addEventListener("creationComplete", ___AnniversaryTurntable_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AnniversaryTurntable._watcherSetupUtil = _arg_1;
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
        public function get zpitem0():ItemSlot
        {
            return (this._86709753zpitem0);
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

        [Bindable(event="propertyChange")]
        public function get changeAngle():Rotate
        {
            return (this._1682357501changeAngle);
        }

        public function set zpitem0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709753zpitem0;
            if (_local_2 !== _arg_1)
            {
                this._86709753zpitem0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get zpitem1():ItemSlot
        {
            return (this._86709752zpitem1);
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

        public function set zpitem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709751zpitem2;
            if (_local_2 !== _arg_1)
            {
                this._86709751zpitem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem2", _local_2, _arg_1));
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

        public function set zpitem4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._86709749zpitem4;
            if (_local_2 !== _arg_1)
            {
                this._86709749zpitem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zpitem4", _local_2, _arg_1));
            };
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

        [Bindable(event="propertyChange")]
        public function get zpitem4():ItemSlot
        {
            return (this._86709749zpitem4);
        }

        [Bindable(event="propertyChange")]
        public function get zpitem6():ItemSlot
        {
            return (this._86709747zpitem6);
        }

        [Bindable(event="propertyChange")]
        public function get zpitem7():ItemSlot
        {
            return (this._86709746zpitem7);
        }

        [Bindable(event="propertyChange")]
        public function get zpitem8():ItemSlot
        {
            return (this._86709745zpitem8);
        }

        [Bindable(event="propertyChange")]
        public function get endtime():Label
        {
            return (this._1606289880endtime);
        }

        public function ___AnniversaryTurntable_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
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
        public function get uiC():Image
        {
            return (this._115759uiC);
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

        [Bindable(event="propertyChange")]
        public function get myLotto():LinkTextArea
        {
            return (this._1491390272myLotto);
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

        [Bindable(event="propertyChange")]
        public function get ticketsLabel():Label
        {
            return (this._1139748787ticketsLabel);
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

        public function set starttime(_arg_1:Label):void
        {
            var _local_2:Object = this._2128341457starttime;
            if (_local_2 !== _arg_1)
            {
                this._2128341457starttime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starttime", _local_2, _arg_1));
            };
        }

        private function _AnniversaryTurntable_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNI_TURNTABLE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnniversaryTurntable_BasicTitleCanvas1.text = _arg_1;
            }, "_AnniversaryTurntable_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (uiC);
            }, function (_arg_1:Object):void
            {
                changeAngle.target = _arg_1;
            }, "changeAngle.target");
            result[1] = binding;
            binding = new Binding(this, function ():Number
            {
                return (angle - 18);
            }, function (_arg_1:Number):void
            {
                changeAngle.angleFrom = _arg_1;
            }, "changeAngle.angleFrom");
            result[2] = binding;
            binding = new Binding(this, function ():Number
            {
                return (angle);
            }, function (_arg_1:Number):void
            {
                changeAngle.angleTo = _arg_1;
            }, "changeAngle.angleTo");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000573));
            }, function (_arg_1:Object):void
            {
                _AnniversaryTurntable_Image1.source = _arg_1;
            }, "_AnniversaryTurntable_Image1.source");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000513));
            }, function (_arg_1:Object):void
            {
                uiC0.source = _arg_1;
            }, "uiC0.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000512));
            }, function (_arg_1:Object):void
            {
                uiC.source = _arg_1;
            }, "uiC.source");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryTurntable_Label1.filters = _arg_1;
            }, "_AnniversaryTurntable_Label1.filters");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNI_TURNTABLE_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnniversaryTurntable_Label1.text = _arg_1;
            }, "_AnniversaryTurntable_Label1.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONTH_WELFARE_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rules.label = _arg_1;
            }, "rules.label");
            result[9] = binding;
            return (result);
        }

        public function __rules_click(_arg_1:MouseEvent):void
        {
            helpInfo();
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

        public function __turnAll1_click(_arg_1:MouseEvent):void
        {
            playMonthWelfareTurnTable();
        }

        private function moveTurnTable(_arg_1:Event):void
        {
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
                            _core.remote.call("getAnniTurnTableAward", null, awardItemId);
                            awardItemId = -1;
                        };
                    };
                };
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

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.ANNI_TURNTABLE_PANEL[3].toString();
            _helpAlert = Alert.show(_local_1, Language.CARD_GAME_P[19].toString(), Alert.YES, null, null);
        }

        override public function initialize():void
        {
            var target:AnniversaryTurntable;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AnniversaryTurntable_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AnniversaryTurntableWatcherSetupUtil");
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

        public function set ticketsLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1139748787ticketsLabel;
            if (_local_2 !== _arg_1)
            {
                this._1139748787ticketsLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ticketsLabel", _local_2, _arg_1));
            };
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

        public function __myLotto_valueCommit(_arg_1:FlexEvent):void
        {
            myLotto.verticalScrollPosition = 0;
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

        private function _AnniversaryTurntable_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ANNI_TURNTABLE_PANEL[0];
            _local_1 = uiC;
            _local_1 = (angle - 18);
            _local_1 = angle;
            _local_1 = ResManager.getIconUrl(4130220000573);
            _local_1 = ResManager.getIconUrl(4130220000513);
            _local_1 = ResManager.getIconUrl(4130220000512);
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.ANNI_TURNTABLE_PANEL[1];
            _local_1 = Language.MONTH_WELFARE_PANEL[14];
        }

        private function _AnniversaryTurntable_Rotate1_i():Rotate
        {
            var _local_1:Rotate = new Rotate();
            changeAngle = _local_1;
            BindingManager.executeBindings(this, "changeAngle", changeAngle);
            return (_local_1);
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

        [Bindable(event="propertyChange")]
        public function get turnAll1():DelayButton
        {
            return (this._133638349turnAll1);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initAnniTablePanelData", null, null);
        }

        [Bindable(event="propertyChange")]
        public function get uiC0():Image
        {
            return (this._3588577uiC0);
        }

        [Bindable(event="propertyChange")]
        public function get angle():Number
        {
            return (this._92960979angle);
        }

        public function onAnniTurnTable(_arg_1:int):void
        {
            var _local_2:*;
            if (initialized)
            {
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
                for (_local_2 in ATAwardList)
                {
                    if (ToolKit.isEqual(ATAwardList[_local_2], _arg_1))
                    {
                        endZPRad = (_local_2 * 36);
                        awardItemId = _arg_1;
                        break;
                    };
                };
                timer.addEventListener(TimerEvent.TIMER, moveTurnTable);
                timer.start();
            };
        }

        private function playMonthWelfareTurnTable():void
        {
            if (run)
            {
                _core.sysMsg(Language.MONTH_WELFARE_PANEL[19]);
                return;
            };
            _core.remote.call("playAnniTurnTable", null, null);
        }

        public function set rules(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._108873975rules;
            if (_local_2 !== _arg_1)
            {
                this._108873975rules = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rules", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rules():LinkButton
        {
            return (this._108873975rules);
        }

        public function onGetAnniTurntablePanelData(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:int;
            var _local_4:*;
            var _local_5:Array;
            var _local_6:String;
            var _local_7:String;
            var _local_8:Number;
            var _local_9:*;
            if (!_arg_1)
            {
                return;
            };
            for (_local_2 in ATAwardList)
            {
                _local_3 = ATAwardList[_local_2];
                this[("zpitem" + _local_2)].type = GamePredef.TBL_ITEM_TEMPLATE;
                this[("zpitem" + _local_2)].giid = _local_3;
                this[("zpitem" + _local_2)].slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_3];
                this[("zpitem" + _local_2)].enabled = true;
            };
            if (_arg_1.f)
            {
                for (_local_4 in _arg_1.f)
                {
                    this[("zpitem" + _local_4)].enabled = false;
                };
            };
            if (_arg_1.hl)
            {
                _local_5 = _arg_1.hl;
                _local_6 = "";
                _local_7 = " <font color='#FFFFFF'>获得1个</font>";
                _local_8 = 0;
                myLotto.htmlText = "";
                for (_local_4 in _local_5)
                {
                    _local_9 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_5[_local_4].i];
                    if (_local_9)
                    {
                        _local_8 = _local_9.color;
                    };
                    if (_local_8 < 0)
                    {
                        _local_8 = 0;
                    };
                    _local_6 = ((((((_local_5[_local_4].c + _local_7) + "<font color='") + GamePredef.MSG_ITEM_COLOR[_local_8]) + "'>") + _local_9.name) + "</font><br/>");
                    myLotto.htmlText = (myLotto.htmlText + _local_6);
                };
            };
            if (_arg_1.i >= 0)
            {
                ticketsLabel.text = Language.ANNI_TURNTABLE_PANEL[2].toString().replace("{num}", _arg_1.i);
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

