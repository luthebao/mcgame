// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BackgroundLabel

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class BackgroundLabel extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var clickCall:Function;
        private var _1215755049nameLabel:Label;
        public var recipeId:int;
        private var _607740351labelText:String = "";
        private var _color:uint;
        private var _labelSelected:Boolean = false;
        private var _1657211086labelWidth:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameLabel",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":5});
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function BackgroundLabel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0;
                this.backgroundColor = 0xFFFF00;
            };
            this.percentWidth = 100;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("click", ___BackgroundLabel_Canvas1_click);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BackgroundLabel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get labelText():String
        {
            return (this._607740351labelText);
        }

        public function set labelText(_arg_1:String):void
        {
            var _local_2:Object = this._607740351labelText;
            if (_local_2 !== _arg_1)
            {
                this._607740351labelText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelText", _local_2, _arg_1));
            };
        }

        public function setLabelColor(_arg_1:uint):void
        {
            _color = _arg_1;
            nameLabel.setStyle("color", _color);
        }

        override public function initialize():void
        {
            var target:BackgroundLabel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BackgroundLabel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_BackgroundLabelWatcherSetupUtil");
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

        private function _BackgroundLabel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = labelWidth;
            _local_1 = labelText;
        }

        public function set nameLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1215755049nameLabel;
            if (_local_2 !== _arg_1)
            {
                this._1215755049nameLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLabel", _local_2, _arg_1));
            };
        }

        public function set labelSelected(_arg_1:Boolean):void
        {
            _labelSelected = _arg_1;
            if (_arg_1)
            {
                setStyle("backgroundAlpha", "1");
                nameLabel.setStyle("color", 0);
            }
            else
            {
                setStyle("backgroundAlpha", "0");
                nameLabel.setStyle("color", _color);
            };
        }

        public function clickHandler():void
        {
            ((clickCall) && (clickCall(recipeId)));
        }

        private function _BackgroundLabel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Number
            {
                return (labelWidth);
            }, function (_arg_1:Number):void
            {
                nameLabel.width = _arg_1;
            }, "nameLabel.width");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = labelText;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nameLabel.text = _arg_1;
            }, "nameLabel.text");
            result[1] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get nameLabel():Label
        {
            return (this._1215755049nameLabel);
        }

        public function ___BackgroundLabel_Canvas1_click(_arg_1:MouseEvent):void
        {
            clickHandler();
        }

        public function set labelWidth(_arg_1:Number):void
        {
            var _local_2:Object = this._1657211086labelWidth;
            if (_local_2 !== _arg_1)
            {
                this._1657211086labelWidth = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelWidth", _local_2, _arg_1));
            };
        }

        public function get labelSelected():Boolean
        {
            return (_labelSelected);
        }

        [Bindable(event="propertyChange")]
        public function get labelWidth():Number
        {
            return (this._1657211086labelWidth);
        }


    }
}//package com.qeedoo.ui.view.comp

