// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SecretTreasureHuntAlertOne

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.HtmlTextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;
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

    public class SecretTreasureHuntAlertOne extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _SecretTreasureHuntAlertOne_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1361527750checkB:CheckBox;
        private var _3237038info:HtmlTextArea;
        private var _97926buy:BasicGlowButton;
        private var _typeNum:Number;
        private var _str:String;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":150,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SecretTreasureHuntAlertOne_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":120,
                                "y":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HtmlTextArea,
                                    "id":"info",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "10";
                                        this.bottom = "72";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "editable":false,
                                            "selectable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"buy",
                                    "events":{"click":"__buy_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":56,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"checkB",
                                    "events":{"click":"__checkB_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":102.5,
                                            "y":90,
                                            "width":98,
                                            "selected":false
                                        });
                                    }
                                })]
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

        public function SecretTreasureHuntAlertOne()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 150;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SecretTreasureHuntAlertOne._watcherSetupUtil = _arg_1;
        }


        public function set checkB(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1361527750checkB;
            if (_local_2 !== _arg_1)
            {
                this._1361527750checkB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "checkB", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get buy():BasicGlowButton
        {
            return (this._97926buy);
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        override public function initialize():void
        {
            var target:SecretTreasureHuntAlertOne;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SecretTreasureHuntAlertOne_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SecretTreasureHuntAlertOneWatcherSetupUtil");
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

        private function _SecretTreasureHuntAlertOne_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SecretTreasureHuntAlertOne_BasicTitleCanvas1.text = _arg_1;
            }, "_SecretTreasureHuntAlertOne_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                info.filters = _arg_1;
            }, "info.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buy.label = _arg_1;
            }, "buy.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                checkB.label = _arg_1;
            }, "checkB.label");
            result[3] = binding;
            return (result);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            this.typeNum = _typeNum;
            this.str = _str;
            checkB.selected = false;
        }

        public function set typeNum(_arg_1:Number):void
        {
            _typeNum = _arg_1;
        }

        public function set buy(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._97926buy;
            if (_local_2 !== _arg_1)
            {
                this._97926buy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buy", _local_2, _arg_1));
            };
        }

        private function _SecretTreasureHuntAlertOne_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SEC_TREA_HUNT[0];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.SEC_TREA_HUNT[2];
            _local_1 = Language.SEC_TREA_HUNT[6];
        }

        public function buySecTreaHuntSZone():void
        {
            _core.remote.call("buySecTreaHuntSZ", null, _typeNum, 1);
            this.visible = false;
        }

        public function set str(_arg_1:String):void
        {
            _str = _arg_1;
            if (initialized)
            {
                info.htmlText = _str;
            };
        }

        public function __checkB_click(_arg_1:MouseEvent):void
        {
            isCheck();
        }

        public function set info(_arg_1:HtmlTextArea):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get info():HtmlTextArea
        {
            return (this._3237038info);
        }

        public function __buy_click(_arg_1:MouseEvent):void
        {
            buySecTreaHuntSZone();
        }

        [Bindable(event="propertyChange")]
        public function get checkB():CheckBox
        {
            return (this._1361527750checkB);
        }

        public function isCheck():void
        {
            if (checkB.selected == true)
            {
                _core.remote.call("setSTHIfCheck", null, _typeNum, 1);
            }
            else
            {
                _core.remote.call("setSTHIfCheck", null, _typeNum, 0);
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

