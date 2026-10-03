// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererCurrencyMax

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
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

    public class RendererCurrencyMax extends Currency 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Currency,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":80,
                    "height":16
                });
            }
        });

        public function RendererCurrencyMax()
        {
            mx_internal::_document = this;
            this.width = 80;
            this.height = 16;
            this.addEventListener("creationComplete", ___RendererCurrencyMax_Currency1_creationComplete);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            if (_arg_1.auctionType == 1)
            {
                type = TYPE_MONEY;
                value = _arg_1.maxMoney;
            }
            else
            {
                if (_arg_1.auctionType == 2)
                {
                    type = TYPE_GOLD;
                    value = _arg_1.maxGold;
                };
            };
        }

        public function ___RendererCurrencyMax_Currency1_creationComplete(_arg_1:FlexEvent):void
        {
            initV();
        }

        private function initV():void
        {
            verticalScrollPolicy;
        }


    }
}//package com.qeedoo.ui.view.comp

