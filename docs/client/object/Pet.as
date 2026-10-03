// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.object.Pet

package com.qeedoo.game.object
{
    import com.qeedoo.game.predef.GamePredef;

    public class Pet extends Creature 
    {

        public var leaderId:Number;
        public var tid:Number;
        public var posCenterY:int;
        public var petTrendAction:int;
        public var posCenterX:int;
        public var cid:Number;

        public function Pet()
        {
            tid = -1;
            cid = -1;
            posCenterX = 0;
            posCenterY = 0;
            petTrendAction = 0;
            leaderId = -1;
            type = GamePredef.TBL_PET;
        }

        override public function set data(_arg_1:Object):void
        {
            var _local_2:Object;
            for (_local_2 in _arg_1)
            {
                if (hasOwnProperty(_local_2))
                {
                    this[_local_2] = _arg_1[_local_2];
                };
            };
        }


    }
}//package com.qeedoo.game.object

