// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AddOpePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.NumericStepper;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.events.NumericStepperEvent;
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

    public class AddOpePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _109446num:NumericStepper;
        private var _haveAddNum:Number = 0;
        public var _AddOpePanel_Label1:Label;
        public var _AddOpePanel_Label2:Label;
        private var _865288726needGold:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":190,
                    "height":130,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_AddOpePanel_Label1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":34,
                                "y":43,
                                "text":"增加次数："
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_AddOpePanel_Label2",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":34,
                                "y":71,
                                "text":"消耗金子："
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"needGold",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":89,
                                "y":71,
                                "text":"11111"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "events":{"click":"___AddOpePanel_BasicDelayButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.paddingBottom = 0;
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                            this.paddingTop = 0;
                            this.cornerRadius = 3;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":99,
                                "x":34,
                                "styleName":"BtnStdGreen",
                                "label":"确定",
                                "width":40,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "events":{"click":"___AddOpePanel_BasicDelayButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.paddingBottom = 0;
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                            this.paddingTop = 0;
                            this.cornerRadius = 3;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":99,
                                "x":107,
                                "styleName":"BtnStdGreen",
                                "label":"取消",
                                "width":40,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"num",
                        "events":{"change":"__num_change"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":89,
                                "y":41,
                                "value":1,
                                "maximum":99
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private const GOLD_NEED_ARR:Array = [260, 260, 260, 260, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AddOpePanel()
        {
            mx_internal::_document = this;
            this.width = 190;
            this.height = 130;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AddOpePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get needGold():Label
        {
            return (this._865288726needGold);
        }

        [Bindable(event="propertyChange")]
        public function get num():NumericStepper
        {
            return (this._109446num);
        }

        public function set needGold(_arg_1:Label):void
        {
            var _local_2:Object = this._865288726needGold;
            if (_local_2 !== _arg_1)
            {
                this._865288726needGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needGold", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:AddOpePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AddOpePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AddOpePanelWatcherSetupUtil");
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

        private function _AddOpePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function set num(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._109446num;
            if (_local_2 !== _arg_1)
            {
                this._109446num = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "num", _local_2, _arg_1));
            };
        }

        private function click1():void
        {
            _core.remote.call("addDragonBallNum", null, _core.cid, Number(num.value), Number(needGold.text));
            this.visible = false;
        }

        private function click2():void
        {
            this.visible = false;
        }

        private function goldChange():void
        {
            var _local_1:Number = Number(num.value);
            var _local_2:Number = 0;
            var _local_3:Number = _haveAddNum;
            var _local_4:int;
            while (_local_4 < _local_1)
            {
                if (_local_3 >= GOLD_NEED_ARR.length)
                {
                    _local_2 = (_local_2 + GOLD_NEED_ARR[(GOLD_NEED_ARR.length - 1)]);
                }
                else
                {
                    _local_2 = (_local_2 + GOLD_NEED_ARR[_local_3]);
                };
                _local_3 = (_local_3 + 1);
                _local_4++;
            };
            needGold.text = _local_2.toString();
        }

        private function _AddOpePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AddOpePanel_Label1.filters = _arg_1;
            }, "_AddOpePanel_Label1.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AddOpePanel_Label2.filters = _arg_1;
            }, "_AddOpePanel_Label2.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                needGold.filters = _arg_1;
            }, "needGold.filters");
            result[2] = binding;
            return (result);
        }

        public function ___AddOpePanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            click1();
        }

        public function ___AddOpePanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            click2();
        }

        public function __num_change(_arg_1:NumericStepperEvent):void
        {
            goldChange();
        }

        public function updatePanel(_arg_1:Number):void
        {
            if (!visible)
            {
                this.show();
            };
            if (!initialized)
            {
                callLater(updatePanel, [_arg_1]);
                return;
            };
            _haveAddNum = _arg_1;
            var _local_2:Number = Number(num.value);
            var _local_3:Number = 0;
            var _local_4:Number = _haveAddNum;
            var _local_5:int;
            while (_local_5 < _local_2)
            {
                if (_local_4 >= GOLD_NEED_ARR.length)
                {
                    _local_3 = (_local_3 + GOLD_NEED_ARR[(GOLD_NEED_ARR.length - 1)]);
                }
                else
                {
                    _local_3 = (_local_3 + GOLD_NEED_ARR[_local_4]);
                };
                _local_4 = (_local_4 + 1);
                _local_5++;
            };
            needGold.text = _local_3.toString();
        }


    }
}//package com.qeedoo.ui.view.compDragable

