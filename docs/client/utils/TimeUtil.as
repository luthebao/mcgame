// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.TimeUtil

package com.qeedoo.game.utils
{
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.system.Core;
    import mx.formatters.DateFormatter;

    public class TimeUtil 
    {

        private static const DateArr:* = [Language.ACTIVEPANEL_U[33], Language.ACTIVEPANEL_U[34], Language.ACTIVEPANEL_U[35], Language.ACTIVEPANEL_U[36], Language.ACTIVEPANEL_U[37], Language.ACTIVEPANEL_U[38], Language.ACTIVEPANEL_U[39]];
        private static var localTimeOffSet:Number;


        public static function decodeTimeObj(_arg_1:Object):String
        {
            var _local_6:*;
            var _local_2:Date = new Date();
            var _local_3:Boolean;
            if (((!(_arg_1.everyDay)) && (_arg_1.dateArr)))
            {
                _local_6 = 0;
                while (_local_6 < _arg_1.dateArr.length)
                {
                    if (_local_2.getDay() == ((Number(_arg_1.dateArr[_local_6]) + 1) % 7))
                    {
                        _local_3 = true;
                        break;
                    };
                    _local_6++;
                };
                if (!_local_3)
                {
                    return (null);
                };
            };
            var _local_4:Array = _arg_1.startTime.split(":");
            var _local_5:Array = _arg_1.endTime.split(":");
            if (((_local_2.getHours() < Number(_local_4[0])) || ((_local_2.getHours() == Number(_local_4[0])) && (_local_2.getMinutes() < Number(_local_4[1])))))
            {
                return (Language.DAILYACT_U[5]);
            };
            if ((((_local_2.getHours() == Number(_local_5[0])) && (_local_2.getMinutes() >= Number(_local_5[1]))) || (_local_2.getHours() > Number(_local_5[0]))))
            {
                return (Language.DAILYACT_U[4]);
            };
            return (Language.DAILYACT_U[3]);
        }

        public static function get timeOSOffSet():Number
        {
            if (!localTimeOffSet)
            {
                localTimeOffSet = ((new Date().getTimezoneOffset() * 60) * 1000);
            };
            return (localTimeOffSet - Core.getInstance().serverTimeOffSet);
        }

        public static function getTimeStr3(_arg_1:String):Object
        {
            var _local_6:Array;
            var _local_7:Array;
            var _local_2:Object = new Object();
            var _local_3:Array = _arg_1.split("#");
            var _local_4:String = _local_3[0];
            var _local_5:String = ((_local_3[1] == null) ? "" : _local_3[1]);
            if (_local_4 == "-1")
            {
                _local_2.everyDay = true;
            }
            else
            {
                _local_6 = _local_4.split(",");
                _local_2.dateArr = _local_6;
            };
            if (_local_5 != "")
            {
                _local_7 = _local_5.split("-");
                _local_2.startTime = _local_7[0];
                _local_2.endTime = _local_7[1];
            };
            return (_local_2);
        }

        public static function dateTimeToString(_arg_1:Date):String
        {
            var _local_2:DateFormatter = new DateFormatter();
            _local_2.formatString = "YYYY-MM-DD JJ:NN:SS";
            return (_local_2.format(_arg_1));
        }

        public static function getTimeStr2(_arg_1:String):Object
        {
            var _local_5:Array;
            var _local_6:String;
            var _local_7:String;
            var _local_8:Array;
            var _local_9:Array;
            var _local_2:Array = _arg_1.split("#");
            var _local_3:Object = new Object();
            var _local_4:int;
            while (_local_4 < _local_2.length)
            {
                _local_5 = _local_2[_local_4].toString().split("|");
                _local_6 = _local_5[0];
                _local_7 = ((_local_5[1] == null) ? "" : _local_5[1]);
                if (_local_6 == "-1")
                {
                    _local_3.everyDay = true;
                }
                else
                {
                    _local_8 = _local_6.split(",");
                    _local_3.dateArr = _local_8;
                };
                if (_local_7 != "")
                {
                    _local_9 = _local_7.split("-");
                    _local_3.startTime = _local_9[0];
                    _local_3.endTime = _local_9[1];
                };
                _local_4++;
            };
            if (_local_2.length > 1)
            {
                trace(_local_3);
            };
            return (_local_3);
        }

        public static function getTimeStr4(_arg_1:*, _arg_2:*):*
        {
            var _local_3:Date = new Date(_arg_2);
            var _local_4:Number = _local_3.getMinutes();
            var _local_5:Number = _local_3.getHours();
            var _local_6:Number = _local_3.getDay();
            var _local_7:Number = _local_3.getDate();
            var _local_8:Number = _local_3.getMonth();
            switch (_arg_1)
            {
                case "min":
                    return ((((((((_local_8 + "|") + _local_7) + "|") + _local_6) + "|") + _local_5) + "|") + _local_4);
                case "hour":
                    return ((((((_local_8 + "|") + _local_7) + "|") + _local_6) + "|") + _local_5);
                case "day":
                    return ((((_local_8 + "|") + _local_7) + "|") + _local_6);
                case "date":
                    return ((_local_8 + "|") + _local_7);
                case "month":
                    return (_local_8);
            };
            return ((((((_local_8 + "|") + _local_7) + "|") + _local_6) + "|") + _local_5);
        }

        public static function getTimeStr(_arg_1:String):String
        {
            var _local_5:Array;
            var _local_6:String;
            var _local_7:String;
            var _local_8:Array;
            var _local_9:String;
            var _local_10:int;
            var _local_2:Array = _arg_1.split("#");
            var _local_3:* = "";
            var _local_4:int;
            while (_local_4 < _local_2.length)
            {
                _local_5 = _local_2[_local_4].toString().split("|");
                _local_6 = _local_5[0];
                _local_7 = ((_local_5[1] == null) ? "" : _local_5[1]);
                if (_local_6 == "-1")
                {
                    _local_7 = ((Language.ACTIVEPANEL_U[31] + " ") + _local_7);
                }
                else
                {
                    _local_8 = _local_6.split(",");
                    _local_9 = Language.ACTIVEPANEL_U[32];
                    _local_10 = 0;
                    while (_local_10 < _local_8.length)
                    {
                        _local_9 = (_local_9 + (DateArr[Number(_local_8[_local_10])] + "/"));
                        _local_10++;
                    };
                    _local_9 = _local_9.substr(0, (_local_9.length - 1));
                    _local_7 = ((_local_9 + " ") + _local_7);
                };
                _local_3 = (_local_3 + (_local_7 + " "));
                _local_4++;
            };
            if (_local_2.length > 1)
            {
                trace(_local_3);
            };
            return (_local_3);
        }

        public static function get dateFormatter():DateFormatter
        {
            var _local_1:DateFormatter;
            if (_local_1 == null)
            {
                _local_1 = new DateFormatter();
                _local_1.formatString = "HH:NN";
            };
            return (_local_1);
        }

        public static function secToTime(_arg_1:Number):String
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            if (_arg_1)
            {
                _local_2 = 0;
                _local_3 = 0;
                _local_4 = 0;
                _local_5 = "00";
                _local_6 = "00";
                _local_7 = "00";
                if (_arg_1 >= 3600)
                {
                    _local_2 = int(Math.floor((_arg_1 / 3600)));
                    _local_3 = int((Math.floor((_arg_1 / 60)) % 60));
                    _local_4 = (_arg_1 % 60);
                }
                else
                {
                    if (_arg_1 >= 60)
                    {
                        _local_2 = 0;
                        _local_3 = int(Math.floor((_arg_1 / 60)));
                        _local_4 = (_arg_1 % 60);
                    }
                    else
                    {
                        if (_arg_1 > 0)
                        {
                            _local_2 = 0;
                            _local_3 = 0;
                            _local_4 = _arg_1;
                        }
                        else
                        {
                            _local_2 = 0;
                            _local_3 = 0;
                            _local_4 = 0;
                        };
                    };
                };
                if (_local_2 > 0)
                {
                    if (_local_2 <= 9)
                    {
                        _local_5 = String(_local_2);
                    }
                    else
                    {
                        _local_5 = String(_local_2);
                    };
                };
                if (_local_3 >= 0)
                {
                    if (_local_3 <= 9)
                    {
                        _local_6 = ("0" + _local_3);
                    }
                    else
                    {
                        _local_6 = String(_local_3);
                    };
                };
                if (_local_4 >= 0)
                {
                    if (_local_4 <= 9)
                    {
                        _local_7 = ("0" + _local_4);
                    }
                    else
                    {
                        _local_7 = String(_local_4);
                    };
                };
                if (_local_2 == 0)
                {
                    if (((_local_4 == 0) && (_local_3 == 0)))
                    {
                        return ("00:00");
                    };
                    return ((_local_6 + ":") + _local_7);
                };
                return ((((_local_5 + ":") + _local_6) + ":") + _local_7);
            };
            return ("00:00");
        }

        public static function getThisMonDay(_arg_1:Number):String
        {
            var _local_2:Date = new Date(_arg_1);
            var _local_3:Number = _local_2.getMinutes();
            var _local_4:Number = _local_2.getHours();
            var _local_5:Number = _local_2.getDay();
            var _local_6:Number = _local_2.getDate();
            var _local_7:Number = _local_2.getMonth();
            var _local_8:Number = _local_2.getFullYear();
            var _local_9:Number = 0;
            if (Number(_local_5) == 0)
            {
                _local_9 = 6;
            }
            else
            {
                _local_9 = (Number(_local_5) - 1);
            };
            var _local_10:Number = new Date(_local_2.getFullYear(), _local_2.getMonth(), _local_2.getDate()).getTime();
            var _local_11:Number = (Number(_local_10) - Number((((24 * 3600) * 1000) * _local_9)));
            var _local_12:* = new Date(_local_11);
            _local_5 = _local_12.getDay();
            _local_6 = _local_12.getDate();
            _local_7 = _local_12.getMonth();
            return ((((_local_7 + "|") + _local_6) + "|") + _local_5);
        }


    }
}//package com.qeedoo.game.utils

