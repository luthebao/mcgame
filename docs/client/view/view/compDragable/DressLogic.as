// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DressLogic

package com.qeedoo.ui.view.compDragable
{
    import flash.events.EventDispatcher;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.utils.JSONUtil;
    import com.qeedoo.ui.event.DressEvent;

    public class DressLogic 
    {

        public static var dressProxy:EventDispatcher = new EventDispatcher();


        public static function updateDressInfo(_arg_1:String=null):void
        {
            if (((!(_arg_1)) || (Core.getInstance().player.dressInfo == _arg_1)))
            {
                return;
            };
            Core.getInstance().player.dressInfo = JSONUtil.JSONfy(_arg_1);
            dressProxy.dispatchEvent(new DressEvent(DressEvent.DRESS_CHANGE, false));
        }


    }
}//package com.qeedoo.ui.view.compDragable

