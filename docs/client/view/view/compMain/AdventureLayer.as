// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.AdventureLayer

package com.qeedoo.ui.view.compMain
{
    import mx.core.UIComponent;
    import flash.display.MovieClip;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.resource.ResCacher;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class AdventureLayer extends UIComponent 
    {

        private var _goddess:MovieClip;

        public function AdventureLayer()
        {
            init();
            super();
        }

        public function init():void
        {
            this.x = 800;
            this.y = 600;
        }

        public function adventureEffect():void
        {
            var onLoadComplete:Function;
            var url:String = ResManager.getResUrlNoHash(2080130200000);
            var newHash:String = ResManager.hash(url);
            var obj:Object = ResCacher.getInstance().getRes(newHash);
            if (obj == null)
            {
                onLoadComplete = function (_arg_1:Event):void
                {
                    ResCacher.getInstance().removeEventListener(Event.COMPLETE, onLoadComplete);
                    var _local_2:MovieClip = (_arg_1.target.current_complete_loader.content as MovieClip);
                    setMcAndPlay(_local_2);
                };
                ResCacher.getInstance().addEventListener(Event.COMPLETE, onLoadComplete);
            }
            else
            {
                if (_goddess)
                {
                    play(_goddess);
                };
            };
        }

        private function setMcAndPlay(_arg_1:Object):void
        {
            var _local_3:MovieClip;
            var _local_2:MovieClip = (_arg_1 as MovieClip);
            if (((_local_2) && (_local_2.numChildren > 0)))
            {
                _local_3 = (_local_2.getChildAt(0) as MovieClip);
                if (_local_3)
                {
                    setPlayObj(_local_3);
                    play(_local_3);
                };
            };
        }

        private function play(mc:MovieClip):void
        {
            var onEnterFrame:Function;
            var onClick:Function;
            if (mc)
            {
                onEnterFrame = function (_arg_1:Event):void
                {
                    if (mc.currentFrame == mc.totalFrames)
                    {
                        mc.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
                        mc.removeEventListener(MouseEvent.CLICK, onClick);
                        if (contains(mc))
                        {
                            removeChild(mc);
                        }
                        else
                        {
                            trace("------");
                        };
                    };
                };
                onClick = function (_arg_1:Event):void
                {
                    mc.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
                    mc.removeEventListener(MouseEvent.CLICK, onClick);
                    if (contains(mc))
                    {
                        removeChild(mc);
                    }
                    else
                    {
                        trace("---@click---");
                    };
                };
                mc.gotoAndStop(0);
                mc.addEventListener(Event.ENTER_FRAME, onEnterFrame);
                mc.addEventListener(MouseEvent.CLICK, onClick);
                addChild(mc);
                mc.gotoAndPlay(0);
            };
        }

        private function setPlayObj(_arg_1:MovieClip):void
        {
            if (!_goddess)
            {
                _goddess = _arg_1;
            };
        }


    }
}//package com.qeedoo.ui.view.compMain

