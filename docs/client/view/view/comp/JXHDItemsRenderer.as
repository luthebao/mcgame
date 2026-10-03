// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.JXHDItemsRenderer

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
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

    public class JXHDItemsRenderer extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _851178887anotice:RoundedLabel;
        private var _92808282aicon:Image;
        private var _92955244aname:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":70,
                    "width":161,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "styleName":"CanvasJXHDItem",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aname",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":74,
                                            "y":10,
                                            "text":"Text",
                                            "width":77,
                                            "height":23
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"anotice",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":74,
                                            "y":41
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"aicon",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "11";
                                        this.left = "12";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":48,
                                            "height":48
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var dmbk:Class = JXHDItemsRenderer_dmbk;
        private var mczd:Class = JXHDItemsRenderer_mczd;
        private var xcds:Class = JXHDItemsRenderer_xcds;
        private var yxq:Class = JXHDItemsRenderer_yxq;
        private var czth:Class = JXHDItemsRenderer_czth;
        private var xsss:Class = JXHDItemsRenderer_xsss;
        private var jbp:Class = JXHDItemsRenderer_jbp;
        private var srdg:Class = JXHDItemsRenderer_srdg;
        private var rqzh:Class = JXHDItemsRenderer_rqzh;
        private var wawaji:Class = JXHDItemsRenderer_wawaji;
        private var zssc:Class = JXHDItemsRenderer_zssc;
        private var xianshiqianggou:Class = JXHDItemsRenderer_xianshiqianggou;
        private var gailvtisheng:Class = JXHDItemsRenderer_gailvtisheng;
        private var jingzishangreng:Class = JXHDItemsRenderer_jingzishangreng;
        private var licaifanhuan:Class = JXHDItemsRenderer_licaifanhuan;
        private var shangdiandazhe:Class = JXHDItemsRenderer_shangdiandazhe;
        private var xiaofeileiji:Class = JXHDItemsRenderer_xiaofeileiji;
        private var duihuanhuodong:Class = JXHDItemsRenderer_duihuanhuodong;
        private var baoshizhaichu:Class = JXHDItemsRenderer_baoshizhaichu;
        private var tkyyh:Class = JXHDItemsRenderer_tkyyh;
        private var asi:Class = JXHDItemsRenderer_asi;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function JXHDItemsRenderer()
        {
            mx_internal::_document = this;
            this.height = 70;
            this.width = 161;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            JXHDItemsRenderer._watcherSetupUtil = _arg_1;
        }


        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            if (_arg_1)
            {
                aicon.source = this[_arg_1.icon];
                aname.text = _arg_1.n;
                if (_arg_1.c)
                {
                    anotice.visible = true;
                }
                else
                {
                    anotice.visible = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get aname():RoundedLabel
        {
            return (this._92955244aname);
        }

        override public function initialize():void
        {
            var target:JXHDItemsRenderer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _JXHDItemsRenderer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_JXHDItemsRendererWatcherSetupUtil");
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

        private function _JXHDItemsRenderer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                aname.filters = _arg_1;
            }, "aname.filters");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JXHD_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                anotice.text = _arg_1;
            }, "anotice.text");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                anotice.filters = _arg_1;
            }, "anotice.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (zssc);
            }, function (_arg_1:Object):void
            {
                aicon.source = _arg_1;
            }, "aicon.source");
            result[3] = binding;
            return (result);
        }

        public function set aicon(_arg_1:Image):void
        {
            var _local_2:Object = this._92808282aicon;
            if (_local_2 !== _arg_1)
            {
                this._92808282aicon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aicon", _local_2, _arg_1));
            };
        }

        private function _JXHDItemsRenderer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.JXHD_PANEL[4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = zssc;
        }

        private function reset():void
        {
            aname.text = "";
            anotice.visible = false;
        }

        public function set aname(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._92955244aname;
            if (_local_2 !== _arg_1)
            {
                this._92955244aname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aname", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aicon():Image
        {
            return (this._92808282aicon);
        }

        public function set anotice(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._851178887anotice;
            if (_local_2 !== _arg_1)
            {
                this._851178887anotice = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "anotice", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get anotice():RoundedLabel
        {
            return (this._851178887anotice);
        }


    }
}//package com.qeedoo.ui.view.comp

