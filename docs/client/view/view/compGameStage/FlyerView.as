// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.FlyerView

package com.qeedoo.ui.view.compGameStage
{
    import flash.display.Sprite;
    import com.qeedoo.game.system.Core;
    import flash.display.DisplayObject;
    import com.qeedoo.game.view.ViewManager;

    public class FlyerView extends DynamicItemView 
    {

        private var _flyer:Sprite;
        private var _flyer_cg:Object;
        private var _core:Core;

        public function FlyerView(_arg_1:Object)
        {
            _core = Core.getInstance();
            _flyer = new Sprite();
            _flyer_cg = _arg_1;
            _flyer_cg.x = -(_flyer_cg.midX);
            _flyer_cg.y = -(_flyer_cg.footY);
            _flyer.addChild(DisplayObject(_flyer_cg));
            addChild(_flyer);
        }

        public function get posY():int
        {
            return (y);
        }

        public function get centerY():int
        {
            return (_core.view.getUI(ViewManager.STAGE_MAIN).centerY);
        }

        public function set posX(_arg_1:int):void
        {
            x = _arg_1;
        }

        public function get yBase():int
        {
            return (y);
        }

        public function get posX():int
        {
            return (x);
        }

        public function playFlyer(_arg_1:int, _arg_2:int):void
        {
            if (_flyer_cg)
            {
                _flyer_cg.dir = _arg_1;
                _flyer_cg.behavior = _arg_2;
                _flyer_cg.play(((_flyer_cg.dir + "-") + _flyer_cg.behavior));
            };
        }

        public function set posY(_arg_1:int):void
        {
            y = _arg_1;
        }

        public function get centerX():int
        {
            return (_core.view.getUI(ViewManager.STAGE_MAIN).centerX);
        }

        public function removeFlyer():void
        {
            if (_flyer.contains(DisplayObject(_flyer_cg)))
            {
                _flyer.removeChild(DisplayObject(_flyer_cg));
            };
            removeChild(_flyer);
        }

        public function setFlyerXY(_arg_1:CharactorView, _arg_2:Number, _arg_3:Number):void
        {
            x = _arg_1.x;
            y = _arg_1.y;
            _flyer.x = (_arg_1._body.x + _arg_2);
            _flyer.y = (_arg_1._body.y + _arg_3);
            scaleX = _arg_1.scaleX;
            scaleY = _arg_1.scaleY;
        }


    }
}//package com.qeedoo.ui.view.compGameStage

