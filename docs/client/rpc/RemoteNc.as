// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.rpc.RemoteNc

package com.qeedoo.game.rpc
{
    public class RemoteNc 
    {

        private static var _global:RemoteObj;
        private static var _remote:RemoteObj;


        public static function get global():RemoteObj
        {
            return (_global);
        }

        public static function set global(_arg_1:RemoteObj):void
        {
            _global = _arg_1;
        }

        public static function set remote(_arg_1:RemoteObj):void
        {
            _remote = _arg_1;
        }

        public static function get remote():RemoteObj
        {
            return (_remote);
        }


    }
}//package com.qeedoo.game.rpc

