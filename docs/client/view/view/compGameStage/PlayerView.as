// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.PlayerView

package com.qeedoo.ui.view.compGameStage
{
    import flash.geom.Point;
    import com.qeedoo.ui.view.compDragable.MapPanel;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.event.GameEvent;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;

    public class PlayerView extends CharactorView 
    {

        private static var SIDE_SIZE:Number = 230;
        private static var CHECK_DELAY:Number = 1000;
        private static var CHECK_DIS:Number = 100;

        private var _uiStage:StageMain;
        private var _setting:Object;
        public var isSelf:Boolean;
        public var lastCheckPoint:Point;
        public var lastCheckStillTime:Number;
        private var _uiMap:MapPanel;
        private var _inCenterEffect:Boolean;
        public var lastCheckTime:Number;

        public function PlayerView()
        {
            buttonMode = false;
            useHandCursor = false;
            isSelf = true;
            lastCheckTime = 0;
            lastCheckStillTime = 0;
            lastCheckPoint = new Point(0, 0);
            _inCenterEffect = false;
            _uiMap = MapPanel(_core.view.getUI(ViewManager.PANEL_MAP));
            _uiStage = StageMain(_core.view.getUI(ViewManager.STAGE_MAIN));
            _core.view.getUI(ViewManager.MAIN_LONGBUFF).triggerBuffRelatedAction(this);
        }

        override public function set state(_arg_1:int):void
        {
            super.state = _arg_1;
            var _local_2:GameEvent = new GameEvent(GameEvent.PLAYER_STATE_CHANGE);
            _local_2.data = _arg_1;
            dispatchEvent(_local_2);
        }

        override protected function timerHandler(_arg_1:TimerEvent):void
        {
        }

        public function startCheckBattleTimer():void
        {
            addEventListener(Event.ENTER_FRAME, checkBattle);
        }

        override protected function moveEnd():void
        {
            dispatchEvent(new Event("monopoly_move_stop"));
        }

        private function updateCenter():void
        {
            _gameObject.posCenterX = _uiStage.centerX;
            _gameObject.posCenterY = _uiStage.centerY;
        }

        override public function walk(_arg_1:Event):void
        {
            if (((_gameObject.moveRoute) && (_gameObject.moveRoute.length > 0)))
            {
                stopCenter();
            };
            super.walk(_arg_1);
        }

        override public function stopFollow():void
        {
            super.stopFollow();
            if (gameObject)
            {
                gameObject.walkable = true;
            };
        }

        override protected function onWalking(_arg_1:Event=null):void
        {
            super.onWalking(_arg_1);
            updateUI();
            var _local_2:Number = new Date().getTime();
            var _local_3:Point = new Point(posX, posY);
            var _local_4:Number = Point.distance(lastCheckPoint, _local_3);
            if (_core.player.mapSafe)
            {
                if (_core.player.needToCheckBattle() == false)
                {
                    return;
                };
            };
            if (_local_4 < CHECK_DIS)
            {
                return;
            };
            if (((_gameObject.flyingState == GamePredef.FLYING_STATE_ON_GROUND) || (!(_gameObject.mapData.airSafe == 1))))
            {
                _core.remote.cbom(posX, posY);
                lastCheckTime = _local_2;
            };
        }

        override public function equipOff(_arg_1:Number=0):void
        {
            super.equipOff(_arg_1);
            _gameObject.wp = 0;
            _gameObject.ef = 0;
            _gameObject.star = 0;
        }

        public function checkBattle(_arg_1:Event):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.MAIN_LONGBUFF);
            var _local_3:Number = new Date().getTime();
            if ((_local_3 - lastCheckStillTime) < (2.2 * CHECK_DELAY))
            {
                return;
            };
            if (_core.player.mapSafe)
            {
                if (_core.player.needToCheckBattle() == false)
                {
                    return;
                };
            };
            if (_gameObject)
            {
                if (((_gameObject.flyingState == GamePredef.FLYING_STATE_ON_GROUND) || (!(_gameObject.mapData.airSafe == 1))))
                {
                    _core.remote.cb();
                    lastCheckStillTime = _local_3;
                };
            };
        }

        override protected function mouseOutHandler(_arg_1:MouseEvent):void
        {
        }

        public function updateUI(_arg_1:Boolean=true, _arg_2:Number=-1, _arg_3:Number=-1):void
        {
            _uiMap.update();
            if (GamePredef.GLOBAL_SETTING.ac)
            {
                if (_arg_1)
                {
                    _uiStage.lockToCenter(posX, posY);
                }
                else
                {
                    _uiStage.lockToCenter(_arg_2, _arg_3);
                };
                updateCenter();
            };
        }

        private function cushionCenter():void
        {
            var _local_1:Point;
            if (((parent) && (stage)))
            {
                _local_1 = parent.localToGlobal(new Point(posX, posY));
                if (((((_local_1.x < SIDE_SIZE) || (_local_1.x > (stage.stageWidth - SIDE_SIZE))) || (_local_1.y < SIDE_SIZE)) || (_local_1.y > (stage.stageHeight - SIDE_SIZE))))
                {
                    _uiStage.centerTo(posX, posY);
                };
            };
        }

        override public function stepTo(_arg_1:Point):void
        {
            super.stepTo(_arg_1);
            updateUI();
        }

        override public function stopWalk():void
        {
            var _local_1:int;
            var _local_2:int;
            super.stopWalk();
            _gameObject.stop();
            if (_core.targetIP)
            {
                if (_core.targetIP.hitTestObject(_shadow))
                {
                    _core.remote.sceneChange(_core.targetIP.gameObject.id);
                };
            };
            if (((_core.targetNPC) && (_core.targetNPC.view)))
            {
                _local_1 = (posX - _core.targetNPC.view.posX);
                _local_2 = (posY - _core.targetNPC.view.posY);
                if (ToolKit.getDistance(_local_1, _local_2) < 250)
                {
                    _core.targetNPC.view.clickNpc();
                };
            };
            updateUI();
            if (!GamePredef.GLOBAL_SETTING.ac)
            {
                cushionCenter();
            };
            moveEnd();
        }

        public function stopCheckBattleTimer():void
        {
            removeEventListener(Event.ENTER_FRAME, checkBattle);
        }

        override public function equipOn(_arg_1:Number, _arg_2:int, _arg_3:Boolean, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=true):void
        {
            super.equipOn(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
            _gameObject.wp = _arg_1;
            _gameObject.ee = _arg_2;
            _gameObject.ef = _arg_3;
            _gameObject.star = _arg_4;
        }

        override protected function mouseOverHandler(_arg_1:MouseEvent):void
        {
        }

        private function stopCenter():void
        {
            _uiStage.stopCenterEffect();
        }

        override public function startFollow(_arg_1:CreatureView):void
        {
            super.startFollow(_arg_1);
            if (gameObject)
            {
                gameObject.walkable = false;
            };
        }


    }
}//package com.qeedoo.ui.view.compGameStage

