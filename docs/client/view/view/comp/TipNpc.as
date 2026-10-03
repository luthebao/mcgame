// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipNpc

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.states.RemoveChild;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.containers.Canvas;
    import mx.utils.ObjectProxy;
    import mx.core.mx_internal;
    import mx.states.State;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import mx.events.ResizeEvent;
    import flash.display.DisplayObject;
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

    public class TipNpc extends BasicToolTip implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var nid:Number = -1;
        public var _TipNpc_Text2:Text;
        public var _TipNpc_RemoveChild1:RemoveChild;
        public var _TipNpc_RemoveChild2:RemoveChild;
        public var _TipNpc_RemoveChild3:RemoveChild;
        public var _TipNpc_RemoveChild4:RemoveChild;
        public var _TipNpc_Label1:Label;
        private var _1656229167levelText:Text;
        private var _3560141time:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 0;
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":30,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipNpc_Label1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.color = 0xFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"percentWidth":100});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"levelText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16708542;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"等级:",
                                            "x":45,
                                            "y":23
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipNpc_Text2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16708542;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"产量:"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"time",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16708542;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"时间:"});
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        private var _95064_vo:ObjectProxy = new ObjectProxy();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipNpc()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.states = [_TipNpc_State1_c(), _TipNpc_State2_c(), _TipNpc_State3_c(), _TipNpc_State4_c()];
            this.addEventListener("resize", ___TipNpc_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipNpc._watcherSetupUtil = _arg_1;
        }


        private function _TipNpc_State4_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "gather";
            _local_1.overrides = [_TipNpc_RemoveChild3_i(), _TipNpc_RemoveChild4_i()];
            return (_local_1);
        }

        override public function show(_arg_1:Object=null):void
        {
            super.show(_arg_1);
            addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        }

        private function _TipNpc_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "herb";
            _local_1.overrides = [_TipNpc_RemoveChild1_i()];
            return (_local_1);
        }

        public function set gatherData(_arg_1:Object):void
        {
            if (_arg_1)
            {
                _vo.name = _arg_1.name;
                _vo.amountTxt = Language.TIP_NPC_U[7].toString().replace("{amount}", _arg_1.remain);
            };
            currentState = "gather";
        }

        override public function initialize():void
        {
            var target:TipNpc;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipNpc_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipNpcWatcherSetupUtil");
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

        private function _TipNpc_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = time;
            _local_1 = time;
            _local_1 = levelText;
            _local_1 = time;
            _local_1 = _vo.name;
            _local_1 = Language.TIPSKILL_S[10];
            _local_1 = _vo.lvTxt;
            _local_1 = _vo.amountTxt;
            _local_1 = _vo.timeTxt;
        }

        public function set time(_arg_1:Text):void
        {
            var _local_2:Object = this._3560141time;
            if (_local_2 !== _arg_1)
            {
                this._3560141time = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "time", _local_2, _arg_1));
            };
        }

        public function set levelText(_arg_1:Text):void
        {
            var _local_2:Object = this._1656229167levelText;
            if (_local_2 !== _arg_1)
            {
                this._1656229167levelText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelText", _local_2, _arg_1));
            };
        }

        private function set _vo(_arg_1:ObjectProxy):void
        {
            var _local_2:Object = this._95064_vo;
            if (_local_2 !== _arg_1)
            {
                this._95064_vo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_vo", _local_2, _arg_1));
            };
        }

        public function set fishPoolData(_arg_1:Object):void
        {
            if (_arg_1)
            {
                _vo.lvTxt = Language.TIP_NPC_U[6].toString().replace("{level}", _arg_1.level);
                _vo.amountTxt = Language.TIP_NPC_U[7].toString().replace("{amount}", _arg_1.remain);
                _vo.name = _arg_1.name;
            };
            currentState = "fish";
        }

        private function _TipNpc_RemoveChild2_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _TipNpc_RemoveChild2 = _local_1;
            BindingManager.executeBindings(this, "_TipNpc_RemoveChild2", _TipNpc_RemoveChild2);
            return (_local_1);
        }

        override public function hide():void
        {
            super.hide();
            removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
            nid = -1;
        }

        private function _TipNpc_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "plant";
            return (_local_1);
        }

        private function _TipNpc_State3_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "fish";
            _local_1.overrides = [_TipNpc_RemoveChild2_i()];
            return (_local_1);
        }

        private function onMouseDown(_arg_1:MouseEvent):void
        {
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get time():Text
        {
            return (this._3560141time);
        }

        private function _TipNpc_RemoveChild4_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _TipNpc_RemoveChild4 = _local_1;
            BindingManager.executeBindings(this, "_TipNpc_RemoveChild4", _TipNpc_RemoveChild4);
            return (_local_1);
        }

        public function ___TipNpc_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        [Bindable(event="propertyChange")]
        public function get levelText():Text
        {
            return (this._1656229167levelText);
        }

        private function _TipNpc_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():DisplayObject
            {
                return (time);
            }, function (_arg_1:DisplayObject):void
            {
                _TipNpc_RemoveChild1.target = _arg_1;
            }, "_TipNpc_RemoveChild1.target");
            result[0] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (time);
            }, function (_arg_1:DisplayObject):void
            {
                _TipNpc_RemoveChild2.target = _arg_1;
            }, "_TipNpc_RemoveChild2.target");
            result[1] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (levelText);
            }, function (_arg_1:DisplayObject):void
            {
                _TipNpc_RemoveChild3.target = _arg_1;
            }, "_TipNpc_RemoveChild3.target");
            result[2] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (time);
            }, function (_arg_1:DisplayObject):void
            {
                _TipNpc_RemoveChild4.target = _arg_1;
            }, "_TipNpc_RemoveChild4.target");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipNpc_Label1.htmlText = _arg_1;
            }, "_TipNpc_Label1.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPSKILL_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipNpc_Label1.text = _arg_1;
            }, "_TipNpc_Label1.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _vo.lvTxt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                levelText.htmlText = _arg_1;
            }, "levelText.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _vo.amountTxt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipNpc_Text2.htmlText = _arg_1;
            }, "_TipNpc_Text2.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _vo.timeTxt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                time.htmlText = _arg_1;
            }, "time.htmlText");
            result[8] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        private function get _vo():ObjectProxy
        {
            return (this._95064_vo);
        }

        public function set plantData(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:String;
            var _local_4:String;
            if (_arg_1)
            {
                _vo.lvTxt = Language.TIP_NPC_U[0].toString().replace("{level}", _arg_1.level);
                _vo.amountTxt = Language.TIP_NPC_U[1].toString().replace("{amount}", ((_arg_1.remain + " / ") + _arg_1.total));
                _local_2 = BasicToolTip.COLOR_ANY.replace("{colorStr}", "#8BC9FE").replace("{str}", _arg_1.name);
                _vo.name = Language.TIP_NPC_U[8].toString().replace("{ownerName}", _arg_1.ownerName).replace("{plantName}", _local_2);
                _local_3 = ((_arg_1.state == 3) ? Language.TIP_NPC_U[2] : Language.TIP_NPC_U[3]);
                if (Number(_arg_1.timeLeft) >= (1000 * 60))
                {
                    _local_4 = Language.TIP_NPC_U[4].toString().replace("{value}", Math.floor((_arg_1.timeLeft / (1000 * 60))));
                }
                else
                {
                    _local_4 = Language.TIP_NPC_U[5].toString().replace("{value}", Math.floor((_arg_1.timeLeft / 1000)));
                };
                _vo.timeTxt = (_local_3 + _local_4);
            };
            currentState = "plant";
        }

        public function set herbData(_arg_1:Object):void
        {
            if (_arg_1)
            {
                _vo.lvTxt = Language.TIP_NPC_U[6].toString().replace("{level}", _arg_1.level);
                _vo.amountTxt = Language.TIP_NPC_U[7].toString().replace("{amount}", _arg_1.remain);
                _vo.name = _arg_1.name;
            };
            currentState = "herb";
        }

        private function _TipNpc_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _TipNpc_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_TipNpc_RemoveChild1", _TipNpc_RemoveChild1);
            return (_local_1);
        }

        private function _TipNpc_RemoveChild3_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _TipNpc_RemoveChild3 = _local_1;
            BindingManager.executeBindings(this, "_TipNpc_RemoveChild3", _TipNpc_RemoveChild3);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.comp

