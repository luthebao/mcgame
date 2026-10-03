// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.LoaderCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.ProgressBar;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
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

    public class LoaderCanvas extends Canvas implements IMainUI, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _parent:Object;
        private var _91291148_text:String;
        private var _1131509414progressBar:ProgressBar;
        private var _1464826535_title:String;
        public var _LoaderCanvas_RoundedLabel1:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":570,
                                "width":900,
                                "styleName":"CanvasWorldMap",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ProgressBar,
                                    "id":"progressBar",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mode":"manual",
                                            "y":531,
                                            "styleName":"ProgressGlobal",
                                            "labelPlacement":"center",
                                            "width":240,
                                            "height":13
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_LoaderCanvas_RoundedLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.fontSize = 15;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":149.5,
                                            "y":498,
                                            "width":601,
                                            "height":25
                                        });
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LoaderCanvas()
        {
            mx_internal::_document = this;
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.styleName = "CanvasWorldMapBack";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LoaderCanvas._watcherSetupUtil = _arg_1;
        }


        public function hide():void
        {
            try
            {
                _parent.removeChild(this);
            }
            catch(e:Object)
            {
            };
        }

        public function show():void
        {
            if (parent == null)
            {
                _parent.addChild(this);
            };
            _parent.setChildIndex(this, (_parent.numChildren - 1));
            var _local_1:Object = _parent.stage;
            move(0, 0);
            progressBar.setProgress(0, 100);
        }

        private function set _text(_arg_1:String):void
        {
            var _local_2:Object = this._91291148_text;
            if (_local_2 !== _arg_1)
            {
                this._91291148_text = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_text", _local_2, _arg_1));
            };
        }

        public function set progressBar(_arg_1:ProgressBar):void
        {
            var _local_2:Object = this._1131509414progressBar;
            if (_local_2 !== _arg_1)
            {
                this._1131509414progressBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressBar", _local_2, _arg_1));
            };
        }

        public function update():void
        {
        }

        [Bindable(event="propertyChange")]
        private function get _title():String
        {
            return (this._1464826535_title);
        }

        public function set text(_arg_1:String):void
        {
            _text = _arg_1;
        }

        public function initView():void
        {
        }

        override public function initialize():void
        {
            var target:LoaderCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LoaderCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_LoaderCanvasWatcherSetupUtil");
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

        private function _LoaderCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (_text + "%3%%");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                progressBar.label = _arg_1;
            }, "progressBar.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _title;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LoaderCanvas_RoundedLabel1.text = _arg_1;
            }, "_LoaderCanvas_RoundedLabel1.text");
            result[1] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        private function get _text():String
        {
            return (this._91291148_text);
        }

        [Bindable(event="propertyChange")]
        public function get progressBar():ProgressBar
        {
            return (this._1131509414progressBar);
        }

        private function _LoaderCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = (_text + "%3%%");
            _local_1 = _title;
        }

        public function setProgress(_arg_1:Number, _arg_2:Number):void
        {
            if (progressBar)
            {
                progressBar.setProgress(_arg_1, _arg_2);
            };
        }

        private function set _title(_arg_1:String):void
        {
            var _local_2:Object = this._1464826535_title;
            if (_local_2 !== _arg_1)
            {
                this._1464826535_title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_title", _local_2, _arg_1));
            };
        }

        public function showModel(_arg_1:Object, _arg_2:String, _arg_3:String, _arg_4:Boolean=true):void
        {
            if (!_arg_2)
            {
                _arg_2 = Language.LOADERCANVAS_S[0];
            };
            if (!_arg_3)
            {
                _arg_3 = Language.LOADERCANVAS_S[1];
            };
            if (_arg_2 == Language.LOADERCANVAS_S[0])
            {
                _arg_2 = Language.LOADERCANVAS_S[0];
            };
            if (_arg_3 == Language.LOADERCANVAS_S[1])
            {
                _arg_3 = Language.LOADERCANVAS_S[1];
            };
            _text = _arg_2;
            _title = _arg_3;
            _parent = _arg_1;
            show();
        }


    }
}//package com.qeedoo.ui.view.compMain

