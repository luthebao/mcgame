// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ManJiuJianOneCanvas

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
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

    public class ManJiuJianOneCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _iid:Number;
        private var _106966249ptLab:Label;
        private var _pt:Number;
        private var _hasBuy:Number;
        private var _1164640210limitLab:Label;
        private var _1945394687infoLab:Label;
        private var _1832349893addCartBtn:Button;
        private var _limit:Number;
        private var _lab:String;
        private var _3242771item:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":130,
                    "height":85,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8.5,
                                "y":10.55,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"addCartBtn",
                        "events":{"click":"__addCartBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "x":54.4,
                                "y":55.5,
                                "width":70,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"infoLab",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45.9,
                                "y":7.55,
                                "width":80,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"limitLab",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5.95,
                                "y":55,
                                "width":46.45,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"ptLab",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45.9,
                                "y":29,
                                "width":80,
                                "height":20,
                                "text":"20点"
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

        public function ManJiuJianOneCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0.3;
            };
            this.width = 130;
            this.height = 85;
            this.styleName = "RoundedGradientBorder";
            this.addEventListener("creationComplete", ___ManJiuJianOneCanvas_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ManJiuJianOneCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get ptLab():Label
        {
            return (this._106966249ptLab);
        }

        private function _ManJiuJianOneCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addCartBtn.label = _arg_1;
            }, "addCartBtn.label");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlot
        {
            return (this._3242771item);
        }

        override public function initialize():void
        {
            var target:ManJiuJianOneCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ManJiuJianOneCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ManJiuJianOneCanvasWatcherSetupUtil");
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

        private function _ManJiuJianOneCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MANJIUJIAN_PANEL[16];
        }

        public function set limitLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1164640210limitLab;
            if (_local_2 !== _arg_1)
            {
                this._1164640210limitLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitLab", _local_2, _arg_1));
            };
        }

        public function ___ManJiuJianOneCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initData();
        }

        public function set item(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3242771item;
            if (_local_2 !== _arg_1)
            {
                this._3242771item = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addCartBtn():Button
        {
            return (this._1832349893addCartBtn);
        }

        public function slotData():void
        {
            var _local_1:Object = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_iid];
            if (((_local_1) && (_local_1.name)))
            {
                this.Lab = _local_1.name;
            };
            if (initialized)
            {
                item.type = GamePredef.TBL_ITEM_TEMPLATE;
                item.giid = _iid;
                item.slotData = _local_1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get limitLab():Label
        {
            return (this._1164640210limitLab);
        }

        public function set ptLab(_arg_1:Label):void
        {
            var _local_2:Object = this._106966249ptLab;
            if (_local_2 !== _arg_1)
            {
                this._106966249ptLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ptLab", _local_2, _arg_1));
            };
        }

        public function set Lab(_arg_1:String):void
        {
            _lab = _arg_1;
            if (initialized)
            {
                infoLab.htmlText = _lab;
            };
        }

        public function set ItemId(_arg_1:Number):void
        {
            _iid = _arg_1;
        }

        private function initData():void
        {
            this.Point = _pt;
            this.ItemId = _iid;
            this.slotData();
            this.setLimit(_limit, _hasBuy);
        }

        public function __addCartBtn_click(_arg_1:MouseEvent):void
        {
            addCart();
        }

        public function set Point(_arg_1:Number):void
        {
            _pt = _arg_1;
            if (initialized)
            {
                ptLab.htmlText = (_pt + "点数");
            };
        }

        private function addCart():void
        {
            if (!_iid)
            {
                return;
            };
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_MANJIUJIAN);
            if (_local_1)
            {
                _local_1.addCart(_iid);
            };
        }

        public function setLimit(_arg_1:Number, _arg_2:Number):void
        {
            _limit = _arg_1;
            _hasBuy = ((_arg_2) ? _arg_2 : 0);
            if (initialized)
            {
                limitLab.htmlText = ("剩:" + ToolKit.minus(_limit, _hasBuy));
            };
        }

        public function set addCartBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1832349893addCartBtn;
            if (_local_2 !== _arg_1)
            {
                this._1832349893addCartBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addCartBtn", _local_2, _arg_1));
            };
        }

        public function set infoLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1945394687infoLab;
            if (_local_2 !== _arg_1)
            {
                this._1945394687infoLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoLab", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoLab():Label
        {
            return (this._1945394687infoLab);
        }


    }
}//package com.qeedoo.ui.view.comp

