// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SendCombineActPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Box;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.SendCombineItem;
    import mx.events.FlexEvent;
    import flash.net.Responder;
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

    public class SendCombineActPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3613077vbox:Box;
        private var lastSelectedIndex:int = -1;
        public var _SendCombineActPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _908579523scTime:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":635,
                    "height":480,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SendCombineActPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.bottom = "40";
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Box,
                                    "id":"vbox",
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "direction":"vertical",
                                            "x":5,
                                            "y":0,
                                            "width":625,
                                            "height":394,
                                            "verticalScrollPolicy":"auto",
                                            "horizontalScrollPolicy":"auto"
                                        });
                                    }
                                })]});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"scTime",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                            this.color = 0xFF0000;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":220,
                                "text":"",
                                "width":300
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var wlListItemArr:Array = new Array();
        private var actIndex:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SendCombineActPanel()
        {
            mx_internal::_document = this;
            this.width = 635;
            this.height = 480;
            this.styleName = "StandardContent";
            this.x = 135;
            this.y = 308;
            this.addEventListener("creationComplete", ___SendCombineActPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SendCombineActPanel._watcherSetupUtil = _arg_1;
        }


        private function _SendCombineActPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SEND_COMBINE_PANEL[7];
        }

        override public function initialize():void
        {
            var target:SendCombineActPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SendCombineActPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SendCombineActPanelWatcherSetupUtil");
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

        public function onGetSendCombineAct(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:int;
            var _local_4:SendCombineItem;
            if (!_arg_1)
            {
                return;
            };
            vbox.removeAllChildren();
            for (_local_2 in _arg_1)
            {
                _local_3 = int(_local_2);
                _arg_1[_local_2].index = _local_2;
                _local_4 = new SendCombineItem();
                _local_4.data = _arg_1[_local_2];
                vbox.addChild(_local_4);
                scTime.text = (Language.SEND_COMBINE_PANEL[9] + timeToDate(_arg_1[_local_2].end));
            };
        }

        [Bindable(event="propertyChange")]
        public function get scTime():Label
        {
            return (this._908579523scTime);
        }

        public function ___SendCombineActPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function init():void
        {
            _core.remote.call("getSendCombineAct", new Responder(onGetSendCombineAct));
        }

        [Bindable(event="propertyChange")]
        public function get vbox():Box
        {
            return (this._3613077vbox);
        }

        public function set scTime(_arg_1:Label):void
        {
            var _local_2:Object = this._908579523scTime;
            if (_local_2 !== _arg_1)
            {
                this._908579523scTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scTime", _local_2, _arg_1));
            };
        }

        public function set vbox(_arg_1:Box):void
        {
            var _local_2:Object = this._3613077vbox;
            if (_local_2 !== _arg_1)
            {
                this._3613077vbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox", _local_2, _arg_1));
            };
        }

        private function timeToDate(_arg_1:Number):String
        {
            var _local_2:Date = new Date();
            if (_arg_1)
            {
                _local_2 = new Date(_arg_1);
            };
            return (((((((((_local_2.getMonth() + 1) < 10) ? ("0" + (_local_2.getMonth() + 1)) : (_local_2.getMonth() + 1)) + "/") + _local_2.getDate()) + " ") + ((_local_2.getHours() < 10) ? ("0" + _local_2.getHours()) : _local_2.getHours())) + ":") + ((_local_2.getMinutes() < 10) ? ("0" + _local_2.getMinutes()) : _local_2.getMinutes()));
        }

        private function _SendCombineActPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEND_COMBINE_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SendCombineActPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SendCombineActPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

