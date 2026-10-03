// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FriendCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.List;
    import mx.collections.ArrayCollection;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.events.FlexEvent;
    import mx.core.ClassFactory;
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

    public class FriendCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3322014list:List;
        private var _607339634pageSelector:PageSelector;
        private var _3642rl:RoundedLabel;
        private var _519914063_friendsFarmEnable:Boolean = false;
        public var _FriendCanvas_DelayButton1:DelayButton;
        private var _FriendsArr:ArrayCollection;
        private var MAX_PAGE_NUM:* = 10;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":150,
                    "height":270,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "5";
                            this.right = "5";
                            this.top = "10";
                            this.bottom = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":List,
                                    "id":"list",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "itemRenderer":_FriendCanvas_ClassFactory1_c()
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl",
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalCenter = "-5";
                                        this.horizontalCenter = "0";
                                        this.fontSize = 12;
                                    }
                                })]});
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelector,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                            this.left = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":120});
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"_FriendCanvas_DelayButton1",
                        "events":{"click":"___FriendCanvas_DelayButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":300000,
                                "width":19,
                                "height":21,
                                "styleName":"BtnChangeLine"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _1712717872_pageAc:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FriendCanvas()
        {
            mx_internal::_document = this;
            this.width = 150;
            this.height = 270;
            this.styleName = "CanvasBorder";
            this.addEventListener("creationComplete", ___FriendCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FriendCanvas._watcherSetupUtil = _arg_1;
        }


        private function _FriendCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _pageAc;
            _local_1 = _friendsFarmEnable;
            _local_1 = Language.FAZENDAPANEL_S[4];
            _local_1 = (!(_friendsFarmEnable));
            _local_1 = _friendsFarmEnable;
            _local_1 = Language.FAZENDAPANEL_S[15];
        }

        public function refreshFriendsData():void
        {
            _core.remote.getFriendFarm();
        }

        private function clearPage():void
        {
            _pageAc.removeAll();
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:FriendCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FriendCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FriendCanvasWatcherSetupUtil");
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

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get list():List
        {
            return (this._3322014list);
        }

        public function init():void
        {
        }

        private function set _friendsFarmEnable(_arg_1:Boolean):void
        {
            var _local_2:Object = this._519914063_friendsFarmEnable;
            if (_local_2 !== _arg_1)
            {
                this._519914063_friendsFarmEnable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_friendsFarmEnable", _local_2, _arg_1));
            };
        }

        public function onSteelMine(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:*;
            var _local_5:*;
            for (_local_4 in _FriendsArr)
            {
                if (_FriendsArr[_local_4].farm.cid == _arg_2)
                {
                    for (_local_5 in _FriendsArr[_local_4].mine)
                    {
                        if (_local_5 == _arg_1)
                        {
                            _FriendsArr[_local_4].mine[_local_5].num = (_FriendsArr[_local_4].mine[_local_5].num - _arg_3);
                            break;
                        };
                    };
                };
            };
        }

        public function ___FriendCanvas_DelayButton1_click(_arg_1:MouseEvent):void
        {
            refreshFriendsData();
        }

        [Bindable(event="propertyChange")]
        private function get _pageAc():ArrayCollection
        {
            return (this._1712717872_pageAc);
        }

        public function initFriendsData(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:Sort;
            if (_arg_1)
            {
                _FriendsArr = new ArrayCollection();
                for (_local_2 in _arg_1)
                {
                    if (_arg_1[_local_2])
                    {
                        _FriendsArr.addItem(_arg_1[_local_2]);
                    };
                };
                _local_3 = new Sort();
                _local_3.fields = [new SortField("st", true, true)];
                _FriendsArr.sort = _local_3;
                _FriendsArr.refresh();
                initPageSelector();
                _friendsFarmEnable = true;
            }
            else
            {
                _friendsFarmEnable = false;
            };
        }

        public function updateSingleFriendData(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            for (_local_2 in _FriendsArr)
            {
                if (_FriendsArr[_local_2].farm.cid == _arg_1.farm.cid)
                {
                    _FriendsArr[_local_2].farm = _arg_1.farm;
                    _FriendsArr[_local_2].mine = _arg_1.mine;
                    if (_arg_1.icon)
                    {
                        _FriendsArr[_local_2].icon = _arg_1.icon;
                    };
                    if (_arg_1.lv)
                    {
                        _FriendsArr[_local_2].lv = _arg_1.lv;
                    };
                    break;
                };
            };
            for (_local_3 in _pageAc)
            {
                if (_pageAc[_local_3].farm.cid == _arg_1.farm.cid)
                {
                    _pageAc[_local_3].farm = _arg_1.farm;
                    _pageAc[_local_3].mine = _arg_1.mine;
                    if (_arg_1.icon)
                    {
                        _FriendsArr[_local_3].icon = _arg_1.icon;
                    };
                    if (_arg_1.lv)
                    {
                        _FriendsArr[_local_3].lv = _arg_1.lv;
                    };
                    break;
                };
            };
            list.dataProvider = _pageAc;
        }

        [Bindable(event="propertyChange")]
        public function get rl():RoundedLabel
        {
            return (this._3642rl);
        }

        public function set list(_arg_1:List):void
        {
            var _local_2:Object = this._3322014list;
            if (_local_2 !== _arg_1)
            {
                this._3322014list = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "list", _local_2, _arg_1));
            };
        }

        private function initPageSelector():void
        {
            var _local_1:int;
            pageSelector.lastBtnLabel = "";
            pageSelector.nextBtnLabel = "";
            pageSelector.btnLastPage.width = 13;
            pageSelector.btnNextPage.width = 13;
            pageSelector.setLastBtnStyle("fazendaPageLast");
            pageSelector.setNextBtnStyle("fazendaPageNext");
            if (_FriendsArr.length >= MAX_PAGE_NUM)
            {
                _local_1 = MAX_PAGE_NUM;
            }
            else
            {
                _local_1 = _FriendsArr.length;
            };
            _pageAc.removeAll();
            var _local_2:int;
            while (_local_2 < _local_1)
            {
                _pageAc.addItem(_FriendsArr.getItemAt(_local_2));
                _local_2++;
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(_FriendsArr.length, MAX_PAGE_NUM);
        }

        public function ___FriendCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                _pageAc.addItem(_FriendsArr.getItemAt(_local_3));
                _local_4++;
            };
        }

        public function reset():void
        {
            _friendsFarmEnable = false;
        }

        [Bindable(event="propertyChange")]
        private function get _friendsFarmEnable():Boolean
        {
            return (this._519914063_friendsFarmEnable);
        }

        private function _FriendCanvas_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = FriendsBar;
            return (_local_1);
        }

        private function set _pageAc(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1712717872_pageAc;
            if (_local_2 !== _arg_1)
            {
                this._1712717872_pageAc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_pageAc", _local_2, _arg_1));
            };
        }

        private function _FriendCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (_pageAc);
            }, function (_arg_1:Object):void
            {
                list.dataProvider = _arg_1;
            }, "list.dataProvider");
            result[0] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_friendsFarmEnable);
            }, function (_arg_1:Boolean):void
            {
                list.visible = _arg_1;
            }, "list.visible");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDAPANEL_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rl.text = _arg_1;
            }, "rl.text");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_friendsFarmEnable));
            }, function (_arg_1:Boolean):void
            {
                rl.visible = _arg_1;
            }, "rl.visible");
            result[3] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_friendsFarmEnable);
            }, function (_arg_1:Boolean):void
            {
                pageSelector.visible = _arg_1;
            }, "pageSelector.visible");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDAPANEL_S[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FriendCanvas_DelayButton1.toolTip = _arg_1;
            }, "_FriendCanvas_DelayButton1.toolTip");
            result[5] = binding;
            return (result);
        }

        public function set rl(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3642rl;
            if (_local_2 !== _arg_1)
            {
                this._3642rl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

