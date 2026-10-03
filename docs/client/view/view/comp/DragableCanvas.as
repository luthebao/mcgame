// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.DragableCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.core.SpriteAsset;
    import mx.controls.Button;
    import mx.events.FlexEvent;
    import flash.events.KeyboardEvent;
    import mx.core.ContainerCreationPolicy;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.UIComponent;

    public class DragableCanvas extends Canvas 
    {

        public static const EVENT_MOVE:String = "DPANEL_EVENT_MOVE";
        public static const EVENT_CLOSE:String = "DPANEL_EVENT_CLOSE";
        public static const TOP:int = 0;
        public static const RIGHT:int = 1;
        public static const BOTTOM:int = 2;
        public static const LEFT:int = 3;
        public static var DRAGABLE:Boolean = true;
        public static var SHOW_DEFAULT_POS:Boolean = false;

        private var _titleLeft:SpriteAsset;
        private var _container:Object;
        private var origWidth:int;
        private var _ox:int;
        private var _oy:int;
        public var _hasHideGudie:Boolean = false;
        private var _closeBtn:Button;
        private var _showMinBtn:Boolean;
        private var _titleMid:SpriteAsset;
        private var _target:DragableCanvas;
        private var _dx:Number;
        private var _dy:Number;
        private var _movable:Boolean;
        private var yOff:Number;
        private var _titleRight:SpriteAsset;
        private var _width:Number;
        private var origHeight:int;
        private var _isMin:Boolean;
        private var _height:Number;
        private var _dir:int;
        private var _minBtn:Button;
        private var _restoreHeight:int;
        private var xOff:Number;
        private var _closeWith:DragableCanvas;
        private var _showBtn:Boolean;
        public var movable:Boolean;
        private var _firstTimeVisible:Boolean;
        public var viewType:uint = 16;

        public function DragableCanvas()
        {
            addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);
            addEventListener(KeyboardEvent.KEY_DOWN, kdHandler);
            verticalScrollPolicy = "off";
            horizontalScrollPolicy = "off";
            cacheAsBitmap = true;
            creationPolicy = ContainerCreationPolicy.ALL;
            movable = true;
            _firstTimeVisible = false;
        }

        private function minBtnClick(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            dispatchEvent(new FlexEvent("min"));
        }

        private function helpBtnClick(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            dispatchEvent(new FlexEvent("help"));
        }

        private function mouseUpHandler(_arg_1:MouseEvent):void
        {
            stopDrag();
            systemManager.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
            systemManager.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        }

        private function creationCompleteHandler(_arg_1:Event):void
        {
            addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
        }

        public function set container(_arg_1:Object):void
        {
            _container = _arg_1;
        }

        override protected function createChildren():void
        {
            super.createChildren();
            addEventListener(FlexEvent.CREATION_COMPLETE, createCompleteHandler);
        }

        private function btnDown(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
            setToFront();
            if ((((movable) && (DRAGABLE)) && ((_arg_1.stageY - y) < 25)))
            {
                startDrag();
                systemManager.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
                systemManager.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
                xOff = _arg_1.currentTarget.mouseX;
                yOff = _arg_1.currentTarget.mouseY;
            };
        }

        private function closeBtnClick(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            dispatchEvent(new FlexEvent("close"));
        }

        public function set dx(_arg_1:Number):void
        {
            x = _arg_1;
            _dx = _arg_1;
        }

        public function set dy(_arg_1:Number):void
        {
            y = _arg_1;
            _dy = _arg_1;
        }

        private function kdHandler(_arg_1:KeyboardEvent):void
        {
            switch (_arg_1.keyCode)
            {
                case Keyboard.ESCAPE:
                    hide();
                    return;
            };
        }

        private function closeHandler(_arg_1:Event):void
        {
            if (_arg_1)
            {
                dispatchEvent(_arg_1);
            };
            stopFollow();
            stopCloseWith();
            hide();
        }

        private function _stopDrag(_arg_1:Event):void
        {
            stopDrag();
        }

        private function _startDrag(_arg_1:Event):void
        {
            startDrag();
        }

        private function setToFront():void
        {
            if (parent)
            {
                parent.setChildIndex(this, (parent.numChildren - 1));
            };
        }

        private function createCompleteHandler(_arg_1:FlexEvent):void
        {
            removeEventListener(FlexEvent.CREATION_COMPLETE, createCompleteHandler);
        }

        private function help(_arg_1:FlexEvent):void
        {
            trace("call help here");
        }

        public function hide():void
        {
            visible = false;
            var _local_1:Event = new Event(EVENT_CLOSE);
            dispatchEvent(_local_1);
        }

        private function guidePanelHitTest():void
        {
            if (className == "GuidePanel")
            {
                return;
            };
            var _local_1:Boolean;
            var _local_2:Object = (Core.getInstance().view.getUI(ViewManager.POP_NEW_PLAER_GUIDE) as UIComponent);
            if (((_local_2) && (_local_2._lastReference)))
            {
                if (className == _local_2._lastReference.className)
                {
                    _local_1 = true;
                };
                if (((((_local_2.visible) && (!(_local_1))) && (hitTestObject((_local_2 as UIComponent)))) && (_local_2._lastReference is DragableCanvas)))
                {
                    _local_2.visible = false;
                    _hasHideGudie = true;
                    if (((!(_local_2._lastReference.className == "PetCmdCanvas")) && (!(_local_2._lastReference.className == "PlayerCmdCanvas"))))
                    {
                        if (_local_2._lastReference.hasOwnProperty("_hasHideGudie"))
                        {
                            _local_2._lastReference._hasHideGudie = true;
                        };
                    };
                }
                else
                {
                    if ((((_hasHideGudie) && (!(_local_1))) && (!(hitTestObject((_local_2 as UIComponent))))))
                    {
                        _local_2.visible = true;
                        _hasHideGudie = false;
                    }
                    else
                    {
                        if (((_hasHideGudie) && (_local_1)))
                        {
                            _local_2.visible = true;
                            _hasHideGudie = false;
                        };
                    };
                };
            }
            else
            {
                if (((_local_2) && (!(_local_2._lastReference))))
                {
                    if (((_local_2.visible) && (hitTestObject((_local_2 as UIComponent)))))
                    {
                        _local_2.visible = false;
                        _hasHideGudie = true;
                    }
                    else
                    {
                        if (((_hasHideGudie) && (!(hitTestObject((_local_2 as UIComponent))))))
                        {
                            _local_2.visible = true;
                            _hasHideGudie = false;
                        };
                    };
                };
            };
        }

        private function closePanelHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            hide();
        }

        protected function updateLater(_arg_1:FlexEvent):void
        {
            _arg_1.currentTarget.removeEventListener(FlexEvent.CREATION_COMPLETE, updateLater);
            update();
        }

        public function startFollow(_arg_1:DragableCanvas, _arg_2:int=1):void
        {
            stopFollow();
            _target = _arg_1;
            _dir = _arg_2;
            _target.addEventListener(EVENT_MOVE, followHandler);
            _target.addEventListener(EVENT_CLOSE, closeHandler);
            _movable = movable;
            movable = false;
            _ox = x;
            _oy = y;
            followHandler(null);
        }

        public function completeHandler(_arg_1:FlexEvent):void
        {
            _arg_1.currentTarget.removeEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
            initView();
        }

        public function stopFollow():void
        {
            if (_target)
            {
                _target.removeEventListener(EVENT_CLOSE, closeHandler);
                _target.removeEventListener(EVENT_MOVE, followHandler);
                _target = null;
                movable = _movable;
                x = _ox;
                y = _oy;
            };
        }

        private function mouseMoveHandler(_arg_1:MouseEvent):void
        {
            if (parent == null)
            {
                return;
            };
            var _local_2:Event = new Event(EVENT_MOVE);
            dispatchEvent(_local_2);
            guidePanelHitTest();
        }

        public function initView():void
        {
        }

        public function update():void
        {
        }

        private function followHandler(_arg_1:Event):void
        {
            if (_arg_1)
            {
                dispatchEvent(_arg_1);
            };
            if (_dir == TOP)
            {
                x = _target.x;
                y = (_target.y - this.height);
            }
            else
            {
                if (_dir == RIGHT)
                {
                    x = (_target.x + _target.width);
                    y = _target.y;
                }
                else
                {
                    if (_dir == BOTTOM)
                    {
                        x = _target.x;
                        y = (_target.y + _target.height);
                    }
                    else
                    {
                        if (_dir == LEFT)
                        {
                            x = (_target.x - this.width);
                            y = _target.y;
                        }
                        else
                        {
                            x = (_target.x + _target.width);
                            y = _target.y;
                        };
                    };
                };
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_container == null)
            {
                return;
            };
            if (_arg_1)
            {
                if (SHOW_DEFAULT_POS)
                {
                    x = _dx;
                    y = _dy;
                };
                if (_firstTimeVisible)
                {
                };
                if (!_isMin)
                {
                    _width = width;
                    _height = height;
                };
                if (visible)
                {
                    setToFront();
                }
                else
                {
                    _container.addChild(this);
                };
            }
            else
            {
                stopFollow();
                dispatchEvent(new Event(EVENT_CLOSE));
                if (visible)
                {
                    _container.removeChild(this);
                };
            };
        }

        public function get container():Object
        {
            return (_container);
        }

        public function closeWith(_arg_1:DragableCanvas):void
        {
            stopCloseWith();
            _closeWith = _arg_1;
            _closeWith.addEventListener(EVENT_CLOSE, closeHandler);
        }

        override public function get visible():Boolean
        {
            return (Boolean((!(parent == null))));
        }

        override protected function updateDisplayList(_arg_1:Number, _arg_2:Number):void
        {
            super.updateDisplayList(_arg_1, _arg_2);
        }

        private function close(_arg_1:FlexEvent):void
        {
            _arg_1.stopPropagation();
            hide();
        }

        override protected function initializationComplete():void
        {
            _container = parentDocument;
        }

        public function stopCloseWith():void
        {
            if (_closeWith)
            {
                _closeWith.removeEventListener(EVENT_CLOSE, closeHandler);
                _closeWith = null;
            };
        }

        public function show():void
        {
            visible = true;
            setFocus();
        }


    }
}//package com.qeedoo.ui.view.comp

