// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.logic.ObjectMove

package com.qeedoo.game.logic
{
    import com.qeedoo.game.utils.RouteKeyPointGenerator;
    import flash.geom.Point;
    import com.qeedoo.game.system.Core;
    import flash.display.Sprite;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.utils.SingleAstarRoute;
    import com.qeedoo.game.predef.GamePredef;
    import flash.display.DisplayObject;

    public class ObjectMove 
    {


        public function getRoute(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:DisplayObject=null, _arg_6:int=10):Array
        {
            var _local_7:int;
            var _local_15:int;
            var _local_16:int;
            var _local_21:int;
            var _local_22:Number;
            var _local_23:Number;
            var _local_24:RouteKeyPointGenerator;
            var _local_25:Array;
            var _local_26:int;
            var _local_27:int;
            var _local_28:Array;
            var _local_29:Array;
            if (_arg_5 == null)
            {
                return ([[_arg_3, _arg_4]]);
            };
            var _local_8:Point = new Point(_arg_3, _arg_4);
            var _local_9:Point = new Point(_arg_1, _arg_2);
            var _local_10:Point = _arg_5.localToGlobal(_local_8);
            var _local_11:Point = _arg_5.localToGlobal(_local_9);
            if (((!(_local_10)) || (!(_local_11))))
            {
                return ([]);
            };
            if (_arg_5.hitTestPoint(_local_11.x, _local_11.y, true))
            {
                _local_21 = Point.distance(_local_8, _local_9);
                _local_22 = (((_arg_3 - _arg_1) * 10) / _local_21);
                _local_23 = (((_arg_4 - _arg_2) * 10) / _local_21);
                _local_7 = 1;
                while (_local_7 < 3)
                {
                    _local_11.offset(_local_22, _local_23);
                    if (!_arg_5.hitTestPoint(_local_11.x, _local_11.y, true))
                    {
                        _local_9.offset((_local_22 * _local_7), (_local_23 * _local_7));
                        return (getRoute(_local_9.x, _local_9.y, _arg_3, _arg_4, _arg_5));
                    };
                    _local_7++;
                };
                return ([]);
            };
            if (!_arg_5["checkHitTest"](_local_8.x, _local_8.y))
            {
                return (getDirectRoute(_arg_3, _arg_4, _arg_1, _arg_2, _local_8, _local_9, _local_11, _arg_5));
            };
            var _local_12:int = (_arg_3 - _arg_1);
            var _local_13:int = (_arg_4 - _arg_2);
            var _local_14:int = int(Math.round(Math.pow(((_local_12 * _local_12) + (_local_13 * _local_13)), (1 / 2))));
            var _local_17:Boolean;
            _local_17 = true;
            if (!_local_17)
            {
                return ([[_arg_3, _arg_4]]);
            };
            var _local_18:Core = Core.getInstance();
            var _local_19:Sprite = Sprite(_local_18.view.getUI(ViewManager.STAGE_MAIN).routeLayer);
            var _local_20:Array = SingleAstarRoute.getInstance().find(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _local_19.graphics);
            if (_local_20)
            {
                if (GamePredef.DEBUG_MODE)
                {
                    _local_19.graphics.clear();
                    _local_19.graphics.lineStyle(2, 11206553, 0.8);
                    _local_26 = _arg_1;
                    _local_27 = _arg_2;
                    for each (_local_28 in _local_20)
                    {
                        _local_19.graphics.beginFill(0xFF0000, 0.8);
                        _local_19.graphics.drawCircle(_local_28[0], _local_28[1], 3);
                        _local_19.graphics.moveTo(_local_26, _local_27);
                        _local_19.graphics.lineTo(_local_28[0], _local_28[1]);
                        _local_19.graphics.endFill();
                        _local_26 = _local_28[0];
                        _local_27 = _local_28[1];
                    };
                };
                _local_24 = RouteKeyPointGenerator.getInstance();
                _local_24.init(_arg_5);
                _local_24.generateKeyPoints(_arg_1, _arg_2, _arg_3, _arg_4, _local_20);
                _local_25 = _local_24.getKeyPointsAry();
                if (((_local_25) && (_local_25.length > 1)))
                {
                    _local_25.shift();
                };
                if (GamePredef.DEBUG_MODE)
                {
                    _local_19.graphics.lineStyle(2, 16724787, 0.8);
                    _local_26 = _arg_1;
                    _local_27 = _arg_2;
                    for each (_local_29 in _local_25)
                    {
                        _local_19.graphics.beginFill(0xFF00, 0.8);
                        _local_19.graphics.drawCircle(_local_29[0], _local_29[1], 3);
                        _local_19.graphics.moveTo(_local_26, _local_27);
                        _local_19.graphics.lineTo(_local_29[0], _local_29[1]);
                        _local_19.graphics.endFill();
                        _local_26 = _local_29[0];
                        _local_27 = _local_29[1];
                    };
                };
                return (_local_25);
            };
            return (getDirectRoute(_arg_3, _arg_4, _arg_1, _arg_2, _local_8, _local_9, _local_11, _arg_5));
        }

        public function getSafeRoute(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:DisplayObject=null):Array
        {
            var _local_8:int;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:int;
            var _local_14:Array;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:uint;
            var _local_18:uint;
            var _local_19:int;
            var _local_20:int;
            var _local_21:Boolean;
            var _local_22:Number;
            var _local_23:Number;
            var _local_6:Point = new Point(_arg_3, _arg_4);
            var _local_7:Point = new Point(_arg_1, _arg_2);
            if (!_arg_5["checkHitTest"](_local_7.x, _local_7.y))
            {
                _local_8 = Point.distance(_local_6, _local_7);
                _local_9 = (((_arg_3 - _arg_1) * 10) / _local_8);
                _local_10 = (((_arg_4 - _arg_2) * 10) / _local_8);
                _local_11 = 100;
                _local_12 = 20;
                _local_13 = 16;
                _local_14 = new Array();
                _local_15 = ((Math.PI * 2) / _local_13);
                _local_16 = 0;
                _local_17 = (_arg_5["_mapWidth"] - _local_11);
                _local_18 = (_arg_5["_mapHeight"] - _local_11);
                _local_19 = 0;
                while (_local_19 < _local_13)
                {
                    _local_14.push([(Math.cos(_local_16) * _local_12), (Math.sin(_local_16) * _local_12)]);
                    _local_16 = (_local_16 + _local_15);
                    _local_19++;
                };
                _local_20 = 0;
                _local_21 = false;
                while (_local_20 < 200)
                {
                    _local_19 = 0;
                    while (_local_19 < _local_13)
                    {
                        if (_local_14[_local_19])
                        {
                            _local_22 = (_arg_1 + (_local_14[_local_19][0] * _local_20));
                            _local_23 = (_arg_2 + (_local_14[_local_19][1] * _local_20));
                            if ((((((_local_22 < _arg_1) && (_local_22 < _local_11)) || ((_local_22 > _arg_1) && (_local_22 > _local_17))) || ((_local_23 < _arg_2) && (_local_23 < _local_11))) || ((_local_23 > _arg_2) && (_local_23 > _local_18))))
                            {
                                delete _local_14[_local_19];
                            }
                            else
                            {
                                if (_arg_5["checkHitTest"](_local_22, _local_23))
                                {
                                    _local_7.offset((_local_14[_local_19][0] * _local_20), (_local_14[_local_19][1] * _local_20));
                                    _local_21 = true;
                                    break;
                                };
                            };
                        };
                        _local_19++;
                    };
                    if (_local_21) break;
                    _local_20++;
                };
                if (_local_20 < 200)
                {
                    return ([[_local_7.x, _local_7.y]]);
                };
                return ([[_local_6.x, _local_6.y]]);
            };
            return (null);
        }

        private function getDirectRoute(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Point, _arg_6:Point, _arg_7:Point, _arg_8:DisplayObject):Array
        {
            var _local_9:int = Point.distance(_arg_5, _arg_6);
            var _local_10:Number = (((_arg_1 - _arg_3) * 10) / _local_9);
            var _local_11:Number = (((_arg_2 - _arg_4) * 10) / _local_9);
            _arg_7.offset(_local_10, _local_11);
            var _local_12:int;
            while (_arg_8["checkHitTest"]((_arg_3 + (_local_10 * _local_12)), (_arg_4 + (_local_11 * _local_12))))
            {
                _arg_7.offset(_local_10, _local_11);
                _local_12++;
            };
            _arg_6.offset((_local_10 * _local_12), (_local_11 * _local_12));
            return ([[_arg_6.x, _arg_6.y]]);
        }

        public function getBattleRoute(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):Array
        {
            var _local_5:Point = new Point(_arg_1, _arg_2);
            var _local_6:Point = new Point(_arg_3, _arg_4);
            var _local_7:int = Point.distance(_local_5, _local_6);
            var _local_8:int = GamePredef.GROUP_FOLLOW_DISTANCE;
            var _local_9:Point = _local_6.clone();
            _local_9.offset((((_arg_1 - _arg_3) * _local_8) / _local_7), (((_arg_2 - _arg_4) * _local_8) / _local_7));
            return ([[_local_9.x, _local_9.y]]);
        }

        public function getCloseToRoute(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:DisplayObject=null):Array
        {
            var _local_11:Point;
            var _local_12:Array;
            var _local_6:Array = getRoute(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            if (((_local_6 == null) || (_local_6.length <= 0)))
            {
                return (_local_6);
            };
            var _local_7:uint = GamePredef.GROUP_FOLLOW_DISTANCE;
            var _local_8:Point = new Point(_local_6[0][0], _local_6[0][1]);
            var _local_9:Point = new Point(_arg_1, _arg_2);
            var _local_10:uint = Point.distance(_local_8, _local_9);
            if (_local_6.length == 1)
            {
                if (_local_10 < _local_7)
                {
                    return (null);
                };
                _local_11 = _local_8.clone();
                _local_11.offset((((_local_9.x - _local_8.x) * _local_7) / _local_10), (((_local_9.y - _local_8.y) * _local_7) / _local_10));
                _local_12 = [[_local_11.x, _local_11.y]];
                return (_local_12);
            };
            var _local_13:int = (_local_6.length - 1);
            while (_local_13 > 0)
            {
                _local_8 = new Point(_local_6[_local_13][0], _local_6[_local_13][1]);
                _local_9 = new Point(_local_6[(_local_13 - 1)][0], _local_6[(_local_13 - 1)][1]);
                _local_10 = Point.distance(_local_8, _local_9);
                if (_local_10 < _local_7)
                {
                    _local_7 = (_local_7 - _local_10);
                }
                else
                {
                    _local_11 = _local_8.clone();
                    _local_11.offset((((_local_9.x - _local_8.x) * _local_7) / _local_10), (((_local_9.y - _local_8.y) * _local_7) / _local_10));
                    _local_12 = _local_6.slice(0, (_local_6.length - 1));
                    _local_12.push([_local_11.x, _local_11.y]);
                    return (_local_12);
                };
                _local_13--;
            };
            return (null);
        }

        private function checkHitTest(_arg_1:Number, _arg_2:Number, _arg_3:DisplayObject):Boolean
        {
            return (!(_arg_3["checkHitTest"](_arg_1, _arg_2)));
        }


    }
}//package com.qeedoo.game.logic

