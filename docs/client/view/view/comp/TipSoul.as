// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipSoul

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.events.ResizeEvent;
    import flash.events.MouseEvent;
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

    public class TipSoul extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2061317841nextEffctDes:Text;
        private var _1847049202nextEff:String;
        private var _1761980277txt_effct2:Text;
        private var _2067263007showBtn:Button;
        private var _1891404463soulLevel:String;
        private var _1018594020effctDes:Text;
        private var _1740157726soulName:String;
        private var _878228562txt_Exp:Text;
        private var _1761980278txt_effct1:Text;
        private var _1777484845txt_SoulName:Text;
        private var _1834909674effDesc:String;
        private var _1349163075curExp:String;
        private var _934531937reqExp:String;
        public var tipData:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
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
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_SoulName",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16407301;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"斗魂"});
                                    }
                                }), new UIComponentDescriptor({"type":Text}), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_Exp",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"兽魂经验"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_effct1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"effctDes",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txt_effct2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"nextEffctDes",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    }
                                })]
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
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipSoul()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipSoul_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipSoul._watcherSetupUtil = _arg_1;
        }


        public function set nextEffctDes(_arg_1:Text):void
        {
            var _local_2:Object = this._2061317841nextEffctDes;
            if (_local_2 !== _arg_1)
            {
                this._2061317841nextEffctDes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextEffctDes", _local_2, _arg_1));
            };
        }

        public function set object(_arg_1:Object):void
        {
            var _local_2:Object;
            if (((!(_arg_1)) || (!(_arg_1.temp))))
            {
                return;
            };
            if (_arg_1.visible)
            {
                showBtn.visible = true;
            }
            else
            {
                showBtn.visible = false;
            };
            tipData = _arg_1;
            soulName = (((_arg_1.temp.name + "  ") + Language.PET_SOUL_TIP[0]) + _arg_1.temp.level);
            if (_arg_1.isIns)
            {
                curExp = (Language.PET_SOUL_TIP[1] + (Number(_arg_1.slotData.exp) + Number(_arg_1.temp.exp)));
            }
            else
            {
                curExp = (Language.PET_SOUL_TIP[1] + _arg_1.temp.exp);
            };
            curExp = (curExp + ("/" + (Number(_arg_1.temp.upExp) + Number(_arg_1.temp.exp))));
            effDesc = ("  " + _arg_1.temp.desc);
            if (int(_arg_1.temp.level) < 10)
            {
                _local_2 = GameData.d[GamePredef.TBL_PET_SOUL][(int(_arg_1.temp.id) + 1)];
                if (_local_2)
                {
                    nextEff = ("  " + _local_2.desc);
                    txt_effct2.visible = true;
                    nextEffctDes.visible = true;
                    nextEffctDes.setStyle("color", "#e3f236");
                };
            }
            else
            {
                txt_effct2.visible = false;
                nextEffctDes.visible = false;
            };
            txt_SoulName.setStyle("color", GamePredef.MSG_ITEM_COLOR[_arg_1.temp.color]);
            txt_Exp.setStyle("color", "#e3f236");
            effctDes.setStyle("color", "#e3f236");
        }

        public function ___TipSoul_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function __showBtn_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        private function _TipSoul_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = soulName;
            _local_1 = curExp;
            _local_1 = Language.PET_SOUL_TIP[2];
            _local_1 = effDesc;
            _local_1 = Language.PET_SOUL_TIP[3];
            _local_1 = nextEff;
        }

        [Bindable(event="propertyChange")]
        public function get txt_effct2():Text
        {
            return (this._1761980277txt_effct2);
        }

        override public function initialize():void
        {
            var target:TipSoul;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipSoul_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipSoulWatcherSetupUtil");
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
        public function get txt_effct1():Text
        {
            return (this._1761980278txt_effct1);
        }

        [Bindable(event="propertyChange")]
        public function get effctDes():Text
        {
            return (this._1018594020effctDes);
        }

        public function set txt_effct2(_arg_1:Text):void
        {
            var _local_2:Object = this._1761980277txt_effct2;
            if (_local_2 !== _arg_1)
            {
                this._1761980277txt_effct2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_effct2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get soulName():String
        {
            return (this._1740157726soulName);
        }

        private function set soulLevel(_arg_1:String):void
        {
            var _local_2:Object = this._1891404463soulLevel;
            if (_local_2 !== _arg_1)
            {
                this._1891404463soulLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulLevel", _local_2, _arg_1));
            };
        }

        public function set txt_effct1(_arg_1:Text):void
        {
            var _local_2:Object = this._1761980278txt_effct1;
            if (_local_2 !== _arg_1)
            {
                this._1761980278txt_effct1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_effct1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get effDesc():String
        {
            return (this._1834909674effDesc);
        }

        [Bindable(event="propertyChange")]
        public function get txt_SoulName():Text
        {
            return (this._1777484845txt_SoulName);
        }

        private function _TipSoul_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = soulName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_SoulName.htmlText = _arg_1;
            }, "txt_SoulName.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = curExp;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_Exp.htmlText = _arg_1;
            }, "txt_Exp.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_TIP[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_effct1.htmlText = _arg_1;
            }, "txt_effct1.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = effDesc;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                effctDes.htmlText = _arg_1;
            }, "effctDes.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_TIP[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txt_effct2.htmlText = _arg_1;
            }, "txt_effct2.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = nextEff;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nextEffctDes.htmlText = _arg_1;
            }, "nextEffctDes.htmlText");
            result[5] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get nextEffctDes():Text
        {
            return (this._2061317841nextEffctDes);
        }

        [Bindable(event="propertyChange")]
        public function get txt_Exp():Text
        {
            return (this._878228562txt_Exp);
        }

        [Bindable(event="propertyChange")]
        public function get showBtn():Button
        {
            return (this._2067263007showBtn);
        }

        public function set effctDes(_arg_1:Text):void
        {
            var _local_2:Object = this._1018594020effctDes;
            if (_local_2 !== _arg_1)
            {
                this._1018594020effctDes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "effctDes", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get curExp():String
        {
            return (this._1349163075curExp);
        }

        [Bindable(event="propertyChange")]
        private function get reqExp():String
        {
            return (this._934531937reqExp);
        }

        private function set soulName(_arg_1:String):void
        {
            var _local_2:Object = this._1740157726soulName;
            if (_local_2 !== _arg_1)
            {
                this._1740157726soulName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulName", _local_2, _arg_1));
            };
        }

        private function set effDesc(_arg_1:String):void
        {
            var _local_2:Object = this._1834909674effDesc;
            if (_local_2 !== _arg_1)
            {
                this._1834909674effDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "effDesc", _local_2, _arg_1));
            };
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

        private function set reqExp(_arg_1:String):void
        {
            var _local_2:Object = this._934531937reqExp;
            if (_local_2 !== _arg_1)
            {
                this._934531937reqExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get soulLevel():String
        {
            return (this._1891404463soulLevel);
        }

        public function set txt_Exp(_arg_1:Text):void
        {
            var _local_2:Object = this._878228562txt_Exp;
            if (_local_2 !== _arg_1)
            {
                this._878228562txt_Exp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_Exp", _local_2, _arg_1));
            };
        }

        public function set txt_SoulName(_arg_1:Text):void
        {
            var _local_2:Object = this._1777484845txt_SoulName;
            if (_local_2 !== _arg_1)
            {
                this._1777484845txt_SoulName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt_SoulName", _local_2, _arg_1));
            };
        }

        private function set nextEff(_arg_1:String):void
        {
            var _local_2:Object = this._1847049202nextEff;
            if (_local_2 !== _arg_1)
            {
                this._1847049202nextEff = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextEff", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get nextEff():String
        {
            return (this._1847049202nextEff);
        }

        private function set curExp(_arg_1:String):void
        {
            var _local_2:Object = this._1349163075curExp;
            if (_local_2 !== _arg_1)
            {
                this._1349163075curExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curExp", _local_2, _arg_1));
            };
        }

        override public function show(_arg_1:Object=null):void
        {
            setPos();
            this.visible = true;
        }


    }
}//package com.qeedoo.ui.view.comp

