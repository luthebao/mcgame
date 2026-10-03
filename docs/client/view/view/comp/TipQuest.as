// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipQuest

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.events.PropertyChangeEvent;
    import mx.events.ResizeEvent;
    import flash.events.Event;
    import mx.containers.Canvas;
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

    public class TipQuest extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _TipQuest_Label4:Label;
        public var _TipQuest_Label1:Label;
        private var _3602qc:QuestCanvas;
        public var _TipQuest_Label3:Label;
        public var _TipQuest_Label2:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":308,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":QuestCanvas,
                        "id":"qc",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":-8,
                                "y":2,
                                "embeded":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___TipQuest_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "5";
                            this.right = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnToolTipClose"});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_TipQuest_Label1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":4,
                                "y":5,
                                "width":55
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_TipQuest_Label2",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":4,
                                "y":274,
                                "width":55
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_TipQuest_Label3",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":4,
                                "y":250,
                                "width":55
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_TipQuest_Label4",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":4,
                                "y":226,
                                "width":55
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

        public function TipQuest()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.width = 300;
            this.height = 308;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("resize", ___TipQuest_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipQuest._watcherSetupUtil = _arg_1;
        }


        public function set object(_arg_1:Object):void
        {
            qc.questData = _arg_1.temp;
        }

        public function ___TipQuest_Button1_click(_arg_1:MouseEvent):void
        {
            closeQuestTip();
        }

        [Bindable(event="propertyChange")]
        public function get qc():QuestCanvas
        {
            return (this._3602qc);
        }

        private function _TipQuest_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPQUEST_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipQuest_Label1.text = _arg_1;
            }, "_TipQuest_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPQUEST_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipQuest_Label2.text = _arg_1;
            }, "_TipQuest_Label2.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPQUEST_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipQuest_Label3.text = _arg_1;
            }, "_TipQuest_Label3.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPQUEST_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipQuest_Label4.text = _arg_1;
            }, "_TipQuest_Label4.text");
            result[3] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:TipQuest;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipQuest_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipQuestWatcherSetupUtil");
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

        public function set qc(_arg_1:QuestCanvas):void
        {
            var _local_2:Object = this._3602qc;
            if (_local_2 !== _arg_1)
            {
                this._3602qc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qc", _local_2, _arg_1));
            };
        }

        public function ___TipQuest_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function closeQuestTip():void
        {
            visible = false;
            dispatchEvent(new Event(DragableCanvas.EVENT_CLOSE));
        }

        private function _TipQuest_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TIPQUEST_S[0];
            _local_1 = Language.TIPQUEST_S[1];
            _local_1 = Language.TIPQUEST_S[2];
            _local_1 = Language.TIPQUEST_S[3];
        }

        override public function show(_arg_1:Object=null):void
        {
            var _local_3:Object;
            var _local_2:Array = Canvas(parent).getChildren();
            for each (_local_3 in _local_2)
            {
                if (!(_local_3 is TipCre))
                {
                    _local_3.visible = false;
                };
            };
            setPos();
            visible = true;
        }


    }
}//package com.qeedoo.ui.view.comp

