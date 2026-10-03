// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.StoneSealBoreCanvas

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import flash.net.Responder;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
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

    public class StoneSealBoreCanvas extends DragableCanvas implements IBindingClient 
    {

        public static const STONE_SEAL_BORE_GOID_COST:Array = [71, 86, 110, 146, 195, 258, 335, 428, 537, 663];
        public static const STONE_SEAL_BORE_PVE_POINT_COST:Array = [50, 60, 77, 102, 136, 180, 234, 299, 375, 463];
        public static const STONE_SEAL_BORE_ITEM_COST:Array = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
        public static const STONE_SEAL_BORE_ITEM_ID:int = 16;
        public static const STONE_SEAL_BORE_ITEM_COLOR:Array = [0, 0, 1, 1, 2, 2, 3, 3, 4, 4];
        public static const STONE_SEAL_SUCCINCT_GOLD_COST:Array = [157, 157, 390, 751, 826];
        public static const STONE_SEAL_SUCCINCT_PVE_POINT_COST:Array = [110, 110, 275, 529, 582];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _108694132t2Lag:Label;
        private var _1354859035t1Title:Label;
        private var _1377813182t2Need2:Label;
        public var _StoneSealBoreCanvas_Image1:Image;
        private var _108664341t1Lag:Label;
        private var holeNum:int = -1;
        private var _3034453btn1:BasicDelayButton;
        private var _3034454btn2:BasicDelayButton;
        private var _1349184031t1Need2:Label;
        private var type:int = 1;
        private var _1377813181t2Need1:Label;
        private var sealIndex:int = -1;
        private var _1349184030t1Need1:Label;
        private var succinctLvl:int = -1;
        private var parentPanel:Object = null;
        private var _110371416title:BasicTitleCanvas;
        private var equipSid:int = -1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":280,
                    "height":250,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"title"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "5";
                            this.right = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":39,
                                "height":185,
                                "styleName":"RoundedGradientBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_StoneSealBoreCanvas_Image1"
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"t1Title",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                        this.top = "15";
                                        this.fontSize = 12;
                                        this.color = 0xFFFF;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"t1Lag",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                        this.top = "35";
                                        this.fontSize = 12;
                                        this.color = 0xFFFF;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"t1Need1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "75";
                                        this.top = "55";
                                        this.fontSize = 12;
                                        this.color = 0xFFFF;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"t1Need2",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "75";
                                        this.top = "75";
                                        this.fontSize = 12;
                                        this.color = 0xFFFF;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"t2Lag",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                        this.top = "95";
                                        this.fontSize = 12;
                                        this.color = 0xFF00;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"t2Need1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "75";
                                        this.top = "115";
                                        this.fontSize = 12;
                                        this.color = 0xFF00;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"t2Need2",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "75";
                                        this.top = "135";
                                        this.fontSize = 12;
                                        this.color = 0xFF00;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"btn1",
                                    "events":{"click":"__btn1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.bottom = "3";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"styleName":"BtnStdRed"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"btn2",
                                    "events":{"click":"__btn2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "3";
                                        this.bottom = "3";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "styleName":"BtnStdRed"
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
        private var slot:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function StoneSealBoreCanvas()
        {
            mx_internal::_document = this;
            this.width = 280;
            this.height = 250;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
            this.addEventListener("creationComplete", ___StoneSealBoreCanvas_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StoneSealBoreCanvas._watcherSetupUtil = _arg_1;
        }


        public function set t2Need1(_arg_1:Label):void
        {
            var _local_2:Object = this._1377813181t2Need1;
            if (_local_2 !== _arg_1)
            {
                this._1377813181t2Need1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t2Need1", _local_2, _arg_1));
            };
        }

        private function todoByMaterial():void
        {
            if (type == 1)
            {
                toBore(2);
            }
            else
            {
                toSuccinct(3);
            };
        }

        public function showPanel(_arg_1:Object, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int):void
        {
            if (StoneSealPanel.isWatch)
            {
                return;
            };
            parentPanel = _arg_1;
            type = _arg_2;
            equipSid = _arg_3;
            holeNum = _arg_4;
            sealIndex = _arg_5;
            succinctLvl = _arg_6;
            initView();
            visible = true;
        }

        override public function initialize():void
        {
            var target:StoneSealBoreCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StoneSealBoreCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_StoneSealBoreCanvasWatcherSetupUtil");
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
        public function get t2Need1():Label
        {
            return (this._1377813181t2Need1);
        }

        [Bindable(event="propertyChange")]
        public function get t1Lag():Label
        {
            return (this._108664341t1Lag);
        }

        private function onSuccinct(_arg_1:Object):void
        {
            if ((((parentPanel) && (_arg_1)) && (_arg_1.flag)))
            {
                parentPanel.onSuccinct(_arg_1);
                succinctLvl++;
                initView();
            };
        }

        public function __btn1_click(_arg_1:MouseEvent):void
        {
            todoByMaterial();
        }

        [Bindable(event="propertyChange")]
        public function get t2Lag():Label
        {
            return (this._108694132t2Lag);
        }

        [Bindable(event="propertyChange")]
        public function get t1Title():Label
        {
            return (this._1354859035t1Title);
        }

        [Bindable(event="propertyChange")]
        public function get t1Need1():Label
        {
            return (this._1349184030t1Need1);
        }

        private function init():void
        {
        }

        public function set t2Need2(_arg_1:Label):void
        {
            var _local_2:Object = this._1377813182t2Need2;
            if (_local_2 !== _arg_1)
            {
                this._1377813182t2Need2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t2Need2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t1Need2():Label
        {
            return (this._1349184031t1Need2);
        }

        public function ___StoneSealBoreCanvas_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function toSuccinct(_arg_1:int):void
        {
            if (StoneSealPanel.isWatch)
            {
                return;
            };
            if (((equipSid >= StoneSealPanel.EQUIP_ID_MIN) && (equipSid <= StoneSealPanel.EQUIP_ID_MAX)))
            {
                _core.remote.call("stoneSealSuccinct", new Responder(onSuccinct), equipSid, _arg_1);
            };
        }

        public function set t1Title(_arg_1:Label):void
        {
            var _local_2:Object = this._1354859035t1Title;
            if (_local_2 !== _arg_1)
            {
                this._1354859035t1Title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t1Title", _local_2, _arg_1));
            };
        }

        public function set title(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function set btn1(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        public function set t1Need1(_arg_1:Label):void
        {
            var _local_2:Object = this._1349184030t1Need1;
            if (_local_2 !== _arg_1)
            {
                this._1349184030t1Need1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t1Need1", _local_2, _arg_1));
            };
        }

        private function todoByGold():void
        {
        }

        private function onBore(_arg_1:Object):void
        {
            if ((((parentPanel) && (_arg_1)) && (_arg_1.flag)))
            {
                parentPanel.onBore(_arg_1);
                visible = false;
            };
        }

        public function set t1Need2(_arg_1:Label):void
        {
            var _local_2:Object = this._1349184031t1Need2;
            if (_local_2 !== _arg_1)
            {
                this._1349184031t1Need2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t1Need2", _local_2, _arg_1));
            };
        }

        public function __btn2_click(_arg_1:MouseEvent):void
        {
            todoByGold();
        }

        private function _StoneSealBoreCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000382));
            }, function (_arg_1:Object):void
            {
                _StoneSealBoreCanvas_Image1.source = _arg_1;
            }, "_StoneSealBoreCanvas_Image1.source");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get t2Need2():Label
        {
            return (this._1377813182t2Need2);
        }

        public function set btn2(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._3034454btn2;
            if (_local_2 !== _arg_1)
            {
                this._3034454btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn2():BasicDelayButton
        {
            return (this._3034454btn2);
        }

        public function set t1Lag(_arg_1:Label):void
        {
            var _local_2:Object = this._108664341t1Lag;
            if (_local_2 !== _arg_1)
            {
                this._108664341t1Lag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t1Lag", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            var _local_5:int;
            var _local_6:Object;
            var _local_7:int;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            var _local_1:int = _core.player.stoneSealPoint;
            var _local_2:int;
            var _local_3:* = "";
            var _local_4:* = "";
            if (type == 1)
            {
                _local_2 = STONE_SEAL_BORE_PVE_POINT_COST[holeNum];
                _local_5 = STONE_SEAL_BORE_ITEM_COST[holeNum];
                _local_6 = _core.getItemNumByColor(GamePredef.TBL_ITEM_TEMPLATE, STONE_SEAL_BORE_ITEM_ID, STONE_SEAL_BORE_ITEM_COLOR[holeNum]);
                _local_7 = _local_6.num;
                if (!_local_6.slot)
                {
                    _local_7 = 0;
                };
                slot = ((_local_6.slot) || ({}));
                title.text = Language.STONE_SEAL_PANEL_U[7];
                t1Title.text = Language.STONE_SEAL_PANEL_U[8].toString().replace("{num}", holeNum);
                t1Lag.text = Language.STONE_SEAL_PANEL_U[9];
                t1Need1.text = Language.STONE_SEAL_PANEL_U[10].toString().replace("{num}", _local_2);
                t1Need2.text = Language.STONE_SEAL_PANEL_U[11].toString().replace("{num}", _local_5).replace("{level}", Language.STONE_SEAL_PANEL_U[(34 + int((holeNum / 2)))]);
                t2Lag.text = Language.STONE_SEAL_PANEL_U[12];
                _local_3 = Language.STONE_SEAL_PANEL_U[10].toString().replace("{num}", _local_1);
                if (_local_1 < _local_2)
                {
                    t2Need1.htmlText = (("<font color='#ff0000'>" + _local_3) + "</font>");
                }
                else
                {
                    t2Need1.htmlText = (("<font color='#00ff00'>" + _local_3) + "</font>");
                };
                _local_4 = Language.STONE_SEAL_PANEL_U[11].toString().replace("{num}", _local_7).replace("{level}", Language.STONE_SEAL_PANEL_U[(34 + int((holeNum / 2)))]);
                if (_local_7 < _local_5)
                {
                    t2Need2.htmlText = (("<font color='#ff0000'>" + _local_4) + "</font>");
                }
                else
                {
                    t2Need2.htmlText = (("<font color='#00ff00'>" + _local_4) + "</font>");
                };
                btn1.label = Language.STONE_SEAL_PANEL_U[7];
                btn2.label = Language.STONE_SEAL_PANEL_U[15];
            }
            else
            {
                _local_2 = STONE_SEAL_SUCCINCT_PVE_POINT_COST[succinctLvl];
                title.text = Language.STONE_SEAL_PANEL_U[6];
                t1Title.text = Language.STONE_SEAL_PANEL_U[13].toString().replace("{num}", succinctLvl);
                t1Lag.text = Language.STONE_SEAL_PANEL_U[14];
                t1Need1.text = Language.STONE_SEAL_PANEL_U[10].toString().replace("{num}", _local_2);
                t1Need2.text = "";
                t2Lag.text = Language.STONE_SEAL_PANEL_U[12];
                _local_3 = Language.STONE_SEAL_PANEL_U[10].toString().replace("{num}", _local_1);
                if (_local_1 < _local_2)
                {
                    t2Need1.htmlText = (("<font color='#ff0000'>" + _local_3) + "</font>");
                }
                else
                {
                    t2Need1.htmlText = (("<font color='#00ff00'>" + _local_3) + "</font>");
                };
                t2Need2.text = "";
                btn1.label = Language.STONE_SEAL_PANEL_U[16];
                btn2.label = Language.STONE_SEAL_PANEL_U[17];
            };
        }

        private function _StoneSealBoreCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getIconUrl(4130220000382);
        }

        private function toBore(_arg_1:int):void
        {
            if (StoneSealPanel.isWatch)
            {
                return;
            };
            if (((equipSid >= StoneSealPanel.EQUIP_ID_MIN) && (equipSid <= StoneSealPanel.EQUIP_ID_MAX)))
            {
                _core.remote.call("stoneSealBore", new Responder(onBore), equipSid, sealIndex, _arg_1, slot.id);
            };
        }

        private function getAnswerByMoney(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                if (type == 1)
                {
                    toBore(1);
                }
                else
                {
                    toSuccinct(1);
                };
            };
        }

        public function set t2Lag(_arg_1:Label):void
        {
            var _local_2:Object = this._108694132t2Lag;
            if (_local_2 !== _arg_1)
            {
                this._108694132t2Lag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t2Lag", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get title():BasicTitleCanvas
        {
            return (this._110371416title);
        }

        [Bindable(event="propertyChange")]
        public function get btn1():BasicDelayButton
        {
            return (this._3034453btn1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

