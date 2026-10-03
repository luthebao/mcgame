// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.logic.PetLogic

package com.qeedoo.game.logic
{
    import com.qeedoo.game.predef.GamePredef;

    public class PetLogic 
    {


        public static function lvToExp(_arg_1:Number):Number
        {
            if (_arg_1 <= 0)
            {
                return (0);
            };
            return (GamePredef.PET_LEVEL_EXP[(_arg_1 - 1)]);
        }

        public static function expToLv(_arg_1:Number):Number
        {
            if (_arg_1 <= 0)
            {
                return (1);
            };
            var _local_2:int;
            while (_local_2 < GamePredef.PET_LEVEL_EXP.length)
            {
                if (_arg_1 < GamePredef.PET_LEVEL_EXP[_local_2])
                {
                    return (_local_2);
                };
                _local_2++;
            };
            return (GamePredef.PET_LEVEL_EXP.length);
        }

        public static function lvUpExp(_arg_1:Number):Number
        {
            return (GamePredef.PET_LEVEL_EXP[_arg_1] - GamePredef.PET_LEVEL_EXP[(_arg_1 - 1)]);
        }


    }
}//package com.qeedoo.game.logic

