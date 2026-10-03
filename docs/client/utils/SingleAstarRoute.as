// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.SingleAstarRoute

package com.qeedoo.game.utils
{
    import flash.display.DisplayObject;
    import com.qeedoo.game.system.Core;
    import flash.utils.getTimer;
    import flash.display.Graphics;

    public class SingleAstarRoute 
    {

        private static var _instance:SingleAstarRoute;

        private const COST_STRAIGHT:int = 10;
        private const NOTE_ID_INDEX:int = 0;
        private const NOTE_CLOSED_INDEX:int = 2;
        private const COST_DIAGONAL:int = 14;
        private const NOTE_OPEN_INDEX:int = 1;

        private var _openListAry:Array;
        private var _openID:int;
        private var _hitTestContainer:DisplayObject;
        private var _pathScoreListAry:Array;
        private var _noteMapAry:Array;
        private var hittest_cost:Number = 0;
        private var STEP_LENGTH:int = 20;
        private var _maxTryValue:int;
        private var cancelled:Boolean = false;
        private var _xPointListAry:Array;
        private var _yPointListAry:Array;
        private var _parentListAry:Array;
        private var _openCountLength:int;
        private var _movementCostListAry:Array;

        public function SingleAstarRoute(_arg_1:Single)
        {
            _maxTryValue = 8000;
        }

        public static function getInstance():SingleAstarRoute
        {
            if (_instance == null)
            {
                _instance = new SingleAstarRoute(new Single());
            };
            return (_instance);
        }


        public function cancel():void
        {
            cancelled = true;
        }

        private function closeNote(_arg_1:int):void
        {
            _openCountLength--;
            var _local_2:int = _xPointListAry[_arg_1];
            var _local_3:int = _yPointListAry[_arg_1];
            _noteMapAry[_local_3][_local_2][NOTE_OPEN_INDEX] = false;
            _noteMapAry[_local_3][_local_2][NOTE_CLOSED_INDEX] = true;
            if (_openCountLength <= 0)
            {
                _openCountLength = 0;
                _openListAry = [];
                return;
            };
            _openListAry[0] = _openListAry.pop();
            backNote();
        }

        public function init(_arg_1:int=8000):void
        {
            _maxTryValue = _arg_1;
        }

        private function isOpen(_arg_1:int, _arg_2:int):Boolean
        {
            if (_noteMapAry[_arg_2] == null)
            {
                return (false);
            };
            if (_noteMapAry[_arg_2][_arg_1] == null)
            {
                return (false);
            };
            return (_noteMapAry[_arg_2][_arg_1][NOTE_OPEN_INDEX]);
        }

        private function getArounds(_arg_1:int, _arg_2:int):Array
        {
            var _local_3:Array = new Array();
            var _local_4:int = new int();
            var _local_5:int = new int();
            var _local_6:Boolean = new Boolean();
            _local_4 = (_arg_1 + STEP_LENGTH);
            _local_5 = _arg_2;
            var _local_7:Boolean = checkHitTest(_local_4, _local_5);
            if (((_local_7) && (!(isClosed(_local_4, _local_5)))))
            {
                _local_3.push([_local_4, _local_5]);
            };
            _local_4 = _arg_1;
            _local_5 = (_arg_2 + STEP_LENGTH);
            var _local_8:Boolean = checkHitTest(_local_4, _local_5);
            if (((_local_8) && (!(isClosed(_local_4, _local_5)))))
            {
                _local_3.push([_local_4, _local_5]);
            };
            _local_4 = (_arg_1 - STEP_LENGTH);
            _local_5 = _arg_2;
            var _local_9:Boolean = checkHitTest(_local_4, _local_5);
            if (((_local_9) && (!(isClosed(_local_4, _local_5)))))
            {
                _local_3.push([_local_4, _local_5]);
            };
            _local_4 = _arg_1;
            _local_5 = (_arg_2 - STEP_LENGTH);
            var _local_10:Boolean = checkHitTest(_local_4, _local_5);
            if (((_local_10) && (!(isClosed(_local_4, _local_5)))))
            {
                _local_3.push([_local_4, _local_5]);
            };
            _local_4 = (_arg_1 + STEP_LENGTH);
            _local_5 = (_arg_2 + STEP_LENGTH);
            _local_6 = checkHitTest(_local_4, _local_5);
            if (((((_local_6) && (_local_7)) && (_local_8)) && (!(isClosed(_local_4, _local_5)))))
            {
                _local_3.push([_local_4, _local_5]);
            };
            _local_4 = (_arg_1 - STEP_LENGTH);
            _local_5 = (_arg_2 + STEP_LENGTH);
            _local_6 = checkHitTest(_local_4, _local_5);
            if (((((_local_6) && (_local_9)) && (_local_8)) && (!(isClosed(_local_4, _local_5)))))
            {
                _local_3.push([_local_4, _local_5]);
            };
            _local_4 = (_arg_1 - STEP_LENGTH);
            _local_5 = (_arg_2 - STEP_LENGTH);
            _local_6 = checkHitTest(_local_4, _local_5);
            if (((((_local_6) && (_local_9)) && (_local_10)) && (!(isClosed(_local_4, _local_5)))))
            {
                _local_3.push([_local_4, _local_5]);
            };
            _local_4 = (_arg_1 + STEP_LENGTH);
            _local_5 = (_arg_2 - STEP_LENGTH);
            _local_6 = checkHitTest(_local_4, _local_5);
            if (((((_local_6) && (_local_7)) && (_local_10)) && (!(isClosed(_local_4, _local_5)))))
            {
                _local_3.push([_local_4, _local_5]);
            };
            return (_local_3);
        }

        private function getIndex(_arg_1:int):int
        {
            var _local_3:int;
            var _local_2:int = 1;
            for each (_local_3 in _openListAry)
            {
                if (_local_3 == _arg_1)
                {
                    return (_local_2);
                };
                _local_2++;
            };
            return (-1);
        }

        private function checkHitTest(_arg_1:Number, _arg_2:Number):Boolean
        {
            return (_hitTestContainer["checkHitTest"](_arg_1, _arg_2));
        }

        private function isClosed(_arg_1:int, _arg_2:int):Boolean
        {
            if (_noteMapAry[_arg_2] == null)
            {
                return (false);
            };
            if (_noteMapAry[_arg_2][_arg_1] == null)
            {
                return (false);
            };
            return (_noteMapAry[_arg_2][_arg_1][NOTE_CLOSED_INDEX]);
        }

        public function find(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:DisplayObject, _arg_6:Graphics):Array
        {
            var _local_17:Array;
            var _local_18:Core;
            initLists();
            initHitTestContainer(_arg_5);
            _openCountLength = 0;
            _openID = -1;
            trace(("start: " + getTimer()));
            var _local_7:uint = _arg_5["_mapWidth"];
            var _local_8:uint = _arg_5["_mapHeight"];
            openNote(_arg_1, _arg_2, 0, 0, 0);
            var _local_9:int;
            var _local_10:int = new int();
            var _local_11:int = new int();
            var _local_12:int = new int();
            var _local_13:Array = new Array();
            var _local_14:int = new int();
            var _local_15:int = new int();
            var _local_16:int = new int();
            while (_openCountLength > 0)
            {
                if (++_local_9 > _maxTryValue)
                {
                    destroyLists();
                    trace(((("finish:" + getTimer()) + " ; too many nodes : ") + _local_9));
                    return (null);
                };
                if (cancelled)
                {
                    trace((("cancelled:" + getTimer()) + " ; "));
                };
                _local_10 = _openListAry[0];
                closeNote(_local_10);
                _local_11 = _xPointListAry[_local_10];
                _local_12 = _yPointListAry[_local_10];
                if (((Math.abs((_local_11 - _arg_3)) < STEP_LENGTH) && (Math.abs((_local_12 - _arg_4)) < STEP_LENGTH)))
                {
                    trace(((("finish:" + getTimer()) + " ; found : ") + _local_9));
                    _local_18 = Core.getInstance();
                    trace(("player dir is" + _local_18.player.dir));
                    trace(("hittest cost : " + hittest_cost));
                    return (getPathAry(_arg_1, _arg_2, _local_10));
                };
                _local_13 = getArounds(_local_11, _local_12);
                for each (_local_17 in _local_13)
                {
                    _local_15 = (_movementCostListAry[_local_10] + (((_local_17[0] == _local_11) || (_local_17[1] == _local_12)) ? COST_STRAIGHT : COST_DIAGONAL));
                    _local_16 = (_local_15 + ((Math.abs((_arg_3 - _local_17[0])) + Math.abs((_arg_4 - _local_17[1]))) * COST_STRAIGHT));
                    if (isOpen(_local_17[0], _local_17[1]))
                    {
                        _local_14 = _noteMapAry[_local_17[1]][_local_17[0]][NOTE_ID_INDEX];
                        if (_local_15 < _movementCostListAry[_local_14])
                        {
                            _movementCostListAry[_local_14] = _local_15;
                            _pathScoreListAry[_local_14] = _local_16;
                            _parentListAry[_local_14] = _local_10;
                            aheadNote(getIndex(_local_14));
                        };
                    }
                    else
                    {
                        openNote(_local_17[0], _local_17[1], _local_16, _local_15, _local_10);
                    };
                };
            };
            destroyLists();
            trace((("finish:" + getTimer()) + " ; unfound"));
            return (null);
        }

        private function getPathAry(_arg_1:int, _arg_2:int, _arg_3:int):Array
        {
            var _local_4:Array = new Array();
            var _local_5:int = _xPointListAry[_arg_3];
            var _local_6:int = _yPointListAry[_arg_3];
            while (((!(_local_5 == _arg_1)) || (!(_local_6 == _arg_2))))
            {
                _local_4.unshift([_local_5, _local_6]);
                _arg_3 = _parentListAry[_arg_3];
                _local_5 = _xPointListAry[_arg_3];
                _local_6 = _yPointListAry[_arg_3];
            };
            _local_4.unshift([_arg_1, _arg_2]);
            destroyLists();
            return (_local_4);
        }

        private function destroyHitTestContainer():void
        {
            _hitTestContainer = null;
        }

        private function aheadNote(_arg_1:int):void
        {
            var _local_2:int = new int();
            var _local_3:int = new int();
            while (_arg_1 > 1)
            {
                _local_2 = int(Math.floor((_arg_1 / 2)));
                if (getScore(_arg_1) < getScore(_local_2))
                {
                    _local_3 = _openListAry[(_arg_1 - 1)];
                    _openListAry[(_arg_1 - 1)] = _openListAry[(_local_2 - 1)];
                    _openListAry[(_local_2 - 1)] = _local_3;
                    _arg_1 = _local_2;
                }
                else
                {
                    return;
                };
            };
        }

        private function openNote(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            _openCountLength++;
            _openID++;
            if (_noteMapAry[_arg_2] == null)
            {
                _noteMapAry[_arg_2] = new Array();
            };
            _noteMapAry[_arg_2][_arg_1] = new Array();
            _noteMapAry[_arg_2][_arg_1][NOTE_OPEN_INDEX] = true;
            _noteMapAry[_arg_2][_arg_1][NOTE_ID_INDEX] = _openID;
            _xPointListAry.push(_arg_1);
            _yPointListAry.push(_arg_2);
            _pathScoreListAry.push(_arg_3);
            _movementCostListAry.push(_arg_4);
            _parentListAry.push(_arg_5);
            _openListAry.push(_openID);
            aheadNote(_openCountLength);
        }

        private function destroyLists():void
        {
            _openListAry = null;
            _xPointListAry = null;
            _yPointListAry = null;
            _pathScoreListAry = null;
            _movementCostListAry = null;
            _parentListAry = null;
            _noteMapAry = null;
        }

        private function getScore(_arg_1:int):int
        {
            return (_pathScoreListAry[_openListAry[(_arg_1 - 1)]]);
        }

        private function initLists():void
        {
            _openListAry = [];
            _xPointListAry = [];
            _yPointListAry = [];
            _pathScoreListAry = [];
            _movementCostListAry = [];
            _parentListAry = [];
            _noteMapAry = [];
        }

        private function initHitTestContainer(_arg_1:DisplayObject):void
        {
            _hitTestContainer = _arg_1;
        }

        public function set maxTryValue(_arg_1:int):void
        {
            _maxTryValue = _arg_1;
        }

        private function backNote():void
        {
            var _local_1:int = 1;
            var _local_2:int = new int();
            var _local_3:int = new int();
            while (true)
            {
                _local_2 = _local_1;
                if ((2 * _local_2) <= _openCountLength)
                {
                    if (getScore(_local_1) > getScore((2 * _local_2)))
                    {
                        _local_1 = (2 * _local_2);
                    };
                    if (((2 * _local_2) + 1) <= _openCountLength)
                    {
                        if (getScore(_local_1) > getScore(((2 * _local_2) + 1)))
                        {
                            _local_1 = ((2 * _local_2) + 1);
                        };
                    };
                };
                if (_local_2 == _local_1) break;
                _local_3 = _openListAry[(_local_2 - 1)];
                _openListAry[(_local_2 - 1)] = _openListAry[(_local_1 - 1)];
                _openListAry[(_local_1 - 1)] = _local_3;
            };
        }

        public function get maxTryValue():int
        {
            return (_maxTryValue);
        }


    }
}//package com.qeedoo.game.utils

class Single 
{


}


