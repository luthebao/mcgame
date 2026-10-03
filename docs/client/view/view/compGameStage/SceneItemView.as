// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.SceneItemView

package com.qeedoo.ui.view.compGameStage
{
    import mx.core.IToolTip;
    import com.qeedoo.game.object.SceneItem;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.resource.Loader10;
    import com.qeedoo.game.config.Debug;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.net.URLRequest;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import mx.managers.ToolTipManager;
    import com.qeedoo.game.config.Language;

    public class SceneItemView extends DynamicItemView 
    {

        public static var VISIBLE_DELAY:int = 500;
        public static var TYPE_TRANSPORT:int = 3;

        private var _toolTip:IToolTip;
        private var hasToolTip:Boolean = false;
        private var _sprite:Object;
        private var _gameObject:SceneItem;
        private var _core:Core = Core.getInstance();

        public function SceneItemView()
        {
            _resLoader = new Loader10();
            this.cacheAsBitmap = true;
            addChild(_resLoader);
            addVisibleTimer();
            mouseChildren = false;
            mouseEnabled = false;
            _resLoader.mouseChildren = false;
            _resLoader.mouseEnabled = false;
            alpha = 0.6;
            Debug.refView(this);
        }

        public function set gameObject(_arg_1:SceneItem):void
        {
            _gameObject = _arg_1;
            _gameObject.view = this;
            x = _gameObject.posX;
            y = _gameObject.posY;
            if (_gameObject.type == TYPE_TRANSPORT)
            {
                addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
                addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
                addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
                mouseEnabled = true;
                buttonMode = true;
                useHandCursor = true;
            };
            if (Number(_gameObject.data.layer) == 0)
            {
                alpha = 1;
            };
            _resLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
            _resLoader.load(new URLRequest(ResManager.getResUrl(_gameObject.resCode)));
        }

        private function mouseDownHandler(_arg_1:MouseEvent):void
        {
            if (_gameObject.type == TYPE_TRANSPORT)
            {
                _arg_1.stopImmediatePropagation();
                _core.targetIP = this;
                _core.player.routeTo((x + _arg_1.localX), (y + _arg_1.localY));
            };
        }

        private function loaded(event:Event):void
        {
            var loc:Object;
            _resLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loaded);
            _sprite = _resLoader.content;
            try
            {
                _sprite.stop();
                _sprite.mouseEnabled = false;
                _sprite.mouseChildren = false;
            }
            catch(e:Object)
            {
                trace(e);
            };
            if (((_gameObject) && (_gameObject.posDir == 1)))
            {
                _sprite.scaleX = -1;
                _sprite.x = _sprite.width;
            };
            width = _sprite.width;
            height = _sprite.height;
            if (_gameObject)
            {
                colorCode = _gameObject.colorCode;
                brightCode = _gameObject.brightCode;
            };
            try
            {
                loc = _sprite.getChildByName("localizer");
                _localizer.y = loc.y;
                _yBase = (y + _localizer.y);
            }
            catch(e:Object)
            {
                trace(e);
            };
        }

        public function get yBase():int
        {
            return (_yBase);
        }

        protected function checkVisible(_arg_1:TimerEvent):void
        {
            if ((((!(_deleted)) && (inScreen)) && (!(_core.state == GamePredef.ST_CORE_BATTLE))))
            {
                visible = true;
            }
            else
            {
                visible = false;
            };
        }

        public function get gameObject():SceneItem
        {
            return (_gameObject);
        }

        protected function addVisibleTimer():void
        {
            _visibleTimer = new Timer(VISIBLE_DELAY);
            _visibleTimer.addEventListener(TimerEvent.TIMER, checkVisible);
            _visibleTimer.start();
        }

        private function rollOverHandler(_arg_1:MouseEvent):void
        {
            _toolTip = ToolTipManager.createToolTip(String((Language.SCENEITEMVIEW_S[0] + _gameObject.name)), _arg_1.stageX, (_arg_1.stageY - 20));
            hasToolTip = true;
        }

        override public function destroy():void
        {
            if (_deleted)
            {
                return;
            };
            if (((hasToolTip) && (_toolTip is IToolTip)))
            {
                ToolTipManager.destroyToolTip(_toolTip);
                hasToolTip = false;
            };
            super.destroy();
            if (_gameObject)
            {
                if (_gameObject.type == TYPE_TRANSPORT)
                {
                    removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
                    removeEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
                    removeEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
                };
                _gameObject.view = null;
                _gameObject = null;
            };
        }

        private function rollOutHandler(_arg_1:MouseEvent):void
        {
            ToolTipManager.destroyToolTip(_toolTip);
            hasToolTip = false;
        }


    }
}//package com.qeedoo.ui.view.compGameStage

