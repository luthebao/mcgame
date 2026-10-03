// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.WorldMapIcon

package com.qeedoo.ui.view.comp
{
    import mx.controls.Image;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.FlexEvent;

    public class WorldMapIcon extends Image 
    {

        private var _showTip:Boolean;

        private var iconN:Class = WorldMapIcon_iconN;
        private var iconU:Class = WorldMapIcon_iconU;
        private var iconC:Class = WorldMapIcon_iconC;
        private var iconT:Class = WorldMapIcon_iconT;
        private var _core:Core = Core.getInstance();

        public function WorldMapIcon()
        {
            this.width = 20;
            this.height = 20;
            this.scaleContent = false;
            this.addEventListener("rollOver", ___WorldMapIcon_Image1_rollOver);
            this.addEventListener("rollOut", ___WorldMapIcon_Image1_rollOut);
            this.addEventListener("creationComplete", ___WorldMapIcon_Image1_creationComplete);
            this.addEventListener("click", ___WorldMapIcon_Image1_click);
        }

        private function showInfo():void
        {
            _showTip = true;
            filters = [GamePredef.FILTER_ALLOW_SELECTED];
            if (!id)
            {
                return;
            };
            var _local_1:Number = Number(id.slice(1));
            if (_local_1 > 0)
            {
                showTip(_local_1);
            };
        }

        private function init():void
        {
            setN();
            if (!id)
            {
                setU();
            };
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function ___WorldMapIcon_Image1_click(_arg_1:MouseEvent):void
        {
            showAlert();
        }

        public function ___WorldMapIcon_Image1_rollOver(_arg_1:MouseEvent):void
        {
            showInfo();
        }

        private function showTip(_arg_1:int):void
        {
            if (!_showTip)
            {
                return;
            };
            var _local_2:TipMap = TipMap(_core.view.getUI(ViewManager.TOOLTIP_MAP));
            _local_2.showMap(_arg_1);
        }

        private function showAlert():void
        {
            if (!id)
            {
                return;
            };
            var _local_1:Number = Number(id.slice(1));
            _core.player.mapTrans(_local_1);
        }

        public function setC():void
        {
            source = iconC;
            width = 20;
            height = 20;
        }

        public function ___WorldMapIcon_Image1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function ___WorldMapIcon_Image1_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }

        public function setN():void
        {
            source = iconN;
            width = 20;
            height = 20;
        }

        public function setT():void
        {
            source = iconT;
            width = 20;
            height = 20;
        }

        private function hideTip():void
        {
            _showTip = false;
            filters = [];
        }

        public function setU():void
        {
            source = iconU;
            width = 20;
            height = 20;
        }


    }
}//package com.qeedoo.ui.view.comp

