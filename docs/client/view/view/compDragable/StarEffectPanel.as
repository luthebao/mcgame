// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.StarEffectPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
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

    public class StarEffectPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _StarEffectPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _574165043vbox_prop:VBox;
        private var _614215097vbox_value:VBox;
        private var _574241035vbox_name:VBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":288,
                    "height":350,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_StarEffectPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "id":"vbox_name",
                        "stylesFactory":function ():void
                        {
                            this.top = "39";
                            this.bottom = "10";
                            this.verticalGap = 5;
                            this.left = "20";
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "id":"vbox_prop",
                        "stylesFactory":function ():void
                        {
                            this.top = "39";
                            this.bottom = "10";
                            this.verticalGap = 5;
                            this.left = "100";
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "id":"vbox_value",
                        "stylesFactory":function ():void
                        {
                            this.top = "39";
                            this.bottom = "10";
                            this.verticalGap = 5;
                            this.left = "200";
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

        public function StarEffectPanel()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 288;
            this.height = 350;
            this.addEventListener("creationComplete", ___StarEffectPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StarEffectPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get vbox_value():VBox
        {
            return (this._614215097vbox_value);
        }

        public function ___StarEffectPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get vbox_prop():VBox
        {
            return (this._574165043vbox_prop);
        }

        public function set vbox_value(_arg_1:VBox):void
        {
            var _local_2:Object = this._614215097vbox_value;
            if (_local_2 !== _arg_1)
            {
                this._614215097vbox_value = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox_value", _local_2, _arg_1));
            };
        }

        public function init():void
        {
        }

        private function _StarEffectPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.STAR_EFFCT_PANEL_U[0];
        }

        override public function initialize():void
        {
            var target:StarEffectPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StarEffectPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_StarEffectPanelWatcherSetupUtil");
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

        public function set vbox_prop(_arg_1:VBox):void
        {
            var _local_2:Object = this._574165043vbox_prop;
            if (_local_2 !== _arg_1)
            {
                this._574165043vbox_prop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox_prop", _local_2, _arg_1));
            };
        }

        public function set vbox_name(_arg_1:VBox):void
        {
            var _local_2:Object = this._574241035vbox_name;
            if (_local_2 !== _arg_1)
            {
                this._574241035vbox_name = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox_name", _local_2, _arg_1));
            };
        }

        private function _StarEffectPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_EFFCT_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarEffectPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_StarEffectPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            return (result);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:int;
            var _local_3:RoundedLabel;
            var _local_4:RoundedLabel;
            var _local_5:RoundedLabel;
            var _local_6:Object;
            var _local_7:Number;
            var _local_8:String;
            var _local_9:Object;
            super.visible = _arg_1;
            if (_arg_1)
            {
                vbox_name.removeAllChildren();
                vbox_prop.removeAllChildren();
                vbox_value.removeAllChildren();
                _local_2 = 1;
                while (_local_2 <= 12)
                {
                    _local_3 = new RoundedLabel();
                    _local_4 = new RoundedLabel();
                    _local_5 = new RoundedLabel();
                    _local_6 = _core.player.starsData[_local_2];
                    _local_7 = 0;
                    if (_local_6)
                    {
                        _local_9 = GameData.d[GamePredef.TBL_STARS_TEMPLATE][_local_6.tid];
                        if (_local_9)
                        {
                            _local_7 = (_local_9.addValue * _local_6.addition);
                            _local_7 = Number(_local_7.toFixed(2));
                            if (_local_7 == int(_local_7))
                            {
                                _local_7 = int(_local_7);
                            };
                        };
                    };
                    _local_8 = Language.STAR_EFFCT_PANEL_U[_local_2];
                    _local_3.text = (Language.STAR_ADD_PANEL_U[_local_2] + "：");
                    _local_4.text = _local_8;
                    _local_4.setStyle("color", 0xFF00);
                    _local_5.text = (" + " + _local_7);
                    if (((_local_2 == 8) || (_local_2 == 11)))
                    {
                        _local_5.text = (_local_5.text + "%");
                    };
                    vbox_name.addChild(_local_3);
                    vbox_prop.addChild(_local_4);
                    vbox_value.addChild(_local_5);
                    _local_2++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get vbox_name():VBox
        {
            return (this._574241035vbox_name);
        }


    }
}//package com.qeedoo.ui.view.compDragable

