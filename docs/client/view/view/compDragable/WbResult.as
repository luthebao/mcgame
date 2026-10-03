// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WbResult

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.RendererItemArray;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
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

    public class WbResult extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _934426595result:Label;
        public var _WbResult_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1603303783takeButton:BasicGlowButton;
        private var _1641788370okButton:BasicGlowButton;
        private var _539618554myWbAward:RendererItemArray;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":271,
                    "height":270,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_WbResult_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"result",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.top = "40";
                            this.fontSize = 13;
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":150});
                        }
                    }), new UIComponentDescriptor({
                        "type":RendererItemArray,
                        "id":"myWbAward",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "50";
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"takeButton",
                        "events":{"click":"__takeButton_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":110,
                                "styleName":"BtnStdRed",
                                "width":52.2
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"okButton",
                        "events":{"click":"__okButton_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":110,
                                "visible":false,
                                "styleName":"BtnStdRed",
                                "width":52.2
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

        public function WbResult()
        {
            mx_internal::_document = this;
            this.width = 271;
            this.height = 270;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WbResult._watcherSetupUtil = _arg_1;
        }


        public function set result(_arg_1:Label):void
        {
            var _local_2:Object = this._934426595result;
            if (_local_2 !== _arg_1)
            {
                this._934426595result = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "result", _local_2, _arg_1));
            };
        }

        public function __takeButton_click(_arg_1:MouseEvent):void
        {
            take();
        }

        private function take():void
        {
            if (myWbAward.getChildren().length > 0)
            {
                _core.remote.call("takeWbAward", null, _core.player.id);
            };
        }

        [Bindable(event="propertyChange")]
        public function get myWbAward():RendererItemArray
        {
            return (this._539618554myWbAward);
        }

        public function updateView(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                if (_arg_1.award.length > 0)
                {
                    _local_2 = {"array":[]};
                    _local_2.array = _arg_1.award;
                    myWbAward.data = _local_2;
                    this.takeButton.visible = true;
                    this.okButton.visible = false;
                    this.myWbAward.visible = true;
                    myWbAward.x = ((270 - ((_arg_1.award.length * 35) + ((_arg_1.award.length - 1) * 5))) / 2);
                    myWbAward.width = ((_arg_1.award.length * 35) + ((_arg_1.award.length - 1) * 5));
                }
                else
                {
                    this.takeButton.visible = false;
                    this.okButton.visible = true;
                    this.myWbAward.visible = false;
                };
                result.htmlText = Language.WB_RESULT_CANVAS_U[1].replace("{rank1}", _arg_1.rank1).replace("{rank2}", _arg_1.rank2).replace("{hurt}", _arg_1.hurt).replace("{money}", _arg_1.money).replace("{exp}", _arg_1.exp).replace("{luckyNum}", _arg_1.luckyNum).replace("{name}", _arg_1.name).replace("累计造成伤害", "<br>累计造成伤害");
            };
        }

        override public function initialize():void
        {
            var target:WbResult;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WbResult_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WbResultWatcherSetupUtil");
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

        public function set myWbAward(_arg_1:RendererItemArray):void
        {
            var _local_2:Object = this._539618554myWbAward;
            if (_local_2 !== _arg_1)
            {
                this._539618554myWbAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myWbAward", _local_2, _arg_1));
            };
        }

        public function __okButton_click(_arg_1:MouseEvent):void
        {
            ok();
        }

        private function _WbResult_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WB_RESULT_CANVAS_U[0];
            _local_1 = Language.TREASURE_U[1];
            _local_1 = Language.WB_RESULT_CANVAS_U[2];
        }

        [Bindable(event="propertyChange")]
        public function get takeButton():BasicGlowButton
        {
            return (this._1603303783takeButton);
        }

        private function ok():void
        {
            this.hide();
            _core.remote.call("wbLeaveMap", null, _core.player.id);
        }

        [Bindable(event="propertyChange")]
        public function get result():Label
        {
            return (this._934426595result);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
        }

        private function _WbResult_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RESULT_CANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbResult_BasicTitleCanvas1.text = _arg_1;
            }, "_WbResult_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                takeButton.label = _arg_1;
            }, "takeButton.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RESULT_CANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                okButton.label = _arg_1;
            }, "okButton.label");
            result[2] = binding;
            return (result);
        }

        public function set takeButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1603303783takeButton;
            if (_local_2 !== _arg_1)
            {
                this._1603303783takeButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "takeButton", _local_2, _arg_1));
            };
        }

        public function set okButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1641788370okButton;
            if (_local_2 !== _arg_1)
            {
                this._1641788370okButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "okButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get okButton():BasicGlowButton
        {
            return (this._1641788370okButton);
        }


    }
}//package com.qeedoo.ui.view.compDragable

