// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.ArrayUtil

package com.qeedoo.game.utils
{
    public class ArrayUtil 
    {


        public static function getElement(_arg_1:Array, _arg_2:String, _arg_3:Object):Object
        {
            var _local_5:Object;
            var _local_4:Object;
            for each (_local_5 in _arg_1)
            {
                if (((_local_5.hasOwnProperty(_arg_2)) && (_local_5[_arg_2] == _arg_3)))
                {
                    _local_4 = _local_5;
                    break;
                };
            };
            return (_local_4);
        }


    }
}//package com.qeedoo.game.utils

