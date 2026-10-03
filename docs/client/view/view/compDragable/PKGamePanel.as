// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PKGamePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
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

    public class PKGamePanel extends DragableCanvas implements IBindingClient 
    {

        public static const BGIMGST:Class = PKGamePanel_BGIMGST;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _PKGamePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2099860260bgForPromote:Canvas;
        private var url:* = "http://bbs.mc.lezi.com/forum.php?mod=viewthread&tid=19877&extra=page%3D1";
        public var _PKGamePanel_Image1:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":790,
                    "height":560,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PKGamePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"bgForPromote",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "width":770,
                                "y":33,
                                "height":520,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_PKGamePanel_Image1",
                                    "events":{"click":"___PKGamePanel_Image1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "buttonMode":true
                                        });
                                    }
                                })]
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

        public function PKGamePanel()
        {
            mx_internal::_document = this;
            this.width = 790;
            this.height = 560;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PKGamePanel._watcherSetupUtil = _arg_1;
        }


        private function _PKGamePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PK_GAME_PANEL[0];
            _local_1 = BGIMGST;
        }

        public function showPanel():void
        {
            visible = true;
        }

        private function _PKGamePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PK_GAME_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PKGamePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PKGamePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (BGIMGST);
            }, function (_arg_1:Object):void
            {
                _PKGamePanel_Image1.source = _arg_1;
            }, "_PKGamePanel_Image1.source");
            result[1] = binding;
            return (result);
        }

        protected function image1_clickHandler(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(url), "_blank");
        }

        override public function initialize():void
        {
            var target:PKGamePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PKGamePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PKGamePanelWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get bgForPromote():Canvas
        {
            return (this._2099860260bgForPromote);
        }

        public function ___PKGamePanel_Image1_click(_arg_1:MouseEvent):void
        {
            image1_clickHandler(_arg_1);
        }

        public function set bgForPromote(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2099860260bgForPromote;
            if (_local_2 !== _arg_1)
            {
                this._2099860260bgForPromote = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgForPromote", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

