// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MysTreBag

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Tile;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
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

    public class MysTreBag extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var clickCall:Function;
        private var _1335219303clickSlot23:ClickSlot;
        private var _788212405clickSlot1:ClickSlot;
        public var _MysTreBag_BasicDelayButton1:BasicDelayButton;
        private var _788212401clickSlot5:ClickSlot;
        private var _1335219271clickSlot12:ClickSlot;
        private var _179436332_itemDic:Object;
        private var _1335219306clickSlot26:ClickSlot;
        private var _788212398clickSlot8:ClickSlot;
        private var _1335219274clickSlot15:ClickSlot;
        private var _1335219301clickSlot21:ClickSlot;
        private var _1335219309clickSlot29:ClickSlot;
        private var _788212404clickSlot2:ClickSlot;
        private var _1335219277clickSlot18:ClickSlot;
        private var _788212400clickSlot6:ClickSlot;
        private var _1335219304clickSlot24:ClickSlot;
        private var _788212397clickSlot9:ClickSlot;
        private var _1335219272clickSlot13:ClickSlot;
        private var _1335219269clickSlot10:ClickSlot;
        private var _1335219307clickSlot27:ClickSlot;
        private var _788212403clickSlot3:ClickSlot;
        private var _1335219275clickSlot16:ClickSlot;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _1335219302clickSlot22:ClickSlot;
        private var _1335219270clickSlot11:ClickSlot;
        private var _1335219278clickSlot19:ClickSlot;
        private var _1335219305clickSlot25:ClickSlot;
        private var _788212402clickSlot4:ClickSlot;
        private var _1335219273clickSlot14:ClickSlot;
        private var _mysTreBagData:Object;
        private var _1335219308clickSlot28:ClickSlot;
        private var _1335219331clickSlot30:ClickSlot;
        private var _1335219300clickSlot20:ClickSlot;
        private var _788212399clickSlot7:ClickSlot;
        private var _1335219276clickSlot17:ClickSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":225,
                    "height":248,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Tile,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 4;
                            this.verticalGap = 6;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":224,
                                "height":196,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot12",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot13",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot14",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot15",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot16",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot17",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot18",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot19",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot20",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot21",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot22",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot23",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot24",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot25",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot26",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot27",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot28",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot29",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ClickSlot,
                                    "id":"clickSlot30",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "clickCall":clickHandler
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelectorOnly,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "29";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":38,
                                "changeCall":updatePage
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"_MysTreBag_BasicDelayButton1",
                        "events":{"click":"___MysTreBag_BasicDelayButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "x":84.5,
                                "y":220
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

        public function MysTreBag()
        {
            mx_internal::_document = this;
            this.width = 225;
            this.height = 248;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MysTreBag._watcherSetupUtil = _arg_1;
        }


        public function set clickSlot30(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219331clickSlot30;
            if (_local_2 !== _arg_1)
            {
                this._1335219331clickSlot30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot30", _local_2, _arg_1));
            };
        }

        public function updateView():void
        {
            var _local_2:*;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:ClickSlot;
            var _local_8:Object;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Object;
            var _local_1:int;
            for (_local_2 in _mysTreBagData)
            {
                _local_1++;
            };
            _local_3 = (pageSelector.totalPage = Math.ceil((_local_1 / 30)));
            _local_4 = pageSelector.curPage;
            _local_5 = ((_local_4 - 1) * 30);
            _local_6 = 1;
            while (_local_6 <= 30)
            {
                _local_7 = (this[("clickSlot" + _local_6)] as ClickSlot);
                _local_8 = _mysTreBagData[(_local_6 + _local_5)];
                _local_7.clean();
                if (_local_8)
                {
                    _local_9 = _local_8["mid"];
                    _local_10 = _local_8["num"];
                    _local_11 = GameData.d[GamePredef.TBL_MYSTRE][_local_9];
                    _local_7.slotData = _local_11;
                    _local_7.quality = (int(_local_11["level"]) - 1);
                    _local_7.type = GamePredef.TBL_MYSTRE;
                    _local_7.giid = _local_9;
                    _local_7.stackNum = _local_10;
                };
                _local_6++;
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

        private function _MysTreBag_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[111];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MysTreBag_BasicDelayButton1.label = _arg_1;
            }, "_MysTreBag_BasicDelayButton1.label");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        private function get _itemDic():Object
        {
            return (this._179436332_itemDic);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot10():ClickSlot
        {
            return (this._1335219269clickSlot10);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot11():ClickSlot
        {
            return (this._1335219270clickSlot11);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot12():ClickSlot
        {
            return (this._1335219271clickSlot12);
        }

        public function clean():void
        {
            _itemDic = null;
            var _local_1:int = 1;
            while (_local_1 <= 30)
            {
                this[("clickSlot" + _local_1)].clean();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot1():ClickSlot
        {
            return (this._788212405clickSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot17():ClickSlot
        {
            return (this._1335219276clickSlot17);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot18():ClickSlot
        {
            return (this._1335219277clickSlot18);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot19():ClickSlot
        {
            return (this._1335219278clickSlot19);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot15():ClickSlot
        {
            return (this._1335219274clickSlot15);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot2():ClickSlot
        {
            return (this._788212404clickSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot4():ClickSlot
        {
            return (this._788212402clickSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot5():ClickSlot
        {
            return (this._788212401clickSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot16():ClickSlot
        {
            return (this._1335219275clickSlot16);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot3():ClickSlot
        {
            return (this._788212403clickSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot13():ClickSlot
        {
            return (this._1335219272clickSlot13);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot14():ClickSlot
        {
            return (this._1335219273clickSlot14);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot9():ClickSlot
        {
            return (this._788212397clickSlot9);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot21():ClickSlot
        {
            return (this._1335219301clickSlot21);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot22():ClickSlot
        {
            return (this._1335219302clickSlot22);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot23():ClickSlot
        {
            return (this._1335219303clickSlot23);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot26():ClickSlot
        {
            return (this._1335219306clickSlot26);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot28():ClickSlot
        {
            return (this._1335219308clickSlot28);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot29():ClickSlot
        {
            return (this._1335219309clickSlot29);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot24():ClickSlot
        {
            return (this._1335219304clickSlot24);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot25():ClickSlot
        {
            return (this._1335219305clickSlot25);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot8():ClickSlot
        {
            return (this._788212398clickSlot8);
        }

        public function get itemDic():Object
        {
            return (_itemDic);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot20():ClickSlot
        {
            return (this._1335219300clickSlot20);
        }

        public function ___MysTreBag_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            selecteAll();
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot7():ClickSlot
        {
            return (this._788212399clickSlot7);
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot27():ClickSlot
        {
            return (this._1335219307clickSlot27);
        }

        private function set _itemDic(_arg_1:Object):void
        {
            var _local_2:Object = this._179436332_itemDic;
            if (_local_2 !== _arg_1)
            {
                this._179436332_itemDic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_itemDic", _local_2, _arg_1));
            };
        }

        public function set clickSlot10(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219269clickSlot10;
            if (_local_2 !== _arg_1)
            {
                this._1335219269clickSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot10", _local_2, _arg_1));
            };
        }

        public function set clickSlot11(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219270clickSlot11;
            if (_local_2 !== _arg_1)
            {
                this._1335219270clickSlot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot11", _local_2, _arg_1));
            };
        }

        public function set clickSlot12(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219271clickSlot12;
            if (_local_2 !== _arg_1)
            {
                this._1335219271clickSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot12", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:MysTreBag;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MysTreBag_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_MysTreBagWatcherSetupUtil");
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
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        public function set clickSlot18(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219277clickSlot18;
            if (_local_2 !== _arg_1)
            {
                this._1335219277clickSlot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot18", _local_2, _arg_1));
            };
        }

        public function set clickSlot15(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219274clickSlot15;
            if (_local_2 !== _arg_1)
            {
                this._1335219274clickSlot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot15", _local_2, _arg_1));
            };
        }

        public function set clickSlot19(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219278clickSlot19;
            if (_local_2 !== _arg_1)
            {
                this._1335219278clickSlot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot19", _local_2, _arg_1));
            };
        }

        public function set clickSlot1(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._788212405clickSlot1;
            if (_local_2 !== _arg_1)
            {
                this._788212405clickSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot1", _local_2, _arg_1));
            };
        }

        public function set clickSlot5(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._788212401clickSlot5;
            if (_local_2 !== _arg_1)
            {
                this._788212401clickSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot5", _local_2, _arg_1));
            };
        }

        public function set clickSlot6(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._788212400clickSlot6;
            if (_local_2 !== _arg_1)
            {
                this._788212400clickSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot6", _local_2, _arg_1));
            };
        }

        public function clickHandler(_arg_1:ClickSlot):void
        {
            var _local_2:int;
            var _local_3:Object;
            if (!_itemDic)
            {
                _itemDic = {};
            };
            if (_arg_1.slotData)
            {
                _local_2 = int(_arg_1.id.substr(9));
                _local_2 = (((pageSelector.curPage - 1) * 30) + _local_2);
                if (!_itemDic[_local_2])
                {
                    _local_3 = {};
                    _local_3["mid"] = _arg_1.giid;
                    _local_3["num"] = _arg_1.stackNum;
                    _itemDic[_local_2] = _local_3;
                }
                else
                {
                    delete _itemDic[_local_2];
                };
                ((clickCall) && (clickCall()));
            };
        }

        public function set clickSlot4(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._788212402clickSlot4;
            if (_local_2 !== _arg_1)
            {
                this._788212402clickSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot4", _local_2, _arg_1));
            };
        }

        public function set clickSlot16(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219275clickSlot16;
            if (_local_2 !== _arg_1)
            {
                this._1335219275clickSlot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot16", _local_2, _arg_1));
            };
        }

        public function set clickSlot17(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219276clickSlot17;
            if (_local_2 !== _arg_1)
            {
                this._1335219276clickSlot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot17", _local_2, _arg_1));
            };
        }

        public function set clickSlot3(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._788212403clickSlot3;
            if (_local_2 !== _arg_1)
            {
                this._788212403clickSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot3", _local_2, _arg_1));
            };
        }

        public function set clickSlot9(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._788212397clickSlot9;
            if (_local_2 !== _arg_1)
            {
                this._788212397clickSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot9", _local_2, _arg_1));
            };
        }

        public function set clickSlot2(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._788212404clickSlot2;
            if (_local_2 !== _arg_1)
            {
                this._788212404clickSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot2", _local_2, _arg_1));
            };
        }

        public function set clickSlot7(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._788212399clickSlot7;
            if (_local_2 !== _arg_1)
            {
                this._788212399clickSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot7", _local_2, _arg_1));
            };
        }

        public function set mysTreBagData(_arg_1:Object):void
        {
            _mysTreBagData = _arg_1;
        }

        private function _MysTreBag_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DECORATE_PANEL[111];
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot30():ClickSlot
        {
            return (this._1335219331clickSlot30);
        }

        public function set clickSlot14(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219273clickSlot14;
            if (_local_2 !== _arg_1)
            {
                this._1335219273clickSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get clickSlot6():ClickSlot
        {
            return (this._788212400clickSlot6);
        }

        public function set clickSlot8(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._788212398clickSlot8;
            if (_local_2 !== _arg_1)
            {
                this._788212398clickSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot8", _local_2, _arg_1));
            };
        }

        public function set clickSlot21(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219301clickSlot21;
            if (_local_2 !== _arg_1)
            {
                this._1335219301clickSlot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot21", _local_2, _arg_1));
            };
        }

        public function set clickSlot23(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219303clickSlot23;
            if (_local_2 !== _arg_1)
            {
                this._1335219303clickSlot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot23", _local_2, _arg_1));
            };
        }

        public function set clickSlot20(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219300clickSlot20;
            if (_local_2 !== _arg_1)
            {
                this._1335219300clickSlot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot20", _local_2, _arg_1));
            };
        }

        public function set clickSlot26(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219306clickSlot26;
            if (_local_2 !== _arg_1)
            {
                this._1335219306clickSlot26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot26", _local_2, _arg_1));
            };
        }

        public function set clickSlot13(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219272clickSlot13;
            if (_local_2 !== _arg_1)
            {
                this._1335219272clickSlot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot13", _local_2, _arg_1));
            };
        }

        public function set clickSlot28(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219308clickSlot28;
            if (_local_2 !== _arg_1)
            {
                this._1335219308clickSlot28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot28", _local_2, _arg_1));
            };
        }

        public function set clickSlot22(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219302clickSlot22;
            if (_local_2 !== _arg_1)
            {
                this._1335219302clickSlot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot22", _local_2, _arg_1));
            };
        }

        public function set clickSlot27(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219307clickSlot27;
            if (_local_2 !== _arg_1)
            {
                this._1335219307clickSlot27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot27", _local_2, _arg_1));
            };
        }

        public function set clickSlot25(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219305clickSlot25;
            if (_local_2 !== _arg_1)
            {
                this._1335219305clickSlot25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot25", _local_2, _arg_1));
            };
        }

        public function updatePage():void
        {
            clean();
            updateView();
            ((clickCall) && (clickCall()));
        }

        public function set clickSlot29(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219309clickSlot29;
            if (_local_2 !== _arg_1)
            {
                this._1335219309clickSlot29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot29", _local_2, _arg_1));
            };
        }

        public function set clickSlot24(_arg_1:ClickSlot):void
        {
            var _local_2:Object = this._1335219304clickSlot24;
            if (_local_2 !== _arg_1)
            {
                this._1335219304clickSlot24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSlot24", _local_2, _arg_1));
            };
        }

        public function selecteAll():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 30)
            {
                if (this[("clickSlot" + _local_1)].slotData)
                {
                    (this[("clickSlot" + _local_1)] as ClickSlot).fakeClick();
                };
                _local_1++;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

