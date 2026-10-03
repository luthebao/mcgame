// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.LotteryBagPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.DescriptionLabel;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import flash.events.MouseEvent;
    import mx.events.CloseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.event.GameEvent;
    import flash.utils.getDefinitionByName;
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

    public class LotteryBagPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1177985702iSlot32:ItemSlot;
        private var _1177985733iSlot42:ItemSlot;
        private var _1208926451iSlot4:ItemSlot;
        private var _1177985670iSlot21:ItemSlot;
        private var _1177985709iSlot39:ItemSlot;
        private var _1177985646iSlot18:ItemSlot;
        private var _1177985677iSlot28:ItemSlot;
        public var _LotteryBagPanel_BasicGlowButton1:BasicGlowButton;
        private var _1177985700iSlot30:ItemSlot;
        private var _1177985731iSlot40:ItemSlot;
        private var _1177985707iSlot37:ItemSlot;
        private var _1177985738iSlot47:ItemSlot;
        private var _1177985644iSlot16:ItemSlot;
        private var _1177985675iSlot26:ItemSlot;
        private var _1177985740iSlot49:ItemSlot;
        private var _1249367445getAll:BasicGlowButton;
        public var _LotteryBagPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1208926453iSlot2:ItemSlot;
        private var _click:Number = 0;
        private var _1177985705iSlot35:ItemSlot;
        private var _1177985736iSlot45:ItemSlot;
        private var _1177985642iSlot14:ItemSlot;
        private var _1177985673iSlot24:ItemSlot;
        private var _1208926447iSlot8:ItemSlot;
        private var _1208926450iSlot5:ItemSlot;
        private var _1177985669iSlot20:ItemSlot;
        private var _1177985734iSlot43:ItemSlot;
        private var _1177985638iSlot10:ItemSlot;
        private var _1177985640iSlot12:ItemSlot;
        private var _1177985671iSlot22:ItemSlot;
        private var _1177985703iSlot33:ItemSlot;
        private var _firstLoadCid:Number = 0;
        private var _1208926455iSlot0:ItemSlot;
        private var _1177985647iSlot19:ItemSlot;
        private var _1177985678iSlot29:ItemSlot;
        private var _1177985701iSlot31:ItemSlot;
        private var _1177985732iSlot41:ItemSlot;
        private var _1208926449iSlot6:ItemSlot;
        private var countPerPage:uint = 50;
        private var _1177985708iSlot38:ItemSlot;
        private var _1177985739iSlot48:ItemSlot;
        private var _1177985645iSlot17:ItemSlot;
        private var _1177985676iSlot27:ItemSlot;
        private var _1208926452iSlot3:ItemSlot;
        private var _1208926446iSlot9:ItemSlot;
        private var _changed:Boolean = false;
        private var _1177985737iSlot46:ItemSlot;
        private var _1177985706iSlot36:ItemSlot;
        private var _1177985643iSlot15:ItemSlot;
        private var _1177985674iSlot25:ItemSlot;
        public var _LotteryBagPanel_DescriptionLabel1:DescriptionLabel;
        private var itemPageNo:uint = 0;
        private var _1177985639iSlot11:ItemSlot;
        private var _1177985735iSlot44:ItemSlot;
        private var _1208926454iSlot1:ItemSlot;
        private var _1177985704iSlot34:ItemSlot;
        private var _1177985641iSlot13:ItemSlot;
        private var _1177985672iSlot23:ItemSlot;
        private var _344219194bagSort:BasicGlowButton;
        private var _1208926448iSlot7:ItemSlot;
        private var max_slot:uint = 100;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":430,
                    "height":320,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_LotteryBagPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":52,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":94,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":136,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":178,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":220,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot6",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":262,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot7",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":304,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot8",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":346,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot9",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":388,
                                "y":64,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot10",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot11",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":52,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot12",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":94,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot13",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":136,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot14",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":178,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot15",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":220,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot16",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":262,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot17",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":304,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot18",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":346,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot19",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":388,
                                "y":106,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot20",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot21",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":52,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot22",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":94,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot23",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":136,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot24",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":178,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot25",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":220,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot26",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":262,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot27",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":304,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot28",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":346,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot29",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":388,
                                "y":148,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot30",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot31",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":52,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot32",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":94,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot33",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":136,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot34",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":178,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot35",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":220,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot36",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":262,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot37",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":304,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot38",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":346,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot39",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":388,
                                "y":190,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot40",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot41",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":52,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot42",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":94,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot43",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":136,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot44",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":178,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot45",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":220,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot46",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":262,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot47",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":304,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot48",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":346,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"iSlot49",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":388,
                                "y":232,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DescriptionLabel,
                        "id":"_LotteryBagPanel_DescriptionLabel1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":280,
                                "y":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":36,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_LotteryBagPanel_BasicGlowButton1",
                                    "events":{"click":"___LotteryBagPanel_BasicGlowButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"styleName":"BtnStdRed"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"getAll",
                                    "events":{"click":"__getAll_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"styleName":"BtnStdRed"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bagSort",
                                    "events":{"click":"__bagSort_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"styleName":"BtnStdRed"});
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var itemAC:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LotteryBagPanel()
        {
            mx_internal::_document = this;
            this.width = 430;
            this.height = 320;
            this.styleName = "StandardContent";
            this.x = 105;
            this.y = 231;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LotteryBagPanel._watcherSetupUtil = _arg_1;
        }


        public function set iSlot0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926455iSlot0;
            if (_local_2 !== _arg_1)
            {
                this._1208926455iSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot0", _local_2, _arg_1));
            };
        }

        private function addSlotListener():void
        {
            var _local_1:int = 50;
            var _local_2:int;
            while (_local_2 < _local_1)
            {
                this[("iSlot" + _local_2)].addEventListener(Slot.EVENT_SLOT_DCLICK, dClickHandler);
                _local_2++;
            };
        }

        public function set iSlot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926454iSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1208926454iSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot1", _local_2, _arg_1));
            };
        }

        public function set iSlot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926453iSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1208926453iSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot2", _local_2, _arg_1));
            };
        }

        public function set iSlot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926452iSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1208926452iSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot3", _local_2, _arg_1));
            };
        }

        private function getAllItem():void
        {
            _core.remote.call("getAllLotteryItem", null);
        }

        public function set iSlot7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926448iSlot7;
            if (_local_2 !== _arg_1)
            {
                this._1208926448iSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot7", _local_2, _arg_1));
            };
        }

        public function set iSlot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926451iSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1208926451iSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot4", _local_2, _arg_1));
            };
        }

        public function set iSlot8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926447iSlot8;
            if (_local_2 !== _arg_1)
            {
                this._1208926447iSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot8", _local_2, _arg_1));
            };
        }

        public function set iSlot6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926449iSlot6;
            if (_local_2 !== _arg_1)
            {
                this._1208926449iSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot6", _local_2, _arg_1));
            };
        }

        public function set iSlot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926450iSlot5;
            if (_local_2 !== _arg_1)
            {
                this._1208926450iSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot5", _local_2, _arg_1));
            };
        }

        public function set iSlot9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1208926446iSlot9;
            if (_local_2 !== _arg_1)
            {
                this._1208926446iSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot9", _local_2, _arg_1));
            };
        }

        private function lotteryBagSort():void
        {
            if (ToolKit.isSmallOrEqual(ToolKit.minus(new Date().time, _click), 1500))
            {
                return;
            };
            _click = new Date().time;
            _core.remote.call("lotteryBagSort", null);
        }

        private function _LotteryBagPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.LOTTERY_BAG_U[0];
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Language.LOTTERY_BAG_U[6];
            _local_1 = Language.LOTTERY_BAG_U[1];
            _local_1 = Language.LOTTERY_BAG_U[3];
            _local_1 = Language.LOTTERY_BAG_U[4];
        }

        [Bindable(event="propertyChange")]
        public function get iSlot11():ItemSlot
        {
            return (this._1177985639iSlot11);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot12():ItemSlot
        {
            return (this._1177985640iSlot12);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot13():ItemSlot
        {
            return (this._1177985641iSlot13);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot14():ItemSlot
        {
            return (this._1177985642iSlot14);
        }

        [Bindable(event="propertyChange")]
        public function get getAll():BasicGlowButton
        {
            return (this._1249367445getAll);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot16():ItemSlot
        {
            return (this._1177985644iSlot16);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot19():ItemSlot
        {
            return (this._1177985647iSlot19);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot15():ItemSlot
        {
            return (this._1177985643iSlot15);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot17():ItemSlot
        {
            return (this._1177985645iSlot17);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot18():ItemSlot
        {
            return (this._1177985646iSlot18);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot20():ItemSlot
        {
            return (this._1177985669iSlot20);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot21():ItemSlot
        {
            return (this._1177985670iSlot21);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot22():ItemSlot
        {
            return (this._1177985671iSlot22);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot26():ItemSlot
        {
            return (this._1177985675iSlot26);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot27():ItemSlot
        {
            return (this._1177985676iSlot27);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot28():ItemSlot
        {
            return (this._1177985677iSlot28);
        }

        private function throwAllItem():void
        {
            Alert.show(Language.LOTTO_BAG_U[5], null, (Alert.YES | Alert.NO), null, throwAllItemHandler);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot10():ItemSlot
        {
            return (this._1177985638iSlot10);
        }

        public function __getAll_click(_arg_1:MouseEvent):void
        {
            getAllItem();
        }

        [Bindable(event="propertyChange")]
        public function get iSlot29():ItemSlot
        {
            return (this._1177985678iSlot29);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot24():ItemSlot
        {
            return (this._1177985673iSlot24);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot25():ItemSlot
        {
            return (this._1177985674iSlot25);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot23():ItemSlot
        {
            return (this._1177985672iSlot23);
        }

        public function set itemList(_arg_1:ArrayCollection):void
        {
            itemAC = _arg_1;
            if (this.visible)
            {
                updateView();
            }
            else
            {
                _changed = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot32():ItemSlot
        {
            return (this._1177985702iSlot32);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot33():ItemSlot
        {
            return (this._1177985703iSlot33);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot34():ItemSlot
        {
            return (this._1177985704iSlot34);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot35():ItemSlot
        {
            return (this._1177985705iSlot35);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot36():ItemSlot
        {
            return (this._1177985706iSlot36);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot30():ItemSlot
        {
            return (this._1177985700iSlot30);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot31():ItemSlot
        {
            return (this._1177985701iSlot31);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot37():ItemSlot
        {
            return (this._1177985707iSlot37);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot39():ItemSlot
        {
            return (this._1177985709iSlot39);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot38():ItemSlot
        {
            return (this._1177985708iSlot38);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot40():ItemSlot
        {
            return (this._1177985731iSlot40);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot41():ItemSlot
        {
            return (this._1177985732iSlot41);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot42():ItemSlot
        {
            return (this._1177985733iSlot42);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot43():ItemSlot
        {
            return (this._1177985734iSlot43);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot44():ItemSlot
        {
            return (this._1177985735iSlot44);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot46():ItemSlot
        {
            return (this._1177985737iSlot46);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot48():ItemSlot
        {
            return (this._1177985739iSlot48);
        }

        public function set iSlot10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985638iSlot10;
            if (_local_2 !== _arg_1)
            {
                this._1177985638iSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot10", _local_2, _arg_1));
            };
        }

        public function set iSlot11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985639iSlot11;
            if (_local_2 !== _arg_1)
            {
                this._1177985639iSlot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot11", _local_2, _arg_1));
            };
        }

        public function set iSlot12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985640iSlot12;
            if (_local_2 !== _arg_1)
            {
                this._1177985640iSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot47():ItemSlot
        {
            return (this._1177985738iSlot47);
        }

        public function set iSlot13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985641iSlot13;
            if (_local_2 !== _arg_1)
            {
                this._1177985641iSlot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot49():ItemSlot
        {
            return (this._1177985740iSlot49);
        }

        public function set iSlot14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985642iSlot14;
            if (_local_2 !== _arg_1)
            {
                this._1177985642iSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot14", _local_2, _arg_1));
            };
        }

        public function set getAll(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1249367445getAll;
            if (_local_2 !== _arg_1)
            {
                this._1249367445getAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getAll", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot45():ItemSlot
        {
            return (this._1177985736iSlot45);
        }

        public function set iSlot16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985644iSlot16;
            if (_local_2 !== _arg_1)
            {
                this._1177985644iSlot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot16", _local_2, _arg_1));
            };
        }

        public function set iSlot17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985645iSlot17;
            if (_local_2 !== _arg_1)
            {
                this._1177985645iSlot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot17", _local_2, _arg_1));
            };
        }

        public function set iSlot15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985643iSlot15;
            if (_local_2 !== _arg_1)
            {
                this._1177985643iSlot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot15", _local_2, _arg_1));
            };
        }

        public function set iSlot19(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985647iSlot19;
            if (_local_2 !== _arg_1)
            {
                this._1177985647iSlot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot19", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((visible) && (_changed)))
            {
                updateView();
                _changed = false;
                init();
            };
            if (((visible) && ((!(_firstLoadCid)) || (((_core.player) && (_core.player.id)) && (!(_firstLoadCid == _core.player.id))))))
            {
                init();
                _firstLoadCid = _core.player.id;
            };
        }

        private function throwAllItemHandler(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("throwAllLotteryItem", null);
            };
        }

        private function _LotteryBagPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERY_BAG_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LotteryBagPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_LotteryBagPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot0.slotType = _arg_1;
            }, "iSlot0.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot1.slotType = _arg_1;
            }, "iSlot1.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot2.slotType = _arg_1;
            }, "iSlot2.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot3.slotType = _arg_1;
            }, "iSlot3.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot4.slotType = _arg_1;
            }, "iSlot4.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot5.slotType = _arg_1;
            }, "iSlot5.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot6.slotType = _arg_1;
            }, "iSlot6.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot7.slotType = _arg_1;
            }, "iSlot7.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot8.slotType = _arg_1;
            }, "iSlot8.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot9.slotType = _arg_1;
            }, "iSlot9.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot10.slotType = _arg_1;
            }, "iSlot10.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot11.slotType = _arg_1;
            }, "iSlot11.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot12.slotType = _arg_1;
            }, "iSlot12.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot13.slotType = _arg_1;
            }, "iSlot13.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot14.slotType = _arg_1;
            }, "iSlot14.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot15.slotType = _arg_1;
            }, "iSlot15.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot16.slotType = _arg_1;
            }, "iSlot16.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot17.slotType = _arg_1;
            }, "iSlot17.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot18.slotType = _arg_1;
            }, "iSlot18.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot19.slotType = _arg_1;
            }, "iSlot19.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot20.slotType = _arg_1;
            }, "iSlot20.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot21.slotType = _arg_1;
            }, "iSlot21.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot22.slotType = _arg_1;
            }, "iSlot22.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot23.slotType = _arg_1;
            }, "iSlot23.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot24.slotType = _arg_1;
            }, "iSlot24.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot25.slotType = _arg_1;
            }, "iSlot25.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot26.slotType = _arg_1;
            }, "iSlot26.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot27.slotType = _arg_1;
            }, "iSlot27.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot28.slotType = _arg_1;
            }, "iSlot28.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot29.slotType = _arg_1;
            }, "iSlot29.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot30.slotType = _arg_1;
            }, "iSlot30.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot31.slotType = _arg_1;
            }, "iSlot31.slotType");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot32.slotType = _arg_1;
            }, "iSlot32.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot33.slotType = _arg_1;
            }, "iSlot33.slotType");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot34.slotType = _arg_1;
            }, "iSlot34.slotType");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot35.slotType = _arg_1;
            }, "iSlot35.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot36.slotType = _arg_1;
            }, "iSlot36.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot37.slotType = _arg_1;
            }, "iSlot37.slotType");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot38.slotType = _arg_1;
            }, "iSlot38.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot39.slotType = _arg_1;
            }, "iSlot39.slotType");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot40.slotType = _arg_1;
            }, "iSlot40.slotType");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot41.slotType = _arg_1;
            }, "iSlot41.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot42.slotType = _arg_1;
            }, "iSlot42.slotType");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot43.slotType = _arg_1;
            }, "iSlot43.slotType");
            result[44] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot44.slotType = _arg_1;
            }, "iSlot44.slotType");
            result[45] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot45.slotType = _arg_1;
            }, "iSlot45.slotType");
            result[46] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot46.slotType = _arg_1;
            }, "iSlot46.slotType");
            result[47] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot47.slotType = _arg_1;
            }, "iSlot47.slotType");
            result[48] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot48.slotType = _arg_1;
            }, "iSlot48.slotType");
            result[49] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                iSlot49.slotType = _arg_1;
            }, "iSlot49.slotType");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERY_BAG_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LotteryBagPanel_DescriptionLabel1.text = _arg_1;
            }, "_LotteryBagPanel_DescriptionLabel1.text");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERY_BAG_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LotteryBagPanel_BasicGlowButton1.label = _arg_1;
            }, "_LotteryBagPanel_BasicGlowButton1.label");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERY_BAG_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getAll.label = _arg_1;
            }, "getAll.label");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERY_BAG_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bagSort.label = _arg_1;
            }, "bagSort.label");
            result[54] = binding;
            return (result);
        }

        public function set iSlot18(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985646iSlot18;
            if (_local_2 !== _arg_1)
            {
                this._1177985646iSlot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot18", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot0():ItemSlot
        {
            return (this._1208926455iSlot0);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot2():ItemSlot
        {
            return (this._1208926453iSlot2);
        }

        public function set iSlot21(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985670iSlot21;
            if (_local_2 !== _arg_1)
            {
                this._1177985670iSlot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot21", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot1():ItemSlot
        {
            return (this._1208926454iSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot3():ItemSlot
        {
            return (this._1208926452iSlot3);
        }

        public function set iSlot25(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985674iSlot25;
            if (_local_2 !== _arg_1)
            {
                this._1177985674iSlot25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot25", _local_2, _arg_1));
            };
        }

        private function updateView():void
        {
            var _local_2:Object;
            var _local_1:int;
            while (_local_1 < 50)
            {
                this[("iSlot" + _local_1)].reset();
                if ((((((_local_1 < itemAC.length) && (itemAC[_local_1])) && (itemAC[_local_1].ti)) && (itemAC[_local_1].ii)) && (itemAC[_local_1].n)))
                {
                    itemAC[_local_1].sIndex = _local_1;
                    this[("iSlot" + _local_1)].type = itemAC[_local_1].ti;
                    this[("iSlot" + _local_1)].giid = itemAC[_local_1].ii;
                    this[("iSlot" + _local_1)].stackNum = itemAC[_local_1].n;
                    this[("iSlot" + _local_1)].quality = itemAC[_local_1].q;
                    this[("iSlot" + _local_1)].slotData = itemAC[_local_1];
                    if (itemAC[_local_1].ti == GamePredef.TBL_CREATURE)
                    {
                        this[("iSlot" + _local_1)].setStyleName(_core.basic.colorByGrowRate((itemAC[_local_1].q / 10)));
                    }
                    else
                    {
                        _local_2 = _core.data.getGameData(itemAC[_local_1].ti, itemAC[_local_1].ii);
                        (((_local_2) && (_local_2.color)) && (this[("iSlot" + _local_1)].setStyleName(_local_2.color)));
                    };
                };
                _local_1++;
            };
        }

        public function set iSlot26(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985675iSlot26;
            if (_local_2 !== _arg_1)
            {
                this._1177985675iSlot26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot26", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            if (ToolKit.isSmallOrEqual(ToolKit.minus(new Date().time, _click), 1500))
            {
                return;
            };
            _click = new Date().time;
            _core.remote.call("getLotteryBag", null);
            addSlotListener();
        }

        public function set iSlot27(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985676iSlot27;
            if (_local_2 !== _arg_1)
            {
                this._1177985676iSlot27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot27", _local_2, _arg_1));
            };
        }

        public function set iSlot20(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985669iSlot20;
            if (_local_2 !== _arg_1)
            {
                this._1177985669iSlot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot20", _local_2, _arg_1));
            };
        }

        public function set iSlot22(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985671iSlot22;
            if (_local_2 !== _arg_1)
            {
                this._1177985671iSlot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot22", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot6():ItemSlot
        {
            return (this._1208926449iSlot6);
        }

        public function set iSlot23(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985672iSlot23;
            if (_local_2 !== _arg_1)
            {
                this._1177985672iSlot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot23", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot8():ItemSlot
        {
            return (this._1208926447iSlot8);
        }

        public function set iSlot24(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985673iSlot24;
            if (_local_2 !== _arg_1)
            {
                this._1177985673iSlot24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot24", _local_2, _arg_1));
            };
        }

        public function set iSlot29(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985678iSlot29;
            if (_local_2 !== _arg_1)
            {
                this._1177985678iSlot29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot29", _local_2, _arg_1));
            };
        }

        private function dClickHandler(_arg_1:GameEvent):void
        {
            var _local_3:int;
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (((((_local_2) && (_local_2.slotData)) && (!(ToolKit.isEqual(_local_2.giid, -1)))) && (!(ToolKit.isEqual(_local_2.type, -1)))))
            {
                _local_3 = _local_2.slotData.sIndex;
                _core.remote.call("getSingleLotteryItem", null, _local_3);
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot7():ItemSlot
        {
            return (this._1208926448iSlot7);
        }

        public function set iSlot28(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985677iSlot28;
            if (_local_2 !== _arg_1)
            {
                this._1177985677iSlot28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot28", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iSlot9():ItemSlot
        {
            return (this._1208926446iSlot9);
        }

        public function ___LotteryBagPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get iSlot4():ItemSlot
        {
            return (this._1208926451iSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get iSlot5():ItemSlot
        {
            return (this._1208926450iSlot5);
        }

        public function set iSlot32(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985702iSlot32;
            if (_local_2 !== _arg_1)
            {
                this._1177985702iSlot32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot32", _local_2, _arg_1));
            };
        }

        public function reset():void
        {
            this.itemList = new ArrayCollection();
        }

        public function set iSlot34(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985704iSlot34;
            if (_local_2 !== _arg_1)
            {
                this._1177985704iSlot34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot34", _local_2, _arg_1));
            };
        }

        public function set iSlot31(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985701iSlot31;
            if (_local_2 !== _arg_1)
            {
                this._1177985701iSlot31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot31", _local_2, _arg_1));
            };
        }

        public function set iSlot35(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985705iSlot35;
            if (_local_2 !== _arg_1)
            {
                this._1177985705iSlot35 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot35", _local_2, _arg_1));
            };
        }

        public function set iSlot36(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985706iSlot36;
            if (_local_2 !== _arg_1)
            {
                this._1177985706iSlot36 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot36", _local_2, _arg_1));
            };
        }

        public function set iSlot33(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985703iSlot33;
            if (_local_2 !== _arg_1)
            {
                this._1177985703iSlot33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot33", _local_2, _arg_1));
            };
        }

        public function set iSlot37(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985707iSlot37;
            if (_local_2 !== _arg_1)
            {
                this._1177985707iSlot37 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot37", _local_2, _arg_1));
            };
        }

        public function set iSlot38(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985708iSlot38;
            if (_local_2 !== _arg_1)
            {
                this._1177985708iSlot38 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot38", _local_2, _arg_1));
            };
        }

        public function set iSlot30(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985700iSlot30;
            if (_local_2 !== _arg_1)
            {
                this._1177985700iSlot30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot30", _local_2, _arg_1));
            };
        }

        public function set iSlot39(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985709iSlot39;
            if (_local_2 !== _arg_1)
            {
                this._1177985709iSlot39 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot39", _local_2, _arg_1));
            };
        }

        public function set iSlot40(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985731iSlot40;
            if (_local_2 !== _arg_1)
            {
                this._1177985731iSlot40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot40", _local_2, _arg_1));
            };
        }

        public function set bagSort(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._344219194bagSort;
            if (_local_2 !== _arg_1)
            {
                this._344219194bagSort = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagSort", _local_2, _arg_1));
            };
        }

        public function set iSlot41(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985732iSlot41;
            if (_local_2 !== _arg_1)
            {
                this._1177985732iSlot41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot41", _local_2, _arg_1));
            };
        }

        public function set iSlot42(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985733iSlot42;
            if (_local_2 !== _arg_1)
            {
                this._1177985733iSlot42 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot42", _local_2, _arg_1));
            };
        }

        public function set iSlot46(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985737iSlot46;
            if (_local_2 !== _arg_1)
            {
                this._1177985737iSlot46 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot46", _local_2, _arg_1));
            };
        }

        public function set iSlot43(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985734iSlot43;
            if (_local_2 !== _arg_1)
            {
                this._1177985734iSlot43 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot43", _local_2, _arg_1));
            };
        }

        public function set iSlot47(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985738iSlot47;
            if (_local_2 !== _arg_1)
            {
                this._1177985738iSlot47 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot47", _local_2, _arg_1));
            };
        }

        public function enoughSlot(_arg_1:uint):Boolean
        {
            if (ToolKit.isBigOrEqual(max_slot, ToolKit.add(itemAC.length, _arg_1)))
            {
                return (true);
            };
            return (false);
        }

        public function set iSlot44(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985735iSlot44;
            if (_local_2 !== _arg_1)
            {
                this._1177985735iSlot44 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot44", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:LotteryBagPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LotteryBagPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_LotteryBagPanelWatcherSetupUtil");
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

        public function set iSlot48(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985739iSlot48;
            if (_local_2 !== _arg_1)
            {
                this._1177985739iSlot48 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot48", _local_2, _arg_1));
            };
        }

        public function set iSlot49(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985740iSlot49;
            if (_local_2 !== _arg_1)
            {
                this._1177985740iSlot49 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot49", _local_2, _arg_1));
            };
        }

        public function set iSlot45(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177985736iSlot45;
            if (_local_2 !== _arg_1)
            {
                this._1177985736iSlot45 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iSlot45", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bagSort():BasicGlowButton
        {
            return (this._344219194bagSort);
        }

        public function __bagSort_click(_arg_1:MouseEvent):void
        {
            lotteryBagSort();
        }


    }
}//package com.qeedoo.ui.view.compDragable

