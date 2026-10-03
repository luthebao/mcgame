// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compFore.SystemInfoCanvas

package com.qeedoo.ui.view.compFore
{
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.managers.ToolTipManager;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.system.Login_Model;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.MMOGame;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class SystemInfoCanvas extends Canvas 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":Canvas});

        public function SystemInfoCanvas()
        {
            mx_internal::_document = this;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function complete():void
        {
            ToolTipManager.enabled = true;
            ViewManager.getInstance().getUI(ViewManager.FORE_L_R).onShow();
        }

        public function showModel(_arg_1:Object, _arg_2:String, _arg_3:String):void
        {
            if (!_arg_2)
            {
                _arg_2 = Language.SYSTEMINFOCANVAS_S[0];
            };
            if (!_arg_3)
            {
                _arg_3 = Language.SYSTEMINFOCANVAS_S[1];
            };
            if (_arg_2 == Language.SYSTEMINFOCANVAS_S[0])
            {
                _arg_2 = Language.SYSTEMINFOCANVAS_S[0];
            };
            if (_arg_3 == Language.SYSTEMINFOCANVAS_S[1])
            {
                _arg_3 = Language.SYSTEMINFOCANVAS_S[1];
            };
            if (((Login_Model.app) && (Login_Model.app.hasOwnProperty("loadReady"))))
            {
                Login_Model.app.loadReady();
            };
            var _local_4:GameEvent = new GameEvent(GameEvent.GAME_INIT);
            var _local_5:Object = MMOGame.app.parent;
            _local_4.data = _arg_2;
            _local_5.dispatchEvent(_local_4);
        }


    }
}//package com.qeedoo.ui.view.compFore

