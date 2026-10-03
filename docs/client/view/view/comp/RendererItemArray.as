// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererItemArray

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
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

    public class RendererItemArray extends Canvas 
    {

        public var isManagePlan:Boolean = false;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
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

        public function RendererItemArray()
        {
            mx_internal::_document = this;
            this.scaleX = 1;
            this.scaleY = 1;
            this.addEventListener("creationComplete", ___RendererItemArray_Canvas1_creationComplete);
        }

        [Bindable(event="propertyChange")]
        public function get hbox():HBox
        {
            return (this._3196003hbox);
        }

        public function hasData():Boolean
        {
            var _local_1:Array = hbox.getChildren();
            return ((_local_1.length > 0) ? true : false);
        }

        private function initV(_arg_1:Boolean=false):void
        {
            isManagePlan = _arg_1;
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

        public function ___RendererItemArray_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initV(isManagePlan);
        }

        override public function set data(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_4:*;
            var _local_5:ItemSlot;
            var _local_6:String;
            var _local_7:PointSlot;
            _local_2 = _arg_1.array;
            hbox.removeAllChildren();
            var _local_3:int;
            for (_local_4 in _local_2)
            {
                _local_5 = new ItemSlot();
                if (_local_2[_local_4].itemId == "-1")
                {
                    _local_6 = ResManager.getIconUrl(Number(_local_2[_local_4].iconCode));
                    _local_5.setIconToolTip(_local_6, _local_2[_local_4].description);
                }
                else
                {
                    _local_5.setStyleName(0);
                    _local_5.data = _local_2[_local_4];
                    _local_5.stackNum = _local_2[_local_4].stackNum;
                    _local_5.type = _local_2[_local_4].itemType;
                    _local_5.giid = _local_2[_local_4].itemId;
                    _local_5.movable = false;
                    _local_5.slotData = _local_2[_local_4];
                    _local_5.slotType = Slot.SLOT_TEMP_SLOT;
                    _local_5.quality = _local_2[_local_4].quality;
                };
                hbox.addChild(_local_5);
                _local_3++;
            };
            if (_arg_1.point > 0)
            {
                _local_7 = new PointSlot();
                _local_7.pointValue = _arg_1.point;
                if (isManagePlan)
                {
                    _local_7.pointType = "managePlan";
                };
                hbox.addChild(_local_7);
            };
        }


    }
}//package com.qeedoo.ui.view.comp

