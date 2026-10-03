// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ExtractCharactor

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
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

    public class ExtractCharactor extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _109446num:Label;
        private var _1564195935charactor:RoundedLabel;
        private var c:String = "";
        private var key:int = -1;
        private var n:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":48,
                    "height":48,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"charactor",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 40;
                            this.color = 0xFFFF00;
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "mouseEnabled":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"num",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "0";
                            this.right = "0";
                            this.fontSize = 10;
                            this.textAlign = "right";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":60,
                                "height":20,
                                "mouseEnabled":false
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ExtractCharactor()
        {
            mx_internal::_document = this;
            this.width = 48;
            this.height = 48;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ExtractCharactor._watcherSetupUtil = _arg_1;
        }


        public function set charactor(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1564195935charactor;
            if (_local_2 !== _arg_1)
            {
                this._1564195935charactor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charactor", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get num():Label
        {
            return (this._109446num);
        }

        override public function initialize():void
        {
            var target:ExtractCharactor;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ExtractCharactor_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ExtractCharactorWatcherSetupUtil");
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

        private function completeHandler(_arg_1:FlexEvent):void
        {
            removeEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
            refresh(key, c, n);
        }

        public function set num(_arg_1:Label):void
        {
            var _local_2:Object = this._109446num;
            if (_local_2 !== _arg_1)
            {
                this._109446num = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "num", _local_2, _arg_1));
            };
        }

        public function refresh(_arg_1:int, _arg_2:String, _arg_3:int):void
        {
            this.key = _arg_1;
            this.c = _arg_2;
            this.n = _arg_3;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            charactor.text = _arg_2;
            num.text = _arg_3.toString();
            num.visible = (_arg_3 > 0);
        }

        public function refreshNum(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.data)))
            {
                this.n = _arg_1.data[key];
                num.text = n.toString();
                num.visible = (n > 0);
            };
        }

        private function _ExtractCharactor_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                num.filters = _arg_1;
            }, "num.filters");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get charactor():RoundedLabel
        {
            return (this._1564195935charactor);
        }

        private function _ExtractCharactor_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }


    }
}//package com.qeedoo.ui.view.comp

