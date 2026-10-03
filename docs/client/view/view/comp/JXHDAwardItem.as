// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.JXHDAwardItem

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.containers.Tile;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
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

    public class JXHDAwardItem extends Canvas 
    {

        private var _data:Object;
        private var _1177280081itemList:Tile;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":400,
                    "height":70,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"title",
                        "stylesFactory":function ():void
                        {
                            this.top = "3";
                            this.left = "10";
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"text":""});
                        }
                    }), new UIComponentDescriptor({
                        "type":Tile,
                        "id":"itemList",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 5;
                            this.top = "26";
                            this.bottom = "10";
                            this.left = "5";
                            this.right = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "direction":"horizontal",
                                "width":370
                            });
                        }
                    })]
                });
            }
        });
        private var _110371416title:RoundedLabel;

        public function JXHDAwardItem()
        {
            mx_internal::_document = this;
            this.width = 400;
            this.height = 70;
        }

        public function set itemList(_arg_1:Tile):void
        {
            var _local_2:Object = this._1177280081itemList;
            if (_local_2 !== _arg_1)
            {
                this._1177280081itemList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemList", _local_2, _arg_1));
            };
        }

        public function setData(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_4:ItemSlot;
            itemList.removeAllChildren();
            title.text = "";
            title.text = _arg_1.title;
            for (_local_2 in _arg_1.list)
            {
                if (_arg_1.list[_local_2])
                {
                    _local_3 = GameData.d[int(_arg_1.list[_local_2].t)][int(_arg_1.list[_local_2].i)];
                    _local_4 = new ItemSlot();
                    _local_4.acceptable = false;
                    _local_4.movable = false;
                    _local_4.slotType = Slot.SLOT_EQUFUNC_ITEM;
                    _local_4.type = int(_arg_1.list[_local_2].t);
                    _local_4.giid = int(_arg_1.list[_local_2].ii);
                    _local_4.slotData = _local_3;
                    _local_4.stackNum = int(_arg_1.list[_local_2].n);
                    itemList.addChild(_local_4);
                };
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        [Bindable(event="propertyChange")]
        public function get itemList():Tile
        {
            return (this._1177280081itemList);
        }

        [Bindable(event="propertyChange")]
        public function get title():RoundedLabel
        {
            return (this._110371416title);
        }

        public function set title(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

