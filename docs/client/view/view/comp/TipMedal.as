// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipMedal

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.controls.Label;
    import com.qeedoo.game.data.DataManager;
    import mx.controls.Image;
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.ResizeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class TipMedal extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static const MEDAL_MAX_LEVEL:int = 10;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _755439989propBasic:String;
        private var _479786134reqLevel0:Text;
        private var _1829026215needExp:String;
        private var _2067263007showBtn:Button;
        private var _286760779magicWeaponLevel0:Text;
        private var _747804969position:String;
        private var _1375771073totalJoinDesc:String;
        public var _TipMedal_Text10:Text;
        public var _TipMedal_Text11:Text;
        private var _226921015uplevel:String;
        private var _1724546052description:String;
        private var _148001439useType:String;
        private var _core:Core;
        private var _2012328149tipName1:Label;
        private var dm:DataManager;
        private var _2012328150tipName0:Label;
        private var _293077265useType0:Text;
        private var _1921387042medalName:String;
        private var _738251546iconImg0:Image;
        private var _102865796level:String;
        private var _557573430tipContainer0:VBox;
        private var _431118970reqLevel:String;
        public var _TipMedal_Text1:Text;
        public var _TipMedal_Text2:Text;
        public var _TipMedal_Text6:Text;
        public var _TipMedal_Text8:Text;
        public var _TipMedal_Text9:Text;
        private var _1279859928nextPropBasic:String;
        public var _TipMedal_Text7:Text;
        private var obj:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":170,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"tipContainer0",
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 0;
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "width":248,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":57,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "width":246,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"tipName0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":23,
                                                        "text":"完美的什么装备名字[金]"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"iconImg0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":15,
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"showBtn",
                                                "events":{"click":"__showBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "5";
                                                    this.top = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "styleName":"BtnToolTipClose",
                                                        "width":15,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"tipName1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":23});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipMedal_Text1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16773307;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备描述"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipMedal_Text2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备位置: 主手"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"useType0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"使用对象: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"reqLevel0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"等级需求: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"magicWeaponLevel0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"神器等级: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipMedal_Text6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"勋章属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipMedal_Text7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"勋章属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipMedal_Text8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"可激活回路"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipMedal_Text9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"可激活回路"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipMedal_Text10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"升级所需经验"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipMedal_Text11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"下级纹章属性"});
                                    }
                                })]
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

        public function TipMedal()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.width = 170;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("resize", ___TipMedal_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipMedal._watcherSetupUtil = _arg_1;
        }


        private function set level(_arg_1:String):void
        {
            var _local_2:Object = this._102865796level;
            if (_local_2 !== _arg_1)
            {
                this._102865796level = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "level", _local_2, _arg_1));
            };
        }

        private function getNextMedal(_arg_1:Object):Object
        {
            var _local_3:Object;
            if ((((!(_arg_1)) || (_arg_1.level == null)) || (_arg_1.level == MEDAL_MAX_LEVEL)))
            {
                return (null);
            };
            var _local_2:Object = _core.data.gameData[GamePredef.TBL_MEDAL];
            for (_local_3 in _local_2)
            {
                if ((((_local_2[_local_3]) && (_local_2[_local_3].name == _arg_1.name)) && (Number(_local_2[_local_3].level) == (Number(_arg_1.level) + 1))))
                {
                    return (_local_2[_local_3]);
                };
            };
            return (null);
        }

        private function set reqLevel(_arg_1:String):void
        {
            var _local_2:Object = this._431118970reqLevel;
            if (_local_2 !== _arg_1)
            {
                this._431118970reqLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqLevel", _local_2, _arg_1));
            };
        }

        private function set propBasic(_arg_1:String):void
        {
            var _local_2:Object = this._755439989propBasic;
            if (_local_2 !== _arg_1)
            {
                this._755439989propBasic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propBasic", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showBtn():Button
        {
            return (this._2067263007showBtn);
        }

        [Bindable(event="propertyChange")]
        private function get medalName():String
        {
            return (this._1921387042medalName);
        }

        [Bindable(event="propertyChange")]
        private function get position():String
        {
            return (this._747804969position);
        }

        [Bindable(event="propertyChange")]
        public function get tipName0():Label
        {
            return (this._2012328150tipName0);
        }

        [Bindable(event="propertyChange")]
        public function get tipName1():Label
        {
            return (this._2012328149tipName1);
        }

        public function set showBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._2067263007showBtn;
            if (_local_2 !== _arg_1)
            {
                this._2067263007showBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get totalJoinDesc():String
        {
            return (this._1375771073totalJoinDesc);
        }

        private function set medalName(_arg_1:String):void
        {
            var _local_2:Object = this._1921387042medalName;
            if (_local_2 !== _arg_1)
            {
                this._1921387042medalName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalName", _local_2, _arg_1));
            };
        }

        private function set needExp(_arg_1:String):void
        {
            var _local_2:Object = this._1829026215needExp;
            if (_local_2 !== _arg_1)
            {
                this._1829026215needExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needExp", _local_2, _arg_1));
            };
        }

        private function set position(_arg_1:String):void
        {
            var _local_2:Object = this._747804969position;
            if (_local_2 !== _arg_1)
            {
                this._747804969position = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "position", _local_2, _arg_1));
            };
        }

        public function set tipName0(_arg_1:Label):void
        {
            var _local_2:Object = this._2012328150tipName0;
            if (_local_2 !== _arg_1)
            {
                this._2012328150tipName0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipName0", _local_2, _arg_1));
            };
        }

        public function set tipName1(_arg_1:Label):void
        {
            var _local_2:Object = this._2012328149tipName1;
            if (_local_2 !== _arg_1)
            {
                this._2012328149tipName1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipName1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get useType():String
        {
            return (this._148001439useType);
        }

        public function set magicWeaponLevel0(_arg_1:Text):void
        {
            var _local_2:Object = this._286760779magicWeaponLevel0;
            if (_local_2 !== _arg_1)
            {
                this._286760779magicWeaponLevel0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicWeaponLevel0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get reqLevel0():Text
        {
            return (this._479786134reqLevel0);
        }

        public function ___TipMedal_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function set object(_arg_1:Object):void
        {
            _core = Core.getInstance();
            dm = DataManager.getInstance();
            obj = _arg_1;
            if (!_arg_1.temp)
            {
                return;
            };
            setCommon(_arg_1);
            showBtn.visible = true;
        }

        [Bindable(event="propertyChange")]
        private function get level():String
        {
            return (this._102865796level);
        }

        public function __showBtn_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        [Bindable(event="propertyChange")]
        private function get propBasic():String
        {
            return (this._755439989propBasic);
        }

        [Bindable(event="propertyChange")]
        private function get reqLevel():String
        {
            return (this._431118970reqLevel);
        }

        private function set uplevel(_arg_1:String):void
        {
            var _local_2:Object = this._226921015uplevel;
            if (_local_2 !== _arg_1)
            {
                this._226921015uplevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "uplevel", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:TipMedal;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipMedal_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipMedalWatcherSetupUtil");
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

        public function set tipContainer0(_arg_1:VBox):void
        {
            var _local_2:Object = this._557573430tipContainer0;
            if (_local_2 !== _arg_1)
            {
                this._557573430tipContainer0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipContainer0", _local_2, _arg_1));
            };
        }

        private function set totalJoinDesc(_arg_1:String):void
        {
            var _local_2:Object = this._1375771073totalJoinDesc;
            if (_local_2 !== _arg_1)
            {
                this._1375771073totalJoinDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalJoinDesc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get needExp():String
        {
            return (this._1829026215needExp);
        }

        private function set nextPropBasic(_arg_1:String):void
        {
            var _local_2:Object = this._1279859928nextPropBasic;
            if (_local_2 !== _arg_1)
            {
                this._1279859928nextPropBasic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextPropBasic", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get magicWeaponLevel0():Text
        {
            return (this._286760779magicWeaponLevel0);
        }

        private function _TipMedal_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = medalName;
            _local_1 = level;
            _local_1 = description;
            _local_1 = position;
            _local_1 = useType;
            _local_1 = reqLevel;
            _local_1 = uplevel;
            _local_1 = Language.MEDAL_P[36];
            _local_1 = propBasic;
            _local_1 = Language.MEDAL_P[37];
            _local_1 = totalJoinDesc;
            _local_1 = needExp;
            _local_1 = nextPropBasic;
        }

        private function set useType(_arg_1:String):void
        {
            var _local_2:Object = this._148001439useType;
            if (_local_2 !== _arg_1)
            {
                this._148001439useType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useType", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tipContainer0():VBox
        {
            return (this._557573430tipContainer0);
        }

        public function set reqLevel0(_arg_1:Text):void
        {
            var _local_2:Object = this._479786134reqLevel0;
            if (_local_2 !== _arg_1)
            {
                this._479786134reqLevel0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqLevel0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get uplevel():String
        {
            return (this._226921015uplevel);
        }

        public function set useType0(_arg_1:Text):void
        {
            var _local_2:Object = this._293077265useType0;
            if (_local_2 !== _arg_1)
            {
                this._293077265useType0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useType0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get nextPropBasic():String
        {
            return (this._1279859928nextPropBasic);
        }

        public function set iconImg0(_arg_1:Image):void
        {
            var _local_2:Object = this._738251546iconImg0;
            if (_local_2 !== _arg_1)
            {
                this._738251546iconImg0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImg0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconImg0():Image
        {
            return (this._738251546iconImg0);
        }

        private function _TipMedal_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = medalName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tipName0.htmlText = _arg_1;
            }, "tipName0.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = level;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tipName1.htmlText = _arg_1;
            }, "tipName1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMedal_Text1.htmlText = _arg_1;
            }, "_TipMedal_Text1.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = position;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMedal_Text2.htmlText = _arg_1;
            }, "_TipMedal_Text2.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = useType;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                useType0.htmlText = _arg_1;
            }, "useType0.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = reqLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reqLevel0.htmlText = _arg_1;
            }, "reqLevel0.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = uplevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicWeaponLevel0.htmlText = _arg_1;
            }, "magicWeaponLevel0.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMedal_Text6.htmlText = _arg_1;
            }, "_TipMedal_Text6.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = propBasic;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMedal_Text7.htmlText = _arg_1;
            }, "_TipMedal_Text7.htmlText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMedal_Text8.htmlText = _arg_1;
            }, "_TipMedal_Text8.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = totalJoinDesc;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMedal_Text9.htmlText = _arg_1;
            }, "_TipMedal_Text9.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = needExp;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMedal_Text10.htmlText = _arg_1;
            }, "_TipMedal_Text10.htmlText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = nextPropBasic;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipMedal_Text11.htmlText = _arg_1;
            }, "_TipMedal_Text11.htmlText");
            result[12] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get useType0():Text
        {
            return (this._293077265useType0);
        }

        private function setCommon(_arg_1:Object):void
        {
            var _local_5:Object;
            var _local_6:Object;
            medalName = _arg_1.temp.name;
            level = ("LV " + _arg_1.temp.level);
            iconImg0.source = ResManager.getIconUrl(_arg_1.temp.iconCode);
            description = _arg_1.temp.desc;
            position = ((Language.MEDAL_P[23] + " ") + GamePredef.MEDAL_EQUIPT_SID[_arg_1.temp.sid]);
            if (!GamePredef.MEDAL_EQUIPT_SID[_arg_1.temp.sid])
            {
                position = Language.MEDAL_P[23];
            };
            var _local_2:Number = 1006;
            if (Number(_arg_1.temp.sid) < 2000)
            {
                useType = ((Language.MEDAL_P[24] + " ") + Language.MEDAL_P[25]);
            }
            else
            {
                useType = ((Language.MEDAL_P[24] + " ") + Language.MEDAL_P[26]);
                _local_2 = 2006;
            };
            if (((!(_arg_1.temp.clevel)) || (Number(_arg_1.temp.clevel) <= _core.player.level)))
            {
                reqLevel = ((Language.MEDAL_P[27] + " ") + ((_arg_1.temp.clevel) ? _arg_1.temp.clevel : "0"));
            }
            else
            {
                reqLevel = (((("<font color='#FF0000'>" + Language.MEDAL_P[27]) + " ") + ((_arg_1.temp.clevel) ? _arg_1.temp.clevel : "0")) + "</font>");
            };
            if (Number(_arg_1.temp.level) >= GamePredef.MEDAL_MAX_LEVEL)
            {
                uplevel = Language.MEDAL_P[28];
                if (((!(_arg_1.temp.clevel)) || (Number(_arg_1.temp.clevel) <= _core.player.level)))
                {
                    uplevel = Language.MEDAL_P[28];
                }
                else
                {
                    uplevel = (("<font color='#FF0000'>" + Language.MEDAL_P[28]) + "</font>");
                };
            }
            else
            {
                for each (_local_5 in _core.data.gameDataIndex[GamePredef.TBL_MEDAL][_arg_1.temp.basicTid])
                {
                    if (Number(_local_5.level) == ToolKit.add(1, _arg_1.temp.level))
                    {
                        if (((!(_local_5.clevel)) || (Number(_local_5.clevel) <= _core.player.level)))
                        {
                            uplevel = ((Language.MEDAL_P[29] + " ") + _local_5.clevel);
                        }
                        else
                        {
                            uplevel = (((("<font color='#FF0000'>" + Language.MEDAL_P[29]) + " ") + _local_5.clevel) + "</font>");
                        };
                        break;
                    };
                };
            };
            propBasic = ((GamePredef.MEDAL_PROP_NAME[_arg_1.temp.propType] + " ") + (Number(_arg_1.temp.propVal) / 100));
            if (((_arg_1.temp.preflag) && (ToolKit.isEqual(_arg_1.temp.preflag, 1))))
            {
                propBasic = (propBasic + "%");
            };
            var _local_3:* = (("|" + _arg_1.temp.basicTid) + "|");
            var _local_4:* = "";
            for each (_local_5 in _core.data.gameDataIndex2[GamePredef.TBL_MEDAL][_local_2])
            {
                if (((_local_5) && (_local_5.joinTid)))
                {
                    if (((String(_local_5.joinTid).indexOf(_local_3) >= 0) && (Number(_local_5.level) == Number(_arg_1.temp.level))))
                    {
                        _local_4 = ((_local_4 + _local_5.name) + "\n");
                    };
                };
            };
            if ((((_local_4) && (!(_local_4 == ""))) && (GamePredef.MEDAL_EQUIPT_SID[_arg_1.temp.sid])))
            {
                totalJoinDesc = _local_4;
            }
            else
            {
                totalJoinDesc = "";
            };
            if (int(_arg_1.temp.level) == MEDAL_MAX_LEVEL)
            {
                needExp = (("<font color='#EE9611'>" + Language.MEDAL_P[52]) + "</font>");
                nextPropBasic = "";
            }
            else
            {
                needExp = (((("\n<font color='#EE9611'>" + Language.MEDAL_P[6]) + ":") + _arg_1.temp.upExp.toString()) + "</font>");
                _local_6 = getNextMedal(_arg_1.temp);
                if (_local_6)
                {
                    nextPropBasic = (((((("<font color='#EE9611'>" + Language.MEDAL_P[51]) + "\n") + GamePredef.MEDAL_PROP_NAME[_local_6.propType]) + " ") + (Number(_local_6.propVal) / 100)) + "</font>");
                };
            };
        }

        private function set description(_arg_1:String):void
        {
            var _local_2:Object = this._1724546052description;
            if (_local_2 !== _arg_1)
            {
                this._1724546052description = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "description", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get description():String
        {
            return (this._1724546052description);
        }


    }
}//package com.qeedoo.ui.view.comp

