// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SudokuCard

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.event.GameDataEvent;
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

    public class SudokuCard extends Canvas 
    {

        private var _clickAvailable:Boolean = true;
        private var _3236047img2:Image;
        private var _104387img:Image;
        private var _inited:Boolean;
        private var _1184239130indexx:Label;
        private var _cardIndex:int;
        private var _cardId:int;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":110,
                    "height":110,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"indexx",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        }
                    })]
                });
            }
        });
        private var resArray1:Array = [4130220001101, 4130220001102, 4130220001103, 4130220001104, 4130220001105, 4130220001106, 4130220001107, 4130220001108, 4130220001109];
        private var resArray2:Array = [4130220001110, 4130220001111, 4130220001112, 4130220001113, 4130220001114, 4130220001115, 4130220001116, 4130220001117, 4130220001118];
        private var resArray3:Array = [4130220001119, 4130220001120, 4130220001121, 4130220001122, 4130220001123, 4130220001124, 4130220001125, 4130220001126, 4130220001127];

        public function SudokuCard()
        {
            mx_internal::_document = this;
            this.width = 110;
            this.height = 110;
            this.addEventListener("creationComplete", ___SudokuCard_Canvas1_creationComplete);
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        public function set cardIndex(_arg_1:int):void
        {
            _cardIndex = _arg_1;
        }

        public function set clickAvailable(_arg_1:Boolean):void
        {
            this._clickAvailable = _arg_1;
        }

        public function get cardId():int
        {
            return (_cardId);
        }

        public function set indexx(_arg_1:Label):void
        {
            var _local_2:Object = this._1184239130indexx;
            if (_local_2 !== _arg_1)
            {
                this._1184239130indexx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "indexx", _local_2, _arg_1));
            };
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function setCardImg(_arg_1:int):void
        {
            if (_arg_1 == 1)
            {
                img2.visible = false;
            }
            else
            {
                if (_arg_1 == 2)
                {
                    img2.visible = true;
                };
            };
        }

        public function setTileEnable(_arg_1:Boolean):void
        {
            this._clickAvailable = _arg_1;
            this.buttonMode = _arg_1;
        }

        public function overHandler(_arg_1:MouseEvent):void
        {
            if (!_clickAvailable)
            {
                return;
            };
            setCardImg(2);
        }

        public function set cardId(_arg_1:int):void
        {
            _cardId = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get img2():Image
        {
            return (this._3236047img2);
        }

        public function get clickAvailable():Boolean
        {
            return (_clickAvailable);
        }

        public function clickHandler(_arg_1:MouseEvent):void
        {
            if (!_clickAvailable)
            {
                return;
            };
            var _local_2:GameDataEvent = new GameDataEvent("sudokuCardClick", true);
            _local_2.data = cardIndex;
            this.dispatchEvent(_local_2);
        }

        public function set img2(_arg_1:Image):void
        {
            var _local_2:Object = this._3236047img2;
            if (_local_2 !== _arg_1)
            {
                this._3236047img2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get indexx():Label
        {
            return (this._1184239130indexx);
        }

        private function init():void
        {
            this.addEventListener(MouseEvent.CLICK, clickHandler);
            this.addEventListener(MouseEvent.ROLL_OVER, overHandler);
            this.addEventListener(MouseEvent.ROLL_OUT, outHandler);
        }

        public function get cardIndex():int
        {
            return (_cardIndex);
        }

        public function outHandler(_arg_1:MouseEvent):void
        {
            if (!_clickAvailable)
            {
                return;
            };
            setCardImg(1);
        }

        public function initSudokuCard(_arg_1:int, _arg_2:int):void
        {
            this.cardIndex = _arg_1;
            this.cardId = _arg_2;
            if (!_inited)
            {
                img.source = ResManager.getIconUrl(resArray1[_cardId]);
                img2.source = ResManager.getIconUrl(resArray2[_cardId]);
                img2.visible = false;
                _inited = true;
            };
        }

        public function ___SudokuCard_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.comp

