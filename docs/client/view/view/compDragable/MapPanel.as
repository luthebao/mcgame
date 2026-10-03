// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MapPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.CheckBox;
    import mx.core.UIComponent;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.MapCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.game.object.Player;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ResizeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
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

    public class MapPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1970145313ipCheck:CheckBox;
        private var _currentMapId:int;
        private var _894646408routeLayer:UIComponent;
        private var _1951133351npcCheck:CheckBox;
        private var _667444878mcCanvas:Canvas;
        private var _3478mc:MapCanvas;
        public var _MapPanel_BasicGlowButton1:BasicGlowButton;
        private var mapScaleX:Number;
        private var mapScaleY:Number;
        private var _1710794012_btnEnabled:Boolean = true;
        private var _836535815mapName:BasicTitleCanvas;
        private var _1722718208_player:Player;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":430,
                    "height":325,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"mapName"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"mcCanvas",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":253,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "y":60,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":MapCanvas,
                                    "id":"mc",
                                    "events":{"resize":"__mc_resize"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":UIComponent,
                                    "id":"routeLayer"
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"npcCheck",
                        "events":{"click":"__npcCheck_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "label":"NPC",
                                "selected":true,
                                "y":40,
                                "x":15
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"ipCheck",
                        "events":{"click":"__ipCheck_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":60,
                                "y":40,
                                "selected":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MapPanel_BasicGlowButton1",
                        "events":{"click":"___MapPanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "styleName":"BtnNormalRed",
                                "width":70.6,
                                "height":19
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

        public function MapPanel()
        {
            mx_internal::_document = this;
            this.width = 430;
            this.height = 325;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MapPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        private function get _player():Player
        {
            return (this._1722718208_player);
        }

        private function showIp():void
        {
            mc.changeIpVisible(ipCheck.selected);
        }

        public function refreshNpc(_arg_1:Number):void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            mc.refreshNpc(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get mapName():BasicTitleCanvas
        {
            return (this._836535815mapName);
        }

        [Bindable(event="propertyChange")]
        public function get routeLayer():UIComponent
        {
            return (this._894646408routeLayer);
        }

        public function __ipCheck_click(_arg_1:MouseEvent):void
        {
            showIp();
        }

        public function clearRoute():void
        {
            if (routeLayer)
            {
                routeLayer.graphics.clear();
            };
        }

        public function firstOut():void
        {
            mc.addEventListener(MouseEvent.CLICK, onFirstOut);
        }

        public function set mapName(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._836535815mapName;
            if (_local_2 !== _arg_1)
            {
                this._836535815mapName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mapName", _local_2, _arg_1));
            };
        }

        private function set _player(_arg_1:Player):void
        {
            var _local_2:Object = this._1722718208_player;
            if (_local_2 !== _arg_1)
            {
                this._1722718208_player = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_player", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mcCanvas():Canvas
        {
            return (this._667444878mcCanvas);
        }

        override public function initialize():void
        {
            var target:MapPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MapPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MapPanelWatcherSetupUtil");
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

        public function set mcCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._667444878mcCanvas;
            if (_local_2 !== _arg_1)
            {
                this._667444878mcCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mcCanvas", _local_2, _arg_1));
            };
        }

        public function __mc_resize(_arg_1:ResizeEvent):void
        {
            resizeHeight();
        }

        public function disableUI():void
        {
            this._btnEnabled = false;
        }

        public function set routeLayer(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._894646408routeLayer;
            if (_local_2 !== _arg_1)
            {
                this._894646408routeLayer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "routeLayer", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ipCheck():CheckBox
        {
            return (this._1970145313ipCheck);
        }

        private function showNpc():void
        {
            mc.changeNpcVisible(npcCheck.selected);
        }

        public function ___MapPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            _core.view.show(ViewManager.POPU_WORLDMAP);
            nextGuide();
        }

        [Bindable(event="propertyChange")]
        public function get npcCheck():CheckBox
        {
            return (this._1951133351npcCheck);
        }

        [Bindable(event="propertyChange")]
        public function get mc():MapCanvas
        {
            return (this._3478mc);
        }

        public function set mc(_arg_1:MapCanvas):void
        {
            var _local_2:Object = this._3478mc;
            if (_local_2 !== _arg_1)
            {
                this._3478mc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mc", _local_2, _arg_1));
            };
        }

        private function set _btnEnabled(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1710794012_btnEnabled;
            if (_local_2 !== _arg_1)
            {
                this._1710794012_btnEnabled = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_btnEnabled", _local_2, _arg_1));
            };
        }

        override public function update():void
        {
            if (_player == null)
            {
                _player = Core.getInstance().player;
            };
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            mc.update();
        }

        public function clear():void
        {
            if (mc != null)
            {
                mc.clear();
            };
            _player = null;
            _currentMapId = -1;
        }

        public function set npcCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1951133351npcCheck;
            if (_local_2 !== _arg_1)
            {
                this._1951133351npcCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npcCheck", _local_2, _arg_1));
            };
        }

        public function reset():void
        {
            if (mc != null)
            {
                mc.clear();
            };
            _player = null;
            _currentMapId = -1;
        }

        private function _MapPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = mc.x;
            _local_1 = mc.y;
            _local_1 = Language.MAPPANEL_S[1];
            _local_1 = this._btnEnabled;
            _local_1 = Language.MAPPANEL_U[0];
        }

        public function clearNpc():void
        {
            if (mc != null)
            {
                mc.clearNpc();
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (_player == null)
            {
                _player = _core.player;
            };
            mc.mid = _currentMapId;
            mc.initView();
            var _local_1:Object = _core.data.gameData[GamePredef.TBL_MAP][_currentMapId];
            mapName.text = _local_1.name;
        }

        public function enableUI():void
        {
            this._btnEnabled = true;
        }

        public function nextGuide():void
        {
        }

        public function clearIp():void
        {
            if (mc != null)
            {
                mc.clearIp();
            };
        }

        private function _MapPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Number
            {
                return (mc.x);
            }, function (_arg_1:Number):void
            {
                routeLayer.x = _arg_1;
            }, "routeLayer.x");
            result[0] = binding;
            binding = new Binding(this, function ():Number
            {
                return (mc.y);
            }, function (_arg_1:Number):void
            {
                routeLayer.y = _arg_1;
            }, "routeLayer.y");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAPPANEL_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                ipCheck.label = _arg_1;
            }, "ipCheck.label");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                _MapPanel_BasicGlowButton1.enabled = _arg_1;
            }, "_MapPanel_BasicGlowButton1.enabled");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MapPanel_BasicGlowButton1.label = _arg_1;
            }, "_MapPanel_BasicGlowButton1.label");
            result[4] = binding;
            return (result);
        }

        public function __npcCheck_click(_arg_1:MouseEvent):void
        {
            showNpc();
        }

        public function drawRoute(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Array):void
        {
            var _local_8:Array;
            var _local_9:Number;
            var _local_10:Number;
            if (!routeLayer)
            {
                return;
            };
            routeLayer.graphics.clear();
            routeLayer.graphics.lineStyle(2, 11206553, 0.8);
            var _local_6:int = (_arg_1 * mapScaleX);
            var _local_7:int = (_arg_2 * mapScaleY);
            for each (_local_8 in _arg_5)
            {
                if (((!(_local_8[0])) || (!(_local_8[1])))) break;
                _local_9 = (_local_8[0] * mapScaleX);
                _local_10 = (_local_8[1] * mapScaleY);
                routeLayer.graphics.beginFill(0xFF0000, 0.8);
                routeLayer.graphics.moveTo(_local_6, _local_7);
                routeLayer.graphics.lineTo(_local_9, _local_10);
                routeLayer.graphics.endFill();
                _local_6 = _local_9;
                _local_7 = _local_10;
            };
            routeLayer.graphics.beginFill(0xFFFF00, 0.8);
            routeLayer.graphics.drawCircle(_local_9, _local_10, 3);
            routeLayer.graphics.endFill();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (!_core.player)
            {
                return;
            };
            _currentMapId = _core.player.posMapId;
            var _local_2:Object = _core.data.gameData[GamePredef.TBL_MAP][_currentMapId];
            if ((((!(_local_2 == null)) && (_local_2.mMap < 0)) && (_arg_1)))
            {
                _core.sysMidNote(Language.MAPPANEL_S[0]);
                return;
            };
            super.visible = _arg_1;
            if (_arg_1)
            {
                initView();
            };
        }

        public function set ipCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1970145313ipCheck;
            if (_local_2 !== _arg_1)
            {
                this._1970145313ipCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ipCheck", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _btnEnabled():Boolean
        {
            return (this._1710794012_btnEnabled);
        }

        private function resizeHeight():void
        {
            height = (mc.height + 85);
            mcCanvas.height = (mc.height + 10);
            mapScaleX = mc.mapScaleX;
            mapScaleY = mc.mapScaleY;
        }

        private function onFirstOut(_arg_1:MouseEvent):void
        {
            mc.removeEventListener(MouseEvent.CLICK, onFirstOut);
        }


    }
}//package com.qeedoo.ui.view.compDragable

