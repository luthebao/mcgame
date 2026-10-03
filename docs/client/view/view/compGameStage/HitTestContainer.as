// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.HitTestContainer

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.ui.view.comp.SimpleConainer;
    import flash.utils.ByteArray;
    import com.qeedoo.game.system.Core;
    import flash.system.ApplicationDomain;
    import flash.display.Sprite;

    public class HitTestContainer extends SimpleConainer 
    {

        private var _bytes:ByteArray;
        public var _mapHeight:uint = 0;
        public var _mapWidth:uint = 0;
        private var _core:Core = Core.getInstance();

        public function HitTestContainer()
        {
            _core.scene.hitTest = this;
        }

        public function init(_arg_1:Sprite, _arg_2:String):void
        {
            var _local_3:Class = (ApplicationDomain.currentDomain.getDefinition(("ClassBytes" + _arg_2)) as Class);
            var _local_4:* = new (_local_3)();
            _mapWidth = _local_4.width;
            _mapHeight = _local_4.height;
            _local_4.uncompress();
            _bytes = _local_4;
        }

        public function removeAll():void
        {
            removeAllChildren();
            graphics.clear();
        }

        public function checkHitTest(_arg_1:uint, _arg_2:uint):Boolean
        {
            var _local_9:*;
            if (((((_arg_1 < 0) || (_arg_1 > _mapWidth)) || (_arg_2 < 0)) || (_arg_2 > _mapHeight)))
            {
                return (false);
            };
            if (!_bytes)
            {
                return (true);
            };
            if (((_arg_1 == 1593) && (_arg_2 == 1480)))
            {
                _local_9 = null;
            };
            var _local_3:int = ((_arg_2 * _mapWidth) + _arg_1);
            var _local_4:int = int((_local_3 / 8));
            var _local_5:int = (_local_3 % 8);
            var _local_6:uint = (1 << _local_5);
            var _local_7:uint = _bytes[_local_4];
            var _local_8:uint = (_local_7 & _local_6);
            return (_local_8);
        }


    }
}//package com.qeedoo.ui.view.compGameStage

