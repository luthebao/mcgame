// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DressItem

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import style.Assets;
    import com.qeedoo.game.data.GameData;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.event.DressEvent;
    import flash.events.Event;
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

    public class DressItem extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1715996377selectImg:Image;
        private var _3533310slot:Slot;
        private var _dressId:Number;
        private var _695368350dressName:Label;
        private var _1062418133activeState:Label;
        private var _selected:Boolean;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":160,
                    "height":45,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Slot,
                        "id":"slot",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"TransparentSlot",
                                "movable":false,
                                "acceptable":false,
                                "stackNum":1,
                                "x":5,
                                "width":34,
                                "height":34
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"dressName",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "-8";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "mouseEnabled":false,
                                "mouseChildren":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"activeState",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "8";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "mouseEnabled":false,
                                "mouseChildren":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"selectImg",
                        "stylesFactory":function ():void
                        {
                            this.left = "-1";
                            this.right = "-1";
                            this.top = "-1";
                            this.bottom = "-1";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "mouseEnabled":false,
                                "visible":false,
                                "mouseChildren":false,
                                "maintainAspectRatio":false
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

        public function DressItem()
        {
            mx_internal::_document = this;
            this.width = 160;
            this.height = 45;
            this.styleName = "InputContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___DressItem_Canvas1_creationComplete);
            this.addEventListener("rollOver", ___DressItem_Canvas1_rollOver);
            this.addEventListener("rollOut", ___DressItem_Canvas1_rollOut);
            this.addEventListener("click", ___DressItem_Canvas1_click);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DressItem._watcherSetupUtil = _arg_1;
        }


        public function set activeState(_arg_1:Label):void
        {
            var _local_2:Object = this._1062418133activeState;
            if (_local_2 !== _arg_1)
            {
                this._1062418133activeState = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeState", _local_2, _arg_1));
            };
        }

        public function set dressName(_arg_1:Label):void
        {
            var _local_2:Object = this._695368350dressName;
            if (_local_2 !== _arg_1)
            {
                this._695368350dressName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dressName", _local_2, _arg_1));
            };
        }

        private function _DressItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                dressName.filters = _arg_1;
            }, "dressName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                activeState.filters = _arg_1;
            }, "activeState.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Assets.SELECTED_IMG);
            }, function (_arg_1:Object):void
            {
                selectImg.source = _arg_1;
            }, "selectImg.source");
            result[2] = binding;
            return (result);
        }

        private function _DressItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Assets.SELECTED_IMG;
        }

        public function updateView(_arg_1:Number):void
        {
            var _local_4:Boolean;
            var _local_7:Object;
            var _local_8:Object;
            _dressId = _arg_1;
            if (!_dressId)
            {
                this.cleanView();
                return;
            };
            var _local_2:Object = GameData.d[GamePredef.TBL_DRESS][_dressId];
            if (!_local_2)
            {
                this.cleanView();
                return;
            };
            var _local_3:Object = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][_local_2.equiptId];
            if (!_local_3)
            {
                this.cleanView();
                return;
            };
            if (_core.player.dressInfo)
            {
                _local_7 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((_local_7) && (_local_7.book)))
                {
                    _local_8 = _local_7.book;
                    if (_local_8[_dressId])
                    {
                        _local_4 = true;
                    };
                };
            };
            var _local_5:int = int(_local_3.color);
            if ((_local_5 < 0))
            {
                _local_5 = 0;
            };
            var _local_6:* = ((_local_4) ? GamePredef.MSG_ITEM_COLOR[_local_5] : "#999999");
            dressName.htmlText = (((("<font color='" + _local_6) + "'>") + _local_3.name) + "</font>");
            activeState.htmlText = Language.DRESS_PANEL[((_local_4) ? 8 : 9)];
            slot.clean();
            slot.slotData = _local_3;
            slot.type = GamePredef.TBL_EQUIPT_TEMPLATE;
            slot.giid = _local_3.id;
            slot.gray = (!(_local_4));
        }

        override public function initialize():void
        {
            var target:DressItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DressItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DressItemWatcherSetupUtil");
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

        public function ___DressItem_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            onComplete(_arg_1);
        }

        public function ___DressItem_Canvas1_rollOver(_arg_1:MouseEvent):void
        {
            slot.showTooltip();
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        public function cleanView():void
        {
            _dressId = null;
            slot.clean();
            dressName.text = "";
            activeState.text = "";
            selectImg.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get slot():Slot
        {
            return (this._3533310slot);
        }

        private function clickHandler(_arg_1:Event):void
        {
            if (!_dressId)
            {
                return;
            };
            var _local_2:DressEvent = new DressEvent(DressEvent.DRESS_CLICK);
            this.dispatchEvent(_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get selectImg():Image
        {
            return (this._1715996377selectImg);
        }

        [Bindable(event="propertyChange")]
        public function get dressName():Label
        {
            return (this._695368350dressName);
        }

        [Bindable(event="propertyChange")]
        public function get activeState():Label
        {
            return (this._1062418133activeState);
        }

        public function ___DressItem_Canvas1_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set selectImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1715996377selectImg;
            if (_local_2 !== _arg_1)
            {
                this._1715996377selectImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectImg", _local_2, _arg_1));
            };
        }

        public function get dressId():Number
        {
            return (_dressId);
        }

        public function set slot(_arg_1:Slot):void
        {
            var _local_2:Object = this._3533310slot;
            if (_local_2 !== _arg_1)
            {
                this._3533310slot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot", _local_2, _arg_1));
            };
        }

        public function ___DressItem_Canvas1_rollOut(_arg_1:MouseEvent):void
        {
            slot.hideTooltip();
        }

        private function onComplete(_arg_1:Event):void
        {
            selectImg.visible = _selected;
        }

        public function set selected(_arg_1:Boolean):void
        {
            _selected = _arg_1;
            if (selectImg)
            {
                selectImg.visible = _arg_1;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

