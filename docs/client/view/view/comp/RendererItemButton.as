// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererItemButton

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
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

    public class RendererItemButton extends Canvas 
    {

        private var _97884btn:Button;
        private var _click:Function;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn",
                        "events":{"click":"__btn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "width":80,
                                "height":25
                            });
                        }
                    })]});
            }
        });
        private var _obj:Object;

        public function RendererItemButton()
        {
            mx_internal::_document = this;
        }

        private function onClick():void
        {
            if (_click)
            {
                _click(_obj.type, _obj.index);
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

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        override public function set data(_arg_1:Object):void
        {
            _obj = _arg_1;
            if (_obj.onClick)
            {
                _click = _obj.onClick;
            };
            if (_obj.label)
            {
                btn.label = _obj.label;
            };
            if (_obj.isTaken)
            {
                btn.enabled = false;
                btn.label = Language.SERVERACTPANEL_S[14];
            }
            else
            {
                if (_obj.score >= _obj.limit)
                {
                    btn.enabled = true;
                }
                else
                {
                    btn.enabled = false;
                };
                btn.label = Language.SERVERACTPANEL_S[13];
            };
            btn.styleName = "BtnStdRed";
            super.data = _obj;
        }

        [Bindable(event="propertyChange")]
        public function get btn():Button
        {
            return (this._97884btn);
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            onClick();
        }


    }
}//package com.qeedoo.ui.view.comp

