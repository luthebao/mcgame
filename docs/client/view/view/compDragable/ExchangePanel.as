// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ExchangePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextInput;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.Event;
    import mx.controls.Alert;
    import com.qeedoo.game.view.ViewManager;
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

    public class ExchangePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1348181207cvtDou:TextInput;
        private var _3178592gold:NumericStepper;
        public var _ExchangePanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _ExchangePanel_IntroText1:IntroText;
        private var _364633395awardPoint:Number = 0;
        public var _ExchangePanel_BasicTxtButton1:BasicTxtButton;
        public var _ExchangePanel_BasicGlowButton1:BasicGlowButton;
        public var _ExchangePanel_BasicGlowButton2:BasicGlowButton;
        public var _ExchangePanel_BasicGlowButton3:BasicGlowButton;
        public var _ExchangePanel_BasicTxtButton6:BasicTxtButton;
        public var _ExchangePanel_BasicTxtButton2:BasicTxtButton;
        public var _ExchangePanel_BasicTxtButton3:BasicTxtButton;
        public var _ExchangePanel_BasicTxtButton4:BasicTxtButton;
        public var _ExchangePanel_BasicTxtButton5:BasicTxtButton;
        private var _663605632goldrenren:BoxLabel;
        private var _719391572totalPoint:BoxLabel;
        private var _106845584point:Number = 0;
        public var _ExchangePanel_BoxLabel2:BoxLabel;
        private var _2035869885goldBind:NumericStepper;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":310,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ExchangePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"_ExchangePanel_IntroText1",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":110});
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"totalPoint",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":113.15,
                                "y":163.5,
                                "width":102.05
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ExchangePanel_BasicGlowButton1",
                        "events":{"click":"___ExchangePanel_BasicGlowButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":233.15,
                                "y":158,
                                "styleName":"BtnStdRed",
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ExchangePanel_BasicGlowButton2",
                        "events":{"click":"___ExchangePanel_BasicGlowButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":233.75,
                                "y":192,
                                "styleName":"BtnStdGreen",
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"gold",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":113.15,
                                "y":195.5,
                                "minimum":0,
                                "stepSize":1,
                                "width":102.05
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"_ExchangePanel_BoxLabel2",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":113.15,
                                "y":231.5,
                                "width":102.05
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"goldBind",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":113.15,
                                "y":263.5,
                                "minimum":0,
                                "stepSize":1,
                                "width":102.05
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ExchangePanel_BasicGlowButton3",
                        "events":{"click":"___ExchangePanel_BasicGlowButton3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":233.75,
                                "y":261,
                                "styleName":"BtnStdGreen",
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ExchangePanel_BasicTxtButton1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16.2,
                                "y":163.5,
                                "width":70,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ExchangePanel_BasicTxtButton2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16.2,
                                "y":197.5,
                                "width":70,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ExchangePanel_BasicTxtButton3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16.2,
                                "y":231.5,
                                "width":70,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ExchangePanel_BasicTxtButton4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16.2,
                                "y":265.5,
                                "width":70,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"cvtDou",
                        "events":{"change":"__cvtDou_change"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":112.95,
                                "y":190,
                                "width":32.5,
                                "restrict":"0-9"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"goldrenren",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":165,
                                "y":192,
                                "text":"0",
                                "width":37
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ExchangePanel_BasicTxtButton5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":145,
                                "y":192,
                                "width":23,
                                "height":18,
                                "label":"="
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ExchangePanel_BasicTxtButton6",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":203.75,
                                "y":193,
                                "width":23,
                                "height":18
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private const str:String = Language.EXCHANGEPANEL_S[0];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ExchangePanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundColor = 0xB5B5B5;
            };
            this.width = 300;
            this.height = 310;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ExchangePanel._watcherSetupUtil = _arg_1;
        }


        public function set goldBind(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._2035869885goldBind;
            if (_local_2 !== _arg_1)
            {
                this._2035869885goldBind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldBind", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldrenren():BoxLabel
        {
            return (this._663605632goldrenren);
        }

        public function onGetAwardPoint(_arg_1:Object):void
        {
            awardPoint = Number(_arg_1);
        }

        public function ___ExchangePanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            getGoldBind();
        }

        public function set goldrenren(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._663605632goldrenren;
            if (_local_2 !== _arg_1)
            {
                this._663605632goldrenren = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldrenren", _local_2, _arg_1));
            };
        }

        public function oExS(_arg_1:Object):void
        {
            point = (point - Number(_arg_1));
        }

        override public function initialize():void
        {
            var target:ExchangePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ExchangePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ExchangePanelWatcherSetupUtil");
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

        public function ___ExchangePanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            _core.deal();
        }

        public function onGetAccountEmailByGuid(_arg_1:String):void
        {
            if (_arg_1)
            {
            };
            var _local_2:int = _arg_1.length;
            var _local_3:int = _arg_1.indexOf("@gs");
            if (_local_3 > (_local_2 - 4))
            {
                _core.isGOSU = true;
                return;
            };
            _core.isGOSU = false;
        }

        public function __cvtDou_change(_arg_1:Event):void
        {
            douInputed(_arg_1);
        }

        private function set point(_arg_1:Number):void
        {
            var _local_2:Object = this._106845584point;
            if (_local_2 !== _arg_1)
            {
                this._106845584point = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "point", _local_2, _arg_1));
            };
        }

        private function submit(_arg_1:CloseEvent):void
        {
            var _local_2:int;
            if (_arg_1.detail == Alert.YES)
            {
                if (((!(_core.player.enoughBag(2))) || (!(_core.player.enoughPetSlot(1)))))
                {
                    Alert.show(Language.EXCHANGEPANEL_S[4], "", Alert.OK);
                    return;
                };
                _local_2 = _core.view.getUI(ViewManager.PANEL_GAMEINTRO).itemShowStyle;
                if (_core.by_session == "renren")
                {
                    _core.remote.gg(Number(goldrenren.text), _local_2);
                }
                else
                {
                    _core.remote.gg(gold.value, _local_2);
                };
            };
        }

        [Bindable(event="propertyChange")]
        private function get point():Number
        {
            return (this._106845584point);
        }

        private function _ExchangePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXCHANGEPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ExchangePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((_core.by_session != "renren") ? str : Language.EXCHANGEPANEL_S[10]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_IntroText1.htmlText = _arg_1;
            }, "_ExchangePanel_IntroText1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = point;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                totalPoint.text = _arg_1;
            }, "totalPoint.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXCHANGEPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BasicGlowButton1.label = _arg_1;
            }, "_ExchangePanel_BasicGlowButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXCHANGEPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BasicGlowButton2.label = _arg_1;
            }, "_ExchangePanel_BasicGlowButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():Number
            {
                return (point);
            }, function (_arg_1:Number):void
            {
                gold.maximum = _arg_1;
            }, "gold.maximum");
            result[5] = binding;
            binding = new Binding(this, function ():Number
            {
                return (point);
            }, function (_arg_1:Number):void
            {
                gold.value = _arg_1;
            }, "gold.value");
            result[6] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_core.by_session == "renren"));
            }, function (_arg_1:Boolean):void
            {
                gold.visible = _arg_1;
            }, "gold.visible");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = awardPoint;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BoxLabel2.text = _arg_1;
            }, "_ExchangePanel_BoxLabel2.text");
            result[8] = binding;
            binding = new Binding(this, function ():Number
            {
                return (int((awardPoint / 10)));
            }, function (_arg_1:Number):void
            {
                goldBind.maximum = _arg_1;
            }, "goldBind.maximum");
            result[9] = binding;
            binding = new Binding(this, function ():Number
            {
                return (int((awardPoint / 10)));
            }, function (_arg_1:Number):void
            {
                goldBind.value = _arg_1;
            }, "goldBind.value");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXCHANGEPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BasicGlowButton3.label = _arg_1;
            }, "_ExchangePanel_BasicGlowButton3.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((_core.by_session != "renren") ? Language.EXCHANGEPANEL_U[3] : Language.EXCHANGEPANEL_U[8]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BasicTxtButton1.label = _arg_1;
            }, "_ExchangePanel_BasicTxtButton1.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((_core.by_session != "renren") ? Language.EXCHANGEPANEL_U[4] : Language.EXCHANGEPANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BasicTxtButton2.label = _arg_1;
            }, "_ExchangePanel_BasicTxtButton2.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXCHANGEPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BasicTxtButton3.label = _arg_1;
            }, "_ExchangePanel_BasicTxtButton3.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXCHANGEPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BasicTxtButton4.label = _arg_1;
            }, "_ExchangePanel_BasicTxtButton4.label");
            result[15] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.by_session == "renren");
            }, function (_arg_1:Boolean):void
            {
                cvtDou.visible = _arg_1;
            }, "cvtDou.visible");
            result[16] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.by_session == "renren");
            }, function (_arg_1:Boolean):void
            {
                goldrenren.visible = _arg_1;
            }, "goldrenren.visible");
            result[17] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.by_session == "renren");
            }, function (_arg_1:Boolean):void
            {
                _ExchangePanel_BasicTxtButton5.visible = _arg_1;
            }, "_ExchangePanel_BasicTxtButton5.visible");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXCHANGEPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExchangePanel_BasicTxtButton6.label = _arg_1;
            }, "_ExchangePanel_BasicTxtButton6.label");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_core.by_session == "renren");
            }, function (_arg_1:Boolean):void
            {
                _ExchangePanel_BasicTxtButton6.visible = _arg_1;
            }, "_ExchangePanel_BasicTxtButton6.visible");
            result[20] = binding;
            return (result);
        }

        private function exchangeAwardPointToGoldBind(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.exchangeAwardToGoldBind(goldBind.value);
            };
        }

        private function _ExchangePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.EXCHANGEPANEL_U[2];
            _local_1 = ((_core.by_session != "renren") ? str : Language.EXCHANGEPANEL_S[10]);
            _local_1 = point;
            _local_1 = Language.EXCHANGEPANEL_U[0];
            _local_1 = Language.EXCHANGEPANEL_U[1];
            _local_1 = point;
            _local_1 = point;
            _local_1 = (!(_core.by_session == "renren"));
            _local_1 = awardPoint;
            _local_1 = int((awardPoint / 10));
            _local_1 = int((awardPoint / 10));
            _local_1 = Language.EXCHANGEPANEL_U[1];
            _local_1 = ((_core.by_session != "renren") ? Language.EXCHANGEPANEL_U[3] : Language.EXCHANGEPANEL_U[8]);
            _local_1 = ((_core.by_session != "renren") ? Language.EXCHANGEPANEL_U[4] : Language.EXCHANGEPANEL_U[9]);
            _local_1 = Language.EXCHANGEPANEL_U[5];
            _local_1 = Language.EXCHANGEPANEL_U[6];
            _local_1 = (_core.by_session == "renren");
            _local_1 = (_core.by_session == "renren");
            _local_1 = (_core.by_session == "renren");
            _local_1 = Language.EXCHANGEPANEL_U[7];
            _local_1 = (_core.by_session == "renren");
        }

        private function getGoldBind():void
        {
            var _local_1:Number = goldBind.value;
            var _local_2:Number = (awardPoint / 10);
            if (_local_1 <= 0)
            {
                return;
            };
            if (_local_1 > _local_2)
            {
                Alert.show(((Language.EXCHANGEPANEL_S[5] + _local_2) + Language.EXCHANGEPANEL_S[6]), "", Alert.OK);
            }
            else
            {
                Alert.show(((((Language.EXCHANGEPANEL_S[7] + (_local_1 * 10)) + Language.EXCHANGEPANEL_S[8]) + _local_1) + Language.EXCHANGEPANEL_S[9]), "", (Alert.YES | Alert.NO), null, exchangeAwardPointToGoldBind);
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldBind():NumericStepper
        {
            return (this._2035869885goldBind);
        }

        private function douInputed(_arg_1:Event):*
        {
            var _local_2:TextInput = (_arg_1.target as TextInput);
            var _local_3:Number = Number(_local_2.text);
            var _local_4:Number = Number(totalPoint.text);
            if (_local_3 >= _local_4)
            {
                _local_2.text = _local_4.toString();
                _local_3 = _local_4;
            };
            if (_local_3 < 0)
            {
                _local_2.text = "0";
                _local_3 = 0;
            };
            _local_3 = (_local_3 * 10);
            goldrenren.text = _local_3.toString();
        }

        [Bindable(event="propertyChange")]
        public function get cvtDou():TextInput
        {
            return (this._1348181207cvtDou);
        }

        [Bindable(event="propertyChange")]
        public function get totalPoint():BoxLabel
        {
            return (this._719391572totalPoint);
        }

        public function set gold(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._3178592gold;
            if (_local_2 !== _arg_1)
            {
                this._3178592gold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gold", _local_2, _arg_1));
            };
        }

        public function ___ExchangePanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            getGold();
        }

        [Bindable(event="propertyChange")]
        private function get awardPoint():Number
        {
            return (this._364633395awardPoint);
        }

        public function set totalPoint(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._719391572totalPoint;
            if (_local_2 !== _arg_1)
            {
                this._719391572totalPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalPoint", _local_2, _arg_1));
            };
        }

        public function set cvtDou(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1348181207cvtDou;
            if (_local_2 !== _arg_1)
            {
                this._1348181207cvtDou = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cvtDou", _local_2, _arg_1));
            };
        }

        private function getGold():void
        {
            var _local_1:Number;
            var _local_6:String;
            var _local_2:Number = 1;
            var _local_3:Number = new Date(2026, 5, 19, 0, 0).getTime();
            var _local_4:Number = new Date(2026, 5, 19, 23, 59).getTime();
            var _local_5:Number = new Date().getTime();
            if (((_local_3 < _local_5) && (_local_4 > _local_5)))
            {
                _local_2 = 1.2;
            };
            if (_core.by_session == "renren")
            {
                _local_1 = Number(goldrenren.text);
            }
            else
            {
                _local_1 = gold.value;
            };
            if (_local_1 > 0)
            {
                if (_core.by_session == "renren")
                {
                    _local_6 = ((((Language.EXCHANGEPANEL_S[11] + _local_1) + Language.EXCHANGEPANEL_S[12]) + _local_1) + Language.EXCHANGEPANEL_S[13]);
                }
                else
                {
                    _local_6 = ((((Language.EXCHANGEPANEL_S[1] + _local_1) + Language.EXCHANGEPANEL_S[2]) + Math.floor(((_local_1 * _local_2) * 10))) + Language.EXCHANGEPANEL_S[3]);
                };
                Alert.show(_local_6, "", (Alert.YES | Alert.NO), null, submit);
            };
        }

        [Bindable(event="propertyChange")]
        public function get gold():NumericStepper
        {
            return (this._3178592gold);
        }

        public function op(_arg_1:Object):void
        {
            point = Number(_arg_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                _core.remote.gp();
            };
        }

        private function set awardPoint(_arg_1:Number):void
        {
            var _local_2:Object = this._364633395awardPoint;
            if (_local_2 !== _arg_1)
            {
                this._364633395awardPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardPoint", _local_2, _arg_1));
            };
        }

        public function onExAwardPointToGoldBind(_arg_1:Object):void
        {
            awardPoint = (awardPoint - Number(_arg_1));
        }


    }
}//package com.qeedoo.ui.view.compDragable

