// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TradePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.LevelSlot;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.NumSlot;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.Currency;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import flash.events.Event;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class TradePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3437300pet3:LevelSlot;
        public var _TradePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _100525953item4:NumSlot;
        private var _607770528labelSelf:RoundedLabel;
        private var _2104895376targetItem4:NumSlot;
        private var _236983790confirmButton:BasicGlowButton;
        private var _1492307572myMoney:Currency;
        private var _486484002targetPet0:LevelSlot;
        private var _2104895379targetItem1:NumSlot;
        private var _100525950item1:NumSlot;
        private var _486484006targetPet4:LevelSlot;
        private var _73192869labelTarget:RoundedLabel;
        private var _486484005targetPet3:LevelSlot;
        private var _3437298pet1:LevelSlot;
        private var _2101341777targetMoney:Currency;
        private var _2104895377targetItem3:NumSlot;
        private var _100525952item3:NumSlot;
        private var _406719549lockButton:BasicGlowButton;
        private var _3437301pet4:LevelSlot;
        public var _TradePanel_BasicGlowButton3:BasicGlowButton;
        private var targetId:Number;
        private var state:String = "normal";
        private var _486484004targetPet2:LevelSlot;
        private var _100525954item5:NumSlot;
        private var _2104895375targetItem5:NumSlot;
        private var _98750030targetStateInfo:RoundedLabel;
        private var _1321841395selfStateInfo:RoundedLabel;
        private var _1060418516myGold:Currency;
        private var targetName:String;
        private var _2104895378targetItem2:NumSlot;
        private var _100525951item2:NumSlot;
        private var _486484003targetPet1:LevelSlot;
        public var _TradePanel_BasicTxtButton1:BasicTxtButton;
        public var _TradePanel_BasicTxtButton2:BasicTxtButton;
        public var _TradePanel_BasicTxtButton3:BasicTxtButton;
        public var _TradePanel_BasicTxtButton4:BasicTxtButton;
        private var _3437299pet2:LevelSlot;
        private var _3437297pet0:LevelSlot;
        private var _486225297targetGold:Currency;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":471,
                    "height":449,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_TradePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.left = "15";
                            this.right = "15";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"confirmButton",
                                    "events":{"click":"__confirmButton_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.bottom = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdGreen",
                                            "width":48
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"lockButton",
                                    "events":{"click":"__lockButton_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "5";
                                        this.horizontalCenter = "-58";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":48
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_TradePanel_BasicGlowButton3",
                                    "events":{"click":"___TradePanel_BasicGlowButton3_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "58";
                                        this.bottom = "4";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":48
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "1";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":214,
                                            "height":360,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"labelTarget",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFF0000;
                                                    this.fontSize = 14;
                                                    this.horizontalCenter = "0";
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":5,
                                                        "width":92
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"targetStateInfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":29,
                                                        "width":128
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_TradePanel_BasicTxtButton1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                    this.paddingTop = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":44,
                                                        "y":65,
                                                        "width":32,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_TradePanel_BasicTxtButton2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                    this.paddingTop = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":150,
                                                        "y":65,
                                                        "width":32,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"targetMoney",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":323,
                                                        "x":10,
                                                        "width":90
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"targetGold",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":323,
                                                        "x":116,
                                                        "width":90
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"targetItem1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "index":2006,
                                                        "x":4,
                                                        "y":85,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"targetItem2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "index":2007,
                                                        "x":4,
                                                        "y":132,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"targetItem3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "index":2008,
                                                        "x":4,
                                                        "y":178,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"targetItem4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "index":2009,
                                                        "x":4,
                                                        "y":225,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"targetItem5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "index":2010,
                                                        "x":4,
                                                        "y":271,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"targetPet0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":110,
                                                        "y":85,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"targetPet1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":110,
                                                        "y":132,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"targetPet2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":110,
                                                        "y":178,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"targetPet3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":110,
                                                        "y":225,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LevelSlot,
                                                "id":"targetPet4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":110,
                                                        "y":271,
                                                        "styleName":"CanvasShopSlot"
                                                    });
                                                }
                                            })]
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
                                            "height":360,
                                            "width":214,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"labelSelf",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 14;
                                                    this.horizontalCenter = "0";
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":5,
                                                        "width":90
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"selfStateInfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":29,
                                                        "width":128
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_TradePanel_BasicTxtButton3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                    this.paddingTop = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":44,
                                                        "y":65,
                                                        "width":32,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_TradePanel_BasicTxtButton4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                    this.paddingTop = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":150,
                                                        "y":65,
                                                        "width":32,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"myMoney",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":323,
                                                        "inputEnabled":true,
                                                        "x":6,
                                                        "width":90
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Currency,
                                                "id":"myGold",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inputEnabled":true,
                                                        "x":112,
                                                        "width":90,
                                                        "y":323
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumSlot,
                                                "id":"item1",
                                                "events":{"doubleClick":"__item1_doubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4,
                                                        "index":2001,
                                                        "doubleClickEnabled":true,
                                                        "y":85,
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
                                                        "index":2002,
                                                        "doubleClickEnabled":true,
                                                        "y":132,
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
                                                        "index":2003,
                                                        "doubleClickEnabled":true,
                                                        "y":178,
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
                                                        "index":2004,
                                                        "doubleClickEnabled":true,
                                                        "y":225,
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
                                                        "index":2005,
                                                        "doubleClickEnabled":true,
                                                        "y":271,
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
                                                        "y":85,
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
                                                        "y":132,
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
                                                        "y":178,
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
                                                        "y":225,
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
                                                        "y":271,
                                                        "styleName":"CanvasShopSlot"
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TradePanel()
        {
            mx_internal::_document = this;
            this.width = 471;
            this.height = 449;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TradePanel._watcherSetupUtil = _arg_1;
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

        public function set item2(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._100525951item2;
            if (_local_2 !== _arg_1)
            {
                this._100525951item2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item2", _local_2, _arg_1));
            };
        }

        public function set targetItem1(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._2104895379targetItem1;
            if (_local_2 !== _arg_1)
            {
                this._2104895379targetItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetItem1", _local_2, _arg_1));
            };
        }

        public function set selfStateInfo(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1321841395selfStateInfo;
            if (_local_2 !== _arg_1)
            {
                this._1321841395selfStateInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selfStateInfo", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        public function get pet4():LevelSlot
        {
            return (this._3437301pet4);
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

        [Bindable(event="propertyChange")]
        public function get confirmButton():BasicGlowButton
        {
            return (this._236983790confirmButton);
        }

        [Bindable(event="propertyChange")]
        public function get selfStateInfo():RoundedLabel
        {
            return (this._1321841395selfStateInfo);
        }

        public function __item1_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        private function _TradePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TRADEPANEL_U[0];
            _local_1 = Language.TRADEPANEL_U[0];
            _local_1 = Language.TRADEPANEL_S[10];
            _local_1 = Language.TRADEPANEL_U[1];
            _local_1 = Language.TRADEPANEL_U[2];
            _local_1 = Language.TRADEPANEL_S[11];
            _local_1 = Language.TRADEPANEL_S[12];
            _local_1 = Language.TRADEPANEL_U[3];
            _local_1 = Language.TRADEPANEL_U[4];
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Language.TRADEPANEL_S[13];
            _local_1 = Language.TRADEPANEL_S[14];
            _local_1 = Language.TRADEPANEL_U[3];
            _local_1 = Language.TRADEPANEL_U[4];
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Slot.SLOT_TRADE_ITEM;
            _local_1 = Slot.SLOT_TRADE_ITEM;
            _local_1 = Slot.SLOT_TRADE_ITEM;
            _local_1 = Slot.SLOT_TRADE_ITEM;
            _local_1 = Slot.SLOT_TRADE_ITEM;
            _local_1 = Slot.SLOT_TRADE_PET;
            _local_1 = Slot.SLOT_TRADE_PET;
            _local_1 = Slot.SLOT_TRADE_PET;
            _local_1 = Slot.SLOT_TRADE_PET;
            _local_1 = Slot.SLOT_TRADE_PET;
        }

        public function __item5_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        public function set targetItem5(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._2104895375targetItem5;
            if (_local_2 !== _arg_1)
            {
                this._2104895375targetItem5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetItem5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet3():LevelSlot
        {
            return (this._3437300pet3);
        }

        public function set confirmButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._236983790confirmButton;
            if (_local_2 !== _arg_1)
            {
                this._236983790confirmButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get targetPet3():LevelSlot
        {
            return (this._486484005targetPet3);
        }

        [Bindable(event="propertyChange")]
        public function get targetPet2():LevelSlot
        {
            return (this._486484004targetPet2);
        }

        [Bindable(event="propertyChange")]
        public function get targetPet4():LevelSlot
        {
            return (this._486484006targetPet4);
        }

        public function startTrade():void
        {
            show();
            labelTarget.text = targetName;
            labelSelf.text = _core.player.name;
            myMoney.maxValue = _core.player.money;
            myGold.maxValue = _core.player.gold;
        }

        public function set targetItem3(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._2104895377targetItem3;
            if (_local_2 !== _arg_1)
            {
                this._2104895377targetItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetItem3", _local_2, _arg_1));
            };
        }

        public function __item3_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        public function __confirmButton_click(_arg_1:MouseEvent):void
        {
            tradeConfirm();
        }

        private function _TradePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TradePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_TradePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                confirmButton.label = _arg_1;
            }, "confirmButton.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lockButton.toolTip = _arg_1;
            }, "lockButton.toolTip");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lockButton.label = _arg_1;
            }, "lockButton.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TradePanel_BasicGlowButton3.label = _arg_1;
            }, "_TradePanel_BasicGlowButton3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                labelTarget.text = _arg_1;
            }, "labelTarget.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                targetStateInfo.text = _arg_1;
            }, "targetStateInfo.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TradePanel_BasicTxtButton1.label = _arg_1;
            }, "_TradePanel_BasicTxtButton1.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TradePanel_BasicTxtButton2.label = _arg_1;
            }, "_TradePanel_BasicTxtButton2.label");
            result[8] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                targetMoney.type = _arg_1;
            }, "targetMoney.type");
            result[9] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                targetGold.type = _arg_1;
            }, "targetGold.type");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                labelSelf.text = _arg_1;
            }, "labelSelf.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                selfStateInfo.text = _arg_1;
            }, "selfStateInfo.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TradePanel_BasicTxtButton3.label = _arg_1;
            }, "_TradePanel_BasicTxtButton3.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRADEPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TradePanel_BasicTxtButton4.label = _arg_1;
            }, "_TradePanel_BasicTxtButton4.label");
            result[14] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                myMoney.type = _arg_1;
            }, "myMoney.type");
            result[15] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                myGold.type = _arg_1;
            }, "myGold.type");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_ITEM);
            }, function (_arg_1:int):void
            {
                item1.slotType = _arg_1;
            }, "item1.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_ITEM);
            }, function (_arg_1:int):void
            {
                item2.slotType = _arg_1;
            }, "item2.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_ITEM);
            }, function (_arg_1:int):void
            {
                item3.slotType = _arg_1;
            }, "item3.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_ITEM);
            }, function (_arg_1:int):void
            {
                item4.slotType = _arg_1;
            }, "item4.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_ITEM);
            }, function (_arg_1:int):void
            {
                item5.slotType = _arg_1;
            }, "item5.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_PET);
            }, function (_arg_1:int):void
            {
                pet0.slotType = _arg_1;
            }, "pet0.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_PET);
            }, function (_arg_1:int):void
            {
                pet1.slotType = _arg_1;
            }, "pet1.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_PET);
            }, function (_arg_1:int):void
            {
                pet2.slotType = _arg_1;
            }, "pet2.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_PET);
            }, function (_arg_1:int):void
            {
                pet3.slotType = _arg_1;
            }, "pet3.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TRADE_PET);
            }, function (_arg_1:int):void
            {
                pet4.slotType = _arg_1;
            }, "pet4.slotType");
            result[26] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get lockButton():BasicGlowButton
        {
            return (this._406719549lockButton);
        }

        private function removePetByIndex(_arg_1:uint):void
        {
            var _local_2:uint;
            var _local_3:Object;
            if (state == "normal")
            {
                if (((_arg_1 >= 0) && (_arg_1 < 5)))
                {
                    _local_2 = this[("pet" + _arg_1)].giid;
                    _local_3 = _core.player.petList[_local_2];
                    if (_local_3)
                    {
                        _local_3.inTrade = false;
                    };
                    this[("pet" + _arg_1)].clean();
                };
            };
        }

        override public function hide():void
        {
            if (visible == false)
            {
                return;
            };
            super.hide();
            _core.remote.call("stopTrade", null);
            tradeClear();
        }

        [Bindable(event="propertyChange")]
        public function get targetPet1():LevelSlot
        {
            return (this._486484003targetPet1);
        }

        public function set targetPet2(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._486484004targetPet2;
            if (_local_2 !== _arg_1)
            {
                this._486484004targetPet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetPet2", _local_2, _arg_1));
            };
        }

        public function tradeClear():void
        {
            state = "normal";
            targetId = -1;
            targetName = "";
            myMoney.inputEnabled = true;
            myGold.inputEnabled = true;
            myMoney.maxValue = 0;
            myGold.maxValue = 0;
            myMoney.value = 0;
            myGold.value = 0;
            targetMoney.maxValue = 0;
            targetGold.maxValue = 0;
            targetMoney.value = 0;
            targetGold.value = 0;
            var _local_1:int = 1;
            while (_local_1 <= 5)
            {
                if (this[("item" + _local_1)].slotData)
                {
                    if (_core.view.getSlot(this[("item" + _local_1)].slotData.sid))
                    {
                        _core.view.getSlot(this[("item" + _local_1)].slotData.sid).restore();
                    };
                };
                this[("item" + _local_1)].clean();
                this[("targetItem" + _local_1)].clean();
                _local_1++;
            };
            lockButton.enabled = true;
            confirmButton.enabled = true;
            item1.enabled = true;
            item2.enabled = true;
            item3.enabled = true;
            item4.enabled = true;
            item5.enabled = true;
            targetStateInfo.text = Language.TRADEPANEL_S[0];
            selfStateInfo.text = Language.TRADEPANEL_S[1];
            removePet();
            removeTargetPet();
            targetPet0.clean();
        }

        public function __pet1_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(1);
        }

        public function set targetPet0(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._486484002targetPet0;
            if (_local_2 !== _arg_1)
            {
                this._486484002targetPet0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetPet0", _local_2, _arg_1));
            };
        }

        public function __pet3_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(3);
        }

        public function set targetPet1(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._486484003targetPet1;
            if (_local_2 !== _arg_1)
            {
                this._486484003targetPet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetPet1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myGold():Currency
        {
            return (this._1060418516myGold);
        }

        public function set targetGold(_arg_1:Currency):void
        {
            var _local_2:Object = this._486225297targetGold;
            if (_local_2 !== _arg_1)
            {
                this._486225297targetGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetGold", _local_2, _arg_1));
            };
        }

        public function onTargetConfirm():void
        {
            targetStateInfo.text = Language.TRADEPANEL_S[7];
        }

        public function set targetPet4(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._486484006targetPet4;
            if (_local_2 !== _arg_1)
            {
                this._486484006targetPet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetPet4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get targetStateInfo():RoundedLabel
        {
            return (this._98750030targetStateInfo);
        }

        private function removeAndRefreshPet(_arg_1:uint):void
        {
            if (state == "normal")
            {
                removePetByIndex(_arg_1);
                _core.view.getUI(ViewManager.PANEL_BAG).petInit();
            };
        }

        public function set myGold(_arg_1:Currency):void
        {
            var _local_2:Object = this._1060418516myGold;
            if (_local_2 !== _arg_1)
            {
                this._1060418516myGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myGold", _local_2, _arg_1));
            };
        }

        public function set labelTarget(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._73192869labelTarget;
            if (_local_2 !== _arg_1)
            {
                this._73192869labelTarget = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelTarget", _local_2, _arg_1));
            };
        }

        public function addItem(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:int;
            if (state == "normal")
            {
                _local_2 = 1;
                while (_local_2 <= 5)
                {
                    if (this[("item" + _local_2)].slotData)
                    {
                        if (this[("item" + _local_2)].slotData == _arg_1)
                        {
                            return;
                        };
                    };
                    _local_2++;
                };
                _local_3 = 1;
                while (_local_3 <= 5)
                {
                    if (this[("item" + _local_3)].slotData == null)
                    {
                        this[("item" + _local_3)].type = _arg_1.type;
                        this[("item" + _local_3)].giid = _arg_1.itemId;
                        this[("item" + _local_3)].stackNum = _arg_1.stackNum;
                        this[("item" + _local_3)].slotData = _arg_1;
                        _core.view.getSlot(_arg_1.sid).reset();
                        return;
                    };
                    _local_3++;
                };
            };
        }

        public function set targetMoney(_arg_1:Currency):void
        {
            var _local_2:Object = this._2101341777targetMoney;
            if (_local_2 !== _arg_1)
            {
                this._2101341777targetMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetMoney", _local_2, _arg_1));
            };
        }

        public function set targetPet3(_arg_1:LevelSlot):void
        {
            var _local_2:Object = this._486484005targetPet3;
            if (_local_2 !== _arg_1)
            {
                this._486484005targetPet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetPet3", _local_2, _arg_1));
            };
        }

        public function onStopTrade():void
        {
            if (visible)
            {
                visible = false;
                tradeClear();
            };
        }

        [Bindable(event="propertyChange")]
        public function get targetPet0():LevelSlot
        {
            return (this._486484002targetPet0);
        }

        [Bindable(event="propertyChange")]
        public function get targetItem1():NumSlot
        {
            return (this._2104895379targetItem1);
        }

        public function ___TradePanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get targetItem5():NumSlot
        {
            return (this._2104895375targetItem5);
        }

        [Bindable(event="propertyChange")]
        public function get myMoney():Currency
        {
            return (this._1492307572myMoney);
        }

        public function onSelfConfirm(_arg_1:Object):void
        {
            if (_arg_1 != null)
            {
                if (_arg_1.flag == true)
                {
                    confirmButton.enabled = false;
                    state = "confirm";
                    selfStateInfo.text = Language.TRADEPANEL_S[6];
                }
                else
                {
                    _core.sysMidNote(_arg_1.info);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get targetItem3():NumSlot
        {
            return (this._2104895377targetItem3);
        }

        [Bindable(event="propertyChange")]
        public function get targetItem4():NumSlot
        {
            return (this._2104895376targetItem4);
        }

        public function set lockButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._406719549lockButton;
            if (_local_2 !== _arg_1)
            {
                this._406719549lockButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lockButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get targetItem2():NumSlot
        {
            return (this._2104895378targetItem2);
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

        [Bindable(event="propertyChange")]
        public function get item5():NumSlot
        {
            return (this._100525954item5);
        }

        public function onTradeFail(_arg_1:String):void
        {
            trace(_arg_1);
            hide();
            _core.sysMidNote(Language.TRADEPANEL_S[8]);
        }

        override public function initialize():void
        {
            var target:TradePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TradePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TradePanelWatcherSetupUtil");
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

        public function onRequestTrade(_arg_1:Number, _arg_2:String):void
        {
            this.targetId = _arg_1;
            this.targetName = _arg_2;
            startTrade();
        }

        public function onSelfLock(_arg_1:Object):void
        {
            if (_arg_1.flag)
            {
                lockButton.enabled = false;
                myMoney.inputEnabled = false;
                myGold.inputEnabled = false;
                state = "lock";
                selfStateInfo.text = Language.TRADEPANEL_S[2];
            }
            else
            {
                _core.sysMidNote(_arg_1.info);
            };
        }

        public function __item4_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        public function set targetStateInfo(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._98750030targetStateInfo;
            if (_local_2 !== _arg_1)
            {
                this._98750030targetStateInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetStateInfo", _local_2, _arg_1));
            };
        }

        public function __item2_doubleClick(_arg_1:MouseEvent):void
        {
            removeItem(_arg_1);
        }

        public function onTargetLock(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_5:int;
            targetStateInfo.text = Language.TRADEPANEL_S[3];
            targetMoney.value = _arg_1.money;
            targetGold.value = _arg_1.gold;
            var _local_2:Object = _arg_1.itemList;
            if (_local_2 != null)
            {
                for (_local_4 in _local_2)
                {
                    if (((!(_local_2[_local_4] == null)) && (!(_local_2[_local_4] == undefined))))
                    {
                        this[("targetItem" + _local_4)].type = _local_2[_local_4].type;
                        this[("targetItem" + _local_4)].giid = _local_2[_local_4].itemId;
                        this[("targetItem" + _local_4)].stackNum = _local_2[_local_4].stackNum;
                    };
                };
            };
            var _local_3:Object = _arg_1.petIds;
            if (_local_3)
            {
                for (_local_4 in _local_3)
                {
                    _local_5 = _local_3[_local_4];
                    if (_local_5 != -1)
                    {
                        this[("targetPet" + _local_4)].type = GamePredef.TBL_PET;
                        this[("targetPet" + _local_4)].giid = _local_5;
                    };
                };
            };
        }

        public function onNewTrade(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (_arg_1.flag == true)
                {
                    startTrade();
                }
                else
                {
                    targetId = -1;
                    targetName = "";
                    _core.sysMidNote(_arg_1.info);
                };
            };
        }

        public function newTrade(_arg_1:Number, _arg_2:String):void
        {
            if (_arg_1 == _core.cid)
            {
                return;
            };
            if (_core.player.actionState == GamePredef.ST_NORMAL)
            {
                this.targetId = _arg_1;
                this.targetName = _arg_2;
                _core.remote.call("newTrade", new Responder(onNewTrade), _arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get labelTarget():RoundedLabel
        {
            return (this._73192869labelTarget);
        }

        [Bindable(event="propertyChange")]
        public function get labelSelf():RoundedLabel
        {
            return (this._607770528labelSelf);
        }

        [Bindable(event="propertyChange")]
        public function get targetGold():Currency
        {
            return (this._486225297targetGold);
        }

        private function removeTargetPet():void
        {
            var _local_1:uint;
            while (_local_1 < 5)
            {
                this[("targetPet" + _local_1)].clean();
                _local_1++;
            };
        }

        public function onTradeSuccess():void
        {
            hide();
            _core.sysMidNote(Language.TRADEPANEL_S[9]);
        }

        private function tradeLock():void
        {
            var _local_2:uint;
            var _local_3:LevelSlot;
            var _local_1:Object = {};
            _local_1.money = myMoney.value;
            _local_1.gold = myGold.value;
            _local_1.petIds = [];
            _local_2 = 0;
            while (_local_2 < 5)
            {
                _local_3 = (this[("pet" + _local_2)] as LevelSlot);
                if (_local_3.isEmpty())
                {
                    _local_1.petIds.push(-1);
                }
                else
                {
                    _local_1.petIds.push(_local_3.giid);
                };
                _local_2++;
            };
            if ((((pet0.giid) && (!(pet0.giid == -1))) && (!(pet0.type == -1))))
            {
                _local_1.petId = pet0.giid;
            }
            else
            {
                _local_1.petId = -1;
            };
            _local_1.items = {};
            _local_2 = 1;
            while (_local_2 <= 5)
            {
                if (this[("item" + _local_2)].slotData)
                {
                    _local_1.items[_local_2] = this[("item" + _local_2)].slotData.id;
                };
                _local_2++;
            };
            _core.remote.call("tradeLock", new Responder(onSelfLock), _local_1);
        }

        [Bindable(event="propertyChange")]
        public function get targetMoney():Currency
        {
            return (this._2101341777targetMoney);
        }

        private function removeItem(_arg_1:Event):void
        {
            if (state == "normal")
            {
                if (_arg_1.currentTarget.slotData)
                {
                    _core.view.getSlot(_arg_1.currentTarget.slotData.sid).restore();
                    _arg_1.currentTarget.clean();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get item1():NumSlot
        {
            return (this._100525950item1);
        }

        public function set labelSelf(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._607770528labelSelf;
            if (_local_2 !== _arg_1)
            {
                this._607770528labelSelf = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelSelf", _local_2, _arg_1));
            };
        }

        public function addPet(_arg_1:Number, _arg_2:int=-1):void
        {
            var _local_3:Object;
            var _local_4:uint;
            var _local_5:Object;
            if (state == "normal")
            {
                _local_3 = _core.player.petList[_arg_1];
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
                            _local_5.inTrade = false;
                        };
                    };
                    this[("pet" + _arg_2)].clean();
                    _local_3.inTrade = true;
                    this[("pet" + _arg_2)].type = GamePredef.TBL_PET;
                    this[("pet" + _arg_2)].giid = _arg_1;
                    return;
                };
                _local_4 = 0;
                while (_local_4 < 5)
                {
                    if (this[("pet" + _local_4)].isEmpty())
                    {
                        _local_3.inTrade = true;
                        this[("pet" + _local_4)].type = GamePredef.TBL_PET;
                        this[("pet" + _local_4)].giid = _arg_1;
                        return;
                    };
                    _local_4++;
                };
            };
        }

        private function tradeConfirm():void
        {
            var num:int;
            var i:uint;
            var petNum:uint;
            var bagpanel:* = undefined;
            var tradeItem:Function;
            if (state == "lock")
            {
                num = 0;
                i = 1;
                while (i <= 5)
                {
                    if (this[("targetItem" + i)].giid > 0)
                    {
                        num = (num + 1);
                    };
                    i++;
                };
                petNum = 0;
                i = 0;
                while (i < 5)
                {
                    if (this[("targetPet" + i)].giid > 0)
                    {
                        petNum++;
                    };
                    i++;
                };
                if (((_core.player.enoughBag(num)) && (_core.player.enoughPetSlot(petNum))))
                {
                    bagpanel = _core.view.getUI(ViewManager.PANEL_BAG);
                    if (((_core.delPass) && (!(bagpanel.goldLockFlag))))
                    {
                        _core.remote.call("tradeConfirm", new Responder(onSelfConfirm), _core.delPass);
                    }
                    else
                    {
                        tradeItem = function (_arg_1:String):void
                        {
                            _core.remote.call("tradeConfirm", new Responder(onSelfConfirm), MD5.hash(_arg_1));
                        };
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.TRADEPANEL_S[14], tradeItem);
                    };
                }
                else
                {
                    if (((!(_core.player.enoughBag(num))) && (!(_core.player.enoughPetSlot(petNum)))))
                    {
                        _core.sysMidNote(Language.TRADEPANEL_S[16]);
                    }
                    else
                    {
                        if (!_core.player.enoughBag(num))
                        {
                            _core.sysMidNote(Language.TRADEPANEL_S[4]);
                        }
                        else
                        {
                            if (!_core.player.enoughPetSlot(petNum))
                            {
                                _core.sysMidNote(Language.TRADEPANEL_S[15]);
                            };
                        };
                    };
                };
            }
            else
            {
                _core.sysMidNote(Language.TRADEPANEL_S[5]);
            };
        }

        public function __pet0_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(0);
        }

        public function __pet2_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(2);
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

        public function set targetItem2(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._2104895378targetItem2;
            if (_local_2 !== _arg_1)
            {
                this._2104895378targetItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetItem2", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_core.player)
            {
                if (!_arg_1)
                {
                    _core.view.getUI(ViewManager.PANEL_BAG).visible = true;
                };
            };
        }

        public function __pet4_doubleClick(_arg_1:MouseEvent):void
        {
            removeAndRefreshPet(4);
        }

        public function set myMoney(_arg_1:Currency):void
        {
            var _local_2:Object = this._1492307572myMoney;
            if (_local_2 !== _arg_1)
            {
                this._1492307572myMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myMoney", _local_2, _arg_1));
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

        public function __lockButton_click(_arg_1:MouseEvent):void
        {
            tradeLock();
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

        [Bindable(event="propertyChange")]
        public function get pet0():LevelSlot
        {
            return (this._3437297pet0);
        }

        [Bindable(event="propertyChange")]
        public function get pet1():LevelSlot
        {
            return (this._3437298pet1);
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

        public function set targetItem4(_arg_1:NumSlot):void
        {
            var _local_2:Object = this._2104895376targetItem4;
            if (_local_2 !== _arg_1)
            {
                this._2104895376targetItem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetItem4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet2():LevelSlot
        {
            return (this._3437299pet2);
        }

        private function removePet():void
        {
            var _local_1:uint;
            var _local_2:uint;
            var _local_3:Object;
            if (state == "normal")
            {
                _local_1 = 0;
                while (_local_1 < 5)
                {
                    _local_2 = this[("pet" + _local_1)].giid;
                    _local_3 = _core.player.petList[_local_2];
                    if (_local_3)
                    {
                        _local_3.inTrade = false;
                    };
                    this[("pet" + _local_1)].clean();
                    _local_1++;
                };
                _core.view.getUI(ViewManager.PANEL_BAG).petInit();
            };
        }

        override public function show():void
        {
            super.show();
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_BAG);
            _local_1.startFollow(this);
            _local_1.show();
        }


    }
}//package com.qeedoo.ui.view.compDragable

