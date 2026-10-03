// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PRSChipBag

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
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

    public class PRSChipBag extends Canvas implements IBindingClient 
    {

        private static const PAGE_NUM:uint = 10;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _243079997chipBagSlot7:PRSSlot;
        private var _243079999chipBagSlot9:PRSSlot;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _curPage:int = 1;
        public var _PRSChipBag_Label1:Label;
        private var _1054454823chipBagSlot10:PRSSlot;
        private var _chipBag:Object;
        private var _243079992chipBagSlot2:PRSSlot;
        private var _243079994chipBagSlot4:PRSSlot;
        private var _243079991chipBagSlot1:PRSSlot;
        private var _243079996chipBagSlot6:PRSSlot;
        private var _totalPage:int;
        private var _243079993chipBagSlot3:PRSSlot;
        private var _243079998chipBagSlot8:PRSSlot;
        private var _243079995chipBagSlot5:PRSSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":315,
                    "height":185,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PRSChipBag_Label1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":127,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":130,
                                "height":1,
                                "x":92.5,
                                "y":32
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":1,
                                "x":55,
                                "y":57
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":2,
                                "x":97,
                                "y":57
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":3,
                                "x":138.5,
                                "y":57
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":4,
                                "x":180.5,
                                "y":57
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":5,
                                "x":222.5,
                                "y":57
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot6",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":6,
                                "x":55,
                                "y":96
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot7",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":7,
                                "x":97,
                                "y":96
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot8",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":8,
                                "x":138.5,
                                "y":96
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot9",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":9,
                                "x":180.5,
                                "y":96
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PRSSlot,
                        "id":"chipBagSlot10",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "chipBagPos":10,
                                "x":223.5,
                                "y":96
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelectorOnly,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":147,
                                "changeCall":updatePage
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PRSChipBag()
        {
            mx_internal::_document = this;
            this.width = 315;
            this.height = 185;
            this.styleName = "CanvasBorder";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PRSChipBag._watcherSetupUtil = _arg_1;
        }


        public function set chipBagSlot7(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._243079997chipBagSlot7;
            if (_local_2 !== _arg_1)
            {
                this._243079997chipBagSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot7", _local_2, _arg_1));
            };
        }

        public function set chipBagSlot5(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._243079995chipBagSlot5;
            if (_local_2 !== _arg_1)
            {
                this._243079995chipBagSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot5", _local_2, _arg_1));
            };
        }

        public function set chipBagSlot2(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._243079992chipBagSlot2;
            if (_local_2 !== _arg_1)
            {
                this._243079992chipBagSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot2", _local_2, _arg_1));
            };
        }

        public function set chipBagSlot4(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._243079994chipBagSlot4;
            if (_local_2 !== _arg_1)
            {
                this._243079994chipBagSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:PRSChipBag;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PRSChipBag_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PRSChipBagWatcherSetupUtil");
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

        public function set chipBagSlot6(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._243079996chipBagSlot6;
            if (_local_2 !== _arg_1)
            {
                this._243079996chipBagSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot6", _local_2, _arg_1));
            };
        }

        public function set pageSelector(_arg_1:PageSelectorOnly):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        public function set chipBagSlot10(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._1054454823chipBagSlot10;
            if (_local_2 !== _arg_1)
            {
                this._1054454823chipBagSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot1():PRSSlot
        {
            return (this._243079991chipBagSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot2():PRSSlot
        {
            return (this._243079992chipBagSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot3():PRSSlot
        {
            return (this._243079993chipBagSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot6():PRSSlot
        {
            return (this._243079996chipBagSlot6);
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot7():PRSSlot
        {
            return (this._243079997chipBagSlot7);
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot8():PRSSlot
        {
            return (this._243079998chipBagSlot8);
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot9():PRSSlot
        {
            return (this._243079999chipBagSlot9);
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot4():PRSSlot
        {
            return (this._243079994chipBagSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot5():PRSSlot
        {
            return (this._243079995chipBagSlot5);
        }

        private function _PRSChipBag_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PRS_PANEL[18];
        }

        [Bindable(event="propertyChange")]
        public function get chipBagSlot10():PRSSlot
        {
            return (this._1054454823chipBagSlot10);
        }

        public function set chipBagSlot1(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._243079991chipBagSlot1;
            if (_local_2 !== _arg_1)
            {
                this._243079991chipBagSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot1", _local_2, _arg_1));
            };
        }

        public function updatePage(_arg_1:Object):void
        {
            var _local_3:Number;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:PRSSlot;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Object;
            var _local_2:* = 0;
            _chipBag = _arg_1;
            if (_chipBag)
            {
                for (_local_5 in _chipBag)
                {
                    _local_2++;
                };
            };
            _totalPage = (pageSelector.totalPage = Math.ceil((_local_2 / PAGE_NUM)));
            _curPage = pageSelector.curPage;
            _local_3 = ((_curPage - 1) * PAGE_NUM);
            _local_4 = 1;
            while (_local_4 <= PAGE_NUM)
            {
                _local_6 = (this[("chipBagSlot" + _local_4)] as PRSSlot);
                _local_6.slotType = Slot.SLOT_PRS_CHIPBAG;
                _local_6.clean();
                if (_chipBag[(_local_3 + _local_4)])
                {
                    _local_7 = _chipBag[(_local_3 + _local_4)]["chipId"];
                    _local_8 = _chipBag[(_local_3 + _local_4)]["chipNum"];
                    _local_9 = GameData.d[GamePredef.TBL_PRS_CHIP][_local_7];
                    _local_6.type = GamePredef.TBL_PRS_CHIP;
                    _local_6.giid = _local_7;
                    _local_6.slotData = _local_9;
                    _local_6.stackNum = _local_8;
                    _local_6.chipBagPos = (_local_3 + _local_4);
                };
                _local_4++;
            };
        }

        public function set chipBagSlot3(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._243079993chipBagSlot3;
            if (_local_2 !== _arg_1)
            {
                this._243079993chipBagSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot3", _local_2, _arg_1));
            };
        }

        private function _PRSChipBag_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRS_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PRSChipBag_Label1.text = _arg_1;
            }, "_PRSChipBag_Label1.text");
            result[0] = binding;
            return (result);
        }

        public function set chipBagSlot8(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._243079998chipBagSlot8;
            if (_local_2 !== _arg_1)
            {
                this._243079998chipBagSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot8", _local_2, _arg_1));
            };
        }

        public function set chipBagSlot9(_arg_1:PRSSlot):void
        {
            var _local_2:Object = this._243079999chipBagSlot9;
            if (_local_2 !== _arg_1)
            {
                this._243079999chipBagSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipBagSlot9", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

