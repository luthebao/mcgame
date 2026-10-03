// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipRuneChip

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import mx.events.ResizeEvent;
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

    public class TipRuneChip extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1662402277chipIcon:Image;
        private var _246322237chipNameLabel:Label;
        private var _746357798chipDes:Label;
        private var _obj:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"chipIcon",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"chipNameLabel"
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"chipDes",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":14});
                                    }
                                })]});
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipRuneChip()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipRuneChip_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipRuneChip._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get chipNameLabel():Label
        {
            return (this._246322237chipNameLabel);
        }

        [Bindable(event="propertyChange")]
        public function get chipIcon():Image
        {
            return (this._1662402277chipIcon);
        }

        override public function initialize():void
        {
            var target:TipRuneChip;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipRuneChip_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipRuneChipWatcherSetupUtil");
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

        private function _TipRuneChip_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                chipNameLabel.filters = _arg_1;
            }, "chipNameLabel.filters");
            result[0] = binding;
            return (result);
        }

        public function set chipDes(_arg_1:Label):void
        {
            var _local_2:Object = this._746357798chipDes;
            if (_local_2 !== _arg_1)
            {
                this._746357798chipDes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipDes", _local_2, _arg_1));
            };
        }

        private function setTemp(_arg_1:Object):void
        {
            var _local_2:Object = _arg_1["temp"];
            var _local_3:int = _local_2["rid"];
            var _local_4:String = _local_2["name"];
            var _local_5:int = _local_2["num"];
            var _local_6:Object = GameData.d[GamePredef.TBL_DECO_RUNE][_local_3];
            var _local_7:int = _local_6["qulity"];
            var _local_8:String = TipDecoRune.QUL_COLOR[_local_7];
            var _local_9:String = _local_6["name"];
            chipIcon.source = ResManager.getIconUrl(_arg_1.temp.iconCode);
            chipNameLabel.setStyle("color", _local_8);
            chipNameLabel.text = _local_4;
            chipDes.text = Language.DECORATE_PANEL[61].toString().replace("{num}", _local_5).replace("{name}", _local_9);
        }

        public function set chipIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1662402277chipIcon;
            if (_local_2 !== _arg_1)
            {
                this._1662402277chipIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipIcon", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get chipDes():Label
        {
            return (this._746357798chipDes);
        }

        public function ___TipRuneChip_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function _TipRuneChip_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function set chipNameLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._246322237chipNameLabel;
            if (_local_2 !== _arg_1)
            {
                this._246322237chipNameLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chipNameLabel", _local_2, _arg_1));
            };
        }

        public function set object(_arg_1:Object):void
        {
            _obj = _arg_1;
            if (!_arg_1.temp)
            {
                return;
            };
            setTemp(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.comp

