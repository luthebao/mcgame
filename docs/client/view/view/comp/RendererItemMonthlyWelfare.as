// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererItemMonthlyWelfare

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
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

    public class RendererItemMonthlyWelfare extends RendererItemSlot 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":RendererItemSlot,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "id":"hbox",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 4;
                        }
                    })]});
            }
        });
        private var _3196003hbox:HBox;

        public function RendererItemMonthlyWelfare()
        {
            mx_internal::_document = this;
            this.scaleX = 1;
            this.scaleY = 1;
            this.addEventListener("creationComplete", ___RendererItemMonthlyWelfare_RendererItemSlot1_creationComplete);
        }

        [Bindable(event="propertyChange")]
        public function get hbox():HBox
        {
            return (this._3196003hbox);
        }

        public function ___RendererItemMonthlyWelfare_RendererItemSlot1_creationComplete(_arg_1:FlexEvent):void
        {
            initV();
        }

        private function initV():void
        {
        }

        public function set hbox(_arg_1:HBox):void
        {
            var _local_2:Object = this._3196003hbox;
            if (_local_2 !== _arg_1)
            {
                this._3196003hbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hbox", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        override public function set data(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_4:*;
            var _local_5:ItemSlot;
            _local_2 = _arg_1.array;
            hbox.removeAllChildren();
            var _local_3:int;
            for (_local_4 in _local_2)
            {
                _local_5 = new ItemSlot();
                _local_5.setStyleName(0);
                _local_5.data = _local_2[_local_4];
                _local_5.type = _local_2[_local_4].type;
                _local_5.giid = _local_2[_local_4].itemId;
                _local_5.stackNum = _local_2[_local_4].stackNum;
                _local_5.slotData = {};
                _local_5.slotData.q = _local_2[_local_4].quality;
                _local_5.isInAuction = true;
                hbox.addChild(_local_5);
                _local_3++;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

