// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PVPResultPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
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

    public class PVPResultPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _PVPResultPanel_Button1:Button;
        private var _2053377414battleInfo:IntroText;
        private var _2942945_res:String = "";

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":282,
                    "height":143,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"battleInfo",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "21";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":102});
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_PVPResultPanel_Button1",
                        "events":{"click":"___PVPResultPanel_Button1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":102,
                                "y":86,
                                "width":78,
                                "height":28,
                                "styleName":"BtnStdRed"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PVPResultPanel()
        {
            mx_internal::_document = this;
            this.width = 282;
            this.height = 143;
            this.x = 300;
            this.y = 200;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PVPResultPanel._watcherSetupUtil = _arg_1;
        }


        public function showResult(_arg_1:Object):void
        {
            var _local_2:String = Language.PVP_GROUP_P[21].toString().replace("{rank}", _arg_1.rank).replace("{point}", _arg_1.point);
            if (((!(_arg_1.pvpPoint)) || (Number(_arg_1.pvpPoint) == 0)))
            {
                _local_2 = Language.PVP_GROUP_P[24].toString().replace("{rank}", _arg_1.rank);
            };
            _res = _local_2;
            this.visible = true;
        }

        private function set _res(_arg_1:String):void
        {
            var _local_2:Object = this._2942945_res;
            if (_local_2 !== _arg_1)
            {
                this._2942945_res = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_res", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battleInfo():IntroText
        {
            return (this._2053377414battleInfo);
        }

        override public function initialize():void
        {
            var target:PVPResultPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PVPResultPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PVPResultPanelWatcherSetupUtil");
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

        public function set battleInfo(_arg_1:IntroText):void
        {
            var _local_2:Object = this._2053377414battleInfo;
            if (_local_2 !== _arg_1)
            {
                this._2053377414battleInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleInfo", _local_2, _arg_1));
            };
        }

        private function _PVPResultPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _res;
            _local_1 = Language.PVP_ROOM_P[22];
        }

        [Bindable(event="propertyChange")]
        private function get _res():String
        {
            return (this._2942945_res);
        }

        public function ___PVPResultPanel_Button1_click(_arg_1:MouseEvent):void
        {
            closeResult();
        }

        private function closeResult():void
        {
            this.visible = false;
            _core.remote.call("leavePVPRoom", null);
        }

        private function _PVPResultPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _res;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                battleInfo.htmlText = _arg_1;
            }, "battleInfo.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_ROOM_P[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPResultPanel_Button1.label = _arg_1;
            }, "_PVPResultPanel_Button1.label");
            result[1] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

