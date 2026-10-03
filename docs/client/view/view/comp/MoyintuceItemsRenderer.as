// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MoyintuceItemsRenderer

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.resource.ResManager;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
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

    public class MoyintuceItemsRenderer extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _110502143tname:Label;
        private var _3562793tlev:Label;
        private var _338675352lockImg:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":48,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"tname",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":11,
                                "y":14,
                                "text":"Text",
                                "width":140,
                                "height":23
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"tlev",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":157,
                                "y":15,
                                "text":"Label"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"lockImg",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":166,
                                "y":18,
                                "width":10,
                                "height":10
                            });
                        }
                    })]
                });
            }
        });
        private var hp:String = ResManager.getIconUrl(4130220003801);
        private var lockImgicon:Class = MoyintuceItemsRenderer_lockImgicon;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MoyintuceItemsRenderer()
        {
            mx_internal::_document = this;
            this.height = 48;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MoyintuceItemsRenderer._watcherSetupUtil = _arg_1;
        }


        private function reset():void
        {
            tname.text = "";
            tlev.visible = false;
            lockImg.visible = false;
        }

        override public function initialize():void
        {
            var target:MoyintuceItemsRenderer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MoyintuceItemsRenderer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_MoyintuceItemsRendererWatcherSetupUtil");
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

        public function set tlev(_arg_1:Label):void
        {
            var _local_2:Object = this._3562793tlev;
            if (_local_2 !== _arg_1)
            {
                this._3562793tlev = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tlev", _local_2, _arg_1));
            };
        }

        private function _MoyintuceItemsRenderer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (lockImgicon);
            }, function (_arg_1:Object):void
            {
                lockImg.source = _arg_1;
            }, "lockImg.source");
            result[0] = binding;
            return (result);
        }

        override public function set data(_arg_1:Object):void
        {
            var _local_2:String;
            super.data = _arg_1;
            if (_arg_1)
            {
                reset();
                if (((_arg_1.m1 == null) || (_arg_1.m1 == "")))
                {
                    _local_2 = (("<font color='#929292'>" + _arg_1.name) + "</font>");
                    tname.htmlText = _local_2;
                    lockImg.visible = true;
                    return;
                };
                if (((_arg_1.hasOwnProperty("op")) && (_arg_1.op == true)))
                {
                    _local_2 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[1]) + "'>") + _arg_1.name) + "</font>");
                    tname.htmlText = _local_2;
                    tlev.text = ("Lv: " + _arg_1.lev);
                    tlev.visible = true;
                    lockImg.visible = false;
                }
                else
                {
                    if (((_arg_1.hasOwnProperty("op")) && (_arg_1.op == false)))
                    {
                        _local_2 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[2]) + "'>") + _arg_1.name) + "</font>");
                        tname.htmlText = _local_2;
                    };
                };
            };
        }

        private function _MoyintuceItemsRenderer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = lockImgicon;
        }

        [Bindable(event="propertyChange")]
        public function get lockImg():Image
        {
            return (this._338675352lockImg);
        }

        [Bindable(event="propertyChange")]
        public function get tlev():Label
        {
            return (this._3562793tlev);
        }

        public function set lockImg(_arg_1:Image):void
        {
            var _local_2:Object = this._338675352lockImg;
            if (_local_2 !== _arg_1)
            {
                this._338675352lockImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lockImg", _local_2, _arg_1));
            };
        }

        public function set tname(_arg_1:Label):void
        {
            var _local_2:Object = this._110502143tname;
            if (_local_2 !== _arg_1)
            {
                this._110502143tname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tname", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tname():Label
        {
            return (this._110502143tname);
        }


    }
}//package com.qeedoo.ui.view.comp

