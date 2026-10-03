// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererImageLabel

package com.qeedoo.ui.view.comp
{
    import mx.containers.HBox;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Label;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
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

    public class RendererImageLabel extends HBox 
    {

        private var _104387img:Image;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":16,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":16,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"lb",
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":16});
                        }
                    })]
                });
            }
        });
        private var _3446lb:Label;
        private var _859611628imageURL:String;

        public function RendererImageLabel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.verticalAlign = "middle";
                this.horizontalGap = 1;
            };
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.height = 16;
        }

        [Bindable(event="propertyChange")]
        public function get imageURL():String
        {
            return (this._859611628imageURL);
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        public function set lb(_arg_1:Label):void
        {
            var _local_2:Object = this._3446lb;
            if (_local_2 !== _arg_1)
            {
                this._3446lb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb", _local_2, _arg_1));
            };
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        public function set imageURL(_arg_1:String):void
        {
            var _local_2:Object = this._859611628imageURL;
            if (_local_2 !== _arg_1)
            {
                this._859611628imageURL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imageURL", _local_2, _arg_1));
            };
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            if (_arg_1)
            {
                if (_arg_1.icon)
                {
                    img.source = _arg_1.icon;
                }
                else
                {
                    img.visible = false;
                    img.includeInLayout = false;
                };
                lb.text = _arg_1.text;
                lb.setStyle("color", _arg_1.color);
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb():Label
        {
            return (this._3446lb);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }


    }
}//package com.qeedoo.ui.view.comp

