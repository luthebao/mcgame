// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.TextUtil

package com.qeedoo.game.utils
{
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.view.ViewManager;

    public class TextUtil 
    {

        private static var _core:Core = Core.getInstance();


        private static function decodeOut():String
        {
            var _local_5:String;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:Object;
            var _local_14:int;
            var _local_2:String = GamePredef.MSG_ITEM_COLOR[arguments[4]];
            var _local_3:String = arguments[5];
            var _local_4:String = arguments[6];
            if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_NPC])
            {
                _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[0];
            }
            else
            {
                if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_SKILL])
                {
                    _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[4];
                }
                else
                {
                    if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_SCENEITEM_INSTANCE])
                    {
                        _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[5];
                    }
                    else
                    {
                        if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_SCENEITEM_TEMPLATE])
                        {
                            _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[5];
                        }
                        else
                        {
                            if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR])
                            {
                                _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[1];
                            }
                            else
                            {
                                if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CREATURE])
                                {
                                    _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[3];
                                }
                                else
                                {
                                    if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_MAP])
                                    {
                                        _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[5];
                                    }
                                    else
                                    {
                                        if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[1000])
                                        {
                                            _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[1];
                                            arguments[2] = _core.player.id;
                                        }
                                        else
                                        {
                                            if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[1001])
                                            {
                                                _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[0];
                                                arguments[2] = _core.target.id;
                                            }
                                            else
                                            {
                                                if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_POS])
                                                {
                                                    _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[0];
                                                }
                                                else
                                                {
                                                    if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[1005])
                                                    {
                                                        _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[7];
                                                    }
                                                    else
                                                    {
                                                        if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[1006])
                                                        {
                                                            _local_2 = GamePredef.MSG_EVENTTEXT_COLOR[7];
                                                        }
                                                        else
                                                        {
                                                            if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_ACHIEVEMENT])
                                                            {
                                                                _local_9 = GameData.d[GamePredef.TBL_ACHIEVEMENT][arguments[2]];
                                                                if (_local_9)
                                                                {
                                                                    _local_2 = GamePredef.MSG_ITEM_COLOR[_local_9.color];
                                                                };
                                                            }
                                                            else
                                                            {
                                                                if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_PET_SOUL])
                                                                {
                                                                    _local_10 = GameData.d[GamePredef.TBL_PET_SOUL][arguments[2]];
                                                                    _local_2 = GamePredef.MSG_ITEM_COLOR[_local_10.color];
                                                                }
                                                                else
                                                                {
                                                                    if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_MEDAL])
                                                                    {
                                                                        _local_11 = GameData.d[GamePredef.TBL_MEDAL][arguments[2]];
                                                                        _local_2 = GamePredef.MSG_ITEM_COLOR[int(_local_11.q)];
                                                                    }
                                                                    else
                                                                    {
                                                                        if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_PET_TALENT])
                                                                        {
                                                                            _local_12 = GameData.d[GamePredef.TBL_PET_TALENT][arguments[2]];
                                                                            _local_2 = GamePredef.MSG_ITEM_COLOR[int(Math.floor((_local_12.sid / 10000)))];
                                                                        }
                                                                        else
                                                                        {
                                                                            if (arguments[1] == GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_RECIPE])
                                                                            {
                                                                                _local_13 = GameData.d[GamePredef.TBL_RECIPE][arguments[2]];
                                                                                _local_14 = ((_local_13) ? int(_local_13.color) : 0);
                                                                                if (((!(_local_14)) || (_local_14 < 0)))
                                                                                {
                                                                                    _local_14 = 0;
                                                                                };
                                                                                _local_2 = GamePredef.MSG_ITEM_COLOR[_local_14];
                                                                            };
                                                                        };
                                                                    };
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if (((int(_local_4) >= 1) && (int(_local_4) <= 6)))
            {
                _local_5 = (((GamePredef.PRE_EQU_NAME[_local_3] + arguments[3]) + "*") + GamePredef.ELEMENT_NAME[_local_4]);
            }
            else
            {
                _local_5 = (GamePredef.PRE_EQU_NAME[_local_3] + arguments[3]);
            };
            var _local_6:* = _local_5;
            if (int(_local_4) >= 7)
            {
                _local_5 = (_local_5 + Language.TEXTUTIL_S[18].replace("{num}", (int(_local_4) - 6)));
            };
            var _local_7:RegExp = /^【(.*)】$/;
            var _local_8:Boolean = _local_7.test(_local_5);
            if (!_local_8)
            {
                _local_6 = (("[" + _local_6) + "]");
            };
            if (arguments[1] == GamePredef.LINK_TYPE_ARRAY["Hongbao"])
            {
                _local_6 = (("[" + Language.RE_PANEL[8]) + "]");
            };
            return (((((((((("<font color='" + _local_2) + "'><a href='event:L_") + arguments[1]) + "|") + arguments[2]) + "|") + _local_5) + "'>") + _local_6) + "</a></font>");
        }

        public static function getMapHtml(_arg_1:int):String
        {
            if (((_arg_1 <= 0) || (!(_arg_1))))
            {
                return ("");
            };
            return (decode((((("[@MA|" + _arg_1) + "|") + GameData.d[GamePredef.TBL_MAP][_arg_1].name) + "|0|0|0] ")));
        }

        public static function encodeChatMsg(_arg_1:int, _arg_2:String):Object
        {
            var _local_6:Array;
            _arg_2 = _arg_2.replace(GamePredef.MSG_EXP_TEXT, "$1");
            _arg_2 = _arg_2.replace(GamePredef.MSG_EXP_BLACK, "$1");
            _arg_2 = _arg_2.replace(GamePredef.MSG_EXP_WHITE, "$1");
            _arg_2 = _arg_2.replace(GamePredef.MSG_EXP_WHITE, "$1");
            if (_arg_2.indexOf("@PET") > 0)
            {
                _arg_2 = _arg_2.replace(/@PET/g, "@pet");
            };
            if (_arg_2.indexOf("@IT") > 0)
            {
                _arg_2 = _arg_2.replace(/@IT/g, "@it");
            };
            if (_arg_2.indexOf("@EQ") > 0)
            {
                _arg_2 = _arg_2.replace(/@EQ/g, "@eq");
            };
            if (_arg_2.indexOf("@HB") > 0)
            {
                _arg_2 = _arg_2.replace(/@HB/g, "@hb");
            };
            var _local_3:RegExp = /(\/w )(.*?) (.*)$/;
            var _local_4:Object = new Object();
            var _local_5:Boolean = _local_3.test(_arg_2);
            if (_local_5 == false)
            {
                _local_4.channelId = _arg_1;
                _local_4.status = GamePredef.MSG_STATUS_TRUE;
                _local_4.type = GamePredef.MSG_TYPE_NORMAL;
                _local_4.sourceId = _core.player.id;
                _local_4.sourceName = _core.player.name;
                _local_4.text = encode(_arg_2);
            }
            else
            {
                if (_local_5 == true)
                {
                    _local_6 = _local_3.exec(_arg_2);
                    _local_4.channelId = -1;
                    _local_4.type = GamePredef.MSG_TYPE_WISPER;
                    _local_4.sourceId = _core.player.id;
                    _local_4.sourceName = _core.player.name;
                    _local_4.targetName = _local_6[2];
                    _local_4.text = encode(_local_6[3]);
                };
            };
            return (_local_4);
        }

        public static function encode(_arg_1:String):String
        {
            var _local_2:RegExp = /<a href=['\"]event:L_(\w{1,8})\|(\d+?)\|(.+?)['\"].+?>(.+?)<\/a>/gi;
            return (_arg_1.replace(_local_2, "[@$1|$2|$3]"));
        }

        public static function decodeChatMsg(_arg_1:Object):String
        {
            var _local_4:String;
            var _local_5:String;
            var _local_6:String;
            var _local_7:Object;
            var _local_8:Object;
            var _local_2:String = new String();
            var _local_3:RegExp = /(<font .+?>)|(<\/font>)/g;
            if (_arg_1.sourceIdType == GamePredef.TBL_CHARACTOR)
            {
                if (_arg_1.type == GamePredef.MSG_TYPE_NORMAL)
                {
                    if (_arg_1.channelId == GamePredef.MSG_CHANNEL_AREA)
                    {
                        _local_2 = decode(_arg_1.text).replace(_local_3, "");
                    }
                    else
                    {
                        if (_arg_1.channelId == GamePredef.MSG_CHANNEL_HEADLINE)
                        {
                            _local_2 = (("<div><font color='" + GamePredef.MSG_CHANNEL_COLOR[10]) + "'>");
                        }
                        else
                        {
                            _local_2 = (("<font color='" + GamePredef.MSG_CHANNEL_COLOR[_arg_1.channelId]) + "'>");
                        };
                        _local_2 = (_local_2 + ((((((((((((((((("<a href='event:L_C|" + _arg_1.channelId) + "'>[") + ArrayUtil.getElement(GamePredef.MSG_CHANNEL, "index", _arg_1.channelId).label) + "]</a>") + GamePredef.PM_CHAT_FLAG[_arg_1.pmLevel]) + "<font color='") + GamePredef.MSG_EVENTTEXT_COLOR[1]) + "'>") + "<a href='event:L_PID|") + _arg_1.sourceId) + "|") + _arg_1.sourceName) + "'>[") + _arg_1.sourceName) + "]</a></font>:") + decode(_arg_1.text)) + "</font>"));
                        if (_arg_1.channelId == GamePredef.MSG_CHANNEL_HEADLINE)
                        {
                            _local_2 = (_local_2 + "</div>");
                        };
                    };
                }
                else
                {
                    if (_arg_1.type == GamePredef.MSG_TYPE_WISPER)
                    {
                        if (_arg_1.sourceId == _core.player.id)
                        {
                            _local_2 = (((((((((((((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[5]) + Language.TEXTUTIL_S[15]) + "<font color='") + GamePredef.MSG_EVENTTEXT_COLOR[1]) + "'>") + "<a href='event:L_PID|") + _arg_1.targetId) + "|") + _arg_1.targetName) + "'>[") + _arg_1.targetName) + Language.TEXTUTIL_S[16]) + decode(_arg_1.text)) + "</font>");
                        }
                        else
                        {
                            if (_arg_1.targetId == _core.player.id)
                            {
                                _local_2 = (((((((((((((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[5]) + Language.TEXTUTIL_S[17]) + "<font color='") + GamePredef.MSG_EVENTTEXT_COLOR[1]) + "'>") + "<a href='event:L_PID|") + _arg_1.sourceId) + "|") + _arg_1.sourceName) + "'>[") + _arg_1.sourceName) + "]</a></font>:") + decode(_arg_1.text)) + "</font>");
                            };
                        };
                    };
                };
            }
            else
            {
                _local_4 = new String();
                _local_5 = new String();
                _local_6 = new String();
                if (_arg_1.sourceIdType == GamePredef.TBL_CREATURE)
                {
                    _local_7 = _core.data.getGameData(GamePredef.TBL_CREATURE, _arg_1.sourceId);
                    if (_local_7)
                    {
                        _local_4 = _local_7.name;
                        _local_5 = "M";
                        _local_6 = GamePredef.MSG_EVENTTEXT_COLOR[3];
                    };
                }
                else
                {
                    if (_arg_1.sourceIdType == GamePredef.TBL_NPC)
                    {
                        _local_4 = _core.getNpcData(_arg_1.sourceId).name;
                        _local_5 = "N";
                        _local_6 = GamePredef.MSG_EVENTTEXT_COLOR[0];
                    }
                    else
                    {
                        if (_arg_1.sourceIdType == GamePredef.TBL_PET)
                        {
                            _local_8 = _core.data.getGameData(GamePredef.TBL_PET, _arg_1.sourceId);
                            if (_local_8)
                            {
                                _local_4 = _local_8.name;
                                _local_5 = "PET";
                                _local_6 = GamePredef.MSG_EVENTTEXT_COLOR[2];
                            };
                        };
                    };
                };
                _local_2 = ((((((((((((((((((((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[_arg_1.channelId]) + "'>") + "<a href='event:L_C|") + _arg_1.channelId) + "'>[") + GamePredef.MSG_CHANNEL[_arg_1.channelId].label) + "]</a>") + "<font color='") + _local_6) + "'>") + "<a href='event:L_") + _local_5) + "|") + _arg_1.sourceId) + "|") + _local_4) + "'>[") + _local_4) + "]</a></font>:") + decode(_arg_1.text)) + "</font>");
            };
            return (_local_2);
        }

        public static function decode(_arg_1:String):String
        {
            var _local_4:RegExp;
            var _local_2:ArrayCollection = new ArrayCollection();
            _local_2.addItem({
                "pid":ViewManager.PANEL_CHARACTOR,
                "name":Language.TEXTUTIL_S[0]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_BAG,
                "name":Language.TEXTUTIL_S[1]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_GUILD,
                "name":Language.TEXTUTIL_S[2]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_QUESTMANAGER,
                "name":Language.TEXTUTIL_S[3]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_IM,
                "name":Language.TEXTUTIL_S[4]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_PETMANAGER,
                "name":Language.TEXTUTIL_S[5]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_SKILLMANAGER,
                "name":Language.TEXTUTIL_S[6]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_MAP,
                "name":Language.TEXTUTIL_S[7]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_GUILD,
                "name":Language.TEXTUTIL_S[9]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_HELP,
                "name":Language.TEXTUTIL_S[10]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_SYSTEM,
                "name":Language.TEXTUTIL_S[11]
            });
            _local_2.addItem({
                "pid":ViewManager.POPU_WORLDMAP,
                "name":Language.TEXTUTIL_S[12]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_SYSTEM_SHOP,
                "name":Language.TEXTUTIL_S[13]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_BATTLESET,
                "name":Language.TEXTUTIL_S[14]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_MARRIAGE,
                "name":Language.TEXTUTIL_S[19]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_GAMEINTRO,
                "name":Language.TEXTUTIL_S[20]
            });
            _local_2.addItem({
                "pid":ViewManager.PANEL_ASTROLOGIC,
                "name":Language.TEXTUTIL_S[21]
            });
            if (_arg_1 == null)
            {
                return ("");
            };
            var _local_3:RegExp = /\[@([A-Z]+?)\|(\d*?)\|(.+?)\|(.+?)\|(.+?)\|(.+?)\]/g;
            var _local_5:String = _arg_1.replace(_local_3, decodeOut);
            var _local_6:int;
            while (_local_6 < _local_2.length)
            {
                _local_4 = new RegExp((("\\[" + _local_2[_local_6].name) + "\\]"), "g");
                if (_local_5.match(_local_4).length > 0)
                {
                    _local_5 = _local_5.replace(_local_4, (((((("<font color='#00ff00'><a href='event:L_P|" + _local_2[_local_6].pid) + "|") + _local_2[_local_6].name) + "'>[") + _local_2[_local_6].name) + "]</a></font>"));
                };
                _local_6++;
            };
            return (_local_5);
        }

        public static function getCodeByTypeId(_arg_1:int, _arg_2:Number):String
        {
            var _local_3:Object = _core.data.getData(_arg_1, _arg_2);
            var _local_4:* = "";
            var _local_5:int;
            if (_local_3)
            {
                if (_local_3.name)
                {
                    _local_4 = _local_3.name;
                };
                if (_local_3.color)
                {
                    _local_5 = _local_3.color;
                };
            };
            return (((((((("[@" + GamePredef.LINK_TYPE_ARRAY[_arg_1]) + "|") + _arg_2) + "|") + _local_4) + "|") + _local_5) + "|0|0]");
        }


    }
}//package com.qeedoo.game.utils

