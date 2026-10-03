// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipMonsterHeart

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Text;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.events.ResizeEvent;
    import flash.utils.getDefinitionByName;
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

    public class TipMonsterHeart extends BasicToolTip implements IBindingClient, IToolTip 
    {

        public static const MONHEART_TYPE:Object = {
            "1":"Người",
            "2":"Thú",
            "3":"TV",
            "4":"Máy",
            "5":"Ma",
            "6":"Long",
            "7":"BOSS"
        };
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1068525194monLvl:Label;
        private var _1235698790monType:Label;
        private var _1235496887monName:Label;
        public var _TipMonsterHeart_Label5:Label;
        private var _1235572879monProp:Label;
        public var _TipMonsterHeart_Label3:Label;
        private var _obj:Object;
        private var _1235203005monDesc:Text;
        private var _1235349925monIcon:Image;

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
                                                "id":"monIcon",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "mouseChildren":false,
                                                        "mouseEnabled":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"monName"
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"monLvl",
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
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"monDesc",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipMonsterHeart_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"mouseEnabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"monType",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"mouseEnabled":false});
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TipMonsterHeart_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"mouseEnabled":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"monProp",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
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

        public function TipMonsterHeart()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipMonsterHeart_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipMonsterHeart._watcherSetupUtil = _arg_1;
        }


        public function set monProp(_arg_1:Label):void
        {
            var _local_2:Object = this._1235572879monProp;
            if (_local_2 !== _arg_1)
            {
                this._1235572879monProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monProp", _local_2, _arg_1));
            };
        }

        public function set monDesc(_arg_1:Text):void
        {
            var _local_2:Object = this._1235203005monDesc;
            if (_local_2 !== _arg_1)
            {
                this._1235203005monDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monDesc", _local_2, _arg_1));
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

        private function _TipMonsterHeart_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                monName.filters = _arg_1;
            }, "monName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                monLvl.filters = _arg_1;
            }, "monLvl.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONSTER_HEART[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMonsterHeart_Label3.text = _arg_1;
            }, "_TipMonsterHeart_Label3.text");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _TipMonsterHeart_Label3.filters = _arg_1;
            }, "_TipMonsterHeart_Label3.filters");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                monType.filters = _arg_1;
            }, "monType.filters");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONSTER_HEART[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMonsterHeart_Label5.text = _arg_1;
            }, "_TipMonsterHeart_Label5.text");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _TipMonsterHeart_Label5.filters = _arg_1;
            }, "_TipMonsterHeart_Label5.filters");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                monProp.filters = _arg_1;
            }, "monProp.filters");
            result[7] = binding;
            return (result);
        }

        public function ___TipMonsterHeart_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function set monType(_arg_1:Label):void
        {
            var _local_2:Object = this._1235698790monType;
            if (_local_2 !== _arg_1)
            {
                this._1235698790monType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monType", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get monDesc():Text
        {
            return (this._1235203005monDesc);
        }

        override public function initialize():void
        {
            var target:TipMonsterHeart;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipMonsterHeart_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipMonsterHeartWatcherSetupUtil");
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

        public function set monIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1235349925monIcon;
            if (_local_2 !== _arg_1)
            {
                this._1235349925monIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monIcon", _local_2, _arg_1));
            };
        }

        private function setTemp(_arg_1:Object):void
        {
            monIcon.source = ResManager.getIconUrl(_arg_1.temp.iconCode);
            var _local_2:Number = Number(_arg_1.temp.color);
            var _local_3:String = GamePredef.MSG_ITEM_COLOR[_local_2];
            monName.setStyle("color", _local_3);
            monName.text = _arg_1.temp.name;
            monLvl.text = ("Lv" + _local_2);
            monDesc.htmlText = _arg_1.temp.desc;
            monType.text = MONHEART_TYPE[Number(_arg_1.temp.type)];
            switch (Number(_arg_1.temp.propType))
            {
                case 1:
                case 2:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                case 13:
                case 14:
                case 31:
                case 32:
                case 58:
                case 61:
                case 71:
                case 34:
                case 72:
                    monProp.text = (Language.TIP_MONSTER_H[Number(_arg_1.temp.propType)] + (Number(_arg_1.temp.propnum) / 10000));
                    return;
                case 59:
                case 60:
                case 62:
                case 63:
                    monProp.text = ((Language.TIP_MONSTER_H[Number(_arg_1.temp.propType)] + (Number(_arg_1.temp.propnum) / 100)) + "%");
                    return;
            };
        }

        private function _TipMonsterHeart_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.MONSTER_HEART[8];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.MONSTER_HEART[9];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get monName():Label
        {
            return (this._1235496887monName);
        }

        [Bindable(event="propertyChange")]
        public function get monType():Label
        {
            return (this._1235698790monType);
        }

        [Bindable(event="propertyChange")]
        public function get monLvl():Label
        {
            return (this._1068525194monLvl);
        }

        [Bindable(event="propertyChange")]
        public function get monProp():Label
        {
            return (this._1235572879monProp);
        }

        public function set monLvl(_arg_1:Label):void
        {
            var _local_2:Object = this._1068525194monLvl;
            if (_local_2 !== _arg_1)
            {
                this._1068525194monLvl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monLvl", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get monIcon():Image
        {
            return (this._1235349925monIcon);
        }

        public function set monName(_arg_1:Label):void
        {
            var _local_2:Object = this._1235496887monName;
            if (_local_2 !== _arg_1)
            {
                this._1235496887monName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monName", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

