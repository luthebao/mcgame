// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererLabel3

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.controls.HRule;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
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

    public class RendererLabel3 extends Canvas 
    {

        private var _3136bb:Label;
        private var _3104aa:Label;
        private var _3904zz:HRule;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":20,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"aa",
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":0});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"bb",
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":118});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"cc",
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":236});
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "id":"zz",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "0";
                            this.strokeColor = 0xCCCCCC;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "x":0,
                                "height":1,
                                "alpha":0.3
                            });
                        }
                    })]
                });
            }
        });
        private var _3168cc:Label;

        public function RendererLabel3()
        {
            mx_internal::_document = this;
            this.height = 20;
        }

        public function set cc(_arg_1:Label):void
        {
            var _local_2:Object = this._3168cc;
            if (_local_2 !== _arg_1)
            {
                this._3168cc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get zz():HRule
        {
            return (this._3904zz);
        }

        [Bindable(event="propertyChange")]
        public function get cc():Label
        {
            return (this._3168cc);
        }

        [Bindable(event="propertyChange")]
        public function get bb():Label
        {
            return (this._3136bb);
        }

        [Bindable(event="propertyChange")]
        public function get aa():Label
        {
            return (this._3104aa);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            aa.text = data.pro0;
            bb.text = data.pro1;
            cc.text = data.pro2;
            aa.setStyle("color", data.color0);
            bb.setStyle("color", data.color1);
            cc.setStyle("color", data.color2);
            if (data.id == 9)
            {
                zz.visible = false;
            }
            else
            {
                zz.visible = true;
            };
        }

        public function set aa(_arg_1:Label):void
        {
            var _local_2:Object = this._3104aa;
            if (_local_2 !== _arg_1)
            {
                this._3104aa = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aa", _local_2, _arg_1));
            };
        }

        public function set bb(_arg_1:Label):void
        {
            var _local_2:Object = this._3136bb;
            if (_local_2 !== _arg_1)
            {
                this._3136bb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bb", _local_2, _arg_1));
            };
        }

        public function set zz(_arg_1:HRule):void
        {
            var _local_2:Object = this._3904zz;
            if (_local_2 !== _arg_1)
            {
                this._3904zz = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zz", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

