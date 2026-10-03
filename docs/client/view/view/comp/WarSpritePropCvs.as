// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.WarSpritePropCvs

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
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

    public class WarSpritePropCvs extends Canvas 
    {

        private var _309157064propLB1:Label;
        private var _309157062propLB3:Label;
        private var _1307249202titleLB:Label;
        private var _309157060propLB5:Label;
        public var kind:Number;
        private var _309157063propLB2:Label;
        private var _309157061propLB4:Label;
        private var _309157059propLB6:Label;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":155,
                    "height":165,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"titleLB",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.horizontalCenter = "0";
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"property:",
                                "y":3
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":110,
                                "height":1,
                                "y":22
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"propLB1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":28
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"propLB2",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"propLB3",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":72
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"propLB4",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":94
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"propLB5",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":116
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"propLB6",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":138
                            });
                        }
                    })]
                });
            }
        });

        public function WarSpritePropCvs()
        {
            mx_internal::_document = this;
            this.width = 155;
            this.height = 165;
            this.styleName = "CanvasBorder";
        }

        public function set propLB6(_arg_1:Label):void
        {
            var _local_2:Object = this._309157059propLB6;
            if (_local_2 !== _arg_1)
            {
                this._309157059propLB6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propLB6", _local_2, _arg_1));
            };
        }

        public function updateView(_arg_1:Number):void
        {
            var _local_5:Label;
            var _local_6:Number;
            var _local_7:Number;
            if (kind == 1)
            {
                titleLB.text = Language.WAR_SPRITE[6];
            }
            else
            {
                titleLB.text = Language.WAR_SPRITE[7];
            };
            var _local_2:Object = GameData.d[GamePredef.TBL_WAR_SPRITE][_arg_1];
            var _local_3:int = 1;
            var _local_4:int = 1;
            while (_local_4 <= 6)
            {
                _local_5 = (this[("propLB" + _local_4)] as Label);
                if (_local_2)
                {
                    _local_6 = Number(_local_2[("pT" + _local_3)]);
                    _local_7 = Number(_local_2[("pN" + _local_3)]);
                    if (_local_6)
                    {
                        if (((_local_6 == 5) || (_local_6 == 7)))
                        {
                            _local_6 = Number(_local_2[("pT" + ++_local_3)]);
                            _local_7 = Number(_local_2[("pN" + _local_3)]);
                            this[("propLB" + _local_4)].text = Language.WAR_SPRITE_PROP[_local_6].toString().replace("{num}", (_local_7 / 100));
                            _local_3++;
                        }
                        else
                        {
                            this[("propLB" + _local_4)].text = Language.WAR_SPRITE_PROP[_local_6].toString().replace("{num}", (_local_7 / 100));
                            _local_3++;
                        };
                    };
                }
                else
                {
                    _local_5.text = "Đã Max Cấp";
                };
                _local_4++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get propLB6():Label
        {
            return (this._309157059propLB6);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set titleLB(_arg_1:Label):void
        {
            var _local_2:Object = this._1307249202titleLB;
            if (_local_2 !== _arg_1)
            {
                this._1307249202titleLB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleLB", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get titleLB():Label
        {
            return (this._1307249202titleLB);
        }

        public function set propLB1(_arg_1:Label):void
        {
            var _local_2:Object = this._309157064propLB1;
            if (_local_2 !== _arg_1)
            {
                this._309157064propLB1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propLB1", _local_2, _arg_1));
            };
        }

        public function set propLB2(_arg_1:Label):void
        {
            var _local_2:Object = this._309157063propLB2;
            if (_local_2 !== _arg_1)
            {
                this._309157063propLB2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propLB2", _local_2, _arg_1));
            };
        }

        public function set propLB3(_arg_1:Label):void
        {
            var _local_2:Object = this._309157062propLB3;
            if (_local_2 !== _arg_1)
            {
                this._309157062propLB3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propLB3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propLB1():Label
        {
            return (this._309157064propLB1);
        }

        [Bindable(event="propertyChange")]
        public function get propLB2():Label
        {
            return (this._309157063propLB2);
        }

        [Bindable(event="propertyChange")]
        public function get propLB3():Label
        {
            return (this._309157062propLB3);
        }

        [Bindable(event="propertyChange")]
        public function get propLB4():Label
        {
            return (this._309157061propLB4);
        }

        [Bindable(event="propertyChange")]
        public function get propLB5():Label
        {
            return (this._309157060propLB5);
        }

        public function set propLB4(_arg_1:Label):void
        {
            var _local_2:Object = this._309157061propLB4;
            if (_local_2 !== _arg_1)
            {
                this._309157061propLB4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propLB4", _local_2, _arg_1));
            };
        }

        public function set propLB5(_arg_1:Label):void
        {
            var _local_2:Object = this._309157060propLB5;
            if (_local_2 !== _arg_1)
            {
                this._309157060propLB5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propLB5", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

