// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PentagonCanvas

package com.qeedoo.ui.view.comp
{
    import mx.controls.Label;
    import mx.core.UIComponent;
    import mx.core.UIComponentDescriptor;
    import flash.display.Shape;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
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

    public class PentagonCanvas extends SimpleCanvas 
    {

        private var _104584982nameA:Label;
        private var maxLen:Number = 40;
        private var _104584983nameB:Label;
        private var _showInfo:Boolean = false;
        private var _115791uic:UIComponent;
        private var _finalColor:uint = 0x6600FF;
        private var _104584984nameC:Label;
        private var _propColor:uint = 0xFF00;
        private var _lineColor:uint = 3377407;
        private var _104584985nameD:Label;
        private var _lineShow:Boolean = true;
        private var miniRatio:Number = 0.05;
        private var _104584986nameE:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":100,
                    "height":100,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":UIComponent,
                        "id":"uic"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameA",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":-1});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameB",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.left = "86";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":34});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameC",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.left = "74";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":78});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameD",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                            this.right = "72";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":78});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameE",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                            this.right = "85";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":34});
                        }
                    })]
                });
            }
        });
        private var propertyGraphics:Shape = new Shape();

        public function PentagonCanvas()
        {
            mx_internal::_document = this;
            this.width = 100;
            this.height = 100;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___PentagonCanvas_SimpleCanvas1_creationComplete);
        }

        public function set propColor(_arg_1:uint):void
        {
            _propColor = _arg_1;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set showInfo(_arg_1:Boolean):void
        {
            _showInfo = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get nameC():Label
        {
            return (this._104584984nameC);
        }

        [Bindable(event="propertyChange")]
        public function get nameD():Label
        {
            return (this._104584985nameD);
        }

        public function set setName(_arg_1:Array):void
        {
            nameA.text = _arg_1[0];
            nameB.text = _arg_1[1];
            nameC.text = _arg_1[2];
            nameD.text = _arg_1[3];
            nameE.text = _arg_1[4];
        }

        [Bindable(event="propertyChange")]
        public function get nameA():Label
        {
            return (this._104584982nameA);
        }

        public function set finalColor(_arg_1:uint):void
        {
            _finalColor = _arg_1;
        }

        public function set lineColor(_arg_1:uint):void
        {
            _lineColor = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get nameB():Label
        {
            return (this._104584983nameB);
        }

        public function set lineShow(_arg_1:Boolean):void
        {
            _lineShow = _arg_1;
        }

        public function set nameA(_arg_1:Label):void
        {
            var _local_2:Object = this._104584982nameA;
            if (_local_2 !== _arg_1)
            {
                this._104584982nameA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameA", _local_2, _arg_1));
            };
        }

        public function set uic(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._115791uic;
            if (_local_2 !== _arg_1)
            {
                this._115791uic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "uic", _local_2, _arg_1));
            };
        }

        public function set nameB(_arg_1:Label):void
        {
            var _local_2:Object = this._104584983nameB;
            if (_local_2 !== _arg_1)
            {
                this._104584983nameB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameB", _local_2, _arg_1));
            };
        }

        public function set nameC(_arg_1:Label):void
        {
            var _local_2:Object = this._104584984nameC;
            if (_local_2 !== _arg_1)
            {
                this._104584984nameC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameC", _local_2, _arg_1));
            };
        }

        public function set nameD(_arg_1:Label):void
        {
            var _local_2:Object = this._104584985nameD;
            if (_local_2 !== _arg_1)
            {
                this._104584985nameD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameD", _local_2, _arg_1));
            };
        }

        public function set nameE(_arg_1:Label):void
        {
            var _local_2:Object = this._104584986nameE;
            if (_local_2 !== _arg_1)
            {
                this._104584986nameE = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameE", _local_2, _arg_1));
            };
        }

        public function ___PentagonCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get nameE():Label
        {
            return (this._104584986nameE);
        }

        [Bindable(event="propertyChange")]
        public function get uic():UIComponent
        {
            return (this._115791uic);
        }

        private function initView():void
        {
            var _local_4:Shape;
            var _local_5:int;
            var _local_6:int;
            var _local_1:Array = new Array();
            var _local_2:Array = new Array();
            var _local_3:int;
            while (_local_3 < 5)
            {
                _local_1[_local_3] = (Math.cos((((_local_3 * 2) * Math.PI) / 5)) * maxLen);
                _local_2[_local_3] = (Math.sin((((_local_3 * 2) * Math.PI) / 5)) * maxLen);
                _local_3++;
            };
            if (_lineShow)
            {
                _local_4 = new Shape();
                _local_4.graphics.lineStyle(2, _lineColor, 0.9);
                _local_4.graphics.moveTo(_local_1[0], _local_2[0]);
                _local_5 = 1;
                while (_local_5 < 5)
                {
                    _local_4.graphics.lineTo(_local_1[_local_5], _local_2[_local_5]);
                    _local_5++;
                };
                _local_4.graphics.lineTo(_local_1[0], _local_2[0]);
                _local_4.graphics.lineStyle(1, _lineColor, 0.6);
                _local_6 = 0;
                while (_local_6 < 5)
                {
                    _local_4.graphics.moveTo(0, 0);
                    _local_4.graphics.lineTo(_local_1[_local_6], _local_2[_local_6]);
                    _local_6++;
                };
                uic.addChild(_local_4);
            };
            uic.x = ((width / 2) - 1);
            uic.y = ((height / 2) + 3);
            uic.rotation = -90;
        }

        private function drawPentagon(_arg_1:int, _arg_2:Array, _arg_3:uint, _arg_4:Number):void
        {
            var _local_5:Array = new Array();
            var _local_6:Array = new Array();
            var _local_7:int;
            while (_local_7 < 5)
            {
                if (_arg_2[_local_7] > _arg_1)
                {
                    _local_5[_local_7] = (Math.cos((((_local_7 * 2) * Math.PI) / 5)) * maxLen);
                    _local_6[_local_7] = (Math.sin((((_local_7 * 2) * Math.PI) / 5)) * maxLen);
                }
                else
                {
                    if ((_arg_2[_local_7] / _arg_1) < miniRatio)
                    {
                        _local_5[_local_7] = ((Math.cos((((_local_7 * 2) * Math.PI) / 5)) * maxLen) * miniRatio);
                        _local_6[_local_7] = ((Math.sin((((_local_7 * 2) * Math.PI) / 5)) * maxLen) * miniRatio);
                    }
                    else
                    {
                        _local_5[_local_7] = (((Math.cos((((_local_7 * 2) * Math.PI) / 5)) * maxLen) * _arg_2[_local_7]) / _arg_1);
                        _local_6[_local_7] = (((Math.sin((((_local_7 * 2) * Math.PI) / 5)) * maxLen) * _arg_2[_local_7]) / _arg_1);
                    };
                };
                _local_7++;
            };
            propertyGraphics.graphics.beginFill(_arg_3, _arg_4);
            propertyGraphics.graphics.moveTo(_local_5[0], _local_6[0]);
            var _local_8:int = 1;
            while (_local_8 < 5)
            {
                propertyGraphics.graphics.lineTo(_local_5[_local_8], _local_6[_local_8]);
                _local_8++;
            };
            propertyGraphics.graphics.lineTo(_local_5[0], _local_6[0]);
            propertyGraphics.graphics.endFill();
        }

        public function showProperty(_arg_1:int, _arg_2:Array, _arg_3:Array=null):void
        {
            propertyGraphics.graphics.clear();
            if (_arg_3 != null)
            {
                drawPentagon(_arg_1, _arg_3, _finalColor, 0.3);
                nameA.toolTip = (((("(" + _arg_2[0]) + ",") + _arg_3[0]) + ")");
                nameB.toolTip = (((("(" + _arg_2[1]) + ",") + _arg_3[1]) + ")");
                nameC.toolTip = (((("(" + _arg_2[2]) + ",") + _arg_3[2]) + ")");
                nameD.toolTip = (((("(" + _arg_2[3]) + ",") + _arg_3[3]) + ")");
                nameE.toolTip = (((("(" + _arg_2[4]) + ",") + _arg_3[4]) + ")");
            }
            else
            {
                nameA.toolTip = (("(" + _arg_2[0]) + ")");
                nameB.toolTip = (("(" + _arg_2[1]) + ")");
                nameC.toolTip = (("(" + _arg_2[2]) + ")");
                nameD.toolTip = (("(" + _arg_2[3]) + ")");
                nameE.toolTip = (("(" + _arg_2[4]) + ")");
            };
            if (_showInfo)
            {
                nameA.text = (nameA.text + nameA.toolTip);
                nameB.text = (nameB.text + nameB.toolTip);
                nameC.text = (nameC.text + nameC.toolTip);
                nameD.text = (nameD.text + nameD.toolTip);
                nameE.text = (nameE.text + nameE.toolTip);
            };
            drawPentagon(_arg_1, _arg_2, _propColor, 0.5);
            uic.addChild(propertyGraphics);
        }


    }
}//package com.qeedoo.ui.view.comp

