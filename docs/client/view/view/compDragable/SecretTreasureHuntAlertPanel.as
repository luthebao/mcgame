// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SecretTreasureHuntAlertPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
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

    public class SecretTreasureHuntAlertPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _SecretTreasureHuntAlertPanel_Label3:Label;
        private var _ALLSZNum:Number = 50;
        private var _1103418265SZBuyNum:NumericStepper;
        private var _1617570032LastNum:Label;
        private var _97926buy:BasicGlowButton;
        public var _SecretTreasureHuntAlertPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _typeNum:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":128,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SecretTreasureHuntAlertPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":96,
                                "y":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"buy",
                                    "events":{"click":"__buy_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":63,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"SZBuyNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "right";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":146.95,
                                            "y":10,
                                            "maximum":50,
                                            "minimum":0,
                                            "stepSize":1,
                                            "width":68.05
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":216.05,
                                            "y":12,
                                            "width":40.95,
                                            "text":"Còn:"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"LastNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":254,
                                            "y":12,
                                            "width":36
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_SecretTreasureHuntAlertPanel_Label3",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":34.95,
                                            "y":12,
                                            "width":104
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":50,
                                            "y":40,
                                            "text":"XN Thường: 20 vàng/lần,  XN MMắn: 50 Vàng/lần"
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SecretTreasureHuntAlertPanel()
        {
            mx_internal::_document = this;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.width = 300;
            this.height = 128;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SecretTreasureHuntAlertPanel._watcherSetupUtil = _arg_1;
        }


        public function set ALLSZNum(_arg_1:Number):void
        {
            _ALLSZNum = _arg_1;
        }

        private function _SecretTreasureHuntAlertPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SEC_TREA_HUNT[0];
            _local_1 = Language.SEC_TREA_HUNT[2];
            _local_1 = Language.SEC_TREA_HUNT[1];
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        public function set SZBuyNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1103418265SZBuyNum;
            if (_local_2 !== _arg_1)
            {
                this._1103418265SZBuyNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "SZBuyNum", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:SecretTreasureHuntAlertPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SecretTreasureHuntAlertPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SecretTreasureHuntAlertPanelWatcherSetupUtil");
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

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            this.typeNum = _typeNum;
            this.ALLSZNum = _ALLSZNum;
            LastNum.htmlText = String(_ALLSZNum);
        }

        public function set typeNum(_arg_1:Number):void
        {
            _typeNum = _arg_1;
        }

        public function set buy(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._97926buy;
            if (_local_2 !== _arg_1)
            {
                this._97926buy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buy", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get buy():BasicGlowButton
        {
            return (this._97926buy);
        }

        public function set LastNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1617570032LastNum;
            if (_local_2 !== _arg_1)
            {
                this._1617570032LastNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "LastNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get SZBuyNum():NumericStepper
        {
            return (this._1103418265SZBuyNum);
        }

        public function __buy_click(_arg_1:MouseEvent):void
        {
            buySecTreaHuntSZ();
        }

        private function _SecretTreasureHuntAlertPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SecretTreasureHuntAlertPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SecretTreasureHuntAlertPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buy.label = _arg_1;
            }, "buy.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SecretTreasureHuntAlertPanel_Label3.text = _arg_1;
            }, "_SecretTreasureHuntAlertPanel_Label3.text");
            result[2] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get LastNum():Label
        {
            return (this._1617570032LastNum);
        }

        public function buySecTreaHuntSZ():void
        {
            var _local_1:Number = SZBuyNum.value;
            if (((_local_1 > 0) && ((_local_1 - Math.floor(_local_1)) == 0)))
            {
                _core.remote.call("buySecTreaHuntSZ", null, _typeNum, _local_1);
                this.visible = false;
            }
            else
            {
                _core.sysMsg(Language.SEC_TREA_HUNT[3]);
                return;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

