// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.LinkEncode

package com.qeedoo.game.utils
{
    import com.qeedoo.game.predef.GamePredef;

    public class LinkEncode 
    {


        public static function encode(_arg_1:int, _arg_2:Number, _arg_3:String):String
        {
            if (!GamePredef.LINK_TYPE_ARRAY[_arg_1])
            {
                return ("");
            };
            var _local_4:String = _arg_2.toString();
            if (GamePredef.LINK_TYPE_ARRAY[_arg_1] == "HELP")
            {
                if (_arg_2 < 1000)
                {
                    _local_4 = ("0" + _arg_2.toString());
                };
            };
            return (((((("[@" + GamePredef.LINK_TYPE_ARRAY[_arg_1]) + "|") + _local_4) + "|") + _arg_3) + "|8|0|0]");
        }


    }
}//package com.qeedoo.game.utils

