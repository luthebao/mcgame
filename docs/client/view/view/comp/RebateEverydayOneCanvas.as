// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RebateEverydayOneCanvas

package com.qeedoo.ui.view.comp
{
    import mx.controls.Label;
    import mx.controls.Alert;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.data.GameData;
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

    public class RebateEverydayOneCanvas extends SimpleCanvas 
    {

        private var _iid:Number;
        private var _1721933570nameLab:Label;
        private var _1649909124numberLab:Label;
        private var _lab:String;
        private var _alert:Alert;
        private var _97884btn:Button;
        private var _3242771item:ItemSlot;
        private var _1524928035wordLab:Label;
        private var _number:Number;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":190,
                    "height":120,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":18,
                                "y":18,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn",
                        "events":{"click":"__btn_click"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "label":"马上兑换",
                                "x":45,
                                "y":80,
                                "width":100,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameLab",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":55,
                                "y":15,
                                "width":135,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"wordLab",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":55,
                                "y":35,
                                "width":135,
                                "height":20,
                                "text":"兑换消耗:"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"numberLab",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":55,
                                "y":55,
                                "width":135,
                                "height":20
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();

        public function RebateEverydayOneCanvas()
        {
            mx_internal::_document = this;
            this.width = 190;
            this.height = 120;
            this.styleName = "CanvasBorder";
            this.addEventListener("creationComplete", ___RebateEverydayOneCanvas_SimpleCanvas1_creationComplete);
        }

        [Bindable(event="propertyChange")]
        public function get nameLab():Label
        {
            return (this._1721933570nameLab);
        }

        public function set nameLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1721933570nameLab;
            if (_local_2 !== _arg_1)
            {
                this._1721933570nameLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLab", _local_2, _arg_1));
            };
        }

        public function set wordLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1524928035wordLab;
            if (_local_2 !== _arg_1)
            {
                this._1524928035wordLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wordLab", _local_2, _arg_1));
            };
        }

        public function set numberLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1649909124numberLab;
            if (_local_2 !== _arg_1)
            {
                this._1649909124numberLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberLab", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberLab():Label
        {
            return (this._1649909124numberLab);
        }

        public function set Num(_arg_1:Number):void
        {
            _number = _arg_1;
            if (initialized)
            {
                numberLab.htmlText = Language.REBATE_EVERYDAY_PANEL[4].replace("{num}", _number);
            };
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlot
        {
            return (this._3242771item);
        }

        private function initData():void
        {
            if (_number)
            {
                this.Num = _number;
            };
            if (_iid)
            {
                this.ItemData = _iid;
            };
            if (_lab)
            {
                this.Lab = _lab;
            };
            this.x = 8;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set Lab(_arg_1:String):void
        {
            var _local_2:Number;
            _lab = _arg_1;
            if (initialized)
            {
                _local_2 = 0;
                if (((item.slotData) && (item.slotData.color)))
                {
                    _local_2 = item.slotData.color;
                };
                if (_local_2 < 0)
                {
                    _local_2 = 0;
                };
                _lab = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_2]) + "'>") + _lab) + "</font>");
                nameLab.htmlText = _lab;
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn():Button
        {
            return (this._97884btn);
        }

        public function get Num():Number
        {
            return (_number);
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            clickBtn();
        }

        [Bindable(event="propertyChange")]
        public function get wordLab():Label
        {
            return (this._1524928035wordLab);
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

        private function clickBtn():void
        {
            var _local_1:* = "";
            _local_1 = (_local_1 + Language.REBATE_EVERYDAY_PANEL[3].replace("{point}", _number).replace("{name}", item.slotData.name));
            var _local_2:* = _core.view.getUI(ViewManager.PANEL_REBATEEVERYDAY_ALERT);
            if (_local_2)
            {
                _local_2.iid = _iid;
                _local_2.str = _local_1;
                _local_2.showPanel();
            };
        }

        public function set btn(_arg_1:Button):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        public function set ItemData(_arg_1:Number):void
        {
            _iid = _arg_1;
            if (initialized)
            {
                item.type = GamePredef.TBL_ITEM_TEMPLATE;
                item.giid = _arg_1;
                item.slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_1];
            };
        }

        public function ___RebateEverydayOneCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initData();
        }


    }
}//package com.qeedoo.ui.view.comp

