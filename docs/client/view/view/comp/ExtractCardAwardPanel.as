// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ExtractCardAwardPanel

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.controls.Button;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.effects.EnterFrameMove;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import flash.events.Event;
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

    public class ExtractCardAwardPanel extends Canvas 
    {

        public static const MOVE_LENGTH:Number = 200;

        private var _55416021leftBtn:Button;
        private var _1436107104rightBtn:Button;
        private var itemStartIndex:int = 0;
        public var lvl:int = -1;
        private var move_type:int = 0;
        private var _410956671container:Canvas;
        private var _110371416title:Label;
        private var counter:int = 0;
        private var moveStep:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":650,
                    "height":120,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"container",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":600,
                                "height":120,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"leftBtn",
                        "events":{"click":"__leftBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "2";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "styleName":"BtnActivityPageUp",
                                "y":70,
                                "rotation":-90
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"rightBtn",
                        "events":{"click":"__rightBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "2";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "styleName":"BtnActivityPageDown",
                                "y":70,
                                "rotation":-90
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"title",
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                            this.top = "5";
                            this.color = 0xFFFFFF;
                        }
                    })]
                });
            }
        });
        private var awardRects:Array = [];
        private var movePanel:Canvas = new Canvas();
        private var items:Array = [];

        public function ExtractCardAwardPanel()
        {
            mx_internal::_document = this;
            this.width = 650;
            this.height = 120;
            this.styleName = "CanvasBorder";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___ExtractCardAwardPanel_Canvas1_creationComplete);
        }

        [Bindable(event="propertyChange")]
        public function get container():Canvas
        {
            return (this._410956671container);
        }

        private function init():void
        {
            var _local_1:int;
            var _local_2:ExtractCardAwardLine;
            title.text = Language.EXTRACT_CARD_PANEL_U[(9 + lvl)];
            movePanel.height = 120;
            movePanel.x = -200;
            movePanel.horizontalScrollPolicy = "off";
            movePanel.verticalScrollPolicy = "off";
            container.addChild(movePanel);
            awardRects = [];
            movePanel.width = 1000;
            _local_1 = 0;
            while (_local_1 < 4)
            {
                _local_2 = new ExtractCardAwardLine();
                _local_2.x = ((200 * _local_1) + 200);
                _local_2.y = 10;
                _local_2.visible = false;
                _local_2.lvl = int(lvl);
                awardRects[_local_1] = _local_2;
                movePanel.addChild(_local_2);
                _local_1++;
            };
        }

        private function toMove(_arg_1:Boolean):void
        {
            var _local_2:EnterFrameMove = new EnterFrameMove();
            _local_2.target = movePanel;
            _local_2.stepLength = 20;
            _local_2.xBy = ((_arg_1) ? MOVE_LENGTH : -(MOVE_LENGTH));
            _local_2.yBy = 0;
            _local_2.addEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
            _local_2.play(true);
        }

        public function refreshAward(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:ExtractCardAwardLine;
            itemStartIndex = 0;
            counter = 0;
            items.length = 0;
            for (_local_2 in _arg_1)
            {
                _local_3 = _arg_1[_local_2];
                items.push(_local_3);
                _local_4 = awardRects[counter];
                if (counter <= 3)
                {
                    _local_4.x = ((200 * counter) + 200);
                    _local_4.y = 10;
                    _local_4.refresh(_local_3);
                    _local_4.visible = true;
                };
                counter++;
            };
            if (counter > 3)
            {
                leftBtn.visible = true;
                leftBtn.enabled = true;
                rightBtn.visible = true;
                rightBtn.enabled = true;
            }
            else
            {
                leftBtn.visible = false;
                leftBtn.enabled = false;
                rightBtn.visible = false;
                rightBtn.enabled = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get leftBtn():Button
        {
            return (this._55416021leftBtn);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set container(_arg_1:Canvas):void
        {
            var _local_2:Object = this._410956671container;
            if (_local_2 !== _arg_1)
            {
                this._410956671container = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container", _local_2, _arg_1));
            };
        }

        public function ___ExtractCardAwardPanel_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __rightBtn_click(_arg_1:MouseEvent):void
        {
            toRight();
        }

        private function getNextItemId(_arg_1:int, _arg_2:Boolean):int
        {
            var _local_3:int = _arg_1;
            if (_arg_2)
            {
                if ((_local_3 - 1) < 0)
                {
                    _local_3 = (items.length - 1);
                }
                else
                {
                    _local_3--;
                };
            }
            else
            {
                if ((_local_3 + 3) > (items.length - 1))
                {
                    _local_3 = (_local_3 - (items.length - 3));
                }
                else
                {
                    _local_3 = (_local_3 + 3);
                };
            };
            if (_local_3 < 0)
            {
                _local_3 = (items.length - 1);
            }
            else
            {
                if (_local_3 > (items.length - 1))
                {
                    _local_3 = 0;
                };
            };
            return (_local_3);
        }

        private function moveEndHandler(_arg_1:Event):void
        {
            var _local_4:ExtractCardAwardLine;
            var _local_2:EnterFrameMove = (_arg_1.currentTarget as EnterFrameMove);
            _local_2.removeEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
            _local_2.destroy();
            _local_2 = null;
            if (move_type == 1)
            {
                awardRects.push(awardRects.shift());
                itemStartIndex++;
            }
            else
            {
                awardRects.unshift(awardRects.pop());
                itemStartIndex--;
            };
            if (itemStartIndex < 0)
            {
                itemStartIndex = (items.length - 1);
            }
            else
            {
                if (itemStartIndex > (items.length - 1))
                {
                    itemStartIndex = 0;
                };
            };
            var _local_3:int;
            while (_local_3 < 4)
            {
                _local_4 = awardRects[_local_3];
                _local_4.x = ((200 * _local_3) + 200);
                _local_4.y = 10;
                _local_3++;
            };
            movePanel.x = -200;
            move_type = 0;
        }

        private function toRight():void
        {
            var _local_1:ExtractCardAwardLine;
            if (((!(move_type == 0)) || (counter <= 3)))
            {
                return;
            };
            move_type = 1;
            _local_1 = awardRects[3];
            var _local_2:int = getNextItemId(itemStartIndex, false);
            var _local_3:Object = items[_local_2];
            _local_1.refresh(_local_3);
            _local_1.x = 800;
            _local_1.visible = true;
            moveStep--;
            toMove(false);
        }

        [Bindable(event="propertyChange")]
        public function get rightBtn():Button
        {
            return (this._1436107104rightBtn);
        }

        private function toLeft():void
        {
            var _local_3:ExtractCardAwardLine;
            if (((!(move_type == 0)) || (counter <= 3)))
            {
                return;
            };
            move_type = 2;
            var _local_1:int = getNextItemId(itemStartIndex, true);
            var _local_2:Object = items[_local_1];
            _local_3 = awardRects[3];
            _local_3.refresh(_local_2);
            _local_3.x = 0;
            _local_3.visible = true;
            moveStep++;
            toMove(true);
        }

        public function set leftBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._55416021leftBtn;
            if (_local_2 !== _arg_1)
            {
                this._55416021leftBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftBtn", _local_2, _arg_1));
            };
        }

        public function refreshAwardNumber(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_5:ExtractCardAwardLine;
            var _local_2:int;
            while (_local_2 < items.length)
            {
                _local_4 = items[_local_2];
                if (((_local_4) && (_arg_1[_local_4.awardId])))
                {
                    items[_local_2] = _arg_1[_local_4.awardId];
                };
                _local_2++;
            };
            var _local_3:int;
            while (_local_3 < 3)
            {
                _local_5 = awardRects[_local_3];
                _local_5.refreshNumber(_arg_1);
                _local_3++;
            };
        }

        public function set rightBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1436107104rightBtn;
            if (_local_2 !== _arg_1)
            {
                this._1436107104rightBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get title():Label
        {
            return (this._110371416title);
        }

        public function __leftBtn_click(_arg_1:MouseEvent):void
        {
            toLeft();
        }

        public function set title(_arg_1:Label):void
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

