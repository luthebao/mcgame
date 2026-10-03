// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GuidePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import flash.utils.Timer;
    import mx.controls.TextArea;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.view.comp.BasicToolTip;
    import mx.core.UIComponent;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
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

    public class GuidePanel extends DragableCanvas 
    {

        private var _timer:Timer;
        private var _3693ta:TextArea;
        private var _pecent:int = 0;
        private var _color1:uint = 16774207;
        private var _color2:uint = 0xFF5400;
        private var _guideSid:int;
        public var _lastReference:Object;
        private var _lineColor:uint;
        private var _fillColor:uint;
        private var _currentGuide:Object;
        private var _fillColor1:uint = 0;
        private var _fillColor2:uint = 0;
        private var _guideX:int;
        private var _guideY:int;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":130,
                    "height":60,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"ta",
                        "stylesFactory":function ():void
                        {
                            this.borderThickness = 0;
                            this.backgroundAlpha = 0;
                            this.borderStyle = "none";
                            this.color = 0xFFFFFF;
                            this.fontWeight = "bold";
                            this.right = "5";
                            this.top = "5";
                            this.left = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":40,
                                "editable":false
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _upRoundPanel:Object = {
            "530":true,
            "280":true,
            "2100":true,
            "53":true,
            "801":true
        };

        public function GuidePanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0;
            };
            this.width = 130;
            this.height = 60;
            this.movable = false;
        }

        public function getBetweenColor(_arg_1:uint, _arg_2:uint, _arg_3:Number):uint
        {
            var _local_4:Number = ((_arg_2 >> 16) - (_arg_1 >> 16));
            var _local_5:Number = (((_arg_2 >> 8) & 0xFF) - ((_arg_1 >> 8) & 0xFF));
            var _local_6:Number = ((_arg_2 & 0xFF) - (_arg_1 & 0xFF));
            var _local_7:Number = ((_arg_1 >> 16) + (_local_4 * _arg_3));
            var _local_8:Number = (((_arg_1 >> 8) & 0xFF) + (_local_5 * _arg_3));
            var _local_9:Number = ((_arg_1 & 0xFF) + (_local_6 * _arg_3));
            return (((_local_7 << 16) | (_local_8 << 8)) | _local_9);
        }

        public function showGuide(_arg_1:String):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if (((_lastReference is QuestGuide) && (!(_lastReference.visible))))
            {
                trace("指引目标面板目前不可见");
                return;
            };
            if (((_currentGuide.reference == ViewManager.PANEL_ACTIVE) && (!(_lastReference.visible))))
            {
                return;
            };
            if (((_currentGuide.reference == ViewManager.PANEL_CHARACTOR) && (!(_lastReference.visible))))
            {
                return;
            };
            if (((_currentGuide.reference == ViewManager.PANEL_CHARACTOR) && (_lastReference.visible)))
            {
                _lastReference.tabBtnClick(0, 1, 2);
            };
            ta.htmlText = _arg_1;
            visible = true;
            if (((_timer) && (_timer.running)))
            {
                _timer.stop();
                _timer = null;
            };
            _timer = new Timer(35, 0);
            _timer.addEventListener(TimerEvent.TIMER, handleDrawTimer);
            _timer.start();
        }

        private function drawUpRound2():void
        {
            graphics.lineStyle(2, _lineColor);
            graphics.beginFill(_fillColor);
            graphics.drawRoundRect((ta.x - 2), (ta.y - 2), (ta.width + 4), (ta.height + 4), 5);
            graphics.moveTo(((ta.width + 4) - 55), (ta.y - 2));
            graphics.lineTo(((ta.width + 4) - 10), ((ta.y - 2) - 15));
            graphics.lineTo(((ta.width + 4) - 30), (ta.y - 2));
            graphics.endFill();
            graphics.beginFill(_fillColor);
            graphics.lineStyle(1, _fillColor);
            graphics.moveTo(((ta.width + 4) - 34), ((ta.y - 2) + 2));
            graphics.lineTo((((ta.width + 4) - 10) - 7), (((ta.y - 2) - 15) + 3));
            graphics.lineTo(((ta.width + 4) - 53), ((ta.y - 2) + 2));
            graphics.lineTo(((ta.width + 4) - 34), ((ta.y - 2) + 2));
            graphics.endFill();
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function handleReftPanelClose(_arg_1:Event):void
        {
            if ((_arg_1.target is BasicToolTip))
            {
                if ((this.parent is BasicToolTip))
                {
                    if (((_timer) && (_timer.running)))
                    {
                        _timer.stop();
                        _timer = null;
                        trace("remove timer");
                    };
                    (_arg_1.target as UIComponent).removeChild(this);
                };
                (_arg_1.target as UIComponent).removeEventListener(DragableCanvas.EVENT_CLOSE, handleReftPanelClose);
            }
            else
            {
                if (_lastReference == _arg_1.target)
                {
                    hide();
                };
                (_arg_1.target as UIComponent).removeEventListener(DragableCanvas.EVENT_CLOSE, handleReftPanelClose);
                (_arg_1.target as UIComponent).removeEventListener(DragableCanvas.EVENT_MOVE, handleRefPanelMove);
            };
        }

        public function handleDrawTimer(_arg_1:TimerEvent):void
        {
            var _local_2:uint;
            if (_pecent == 11)
            {
                _local_2 = _color1;
                _color1 = _color2;
                _color2 = _local_2;
                _pecent = 0;
            };
            _lineColor = getBetweenColor(_color1, _color2, (_pecent / 10));
            _fillColor = getBetweenColor(_fillColor1, _fillColor2, (_pecent / 10));
            graphics.clear();
            if (_upRoundPanel[_currentGuide.reference])
            {
                if (((_currentGuide.reference == 2100) || (_currentGuide.reference == 801)))
                {
                    drawUpRound2();
                }
                else
                {
                    drawUpRound();
                };
            }
            else
            {
                drawDownRound();
            };
            _pecent++;
        }

        private function drawUpRound():void
        {
            graphics.lineStyle(2, _lineColor);
            graphics.beginFill(_fillColor);
            graphics.drawRoundRect((ta.x - 2), (ta.y - 2), (ta.width + 4), (ta.height + 4), 5);
            graphics.moveTo(((ta.x - 2) + 55), (ta.y - 2));
            graphics.lineTo(((ta.x - 2) + 10), ((ta.y - 2) - 15));
            graphics.lineTo(((ta.x - 2) + 30), (ta.y - 2));
            graphics.endFill();
            graphics.beginFill(_fillColor);
            graphics.lineStyle(1, _fillColor);
            graphics.moveTo(((ta.x - 2) + 34), ((ta.y - 2) + 2));
            graphics.lineTo((((ta.x - 2) + 10) + 7), (((ta.y - 2) - 15) + 3));
            graphics.lineTo(((ta.x - 2) + 53), ((ta.y - 2) + 2));
            graphics.lineTo(((ta.x - 2) + 34), ((ta.y - 2) + 2));
            graphics.endFill();
        }

        override public function hide():void
        {
            if (((_timer) && (_timer.running)))
            {
                _timer.stop();
                _timer = null;
                trace("remove timer");
            };
            if ((this.parent is BasicToolTip))
            {
                (this.parent as UIComponent).removeChild(this);
                return;
            };
            visible = false;
            var _local_1:Event = new Event(DragableCanvas.EVENT_CLOSE);
            dispatchEvent(_local_1);
        }

        public function init(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:UIComponent;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Object;
            if (!_arg_1)
            {
                return;
            };
            _currentGuide = _arg_1;
            _local_2 = _arg_1.scPid;
            _local_3 = _arg_1.mouseX;
            _local_4 = _arg_1.mouseY;
            _local_5 = (_core.view.getUI(_arg_1.reference) as UIComponent);
            if ((this.parent is BasicToolTip))
            {
                (this.parent as UIComponent).removeChild(this);
            };
            visible = false;
            _lastReference = _local_5;
            if (_local_2 == ViewManager.TOOLTIP_QUEST)
            {
                _guideX = _local_3;
                _guideY = _local_4;
                x = _local_3;
                y = _local_4;
                _local_5.addChild(this);
                _local_5.addEventListener(DragableCanvas.EVENT_CLOSE, handleReftPanelClose);
            }
            else
            {
                if (((_arg_1.reference > 0) && (_local_5)))
                {
                    if (_local_2 == ViewManager.PANEL_BAG)
                    {
                        _local_6 = 0;
                        _local_7 = 0;
                        for each (_local_9 in _core.data.sList)
                        {
                            if (((_local_9.tid == _core.lastGetItemId) && (_local_9.sid > _local_8)))
                            {
                                _local_8 = _local_9.sid;
                                _guideSid = _local_9.sid;
                                _local_6 = ((((_local_9.sid - GamePredef.SLOT_SID_BAG[0]) - 1) % 7) * 37);
                                _local_7 = int((int((((_local_9.sid - GamePredef.SLOT_SID_BAG[0]) - 1) / 7)) * 37));
                            };
                        };
                        _local_3 = (_local_3 + _local_6);
                        _local_4 = (_local_4 + _local_7);
                    };
                    _guideX = _local_3;
                    _guideY = _local_4;
                    x = (_local_5.x + _local_3);
                    y = (_local_5.y + _local_4);
                    _local_5.addEventListener(DragableCanvas.EVENT_CLOSE, handleReftPanelClose);
                    _local_5.addEventListener(DragableCanvas.EVENT_MOVE, handleRefPanelMove);
                }
                else
                {
                    this.x = _local_3;
                    this.y = _local_4;
                };
            };
        }

        public function handleRefPanelMove(_arg_1:Event):void
        {
            if (((_lastReference) && (!(_arg_1.target.className == _lastReference.className))))
            {
                return;
            };
            this.x = (_arg_1.target.x + _guideX);
            this.y = (_arg_1.target.y + _guideY);
        }

        [Bindable(event="propertyChange")]
        public function get ta():TextArea
        {
            return (this._3693ta);
        }

        private function drawDownRound():void
        {
            graphics.lineStyle(2, _lineColor);
            graphics.beginFill(_fillColor);
            graphics.drawRoundRect((ta.x - 2), (ta.y - 2), (ta.width + 4), (ta.height + 4), 5);
            graphics.moveTo(((ta.x - 2) + 55), (((ta.y - 2) + ta.height) + 4));
            graphics.lineTo(((ta.x - 2) + 10), ((((ta.y - 2) + ta.height) + 4) + 15));
            graphics.lineTo(((ta.x - 2) + 30), (((ta.y - 2) + ta.height) + 4));
            graphics.endFill();
            graphics.beginFill(_fillColor);
            graphics.lineStyle(1, _fillColor);
            graphics.moveTo(((ta.x - 2) + 34), (((ta.y - 2) + ta.height) + 2));
            graphics.lineTo((((ta.x - 2) + 10) + 7), (((((ta.y - 2) + ta.height) + 4) + 15) - 3));
            graphics.lineTo(((ta.x - 2) + 53), (((ta.y - 2) + ta.height) + 2));
            graphics.lineTo(((ta.x - 2) + 34), (((ta.y - 2) + ta.height) + 2));
            graphics.endFill();
        }

        public function set ta(_arg_1:TextArea):void
        {
            var _local_2:Object = this._3693ta;
            if (_local_2 !== _arg_1)
            {
                this._3693ta = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ta", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

