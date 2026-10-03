// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.RedEnvelopePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.comp.RedEnvelopeSingle;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
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

    public class RedEnvelopePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _RedEnvelopePanel_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":400,
                    "height":470,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_RedEnvelopePanel_BasicTitleCanvas1"
                    })]
                });
            }
        });
        public var RedEnvelopePanelList:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RedEnvelopePanel()
        {
            mx_internal::_document = this;
            this.width = 400;
            this.height = 470;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RedEnvelopePanel._watcherSetupUtil = _arg_1;
        }


        public function openRESingle(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (!_arg_1)
            {
                return;
            };
            if (((_arg_1) && (_arg_1.data.v)))
            {
                _local_2 = RedEnvelopePanelList[_arg_1.data.v];
                if (_local_2)
                {
                    _local_3 = Core.getInstance().view.getUI(ViewManager.UI_PANEL).owns(_local_2);
                    if (_local_3)
                    {
                        _local_2.onREopenHandler(_arg_1);
                    }
                    else
                    {
                        Core.getInstance().view.getUI(ViewManager.UI_PANEL).addChild(_local_2);
                        _local_2.onREopenHandler(_arg_1);
                    };
                }
                else
                {
                    _local_4 = new RedEnvelopeSingle();
                    _local_4.cid = Core.getInstance().cid;
                    Core.getInstance().view.getUI(ViewManager.UI_PANEL).addChild(_local_4);
                    RedEnvelopePanelList[_arg_1.data.v] = _local_4;
                    _local_4.onREopenHandler(_arg_1);
                };
            };
        }

        public function showPanel():void
        {
            initView();
            visible = false;
        }

        private function _RedEnvelopePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.RE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RedEnvelopePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_RedEnvelopePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:RedEnvelopePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RedEnvelopePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_RedEnvelopePanelWatcherSetupUtil");
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
        }

        public function hideAllRedEvnelope():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            for (_local_1 in RedEnvelopePanelList)
            {
                _local_2 = RedEnvelopePanelList[_local_1];
                _local_3 = Core.getInstance().view.getUI(ViewManager.UI_PANEL).owns(_local_2);
                if (_local_3)
                {
                    Core.getInstance().view.getUI(ViewManager.UI_PANEL).removeChild(_local_2);
                };
            };
            RedEnvelopePanelList = [];
        }

        private function _RedEnvelopePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.RE_PANEL[0];
        }


    }
}//package com.qeedoo.ui.view.compDragable

