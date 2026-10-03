// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MysTreDisplay

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.core.UIComponent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
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

    public class MysTreDisplay extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _875431037mysTreItem6:MysTreItem;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _875431042mysTreItem1:MysTreItem;
        private var _875431039mysTreItem4:MysTreItem;
        private var _875431041mysTreItem2:MysTreItem;
        private var _mysTreBookData:Object;
        private var mysAll:Array;
        private var _875431038mysTreItem5:MysTreItem;
        private var _875431040mysTreItem3:MysTreItem;
        public var _MysTreDisplay_Label1:Label;
        private var _kind:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":365,
                    "height":210,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"StandardTitle",
                                "mouseEnabled":false,
                                "y":4,
                                "width":160,
                                "height":15,
                                "mouseChildren":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_MysTreDisplay_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.textAlign = "center";
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"Danh Sách"});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MysTreItem,
                        "id":"mysTreItem1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":28
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MysTreItem,
                        "id":"mysTreItem4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":195,
                                "y":28
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MysTreItem,
                        "id":"mysTreItem2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":77
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MysTreItem,
                        "id":"mysTreItem5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":195,
                                "y":77
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MysTreItem,
                        "id":"mysTreItem3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":126
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MysTreItem,
                        "id":"mysTreItem6",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":195,
                                "y":126
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelectorOnly,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":108,
                                "changeCall":updatePage
                            });
                        }
                    })]
                });
            }
        });
        private var _dm:DataManager = DataManager.getInstance();
        private var _core:Core = Core.getInstance();
        private var mysArray:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MysTreDisplay()
        {
            mx_internal::_document = this;
            this.width = 365;
            this.height = 210;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___MysTreDisplay_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MysTreDisplay._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get mysTreItem3():MysTreItem
        {
            return (this._875431040mysTreItem3);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreItem4():MysTreItem
        {
            return (this._875431039mysTreItem4);
        }

        public function set mysTreItem4(_arg_1:MysTreItem):void
        {
            var _local_2:Object = this._875431039mysTreItem4;
            if (_local_2 !== _arg_1)
            {
                this._875431039mysTreItem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreItem4", _local_2, _arg_1));
            };
        }

        public function set mysTreItem5(_arg_1:MysTreItem):void
        {
            var _local_2:Object = this._875431038mysTreItem5;
            if (_local_2 !== _arg_1)
            {
                this._875431038mysTreItem5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreItem5", _local_2, _arg_1));
            };
        }

        public function set mysTreItem6(_arg_1:MysTreItem):void
        {
            var _local_2:Object = this._875431037mysTreItem6;
            if (_local_2 !== _arg_1)
            {
                this._875431037mysTreItem6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreItem6", _local_2, _arg_1));
            };
        }

        public function set mysTreItem3(_arg_1:MysTreItem):void
        {
            var _local_2:Object = this._875431040mysTreItem3;
            if (_local_2 !== _arg_1)
            {
                this._875431040mysTreItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreItem3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreItem5():MysTreItem
        {
            return (this._875431038mysTreItem5);
        }

        public function set mysTreItem2(_arg_1:MysTreItem):void
        {
            var _local_2:Object = this._875431041mysTreItem2;
            if (_local_2 !== _arg_1)
            {
                this._875431041mysTreItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreItem2", _local_2, _arg_1));
            };
        }

        public function updateView(_arg_1:Object):void
        {
            var _local_7:Number;
            var _local_8:Boolean;
            var _local_9:*;
            var _local_2:Number = mysArray.length;
            var _local_3:Number = (pageSelector.totalPage = Math.ceil((_local_2 / 6)));
            var _local_4:Number = pageSelector.curPage;
            var _local_5:Number = ((_local_4 - 1) * 6);
            var _local_6:int = 1;
            while (_local_6 <= 6)
            {
                if ((_local_5 + _local_6) > _local_2)
                {
                    (this[("mysTreItem" + _local_6)] as UIComponent).visible = false;
                }
                else
                {
                    _local_7 = ((mysArray[((_local_5 + _local_6) - 1)]) ? mysArray[((_local_5 + _local_6) - 1)]["id"] : 0);
                    if (!_local_7)
                    {
                        return;
                    };
                    _local_8 = false;
                    for each (_local_9 in _arg_1[_kind])
                    {
                        if (_local_9 == _local_7)
                        {
                            _local_8 = true;
                            break;
                        };
                    };
                    (this[("mysTreItem" + _local_6)] as MysTreItem).mysActived = _local_8;
                    (this[("mysTreItem" + _local_6)] as MysTreItem).mid = _local_7;
                    if (!(this[("mysTreItem" + _local_6)] as UIComponent).visible)
                    {
                        (this[("mysTreItem" + _local_6)] as UIComponent).visible = true;
                    };
                };
                _local_6++;
            };
        }

        public function init():void
        {
            var _local_1:Object;
            mysAll = (GameData.d[GamePredef.TBL_MYSTRE] as Array).slice(1);
            for each (_local_1 in mysAll)
            {
                if (_local_1["kind"] == _kind)
                {
                    mysArray.push(_local_1);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreItem6():MysTreItem
        {
            return (this._875431037mysTreItem6);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
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

        override public function initialize():void
        {
            var target:MysTreDisplay;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MysTreDisplay_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_MysTreDisplayWatcherSetupUtil");
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

        public function set kind(_arg_1:Number):void
        {
            _kind = _arg_1;
        }

        private function _MysTreDisplay_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function ___MysTreDisplay_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _MysTreDisplay_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _MysTreDisplay_Label1.filters = _arg_1;
            }, "_MysTreDisplay_Label1.filters");
            result[0] = binding;
            return (result);
        }

        public function set mysTreBookData(_arg_1:Object):void
        {
            _mysTreBookData = _arg_1;
            updateView(_arg_1);
        }

        public function updatePage():void
        {
            updateView(_mysTreBookData);
        }

        public function set mysTreItem1(_arg_1:MysTreItem):void
        {
            var _local_2:Object = this._875431042mysTreItem1;
            if (_local_2 !== _arg_1)
            {
                this._875431042mysTreItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreItem1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreItem1():MysTreItem
        {
            return (this._875431042mysTreItem1);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreItem2():MysTreItem
        {
            return (this._875431041mysTreItem2);
        }


    }
}//package com.qeedoo.ui.view.comp

