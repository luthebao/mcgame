// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipDecoShow

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import mx.events.ResizeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
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

    public class TipDecoShow extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1542403109decoDes:Text;
        private var _570013435decoInfo:Text;
        private var _3449699prop:Text;
        private var _570150104decoName:Label;
        private var _747804969position:Label;
        private var _570003142decoIcon:Image;
        private var _obj:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "mouseChildren":false,
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"decoIcon",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"decoName",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFF00;
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"decoDes",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":180,
                                            "mouseEnabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"position",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"mouseEnabled":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"prop",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"mouseEnabled":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"decoInfo",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":180,
                                            "mouseEnabled":false,
                                            "mouseChildren":false
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

        public function TipDecoShow()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipDecoShow_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipDecoShow._watcherSetupUtil = _arg_1;
        }


        public function set decoInfo(_arg_1:Text):void
        {
            var _local_2:Object = this._570013435decoInfo;
            if (_local_2 !== _arg_1)
            {
                this._570013435decoInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get decoIcon():Image
        {
            return (this._570003142decoIcon);
        }

        private function setInst(_arg_1:Object):void
        {
            var _local_2:Date;
            var _local_3:String;
            if (ToolKit.isBigThan(_arg_1.inst.dueTime, 1))
            {
                _local_2 = new Date(Number(_arg_1.inst.dueTime));
                _local_3 = Language.TIPDECO_S[0].toString();
                _local_3 = _local_3.replace("{fullYear}", _local_2.fullYear);
                _local_3 = _local_3.replace("{lastMonth}", ToolKit.add(_local_2.month, 1));
                _local_3 = _local_3.replace("{lastDate}", _local_2.date);
                _local_3 = _local_3.replace("{lastHour}", _local_2.hours);
                decoInfo.htmlText = (decoInfo.htmlText + _local_3);
            };
        }

        public function set prop(_arg_1:Text):void
        {
            var _local_2:Object = this._3449699prop;
            if (_local_2 !== _arg_1)
            {
                this._3449699prop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop", _local_2, _arg_1));
            };
        }

        public function ___TipDecoShow_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function set decoDes(_arg_1:Text):void
        {
            var _local_2:Object = this._1542403109decoDes;
            if (_local_2 !== _arg_1)
            {
                this._1542403109decoDes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoDes", _local_2, _arg_1));
            };
        }

        private function _TipDecoShow_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function set decoIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._570003142decoIcon;
            if (_local_2 !== _arg_1)
            {
                this._570003142decoIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoIcon", _local_2, _arg_1));
            };
        }

        private function setTemp(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:String;
            decoIcon.source = ResManager.getIconUrl(_arg_1.temp.iconCode);
            decoName.text = _arg_1.temp.name;
            decoDes.text = ((_arg_1.temp.description) ? _arg_1.temp.description : "");
            position.text = (Language.TIPDECO_S[1] + Language.TIPDECO_S[2][(_arg_1.temp.position - 1)]);
            prop.htmlText = Language.TIPDECO_S[6];
            var _local_2:int = _arg_1.temp["per"];
            for (_local_3 in _arg_1.temp)
            {
                _local_4 = (_local_3 as String);
                if (((_local_4.substring(0, 8) == "propType") && (Number(_arg_1.temp[_local_3]))))
                {
                    prop.htmlText = (prop.htmlText + ("<br/>" + Language.TIPPROP_S[Number(_arg_1.temp[_local_3])]));
                    prop.htmlText = (prop.htmlText + "<font color='#00FFFF'>");
                    if (((((((!(Number(_arg_1.temp[_local_3]) == 1)) && (!(Number(_arg_1.temp[_local_3]) == 4))) && (!(Number(_arg_1.temp[_local_3]) == 5))) && (!(Number(_arg_1.temp[_local_3]) == 6))) && (!(Number(_arg_1.temp[_local_3]) == 7))) && (!(Number(_arg_1.temp[_local_3]) == 11))))
                    {
                        prop.htmlText = (prop.htmlText + ((_arg_1.temp[("propNum" + _local_4.charAt(8))] / 10000) + "%"));
                    }
                    else
                    {
                        prop.htmlText = (prop.htmlText + ((_local_2) ? ((_arg_1.temp[("propNum" + _local_4.charAt(8))] / 10000) + "%") : _arg_1.temp[("propNum" + _local_4.charAt(8))]));
                    };
                    prop.htmlText = (prop.htmlText + "</font>");
                };
            };
            decoInfo.htmlText = Language.TIPDECO_S[3];
            decoInfo.htmlText = (decoInfo.htmlText + ((_arg_1.temp["t"] > 1) ? (Math.round((_arg_1.temp.t / (24 * 60))) + Language.TIPDECO_S[4]) : Language.TIPDECO_S[5]));
        }

        public function set position(_arg_1:Label):void
        {
            var _local_2:Object = this._747804969position;
            if (_local_2 !== _arg_1)
            {
                this._747804969position = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "position", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:TipDecoShow;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipDecoShow_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipDecoShowWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get prop():Text
        {
            return (this._3449699prop);
        }

        [Bindable(event="propertyChange")]
        public function get decoDes():Text
        {
            return (this._1542403109decoDes);
        }

        [Bindable(event="propertyChange")]
        public function get decoName():Label
        {
            return (this._570150104decoName);
        }

        [Bindable(event="propertyChange")]
        public function get position():Label
        {
            return (this._747804969position);
        }

        [Bindable(event="propertyChange")]
        public function get decoInfo():Text
        {
            return (this._570013435decoInfo);
        }

        private function _TipDecoShow_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                decoName.filters = _arg_1;
            }, "decoName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                decoDes.filters = _arg_1;
            }, "decoDes.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                position.filters = _arg_1;
            }, "position.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                prop.filters = _arg_1;
            }, "prop.filters");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                decoInfo.filters = _arg_1;
            }, "decoInfo.filters");
            result[4] = binding;
            return (result);
        }

        public function set decoName(_arg_1:Label):void
        {
            var _local_2:Object = this._570150104decoName;
            if (_local_2 !== _arg_1)
            {
                this._570150104decoName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoName", _local_2, _arg_1));
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
            if (_arg_1.inst)
            {
                setInst(_arg_1);
            };
        }


    }
}//package com.qeedoo.ui.view.comp

