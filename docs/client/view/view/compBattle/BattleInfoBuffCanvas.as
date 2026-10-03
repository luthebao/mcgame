// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.BattleInfoBuffCanvas

package com.qeedoo.ui.view.compBattle
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.ui.resource.ResManager;
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

    public class BattleInfoBuffCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _104387img:Image;
        private var _109446num:Label;
        private var _3560248tips:String = "";

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":16,
                    "height":16,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "scaleX":0.5,
                                "scaleY":0.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"num",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                            this.color = 0xFFFFFF;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":2,
                                "y":0,
                                "width":16,
                                "height":16
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

        public function BattleInfoBuffCanvas()
        {
            mx_internal::_document = this;
            this.width = 16;
            this.height = 16;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BattleInfoBuffCanvas._watcherSetupUtil = _arg_1;
        }


        private function _BattleInfoBuffCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = tips;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                num.toolTip = _arg_1;
            }, "num.toolTip");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                num.filters = _arg_1;
            }, "num.filters");
            result[1] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        private function _BattleInfoBuffCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = tips;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        [Bindable(event="propertyChange")]
        public function get num():Label
        {
            return (this._109446num);
        }

        override public function initialize():void
        {
            var target:BattleInfoBuffCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BattleInfoBuffCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_BattleInfoBuffCanvasWatcherSetupUtil");
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

        public function set num(_arg_1:Label):void
        {
            var _local_2:Object = this._109446num;
            if (_local_2 !== _arg_1)
            {
                this._109446num = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "num", _local_2, _arg_1));
            };
        }

        private function set tips(_arg_1:String):void
        {
            var _local_2:Object = this._3560248tips;
            if (_local_2 !== _arg_1)
            {
                this._3560248tips = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tips", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get tips():String
        {
            return (this._3560248tips);
        }

        public function set refresh(_arg_1:Object):void
        {
            img.source = ResManager.getIconUrl(_arg_1.data.iconCode);
            num.text = _arg_1.keepRound;
            tips = ((((((_arg_1.data.name + Language.BUFFCANVAS_S[0]) + _arg_1.data.level) + "\n") + _arg_1.data.description) + Language.BUFFCANVAS_S[1]) + _arg_1.keepRound);
        }


    }
}//package com.qeedoo.ui.view.compBattle

