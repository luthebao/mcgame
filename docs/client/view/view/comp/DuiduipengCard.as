// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.DuiduipengCard

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import flash.utils.Timer;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.view.compDragable.DuiduiPeng;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.event.GameDataEvent;
    import flash.events.TimerEvent;
    import flash.events.Event;
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

    public class DuiduipengCard extends Canvas 
    {

        private var _3236047img2:Image;
        private var _cardIndex:int;
        private var _origX:int = 0;
        private var _clickAvailable:Boolean = true;
        private var _104387img:Image;
        private var _imageWidth:Number = 60;
        private var _inited:Boolean = false;
        private var _cardId:int;
        private var backOfCardRes:Number = 4130220001138;
        private var s:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":60,
                    "height":80,
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
                    })]
                });
            }
        });
        private var resArray:Array = [4130220001130, 4130220001131, 4130220001132, 4130220001133, 4130220001134, 4130220001135, 4130220001136, 4130220001137];
        private var _timer:Timer = new Timer(40);
        private var _core:Core = Core.getInstance();

        public function DuiduipengCard()
        {
            mx_internal::_document = this;
            this.width = 60;
            this.height = 80;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___DuiduipengCard_Canvas1_creationComplete);
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

        public function ___DuiduipengCard_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set cardId(_arg_1:int):void
        {
            _cardId = _arg_1;
        }

        public function flipCard(_arg_1:Boolean):void
        {
            overTurnCardTimer(_arg_1);
            if (!_arg_1)
            {
                setDuiduiCardEnable(true);
            }
            else
            {
                setDuiduiCardEnable(false);
            };
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

        private function init():void
        {
            this.addEventListener(MouseEvent.CLICK, clickHandler);
        }

        public function get clickAvailable():Boolean
        {
            return (_clickAvailable);
        }

        public function clickHandler(_arg_1:MouseEvent):void
        {
            if (((!(_clickAvailable)) || (DuiduiPeng(this.parentDocument).isFlippingOver)))
            {
                return;
            };
            if (DuiduiPeng(this.parentDocument).isTimeZero)
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[13]);
                return;
            };
            setFlippingOverFlag(true);
            flipCard(true);
        }

        private function overTurnCardTimer(isOpen:Boolean):void
        {
            var card1:Image;
            var card2:Image;
            var currentCard:Image;
            var func:Function;
            if (isOpen)
            {
                card1 = img2;
                card2 = img;
            }
            else
            {
                card1 = img;
                card2 = img2;
            };
            func = function (_arg_1:Event):void
            {
                var _local_2:GameDataEvent;
                if (s == 0)
                {
                    card2.visible = false;
                    currentCard = card1;
                    card1.scaleX = 0.75;
                    card1.scaleY = 1;
                    s++;
                }
                else
                {
                    if (s == 1)
                    {
                        card1.scaleX = 0.5;
                        card1.scaleY = 1;
                        s++;
                    }
                    else
                    {
                        if (s == 2)
                        {
                            card1.scaleX = 0.25;
                            card1.scaleY = 1;
                            s++;
                        }
                        else
                        {
                            if (s == 3)
                            {
                                card1.scaleX = 0.03;
                                card1.scaleY = 1;
                                s++;
                            }
                            else
                            {
                                if (s == 4)
                                {
                                    card2.visible = true;
                                    currentCard = card2;
                                    card1.visible = false;
                                    card1.scaleX = 1;
                                    card1.x = 0;
                                    card1.width = _imageWidth;
                                    card2.scaleX = 0.03;
                                    card2.scaleY = 1;
                                    s++;
                                }
                                else
                                {
                                    if (s == 5)
                                    {
                                        card2.scaleX = 0.25;
                                        card2.scaleY = 1;
                                        s++;
                                    }
                                    else
                                    {
                                        if (s == 6)
                                        {
                                            card2.scaleX = 0.5;
                                            card2.scaleY = 1;
                                            s++;
                                        }
                                        else
                                        {
                                            if (s == 7)
                                            {
                                                card2.scaleX = 0.75;
                                                card2.scaleY = 1;
                                                s++;
                                            }
                                            else
                                            {
                                                if (s == 8)
                                                {
                                                    card2.scaleX = 1;
                                                    card2.scaleY = 1;
                                                    s = 0;
                                                    _timer.removeEventListener(TimerEvent.TIMER, func);
                                                    _timer.stop();
                                                    if (isOpen)
                                                    {
                                                        _local_2 = new GameDataEvent("duiduipengCardClick", true);
                                                        _local_2.data = cardIndex;
                                                        dispatchEvent(_local_2);
                                                    }
                                                    else
                                                    {
                                                        setFlippingOverFlag(false);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                currentCard.x = ((_imageWidth * (1 - currentCard.scaleX)) / 2);
            };
            if (_timer.running)
            {
                _timer.removeEventListener(TimerEvent.TIMER, func);
                _timer.stop();
            };
            card1.x = 0;
            card1.width = _imageWidth;
            card1.scaleX = 1;
            _timer.addEventListener(TimerEvent.TIMER, func);
            _timer.start();
        }

        public function get cardIndex():int
        {
            return (_cardIndex);
        }

        public function set clickAvailable(_arg_1:Boolean):void
        {
            this._clickAvailable = _arg_1;
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

        private function flipOverCardWithOutEffect(_arg_1:Boolean):void
        {
            img2.visible = _arg_1;
            setDuiduiCardEnable(_arg_1);
        }

        public function get cardId():int
        {
            return (_cardId);
        }

        [Bindable(event="propertyChange")]
        public function get img2():Image
        {
            return (this._3236047img2);
        }

        public function initDuiduipengCard(_arg_1:int, _arg_2:Object):void
        {
            var _local_3:int;
            this.cardIndex = _arg_1;
            this.cardId = _arg_2.n;
            if (!_inited)
            {
                _local_3 = (this.cardId % 10);
                if (((_local_3 < 0) || (_local_3 > 7)))
                {
                    return;
                };
                img.source = ResManager.getIconUrl(resArray[_local_3]);
                img2.source = ResManager.getIconUrl(backOfCardRes);
                img.visible = true;
                img2.visible = true;
                _inited = true;
            };
            if (_arg_2.f == 1)
            {
                flipOverCardWithOutEffect(false);
            }
            else
            {
                flipOverCardWithOutEffect(true);
            };
        }

        public function setDuiduiCardEnable(_arg_1:Boolean):void
        {
            this._clickAvailable = _arg_1;
            this.buttonMode = _arg_1;
        }

        public function set inited(_arg_1:Boolean):void
        {
            this._inited = _arg_1;
        }

        private function setFlippingOverFlag(_arg_1:Boolean):void
        {
            DuiduiPeng(this.parentDocument).isFlippingOver = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.comp

