// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DecorateLogic

package com.qeedoo.ui.view.compDragable
{
    import flash.events.EventDispatcher;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.event.DecoEvent;

    public class DecorateLogic 
    {

        public static var decoProxy:EventDispatcher = new EventDispatcher();


        public static function updateDecoInfo(_arg_1:Object=null):void
        {
            if (((!(_arg_1)) || (Core.getInstance().player.decoInfo == _arg_1)))
            {
                return;
            };
            Core.getInstance().player.decoInfo = _arg_1;
            decoProxy.dispatchEvent(new DecoEvent(DecoEvent.DECO_CHANGE, false));
        }


    }
}//package com.qeedoo.ui.view.compDragable

