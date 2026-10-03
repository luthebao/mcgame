// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.BloodAddPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.RoundedButton;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.RoundTextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
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

    public class BloodAddPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var buyInfoObj:Object;
        public var _BloodAddPanel_RoundedLabel3:RoundedLabel;
        public var _BloodAddPanel_RoundedLabel4:RoundedLabel;
        private var _1422541317addBtn:RoundedButton;
        private var _3575610type:int = 0;
        private var _511269555fullBtn:RoundedButton;
        private var _3525ns:NumericStepper;
        public var _BloodAddPanel_RoundTextArea1:RoundTextArea;
        public var _BloodAddPanel_RoundTextArea2:RoundTextArea;
        public var _BloodAddPanel_RoundTextArea3:RoundTextArea;
        public var _BloodAddPanel_RoundTextArea4:RoundTextArea;
        public var _BloodAddPanel_RoundTextArea5:RoundTextArea;
        private var _3712tt:RoundedLabel;
        private var _3446lb:RoundedLabel;
        public var _BloodAddPanel_RoundedButton3:RoundedButton;
        public var _BloodAddPanel_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":390,
                    "height":205,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_BloodAddPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":RoundedButton,
                        "id":"fullBtn",
                        "events":{"click":"__fullBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":89,
                                "y":163,
                                "styleName":"BtnRed",
                                "width":68
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedButton,
                        "id":"addBtn",
                        "events":{"click":"__addBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":163,
                                "y":163,
                                "styleName":"BtnRed",
                                "width":68
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"ns",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.borderStyle = "none";
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":174.5,
                                "y":109,
                                "maximum":2000000,
                                "minimum":0,
                                "width":190,
                                "height":21
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"tt",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":174.5,
                                "y":83,
                                "text":"",
                                "width":190,
                                "height":21
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedButton,
                        "id":"_BloodAddPanel_RoundedButton3",
                        "events":{"click":"___BloodAddPanel_RoundedButton3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":237,
                                "y":163,
                                "styleName":"BtnRed",
                                "width":68
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"lb",
                        "stylesFactory":function ():void
                        {
                            this.color = 16189448;
                            this.textAlign = "center";
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":21,
                                "y":83,
                                "text":"",
                                "width":81.1,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_BloodAddPanel_RoundedLabel3",
                        "stylesFactory":function ():void
                        {
                            this.color = 16189448;
                            this.textAlign = "center";
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":107,
                                "y":134,
                                "width":101.1,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_BloodAddPanel_RoundedLabel4",
                        "stylesFactory":function ():void
                        {
                            this.color = 16189448;
                            this.textAlign = "center";
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":289.4,
                                "y":134,
                                "width":75.1,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundTextArea,
                        "id":"_BloodAddPanel_RoundTextArea1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":17,
                                "y":35,
                                "height":58,
                                "width":370
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundTextArea,
                        "id":"_BloodAddPanel_RoundTextArea2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":100,
                                "y":83,
                                "height":20,
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundTextArea,
                        "id":"_BloodAddPanel_RoundTextArea3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":17,
                                "y":110,
                                "height":20,
                                "width":120
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundTextArea,
                        "id":"_BloodAddPanel_RoundTextArea4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":17,
                                "y":135,
                                "height":20,
                                "width":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundTextArea,
                        "id":"_BloodAddPanel_RoundTextArea5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":215,
                                "y":135,
                                "height":20,
                                "width":100
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

        public function BloodAddPanel()
        {
            mx_internal::_document = this;
            this.width = 390;
            this.height = 205;
            this.x = 300;
            this.y = 200;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BloodAddPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get tt():RoundedLabel
        {
            return (this._3712tt);
        }

        [Bindable(event="propertyChange")]
        public function get addBtn():RoundedButton
        {
            return (this._1422541317addBtn);
        }

        public function set addBtn(_arg_1:RoundedButton):void
        {
            var _local_2:Object = this._1422541317addBtn;
            if (_local_2 !== _arg_1)
            {
                this._1422541317addBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addBtn", _local_2, _arg_1));
            };
        }

        public function showPanel(_arg_1:int):void
        {
            if (((visible) && (type == _arg_1)))
            {
                visible = false;
                return;
            };
            type = _arg_1;
            switch (type)
            {
                case 1:
                    lb.text = Language.BLOODADDPANEL_S[0];
                    break;
                case 2:
                    lb.text = Language.BLOODADDPANEL_S[1];
                    break;
                case 3:
                    lb.text = Language.BLOODADDPANEL_S[2];
                    break;
                case 4:
                    lb.text = Language.BLOODADDPANEL_S[3];
                    break;
            };
            if (!_core.bloodBag[type])
            {
                tt.text = "0/10000000";
            }
            else
            {
                tt.text = (_core.bloodBag[type] + "/10000000");
            };
            visible = true;
            ns.maximum = Math.max(0, (_core.bagMax[type] - _core.bloodBag[type]));
            ns.value = ns.maximum;
        }

        public function set ns(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._3525ns;
            if (_local_2 !== _arg_1)
            {
                this._3525ns = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb():RoundedLabel
        {
            return (this._3446lb);
        }

        private function full():void
        {
            buyInfoObj = new Object();
            buyInfoObj.bt = type;
            buyInfoObj.bn = (_core.bagMax[type] - _core.bloodBag[type]);
            var _local_1:String = Language.BLOODADDPANEL_S[11].replace("{gold}", needMoney(1, 1, buyInfoObj.bn));
            _local_1 = _local_1.replace("{name}", lb.text);
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, buyBlood);
        }

        override public function initialize():void
        {
            var target:BloodAddPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BloodAddPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_BloodAddPanelWatcherSetupUtil");
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

        private function buyBlood(e:CloseEvent=null):void
        {
            if (((e) && (!(e.detail == Alert.YES))))
            {
                return;
            };
            var bagpanel:Object = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuy), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doBuy(true);
            };
        }

        public function set fullBtn(_arg_1:RoundedButton):void
        {
            var _local_2:Object = this._511269555fullBtn;
            if (_local_2 !== _arg_1)
            {
                this._511269555fullBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fullBtn", _local_2, _arg_1));
            };
        }

        public function set tt(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3712tt;
            if (_local_2 !== _arg_1)
            {
                this._3712tt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tt", _local_2, _arg_1));
            };
        }

        public function __addBtn_click(_arg_1:MouseEvent):void
        {
            addBlood();
        }

        public function __fullBtn_click(_arg_1:MouseEvent):void
        {
            full();
        }

        [Bindable(event="propertyChange")]
        private function get type():int
        {
            return (this._3575610type);
        }

        [Bindable(event="propertyChange")]
        public function get ns():NumericStepper
        {
            return (this._3525ns);
        }

        private function needMoney(_arg_1:int, _arg_2:int, _arg_3:int):Number
        {
            var _local_4:Number = Math.ceil((_arg_3 / 5000));
            return (_local_4);
        }

        [Bindable(event="propertyChange")]
        public function get fullBtn():RoundedButton
        {
            return (this._511269555fullBtn);
        }

        private function addBlood():void
        {
            buyInfoObj = new Object();
            buyInfoObj.bt = type;
            buyInfoObj.bn = ns.value;
            if (buyInfoObj.bn > (_core.bagMax[type] - _core.bloodBag[type]))
            {
                _core.sysMidNote(Language.BLOODADDPANEL_S[4]);
                return;
            };
            if (buyInfoObj.bn <= 0)
            {
                _core.sysMidNote(Language.BLOODADDPANEL_S[5]);
                return;
            };
            var _local_1:String = Language.BLOODADDPANEL_S[11].replace("{gold}", needMoney(1, 1, buyInfoObj.bn));
            _local_1 = _local_1.replace("{name}", lb.text);
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, buyBlood);
        }

        private function _BloodAddPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.BLOODADDPANEL_U[0];
            _local_1 = Language.BLOODADDPANEL_S[6];
            _local_1 = Language.BLOODADDPANEL_S[7];
            _local_1 = Language.BLOODADDPANEL_S[8];
            _local_1 = ns.value;
            _local_1 = needMoney(_core.player.level, type, ns.value);
            _local_1 = Language.BLOODADDPANEL_U[1];
            _local_1 = Language.BLOODADDPANEL_U[2];
            _local_1 = Language.BLOODADDPANEL_U[3];
            _local_1 = Language.BLOODADDPANEL_U[4];
            _local_1 = Language.BLOODADDPANEL_U[5];
        }

        public function ___BloodAddPanel_RoundedButton3_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        private function _BloodAddPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BLOODADDPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodAddPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_BloodAddPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BLOODADDPANEL_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fullBtn.label = _arg_1;
            }, "fullBtn.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BLOODADDPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addBtn.label = _arg_1;
            }, "addBtn.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BLOODADDPANEL_S[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodAddPanel_RoundedButton3.label = _arg_1;
            }, "_BloodAddPanel_RoundedButton3.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ns.value;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodAddPanel_RoundedLabel3.text = _arg_1;
            }, "_BloodAddPanel_RoundedLabel3.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = needMoney(_core.player.level, type, ns.value);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodAddPanel_RoundedLabel4.text = _arg_1;
            }, "_BloodAddPanel_RoundedLabel4.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BLOODADDPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodAddPanel_RoundTextArea1.text = _arg_1;
            }, "_BloodAddPanel_RoundTextArea1.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BLOODADDPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodAddPanel_RoundTextArea2.text = _arg_1;
            }, "_BloodAddPanel_RoundTextArea2.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BLOODADDPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodAddPanel_RoundTextArea3.text = _arg_1;
            }, "_BloodAddPanel_RoundTextArea3.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BLOODADDPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodAddPanel_RoundTextArea4.text = _arg_1;
            }, "_BloodAddPanel_RoundTextArea4.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BLOODADDPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodAddPanel_RoundTextArea5.text = _arg_1;
            }, "_BloodAddPanel_RoundTextArea5.text");
            result[10] = binding;
            return (result);
        }

        public function set lb(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3446lb;
            if (_local_2 !== _arg_1)
            {
                this._3446lb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb", _local_2, _arg_1));
            };
        }

        private function set type(_arg_1:int):void
        {
            var _local_2:Object = this._3575610type;
            if (_local_2 !== _arg_1)
            {
                this._3575610type = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "type", _local_2, _arg_1));
            };
        }

        public function doBuy(_arg_1:Boolean):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((_local_2) && (_local_2.goldSelected)))
                {
                    _local_2.goldLockFlag = false;
                };
                _core.remote.buyBloodBag(buyInfoObj);
                visible = false;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

