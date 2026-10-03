// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.config.Debug

package com.qeedoo.game.config
{
    import flash.utils.Dictionary;
    import flash.utils.ByteArray;

    public class Debug 
    {

        public static var DEBUG_MODE:Boolean = false;
        public static var REF_TIMER:Dictionary = new Dictionary(true);
        public static var REF_RES:Dictionary = new Dictionary(true);
        public static var REF_LOADER:Dictionary = new Dictionary(true);
        public static var REF_VIEW:Dictionary = new Dictionary(true);
        public static var REF_OBJ:Dictionary = new Dictionary(true);
        public static var COUNT_FUNC:Object = {};


        public static function logFunc(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:Count;
            var _local_4:ByteArray;
            if (!DEBUG_MODE)
            {
                return;
            };
            if (!COUNT_FUNC[_arg_1])
            {
                _local_3 = new Count();
                COUNT_FUNC[_arg_1] = new Count();
            }
            else
            {
                _local_3 = Count(COUNT_FUNC[_arg_1]);
                _local_3.call++;
                _local_4 = new ByteArray();
                _local_4.writeObject(_arg_2);
                _local_3.data = (_local_3.data + _local_4.length);
            };
            trace(_arg_1, "次数：", _local_3.call, "数据量:", _local_3.data);
        }

        public static function refTimer(_arg_1:Object):void
        {
            REF_TIMER[_arg_1] = true;
        }

        public static function refObj(_arg_1:Object):void
        {
            REF_OBJ[_arg_1] = true;
        }

        public static function refLoader(_arg_1:Object):void
        {
            REF_LOADER[_arg_1] = true;
        }

        public static function refRes(_arg_1:Object):void
        {
            REF_RES[_arg_1] = true;
        }

        public static function getLen(_arg_1:Dictionary):int
        {
            var _local_3:Object;
            var _local_2:int;
            for (_local_3 in _arg_1)
            {
                _local_2++;
            };
            return (_local_2);
        }

        public static function output():void
        {
            var _local_1:Object;
            trace("当前View引用数:", getLen(REF_VIEW));
            trace("当前Timer引用数:", getLen(REF_TIMER));
            trace("当前Loader引用数:", getLen(REF_LOADER));
            trace("当前Res引用数:", getLen(REF_RES));
            trace("当前Obj引用数:", getLen(REF_OBJ));
            for (_local_1 in COUNT_FUNC)
            {
                trace(_local_1, "-", Count(COUNT_FUNC[_local_1]).call, "-", Count(COUNT_FUNC[_local_1]).data);
            };
        }

        public static function refView(_arg_1:Object):void
        {
            REF_VIEW[_arg_1] = true;
        }


    }
}//package com.qeedoo.game.config

class Count 
{

    public var data:int = 0;
    public var call:int = 1;


}


