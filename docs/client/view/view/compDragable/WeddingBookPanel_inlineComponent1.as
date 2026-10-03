// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WeddingBookPanel_inlineComponent1

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.system.Core;
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

    public class WeddingBookPanel_inlineComponent1 extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _88844982outerDocument:WeddingBookPanel;
        public var _WeddingBookPanel_inlineComponent1_BasicGlowButton1:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_WeddingBookPanel_inlineComponent1_BasicGlowButton1",
                        "events":{"click":"___WeddingBookPanel_inlineComponent1_BasicGlowButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnNormalRed"});
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WeddingBookPanel_inlineComponent1()
        {
            mx_internal::_document = this;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WeddingBookPanel_inlineComponent1._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get outerDocument():WeddingBookPanel
        {
            return (this._88844982outerDocument);
        }

        private function _WeddingBookPanel_inlineComponent1_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WEDDING_BOOK_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WeddingBookPanel_inlineComponent1_BasicGlowButton1.label = _arg_1;
            }, "_WeddingBookPanel_inlineComponent1_BasicGlowButton1.label");
            result[0] = binding;
            return (result);
        }

        public function ___WeddingBookPanel_inlineComponent1_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            enterWeddingHall();
        }

        override public function initialize():void
        {
            var target:WeddingBookPanel_inlineComponent1;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WeddingBookPanel_inlineComponent1_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WeddingBookPanel_inlineComponent1WatcherSetupUtil");
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

        private function _WeddingBookPanel_inlineComponent1_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WEDDING_BOOK_PANEL_U[11];
        }

        private function enterWeddingHall():void
        {
            Core.getInstance().remote.enterWeddingHall(data.cid);
        }

        public function set outerDocument(_arg_1:WeddingBookPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

