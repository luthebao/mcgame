// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ScrollTextArrCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.core.UIComponent;
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

    public class ScrollTextArrCanvas extends Canvas 
    {

        private var _index:Number = 0;
        private var _1662853568elemUIC:UIComponent;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":158,
                    "height":100,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":UIComponent,
                        "id":"elemUIC",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":20,
                                "width":300,
                                "height":30
                            });
                        }
                    })]
                });
            }
        });
        private var _scrollText1:ScrollText;
        private var _scrollText2:ScrollText;
        private var _scrollText3:ScrollText;

        public function ScrollTextArrCanvas()
        {
            mx_internal::_document = this;
            this.width = 158;
            this.height = 100;
            this.clipContent = false;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        [Bindable(event="propertyChange")]
        public function get elemUIC():UIComponent
        {
            return (this._1662853568elemUIC);
        }

        public function set elemUIC(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._1662853568elemUIC;
            if (_local_2 !== _arg_1)
            {
                this._1662853568elemUIC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elemUIC", _local_2, _arg_1));
            };
        }

        public function setValue(_arg_1:int, _arg_2:String="", _arg_3:String="", _arg_4:int=14):void
        {
            _index++;
            if ((((!(_index)) || (Number(_index) > 3)) || (Number(_index) < 1)))
            {
                _index = 1;
            };
            if (!this[("_scrollText" + _index)])
            {
                this[("_scrollText" + _index)] = new ScrollText();
                elemUIC.addChild(this[("_scrollText" + _index)]);
                this[("_scrollText" + _index)].x = 0;
                this[("_scrollText" + _index)].y = -60;
            };
            var _local_5:uint = 0xFF0000;
            if (Number(_arg_1) > 0)
            {
                _local_5 = 0xFF00;
            };
            this[("_scrollText" + _index)].show(((("+" + _arg_2) + _arg_1) + _arg_3), _local_5, _arg_4);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }


    }
}//package com.qeedoo.ui.view.comp

