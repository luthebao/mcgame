// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PMAuctionPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.LevelSlot;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.NumSlot;
    import com.qeedoo.ui.view.comp.Currency;
    import mx.controls.RadioButton;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.Slot;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.controls.Alert;
    import flash.utils.getDefinitionByName;
    import mx.events.NumericStepperEvent;
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

    public class PMAuctionPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3437300pet3:LevelSlot;
        public var _PMAuctionPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _100525953item4:NumSlot;
        private var _947882863goldCurrency:Currency;
        private var _109408723moneyRadioButton:RadioButton;
        private var _100525950item1:NumSlot;
        public var _PMAuctionPanel_BasicTxtButton10:BasicTxtButton;
        public var _PMAuctionPanel_BasicTxtButton11:BasicTxtButton;
        private var _2039330033moneyCurrency:Currency;
        public var _PMAuctionPanel_BasicTxtButton1:BasicTxtButton;
        public var _PMAuctionPanel_BasicTxtButton2:BasicTxtButton;
        public var _PMAuctionPanel_BasicTxtButton3:BasicTxtButton;
        public var _PMAuctionPanel_BasicTxtButton4:BasicTxtButton;
        public var _PMAuctionPanel_BasicTxtButton5:BasicTxtButton;
        public var _PMAuctionPanel_BasicTxtButton7:BasicTxtButton;
        public var _PMAuctionPanel_BasicTxtButton8:BasicTxtButton;
        public var _PMAuctionPanel_BasicTxtButton9:BasicTxtButton;
        private var _3437298pet1:LevelSlot;
        public var _PMAuctionPanel_BasicTxtButton6:BasicTxtButton;
        private var _100525952item3:NumSlot;
        private var _3437301pet4:LevelSlot;
        private var _905190219moneyMaxCurrency:Currency;
        private var _maxNum:Number = 10;
        private var _289027152auctionTime:NumericStepper;
        private var _100525954item5:NumSlot;
        private var _1242201835goldMaxCurrency:Currency;
        public var _PMAuctionPanel_BasicGlowButton1:BasicGlowButton;
        public var _PMAuctionPanel_BasicGlowButton2:BasicGlowButton;
        private var _100525951item2:NumSlot;
        private var _286697229costMoney:Currency;
        private var _3437299pet2:LevelSlot;
        private var _446420339goldRadioButton:RadioButton;
        private var _3437297pet0:LevelSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":400,
                    "height":333,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PMAuctionPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":371,
                                "height":280,
                                "styleName":"CanvasBorder",
                                "x":14.5,
                                "y":39,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"moneyRadioButton",
                                    "events":{"click":"__moneyRadioButton_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "groupName":"selectRadioButton",
                                            "y":13,
                                            "selected":true,
                                            "width":68,
                                            "label":"　　　",
                                            "x":65
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"moneyCurrency",
                                    "stylesFactory":function ():void
                                    {
                                        this.disabledOverlayAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "minValue":1,
                                            "value":1,
                                            "inputEnabled":true,
                                            "y":35,
                                            "width":83,
                                            "x":66,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"moneyMaxCurrency",
                                    "stylesFactory":function ():void
                                    {
                                        this.disabledOverlayAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "inputEnabled":true,
                                            "y":57,
                                            "height":20,
                                            "width":83,
                                            "x":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"goldRadioButton",
                                    "events":{"click":"__goldRadioButton_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "groupName":"selectRadioButton",
                                            "y":90,
                                            "width":68,
                                            "label":"　　　",
                                            "x":65
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"goldCurrency",
                                    "stylesFactory":function ():void
                                    {
                                        this.disabledOverlayAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":112,
                                            "minValue":1,
                                            "value":0,
                                            "inputEnabled":true,
                                            "enabled":false,
                                            "height":20,
                                            "width":83,
                                            "x":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"goldMaxCurrency",
                                    "stylesFactory":function ():void
                                    {
                                        this.disabledOverlayAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":133,
                                            "inputEnabled":true,
                                            "enabled":false,
                                            "height":20,
                                            "width":83,
                                            "x":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"auctionTime",
                                    "events":{"change":"__auctionTime_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":68,
                                            "y":175,
                                            "stepSize":1,
                                            "value":24,
                                            "maximum":48,
                                            "width":40,
                                            "height":21
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"costMoney",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":200,
                                            "height":20,
                                            "width":76,
                                            "x":68
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PMAuctionPanel_BasicGlowButton1",
                                    "events":{"click":"___PMAuctionPanel_BasicGlowButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "21";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdOrg",
                                            "width":61.7,
                                            "x":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PMAuctionPanel_BasicGlowButton2",
                                    "events":{"click":"___PMAuctionPanel_BasicGlowButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "21";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":86.3,
                                            "styleName":"BtnStdGreen",
                                            "width":61.7
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "1";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":278,
                                            "width":214,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"item1",
                                                "events":{"doubleClick":"__item1_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4,
                                                        "doubleClickEnabled":true,
                                                        "y":33,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"item2",
                                                "events":{"doubleClick":"__item2_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4,
                                                        "doubleClickEnabled":true,
                                                        "y":80,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"item3",
                                                "events":{"doubleClick":"__item3_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4,
                                                        "doubleClickEnabled":true,
                                                        "y":127,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"item4",
                                                "events":{"doubleClick":"__item4_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4,
                                                        "doubleClickEnabled":true,
                                                        "y":173,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"item5",
                                                "events":{"doubleClick":"__item5_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4,
                                                        "doubleClickEnabled":true,
                                                        "y":220,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"pet0",
                                                "events":{"doubleClick":"__pet0_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "doubleClickEnabled":true,
                                                        "x":110,
                                                        "y":33,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"pet1",
                                                "events":{"doubleClick":"__pet1_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "doubleClickEnabled":true,
                                                        "x":110,
                                                        "y":80,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"pet2",
                                                "events":{"doubleClick":"__pet2_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "doubleClickEnabled":true,
                                                        "x":110,
                                                        "y":127,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"pet3",
                                                "events":{"doubleClick":"__pet3_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "doubleClickEnabled":true,
                                                        "x":110,
                                                        "y":173,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"pet4",
                                                "events":{"doubleClick":"__pet4_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "doubleClickEnabled":true,
                                                        "x":110,
                                                        "y":220,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PMAuctionPanel_BasicTxtButton1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":22,
                                                        "y":10,
                                                        "height":18,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PMAuctionPanel_BasicTxtButton2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":128,
                                                        "y":10,
                                                        "height":18,
                                                        "width":50
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PMAuctionPanel_BasicTxtButton3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":83,
                                            "y":13,
                                            "height":18,
                                            "width":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PMAuctionPanel_BasicTxtButton4",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.paddingTop = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":37,
                                            "height":18,
                                            "width":53
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PMAuctionPanel_BasicTxtButton5",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.paddingTop = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":60,
                                            "height":18,
                                            "width":53
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PMAuctionPanel_BasicTxtButton6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":83,
                                            "y":90,
                                            "height":18,
                                            "width":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PMAuctionPanel_BasicTxtButton7",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.paddingTop = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":112,
                                            "height":18,
                                            "width":53
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PMAuctionPanel_BasicTxtButton8",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.paddingTop = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":134,
                                            "height":18,
                                            "width":53
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PMAuctionPanel_BasicTxtButton9",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                        this.paddingTop = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":176,
                                            "height":18,
                                            "width":54
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PMAuctionPanel_BasicTxtButton10",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                        this.paddingTop = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":200,
                                            "height":18,
                                            "width":54
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PMAuctionPanel_BasicTxtButton11",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                        this.paddingTop = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":113,
                                            "y":176,
                                            "height":18,
                                            "width":30
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

        public function PMAuctionPanel()
        {
            mx_internal::_document = this;
            this.width = 400;
            this.height = 333;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___PMAuctionPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PMAuctionPanel._watcherSetupUtil = _arg_1;
        }


        public function set item3(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._100525952item3;
            if (_local_2 !== _arg_1)
            {
                this._100525952item3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item3", _local_2, _arg_1));
            };
        }

        public function set item4(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._100525953item4;
            if (_local_2 !== _arg_1)
            {
                this._100525953item4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item4", _local_2, _arg_1));
            };
        }

        public function set item5(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._100525954item5;
            if (_local_2 !== _arg_1)
            {
                this._100525954item5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item5", _local_2, _arg_1));
            };
        }

        public function set pet2(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._3437299pet2;
            if (_local_2 !== _arg_1)
            {
                this._3437299pet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet2", _local_2, _arg_1));
            };
        }

        public function set item1(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._100525950item1;
            if (_local_2 !== _arg_1)
            {
                this._100525950item1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item1", _local_2, _arg_1));
            };
        }

        private function _PMAuctionPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PMAuctionPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                moneyCurrency.type = _arg_1;
            }, "moneyCurrency.type");
            result[1] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                moneyMaxCurrency.type = _arg_1;
            }, "moneyMaxCurrency.type");
            result[2] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                goldCurrency.type = _arg_1;
            }, "goldCurrency.type");
            result[3] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                goldMaxCurrency.type = _arg_1;
            }, "goldMaxCurrency.type");
            result[4] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEYALL);
            }, function (_arg_1:uint):void
            {
                costMoney.type = _arg_1;
            }, "costMoney.type");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicGlowButton1.label = _arg_1;
            }, "_PMAuctionPanel_BasicGlowButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicGlowButton2.label = _arg_1;
            }, "_PMAuctionPanel_BasicGlowButton2.label");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_ITEM);
            }, function (_arg_1:int):void
            {
                item1.slotType = _arg_1;
            }, "item1.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_ITEM);
            }, function (_arg_1:int):void
            {
                item2.slotType = _arg_1;
            }, "item2.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_ITEM);
            }, function (_arg_1:int):void
            {
                item3.slotType = _arg_1;
            }, "item3.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_ITEM);
            }, function (_arg_1:int):void
            {
                item4.slotType = _arg_1;
            }, "item4.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_ITEM);
            }, function (_arg_1:int):void
            {
                item5.slotType = _arg_1;
            }, "item5.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_PET);
            }, function (_arg_1:int):void
            {
                pet0.slotType = _arg_1;
            }, "pet0.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_PET);
            }, function (_arg_1:int):void
            {
                pet1.slotType = _arg_1;
            }, "pet1.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_PET);
            }, function (_arg_1:int):void
            {
                pet2.slotType = _arg_1;
            }, "pet2.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_PET);
            }, function (_arg_1:int):void
            {
                pet3.slotType = _arg_1;
            }, "pet3.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_AUCTION_PET);
            }, function (_arg_1:int):void
            {
                pet4.slotType = _arg_1;
            }, "pet4.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_AUCTION_P[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton1.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton1.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PM_AUCTION_P[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton2.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton2.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton3.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton3.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton4.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton4.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton5.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton5.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton6.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton6.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton7.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton7.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton8.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton8.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton9.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton9.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton10.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton10.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PMAuctionPanel_BasicTxtButton11.label = _arg_1;
            }, "_PMAuctionPanel_BasicTxtButton11.label");
            result[28] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get goldMaxCurrency():Currency
        {
            return (this._1242201835goldMaxCurrency);
        }

        public function __item1_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        private function init():void
        {
            auctionTime.minimum = GamePredef.AUCTION_TIME[0];
            auctionTime.maximum = GamePredef.AUCTION_TIME[1];
            moneyCurrency.addEventListener(Event.CHANGE, setCostMoney);
            moneyMaxCurrency.addEventListener(Event.CHANGE, setCostMoney);
            goldCurrency.addEventListener(Event.CHANGE, setCostMoney);
            goldMaxCurrency.addEventListener(Event.CHANGE, setCostMoney);
        }

        public function __item3_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        public function set pet1(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._3437298pet1;
            if (_local_2 !== _arg_1)
            {
                this._3437298pet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet1", _local_2, _arg_1));
            };
        }

        public function __item5_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        public function set goldCurrency(_arg_1:Currency):void
        {
            var _local_2:Object = this._947882863goldCurrency;
            if (_local_2 !== _arg_1)
            {
                this._947882863goldCurrency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldCurrency", _local_2, _arg_1));
            };
        }

        public function set goldMaxCurrency(_arg_1:Currency):void
        {
            var _local_2:Object = this._1242201835goldMaxCurrency;
            if (_local_2 !== _arg_1)
            {
                this._1242201835goldMaxCurrency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldMaxCurrency", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moneyRadioButton():RadioButton
        {
            return (this._109408723moneyRadioButton);
        }

        [Bindable(event="propertyChange")]
        public function get pet4():LevelSlot
        {
            return (this._3437301pet4);
        }

        public function set goldRadioButton(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._446420339goldRadioButton;
            if (_local_2 !== _arg_1)
            {
                this._446420339goldRadioButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldRadioButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet2():LevelSlot
        {
            return (this._3437299pet2);
        }

        private function removePetByIndex(_arg_1:uint):void
        {
            var _local_2:uint;
            var _local_3:Object;
            if (((_arg_1 >= 0) && (_arg_1 < 5)))
            {
                _local_2 = this[("pet" + _arg_1)].giid;
                _local_3 = _core.player.petList[_local_2];
                if (_local_3)
                {
                    _local_3.inAuction = false;
                };
                this[("pet" + _arg_1)].clean();
                refreshAuctionView();
            };
        }

        public function __pet1_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(1);
        }

        public function __pet3_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(3);
        }

        public function ___PMAuctionPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function addItem(_arg_1:Object):void
        {
            var _local_2:int = 1;
            while (_local_2 <= 5)
            {
                if (this[("item" + _local_2)].slotData)
                {
                    if (this[("item" + _local_2)].slotData == _arg_1)
                    {
                        refreshAuctionView();
                        return;
                    };
                };
                _local_2++;
            };
            var _local_3:int = 1;
            while (_local_3 <= 5)
            {
                if (this[("item" + _local_3)].slotData == null)
                {
                    this[("item" + _local_3)].type = _arg_1.type;
                    this[("item" + _local_3)].giid = _arg_1.itemId;
                    this[("item" + _local_3)].stackNum = _arg_1.stackNum;
                    this[("item" + _local_3)].slotData = _arg_1;
                    _core.view.getSlot(_arg_1.sid).reset();
                    refreshAuctionView();
                    return;
                };
                _local_3++;
            };
        }

        private function selectType():void
        {
            if (moneyRadioButton.selected)
            {
                moneyCurrency.enabled = true;
                moneyMaxCurrency.enabled = true;
                goldCurrency.enabled = false;
                goldMaxCurrency.enabled = false;
                moneyCurrency.value = 1;
                moneyMaxCurrency.value = 0;
                goldCurrency.value = 0;
                goldMaxCurrency.value = 0;
            }
            else
            {
                if (goldRadioButton.selected)
                {
                    moneyCurrency.enabled = false;
                    moneyMaxCurrency.enabled = false;
                    goldCurrency.enabled = true;
                    goldMaxCurrency.enabled = true;
                    moneyCurrency.value = 0;
                    moneyMaxCurrency.value = 0;
                    goldCurrency.value = 1;
                    goldMaxCurrency.value = 0;
                };
            };
        }

        private function removeAndRefreshPet(_arg_1:uint):void
        {
            removePetByIndex(_arg_1);
            _core.view.getUI(ViewManager.PANEL_BAG).petInit();
        }

        public function set moneyRadioButton(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._109408723moneyRadioButton;
            if (_local_2 !== _arg_1)
            {
                this._109408723moneyRadioButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyRadioButton", _local_2, _arg_1));
            };
        }

        private function addAuction():void
        {
            var _local_4:*;
            var _local_1:Number = 0;
            var _local_2:Object = {};
            var _local_3:Number = 0;
            while (_local_3 <= 4)
            {
                if ((((this[("item" + ToolKit.add(_local_3, 1))].type == -1) || (this[("item" + ToolKit.add(_local_3, 1))].giid == -1)) || (!(this[("item" + ToolKit.add(_local_3, 1))].slotData))))
                {
                    _local_1++;
                }
                else
                {
                    if (this[("item" + ToolKit.add(_local_3, 1))].giid > 0)
                    {
                        _local_2[_local_3] = new Object();
                        _local_2[_local_3].type = this[("item" + ToolKit.add(_local_3, 1))].type;
                        _local_2[_local_3].slotId = this[("item" + ToolKit.add(_local_3, 1))].slotData.id;
                        _local_2[_local_3].itemId = this[("item" + ToolKit.add(_local_3, 1))].giid;
                        _local_2[_local_3].petId = -1;
                        _local_2[_local_3].stackNum = this[("item" + ToolKit.add(_local_3, 1))].stackNum;
                    };
                };
                if (((this[("pet" + _local_3)].type == -1) || (this[("pet" + _local_3)].giid == -1)))
                {
                    _local_1++;
                }
                else
                {
                    if (this[("pet" + _local_3)].giid > 0)
                    {
                        _local_2[ToolKit.add(_local_3, 10)] = new Object();
                        _local_2[ToolKit.add(_local_3, 10)].type = this[("pet" + _local_3)].type;
                        _local_2[ToolKit.add(_local_3, 10)].slotId = -1;
                        _local_2[ToolKit.add(_local_3, 10)].petId = this[("pet" + _local_3)].giid;
                        _local_2[ToolKit.add(_local_3, 10)].stackNum = 1;
                        _local_2[ToolKit.add(_local_3, 10)].itemId = this[("pet" + _local_3)].giid;
                    };
                };
                _local_3++;
            };
            if (((_local_1) && (ToolKit.isBigOrEqual(_local_1, _maxNum))))
            {
                Alert.show(Language.AUCTIONPANEL_S[3], "", Alert.OK);
                return;
            };
            if ((((moneyRadioButton.selected) && (goldRadioButton.selected)) || ((!(moneyRadioButton.selected)) && (!(goldRadioButton.selected)))))
            {
                Alert.show((((Language.AUCTIONPANEL_S[4] + GamePredef.CURRENCY_TIP[0]) + Language.AUCTIONPANEL_S[5]) + GamePredef.CURRENCY_TIP[1]), "", Alert.OK);
                return;
            };
            if (((((((moneyCurrency.value == 0) && (moneyMaxCurrency.value == 0)) && (goldCurrency.value == 0)) && (goldMaxCurrency.value == 0)) || ((((moneyCurrency.value < 0) || (moneyMaxCurrency.value < 0)) || (goldCurrency.value < 0)) || (goldMaxCurrency.value < 0))) || (((!(moneyCurrency.value == 0)) || (!(moneyMaxCurrency.value == 0))) && ((!(goldCurrency.value == 0)) || (!(goldMaxCurrency.value == 0))))))
            {
                Alert.show(Language.AUCTIONPANEL_S[6], "", Alert.OK);
                return;
            };
            if ((((moneyCurrency.value > moneyMaxCurrency.value) && (!(moneyMaxCurrency.value == 0))) || ((goldCurrency.value > goldMaxCurrency.value) && (!(goldMaxCurrency.value == 0)))))
            {
                Alert.show(Language.AUCTIONPANEL_S[37], "", Alert.OK);
                return;
            };
            if (((auctionTime.value < GamePredef.AUCTION_TIME[0]) || (auctionTime.value > GamePredef.AUCTION_TIME[1])))
            {
                Alert.show(Language.AUCTIONPANEL_S[7], "", Alert.OK);
                return;
            };
            if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultMoney, 1))
            {
                if (costMoney.value > _core.player.moneyBind)
                {
                    Alert.show(((Language.AUCTIONPANEL_S[8] + GamePredef.CURRENCY_TIP[2]) + "!"), "", Alert.OK);
                    return;
                };
            };
            if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultMoney, 2))
            {
                if (costMoney.value > _core.player.money)
                {
                    Alert.show(((Language.AUCTIONPANEL_S[9] + GamePredef.CURRENCY_TIP[0]) + "!"), "", Alert.OK);
                    return;
                };
            };
            for (_local_4 in _local_2)
            {
                if (_local_2[_local_4])
                {
                    if (moneyRadioButton.selected)
                    {
                        _local_2[_local_4].auctionType = 1;
                    }
                    else
                    {
                        if (goldRadioButton.selected)
                        {
                            _local_2[_local_4].auctionType = 2;
                        };
                    };
                    _local_2[_local_4].nowMoney = moneyCurrency.value;
                    _local_2[_local_4].maxMoney = moneyMaxCurrency.value;
                    _local_2[_local_4].nowGold = goldCurrency.value;
                    _local_2[_local_4].maxGold = goldMaxCurrency.value;
                    _local_2[_local_4].duration = auctionTime.value;
                };
            };
            _core.remote.addAuctionMoreByPM(_local_2);
            clearAuctionView();
        }

        public function set moneyMaxCurrency(_arg_1:Currency):void
        {
            var _local_2:Object = this._905190219moneyMaxCurrency;
            if (_local_2 !== _arg_1)
            {
                this._905190219moneyMaxCurrency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyMaxCurrency", _local_2, _arg_1));
            };
        }

        private function _PMAuctionPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.AUCTIONPANEL_U[16];
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Currency.TYPE_MONEYALL;
            _local_1 = Language.AUCTIONPANEL_U[3];
            _local_1 = Language.AUCTIONPANEL_U[4];
            _local_1 = Slot.SLOT_AUCTION_ITEM;
            _local_1 = Slot.SLOT_AUCTION_ITEM;
            _local_1 = Slot.SLOT_AUCTION_ITEM;
            _local_1 = Slot.SLOT_AUCTION_ITEM;
            _local_1 = Slot.SLOT_AUCTION_ITEM;
            _local_1 = Slot.SLOT_AUCTION_PET;
            _local_1 = Slot.SLOT_AUCTION_PET;
            _local_1 = Slot.SLOT_AUCTION_PET;
            _local_1 = Slot.SLOT_AUCTION_PET;
            _local_1 = Slot.SLOT_AUCTION_PET;
            _local_1 = Language.PM_AUCTION_P[1];
            _local_1 = Language.PM_AUCTION_P[2];
            _local_1 = Language.AUCTIONPANEL_U[7];
            _local_1 = Language.AUCTIONPANEL_U[8];
            _local_1 = Language.AUCTIONPANEL_U[1];
            _local_1 = Language.AUCTIONPANEL_U[9];
            _local_1 = Language.AUCTIONPANEL_U[8];
            _local_1 = Language.AUCTIONPANEL_U[1];
            _local_1 = Language.AUCTIONPANEL_U[10];
            _local_1 = Language.AUCTIONPANEL_U[11];
            _local_1 = Language.AUCTIONPANEL_U[15];
        }

        public function __goldRadioButton_click(_arg_1:MouseEvent):void
        {
            selectType();
        }

        [Bindable(event="propertyChange")]
        public function get item2():NumSlot
        {
            return (this._100525951item2);
        }

        [Bindable(event="propertyChange")]
        public function get item3():NumSlot
        {
            return (this._100525952item3);
        }

        [Bindable(event="propertyChange")]
        public function get item4():NumSlot
        {
            return (this._100525953item4);
        }

        public function set auctionTime(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._289027152auctionTime;
            if (_local_2 !== _arg_1)
            {
                this._289027152auctionTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "auctionTime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item5():NumSlot
        {
            return (this._100525954item5);
        }

        [Bindable(event="propertyChange")]
        public function get goldRadioButton():RadioButton
        {
            return (this._446420339goldRadioButton);
        }

        override public function initialize():void
        {
            var target:PMAuctionPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PMAuctionPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PMAuctionPanelWatcherSetupUtil");
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
        public function get goldCurrency():Currency
        {
            return (this._947882863goldCurrency);
        }

        public function __item2_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        public function __item4_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get item1():NumSlot
        {
            return (this._100525950item1);
        }

        private function refreshAuctionView():void
        {
            var _local_1:Number = 0;
            var _local_2:Number = 0;
            while (_local_2 <= 4)
            {
                if (this[("item" + ToolKit.add(_local_2, 1))].giid > 0)
                {
                    _local_1++;
                };
                if (this[("pet" + _local_2)].giid > 0)
                {
                    _local_1++;
                };
                _local_2++;
            };
            if (((!(_local_1)) || (ToolKit.isSmallOrEqual(_local_1, 0))))
            {
                clearAuctionView();
                return;
            };
            setCostMoney();
        }

        public function ___PMAuctionPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            addAuction();
        }

        private function setCostMoney(_arg_1:Event=null):void
        {
            var _local_2:Number = 0;
            var _local_3:Number = 0;
            while (_local_3 <= 4)
            {
                if (this[("item" + ToolKit.add(_local_3, 1))].giid > 0)
                {
                    _local_2++;
                };
                if (this[("pet" + _local_3)].giid > 0)
                {
                    _local_2++;
                };
                _local_3++;
            };
            if (((!(_local_2)) || (ToolKit.isSmallOrEqual(_local_2, 0))))
            {
                return;
            };
            costMoney.value = (_local_2 * Math.round(((((((moneyCurrency.value + moneyMaxCurrency.value) / 2) * GamePredef.AUCTION_COSTPERCENT[0]) / 100) + ((((goldCurrency.value + goldMaxCurrency.value) / 2) * GamePredef.AUCTION_COSTPERCENT[1]) / 100)) + (auctionTime.value * GamePredef.AUCTION_TIMENUM))));
        }

        [Bindable(event="propertyChange")]
        public function get moneyMaxCurrency():Currency
        {
            return (this._905190219moneyMaxCurrency);
        }

        [Bindable(event="propertyChange")]
        public function get auctionTime():NumericStepper
        {
            return (this._289027152auctionTime);
        }

        public function __pet2_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(2);
        }

        private function removeItem(_arg_1:Event):void
        {
            if (_arg_1.currentTarget.slotData)
            {
                _core.view.getSlot(_arg_1.currentTarget.slotData.sid).restore();
                _arg_1.currentTarget.clean();
                refreshAuctionView();
            };
        }

        public function __pet4_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(4);
        }

        public function __moneyRadioButton_click(_arg_1:MouseEvent):void
        {
            selectType();
        }

        public function __pet0_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(0);
        }

        public function initPmAucPanel():void
        {
            this.visible = true;
        }

        public function set costMoney(_arg_1:Currency):void
        {
            var _local_2:Object = this._286697229costMoney;
            if (_local_2 !== _arg_1)
            {
                this._286697229costMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "costMoney", _local_2, _arg_1));
            };
        }

        public function set pet3(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._3437300pet3;
            if (_local_2 !== _arg_1)
            {
                this._3437300pet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet3", _local_2, _arg_1));
            };
        }

        public function set moneyCurrency(_arg_1:Currency):void
        {
            var _local_2:Object = this._2039330033moneyCurrency;
            if (_local_2 !== _arg_1)
            {
                this._2039330033moneyCurrency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyCurrency", _local_2, _arg_1));
            };
        }

        public function set pet4(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._3437301pet4;
            if (_local_2 !== _arg_1)
            {
                this._3437301pet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet4", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:*;
            super.visible = _arg_1;
            if (_arg_1 == false)
            {
                clearAuctionView();
                _local_2 = _core.view.getUI(ViewManager.PANEL_AUCTION);
                if (((_local_2) && (_local_2.visible)))
                {
                    return;
                };
                _core.remote.closeAuction();
            };
        }

        public function ___PMAuctionPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            clearAuctionView();
        }

        [Bindable(event="propertyChange")]
        public function get moneyCurrency():Currency
        {
            return (this._2039330033moneyCurrency);
        }

        [Bindable(event="propertyChange")]
        public function get pet1():LevelSlot
        {
            return (this._3437298pet1);
        }

        [Bindable(event="propertyChange")]
        public function get costMoney():Currency
        {
            return (this._286697229costMoney);
        }

        [Bindable(event="propertyChange")]
        public function get pet3():LevelSlot
        {
            return (this._3437300pet3);
        }

        public function addPet(_arg_1:Number, _arg_2:int=-1):void
        {
            var _local_5:Object;
            var _local_3:Object = _core.player.petList[_arg_1];
            if (!_local_3)
            {
                return;
            };
            if (!ToolKit.isEqual(_local_3.binded, 0))
            {
                return;
            };
            if (_arg_2 != -1)
            {
                if (this[("pet" + _arg_2)].giid != -1)
                {
                    _local_5 = _core.player.petList[this[("pet" + _arg_2)].giid];
                    if (_local_5)
                    {
                        _local_5.inAuction = false;
                    };
                };
                this[("pet" + _arg_2)].clean();
                _local_3.inAuction = true;
                this[("pet" + _arg_2)].type = GamePredef.TBL_PET;
                this[("pet" + _arg_2)].giid = _arg_1;
                refreshAuctionView();
                return;
            };
            var _local_4:uint;
            while (_local_4 < 5)
            {
                if (this[("pet" + _local_4)].isEmpty())
                {
                    _local_3.inAuction = true;
                    this[("pet" + _local_4)].type = GamePredef.TBL_PET;
                    this[("pet" + _local_4)].giid = _arg_1;
                    refreshAuctionView();
                    return;
                };
                _local_4++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet0():LevelSlot
        {
            return (this._3437297pet0);
        }

        public function set pet0(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._3437297pet0;
            if (_local_2 !== _arg_1)
            {
                this._3437297pet0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet0", _local_2, _arg_1));
            };
        }

        private function clearAuctionView():void
        {
            var _local_1:Number = 0;
            while (_local_1 <= 4)
            {
                if (!(((this[("item" + ToolKit.add(_local_1, 1))].type == -1) || (this[("item" + ToolKit.add(_local_1, 1))].giid == -1)) || (!(this[("item" + ToolKit.add(_local_1, 1))].slotData))))
                {
                    if (this[("item" + ToolKit.add(_local_1, 1))].slotData)
                    {
                        _core.view.getSlot(this[("item" + ToolKit.add(_local_1, 1))].slotData.sid).restore();
                    };
                    this[("item" + ToolKit.add(_local_1, 1))].clean();
                };
                if (!((this[("pet" + _local_1)].type == -1) || (this[("pet" + _local_1)].giid == -1)))
                {
                    if (this[("pet" + _local_1)].giid > 0)
                    {
                        removeAndRefreshPet(_local_1);
                    };
                };
                _local_1++;
            };
            moneyRadioButton.selected = true;
            moneyCurrency.enabled = true;
            moneyMaxCurrency.enabled = true;
            goldCurrency.enabled = false;
            goldMaxCurrency.enabled = false;
            moneyCurrency.value = 1;
            moneyMaxCurrency.value = 0;
            goldCurrency.value = 0;
            goldMaxCurrency.value = 0;
            costMoney.value = 0;
        }

        public function set item2(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._100525951item2;
            if (_local_2 !== _arg_1)
            {
                this._100525951item2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item2", _local_2, _arg_1));
            };
        }

        public function __auctionTime_change(_arg_1:NumericStepperEvent):void
        {
            setCostMoney();
        }


    }
}//package com.qeedoo.ui.view.compDragable

