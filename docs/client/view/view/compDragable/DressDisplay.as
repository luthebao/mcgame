// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DressDisplay

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.PageSelectorOnly;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.event.DressEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.ui.utils.LanguageUtil;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.net.Responder;
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

    public class DressDisplay extends Canvas implements IBindingClient 
    {

        public static const TYPE_DRESS:int = 1;
        public static const TYPE_FLYER:int = 2;
        private static const PAGE_NUM:int = 4;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _dressArray:Array;
        public var activeCall:Function;
        private var _selectId:Number;
        private var _85641336dressItem2:DressItem;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _85641338dressItem0:DressItem;
        public var dressCall:Function;
        private var _showType:int;
        private var _199059875gainBtn:BasicDelayButton;
        private var _1870010120titleTxt:Label;
        private var _85641335dressItem3:DressItem;
        private var _204464502activeBtn:BasicDelayButton;
        private var _85641337dressItem1:DressItem;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":345,
                    "height":150,
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
                                    "id":"titleTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.textAlign = "center";
                                        this.horizontalCenter = "0";
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DressItem,
                        "id":"dressItem0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DressItem,
                        "id":"dressItem1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":175,
                                "y":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DressItem,
                        "id":"dressItem2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":70
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DressItem,
                        "id":"dressItem3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":175,
                                "y":70
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
                                "x":15,
                                "changeCall":updatePage
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"activeBtn",
                        "events":{"click":"__activeBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":30000,
                                "styleName":"BtnStdGreen",
                                "x":190,
                                "y":120,
                                "width":60,
                                "height":23
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"gainBtn",
                        "events":{"click":"__gainBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":30000,
                                "styleName":"BtnStdGreen",
                                "x":260,
                                "y":120,
                                "height":23
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

        public function DressDisplay()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasBorder";
            this.width = 345;
            this.height = 150;
            this.addEventListener("creationComplete", ___DressDisplay_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DressDisplay._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get dressItem0():DressItem
        {
            return (this._85641338dressItem0);
        }

        [Bindable(event="propertyChange")]
        public function get dressItem1():DressItem
        {
            return (this._85641337dressItem1);
        }

        [Bindable(event="propertyChange")]
        public function get dressItem3():DressItem
        {
            return (this._85641335dressItem3);
        }

        public function set dressItem0(_arg_1:DressItem):void
        {
            var _local_2:Object = this._85641338dressItem0;
            if (_local_2 !== _arg_1)
            {
                this._85641338dressItem0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dressItem0", _local_2, _arg_1));
            };
        }

        private function cleanView():void
        {
            var _local_2:DressItem;
            _showType = 0;
            _selectId = null;
            _dressArray = null;
            var _local_1:int;
            while (_local_1 < PAGE_NUM)
            {
                _local_2 = this[("dressItem" + _local_1)];
                _local_2.cleanView();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get dressItem2():DressItem
        {
            return (this._85641336dressItem2);
        }

        private function dressHandler(_arg_1:DressEvent):void
        {
            var _local_4:DressItem;
            if (!(_arg_1.target is DressItem))
            {
                return;
            };
            var _local_2:DressItem = (_arg_1.target as DressItem);
            if (!_local_2.dressId)
            {
                return;
            };
            _selectId = _local_2.dressId;
            var _local_3:int;
            while (_local_3 < PAGE_NUM)
            {
                _local_4 = this[("dressItem" + _local_3)];
                _local_4.selected = (_local_4.dressId == _selectId);
                _local_3++;
            };
            updateButtonText();
            ((dressCall) && (dressCall()));
        }

        public function updateView(_arg_1:int):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:int;
            var _local_7:Object;
            var _local_8:*;
            if (!this.initialized)
            {
                this.callLater(updateView, [_arg_1]);
                return;
            };
            _showType = _arg_1;
            var _local_2:int = ((_arg_1 == TYPE_DRESS) ? 6 : 7);
            gainBtn.label = Language.DRESS_PANEL[_local_2];
            activeBtn.label = Language.DRESS_PANEL[5];
            _dressArray = [];
            _local_3 = GameData.d[GamePredef.TBL_DRESS];
            for each (_local_4 in _local_3)
            {
                (((_local_4.type == _showType) && (_local_4.isOpen == 1)) && (_dressArray.push(_local_4)));
            };
            _dressArray.sortOn("position", Array.NUMERIC);
            pageSelector.totalPage = Math.ceil((_dressArray.length / PAGE_NUM));
            this.updatePage();
            _local_5 = 0;
            if (_core.player.dressInfo)
            {
                _local_3 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((_local_3) && (_local_3.book)))
                {
                    _local_7 = _local_3.book;
                    for (_local_8 in _local_7)
                    {
                        _local_4 = GameData.d[GamePredef.TBL_DRESS][_local_8];
                        if ((((_local_4) && (_local_4.type == _showType)) && (_local_4.isOpen == 1)))
                        {
                            _local_5++;
                        };
                    };
                };
            };
            var _local_6:int = ((_arg_1 == TYPE_DRESS) ? 3 : 4);
            titleTxt.text = LanguageUtil.replace(Language.DRESS_PANEL[_local_6], {
                "activeNum":_local_5,
                "totalNum":_dressArray.length
            });
            updateButtonText();
        }

        override public function initialize():void
        {
            var target:DressDisplay;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DressDisplay_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DressDisplayWatcherSetupUtil");
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

        public function set activeBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._204464502activeBtn;
            if (_local_2 !== _arg_1)
            {
                this._204464502activeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeBtn", _local_2, _arg_1));
            };
        }

        private function _DressDisplay_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                titleTxt.filters = _arg_1;
            }, "titleTxt.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                activeBtn.filters = _arg_1;
            }, "activeBtn.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                gainBtn.filters = _arg_1;
            }, "gainBtn.filters");
            result[2] = binding;
            return (result);
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

        public function __activeBtn_click(_arg_1:MouseEvent):void
        {
            activeHandler(_arg_1);
        }

        public function set dressItem3(_arg_1:DressItem):void
        {
            var _local_2:Object = this._85641335dressItem3;
            if (_local_2 !== _arg_1)
            {
                this._85641335dressItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dressItem3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get titleTxt():Label
        {
            return (this._1870010120titleTxt);
        }

        public function set dressItem1(_arg_1:DressItem):void
        {
            var _local_2:Object = this._85641337dressItem1;
            if (_local_2 !== _arg_1)
            {
                this._85641337dressItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dressItem1", _local_2, _arg_1));
            };
        }

        public function updateButtonText():void
        {
            var _local_1:Object;
            var _local_2:Object;
            if (_core.player.dressInfo)
            {
                _local_1 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((_local_1) && (_local_1.book)))
                {
                    _local_2 = _local_1.book;
                    if (!_selectId)
                    {
                        _selectId = _dressArray[0].id;
                    };
                    if (_local_2[_selectId])
                    {
                        activeBtn.label = "Hình ảnh ảo hoá";
                    }
                    else
                    {
                        activeBtn.label = Language.DRESS_PANEL[5];
                    };
                    if (((_local_1.fakeDressId == _selectId) || (_local_1.fakeFlyDressId == _selectId)))
                    {
                        activeBtn.label = "Bỏ ảo hoa";
                    };
                };
            };
        }

        private function _DressDisplay_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        public function set dressItem2(_arg_1:DressItem):void
        {
            var _local_2:Object = this._85641336dressItem2;
            if (_local_2 !== _arg_1)
            {
                this._85641336dressItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dressItem2", _local_2, _arg_1));
            };
        }

        public function get selectId():Number
        {
            return (_selectId);
        }

        private function onComplete(_arg_1:Event):void
        {
            this.addEventListener(DressEvent.DRESS_CLICK, dressHandler);
        }

        public function set gainBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._199059875gainBtn;
            if (_local_2 !== _arg_1)
            {
                this._199059875gainBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gainBtn", _local_2, _arg_1));
            };
        }

        public function __gainBtn_click(_arg_1:MouseEvent):void
        {
            receiveHandler(_arg_1);
        }

        private function activeHandler(event:Event):void
        {
            var dressDict:Object;
            var dressBook:Object;
            var dressId:Number;
            var dressMeta:Object;
            var cb:Function;
            var suitMeta:Object;
            var resCode:Number;
            var flyerMeta:Object;
            event.stopImmediatePropagation();
            if (!_selectId)
            {
                return;
            };
            if (_core.player.dressInfo)
            {
                dressDict = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((dressDict) && (dressDict.book)))
                {
                    dressBook = dressDict.book;
                    if (dressBook[_selectId])
                    {
                        dressId = _selectId;
                        dressMeta = GameData.d[GamePredef.TBL_DRESS][dressId];
                        if (!dressMeta)
                        {
                            return;
                        };
                        cb = function (_arg_1:String=null):void
                        {
                            if (_arg_1 == null)
                            {
                                return;
                            };
                            DressLogic.updateDressInfo(_arg_1);
                            updateButtonText();
                        };
                        if (dressMeta.type == TYPE_DRESS)
                        {
                            suitMeta = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][dressMeta.equiptId];
                            if (!suitMeta)
                            {
                                return;
                            };
                            resCode = ((_core.player.gender == 0) ? suitMeta.resCodeMale : suitMeta.resCodeFemale);
                            if (((activeBtn.label == "Bỏ ảo hoa") && (dressDict.fakeDressId == dressId)))
                            {
                                _core.remote.call("unsetFakeDress", new Responder(cb), dressId, resCode);
                            }
                            else
                            {
                                _core.remote.call("setFakeDress", new Responder(cb), dressId, resCode);
                            };
                        }
                        else
                        {
                            flyerMeta = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][dressMeta.equiptId];
                            if (!flyerMeta)
                            {
                                return;
                            };
                            if (((activeBtn.label == "Bỏ ảo hoa") && (dressDict.fakeFlyDressId == dressId)))
                            {
                                _core.remote.call("unsetFakeFlyerDress", new Responder(cb), dressId, flyerMeta.resCode, flyerMeta.wavCode);
                            }
                            else
                            {
                                _core.remote.call("setFakeFlyerDress", new Responder(cb), dressId, flyerMeta.resCode, flyerMeta.wavCode);
                            };
                        };
                        return;
                    };
                };
            };
            ((activeCall) && (activeCall(_selectId)));
        }

        private function receiveHandler(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            _arg_1.stopImmediatePropagation();
            if (!_selectId)
            {
                return;
            };
            if (_core.player.dressInfo)
            {
                _local_2 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((_local_2) && (_local_2.book)))
                {
                    _local_3 = _local_2.book;
                    if (_local_3[_selectId])
                    {
                        _core.remote.call("recieveGoods", null, _selectId);
                        return;
                    };
                };
            };
            _core.sysMidNote(Language.DRESS_PANEL[35]);
        }

        public function set titleTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1870010120titleTxt;
            if (_local_2 !== _arg_1)
            {
                this._1870010120titleTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleTxt", _local_2, _arg_1));
            };
        }

        public function ___DressDisplay_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            onComplete(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get gainBtn():BasicDelayButton
        {
            return (this._199059875gainBtn);
        }

        private function updatePage():void
        {
            var _local_4:int;
            var _local_5:DressItem;
            var _local_6:Object;
            var _local_7:Number;
            if (_dressArray.length <= 0)
            {
                this.cleanView();
                return;
            };
            if (!_selectId)
            {
                _selectId = _dressArray[0].id;
                ((dressCall) && (dressCall()));
            };
            var _local_1:int = ((pageSelector.curPage - 1) * PAGE_NUM);
            var _local_2:int = (_local_1 + PAGE_NUM);
            var _local_3:int = _local_1;
            while (_local_3 < _local_2)
            {
                _local_4 = (_local_3 - _local_1);
                _local_5 = this[("dressItem" + _local_4)];
                _local_6 = _dressArray[_local_3];
                _local_7 = ((_local_6) ? _local_6.id : null);
                _local_5.updateView(_local_7);
                _local_5.selected = (_local_7 == _selectId);
                _local_3++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get activeBtn():BasicDelayButton
        {
            return (this._204464502activeBtn);
        }


    }
}//package com.qeedoo.ui.view.compDragable

