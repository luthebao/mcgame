// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.AutoBattleCanvas

package com.qeedoo.ui.view.compBattle
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.config.Debug;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.compGameStage.BattleCreatureView;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
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

    public class AutoBattleCanvas extends DragableCanvas implements IBindingClient 
    {

        private static const MAX_NUM:int = 150;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2939591_num:int;
        public var _AutoBattleCanvas_BasicTitleCanvas1:BasicTitleCanvas;
        public var _AutoBattleCanvas_BasicGlowButton1:BasicGlowButton;
        public var _AutoBattleCanvas_RoundedLabel1:RoundedLabel;
        public var _AutoBattleCanvas_RoundedLabel2:RoundedLabel;
        public var auto:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":234,
                    "height":121,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AutoBattleCanvas_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_AutoBattleCanvas_RoundedLabel1",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":32,
                                "y":47
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_AutoBattleCanvas_BasicGlowButton1",
                        "events":{"click":"___AutoBattleCanvas_BasicGlowButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":66,
                                "y":80.5,
                                "styleName":"BtnStdRed",
                                "width":102
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_AutoBattleCanvas_RoundedLabel2",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.color = 0xFF0000;
                            this.fontWeight = "bold";
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":146.95,
                                "y":47
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

        public function AutoBattleCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0;
                this.backgroundColor = 0xFFFFFF;
            };
            this.width = 234;
            this.height = 121;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AutoBattleCanvas._watcherSetupUtil = _arg_1;
        }


        public function get maxNum():Number
        {
            return (MAX_NUM);
        }

        public function get num():Number
        {
            return (_num);
        }

        [Bindable(event="propertyChange")]
        private function get _num():int
        {
            return (this._2939591_num);
        }

        public function set num(_arg_1:Number):void
        {
            if (Debug.DEBUG_MODE)
            {
            };
            _num = _arg_1;
            if (((_num <= 0) || (_num > 150)))
            {
                auto = false;
                visible = false;
            };
        }

        override public function initialize():void
        {
            var target:AutoBattleCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AutoBattleCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_AutoBattleCanvasWatcherSetupUtil");
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

        public function stopAuto():void
        {
            auto = false;
            visible = false;
            BattleCreatureView.cmdMode = true;
            _core.view.getUI(ViewManager.MAIN_AUTOBATTLE_SET).changeStyle(true);
            _num = 0;
        }

        public function ___AutoBattleCanvas_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            stopAuto();
        }

        private function _AutoBattleCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOBATTLECANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoBattleCanvas_BasicTitleCanvas1.text = _arg_1;
            }, "_AutoBattleCanvas_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOBATTLECANVAS_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoBattleCanvas_RoundedLabel1.text = _arg_1;
            }, "_AutoBattleCanvas_RoundedLabel1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOBATTLECANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoBattleCanvas_BasicGlowButton1.label = _arg_1;
            }, "_AutoBattleCanvas_BasicGlowButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _num;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoBattleCanvas_RoundedLabel2.text = _arg_1;
            }, "_AutoBattleCanvas_RoundedLabel2.text");
            result[3] = binding;
            return (result);
        }

        private function set _num(_arg_1:int):void
        {
            var _local_2:Object = this._2939591_num;
            if (_local_2 !== _arg_1)
            {
                this._2939591_num = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_num", _local_2, _arg_1));
            };
        }

        public function startAuto():void
        {
            visible = true;
            auto = true;
            BattleCreatureView.cmdMode = false;
            _num = MAX_NUM;
        }

        private function _AutoBattleCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.AUTOBATTLECANVAS_U[1];
            _local_1 = Language.AUTOBATTLECANVAS_S[0];
            _local_1 = Language.AUTOBATTLECANVAS_U[0];
            _local_1 = _num;
        }


    }
}//package com.qeedoo.ui.view.compBattle

