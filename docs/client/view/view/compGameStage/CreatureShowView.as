// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.CreatureShowView

package com.qeedoo.ui.view.compGameStage
{
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;

    public class CreatureShowView extends CreatureView 
    {

        public var decoFlag:Boolean = false;

        public function CreatureShowView()
        {
            if (_shadow)
            {
                this.removeChild(_shadow);
                _shadow = null;
            };
        }

        override protected function mouseOverHandler(_arg_1:MouseEvent):void
        {
        }

        public function setDecoBottomRes(_arg_1:String):void
        {
            if (((!(_arg_1)) || (!(_gameObject))))
            {
                return;
            };
            if (_gameObject.decoBottomCode == _arg_1)
            {
                return;
            };
            if (_tepe_cg)
            {
                _tepe_cg.unload();
                _tepe_cg = null;
            };
            _gameObject.decoBottomCode = _arg_1;
            super.tepeOn();
        }

        public function setDecoLightRes(_arg_1:String):void
        {
            if (((!(_arg_1)) || (!(_gameObject))))
            {
                return;
            };
            if (_gameObject.decoLightCode == _arg_1)
            {
                return;
            };
            if (_round_cg)
            {
                _round_cg.unload();
                _round_cg = null;
            };
            _gameObject.decoLightCode = _arg_1;
            super.roundOn();
        }

        override public function get inScreen():Boolean
        {
            return (true);
        }

        override protected function checkVisible(_arg_1:TimerEvent):void
        {
        }

        override protected function setName():void
        {
        }

        override protected function setFairyGraphic(_arg_1:Object):void
        {
        }

        override public function mountOn():void
        {
            if (((!(_gameObject)) || (!(_gameObject.flyingState == GamePredef.FLYING_STATE_ON_GROUND))))
            {
                return;
            };
            if (decoFlag)
            {
                return;
            };
            super.mountOn();
        }

        override public function flyerOn():void
        {
            if ((((!(_gameObject)) || (isNaN(_gameObject.flyerResCode))) || (_gameObject.flyerResCode <= 0)))
            {
                return;
            };
            super.flyerOn();
            super.mountOff();
        }

        override protected function mouseOutHandler(_arg_1:MouseEvent):void
        {
        }

        override protected function onAddedToStage(_arg_1:Event):void
        {
        }

        override protected function mouseDownHandler(_arg_1:MouseEvent):void
        {
        }

        override protected function removeListener():void
        {
        }

        public function setFlyerCodes(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(_gameObject))))
            {
                return;
            };
            var _local_2:* = _arg_1.flyerResCode;
            var _local_3:* = _arg_1.flyerFrontResCode;
            if (_gameObject.flyerResCode == _local_2)
            {
                return;
            };
            _gameObject.flyerResCode = _local_2;
            _gameObject.flyerFrontResCode = _local_3;
            super.flyerOff();
            flyerOn();
        }

        override protected function setPosition():void
        {
        }

        public function setDecoLightMaskRes(_arg_1:String):void
        {
            if (((!(_arg_1)) || (!(_gameObject))))
            {
                return;
            };
            if (_gameObject.decoLightMaskCode == _arg_1)
            {
                return;
            };
            if (_round_mask_cg)
            {
                _round_mask_cg.unload();
                _round_mask_cg = null;
            };
            _gameObject.decoLightMaskCode = _arg_1;
            super.roundMaskOn();
        }

        override public function flyerOff():void
        {
            super.flyerOff();
            this.mountOn();
        }

        public function setDecoHeadRes(_arg_1:String):void
        {
            if (((!(_arg_1)) || (!(_gameObject))))
            {
                return;
            };
            if (_gameObject.decoHeadCode == _arg_1)
            {
                return;
            };
            if (_halo_cg)
            {
                _halo_cg.unload();
                _halo_cg = null;
            };
            _gameObject.decoHeadCode = _arg_1;
            super.haloOn();
        }

        override protected function addVisibleTimer():void
        {
        }

        override protected function addListener():void
        {
        }

        public function setResCode(_arg_1:Number):void
        {
            _gameObject.resCode = _arg_1;
            this.loadRes();
        }

        override public function faceTo(_arg_1:int, _arg_2:int=0):void
        {
            _gameObject.dir = _arg_1;
            gameObject.posDir = _arg_1;
            super.faceTo(_arg_1, _arg_2);
        }


    }
}//package com.qeedoo.ui.view.compGameStage

