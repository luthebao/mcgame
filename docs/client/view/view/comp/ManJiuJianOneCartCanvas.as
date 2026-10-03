// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ManJiuJianOneCartCanvas

package com.qeedoo.ui.view.comp
{
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.controls.LinkButton;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
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

    public class ManJiuJianOneCartCanvas extends SimpleCanvas 
    {

        private var _iid:Number;
        private var _3237501inum:Label;
        private var _104493ipt:Label;
        private var _bc:Number;
        private var _pt:Number;
        private var _3242771item:ItemSlot;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":459,
                    "height":38,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":6.5,
                                "y":2.55,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"iname",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 13;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":125,
                                "height":30,
                                "y":7,
                                "x":55
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"inum",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 13;
                            this.color = 0xFFFF;
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":70,
                                "height":30,
                                "text":"3",
                                "y":8,
                                "x":150
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"ipt",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 13;
                            this.color = 0xFFFF00;
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":90,
                                "height":30,
                                "text":"3",
                                "y":8,
                                "x":300
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "events":{"click":"___ManJiuJianOneCartCanvas_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.textDecoration = "underline";
                            this.fontSize = 13;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":401,
                                "y":9,
                                "label":"删除",
                                "width":58
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _100343412iname:Label;

        public function ManJiuJianOneCartCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0;
            };
            this.width = 459;
            this.height = 38;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___ManJiuJianOneCartCanvas_SimpleCanvas1_creationComplete);
        }

        private function removeCart():void
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_MANJIUJIAN);
            if (_local_1)
            {
                _local_1.removeCart(_iid);
            };
        }

        public function set BuyCount(_arg_1:Number):void
        {
            _bc = _arg_1;
            if (initialized)
            {
                inum.text = String(_bc);
            };
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlot
        {
            return (this._3242771item);
        }

        private function initData():void
        {
            this.ItemId = _iid;
            this.BuyCount = _bc;
            this.Point = _pt;
        }

        public function set ItemId(_arg_1:Number):void
        {
            var _local_2:Object;
            _iid = _arg_1;
            if (initialized)
            {
                _local_2 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_iid];
                item.type = GamePredef.TBL_ITEM_TEMPLATE;
                item.giid = _iid;
                item.slotData = _local_2;
                iname.text = _local_2.name;
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set ipt(_arg_1:Label):void
        {
            var _local_2:Object = this._104493ipt;
            if (_local_2 !== _arg_1)
            {
                this._104493ipt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ipt", _local_2, _arg_1));
            };
        }

        public function ___ManJiuJianOneCartCanvas_LinkButton1_click(_arg_1:MouseEvent):void
        {
            removeCart();
        }

        public function set Point(_arg_1:Number):void
        {
            _pt = _arg_1;
            if (initialized)
            {
                ipt.text = String(_pt);
            };
        }

        [Bindable(event="propertyChange")]
        public function get ipt():Label
        {
            return (this._104493ipt);
        }

        public function set iname(_arg_1:Label):void
        {
            var _local_2:Object = this._100343412iname;
            if (_local_2 !== _arg_1)
            {
                this._100343412iname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iname", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iname():Label
        {
            return (this._100343412iname);
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

        public function ___ManJiuJianOneCartCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initData();
        }

        public function set inum(_arg_1:Label):void
        {
            var _local_2:Object = this._3237501inum;
            if (_local_2 !== _arg_1)
            {
                this._3237501inum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get inum():Label
        {
            return (this._3237501inum);
        }


    }
}//package com.qeedoo.ui.view.comp

