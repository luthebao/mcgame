// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PropertyBar

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class PropertyBar extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _PropertyBar_SimpleCanvas2:SimpleCanvas;
        private var _1565881260fontColor:uint = 0xFFFFFF;
        private var _993843058propName:String = "Prop";
        private var _350039366frontColor:uint = 7527271;
        private var _1213523686infoLabel:Label;
        private var _1309160124backColor:uint = 0;
        private var _1410180319valueMin:int = 0;
        private var _1576354554barCornerRadius:int = 4;
        private var _1319662702_valueMax:int = 0;
        private var _value:int = 0;
        private var _2067279966showTip:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "height":18,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"_PropertyBar_SimpleCanvas2",
                        "stylesFactory":function ():void
                        {
                            this.left = "0";
                            this.top = "0";
                            this.bottom = "0";
                            this.borderStyle = "solid";
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"infoLabel",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":0});
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PropertyBar()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.borderStyle = "solid";
                this.borderColor = 1656937;
                this.cornerRadius = 3;
            };
            this.width = 200;
            this.height = 18;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PropertyBar._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get barCornerRadius():int
        {
            return (this._1576354554barCornerRadius);
        }

        public function set barCornerRadius(_arg_1:int):void
        {
            var _local_2:Object = this._1576354554barCornerRadius;
            if (_local_2 !== _arg_1)
            {
                this._1576354554barCornerRadius = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barCornerRadius", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propName():String
        {
            return (this._993843058propName);
        }

        [Bindable(event="propertyChange")]
        private function get _valueMax():int
        {
            return (this._1319662702_valueMax);
        }

        override public function initialize():void
        {
            var target:PropertyBar;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PropertyBar_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PropertyBarWatcherSetupUtil");
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

        public function set propName(_arg_1:String):void
        {
            var _local_2:Object = this._993843058propName;
            if (_local_2 !== _arg_1)
            {
                this._993843058propName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propName", _local_2, _arg_1));
            };
        }

        public function setColor(_arg_1:uint):void
        {
            frontColor = _arg_1;
        }

        private function set _valueMax(_arg_1:int):void
        {
            var _local_2:Object = this._1319662702_valueMax;
            if (_local_2 !== _arg_1)
            {
                this._1319662702_valueMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_valueMax", _local_2, _arg_1));
            };
        }

        public function set fontColor(_arg_1:uint):void
        {
            var _local_2:Object = this._1565881260fontColor;
            if (_local_2 !== _arg_1)
            {
                this._1565881260fontColor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fontColor", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get valueMin():int
        {
            return (this._1410180319valueMin);
        }

        public function get valueMax():int
        {
            return (_valueMax);
        }

        private function _PropertyBar_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = backColor;
            _local_1 = ((value / _valueMax) * width);
            _local_1 = frontColor;
            _local_1 = barCornerRadius;
            _local_1 = ((((propName + ":") + value.toString()) + "/") + _valueMax.toString());
            _local_1 = showTip;
            _local_1 = fontColor;
        }

        [Bindable(event="propertyChange")]
        public function get frontColor():uint
        {
            return (this._350039366frontColor);
        }

        [Bindable(event="propertyChange")]
        public function get backColor():uint
        {
            return (this._1309160124backColor);
        }

        public function set valueMin(_arg_1:int):void
        {
            var _local_2:Object = this._1410180319valueMin;
            if (_local_2 !== _arg_1)
            {
                this._1410180319valueMin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "valueMin", _local_2, _arg_1));
            };
        }

        public function set showTip(_arg_1:Boolean):void
        {
            var _local_2:Object = this._2067279966showTip;
            if (_local_2 !== _arg_1)
            {
                this._2067279966showTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showTip", _local_2, _arg_1));
            };
        }

        public function set infoLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1213523686infoLabel;
            if (_local_2 !== _arg_1)
            {
                this._1213523686infoLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showTip():Boolean
        {
            return (this._2067279966showTip);
        }

        [Bindable(event="propertyChange")]
        public function get fontColor():uint
        {
            return (this._1565881260fontColor);
        }

        public function set valueMax(_arg_1:int):void
        {
            _valueMax = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function set value(_arg_1:int):void
        {
            var _local_2:Object = this.value;
            if (_local_2 !== _arg_1)
            {
                this._111972721value = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "value", _local_2, _arg_1));
            };
        }

        private function _PropertyBar_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():uint
            {
                return (backColor);
            }, function (_arg_1:uint):void
            {
                this.setStyle("backgroundColor", _arg_1);
            }, "this.backgroundColor");
            result[0] = binding;
            binding = new Binding(this, function ():Number
            {
                return ((value / _valueMax) * width);
            }, function (_arg_1:Number):void
            {
                _PropertyBar_SimpleCanvas2.width = _arg_1;
            }, "_PropertyBar_SimpleCanvas2.width");
            result[1] = binding;
            binding = new Binding(this, function ():uint
            {
                return (frontColor);
            }, function (_arg_1:uint):void
            {
                _PropertyBar_SimpleCanvas2.setStyle("backgroundColor", _arg_1);
            }, "_PropertyBar_SimpleCanvas2.backgroundColor");
            result[2] = binding;
            binding = new Binding(this, function ():Number
            {
                return (barCornerRadius);
            }, function (_arg_1:Number):void
            {
                _PropertyBar_SimpleCanvas2.setStyle("cornerRadius", _arg_1);
            }, "_PropertyBar_SimpleCanvas2.cornerRadius");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((((propName + ":") + value.toString()) + "/") + _valueMax.toString());
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                infoLabel.text = _arg_1;
            }, "infoLabel.text");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (showTip);
            }, function (_arg_1:Boolean):void
            {
                infoLabel.visible = _arg_1;
            }, "infoLabel.visible");
            result[5] = binding;
            binding = new Binding(this, function ():uint
            {
                return (fontColor);
            }, function (_arg_1:uint):void
            {
                infoLabel.setStyle("color", _arg_1);
            }, "infoLabel.color");
            result[6] = binding;
            return (result);
        }

        public function get value():int
        {
            if (_value > _valueMax)
            {
                return (_valueMax);
            };
            return (_value);
        }

        public function set frontColor(_arg_1:uint):void
        {
            var _local_2:Object = this._350039366frontColor;
            if (_local_2 !== _arg_1)
            {
                this._350039366frontColor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "frontColor", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoLabel():Label
        {
            return (this._1213523686infoLabel);
        }

        public function set backColor(_arg_1:uint):void
        {
            var _local_2:Object = this._1309160124backColor;
            if (_local_2 !== _arg_1)
            {
                this._1309160124backColor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backColor", _local_2, _arg_1));
            };
        }

        private function set _111972721value(_arg_1:int):void
        {
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            if (((_valueMax > 0) && (_arg_1 > _valueMax)))
            {
                _arg_1 = _valueMax;
            };
            _value = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.comp

