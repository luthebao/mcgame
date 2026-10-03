// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.JSONUtil

package com.qeedoo.game.utils
{
    public class JSONUtil 
    {


        public static function isEmptyObject(_arg_1:Object):Boolean
        {
            var _local_2:String;
            if (_arg_1)
            {
                for (_local_2 in _arg_1)
                {
                    if (_arg_1[_local_2])
                    {
                        return (false);
                    };
                };
            };
            return (true);
        }

        public static function JSONfy(_arg_1:String):String
        {
            if (!_arg_1)
            {
                return ("");
            };
            var _local_2:RegExp = new RegExp('"', "g");
            var _local_3:String = _arg_1.replace(_local_2, "");
            _local_2 = new RegExp("'", "g");
            _local_3 = _local_3.replace(_local_2, "");
            _local_2 = new RegExp("([+-] ?)?\\b\\w+\\b", "g");
            _local_3 = _local_3.replace(_local_2, '"$&"');
            _local_2 = new RegExp('"\\."', "g");
            return (_local_3.replace(_local_2, "."));
        }


    }
}//package com.qeedoo.game.utils

