// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipMysTreasure

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import com.qeedoo.game.config.Language;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.containers.HBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.ResizeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
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

    public class TipMysTreasure extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static const MYS_LEVEL_NAME:Object = {
            "1":Language.DECORATE_PANEL[75][0],
            "2":Language.DECORATE_PANEL[75][1],
            "3":Language.DECORATE_PANEL[75][2],
            "4":Language.DECORATE_PANEL[75][3],
            "5":Language.DECORATE_PANEL[75][4],
            "6":Language.DECORATE_PANEL[75][5]
        };
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _TipMysTreasure_Label4:Label;
        private var _1526481994mysProp:Label;
        private var _1059141029mysLvl:Label;
        private var _1526324347mysKind:Label;
        private var _1526406002mysName:Label;
        private var _1526259040mysIcon:Image;
        private var _obj:Object;
        private var _866804303starContainer:HBox;

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
                                                "id":"mysIcon",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"mysName"
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"mysKind",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"mouseEnabled":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"mysLvl",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"mouseEnabled":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipMysTreasure_Label4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"mouseEnabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HBox,
                                                "id":"starContainer",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalGap = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "mouseChildren":false,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"mysProp",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"mouseEnabled":false});
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

        public function TipMysTreasure()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipMysTreasure_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipMysTreasure._watcherSetupUtil = _arg_1;
        }


        public function set mysIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1526259040mysIcon;
            if (_local_2 !== _arg_1)
            {
                this._1526259040mysIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysIcon", _local_2, _arg_1));
            };
        }

        public function set mysProp(_arg_1:Label):void
        {
            var _local_2:Object = this._1526481994mysProp;
            if (_local_2 !== _arg_1)
            {
                this._1526481994mysProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysProp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysKind():Label
        {
            return (this._1526324347mysKind);
        }

        public function ___TipMysTreasure_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function set mysLvl(_arg_1:Label):void
        {
            var _local_2:Object = this._1059141029mysLvl;
            if (_local_2 !== _arg_1)
            {
                this._1059141029mysLvl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysLvl", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get starContainer():HBox
        {
            return (this._866804303starContainer);
        }

        override public function initialize():void
        {
            var target:TipMysTreasure;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipMysTreasure_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipMysTreasureWatcherSetupUtil");
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

        private function _TipMysTreasure_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                mysName.filters = _arg_1;
            }, "mysName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                mysKind.filters = _arg_1;
            }, "mysKind.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                mysLvl.filters = _arg_1;
            }, "mysLvl.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _TipMysTreasure_Label4.filters = _arg_1;
            }, "_TipMysTreasure_Label4.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[79];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMysTreasure_Label4.text = _arg_1;
            }, "_TipMysTreasure_Label4.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                mysProp.filters = _arg_1;
            }, "mysProp.filters");
            result[5] = binding;
            return (result);
        }

        private function setTemp(_arg_1:Object):void
        {
            var _local_5:Image;
            mysIcon.source = ResManager.getIconUrl(_arg_1.temp.iconCode);
            var _local_2:String = TipDecoRune.QUL_COLOR[Number(_arg_1.temp.level)];
            mysName.setStyle("color", _local_2);
            mysName.text = _arg_1.temp.name;
            mysKind.text = (Language.DECORATE_PANEL[76] + MysTreShow.KIND_NAME[Number(_arg_1.temp.kind)]);
            mysLvl.text = (Language.DECORATE_PANEL[77] + MYS_LEVEL_NAME[Number(_arg_1.temp.level)]);
            var _local_3:Number = Number(_arg_1.temp.star);
            if (starContainer.numChildren > 0)
            {
                starContainer.removeAllChildren();
            };
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                _local_5 = new Image();
                _local_5.width = 16;
                _local_5.height = 16;
                _local_5.source = ResManager.ICON_EQUIP_STAR;
                starContainer.addChild(_local_5);
                _local_4++;
            };
            switch (Number(_arg_1.temp.propType))
            {
                case 1:
                case 4:
                case 5:
                case 6:
                case 7:
                case 11:
                    mysProp.text = ((Language.DECORATE_PANEL[78] + Language.TIPPROP_S[Number(_arg_1.temp.propType)]) + Number(_arg_1.temp.propNum));
                    return;
                case 8:
                case 9:
                case 13:
                case 14:
                case 31:
                case 32:
                case 58:
                case 61:
                    mysProp.text = ((Language.DECORATE_PANEL[78] + Language.TIPPROP_S[Number(_arg_1.temp.propType)]) + (Number(_arg_1.temp.propNum) / 10000));
                    return;
                case 34:
                case 59:
                case 60:
                case 62:
                case 63:
                case 71:
                    mysProp.text = (((Language.DECORATE_PANEL[78] + Language.TIPPROP_S[Number(_arg_1.temp.propType)]) + (Number(_arg_1.temp.propNum) / 100)) + "%");
                    return;
            };
        }

        public function set starContainer(_arg_1:HBox):void
        {
            var _local_2:Object = this._866804303starContainer;
            if (_local_2 !== _arg_1)
            {
                this._866804303starContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starContainer", _local_2, _arg_1));
            };
        }

        private function _TipMysTreasure_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[79];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get mysLvl():Label
        {
            return (this._1059141029mysLvl);
        }

        public function set mysName(_arg_1:Label):void
        {
            var _local_2:Object = this._1526406002mysName;
            if (_local_2 !== _arg_1)
            {
                this._1526406002mysName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysIcon():Image
        {
            return (this._1526259040mysIcon);
        }

        [Bindable(event="propertyChange")]
        public function get mysName():Label
        {
            return (this._1526406002mysName);
        }

        [Bindable(event="propertyChange")]
        public function get mysProp():Label
        {
            return (this._1526481994mysProp);
        }

        public function set mysKind(_arg_1:Label):void
        {
            var _local_2:Object = this._1526324347mysKind;
            if (_local_2 !== _arg_1)
            {
                this._1526324347mysKind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysKind", _local_2, _arg_1));
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

