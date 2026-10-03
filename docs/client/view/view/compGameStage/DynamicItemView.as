// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.DynamicItemView

package com.qeedoo.ui.view.compGameStage
{
    import flash.display.Sprite;
    import flash.display.DisplayObjectContainer;
    import com.qeedoo.ui.resource.Loader10;
    import flash.geom.Point;
    import flash.utils.Timer;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Debug;
    import flash.geom.Rectangle;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;

    public class DynamicItemView extends Sprite 
    {

        public var container:DisplayObjectContainer;
        protected var _resLoader:Loader10;
        protected var _autoVisible:Boolean;
        protected var _localizer:Point;
        protected var _yBase:int;
        protected var _visibleTimer:Timer;
        protected var _deleted:Boolean;

        public function DynamicItemView()
        {
            _localizer = new Point();
            _autoVisible = true;
            _deleted = false;
        }

        public function set colorCode(_arg_1:int):void
        {
            ResManager.setColorCode(_resLoader, _arg_1);
        }

        public function destroy():void
        {
            if (_deleted)
            {
                return;
            };
            container = null;
            _localizer = null;
            _deleted = true;
            if (_visibleTimer)
            {
                Debug.refTimer(_visibleTimer);
                _visibleTimer.stop();
                _visibleTimer = null;
            };
            visible = false;
        }

        public function set brightCode(_arg_1:Number):void
        {
            ResManager.setBrightCode(_resLoader, _arg_1);
        }

        public function get inScreen():Boolean
        {
            var _local_1:Rectangle = new Rectangle(x, y, width, height);
            var _local_2:StageMain = StageMain(ViewManager.getInstance().getUI(ViewManager.STAGE_MAIN));
            var _local_3:Rectangle = new Rectangle((-(_local_2.x) / _local_2.flyingZoomRate), (-(_local_2.y) / _local_2.flyingZoomRate), (GamePredef.APP_WIDTH / _local_2.flyingZoomRate), (GamePredef.APP_HEIGHT / _local_2.flyingZoomRate));
            return (_local_3.intersects(_local_1));
        }

        override public function get visible():Boolean
        {
            return (Boolean((!(parent == null))));
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:*;
            if (container == null)
            {
                if (parent == null)
                {
                    if (this._deleted == false)
                    {
                        _local_2 = null;
                        _local_2.assert();
                        return;
                    };
                    return;
                };
                container = parent;
            };
            if (_arg_1)
            {
                if (!visible)
                {
                    container.addChild(this);
                    var _local_3:* = container;
                    (_local_3["sortChildren"]());
                };
            }
            else
            {
                if (visible)
                {
                    container.removeChild(this);
                };
            };
        }


    }
}//package com.qeedoo.ui.view.compGameStage

