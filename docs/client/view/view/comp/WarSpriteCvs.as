// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.WarSpriteCvs

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Image;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
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

    public class WarSpriteCvs extends Canvas 
    {

        private var _69784570levelLB:Label;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":130,
                    "height":65,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"image",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":4});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameLB",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":60,
                                "y":7,
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"levelLB",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":68,
                                "y":35,
                                "width":50
                            });
                        }
                    })]
                });
            }
        });
        public var wspId:Number;
        private var _1052832447nameLB:Label;
        public var selected:Boolean;
        private var _100313435image:Image;
        public var resCode:Number;
        public var wspName:String;

        public function WarSpriteCvs()
        {
            mx_internal::_document = this;
            this.width = 130;
            this.height = 65;
            this.addEventListener("creationComplete", ___WarSpriteCvs_Canvas1_creationComplete);
        }

        public function set nameLB(_arg_1:Label):void
        {
            var _local_2:Object = this._1052832447nameLB;
            if (_local_2 !== _arg_1)
            {
                this._1052832447nameLB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLB", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nameLB():Label
        {
            return (this._1052832447nameLB);
        }

        public function updateView():void
        {
            var _local_1:Object = GameData.d[GamePredef.TBL_WAR_SPRITE][wspId];
            var _local_2:String = _local_1["level"];
            levelLB.text = Language.WAR_SPRITE[5].toString().replace("{num}", _local_2);
            if (selected)
            {
                this.styleName = "Selected";
            }
            else
            {
                this.styleName = null;
            };
        }

        private function initView():void
        {
            image.source = ResManager.getIconUrl(resCode);
            nameLB.text = wspName;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        [Bindable(event="propertyChange")]
        public function get image():Image
        {
            return (this._100313435image);
        }

        public function ___WarSpriteCvs_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function set levelLB(_arg_1:Label):void
        {
            var _local_2:Object = this._69784570levelLB;
            if (_local_2 !== _arg_1)
            {
                this._69784570levelLB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelLB", _local_2, _arg_1));
            };
        }

        public function set image(_arg_1:Image):void
        {
            var _local_2:Object = this._100313435image;
            if (_local_2 !== _arg_1)
            {
                this._100313435image = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "image", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levelLB():Label
        {
            return (this._69784570levelLB);
        }


    }
}//package com.qeedoo.ui.view.comp

