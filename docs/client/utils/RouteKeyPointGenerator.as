// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.RouteKeyPointGenerator

package com.qeedoo.game.utils
{
    import flash.display.DisplayObject;
    import flash.display.BitmapData;

    public class RouteKeyPointGenerator 
    {

        public static const KEY_POINT_LENGTH:int = 10;
        private static var _instance:RouteKeyPointGenerator;

        private var _userKeyPointsAry:Array;
        private var _hitTestContainer:DisplayObject;
        private var _hitTestBitmapData:BitmapData;


        public static function getInstance():RouteKeyPointGenerator
        {
            if (_instance == null)
            {
                _instance = new (RouteKeyPointGenerator)();
            };
            return (_instance);
        }


        public function initHitTestContainer(_arg_1:DisplayObject):void
        {
            _hitTestContainer = _arg_1;
        }

        public function generateKeyPoints(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Array):void
        {
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_15:Array;
            var _local_16:Number;
            var _local_17:int;
            var _local_18:int;
            var _local_19:int;
            var _local_22:int;
            var _local_6:int = (_arg_3 - _arg_1);
            var _local_7:int = (_arg_4 - _arg_2);
            var _local_8:int = int(Math.round(Math.pow(((_local_6 * _local_6) + (_local_7 * _local_7)), (1 / 2))));
            var _local_12:Boolean;
            var _local_13:Boolean;
            var _local_14:Boolean;
            _local_9 = 1;
            while (_local_9 < _local_8)
            {
                _local_10 = int(Math.round((_arg_1 + ((_local_9 * _local_6) / _local_8))));
                _local_11 = int(Math.round((_arg_2 + ((_local_9 * _local_7) / _local_8))));
                if (checkHitTest(_local_10, _local_11))
                {
                    _local_12 = true;
                    break;
                };
                _local_9 = (_local_9 + KEY_POINT_LENGTH);
            };
            if (!_local_12)
            {
                _local_9 = 0;
                while (_local_9 < _userKeyPointsAry.length)
                {
                    _local_15 = _userKeyPointsAry[_local_9];
                    if (((_local_15[0] == _arg_1) && (_local_15[1] == _arg_2)))
                    {
                        _local_13 = true;
                    };
                    if (((_local_15[0] == _arg_3) && (_local_15[1] == _arg_4)))
                    {
                        _local_14 = true;
                    };
                    _local_9++;
                };
                if (!_local_13)
                {
                    _userKeyPointsAry.push([_arg_1, _arg_2]);
                };
                if (!_local_14)
                {
                    _userKeyPointsAry.push([_arg_3, _arg_4]);
                };
                return;
            };
            var _local_20:int = _arg_1;
            var _local_21:int = _arg_2;
            _local_17 = (_arg_4 - _arg_2);
            _local_18 = (_arg_1 - _arg_3);
            _local_19 = ((_arg_3 * _arg_2) - (_arg_1 * _arg_4));
            _local_22 = 0;
            _local_16 = 0;
            _local_8 = 0;
            _local_9 = 0;
            while (_local_9 < _arg_5.length)
            {
                _local_15 = _arg_5[_local_9];
                _local_16 = Math.abs(((((_local_17 * _local_15[0]) + (_local_18 * _local_15[1])) + _local_19) / Math.sqrt(((_local_17 * _local_17) + (_local_18 * _local_18)))));
                if (_local_8 < _local_16)
                {
                    _local_8 = _local_16;
                    _local_20 = _local_15[0];
                    _local_21 = _local_15[1];
                    _local_22 = (_local_9 + 1);
                };
                _local_9++;
            };
            if (_local_8 == 0)
            {
                return;
            };
            _local_9 = 0;
            while (_local_9 < _userKeyPointsAry.length)
            {
                _local_15 = _userKeyPointsAry[_local_9];
                if (((_local_15[0] == _arg_1) && (_local_15[1] == _arg_2)))
                {
                    _local_13 = true;
                };
                _local_9++;
            };
            if (!_local_13)
            {
                _userKeyPointsAry.push([_arg_1, _arg_2]);
            };
            var _local_23:Array = new Array();
            _local_9 = 0;
            while (_local_9 < _local_22)
            {
                _local_23[_local_9] = _arg_5[_local_9];
                _local_9++;
            };
            var _local_24:Array = new Array();
            _local_9 = _local_22;
            while (_local_9 < _arg_5.length)
            {
                _local_24[(_local_9 - _local_22)] = _arg_5[_local_9];
                _local_9++;
            };
            if (_local_23.length > 0)
            {
                generateKeyPoints(_arg_1, _arg_2, _local_20, _local_21, _local_23);
            };
            if (_local_24.length > 0)
            {
                generateKeyPoints(_local_20, _local_21, _arg_3, _arg_4, _local_24);
            };
            _local_9 = 0;
            while (_local_9 < _userKeyPointsAry.length)
            {
                _local_15 = _userKeyPointsAry[_local_9];
                if (((_local_15[0] == _arg_3) && (_local_15[1] == _arg_4)))
                {
                    _local_14 = true;
                };
                _local_9++;
            };
            if (!_local_14)
            {
                _userKeyPointsAry.push([_arg_3, _arg_4]);
            };
        }

        public function init(_arg_1:DisplayObject):void
        {
            _userKeyPointsAry = new Array();
            initHitTestContainer(_arg_1);
        }

        public function getKeyPointsAry():Array
        {
            return (_userKeyPointsAry);
        }

        private function checkHitTest(_arg_1:Number, _arg_2:Number):Boolean
        {
            return (!(_hitTestContainer["checkHitTest"](_arg_1, _arg_2)));
        }


    }
}//package com.qeedoo.game.utils

