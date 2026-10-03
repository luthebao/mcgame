// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DecorateItem

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.view.comp.FilterButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import style.Assets;
    import com.qeedoo.game.data.GameData;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.game.utils.JSONUtil;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import flash.events.Event;
    import com.qeedoo.ui.event.DecoEvent;
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

    public class DecorateItem extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1715996377selectImg:Image;
        private var _selected:Boolean;
        private var _570150104decoName:Label;
        private var _1062418133activeState:Label;
        private var _747804969position:Label;
        private var isEquiped:Boolean;
        private var isTimeLimmit:Boolean;
        private var _decoId:Number;
        private var _3533310slot:Slot;
        private var isActive:Boolean;
        private var _1313942207timeOut:Label;
        private var _204464502activeBtn:FilterButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":165,
                    "height":55,
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
                        "id":"decoName",
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
                        "type":Label,
                        "id":"timeOut",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "8";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":88,
                                "mouseEnabled":false,
                                "mouseChildren":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"position",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "-8";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":130,
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
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"activeBtn",
                        "events":{"click":"__activeBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "x":118,
                                "width":40,
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

        public function DecorateItem()
        {
            mx_internal::_document = this;
            this.width = 165;
            this.height = 55;
            this.styleName = "InputContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___DecorateItem_Canvas1_creationComplete);
            this.addEventListener("rollOver", ___DecorateItem_Canvas1_rollOver);
            this.addEventListener("rollOut", ___DecorateItem_Canvas1_rollOut);
            this.addEventListener("click", ___DecorateItem_Canvas1_click);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DecorateItem._watcherSetupUtil = _arg_1;
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

        [Bindable(event="propertyChange")]
        public function get slot():Slot
        {
            return (this._3533310slot);
        }

        private function _DecorateItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                decoName.filters = _arg_1;
            }, "decoName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                activeState.filters = _arg_1;
            }, "activeState.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                timeOut.filters = _arg_1;
            }, "timeOut.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                position.filters = _arg_1;
            }, "position.filters");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Assets.SELECTED_IMG);
            }, function (_arg_1:Object):void
            {
                selectImg.source = _arg_1;
            }, "selectImg.source");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                activeBtn.filters = _arg_1;
            }, "activeBtn.filters");
            result[5] = binding;
            return (result);
        }

        public function set timeOut(_arg_1:Label):void
        {
            var _local_2:Object = this._1313942207timeOut;
            if (_local_2 !== _arg_1)
            {
                this._1313942207timeOut = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeOut", _local_2, _arg_1));
            };
        }

        public function updateView(_arg_1:Number):void
        {
            var _local_3:Object;
            var _local_7:Object;
            var _local_8:Object;
            trace(("更新形象id为" + _arg_1));
            _decoId = _arg_1;
            if (!_decoId)
            {
                this.cleanView();
                return;
            };
            var _local_2:Object = GameData.d[GamePredef.TBL_DECO_SHOW][_decoId];
            if (!_local_2)
            {
                this.cleanView();
                return;
            };
            if (!_core.player.decoInfo)
            {
                return;
            };
            _local_3 = _core.player.decoInfo[_local_2["position"]];
            if (((_local_3) && (_local_3.activeFlag)))
            {
                _local_7 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_local_3.activeFlag));
                _local_8 = _local_7["s"];
                if (_local_8[_arg_1])
                {
                    isActive = true;
                    if (Number(_local_2["t"]) > 1)
                    {
                        isTimeLimmit = true;
                    }
                    else
                    {
                        isTimeLimmit = false;
                    };
                }
                else
                {
                    isActive = false;
                    if (Number(_local_2["t"]) > 1)
                    {
                        isTimeLimmit = true;
                    }
                    else
                    {
                        isTimeLimmit = false;
                    };
                };
                if (_local_3.did == _decoId)
                {
                    isEquiped = true;
                }
                else
                {
                    isEquiped = false;
                };
            };
            var _local_4:String = ((isActive) ? "#FFFF00" : "#999999");
            decoName.htmlText = (((("<font color='" + _local_4) + "'>") + _local_2.name) + "</font>");
            var _local_5:String = ((isActive) ? "#00FF00" : "#999999");
            activeState.htmlText = (((("<font color='" + _local_5) + "'>") + Language.DECORATE_PANEL[((isActive) ? 5 : 4)]) + "</font>");
            position.htmlText = (("<font color='#D6D6D6'>" + Language.DECORATE_PANEL[6][(_local_2.position - 1)]) + "</font>");
            var _local_6:String = ((isActive) ? "#D6D6D6" : "#999999");
            timeOut.htmlText = (((("<font color='" + _local_6) + "'>") + Language.DECORATE_PANEL[((isTimeLimmit) ? 7 : 8)]) + "</font>");
            activeBtn.label = Language.DECORATE_PANEL[((isActive) ? ((isEquiped) ? 10 : 11) : 9)];
            slot.clean();
            slot.slotData = _local_2;
            slot.type = GamePredef.TBL_DECO_SHOW;
            slot.giid = _local_2.id;
            slot.gray = (!(isActive));
        }

        override public function initialize():void
        {
            var target:DecorateItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DecorateItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DecorateItemWatcherSetupUtil");
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

        private function _DecorateItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Assets.SELECTED_IMG;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function cleanView():void
        {
            _decoId = 0;
            slot.clean();
            decoName.text = "";
            activeState.text = "";
            timeOut.text = "";
            position.text = "";
            activeBtn.visible = false;
            selectImg.visible = false;
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        public function ___DecorateItem_Canvas1_rollOver(_arg_1:MouseEvent):void
        {
            slot.showTooltip();
        }

        public function get decoId():Number
        {
            return (_decoId);
        }

        public function clickHandler(e:Event):void
        {
            var decoMeta:Object;
            var activeGold:int;
            var func:Function;
            decoMeta = GameData.d[GamePredef.TBL_DECO_SHOW][_decoId];
            if (!isActive)
            {
                activeGold = decoMeta["activeGold"];
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("activeDecoShow", new Responder(updateDecoInfo), decoMeta.id, decoMeta.position);
                    };
                };
                if (activeGold)
                {
                    Alert.show(Language.DECORATE_PANEL[63].toString().replace("{num}", activeGold), "", (Alert.YES | Alert.NO), null, func);
                    return;
                };
                Alert.show(Language.DECORATE_PANEL[62]);
                return;
            };
            if (!isEquiped)
            {
                trace("装备形象");
                _core.remote.call("equipDecoShow", new Responder(updateDecoInfo), decoMeta.id, decoMeta.position);
            }
            else
            {
                trace("卸载形象");
                _core.remote.call("equipOffDecoShow", new Responder(updateDecoInfo), decoMeta.id, decoMeta.position);
            };
        }

        public function ___DecorateItem_Canvas1_rollOut(_arg_1:MouseEvent):void
        {
            slot.hideTooltip();
        }

        public function __activeBtn_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set decoName(_arg_1:Label):void
        {
            var _local_2:Object = this._570150104decoName;
            if (_local_2 !== _arg_1)
            {
                this._570150104decoName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoName", _local_2, _arg_1));
            };
        }

        public function ___DecorateItem_Canvas1_click(_arg_1:MouseEvent):void
        {
            decoClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get activeState():Label
        {
            return (this._1062418133activeState);
        }

        public function set selected(_arg_1:Boolean):void
        {
            _selected = _arg_1;
            if (selectImg)
            {
                selectImg.visible = _arg_1;
            };
        }

        private function onComplete():void
        {
            trace("魂器item创建完毕------------");
            selectImg.visible = (_selected = false);
        }

        [Bindable(event="propertyChange")]
        public function get position():Label
        {
            return (this._747804969position);
        }

        [Bindable(event="propertyChange")]
        public function get selectImg():Image
        {
            return (this._1715996377selectImg);
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

        public function set position(_arg_1:Label):void
        {
            var _local_2:Object = this._747804969position;
            if (_local_2 !== _arg_1)
            {
                this._747804969position = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "position", _local_2, _arg_1));
            };
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

        public function set decoId(_arg_1:Number):void
        {
            _decoId = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get decoName():Label
        {
            return (this._570150104decoName);
        }

        [Bindable(event="propertyChange")]
        public function get timeOut():Label
        {
            return (this._1313942207timeOut);
        }

        private function decoClick(_arg_1:Event):void
        {
            trace("进入点击事件 ----------");
            if (!_decoId)
            {
                return;
            };
            var _local_2:DecoEvent = new DecoEvent(DecoEvent.DECO_CLICK);
            this.dispatchEvent(_local_2);
            trace("派发点击事件--------");
        }

        public function ___DecorateItem_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            onComplete();
        }

        public function updateDecoInfo(_arg_1:Object):void
        {
            DecorateLogic.updateDecoInfo(_arg_1);
        }

        public function set activeBtn(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._204464502activeBtn;
            if (_local_2 !== _arg_1)
            {
                this._204464502activeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get activeBtn():FilterButton
        {
            return (this._204464502activeBtn);
        }


    }
}//package com.qeedoo.ui.view.compDragable

