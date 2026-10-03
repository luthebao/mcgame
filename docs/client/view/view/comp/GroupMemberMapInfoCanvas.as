// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.GroupMemberMapInfoCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
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

    public class GroupMemberMapInfoCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _91108202_name:String;
        private var _114843tip:Canvas;
        private var _2938013_map:String = "";
        private var _95136_xy:String = "";
        private var _1480455047_class:String;
        public var _GroupMemberMapInfoCanvas_Label2:Label;
        public var _GroupMemberMapInfoCanvas_Label3:Label;
        public var _GroupMemberMapInfoCanvas_Label4:Label;
        public var _GroupMemberMapInfoCanvas_Label5:Label;
        public var inCreateComplete:Boolean = false;
        private var _1472332155_level:String;
        private var _94802286cname:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"tip",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0.39999998,
                                "styleName":"CanvasToolTip",
                                "includeInLayout":false,
                                "visible":false,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"cname",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16776656;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_GroupMemberMapInfoCanvas_Label2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":19,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_GroupMemberMapInfoCanvas_Label3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":66.3,
                                            "y":19,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_GroupMemberMapInfoCanvas_Label4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":40,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_GroupMemberMapInfoCanvas_Label5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":66.3,
                                            "y":40,
                                            "text":""
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

        public function GroupMemberMapInfoCanvas()
        {
            mx_internal::_document = this;
            this.x = 40.3;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___GroupMemberMapInfoCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GroupMemberMapInfoCanvas._watcherSetupUtil = _arg_1;
        }


        public function set xy(_arg_1:String):void
        {
            _xy = _arg_1;
        }

        [Bindable(event="propertyChange")]
        private function get _level():String
        {
            return (this._1472332155_level);
        }

        public function set charName(_arg_1:String):void
        {
            _name = _arg_1;
        }

        private function set _level(_arg_1:String):void
        {
            var _local_2:Object = this._1472332155_level;
            if (_local_2 !== _arg_1)
            {
                this._1472332155_level = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_level", _local_2, _arg_1));
            };
        }

        public function set level(_arg_1:String):void
        {
            _level = _arg_1;
        }

        public function ___GroupMemberMapInfoCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function init():void
        {
            this.x = 40.3;
            if (this.parent)
            {
                this.y = this.parent.y;
            };
            this.height = 60;
            this.width = 125;
            if (this.visible)
            {
                this.visible = false;
            };
            inCreateComplete = true;
        }

        [Bindable(event="propertyChange")]
        public function get tip():Canvas
        {
            return (this._114843tip);
        }

        [Bindable(event="propertyChange")]
        private function get _map():String
        {
            return (this._2938013_map);
        }

        [Bindable(event="propertyChange")]
        private function get _xy():String
        {
            return (this._95136_xy);
        }

        override public function initialize():void
        {
            var target:GroupMemberMapInfoCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GroupMemberMapInfoCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_GroupMemberMapInfoCanvasWatcherSetupUtil");
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

        public function set tip(_arg_1:Canvas):void
        {
            var _local_2:Object = this._114843tip;
            if (_local_2 !== _arg_1)
            {
                this._114843tip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tip", _local_2, _arg_1));
            };
        }

        public function set map(_arg_1:String):void
        {
            _map = _arg_1;
        }

        private function set _map(_arg_1:String):void
        {
            var _local_2:Object = this._2938013_map;
            if (_local_2 !== _arg_1)
            {
                this._2938013_map = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_map", _local_2, _arg_1));
            };
        }

        private function _GroupMemberMapInfoCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cname.htmlText = _arg_1;
            }, "cname.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _class;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupMemberMapInfoCanvas_Label2.htmlText = _arg_1;
            }, "_GroupMemberMapInfoCanvas_Label2.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _level;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupMemberMapInfoCanvas_Label3.htmlText = _arg_1;
            }, "_GroupMemberMapInfoCanvas_Label3.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _map;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupMemberMapInfoCanvas_Label4.htmlText = _arg_1;
            }, "_GroupMemberMapInfoCanvas_Label4.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _xy;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GroupMemberMapInfoCanvas_Label5.htmlText = _arg_1;
            }, "_GroupMemberMapInfoCanvas_Label5.htmlText");
            result[4] = binding;
            return (result);
        }

        private function set _xy(_arg_1:String):void
        {
            var _local_2:Object = this._95136_xy;
            if (_local_2 !== _arg_1)
            {
                this._95136_xy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_xy", _local_2, _arg_1));
            };
        }

        public function set charclass(_arg_1:String):void
        {
            _class = _arg_1;
        }

        private function _GroupMemberMapInfoCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _name;
            _local_1 = _class;
            _local_1 = _level;
            _local_1 = _map;
            _local_1 = _xy;
        }

        private function set _name(_arg_1:String):void
        {
            var _local_2:Object = this._91108202_name;
            if (_local_2 !== _arg_1)
            {
                this._91108202_name = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_name", _local_2, _arg_1));
            };
        }

        public function set cname(_arg_1:Label):void
        {
            var _local_2:Object = this._94802286cname;
            if (_local_2 !== _arg_1)
            {
                this._94802286cname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cname", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _name():String
        {
            return (this._91108202_name);
        }

        [Bindable(event="propertyChange")]
        public function get cname():Label
        {
            return (this._94802286cname);
        }

        private function set _class(_arg_1:String):void
        {
            var _local_2:Object = this._1480455047_class;
            if (_local_2 !== _arg_1)
            {
                this._1480455047_class = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_class", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _class():String
        {
            return (this._1480455047_class);
        }


    }
}//package com.qeedoo.ui.view.comp

