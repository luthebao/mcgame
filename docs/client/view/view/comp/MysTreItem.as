// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MysTreItem

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.containers.HBox;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.controls.Image;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
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

    public class MysTreItem extends Canvas 
    {

        private var _mid:Number;
        private var _866804303starContainer:HBox;
        private var _3533310slot:Slot;
        private var _1161797090actived:Label;
        private var _1526406002mysName:Label;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":160,
                    "height":50,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Slot,
                        "id":"slot",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"TransparentSlot",
                                "movable":false,
                                "acceptable":false,
                                "stackNum":1,
                                "x":5,
                                "width":34,
                                "height":34
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"mysName",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":46,
                                "y":4
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"actived",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":117,
                                "y":24
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"starContainer",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "x":41,
                                "y":27
                            });
                        }
                    })]
                });
            }
        });
        private var _mysActived:Boolean = false;

        public function MysTreItem()
        {
            mx_internal::_document = this;
            this.width = 160;
            this.height = 50;
            this.horizontalScrollPolicy = "off";
            this.styleName = "InputContent";
            this.verticalScrollPolicy = "off";
        }

        public function set slot(_arg_1:Slot):void
        {
            var _local_2:Object = this._3533310slot;
            if (_local_2 !== _arg_1)
            {
                this._3533310slot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        [Bindable(event="propertyChange")]
        public function get starContainer():HBox
        {
            return (this._866804303starContainer);
        }

        [Bindable(event="propertyChange")]
        public function get actived():Label
        {
            return (this._1161797090actived);
        }

        public function set mid(_arg_1:Number):void
        {
            var _local_2:Object;
            var _local_5:Image;
            _mid = _arg_1;
            _local_2 = GameData.d[GamePredef.TBL_MYSTRE][_mid];
            mysName.text = _local_2["name"];
            slot.clean();
            slot.slotData = _local_2;
            slot.type = GamePredef.TBL_MYSTRE;
            slot.giid = _mid;
            var _local_3:int = int(_local_2["star"]);
            if (starContainer.numChildren > 0)
            {
                starContainer.removeAllChildren();
            };
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                _local_5 = new Image();
                _local_5.width = 16;
                _local_5.height = 16;
                _local_5.source = ResManager.ICON_EQUIP_STAR;
                starContainer.addChild(_local_5);
                _local_4++;
            };
        }

        public function set mysName(_arg_1:Label):void
        {
            var _local_2:Object = this._1526406002mysName;
            if (_local_2 !== _arg_1)
            {
                this._1526406002mysName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysName", _local_2, _arg_1));
            };
        }

        public function set starContainer(_arg_1:HBox):void
        {
            var _local_2:Object = this._866804303starContainer;
            if (_local_2 !== _arg_1)
            {
                this._866804303starContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starContainer", _local_2, _arg_1));
            };
        }

        public function set mysActived(_arg_1:Boolean):void
        {
            _mysActived = _arg_1;
            this.filters = ((_mysActived) ? null : [GamePredef.GRAY_FILTER]);
            actived.text = ((_mysActived) ? Language.DECORATE_PANEL[5] : Language.DECORATE_PANEL[4]);
        }

        [Bindable(event="propertyChange")]
        public function get mysName():Label
        {
            return (this._1526406002mysName);
        }

        public function set actived(_arg_1:Label):void
        {
            var _local_2:Object = this._1161797090actived;
            if (_local_2 !== _arg_1)
            {
                this._1161797090actived = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actived", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot():Slot
        {
            return (this._3533310slot);
        }


    }
}//package com.qeedoo.ui.view.comp

