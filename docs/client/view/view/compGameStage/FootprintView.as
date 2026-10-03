// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.FootprintView

package com.qeedoo.ui.view.compGameStage
{
    import flash.display.DisplayObjectContainer;
    import com.qeedoo.game.resource.FootprintGraphic;
    import flash.events.Event;
    import flash.display.DisplayObject;

    public class FootprintView extends DynamicItemView 
    {

        private var _container:DisplayObjectContainer;
        private var current_frame:int = 1;
        private var _fc:FootprintGraphic;

        public function FootprintView(_arg_1:FootprintGraphic, _arg_2:DisplayObjectContainer)
        {
            _fc = _arg_1;
            _container = _arg_2;
            this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
            addChild(DisplayObject(_arg_1));
        }

        private function removeSelf():void
        {
            if (this.parent == _container)
            {
                _container.removeChild(this);
            };
        }

        public function get yBase():int
        {
            return (0);
        }

        private function onEnterFrame(_arg_1:Event):void
        {
            current_frame++;
            if (current_frame > _fc.mc.totalFrames)
            {
                removeSelf();
                this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
            };
        }


    }
}//package com.qeedoo.ui.view.compGameStage

