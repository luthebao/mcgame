// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.logic.Basic

package com.qeedoo.game.logic
{
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.system.Core;

    public class Basic 
    {


        public function getPreByQuality(_arg_1:int):int
        {
            var _local_2:int;
            if (_arg_1 == 0)
            {
                return (0);
            };
            _local_2 = (_arg_1 % 5);
            if (_local_2 == 0)
            {
                return (5);
            };
            return (_local_2);
        }

        public function levelToExp(_arg_1:Number):Number
        {
            if (_arg_1 <= 0)
            {
                return (0);
            };
            return (GamePredef.PLAYER_LEVEL_EXP[(_arg_1 - 1)]);
        }

        public function getItemSlotList(_arg_1:uint, _arg_2:int=-1):Array
        {
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Object;
            var _local_3:Core = Core.getInstance();
            var _local_4:Array = [];
            var _local_5:Array = [];
            var _local_6:uint;
            for each (_local_7 in _local_3.data.sList)
            {
                if ((((_local_7) && (_local_3.data.isBagSlot(_local_7.sid))) && (_local_7.type == GamePredef.TBL_ITEM_INSTANCE)))
                {
                    _local_8 = _local_3.data.gameData[_local_7.type][_local_7.itemId];
                    _local_9 = _local_3.getTemplateData(_local_7.type, _local_7.itemId);
                    if (((_local_9) && (_local_9.id == _arg_1)))
                    {
                        if (_local_8.binded == 1)
                        {
                            if (((_arg_2 == -1) || (_local_6 < _arg_2)))
                            {
                                _local_4.push(_local_7.id);
                                _local_6 = (_local_6 + _local_7.stackNum);
                            }
                            else
                            {
                                break;
                            };
                        }
                        else
                        {
                            _local_5.push({
                                "id":_local_7.id,
                                "stackNum":_local_7.stackNum
                            });
                        };
                    };
                };
            };
            for each (_local_7 in _local_5)
            {
                if (((_arg_2 == -1) || (_local_6 < _arg_2)))
                {
                    _local_4.push(_local_7.id);
                    _local_6 = (_local_6 + _local_7.stackNum);
                }
                else
                {
                    break;
                };
            };
            if (((_arg_2 == -1) || (_local_6 >= _arg_2)))
            {
                return (_local_4);
            };
            return (null);
        }

        public function randIn(_arg_1:Number, _arg_2:Number):Number
        {
            return (_arg_1 + ((_arg_2 - _arg_1) * Math.random()));
        }

        public function getDistance(_arg_1:Object, _arg_2:Object):int
        {
            var _local_3:int = (_arg_1.posX - _arg_2.posX);
            var _local_4:int = (_arg_1.posY - _arg_2.posY);
            return (Math.sqrt((Math.pow(_local_3, 2) + Math.pow(_local_4, 2))));
        }

        public function expReToLevelRe(_arg_1:Number):Number
        {
            if (_arg_1 <= 0)
            {
                return (1);
            };
            var _local_2:int;
            while (_local_2 < GamePredef.PLAYER_RELEVEL_EXP.length)
            {
                if (_arg_1 < GamePredef.PLAYER_RELEVEL_EXP[_local_2])
                {
                    return (_local_2);
                };
                _local_2++;
            };
            return (GamePredef.PLAYER_RELEVEL_EXP.length);
        }

        public function colorByGrowRate(_arg_1:Number):int
        {
            var _local_2:String;
            for (_local_2 in GamePredef.PET_GROWRATE_NUM)
            {
                if (_arg_1 <= GamePredef.PET_GROWRATE_NUM[_local_2])
                {
                    return (int(_local_2));
                };
            };
            return (4);
        }

        public function rand3(_arg_1:int, _arg_2:int):int
        {
            return (Math.floor(randIn(_arg_1, (_arg_2 + 1))));
        }

        public function expToLevel(_arg_1:Number):Number
        {
            if (_arg_1 <= 0)
            {
                return (1);
            };
            var _local_2:int;
            while (_local_2 < GamePredef.PLAYER_LEVEL_EXP.length)
            {
                if (_arg_1 < GamePredef.PLAYER_LEVEL_EXP[_local_2])
                {
                    return (_local_2);
                };
                _local_2++;
            };
            return (GamePredef.PLAYER_LEVEL_EXP.length);
        }

        public function rand2(_arg_1:Number, _arg_2:Number):int
        {
            return (Math.round(randIn(_arg_1, _arg_2)));
        }

        public function checkLevelUp(_arg_1:*):int
        {
            return (expToLevel(_arg_1.exp) - _arg_1.level);
        }

        public function getObjProNum(_arg_1:Object):Number
        {
            var _local_3:*;
            var _local_2:Number = 0;
            if (_arg_1)
            {
                for each (_local_3 in _arg_1)
                {
                    _local_2++;
                };
            };
            return (_local_2);
        }

        public function getColorByQuality(_arg_1:int):int
        {
            return (Math.ceil((_arg_1 / 5)));
        }

        public function skillExpToLevel(_arg_1:int):int
        {
            return (0);
        }

        public function levelUpExp(_arg_1:Number):Number
        {
            return (GamePredef.PLAYER_LEVEL_EXP[_arg_1] - GamePredef.PLAYER_LEVEL_EXP[(_arg_1 - 1)]);
        }


    }
}//package com.qeedoo.game.logic

