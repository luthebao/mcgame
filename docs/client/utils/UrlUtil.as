// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.UrlUtil

package com.qeedoo.game.utils
{
    import com.qeedoo.game.predef.GamePredef;

    public class UrlUtil 
    {

        private static const ROOT_RES:String = "resource/";
        private static const ROOT_ICON:String = "icon/";
        private static const ROOT_HASH:String = "res/";
        private static const URL_WORD_EXT:Number = 1000000000000;
        private static const URL_WORD_1:Number = 0x3B9ACA00;
        private static const URL_WORD_2:Number = 1000000;
        private static const URL_NUM_LENGTH:int = 6;


        public static function getResUrlNoHash(_arg_1:Number):String
        {
            return (ROOT_RES + getUrl(_arg_1));
        }

        public static function getUrl(_arg_1:Number):String
        {
            var _local_2:int = int(int((_arg_1 / URL_WORD_EXT)));
            _arg_1 = (_arg_1 % URL_WORD_EXT);
            var _local_3:int = int(int((_arg_1 / URL_WORD_1)));
            _arg_1 = (_arg_1 % URL_WORD_1);
            var _local_4:int = int(int((_arg_1 / URL_WORD_2)));
            var _local_5:String = _arg_1.toString();
            _local_5 = _local_5.substr((_local_5.length - URL_NUM_LENGTH));
            var _local_6:String = ((((GamePredef.RES_URL_FOLDER[_local_3] + GamePredef.RES_URL_WORD1[_local_3]) + GamePredef.RES_URL_WORD2[_local_4]) + _local_5) + GamePredef.RES_URL_EXT[_local_2]);
            return (_local_6);
        }


    }
}//package com.qeedoo.game.utils

