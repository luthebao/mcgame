// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CrossFightPlayerInfo

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
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

    public class CrossFightPlayerInfo extends Canvas 
    {

        private var _746483037areaTxt:Label;
        private var _2131636148levelTxt:Label;
        private var _1721941989nameTxt:Label;
        private var _1638753418iconImg:Image;
        private var _1154762381jobTxt:Label;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":222,
                    "height":72,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameTxt",
                        "stylesFactory":function ():void
                        {
                            this.left = "3";
                            this.top = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":219});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":50,
                                "height":48,
                                "y":20,
                                "x":1,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"iconImg",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.verticalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":50,
                                            "height":48
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"jobTxt",
                        "stylesFactory":function ():void
                        {
                            this.left = "51";
                            this.top = "19";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":171});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"levelTxt",
                        "stylesFactory":function ():void
                        {
                            this.left = "51";
                            this.top = "36";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":171});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"areaTxt",
                        "stylesFactory":function ():void
                        {
                            this.left = "51";
                            this.top = "53";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":171});
                        }
                    })]
                });
            }
        });

        public function CrossFightPlayerInfo()
        {
            mx_internal::_document = this;
            this.width = 222;
            this.height = 72;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___CrossFightPlayerInfo_Canvas1_creationComplete);
        }

        public function set areaTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._746483037areaTxt;
            if (_local_2 !== _arg_1)
            {
                this._746483037areaTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconImg():Image
        {
            return (this._1638753418iconImg);
        }

        [Bindable(event="propertyChange")]
        public function get levelTxt():Label
        {
            return (this._2131636148levelTxt);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set nameTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1721941989nameTxt;
            if (_local_2 !== _arg_1)
            {
                this._1721941989nameTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameTxt", _local_2, _arg_1));
            };
        }

        public function set iconImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1638753418iconImg;
            if (_local_2 !== _arg_1)
            {
                this._1638753418iconImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImg", _local_2, _arg_1));
            };
        }

        public function set levelTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._2131636148levelTxt;
            if (_local_2 !== _arg_1)
            {
                this._2131636148levelTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelTxt", _local_2, _arg_1));
            };
        }

        public function refresh(_arg_1:Object, _arg_2:Object):void
        {
            if (_arg_1)
            {
                jobTxt.text = (Language.CROSS_FIGHT_PANEL_U[23] + _arg_1.cname);
                levelTxt.text = (Language.CROSS_FIGHT_PANEL_U[24] + _arg_1.level);
                areaTxt.text = (Language.CROSS_FIGHT_PANEL_U[25] + _arg_2.tarea);
                iconImg.source = ResManager.getIconUrl(_arg_1.ccode);
            }
            else
            {
                init();
            };
        }

        public function init():void
        {
            jobTxt.text = "";
            levelTxt.text = "";
            areaTxt.text = "";
            iconImg.source = "";
        }

        [Bindable(event="propertyChange")]
        public function get areaTxt():Label
        {
            return (this._746483037areaTxt);
        }

        [Bindable(event="propertyChange")]
        public function get nameTxt():Label
        {
            return (this._1721941989nameTxt);
        }

        public function set jobTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1154762381jobTxt;
            if (_local_2 !== _arg_1)
            {
                this._1154762381jobTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jobTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get jobTxt():Label
        {
            return (this._1154762381jobTxt);
        }

        public function ___CrossFightPlayerInfo_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.comp

