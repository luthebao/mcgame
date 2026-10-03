// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TrialsFloorCanvas

package com.qeedoo.ui.view.comp
{
    import mx.controls.Image;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
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

    public class TrialsFloorCanvas extends SimpleCanvas 
    {

        private var _index:Number = -1;
        private var _705847778imgStar3:Image;
        private var _fiterBtn:Boolean;
        private var _705847779imgStar2:Image;
        private var _815537921trialsBtn:Button;
        private var _705847780imgStar1:Image;
        private var _sc:Number;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":163,
                    "height":75,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"trialsBtn",
                        "events":{"click":"__trialsBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":163,
                                "height":75,
                                "x":0,
                                "y":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgStar1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":48,
                                "y":44,
                                "width":20,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgStar2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":73,
                                "y":44,
                                "width":20,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgStar3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":97,
                                "y":44,
                                "width":20,
                                "height":20
                            });
                        }
                    })]
                });
            }
        });

        public function TrialsFloorCanvas()
        {
            mx_internal::_document = this;
            this.width = 163;
            this.height = 75;
            this.addEventListener("creationComplete", ___TrialsFloorCanvas_SimpleCanvas1_creationComplete);
        }

        public function __trialsBtn_click(_arg_1:MouseEvent):void
        {
            selectFloor();
        }

        public function set imgStar2(_arg_1:Image):void
        {
            var _local_2:Object = this._705847779imgStar2;
            if (_local_2 !== _arg_1)
            {
                this._705847779imgStar2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgStar2", _local_2, _arg_1));
            };
        }

        public function set imgStar3(_arg_1:Image):void
        {
            var _local_2:Object = this._705847778imgStar3;
            if (_local_2 !== _arg_1)
            {
                this._705847778imgStar3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgStar3", _local_2, _arg_1));
            };
        }

        public function set trialsBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._815537921trialsBtn;
            if (_local_2 !== _arg_1)
            {
                this._815537921trialsBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trialsBtn", _local_2, _arg_1));
            };
        }

        public function ___TrialsFloorCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get trialsBtn():Button
        {
            return (this._815537921trialsBtn);
        }

        public function get scord():Number
        {
            return (_sc);
        }

        public function cancelSelectFloor():void
        {
            this.trialsBtn.filters = [];
        }

        private function init():void
        {
            setStarLev(_sc);
        }

        [Bindable(event="propertyChange")]
        public function get imgStar1():Image
        {
            return (this._705847780imgStar1);
        }

        public function cleanStarLev():void
        {
            this.imgStar1.source = ResManager.IMG_STARS_INS_DARK;
            this.imgStar1.source = ResManager.IMG_STARS_INS_DARK;
            this.imgStar1.source = ResManager.IMG_STARS_INS_DARK;
        }

        [Bindable(event="propertyChange")]
        public function get imgStar2():Image
        {
            return (this._705847779imgStar2);
        }

        [Bindable(event="propertyChange")]
        public function get imgStar3():Image
        {
            return (this._705847778imgStar3);
        }

        public function set findex(_arg_1:Number):void
        {
            _index = _arg_1;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function setStarLev(_arg_1:Number):void
        {
            var _local_2:int;
            if (_arg_1 > 65)
            {
                _local_2 = 3;
            }
            else
            {
                if (_arg_1 > 50)
                {
                    _local_2 = 2;
                }
                else
                {
                    if (_arg_1 > 1)
                    {
                        _local_2 = 1;
                    };
                };
            };
            if (!_fiterBtn)
            {
                this.trialsBtn.styleName = ("trialsBtn0" + _index);
            }
            else
            {
                this.trialsBtn.styleName = (("trialsBtn0" + _index) + "1");
            };
            var _local_3:uint = 1;
            while (_local_3 < 4)
            {
                if (_local_3 > _local_2)
                {
                    this[("imgStar" + _local_3)].source = ResManager.IMG_STARS_INS_DARK;
                    this[("imgStar" + _local_3)].visible = false;
                }
                else
                {
                    this[("imgStar" + _local_3)].source = ResManager.IMG_STARS_INS_LIGHT;
                    this[("imgStar" + _local_3)].visible = true;
                };
                _local_3++;
            };
        }

        public function selectFloor():void
        {
            this.trialsBtn.filters = [GamePredef.FILTER_NOALLOW_SELECTED];
        }

        public function set scord(_arg_1:Number):void
        {
            _sc = _arg_1;
        }

        public function set imgStar1(_arg_1:Image):void
        {
            var _local_2:Object = this._705847780imgStar1;
            if (_local_2 !== _arg_1)
            {
                this._705847780imgStar1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgStar1", _local_2, _arg_1));
            };
        }

        public function get findex():Number
        {
            return (_index);
        }

        public function set fiterBtn(_arg_1:Boolean):void
        {
            _fiterBtn = _arg_1;
        }

        public function get fiterBtn():Boolean
        {
            return (_fiterBtn);
        }


    }
}//package com.qeedoo.ui.view.comp

