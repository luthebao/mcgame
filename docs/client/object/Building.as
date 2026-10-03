// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.object.Building

package com.qeedoo.game.object
{
    public dynamic class Building extends Charactor 
    {

        public var layer:int;
        public var buildState:String;
        public var buildType:int;
        public var tid:int;

        public function Building()
        {
            colorCode = 0;
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
        }


    }
}//package com.qeedoo.game.object

