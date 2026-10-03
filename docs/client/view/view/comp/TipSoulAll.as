// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipSoulAll

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.List;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.core.ClassFactory;
    import mx.events.ResizeEvent;
    import mx.events.PropertyChangeEvent;
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

    public class TipSoulAll extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1740106033soulList:List;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":List,
                        "id":"soulList",
                        "stylesFactory":function ():void
                        {
                            this.backgroundAlpha = 0;
                            this.right = "0";
                            this.borderStyle = "none";
                            this.left = "0";
                            this.top = "35";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "itemRenderer":_TipSoulAll_ClassFactory1_c(),
                                "width":250,
                                "height":200
                            });
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipSoulAll()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipSoulAll_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipSoulAll._watcherSetupUtil = _arg_1;
        }


        public function set object(_arg_1:Array):void
        {
            soulList.height = (_arg_1.length * 25);
            soulList.dataProvider = _arg_1;
        }

        override public function initialize():void
        {
            var target:TipSoulAll;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipSoulAll_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipSoulAllWatcherSetupUtil");
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

        private function _TipSoulAll_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererLabel2;
            return (_local_1);
        }

        private function _TipSoulAll_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                soulList.setStyle("borderSkin", _arg_1);
            }, "soulList.borderSkin");
            result[0] = binding;
            return (result);
        }

        public function ___TipSoulAll_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function _TipSoulAll_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = null;
        }

        public function set soulList(_arg_1:List):void
        {
            var _local_2:Object = this._1740106033soulList;
            if (_local_2 !== _arg_1)
            {
                this._1740106033soulList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get soulList():List
        {
            return (this._1740106033soulList);
        }

        override public function show(_arg_1:Object=null):void
        {
            setPos();
            this.visible = true;
        }


    }
}//package com.qeedoo.ui.view.comp

