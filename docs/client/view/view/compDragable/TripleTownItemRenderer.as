// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TripleTownItemRenderer

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.controls.listClasses.IListItemRenderer;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class TripleTownItemRenderer extends Canvas implements IBindingClient, IListItemRenderer 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1106754295leader:Label;
        private var _1077769574member:Label;
        private var _109264530score:Label;
        private var _1480355228_color:uint;
        private var _100346066index:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":22,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"index",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":70});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"leader",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":70,
                                "width":164
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"member",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":234,
                                "width":96
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"score",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":330,
                                "width":70
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

        public function TripleTownItemRenderer()
        {
            mx_internal::_document = this;
            this.height = 22;
            this.clipContent = false;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TripleTownItemRenderer._watcherSetupUtil = _arg_1;
        }


        private function _TripleTownItemRenderer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = _color;
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = _color;
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = _color;
            _local_1 = [GamePredef.FILTER_GLOW_HIGHBLACK];
            _local_1 = _color;
        }

        private function set _color(_arg_1:uint):void
        {
            var _local_2:Object = this._1480355228_color;
            if (_local_2 !== _arg_1)
            {
                this._1480355228_color = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_color", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get leader():Label
        {
            return (this._1106754295leader);
        }

        [Bindable(event="propertyChange")]
        public function get index():Label
        {
            return (this._100346066index);
        }

        override public function initialize():void
        {
            var target:TripleTownItemRenderer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TripleTownItemRenderer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TripleTownItemRendererWatcherSetupUtil");
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

        public function set leader(_arg_1:Label):void
        {
            var _local_2:Object = this._1106754295leader;
            if (_local_2 !== _arg_1)
            {
                this._1106754295leader = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leader", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get member():Label
        {
            return (this._1077769574member);
        }

        public function set index(_arg_1:Label):void
        {
            var _local_2:Object = this._100346066index;
            if (_local_2 !== _arg_1)
            {
                this._100346066index = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "index", _local_2, _arg_1));
            };
        }

        public function set score(_arg_1:Label):void
        {
            var _local_2:Object = this._109264530score;
            if (_local_2 !== _arg_1)
            {
                this._109264530score = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "score", _local_2, _arg_1));
            };
        }

        public function set member(_arg_1:Label):void
        {
            var _local_2:Object = this._1077769574member;
            if (_local_2 !== _arg_1)
            {
                this._1077769574member = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "member", _local_2, _arg_1));
            };
        }

        private function _TripleTownItemRenderer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                index.filters = _arg_1;
            }, "index.filters");
            result[0] = binding;
            binding = new Binding(this, function ():uint
            {
                return (_color);
            }, function (_arg_1:uint):void
            {
                index.setStyle("color", _arg_1);
            }, "index.color");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                leader.filters = _arg_1;
            }, "leader.filters");
            result[2] = binding;
            binding = new Binding(this, function ():uint
            {
                return (_color);
            }, function (_arg_1:uint):void
            {
                leader.setStyle("color", _arg_1);
            }, "leader.color");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                member.filters = _arg_1;
            }, "member.filters");
            result[4] = binding;
            binding = new Binding(this, function ():uint
            {
                return (_color);
            }, function (_arg_1:uint):void
            {
                member.setStyle("color", _arg_1);
            }, "member.color");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_HIGHBLACK]);
            }, function (_arg_1:Array):void
            {
                score.filters = _arg_1;
            }, "score.filters");
            result[6] = binding;
            binding = new Binding(this, function ():uint
            {
                return (_color);
            }, function (_arg_1:uint):void
            {
                score.setStyle("color", _arg_1);
            }, "score.color");
            result[7] = binding;
            return (result);
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            if (!_arg_1)
            {
                return;
            };
            index.htmlText = _arg_1.id;
            leader.htmlText = _arg_1.leader;
            member.htmlText = _arg_1.member;
            score.htmlText = _arg_1.score;
            _color = (((int(_arg_1.id) % 2) == 0) ? 0xFF9900 : 0xFFFFFF);
            var _local_2:uint = (((int(_arg_1.id) % 2) == 0) ? 0x666666 : 0x333333);
            this.graphics.clear();
            this.graphics.lineStyle(1, 0xFFFF);
            this.graphics.beginFill(_local_2);
            this.graphics.drawRect(-2, -2, 398, (height + 4));
            this.graphics.endFill();
        }

        [Bindable(event="propertyChange")]
        private function get _color():uint
        {
            return (this._1480355228_color);
        }

        [Bindable(event="propertyChange")]
        public function get score():Label
        {
            return (this._109264530score);
        }


    }
}//package com.qeedoo.ui.view.compDragable

