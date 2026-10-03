// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.TargetSelectCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.compBattle.BattleTargetCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
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

    public class TargetSelectCanvas extends Canvas implements IMainUI, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _815602929targetCvs:BattleTargetCanvas;
        public var _TargetSelectCanvas_RoundedLabel1:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.backgroundColor = 0;
                            this.backgroundAlpha = 0.2;
                            this.horizontalCenter = "0";
                            this.verticalCenter = "100";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":180,
                                "mouseChildren":false,
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_TargetSelectCanvas_RoundedLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 18;
                                        this.color = 0xFF0000;
                                        this.textAlign = "center";
                                        this.fontWeight = "bold";
                                        this.fontFamily = "黑体";
                                        this.horizontalCenter = "0";
                                        this.verticalCenter = "0";
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BattleTargetCanvas,
                        "id":"targetCvs",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "100";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"visible":false});
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TargetSelectCanvas()
        {
            mx_internal::_document = this;
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TargetSelectCanvas._watcherSetupUtil = _arg_1;
        }


        public function hide():void
        {
            visible = false;
        }

        public function get targetCanvas():BattleTargetCanvas
        {
            return (targetCvs);
        }

        private function _TargetSelectCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TARGETSELECTCANVAS_S[0];
        }

        override public function initialize():void
        {
            var target:TargetSelectCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TargetSelectCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_TargetSelectCanvasWatcherSetupUtil");
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

        public function update():void
        {
        }

        public function initView():void
        {
        }

        public function set targetCvs(_arg_1:BattleTargetCanvas):void
        {
            var _local_2:Object = this._815602929targetCvs;
            if (_local_2 !== _arg_1)
            {
                this._815602929targetCvs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetCvs", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (initialized)
            {
                if (_core.state == GamePredef.ST_CORE_BATTLE)
                {
                    targetCvs.velidateImgVisible();
                    targetCvs.visible = true;
                }
                else
                {
                    targetCvs.visible = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get targetCvs():BattleTargetCanvas
        {
            return (this._815602929targetCvs);
        }

        private function _TargetSelectCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TARGETSELECTCANVAS_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TargetSelectCanvas_RoundedLabel1.text = _arg_1;
            }, "_TargetSelectCanvas_RoundedLabel1.text");
            result[0] = binding;
            return (result);
        }

        public function show():void
        {
            visible = true;
        }


    }
}//package com.qeedoo.ui.view.compMain

