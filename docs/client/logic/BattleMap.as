// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.logic.BattleMap

package com.qeedoo.game.logic
{
    import com.qeedoo.game.system.Core;
    import flash.geom.Point;
    import com.qeedoo.game.view.ViewManager;

    public class BattleMap 
    {

        private var _core:Core = Core.getInstance();


        public function initBattleMap(_arg_1:*=null):void
        {
            _core.player.normalView.pause();
            _core.player.walkable = false;
            _core.player.normalView.lastCheckPoint = new Point(_core.player.normalView.posX, _core.player.normalView.posY);
            _core.view.show(ViewManager.POPU_STAR_INSTACE_MAP);
        }

        public function exitToMain():void
        {
        }


    }
}//package com.qeedoo.game.logic

