// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.CheatChecker

package com.qeedoo.game.utils
{
    import flash.utils.Timer;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.TimerEvent;

    public class CheatChecker 
    {

        private static const CHECK_DELAY:Number = 10000;
        private static const CHECK_ROUND:Number = 9000;
        private static const GC_DELAY:Number = 120000;
        private static var _last:Number = 0;
        private static var _timer:Timer;
        private static var _frameNum:Number = 0;


        public static function init():void
        {
        }

        public static function check(_arg_1:TimerEvent=null):void
        {
            var _local_2:Number = new Date().getTime();
            var _local_3:Core = Core.getInstance();
            if ((_local_2 - _last) < CHECK_ROUND)
            {
                if (_local_3.player)
                {
                    _local_3.player.say(Language.CHEATCHECKER_S[0], GamePredef.MSG_CHANNEL_LOCAL);
                    _local_3.error++;
                };
                if (_local_3.error >= 3)
                {
                    _local_3.error = 0;
                    _local_3.logout();
                    _local_3.refresh();
                };
            };
            _last = _local_2;
            if ((_local_2 - _local_3.lastGC) > GC_DELAY)
            {
                _local_3.gc();
            };
        }


    }
}//package com.qeedoo.game.utils

