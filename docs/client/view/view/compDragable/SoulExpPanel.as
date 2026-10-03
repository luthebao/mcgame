// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SoulExpPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.HSlider;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.events.SliderEvent;
    import com.qeedoo.game.view.ViewManager;
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

    public class SoulExpPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _104585025namel:Label;
        private var _3127759expL:String = "";
        private var _937993588expHSlider:HSlider;
        private var _2931038_exp:int = 0;
        public var _SoulExpPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1310192533expInfo:Label;
        public var _SoulExpPanel_Label4:Label;
        private var _104584993nameL:String = "";
        private var _1289196801expBtn:BasicGlowButton;
        private var _849919943totalExp:Label;
        private var obj:Object;
        private var _90862254_expL:String = "";

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":270,
                    "height":110,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SoulExpPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"namel",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"expInfo",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":100,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"totalExp",
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.color = 16775802;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":50});
                        }
                    }), new UIComponentDescriptor({
                        "type":HSlider,
                        "id":"expHSlider",
                        "events":{"change":"__expHSlider_change"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":65,
                                "width":155,
                                "liveDragging":true,
                                "minimum":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_SoulExpPanel_Label4",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":33,
                                "y":81
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"expBtn",
                        "events":{"click":"__expBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":68,
                                "width":60,
                                "styleName":"BtnNormalRed"
                            });
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

        public function SoulExpPanel()
        {
            mx_internal::_document = this;
            this.width = 270;
            this.height = 110;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SoulExpPanel._watcherSetupUtil = _arg_1;
        }


        public function set namel(_arg_1:Label):void
        {
            var _local_2:Object = this._104585025namel;
            if (_local_2 !== _arg_1)
            {
                this._104585025namel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "namel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get expHSlider():HSlider
        {
            return (this._937993588expHSlider);
        }

        override public function initialize():void
        {
            var target:SoulExpPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SoulExpPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SoulExpPanelWatcherSetupUtil");
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

        public function set expL(_arg_1:String):void
        {
            var _local_2:Object = this._3127759expL;
            if (_local_2 !== _arg_1)
            {
                this._3127759expL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expL", _local_2, _arg_1));
            };
        }

        private function _SoulExpPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_SOUL_S[18];
            _local_1 = nameL;
            _local_1 = expL;
            _local_1 = _expL;
            _local_1 = _exp;
            _local_1 = Language.PET_SOUL_S[19];
            _local_1 = Language.PET_SOUL_S[20];
        }

        [Bindable(event="propertyChange")]
        public function get nameL():String
        {
            return (this._104584993nameL);
        }

        public function set expHSlider(_arg_1:HSlider):void
        {
            var _local_2:Object = this._937993588expHSlider;
            if (_local_2 !== _arg_1)
            {
                this._937993588expHSlider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expHSlider", _local_2, _arg_1));
            };
        }

        public function __expBtn_click(_arg_1:MouseEvent):void
        {
            subPutExp();
        }

        public function onChangeExp():void
        {
            expHSlider.toolTip = ("" + Math.floor(expHSlider.value));
            expL = (((int(obj.exp) + Math.floor(expHSlider.value)) + "/") + obj.upExp);
            _expL = (Language.PET_SOUL_S[11] + (int(_core.player.soulExp) - Math.floor(expHSlider.value)));
        }

        [Bindable(event="propertyChange")]
        public function get _expL():String
        {
            return (this._90862254_expL);
        }

        [Bindable(event="propertyChange")]
        public function get totalExp():Label
        {
            return (this._849919943totalExp);
        }

        public function set _exp(_arg_1:int):void
        {
            var _local_2:Object = this._2931038_exp;
            if (_local_2 !== _arg_1)
            {
                this._2931038_exp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_exp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get namel():Label
        {
            return (this._104585025namel);
        }

        public function set nameL(_arg_1:String):void
        {
            var _local_2:Object = this._104584993nameL;
            if (_local_2 !== _arg_1)
            {
                this._104584993nameL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameL", _local_2, _arg_1));
            };
        }

        public function set expData(_arg_1:Object):void
        {
            obj = _arg_1;
            _exp = _arg_1.needExp;
            expL = ((_arg_1.exp + "/") + _arg_1.upExp);
            _expL = (Language.PET_SOUL_S[11] + _core.player.soulExp);
            nameL = _arg_1.name;
            namel.setStyle("color", _arg_1.color);
            expHSlider.value = 0;
        }

        [Bindable(event="propertyChange")]
        public function get expL():String
        {
            return (this._3127759expL);
        }

        public function set expInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1310192533expInfo;
            if (_local_2 !== _arg_1)
            {
                this._1310192533expInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expInfo", _local_2, _arg_1));
            };
        }

        private function _SoulExpPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SoulExpPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SoulExpPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = nameL;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                namel.text = _arg_1;
            }, "namel.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = expL;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                expInfo.text = _arg_1;
            }, "expInfo.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _expL;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                totalExp.text = _arg_1;
            }, "totalExp.text");
            result[3] = binding;
            binding = new Binding(this, function ():Number
            {
                return (_exp);
            }, function (_arg_1:Number):void
            {
                expHSlider.maximum = _arg_1;
            }, "expHSlider.maximum");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SoulExpPanel_Label4.text = _arg_1;
            }, "_SoulExpPanel_Label4.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                expBtn.label = _arg_1;
            }, "expBtn.label");
            result[6] = binding;
            return (result);
        }

        public function __expHSlider_change(_arg_1:SliderEvent):void
        {
            onChangeExp();
        }

        [Bindable(event="propertyChange")]
        public function get _exp():int
        {
            return (this._2931038_exp);
        }

        public function subPutExp():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_PET_SOUL);
            if (_local_1)
            {
                _local_1.putInToExp((expHSlider.value / _exp));
            };
            this.hide();
        }

        [Bindable(event="propertyChange")]
        public function get expInfo():Label
        {
            return (this._1310192533expInfo);
        }

        public function set _expL(_arg_1:String):void
        {
            var _local_2:Object = this._90862254_expL;
            if (_local_2 !== _arg_1)
            {
                this._90862254_expL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_expL", _local_2, _arg_1));
            };
        }

        public function set totalExp(_arg_1:Label):void
        {
            var _local_2:Object = this._849919943totalExp;
            if (_local_2 !== _arg_1)
            {
                this._849919943totalExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalExp", _local_2, _arg_1));
            };
        }

        public function set expBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1289196801expBtn;
            if (_local_2 !== _arg_1)
            {
                this._1289196801expBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get expBtn():BasicGlowButton
        {
            return (this._1289196801expBtn);
        }


    }
}//package com.qeedoo.ui.view.compDragable

