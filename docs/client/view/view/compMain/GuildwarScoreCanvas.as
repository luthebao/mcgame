// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.GuildwarScoreCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
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

    public class GuildwarScoreCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1303000775guildBattleScore:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":72,
                    "height":36,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"guildBattleScore",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 20;
                            this.color = 0xFF0000;
                            this.textAlign = "center";
                            this.fontWeight = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"100",
                                "styleName":"LabelBattleTimer",
                                "width":72,
                                "height":36,
                                "x":0,
                                "visible":true
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

        public function GuildwarScoreCanvas()
        {
            mx_internal::_document = this;
            this.width = 72;
            this.height = 36;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuildwarScoreCanvas._watcherSetupUtil = _arg_1;
        }


        private function _GuildwarScoreCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.PORTRAITCANVAS_U[1];
        }

        private function _GuildwarScoreCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                guildBattleScore.filters = _arg_1;
            }, "guildBattleScore.filters");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PORTRAITCANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                guildBattleScore.toolTip = _arg_1;
            }, "guildBattleScore.toolTip");
            result[1] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get guildBattleScore():Label
        {
            return (this._1303000775guildBattleScore);
        }

        public function updateScore(_arg_1:int):*
        {
            guildBattleScore.text = ((Language.PORTRAITCANVAS_U[1] + " : ") + _arg_1.toString());
        }

        public function set guildBattleScore(_arg_1:Label):void
        {
            var _local_2:Object = this._1303000775guildBattleScore;
            if (_local_2 !== _arg_1)
            {
                this._1303000775guildBattleScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildBattleScore", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:GuildwarScoreCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuildwarScoreCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_GuildwarScoreCanvasWatcherSetupUtil");
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

        public function setSocreVisible(_arg_1:Boolean):*
        {
            guildBattleScore.visible = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.compMain

