// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererLabel2

package com.qeedoo.ui.view.comp
{
    import mx.containers.HBox;
    import mx.controls.Label;
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

    public class RendererLabel2 extends HBox 
    {

        private var _95474683descl:Label;
        private var _104585025namel:Label;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":20,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"namel",
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":70});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"descl",
                        "stylesFactory":function ():void
                        {
                            this.color = 16744228;
                        }
                    })]
                });
            }
        });

        public function RendererLabel2()
        {
            mx_internal::_document = this;
            this.height = 20;
        }

        [Bindable(event="propertyChange")]
        public function get namel():Label
        {
            return (this._104585025namel);
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

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            namel.text = data.name;
            descl.text = data.desc;
            namel.setStyle("color", data.color);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        [Bindable(event="propertyChange")]
        public function get descl():Label
        {
            return (this._95474683descl);
        }

        public function set descl(_arg_1:Label):void
        {
            var _local_2:Object = this._95474683descl;
            if (_local_2 !== _arg_1)
            {
                this._95474683descl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descl", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

