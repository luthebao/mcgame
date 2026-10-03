// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.event.GameDataEvent

package com.qeedoo.game.event
{
    import flash.events.Event;

    public class GameDataEvent extends Event 
    {

        public static var DATA_RECIEVED:String = "DATA_RECIEVED";
        public static var DATA_PACKAGE_RECIEVED:String = "DATA_PACKAGE_RECIEVED";
        public static var SKILL_LEVEL_CLICKED:String = "SKILL_LEVEL_CLICKED";
        public static var RES_LOADED:String = "RES_LOADED";
        public static var MAP_READY:String = "MAP_READY";

        public var data:*;

        public function GameDataEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

    }
}//package com.qeedoo.game.event

