// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.FairyView

package com.qeedoo.ui.view.compGameStage
{
    import flash.display.Sprite;
    import com.qeedoo.effects.EnterFrameMove;
    import com.qeedoo.game.system.Core;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;

    public class FairyView extends DynamicItemView 
    {

        private var _host:CreatureView;
        private var _yOffSet:Number = 0;
        private var _fairy:Sprite;
        private var _gameObjMove:EnterFrameMove;
        private var _fairy_cg:Object;
        private var _isFlying:Boolean = false;
        private var _core:Core = Core.getInstance();

        public function FairyView(_arg_1:Object)
        {
            _fairy = new Sprite();
            _fairy_cg = _arg_1;
            _fairy_cg.x = -(_arg_1.midX);
            _fairy_cg.y = -(_arg_1.footY);
            _fairy.addChild(DisplayObject(_fairy_cg));
            addChild(_fairy);
            _gameObjMove = new EnterFrameMove();
            _gameObjMove.addEventListener(EnterFrameMove.EFFECT_END, stopMove);
            _gameObjMove.target = this;
        }

        public function get posX():int
        {
            return (x);
        }

        public function get posY():int
        {
            return (y);
        }

        public function set posX(_arg_1:int):void
        {
            x = _arg_1;
        }

        public function set posY(_arg_1:int):void
        {
            y = _arg_1;
        }

        public function set host(_arg_1:CreatureView):void
        {
            _host = _arg_1;
            addEventListener(Event.ENTER_FRAME, follow);
        }

        public function behavior(_arg_1:int):void
        {
            if (_fairy_cg)
            {
                if (_fairy_cg.behavior == _arg_1)
                {
                    return;
                };
                _fairy_cg.behavior = _arg_1;
                _fairy_cg.play(((_fairy_cg.dir + "-") + _arg_1));
            };
        }

        public function hoof():void
        {
        }

        public function get centerX():int
        {
            return (_core.view.getUI(ViewManager.STAGE_MAIN).centerX);
        }

        public function get centerY():int
        {
            return (_core.view.getUI(ViewManager.STAGE_MAIN).centerY);
        }

        public function get yBase():int
        {
            return (y);
        }

        public function follow(_arg_1:Event=null):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:Number;
            var _local_5:Number;
            if (_host)
            {
                if ((_host is BattleCreatureView))
                {
                    this.x = _host.x;
                    this.y = (_host.y + _yOffSet);
                    if (_host._cg)
                    {
                        faceTo(_host._cg.dir);
                    };
                }
                else
                {
                    _local_2 = (_host.x - this.x);
                    _local_3 = ((_host.y - this.y) + _yOffSet);
                    _local_4 = Math.sqrt(((_local_2 * _local_2) + (_local_3 * _local_3)));
                    if (_local_4 > 10)
                    {
                        faceTo(ToolKit.getDir(_local_2, _local_3));
                    }
                    else
                    {
                        if (_host._cg)
                        {
                            faceTo(_host._cg.dir);
                        };
                    };
                    if (_local_4 > 3)
                    {
                        _local_5 = Math.round((_local_4 / 4));
                        _gameObjMove.stepLength = _local_5;
                        _gameObjMove.xBy = _local_2;
                        _gameObjMove.yBy = _local_3;
                        if (_local_5 > 1)
                        {
                            _fairy_cg.accRate = int(_local_5);
                        }
                        else
                        {
                            _fairy_cg.accRate = 0;
                        };
                        _gameObjMove.play();
                    };
                };
            };
        }

        public function set isFlying(_arg_1:Boolean):void
        {
            _isFlying = _arg_1;
            if (_arg_1)
            {
                _yOffSet = -(GamePredef.FLIGHT_HEIGHT);
            }
            else
            {
                _yOffSet = 0;
            };
        }

        private function stopMove(_arg_1:Event=null):void
        {
            var _local_2:int;
            var _local_3:Number;
            var _local_4:Number;
            if ((((_host) && (_host.visible)) && (_host._cg)))
            {
                if (_host.container == this.parent)
                {
                    _local_2 = _host._cg.dir;
                    _local_3 = this.parent.getChildIndex(this);
                    _local_4 = _host.container.getChildIndex(_host);
                    if (((_local_2 >= 4) && (_local_3 > _local_4)))
                    {
                        this.parent.setChildIndex(this, _local_4);
                        _host.container.setChildIndex(_host, _local_4);
                    }
                    else
                    {
                        if (((_local_2 < 4) && (_local_3 <= _local_4)))
                        {
                            this.parent.setChildIndex(this, _local_4);
                        };
                    };
                };
            };
        }

        override public function destroy():void
        {
            if (_deleted)
            {
                return;
            };
            super.destroy();
            removeEventListener(Event.ENTER_FRAME, follow);
            _host = null;
            while (_fairy.numChildren > 0)
            {
                _fairy.removeChildAt(0);
            };
            while (numChildren > 0)
            {
                removeChildAt(0);
            };
            if (_fairy_cg)
            {
                _fairy_cg.filters = [];
                _fairy_cg.stop();
                _fairy_cg = null;
            };
            _fairy = null;
            _gameObjMove.destroy();
            _gameObjMove = null;
            _core = null;
        }

        public function switchLayer():void
        {
            if (((_host) && (!(_host.container == this.parent))))
            {
                if (this.parent)
                {
                    this.parent.removeChild(this);
                };
                _host.container.addChild(this);
            };
        }

        private function faceTo(_arg_1:int):void
        {
            if (!_fairy_cg)
            {
                return;
            };
            var _local_2:int = _fairy_cg.dir;
            if (_local_2 == _arg_1)
            {
                return;
            };
            _fairy_cg.dir = _arg_1;
            _fairy_cg.play(((_fairy_cg.dir + "-") + _fairy_cg.behavior));
        }


    }
}//package com.qeedoo.ui.view.compGameStage

