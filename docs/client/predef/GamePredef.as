// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.predef.GamePredef

package com.qeedoo.game.predef
{
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.config.Version;
    import flash.geom.ColorTransform;
    import flash.filters.BitmapFilter;
    import flash.filters.GlowFilter;
    import flash.filters.BitmapFilterQuality;
    import flash.filters.DropShadowFilter;
    import flash.filters.ColorMatrixFilter;
    import mx.controls.Alert;
    import flash.net.URLRequest;
    import flash.net.URLStream;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.net.SharedObject;

    public class GamePredef 
    {

        public static const SP_CNC:String = "cnc";
        public static const SP_TEL:String = "tel";
        public static var DOMAIN_IN_LIST:Boolean = false;
        public static var ipList:Array = new Array();
        public static var dnsConfig:XML = null;
        public static var bbsurl:String;
        public static var HASH_RES:Boolean = true;
        public static var DEBUG_MODE:Boolean = false;
        public static var CONFIG_EDITMODE:Boolean = false;
        public static var GROUP_FOLLOW_DISTANCE:int = 45;
        public static var GROUP_FOLLOW_DISTANCE_FLYING:int = 120;
        public static var GROUP_PET_FOLLOW_DISTANCE:int = 100;
        public static var MAX_LEVEL:int = 160;
        public static var MAX_LEVEL_REBIRTH:int = 160;
        public static var FORCE_SESSION:Boolean = false;
        public static var SERVER_NAME:String = "";
        public static var GLOBAL_SETTING:Object = {};
        public static var msg_button:String = "BtnChatDQ";
        public static var msg_chanel:String = "Btn02";
        public static const MSG_CHANNEL:Array = [{
            "index":0,
            "label":Language.GAMEPREDEF_S[4],
            "styleName":"BtnChatDQ",
            "selected":true,
            "selectable":false
        }, {
            "index":1,
            "label":Language.GAMEPREDEF_S[5],
            "styleName":"BtnChatSJ",
            "selected":true,
            "selectable":false
        }, {
            "index":2,
            "label":Language.GAMEPREDEF_S[6],
            "styleName":"BtnChatGH",
            "selected":true,
            "selectable":false
        }, {
            "index":3,
            "label":Language.GAMEPREDEF_S[7],
            "styleName":"BtnChatDW",
            "selected":true,
            "selectable":false
        }, {
            "index":MSG_CHANNEL_HEADLINE,
            "label":Language.SYSTEMBARCANVAS_U[6],
            "styleName":"BtnChatHeadline",
            "selected":true,
            "selectable":false
        }];
        public static const PATH_PROFILE_ROOT:String = "profile/";
        public static const PATH_CONFIG:String = ((PATH_PROFILE_ROOT + "config.xml?v=") + Version.VERSION);
        public static const PATH_GCONFIG:String = ((PATH_PROFILE_ROOT + "gameConfig.xml?v=") + Version.VERSION);
        public static const PATH_HELP:String = ((PATH_PROFILE_ROOT + "help.xml?v=") + Version.VERSION);
        public static const PATH_INFO:String = ((PATH_PROFILE_ROOT + "info.html?v=") + Version.VERSION);
        public static const PATH_SYSINFO:String = ((PATH_PROFILE_ROOT + "info.html?v=") + Version.VERSION);
        public static const PATH_ACTIVITY:String = (PATH_PROFILE_ROOT + "activity.xml");
        public static const PATH_ASSETS:String = (PATH_PROFILE_ROOT + "assets.txt");
        public static const PATH_ACTIVITY_NOTICE:String = (PATH_PROFILE_ROOT + "notice.html");
        public static const PATH_EVENT_TOOLTIP:String = "config/event_tooltip.xml";
        public static const EVENT_TOOLTIP_CONFIG:Class = GamePredef_EVENT_TOOLTIP_CONFIG;
        public static const CONNECT_BY_DOMAIN:int = 0;
        public static const CONNECT_BY_CNC:int = 1;
        public static const CONNECT_BY_CH_TELCOM:int = 2;
        public static var CONNECT_METHOD:int = CONNECT_BY_DOMAIN;//0
        public static var MASTER_DOMAIN:String;
        public static const SERVER_PROTOCOL_LOGIN:String = "http://";
        public static const SERVER_PROTOCAL_LOGIC:String = "rtmpe://";
        public static const SERVER_PROTOCAL_LOGIC2:String = "rtmpte://";
        public static const SERVER_APP_GLOBAL:String = "tcn";
        public static const SERVER_APP_SCENE:String = "scene";
        public static var SERVER_PORT_AND_PATH:String = "";
        public static var SERVER_ADD_RES:String = "http://s.lezi.com/mc/";
        public static var SERVER_ADD_GLOBAL:String = "rtmpe://localhost:1935/tcn/";
        public static var SERVER_ADD_GLO:String = "localhost:1935/tcn/";
        public static var SERVER_ADD_REG:String = "#";
        public static var SERVER_ADD_PAY:String = "#";
        public static var SERVER_ADD_GUIDE:String = "";
        public static var SERVER_ADD_FESTIVAL:String = "";
        public static var SERVER_ADD_ACTIVE:String = "";
        public static var SERVER_ADD_CLASSIFY:String = "#";
        public static var SERVER_ADD_SDO:String = "http://s.qeedoo.com/mcsdo";
        public static var SERVER_ISACTING:Boolean = false;
        public static var SHOP_HIDE_LIST:Object = new Object();
        public static var SERVER_JUMP_IFEXIST:String = "";
        public static var BATTLE_REPLAY_URL:String = "";
        public static var SERVER_ADD_PROXY:String = "";
        public static var SERVER_USE_PROXYSERVER:Boolean = false;
        public static var PANEL_WELFARE_VISIBLE:Boolean = false;
        public static var SERVER_LIST:XMLList;
        public static var LINE_LIST:XMLList;
        public static var DEFAULT_CRE_RES_URL:String = "resource/creature/PC_MALE_100000.swf";
        public static var DEFAULT_IMG_LOGIN:String = "resource/ui/login.swf";
        public static var DEFAULT_IMG_LOGIN1:String = "resource/ui/login1.swf";
        public static var DEFAULT_IMG_BATTLE:String = "resource/ui/UI_LOADING_BACK.swf";
        public static var RES_WORLD_MAP_1:String = "resource/ui/WorldMap1.jpg";
        public static var RES_WORLD_MAP_2:String = "resource/ui/WorldMap2.jpg";
        public static var RES_STATE_ICONS:String = "resource/ui/SkinStateIcons.swf";
        public static var RES_MAGIC_TOTEM:String = "resource/ui/SkinMagicTotem.swf";
        public static var RES_LOTTO:String = "resource/ui/SkinLotto.swf";
        public static var RES_CHFIELDS:String = "resource/ui/ChFields.swf";
        public static var RES_SOUND:String = "resource/sound/Assound.swf";
        public static var RES_FARM_BG:String = "resource/ui/MagicFarm.jpg";
        public static var RES_STARRY_SKY:String = "resource/ui/starrySky.jpg";
        public static var PET_SOUL_BG:String = "resource/ui/soulBG.jpg";
        public static var IS_TEST_CLIENT:Boolean = false;
        public static var APP_WIDTH:int = 900;
        public static var APP_HEIGHT:int = 570;
        public static var APP_HALF_WIDTH:int = 450;
        public static var APP_HALF_HEIGHT:int = 285;
        public static var APP_WIDTH_OLD:int = 900;
        public static var APP_HEIGHT_OLD:int = 570;
        public static var ST_CORE_NORMAL:uint = 1;
        public static var ST_CORE_BATTLE:uint = 2;
        public static var ST_CMD_ATTACK:uint = 1;
        public static var ST_CMD_SKILL:uint = 1;
        public static const PROP_STR:String = Language.GAMEPREDEF_S[8];
        public static const PROP_AGI:String = Language.GAMEPREDEF_S[9];
        public static const PROP_STA:String = Language.GAMEPREDEF_S[10];
        public static const PROP_INT:String = Language.GAMEPREDEF_S[11];
        public static const PROP_SPR:String = Language.GAMEPREDEF_S[12];
        public static const AADPROPCHECK:String = Language.GAMEPREDEF_S[369];
        public static var ST_NORMAL:uint = 1;
        public static var ST_RUNNING:uint = 2;
        public static var ST_SHOPPING:uint = 3;
        public static var ST_TRADE:uint = 4;
        public static var ST_BATTLE:uint = 5;
        public static var ST_LEVELUP:uint = 6;
        public static var ST_CHANGING_MAP:uint = 7;
        public static var ST_MAKE:uint = 8;
        public static var ST_BANK:uint = 9;
        public static var ST_MAIL:uint = 10;
        public static var ST_AUCTION:uint = 11;
        public static var ST_CHAPANEL:uint = 12;
        public static var ST_PRODUCT:uint = 13;
        public static var ST_WATCH:uint = 14;
        public static var ST_BUSY:uint = 15;
        public static var ST_HANGUP:uint = 16;
        public static var ST_VIP3:uint = 17;
        public static var ST_VIP4:uint = 18;
        public static var ST_VIP5:uint = 19;
        public static var ST_VIP6:uint = 20;
        public static var ST_VIP7:uint = 21;
        public static var ST_F1:uint = 22;
        public static var ST_F2:uint = 23;
        public static var ST_F3:uint = 24;
        public static var ST_F4:uint = 25;
        public static var ST_FISHING:uint = 26;
        public static var ST_HARVEST:uint = 27;
        public static var ST_HERB:uint = 28;
        public static var ST_DF1:uint = 29;
        public static var ST_DF2:uint = 30;
        public static var ST_DF3:uint = 31;
        public static const ST_COMMON_PROGRESS:uint = 32;
        public static const ST_GATHER1:uint = 33;
        public static const ST_GATHER2:uint = 34;
        public static var ST_RICH:uint = 1000;
        public static var ST_LIGHT_WUYO:uint = 1001;
        public static var ST_GODDESS_BLESS:uint = 1002;
        public static var ST_UNDYING_BIRD:uint = 1003;
        public static var ST_ANGRY_SOUL:uint = 1004;
        public static var ST_MOLI_BABY_1:uint = 1005;
        public static var ST_MOLI_BABY_2:uint = 1006;
        public static var ST_MOLI_BABY_3:uint = 1007;
        public static var ST_MOLI_MAN_1:uint = 1008;
        public static var ST_MOLI_MAN_2:uint = 1009;
        public static var ST_MOLI_MAN_3:uint = 1010;
        public static var ST_PC:uint = 258;
        public static var ST_ACADEMIC_SUCCESS:uint = 1011;
        public static const ST_MOLI_SCHOLAR:int = 1012;
        public static const ST_REVENGE_SOUL:int = 1013;
        public static const ST_PK_WINNER:int = 1014;
        public static const ST_PK_WINNER_MALE:int = 1015;
        public static const ST_PK_WINNER_FEMALE:int = 1016;
        public static const ST_CROSS_PK_A:int = 1017;
        public static const ST_CROSS_PK_B:int = 1018;
        public static const ST_CROSS_PK_C:int = 1019;
        public static const ST_CROSS_PK_D:int = 1020;
        public static const ST_SHOWTIME_A:int = 1021;
        public static const ST_SHOWTIME_B:int = 1022;
        public static const ST_SHOWTIME_C:int = 1023;
        public static const ST_SHOWTIME_D:int = 0x0400;
        public static const ST_ZHONGQIU2019:int = 1025;
        public static const ST_TRIPLE_TOWN_TOP:int = 2001;
        public static const ST_TRIPLE_TOWN_LEFT:int = 2002;
        public static const ST_TRIPLE_TOWN_BOTTOM:int = 2003;
        public static const ST_TRIPLE_TOWN_RIGHT:int = 2004;
        public static const ST_TRIPLE_TOWN_DOUBLE:int = 2005;
        public static const ST_TRIPLE_TOWN_BOMB:int = 2006;
        public static const ST_MOLI_2020_1:int = 2007;
        public static const ST_MOLI_2020_2:int = 2008;
        public static const ST_MOLI_2020_3:int = 2009;
        public static const ST_XCDS_1:int = 2010;
        public static const ST_XCDS_2:int = 2011;
        public static const ST_XCDS_3:int = 2012;
        public static const ST_YSXG_1:int = 2013;
        public static const ST_ML_12:int = 2014;
        public static const ST_TXKC:int = 2015;
        public static const ST_QL_2101:int = 2016;
        public static const ST_QL_2102:int = 2017;
        public static const ST_QL_2103:int = 2018;
        public static const ST_XZ_2201:int = 2019;
        public static const ST_XZ_2207:int = 2020;
        public static const ST_BUYER_2208:int = 2021;
        public static const ST_BUYER_2212:int = 2022;
        public static const ST_CHUNRIHUAKAI:int = 2023;
        public static const ST_TONGXINTONGQU:int = 2024;
        public static const ST_WSJ2301:int = 2025;
        public static const ST_WSJ2302:int = 2026;
        public static const ST_MCZDTITLE1:int = 2027;
        public static const ST_MCZDTITLE2:int = 2028;
        public static const ST_MCZDTITLE3:int = 2029;
        public static const ST_LOVER20241:int = 2030;
        public static const ST_LOVER20242:int = 2031;
        public static const ST_LOVER20243:int = 2032;
        public static const ST_SIXIANGSHOUHU:int = 2033;
        public static const ST_MITANGZHILIAN:int = 2034;
        public static const ST_NUANXIANGZUIREN:int = 2035;
        public static const ST_CHAOJIBIANJU:int = 2036;
        public static const ST_ZUIJIABIANDAO:int = 2037;
        public static const ST_MOLIQILV:int = 2038;
        public static const ST_XINGGUANGCUICAN:int = 2039;
        public static const ST_XIUCHANGJIAODIAN:int = 2040;
        public static const ST_MEILIWUTAI:int = 2041;
        public static const ST_FENGSHANGZHIXING:int = 2042;
        public static const ST_SHENSHENGHUIGUANG:int = 2043;
        public static const ST_QIQUWANJIA:int = 2044;
        public static const ST_MOLIZHUIGUANG:int = 2045;
        public static var ST_TEXT:Object = {};
        public static var ST_BATTLE_EXEC:uint = 400;
        public static var ST_BATTLE_ATTACK:uint = 410;
        public static var ST_BATTLE_SKILL:uint = 420;
        public static var ST_BATTLE_ITEM:uint = 425;
        public static var ST_BATTLE_CATCH:uint = 430;
        public static var ST_BATTLE_WAIT:uint = 440;
        public static var ST_BATTLE_PET:uint = 450;
        public static var ST_ITEM_NORMAL:uint = 1400;
        public static var ST_ITEM_DIVIDE:uint = 1430;
        public static var ST_ITEM_EQUPT:uint = 1450;
        public static var ST_ITEM_DRAG:uint = 1460;
        public static var BS_HURT_HP:String = "hHp";
        public static var BS_HURT_MP:String = "hMp";
        public static var BS_HURT_SP:String = "hSp";
        public static var BS_HURT_SHAR:String = "hSh";
        public static var BS_CRI:String = "cri";
        public static var BS_RECOVER_HP:String = "rHp";
        public static var BS_RECOVER_HP_MAX:* = "rHpMax";
        public static var BS_RECOVER_MP:String = "rMp";
        public static var BS_RECOVER_SP:String = "rSp";
        public static var BS_HURT_HP_CRI:String = "hHpCri";
        public static var BS_HURT_MP_CRI:String = "hMpCri";
        public static var BS_HURT_SP_CRI:String = "hSpCri";
        public static var BS_RECOVER_HP_CRI:String = "rHpCri";
        public static var BS_RECOVER_MP_CRI:String = "rMpCri";
        public static var BS_RECOVER_SP_CRI:String = "rSpCri";
        public static var BS_USE_HP:String = "uHp";
        public static var BS_USE_MP:String = "uMp";
        public static var BS_USE_SP:String = "uSp";
        public static var BS_FACETO:String = "faceTo";
        public static var BS_FRONT_EFFECT:String = "frontEff";
        public static var BS_ATTACK_EFFECT:String = "attackEff";
        public static var BS_SKILL_EFFECT:String = "skillEff";
        public static var BS_BUFF_EFFECT:String = "buffEff";
        public static var BS_BACK_EFFECT:String = "backEff";
        public static var BS_STATUS:String = "status";
        public static var BS_SKILL:String = "skill";
        public static var BS_BULLET:String = "bullet";
        public static var BS_SAY:String = "say";
        public static var BS_HINT:String = "hint";
        public static var BS_BUFF_ADD:String = "buffAdd";
        public static var BS_BUFF_DEL:String = "buffDel";
        public static var BS_BUFF_CLEAR:String = "buffClear";
        public static var BS_GLOBAL_FRONT_EFFECT:String = "gfe";
        public static var BS_GLOBAL_BACK_EFFECT:String = "gbe";
        public static var BS_EXP_BATTLE:String = "expBattle";
        public static var BS_RECOVER_TARGET_MP:String = "rtMp";
        public static var BS_BUFF_COL_DEL:String = "buffColDel";
        public static var BS_RECOVER_TARGET_HP:String = "rtHp";
        public static var BS_RECOVER_TARGET_SP:String = "rtSp";
        public static var BS_REBORN:String = "reborn";
        public static var BS_CATCH_FAILED:String = "catchF";
        public static const BS_DEFY:String = "defy";
        public static var NPC_TYPE_QUEST:int = 1;
        public static var NPC_TYPE_SHOP:int = 2;
        public static var NPC_TYPE_MAIL:int = 3;
        public static var NPC_TYPE_PLAN:int = 4;
        public static var NPC_TYPE_AUCTION:int = 5;
        public static var NPC_TYPE_SKILL:int = 6;
        public static var NPC_TYPE_BANK:int = 7;
        public static var NPC_TYPE_HEAL:int = 8;
        public static var NPC_TYPE_TRANSPORT:int = 9;
        public static var NPC_TYPE_BATTLE:int = 10;
        public static var NPC_TYPE_CLASSQUEST:int = 11;
        public static var NPC_TYPE_MAT:int = 12;
        public static var NPC_TYPE_CALLBOARD:int = 13;
        public static var NPC_TYPE_ANSWER:int = 14;
        public static var NPC_TYPE_BOSS:int = 15;
        public static var NPC_TYPE_TUTOR:int = 16;
        public static var NPC_TYPE_GUILD:int = 17;
        public static var NPC_TYPE_BUILD:int = 18;
        public static var NPC_TYPE_FISH_POOL:int = 21;
        public static var NPC_TYPE_PLANT:int = 22;
        public static var NPC_TYPE_HERB:int = 23;
        public static var NPC_TYPE_GATHER:int = 24;
        public static var NPC_TYPE_WALK:int = 25;
        public static var NPC_TYPE_SYNCHRO:int = 26;
        public static var NPC_TYPE_HULA:int = 27;
        public static var NPC_TYPE_DOTA:int = 28;
        public static var NPC_TYPE_TRIPLE_TOWN:int = 29;
        public static var NPC_TYPE_NAME:Array = [];
        public static var ST_QUEST_ENOUGHLEVEL:int = 101;
        public static var ST_QUEST_CANTAKE:int = 102;
        public static var ST_QUEST_ISTAKE:int = 103;
        public static var ST_QUEST_CANFINISH:int = 104;
        public static var QUEST_PRE_ITEM:int = 1;
        public static var QUEST_PRE_QUEST:int = 2;
        public static var QUEST_REQUIRE_ITEM:int = 1;
        public static var QUEST_REQUIRE_CREATUR:int = 2;
        public static var QUEST_REQUIRE_PET:int = 3;
        public static var QUEST_AWARD_ITEM:int = 1;
        public static var QUEST_AWARD_PET:int = 2;
        public static var QUEST_AWARD_SKILL:int = 3;
        public static var QUEST_TYPE_NEWHAND:int = 1;
        public static var QUEST_TYPE_MAIN:int = 2;
        public static var QUEST_TYPE_CLASS:int = 3;
        public static var QUEST_TYPE_WORLD:int = 4;
        public static var QUEST_TYPE_BUSINESS:int = 5;
        public static var QUEST_TYPE_ACTIVITY:int = 6;
        public static var QUEST_TYPE_LOOP:int = 7;
        public static var QUEST_TYPE_CHALLENGE:int = 8;
        public static var QUEST_TYPE_CALLBOARD:int = 9;
        public static var QUEST_TYPE_GROWUP:int = 10;
        public static var QUEST_TYPE_GUILD:int = 11;
        public static var QUEST_TYPE_LUCKY:int = 12;
        public static const LOOP_TYPE_GUILD:int = 2;
        public static const LOOP_TYPE_VALENTINE:int = 3;
        public static const LOOP_TYPE_THIEF:int = 4;
        public static const LOOP_TYPE_PET:int = 5;
        public static const LOOP_TYPE_PRACTICE:int = 6;
        public static const LOOP_TYPE_SPIRITUALITY:int = 7;
        public static const LOOP_TYPE_SPIRIT_FESTIVAL:int = 8;
        public static const LOOP_TYPE_TWO_HUNDRED:int = 9;
        public static const LOOP_TYPE_EVIL:int = 16;
        public static var QUEST_TYPE_NAME:Object = {};
        public static var QUEST_TYPE_APPR:Object = {};
        public static const QUEST_SUB_TYPE_APPR:Object = {};
        public static const DUPLICATE_TASK_IDS:Object = {
            "1457":true,
            "1458":true,
            "1459":true,
            "1460":true,
            "1461":true,
            "1462":true,
            "1463":true,
            "5418":true,
            "5240":true,
            "5241":true,
            "5242":true,
            "5243":true,
            "3813":true,
            "3814":true,
            "3815":true,
            "3816":true,
            "3817":true,
            "3818":true,
            "3820":true,
            "3821":true,
            "5185":true,
            "5186":true,
            "5187":true,
            "5188":true,
            "3986":true,
            "3987":true,
            "3988":true,
            "3989":true,
            "3990":true,
            "3991":true,
            "3992":true,
            "5448":true,
            "5449":true,
            "5450":true,
            "5451":true,
            "5452":true
        };
        public static var RES_URL_WORD1_NONE:uint = 10;
        public static var RES_URL_WORD1_SCENE:uint = 15;
        public static var RES_URL_WORD1_SITEM:uint = 20;
        public static var RES_URL_WORD1_ITEM:uint = 30;
        public static var RES_URL_WORD1_TILE:uint = 40;
        public static var RES_URL_WORD1_PC:uint = 50;
        public static var RES_URL_WORD1_NPC:uint = 60;
        public static var RES_URL_WORD1_EQUIP:uint = 70;
        public static var RES_URL_WORD1_EFF:uint = 80;
        public static var RES_URL_WORD1_WAV:uint = 90;
        public static var RES_URL_WORD1_BLT:uint = 100;
        public static var RES_URL_WORD1_EM:uint = 110;
        public static var RES_URL_WORD1_ST:uint = 120;
        public static var RES_URL_WORD1_UI:uint = 130;
        public static var RES_URL_WORD1_SKILL:uint = 140;
        public static var RES_URL_FOLDER:Array = [];
        public static var RES_URL_WORD1:Array = [];
        public static var RES_URL_WORD1TOCODE:Object = {};
        public static var RES_URL_WORD2_NONE:uint = 10;
        public static var RES_URL_WORD2_FOLDER:uint = 15;
        public static var RES_URL_WORD2_FLOWER:uint = 16;
        public static var RES_URL_WORD2_TREE:uint = 20;
        public static var RES_URL_WORD2_HOUSE:uint = 30;
        public static var RES_URL_WORD2_SPAWN:uint = 40;
        public static var RES_URL_WORD2_DESERT:uint = 50;
        public static var RES_URL_WORD2_FOREST:uint = 60;
        public static var RES_URL_WORD2_MALE:uint = 70;
        public static var RES_URL_WORD2_FEMALE:uint = 80;
        public static var RES_URL_WORD2_FUNC:uint = 90;
        public static var RES_URL_WORD2_CRE:uint = 100;
        public static var RES_URL_WORD2_WEAPON:uint = 110;
        public static var RES_URL_WORD2_SCENE:uint = 120;
        public static var RES_URL_WORD2_PLAYER:uint = 130;
        public static var RES_URL_WORD2_SIDE:uint = 140;
        public static var RES_URL_WORD2_SCREEN:uint = 150;
        public static var RES_URL_WORD2_NPC:uint = 160;
        public static var RES_URL_WORD2_UI:uint = 170;
        public static var RES_URL_WORD2_EFF:uint = 180;
        public static var RES_URL_WORD2_FIRE:uint = 190;
        public static var RES_URL_WORD2_NORMAL:uint = 200;
        public static var RES_URL_WORD2_LOCAL:uint = 210;
        public static var RES_URL_WORD2_GLOBAL:uint = 220;
        public static var RES_URL_WORD2_STAGE:uint = 230;
        public static var RES_URL_WORD2_BATTLE:uint = 240;
        public static var RES_URL_WORD2_LOADING:uint = 250;
        public static var RES_URL_WORD2_FC1:uint = 260;
        public static var RES_URL_WORD2_FC2:uint = 270;
        public static var RES_URL_WORD2_FC3:uint = 280;
        public static var RES_URL_WORD2_FC4:uint = 290;
        public static var RES_URL_WORD2_FC5:uint = 300;
        public static var RES_URL_WORD2_FC6:uint = 310;
        public static var RES_URL_WORD2_MC1:uint = 320;
        public static var RES_URL_WORD2_MC2:uint = 330;
        public static var RES_URL_WORD2_MC3:uint = 340;
        public static var RES_URL_WORD2_MC4:uint = 350;
        public static var RES_URL_WORD2_MC5:uint = 360;
        public static var RES_URL_WORD2_MC6:uint = 370;
        public static var RES_URL_WORD2_FLY:uint = 380;
        public static var RES_URL_WORD2_WING:uint = 390;
        public static var RES_URL_WORD2:Array = [];
        public static var RES_URL_WORD2TOCODE:Object = {};
        public static var RES_URL_EXT_NONE:uint = 1;
        public static var RES_URL_EXT_SWF:uint = 2;
        public static var RES_URL_EXT_JPG:uint = 3;
        public static var RES_URL_EXT_PNG:uint = 4;
        public static var RES_URL_EXT_WAV:uint = 5;
        public static var RES_URL_EXT_MP3:uint = 6;
        public static var RES_URL_EXT_OGG:uint = 7;
        public static var RES_URL_EXT:Array = [];
        public static var RES_URL_EXTTOCODE:Object = {};
        public static var TEXT_SELF:RegExp = /@P\d+/sg;
        public static var TEXT_ITEM:RegExp = /@I\d+/sg;
        public static var TEXT_TEMPALTE:RegExp = /@T\d+/sg;
        public static var TEXT_NPC:RegExp = /@N\d+/sg;
        public static var TEXT_CREATURE:RegExp = /@C\d+/sg;
        public static var TEXT_SKILL:RegExp = /@S\d+/sg;
        public static var TEXT_LABEL:RegExp = /%(\d+)/sg;
        public static var NPC_QUEST_TEXT_SPLIT:RegExp = /%(\d+){(.*?)}/sg;
        public static var NPC_QUEST_TEXT_SPLIT_NPC:RegExp = /\[.*?\]/sg;
        public static var NPC_QUEST_TEXT_SPLIT_PLAYER:RegExp = /\(.*?\)/sg;
        public static var NPC_QUEST_TEXT_GOTO:RegExp = /goto \d+/sg;
        public static var NPC_QUEST_TEXT_FINISH:RegExp = /task \d+/sg;
        public static var NPC_QUEST_TEXT_CLOSE:RegExp = /close/sg;
        public static const TBL_ACCOUNT:uint = 0;
        public static const TBL_AUCTION:uint = 1;
        public static const TBL_CHARACTOR:uint = 2;
        public static const TBL_CHARACTOR_BUFF:uint = 3;
        public static const TBL_CHARACTOR_INTERFACE:uint = 4;
        public static const TBL_CHARACTOR_MAP:uint = 5;
        public static const TBL_CHARACTOR_PLAN_TYPE:uint = 6;
        public static const TBL_CHARACTOR_QUEST:uint = 7;
        public static const TBL_CHARACTOR_SKILL:uint = 8;
        public static const TBL_CHARACTOR_SLOT:uint = 9;
        public static const TBL_CHARACTOR_TITLE:uint = 10;
        public static const TBL_CLASS:uint = 11;
        public static const TBL_CREATURE:uint = 12;
        public static const TBL_CREATURE_LOOT:uint = 13;
        public static const TBL_CREATURE_SKILL:uint = 14;
        public static const TBL_CRE_POINT:uint = 15;
        public static const TBL_ELEMENT_TEMPLATE:uint = 16;
        public static const TBL_ELEMENT_JEWEL:uint = 17;
        public static const TBL_EQUIPT_INSTANCE:uint = 18;
        public static const TBL_EQUIPT_TEMPLATE:uint = 19;
        public static const TBL_EQUIPT_JEWEL:uint = 20;
        public static const TBL_EQUIPT_TYPE:uint = 21;
        public static const TBL_FEEDBACK:uint = 22;
        public static const TBL_GUILD:uint = 23;
        public static const TBL_GUILD_MAP:uint = 24;
        public static const TBL_GUILD_MEMBER:uint = 25;
        public static const TBL_GUILD_RANK:uint = 26;
        public static const TBL_GUILD_SLOT:uint = 27;
        public static const TBL_ITEM_INSTANCE:uint = 28;
        public static const TBL_ITEM_TEMPLATE:uint = 29;
        public static const TBL_JEWEL_INSTANCE:uint = 30;
        public static const TBL_JEWEL_TEMPLATE:uint = 31;
        public static const TBL_MAIL:uint = 32;
        public static const TBL_MAP:uint = 33;
        public static const TBL_MAP_CREATURE:uint = 34;
        public static const TBL_NPC:uint = 35;
        public static const TBL_NPC_CREATURE:uint = 36;
        public static const TBL_NPC_QUEST:uint = 37;
        public static const TBL_NPC_SKILL:uint = 38;
        public static const TBL_PET:uint = 39;
        public static const TBL_PET_SKILL:uint = 40;
        public static const TBL_PET_SLOT:uint = 41;
        public static const TBL_PLAN:uint = 42;
        public static const TBL_PLAN_AWARD:uint = 43;
        public static const TBL_PLAN_REQUIRE:uint = 44;
        public static const TBL_QUEST:uint = 45;
        public static const TBL_QUEST_AWARD:uint = 46;
        public static const TBL_QUEST_REQUIRE:uint = 47;
        public static const TBL_RELATIONSHIP:uint = 48;
        public static const TBL_SCENEITEM_INSTANCE:uint = 49;
        public static const TBL_SCENEITEM_TEMPLATE:uint = 50;
        public static const TBL_SHOP_SLOT:uint = 51;
        public static const TBL_SKILL:uint = 52;
        public static const TBL_SHOP:uint = 53;
        public static const TBL_SKILL_EXPAND:uint = 54;
        public static const TBL_SKILL_KIND:uint = 55;
        public static const TBL_SKILL_POOL:uint = 56;
        public static const TBL_SKILL_TYPE:uint = 57;
        public static const TBL_QUEST_LOOP:uint = 58;
        public static const TBL_TITLE:uint = 59;
        public static const TBL_MAP_CELL:uint = 60;
        public static const TBL_ANSWER:uint = 61;
        public static const TBL_PLAN_KIND:uint = 62;
        public static const TBL_NPC_PLAN:uint = 63;
        public static const TBL_QUEST_PRE:uint = 64;
        public static const TBL_CHARACTOR_QUEST_KILL:uint = 65;
        public static const TBL_BUFF:uint = 66;
        public static const TBL_FEAST:uint = 67;
        public static const TBL_BUILDING:uint = 70;
        public static const TBL_EXTEND_POSITION:uint = 71;
        public static const TBL_EQUIPT_SUIT:uint = 73;
        public static const TBL_ACHIEVEMENT:uint = 74;
        public static const TBL_ACHIEVEMENT_REQUIRE:uint = 75;
        public static const TBL_WEDDING_BOOK:uint = 77;
        public static const TBL_COUPLE:uint = 78;
        public static const TBL_GUIDE:uint = 79;
        public static const TBL_NAME_LIB:uint = 80;
        public static const TBL_MARRIAGE:uint = 76;
        public static const TBL_POS:uint = 72;
        public static const TBL_PETFIGHT:uint = 81;
        public static const TBL_FARM:uint = 82;
        public static const TBL_MINERAL_TEMPLATE:uint = 83;
        public static const TBL_BATTLE_REPORT:uint = 84;
        public static const TBL_DIARY:uint = 85;
        public static const TBL_FAIRY_TEMPALTE:uint = 86;
        public static const TBL_FAIRY:uint = 87;
        public static const TBL_STARS_TEMPLATE:uint = 88;
        public static const TBL_WAR_MAP:uint = 89;
        public static const TBL_PET_SOUL:uint = 94;
        public static const TBL_PM_RIGHT:uint = 95;
        public static const TBL_MOUNT:uint = 96;
        public static const TBL_MOUNT_DRESS:uint = 97;
        public static const TBL_MEDAL:uint = 98;
        public static const TBL_MAZE:uint = 99;
        public static const TBL_CREATURE_HANDBOOK:uint = 100;
        public static const TBL_PET_TALENT:uint = 101;
        public static const TBL_ARTIFACT:uint = 102;
        public static const TBL_DRESS:uint = 104;
        public static const TBL_RECIPE:uint = 105;
        public static const TBL_RECIPE_PLAN:uint = 106;
        public static const TBL_CREDIT:uint = 107;
        public static const TBL_SUBLIMATION:uint = 108;
        public static const TBL_SUBLIMATION_PET:uint = 112;
        public static const TBL_AWAKENING:uint = 113;
        public static const TBL_AWAKENING_SKILL:uint = 114;
        public static const TBL_RECYCLING:uint = 115;
        public static const TBL_SOUL:uint = 116;
        public static const TBL_PET_CONTRACT:uint = 117;
        public static const TBL_DECO_HOLE:uint = 118;
        public static const TBL_DECO_RUNE:uint = 119;
        public static const TBL_DECO_SHOW:uint = 120;
        public static const TBL_DECORATE:uint = 121;
        public static const TBL_MYSTRE_RECIPE:uint = 122;
        public static const TBL_MYSTRE:uint = 123;
        public static const TBL_RUNE_CHIP:uint = 124;
        public static const TBL_PRS_TREE:uint = 125;
        public static const TBL_PRS_SHOW:uint = 126;
        public static const TBL_PRS_CHIP:uint = 127;
        public static const TBL_MEVENT_MAP:uint = 128;
        public static const TBL_MEVENT_TYPE:uint = 129;
        public static const TBL_WAR_SPRITE:uint = 130;
        public static const TBL_CREATUREH_HEART:uint = 131;
        public static const TBL_CREATUREH_COMBINE:uint = 132;
        public static const TBL_CREATUREH_CONTAIN:uint = 133;
        public static const TBL_CREATUREH_POINT:uint = 134;
        public static const TBL_PET_GUARD:uint = 135;
        public static const TBL_PET_STONE:uint = 136;
        public static const TBL_EXPLORER_MEDAL:uint = 137;
        public static const TBL_CARVE:uint = 138;
        public static const TBL_CARVE_AWARD:uint = 139;
        public static const TBL_CARVE_MASTER:uint = 140;
        public static const TBL_MYTC_SUIT:uint = 142;
        public static const TBL_MYTC_DETAIL:uint = 143;
        public static const TBL_INDEX_ARRAY:Array = [];
        public static const TBL_INDEX_ARRAY2:Array = [];
        public static const TBL_INDEX_ARRAY3:Array = [];
        public static const TOOLTIP_EVENT:uint = 1010;
        public static const TOOLTIP_TITLE:uint = 1011;
        public static var LINK_TYPE_ARRAY:Array = [];
        public static var CURRENCY_TIP:Array = new Array();
        public static var CURRENCY_BATTLE_POINT:int = 1;
        public static var CURRENCY_DOG_MEDAL:int = 2;
        public static var CURRENCY_ACHILLES_MEDAL:int = 3;
        public static var CURRENCY_GROUPPVP_MEDAL:int = 7;
        public static var CURRENCY_NEWYEAR_PONIT:int = 10;
        public static var CURRENCY_LUNAYEAR_PONIT:int = 11;
        public static var CURRENCY_VALENTINE_POINT:int = 12;
        public static var CURRENCY_LANTERN_POINT:int = 13;
        public static var CURRENCY_LABOR_POINT:int = 14;
        public static var CURRENCY_FISHING_POINT:int = 15;
        public static var CURRENCY_QIXI_POINT:int = 16;
        public static var CURRENCY_SUMMER_POINT:int = 17;
        public static var CURRENCY_ANNUAL_THIRD:int = 18;
        public static var CURRENCY_PET_ARENA:int = 19;
        public static var CURRENCY_NORMAL_CONTRIB:int = 20;
        public static var CURRENCY_DONATE_CONTRIB:int = 21;
        public static var CURRENCY_XMAX_POINT:int = 22;
        public static var CURRENCY_NATIONALDAY_POINT:int = 25;
        public static var CURRENCY_PET_CHIP:int = 26;
        public static var CURRENCY_WORLD_CUP:int = 29;
        public static var CURRENCY_GOLD_WORLD_CUP:int = 30;
        public static var CURRENCY_SUMMER_GAME:int = 31;
        public static var CURRENCY_DOUBLE_11:int = 58;
        public static var CURRENCY_SHOWTIME:int = 60;
        public static var CURRENCY_ANNIVERSARY:int = 49;
        public static var CURRENCY_SHOP_GOLD:int = 61;
        public static var CURRENCY_ANNI_CONSUME:int = 62;
        public static var CURRENCY_MC_BEANS:int = 64;
        public static var CURRENCY_PET_ARENA_ACT:int = 65;
        public static var CURRENCY_SHOWTIME2:int = 69;
        public static var CURRENCY_DMBKYSQJ:int = 70;
        public static var CURRENCY_DMBKSBJL:int = 71;
        public static var SYS_MSG_NO_ENOUGH_MONEY:int = 0;
        public static var SYS_MSG_NO_ENOUGH_EXPSKILL:int = 10;
        public static var SYS_MSG_NO_ENOUGH_GOLD:int = 20;
        public static var SYS_MSG_NO_GUILD:int = 30;
        public static var SYS_MSG_SPECIAL_CLASSQUEST:int = 40;
        public static var SYS_MSG_SPECIAL_REPAIR:int = 50;
        public static var SYS_MSG_NO_ENOUGH_DEX:int = 60;
        public static var SYS_MSG:Array = [];
        public static var SYS_MSG_ADDFRIEND:String = Language.GAMEPREDEF_S[64];
        public static var SYS_MSG_ADDBLACK:String = Language.GAMEPREDEF_S[65];
        public static var SYS_MSG_DELFRIEND:String = Language.GAMEPREDEF_S[66];
        public static var SYS_MSG_DELBLACK:String = Language.GAMEPREDEF_S[67];
        public static var SYS_MSG_ADDEDFRIEND:String = Language.GAMEPREDEF_S[68];
        public static var SYS_MSG_NOMONEY:String = Language.GAMEPREDEF_S[69];
        public static var SYS_MSG_BUYSUCCESS:String = Language.GAMEPREDEF_S[70];
        public static var SYS_MSG_NOTTRADABLE:String = Language.GAMEPREDEF_S[71];
        public static var SYS_MSG_GROUP_DISMISS:String = Language.GAMEPREDEF_S[72];
        public static var SYS_MSG_GROUP_JOIN:String = Language.GAMEPREDEF_S[73];
        public static var SYS_MSG_GROUP_JOINED:String = Language.GAMEPREDEF_S[74];
        public static var SYS_MSG_GROUP_LEAVE:String = Language.GAMEPREDEF_S[75];
        public static var SYS_MSG_GROUP_CANTJOIN:String = Language.GAMEPREDEF_S[76];
        public static var SYS_MSG_GROUP_GIVELEADER:String = Language.GAMEPREDEF_S[77];
        public static var SYS_MSG_GROUP_INVITETOOFAR:String = Language.GAMEPREDEF_S[78];
        public static var SYS_MSG_GROUP_INTEAM:String = Language.GAMEPREDEF_S[79];
        public static var SYS_MSG_GROUP_INOTHERTEAM:String = Language.GAMEPREDEF_S[80];
        public static var SYS_MSG_GROUP_FULL:String = Language.GAMEPREDEF_S[81];
        public static var SYS_MSG_GROUP_NOT_SAME_LEAGUE:String = Language.GAMEPREDEF_S[364];
        public static var SYS_MSG_GROUP_CANTJOIN_GC_STATE:String = Language.GAMEPREDEF_S[526];
        public static var SYS_MSG_GROUP_CANTJOIN_GC_INGROUP:String = Language.GAMEPREDEF_S[525];
        public static var SYS_MSG_GROUP_CANTJOIN_GC_FULL:String = Language.GAMEPREDEF_S[527];
        public static var SYS_MSG_GROUP_NOT_LEAGUE_AND_LEAGUE:String = Language.GAMEPREDEF_S[530];
        public static var SYS_MSG_ADDENEMY:String = Language.GAMEPREDEF_S[354];
        public static var SYS_MSG_DELENEMY:String = Language.GAMEPREDEF_S[355];
        public static var CLASS_LEVEL:Object = {};
        public static var PLAYER_LEVEL_EXP:Array = [];
        public static var PLAYER_RELEVEL_EXP:Array = [];
        public static var PET_LEVEL_EXP:Array = [];
        public static var FAIRY_LEVEL_EXP:Array = [];
        public static var FAIRY_GROW_EXP:Array = [];
        public static var BASIC_GET_EXP:Array = [];
        public static var BASIC_GET_MONEY:Array = [];
        public static var CLASS_QUEST_MONEY_EXP_NUM:Array = [0.6, 0.7, 0.8, 0.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5];
        public static var SLOT_MAX_STACK:uint = 99;
        public static var CHAT_POPUP_MAXCHAR:uint = 80;
        public static var GROUP_WALK_GAP:uint = 45;
        public static var MAIN_FMS_LINK:String = "rtmpe://localhost";
        public static var HELP_PANEL_XML_LINK:String = ("profile/help.xml?v=" + Version.VERSION);
        public static var GUIDE_PANEL_XML_LINK:String = "profile/guide.xml";
        public static var HELP_PANEL_XML_BBSLINK:String = "profile/gameConfig.xml";
        public static var PROP_ATTACK:String = Language.GAMEPREDEF_S[88];
        public static var PROP_MATTACK:String = Language.GAMEPREDEF_S[89];
        public static var PROP_DEFENCE:String = Language.GAMEPREDEF_S[90];
        public static var PROP_MDEFENCE:String = Language.GAMEPREDEF_S[91];
        public static var PROP_HIT:String = Language.GAMEPREDEF_S[92];
        public static var PROP_CRITICAL:String = Language.GAMEPREDEF_S[93];
        public static var PROP_DODGE:String = Language.GAMEPREDEF_S[94];
        public static var PROP_COUNTER:String = Language.GAMEPREDEF_S[95];
        public static var PROP_SPEED:String = Language.GAMEPREDEF_S[96];
        public static var RESI_DIZZY:String = Language.GAMEPREDEF_S[97];
        public static var RESI_CONFUSION:String = Language.GAMEPREDEF_S[98];
        public static var RESI_SLEEP:String = Language.GAMEPREDEF_S[99];
        public static var RESI_POINSON:String = Language.GAMEPREDEF_S[100];
        public static var RESI_FIRE:String = Language.GAMEPREDEF_S[101];
        public static var RESI_ICE:String = Language.GAMEPREDEF_S[102];
        public static var RESI_LIGHT:String = Language.GAMEPREDEF_S[103];
        public static var ATT_STRENGTH:String = Language.GAMEPREDEF_S[104];
        public static var ATT_AGILITY:String = Language.GAMEPREDEF_S[105];
        public static var ATT_STAMINA:String = Language.GAMEPREDEF_S[106];
        public static var ATT_INTELLIGENCE:String = Language.GAMEPREDEF_S[107];
        public static var ATT_ENERGY:String = Language.GAMEPREDEF_S[108];
        public static var ATT_LUCK:String = Language.GAMEPREDEF_S[109];
        public static var ATT_HP:String = Language.GAMEPREDEF_S[110];
        public static var ATT_MP:String = Language.GAMEPREDEF_S[111];
        public static var ATT_SP:String = Language.GAMEPREDEF_S[112];
        public static var USE_MP:String = Language.GAMEPREDEF_S[113];
        public static var USE_HP:String = Language.GAMEPREDEF_S[114];
        public static var USE_SP:String = Language.GAMEPREDEF_S[115];
        public static var PROP_BINDED:String = Language.GAMEPREDEF_S[116];
        public static var PROP_BINDTYPE:Array = ["", Language.GAMEPREDEF_S[117], Language.GAMEPREDEF_S[118]];
        public static var MSG_CHANNEL_LOCAL:uint = 0;
        public static var MSG_CHANNEL_GLOBAL:uint = 1;
        public static var MSG_CHANNEL_GUILD:uint = 2;
        public static var MSG_CHANNEL_GROUP:uint = 3;
        public static var MSG_CHANNEL_BATTLE:uint = 4;
        public static var MSG_CHANNEL_AREA:uint = 5;
        public static var MSG_CHANNEL_HEADLINE:uint = 6;
        public static var MSG_CHAT_INPUT_MAX:uint = 500;
        public static var BATTLE_STAGE_COLOR_BOSS:ColorTransform = new ColorTransform(1.1, 1, 1);
        public static var BATTLE_STAGE_COLOR_NORMAL:ColorTransform = new ColorTransform(1, 1.1, 1);
        public static var MSG_CHANNEL_COLOR:Array = ["#EEEEEE", "#EEBB22", "#22BB22", "#2288EE", "#EEEEEE", "#9933EE", "#EEEE00", "#00EEEE", "#EE1100", "#EEBB22", "#EF343E"];
        public static const SUBLIMATION_COLOR:int = 5;
        public static var MSG_ITEM_COLOR:Array = ["#FFFFFF", "#00FF00", "#0066FF", "#FF33FF", "#FA5B05", "#FF0000", "#33CCAA", "#33CCAA", "#000000"];
        public static var CODE_ITEM_COLOR:Array = [0xFFFFFF, 0xFF00, 26367, 16724991, 16407301, 0xFF0000, 3394730, 3394730, 16756247];
        public static var CODE_SOUL_COLOR:Array = [0xFFFFFF, 0xCD00, 4749055, 10105549, 16407301, 0xFF0000, 3394730, 3394730, 16756247];
        public static var MSG_KEY_WORD_COLOR:String = "#FF0000";
        public static var MSG_EVENTTEXT_COLOR:Array = ["#FFCC00", "#FF9900", "#FF66CC", "#FF0000", "#3399CC", "#33FF66", "#33CCAA", "#00FF00"];
        public static var ELEMENT_COLOR:Object = {};
        public static var GUILD_ONLINE_COLOR:uint = 0x66AA00;
        public static var GUILD_OFFLINE_COLOR:uint = 0x999999;
        public static var GUILD_ONCHECK_COLOR:uint = 0xFF00;
        public static const FILTER_ROUNDED_TEXT:BitmapFilter = new GlowFilter(0, 0.9, 2, 2, 6, BitmapFilterQuality.HIGH, false, false);
        public static const FILTER_ROUNDED_TEXT2:BitmapFilter = new GlowFilter(0, 1, 2, 2, 10, BitmapFilterQuality.LOW, false, false);
        public static const FILTER_ROUNDED_TEXT3:BitmapFilter = new GlowFilter(0xCC3300, 1, 2, 2, 5, BitmapFilterQuality.LOW, false, false);
        public static const FILTER_ROUNDED_TEXT4:BitmapFilter = new GlowFilter(0, 1, 2, 2, 10, BitmapFilterQuality.LOW, false, false);
        public static const FILTER_ROUNDED_TEXT5:BitmapFilter = new GlowFilter(19814, 1, 2, 2, 10, BitmapFilterQuality.LOW, false, false);
        public static const FILTER_TITLE:BitmapFilter = new GlowFilter(3362401, 1, 2, 2, 10, BitmapFilterQuality.LOW, false, false);
        public static const FILTER_SHADOW_TEXT:BitmapFilter = new DropShadowFilter(1, 45, 0, 0.6, 0, 0, 5, BitmapFilterQuality.HIGH);
        public static const FILTER_SHADOW_TEXT2:BitmapFilter = new DropShadowFilter(1, 225, 0, 0.4, 0, 0, 5, BitmapFilterQuality.HIGH);
        public static const FILTER_SHADOW_TEXT3:BitmapFilter = new DropShadowFilter(1, 45, 0xFFFFFF, 0.6, 0, 0, 5, BitmapFilterQuality.HIGH);
        public static const FILTER_SHADOW_TEXT4:BitmapFilter = new DropShadowFilter(1, 225, 0xFFFFFF, 0.4, 0, 0, 5, BitmapFilterQuality.HIGH);
        public static const FILTER_SLOT_SELECTED:BitmapFilter = new GlowFilter(0xFFFF, 0.5);
        public static const FILTER_SOUL_SLOT_SELECTED:BitmapFilter = new GlowFilter(0xEEEE00, 1);
        public static const FILTER_SHOPSLOT_SELECTED:BitmapFilter = new GlowFilter(0xFFFF, 5, 6, 6, 30);
        public static const FILTER_CHAR_SELECTED:BitmapFilter = new GlowFilter(0xFFFFFF, 5, 10, 10, 3);
        public static const FILTER_CHAR_SELECTED_2:BitmapFilter = new GlowFilter(0xFFFF00, 5, 13, 13, 7);
        public static const FILTER_ACHIEVE_SELECTED:BitmapFilter = new GlowFilter(0xFFFF00, 1);
        public static const FILTER_BLACK_ROUND:BitmapFilter = new GlowFilter(0, 0.5);
        public static const FILTER_ALLOW_SELECTED:BitmapFilter = new GlowFilter(0xFFFF, 5, 10, 10, 3);
        public static const FILTER_RED_SELECTED:BitmapFilter = new GlowFilter(0xFF0000, 5, 10, 10, 3);
        public static const FILTER_NOALLOW_SELECTED:BitmapFilter = new GlowFilter(0xFF0000, 5, 10, 10, 3);
        public static const FILTER_WEAPON_01:BitmapFilter = new GlowFilter(0xFFFFFF, 1, 5, 5, 1.5, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_02:BitmapFilter = new GlowFilter(0, 1, 5, 5, 1.5, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_03:BitmapFilter = new GlowFilter(0xFF9900, 1, 5, 5, 1.5, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_04:BitmapFilter = new GlowFilter(0xFFFF00, 1, 5, 5, 1.5, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_05:BitmapFilter = new GlowFilter(6750207, 1, 5, 5, 1.5, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_06:BitmapFilter = new GlowFilter(0xFF0000, 1, 10, 10, 2, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_ARR1:Array = [FILTER_WEAPON_01, FILTER_WEAPON_02, FILTER_WEAPON_03, FILTER_WEAPON_04, FILTER_WEAPON_05, FILTER_WEAPON_06];
        public static const FILTER_WEAPON_11:BitmapFilter = new GlowFilter(0xFFFFFF, 1, 10, 10, 2, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_12:BitmapFilter = new GlowFilter(0, 1, 10, 10, 2, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_13:BitmapFilter = new GlowFilter(0xFF9900, 1, 10, 10, 2, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_14:BitmapFilter = new GlowFilter(0xFFFF00, 1, 10, 10, 2, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_15:BitmapFilter = new GlowFilter(6750207, 1, 10, 10, 2, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_16:BitmapFilter = new GlowFilter(0xFF0000, 1, 10, 10, 2, BitmapFilterQuality.HIGH);
        public static const FILTER_WEAPON_ARR2:Array = [FILTER_WEAPON_11, FILTER_WEAPON_12, FILTER_WEAPON_13, FILTER_WEAPON_14, FILTER_WEAPON_15, FILTER_WEAPON_16];
        public static const FILTER_WEAPON_20:BitmapFilter = new GlowFilter(0x9900FF, 1, 10, 10, 1.5, BitmapFilterQuality.HIGH);
        public static const FILTER_GLOW_LOWBLACK:BitmapFilter = new GlowFilter(0, 1, 2, 2, 5, BitmapFilterQuality.LOW);
        public static const FILTER_GLOW_HIGHBLACK:BitmapFilter = new GlowFilter(0, 1, 2, 2, 4, BitmapFilterQuality.HIGH);
        public static const FILTER_GLOW_GOLD_HIGH:BitmapFilter = new GlowFilter(16703405, 1, 6, 6, 7, BitmapFilterQuality.HIGH, false, false);
        public static const GRAY_FILTER:ColorMatrixFilter = new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0, 0, 0, 1, 0]);
        public static const FILTER_SLOT_SKILL_01:BitmapFilter = new ColorMatrixFilter([0.2225, 0.7169, 0.0606, 0, 0, 0.2225, 0.7169, 0.0606, 0, 0, 0.2225, 0.7169, 0.0606, 0, 0, 0, 0, 0, 1, 0]);
        public static const FILTER_TEXT1:Array = [FILTER_ROUNDED_TEXT];
        public static const FILTER_TEXT2:Array = [FILTER_SHADOW_TEXT, FILTER_SHADOW_TEXT2];
        public static const FILTER_TEXT:Array = FILTER_TEXT2;
        public static const FILTER_SELECTED:BitmapFilter = new GlowFilter(0xFFFF00, 1, 2, 2, 5, BitmapFilterQuality.LOW);
        public static var PROPERTY_COLOR_HP:uint = 0xFF0000;
        public static var PROPERTY_COLOR_MP:uint = 3355562;
        public static var PROPERTY_COLOR_SP:uint = 0xFFFF00;
        public static var PROPERTY_COLOR_EXP:uint = 0xFF00;
        public static var MSG_TEMPLATE_NORMAL:String = "<font color='{color}'>{channelLink}{wisperText}{nameLink}:{msgText}</font></br>";
        public static var MSG_TEMPLATE_LINK:String = "<a href='event:{eventText}'>[{text}]</a>";
        public static var MSG_TEMPLATE_WISPER:String = Language.GAMEPREDEF_S[119];
        public static var MSG_TEMPLATE_SYSTEM:String = "<font color='{color}'>{text}</font>";
        public static var MSG_SYSTEM_NOREPEAT:String = Language.GAMEPREDEF_S[120];
        public static var MSG_STATUS_TRUE:String = "success";
        public static var MSG_STATUS_FALSE:String = Language.GAMEPREDEF_S[121];
        public static var MSG_EXP_TEXT:RegExp = /^<TEXTFORMAT[^>]*><P[^>]*><FONT[^>]*>(.*)<\/FONT><\/P><\/TEXTFORMAT>$/;
        public static var MSG_EXP_BLACK:RegExp = /<FONT COLOR="#FFFFFF">(.*?)<\/FONT>/g;
        public static var MSG_EXP_WHITE:RegExp = /<FONT COLOR="#000000">(.*?)<\/FONT>/g;
        public static var MSG_EXP_LINK:RegExp = /<A HREF="event:(.*?)" TARGET="">\[(.*?)\]<\/A>/isg;
        public static var MSG_TYPE_EMOTION:String = "/e";
        public static var MSG_TYPE_WISPER:String = "/w";
        public static var MSG_TYPE_NORMAL:String = "/s";
        public static var GUILD_DEL:String = Language.GAMEPREDEF_S[122];
        public static var GUILD_JOIN:String = Language.GAMEPREDEF_S[123];
        public static var GUILD_ALLOW:String = Language.GAMEPREDEF_S[124];
        public static var GUILD_REFUSE:String = Language.GAMEPREDEF_S[125];
        public static var GUILD_KICK:String = Language.GAMEPREDEF_S[126];
        public static var GUILD_QUIT:String = Language.GAMEPREDEF_S[127];
        public static var GUILD_DUTY:String = Language.GAMEPREDEF_S[128];
        public static var GUILD_DEMISE:String = Language.GAMEPREDEF_S[129];
        public static var GUILD_LEADERINFO:String = Language.GAMEPREDEF_S[130];
        public static var GUILD_ONLINE:String = Language.GAMEPREDEF_S[131];
        public static var GUILD_OFFLINE:String = Language.GAMEPREDEF_S[132];
        public static var GUILD_UNVERIFIED:String = Language.GAMEPREDEF_S[133];
        public static var GUILD_GUILDNAME:String = Language.GAMEPREDEF_S[134];
        public static var GUILD_LEADERNAME:String = Language.GAMEPREDEF_S[135];
        public static var GUILD_MYDUTY:String = Language.GAMEPREDEF_S[136];
        public static var GUILD_MYNOTE:String = Language.GAMEPREDEF_S[137];
        public static var GUILD_NOTEINFO:String = Language.GAMEPREDEF_S[138];
        public static var GUILD_NOGUILD:String = Language.GAMEPREDEF_S[139];
        public static var GUILD_ONCHECK:String = Language.GAMEPREDEF_S[140];
        public static var GUILD_ONLYONE:String = Language.GAMEPREDEF_S[141];
        public static var GUILD_ALERTTITLE:String = Language.GAMEPREDEF_S[142];
        public static var GUILD_ISLEADER:String = Language.GAMEPREDEF_S[143];
        public static var GUILD_ISNOTLEADER:String = Language.GAMEPREDEF_S[144];
        public static var GUILD_CANNOTINFO:String = Language.GAMEPREDEF_S[145];
        public static var GUILD_ADDGUILDINFO:String = Language.GAMEPREDEF_S[146];
        public static var GUILD_NOADDGUILD:String = Language.GAMEPREDEF_S[147];
        public static var GUILD_EXISTGUILD:String = Language.GAMEPREDEF_S[148];
        public static var WARN_TYPE_P2PWISPER:int = 10;
        public static var WARN_TYPE_ADDMAIL:int = 20;
        public static var WARN_TYPE_FINDTEACHER:int = 30;
        public static var WARN_TYPE_FINDSTUDENT:int = 40;
        public static var WARN_TYPE_AWARD:int = 50;
        public static var WARN_TYPE_MIN:int = 60;
        public static var WARN_TYPE_ROBBER:int = 70;
        public static var WARN_TYPE_CHATGM:int = 70;
        public static var WARN_TYPE_CHATGM_MIN:int = 80;
        public static var WARN_TYPE_QUESTIONING:int = 90;
        public static var WARN_TYPE_FARM_RIPE:int = 100;
        public static var WARN_TYPE_GROUP_CHAT:int = 110;
        public static var WARN_TYPE_GROUP_APPLY:int = 120;
        public static var WARN_TYPE_REGISTER_DXD:int = 130;
        public static var WARN_TYPE_GROUP_INVITE:int = 140;
        public static var WARN_TYPE_FEASTIVAL:int = 150;
        public static var WARN_TYPE_WORLDBOSS:int = 150;
        public static var WARN_TYPE_REDENVELOPE:int = 160;
        public static var WARN_TIP_P2PWISPER:String = Language.GAMEPREDEF_S[149];
        public static var WARN_TIP_ADDMAIL:String = Language.GAMEPREDEF_S[150];
        public static var WARN_TIP_ADDMAIL2:String = Language.GAMEPREDEF_S[151];
        public static var WARN_TIP_ADDMAIL3:String = Language.GAMEPREDEF_S[588];
        public static var WARN_TIP_AWARD:String = Language.GAMEPREDEF_S[152];
        public static var WARN_TIP_MIN:String = Language.GAMEPREDEF_S[360];
        public static var WARN_TIP_INVITED:String = Language.GAMEPREDEF_S[520];
        public static var WARN_TIP_CHATGM:String = Language.GAMEPREDEF_S[458];
        public static var WARN_TIP_QUESTIONING:String = Language.GAMEPREDEF_S[463];
        public static var WARN_TIP_DXD_REGISTER:String = Language.GAMEPREDEF_S[519];
        public static var WARN_TIP_WORLDBOSS:String = Language.GAMEPREDEF_S[523];
        public static var WARN_TIP_REDENVELOPE:String = Language.GAMEPREDEF_S[608];
        public static var MAP_TYPE_NORMAL:int = 1;
        public static var MAP_TYPE_TILE:int = 0;
        public static var MAP_TYPE_SINGLE:int = 2;
        public static var UINT_MAX:uint = 0xFFFFFF;
        public static var CHAT_OUTPUT_LENGTH_MAX:uint = 1000;
        public static var RELATIONSHIP_TYPE:Array = [1, 2, 3, 4, 5, 6];
        public static var RELATIONSHIP_SIZE:Array = [120, 30, 20, 100];
        public static var CHAR_MENU_DP:Array = [{
            "label":"",
            "data":CM_NAME
        }, {
            "label":MENU_INFO,
            "data":CM_INFO
        }, {
            "label":MENU_WISPER,
            "data":CM_WISPER
        }, {
            "label":MENU_P2PWISPER,
            "data":CM_P2PWISPER
        }, {
            "label":CHAR_MENU_INVITE_T,
            "data":CM_INVITE_T
        }, {
            "label":CHAR_MENU_INVITE_G,
            "data":CM_INVITE_G
        }, {
            "label":CHAR_MENU_KICK,
            "data":CM_KICK
        }, {
            "label":CHAR_MENU_TRADE,
            "data":CM_TRADE
        }];
        public static var CHAR_MENU_DP_SELF:Array = [{
            "label":"",
            "data":SM_NAME
        }, {
            "label":SELF_MENU_INFO,
            "data":SM_INFO
        }];
        public static var MENU_WISPER:String = Language.GAMEPREDEF_S[153];
        public static var MENU_P2PWISPER:String = Language.GAMEPREDEF_S[154];
        public static var MENU_INFO:String = Language.GAMEPREDEF_S[155];
        public static var MENU_ADDF:String = Language.GAMEPREDEF_S[156];
        public static var MENU_ADDB:String = Language.GAMEPREDEF_S[157];
        public static var MENU_COPY:String = Language.GAMEPREDEF_S[158];
        public static var MENU_ASSASI:String = Language.GAMEPREDEF_S[457];
        public static var MENU_REPLAY:String = Language.GAMEPREDEF_S[499];
        public static var MENU_SAVE_REPLAY:String = Language.GAMEPREDEF_S[500];
        public static var MENU_DEL_REPLAY:String = Language.GAMEPREDEF_S[501];
        public static var MENU_COPY_REPLAY:String = Language.GAMEPREDEF_S[502];
        public static var MENU_BAN_CHAT:String = Language.GAMEPREDEF_S[518];
        public static var MENU_BAN_CHAT2:String = Language.GAMEPREDEF_S[607];
        public static var CHAR_MENU_JOIN:String = Language.GAMEPREDEF_S[159];
        public static var CHAR_MENU_KICK:String = Language.GAMEPREDEF_S[160];
        public static var CHAR_MENU_INVITE_T:String = Language.GAMEPREDEF_S[161];
        public static var CHAR_MENU_INVITE_G:String = Language.GAMEPREDEF_S[162];
        public static var CHAR_MENU_TRADE:String = Language.GAMEPREDEF_S[163];
        public static var CHAR_MENU_APPLY_T:String = Language.GAMEPREDEF_S[524];
        public static var SELF_MENU_INFO:String = Language.GAMEPREDEF_S[164];
        public static var SELF_MENU_LEAVE_G:String = Language.GAMEPREDEF_S[165];
        public static var SELF_MENU_DISMISS_G:String = Language.GAMEPREDEF_S[166];
        public static var CM_NAME:uint = 0;
        public static var CM_WISPER:uint = 10;
        public static var CM_P2PWISPER:uint = 15;
        public static var CM_INFO:uint = 20;
        public static var CM_INVITE_T:uint = 30;
        public static var CM_INVITE_G:uint = 40;
        public static var CM_JOIN:uint = 50;
        public static var CM_KICK:uint = 60;
        public static var CM_TRADE:uint = 70;
        public static var SM_NAME:uint = 1000;
        public static var SM_INFO:uint = 1010;
        public static var SM_LEAVE_G:uint = 1020;
        public static var SM_DISMISS_G:uint = 1030;
        public static var MAILDATE:Array = [30, 10];
        public static var AUCTION_TIME:Array = [1, 48];
        public static var AUCTION_COSTPERCENT:Array = [0.1, 0.2];
        public static var AUCTION_TIMENUM:int = 5;
        public static var AUCTION_BIDADD:Array = [10, 1];
        public static var BATTLE_ACTION_ATTACK:int = -10;
        public static var BATTLE_ACTION_DEFENCE:int = -20;
        public static var BATTLE_ACTION_ESCAPE:int = -30;
        public static var BATTLE_ACTION_TIMEOUT:int = -40;
        public static var BATTLE_ACTION_SKILL:int = -50;
        public static var BATTLE_ACTION_ITEM:int = -60;
        public static var BATTLE_ACTION_CATCH:int = -70;
        public static var BATTLE_ACTION_POSITION:int = -80;
        public static var BATTLE_ACTION_RETURN:int = -90;
        public static var BATTLE_ACTION_PET:int = -100;
        public static var BATTLE_ACTION_AUTO:int = -110;
        public static var BATTLE_AUTO_DEFENSE_PET:Boolean = false;
        public static var BATTLE_AUTO_DEFENSE_PLAYER:Boolean = false;
        public static var BATTLE_WIN:int = 1;
        public static var BATTLE_LOSE:int = 2;
        public static var BATTLE_NOT_END:int = -1;
        public static var ACTION_NONE:int = 0;
        public static var ACTION_ITEM:int = 10;
        public static var ACTION_INVITE:int = 20;
        public static var ACTION_OBSERVE:int = 30;
        public static var ACTION_PK:int = 40;
        public static var ACTION_BIND:int = 50;
        public static var ACTION_TRADE:int = 60;
        public static var ACTION_DROP:int = 70;
        public static var ACTION_DIVIDE:int = 80;
        public static var ACTION_REPAIR_NOWEAR:int = 90;
        public static const ACTION_REPAIR_MAGIC_WEAPON:uint = 91;
        public static var ACTION_REPAIR_NORMAL:int = 100;
        public static var ACTION_JEWEL_DEL:int = 110;
        public static var ACTION_FEATHER_DEL:int = 120;
        public static var ACTION_CLEAR_PLANT:int = 130;
        public static var ACTION_REAP_MINE:int = 140;
        public static var ACTION_REAP_ALL:int = 150;
        public static var ACTION_PLANT_YG1:int = 160;
        public static var ACTION_PLANT_SJ1:int = 170;
        public static var ACTION_PLANT_JG1:int = 180;
        public static var ACTION_PLANT_SZ1:int = 190;
        public static var ACTION_PLANT_JX1:int = 200;
        public static var ACTION_PLANT_YG2:int = 210;
        public static var ACTION_PLANT_SJ2:int = 220;
        public static var ACTION_PLANT_JG2:int = 230;
        public static var ACTION_PLANT_SZ2:int = 240;
        public static var ACTION_PLANT_JX2:int = 250;
        public static var MOUSE_TARGET_CHA:int = 1;
        public static var MOUSE_TARGET_PET:int = 2;
        public static var ITEM_KIND_TYPE:Object = {};
        public static var ITEM_KIND_NAME:Object = {};
        public static var ITEM_KIND_MAINHAND:int = 1;
        public static var ITEM_KIND_SUBHAND:int = 2;
        public static var ITEM_KIND_DEFENCE:int = 3;
        public static var ITEM_KIND_JEWELRY:int = 4;
        public static var ITEM_KIND_ITEM:int = 5;
        public static var ITEM_KIND_MATERIAL:int = 6;
        public static var ITEM_KIND_PET:int = 7;
        public static var ITEM_KIND_PETEQU:int = 9;
        public static var ITEM_KIND_MAGICWEAPON:int = 8;
        public static var ITEM_KIND_FLYER:int = 10;
        public static var ITEM_KIND_DRESS:int = 11;
        public static var ITEM_KIND_GATHER:int = 12;
        public static var ITEM_KIND_WING:int = 13;
        public static var ITEM_KIND_FEATHER:int = 14;
        public static var ITEM_TYPE_NAME:Object = {};
        public static var ITEM_TYPE_HAMMER:int = 100;
        public static var ITEM_TYPE_STICK:int = 101;
        public static var ITEM_TYPE_GUN:int = 102;
        public static var ITEM_TYPE_SWORDONE:int = 103;
        public static var ITEM_TYPE_GUITAR:int = 104;
        public static var ITEM_TYPE_BAT:int = 105;
        public static var ITEM_TYPE_SHIELD:int = 200;
        public static var ITEM_TYPE_BOOK:int = 201;
        public static var ITEM_TYPE_CUFF:int = 202;
        public static var ITEM_TYPE_KNIFE:int = 203;
        public static var ITEM_TYPE_PICK:int = 204;
        public static var ITEM_TYPE_GLOVE:int = 205;
        public static var ITEM_TYPE_HAT:int = 300;
        public static var ITEM_TYPE_CLOTHES:int = 301;
        public static var ITEM_TYPE_TROUSERS:int = 302;
        public static var ITEM_TYPE_BELT:int = 303;
        public static var ITEM_TYPE_SHOE:int = 304;
        public static var ITEM_TYPE_SHOULDER:int = 305;
        public static var ITEM_TYPE_NECKLACE:int = 400;
        public static var ITEM_TYPE_RING:int = 401;
        public static var ITEM_TYPE_JEWELRY1:int = 402;
        public static var ITEM_TYPE_JEWELRY2:int = 403;
        public static var ITEM_TYPE_WING:int = 1300;
        public static const ITEM_TYPE_FEATHER_A:int = 1401;
        public static const ITEM_TYPE_FEATHER_B:int = 1402;
        public static const ITEM_TYPE_FEATHER_C:int = 1403;
        public static const ITEM_TYPE_FEATHER_D:int = 1404;
        public static const ITEM_TYPE_FEATHER_MIX:int = 1400;
        public static var ITEM_TYPE_REEL:int = 500;
        public static var ITEM_TYPE_MEDICINE:int = 501;
        public static var ITEM_TYPE_FOOD:int = 502;
        public static var ITEM_TYPE_JEWEL:int = 503;
        public static var ITEM_TYPE_STAR:int = 504;
        public static var ITEM_TYPE_SKILLBOOK:int = 505;
        public static var ITEM_TYPE_CREBOOK:int = 506;
        public static var ITEM_TYPE_PETFUNC:int = 507;
        public static var ITEM_TYPE_QUEST:int = 508;
        public static var ITEM_TYPE_KEY:int = 509;
        public static var ITEM_TYPE_PETEQU_LEVELUP:int = 0x0200;
        public static var ITEM_TYPE_PETEQU_MODCOLOR:int = 513;
        public static var ITEM_TYPE_OTHER:int = 550;
        public static var ITEM_TYPE_MW_REPAIR:int = 510;
        public static var ITEM_TYPE_MW_SKILL_RESET:int = 511;
        public static var ITEM_TYPE_MW_TRANS:int = 0x0202;
        public static var ITEM_TYPE_FISHING_TOOL:int = 515;
        public static var ITEM_TYPE_FORMULA:int = 516;
        public static var ITEM_TYPE_TEMP_BAG:uint = 517;
        public static var ITEM_TYPE_JGZ:uint = 600;
        public static var ITEM_TYPE_MW_PROP_RESET:uint = 519;
        public static var ITEM_TYPE_WING_ENHANCE:uint = 518;
        public static var ITEM_TYPE_STAR_ADD:uint = 551;
        public static var ITEM_TYPE_STAR_SPEED:uint = 552;
        public static var ITEM_TYPE_TARGET_ITEM:uint = 520;
        public static var ITEM_TYPE_FAIRY_SKILL_ITEM:uint = 521;
        public static var ITEM_TYPE_MW_STAGE_EIGHT:int = 522;
        public static var ITEM_TYPE_SUBLIME:int = 523;
        public static var ITEM_TYPE_RESTRAIN:int = 524;
        public static var ITEM_TYPE_QILINGSTORE:int = 527;
        public static var ITEM_TYPE_PETFUNC_TYPE:Array = [0, 1, 2, 3, 4, 5, 6, 7, 8];
        public static var ITEM_TYPE_XSD_TYPE:Array = [0, 1, 2, 3, 4, 5];
        public static var ITEM_TYPE_DIAMOND:int = 600;
        public static var ITEM_TYPE_METAL:int = 601;
        public static var ITEM_TYPE_WOOD:int = 602;
        public static var ITEM_TYPE_JADE:int = 603;
        public static var ITEM_TYPE_CLOTH:int = 604;
        public static var ITEM_TYPE_FUR:int = 605;
        public static var ITEM_TYPE_FISH:int = 610;
        public static var ITEM_TYPE_PLANT:int = 611;
        public static var ITEM_TYPE_HERB:int = 612;
        public static var ITEM_TYPE_PET_HUMAN:int = 700;
        public static var ITEM_TYPE_PET_MONSTER:int = 701;
        public static var ITEM_TYPE_PET_PLANT:int = 702;
        public static var ITEM_TYPE_PET_MACHINE:int = 703;
        public static var ITEM_TYPE_PET_DEVIL:int = 704;
        public static var ITEM_TYPE_PET_DRAGON:int = 705;
        public static var ITEM_TYPE_PETEQU_SPUR:int = 900;
        public static var ITEM_TYPE_PETEQU_NECK:int = 901;
        public static var ITEM_TYPE_PETEQU_BELL:int = 902;
        public static var ITEM_TYPE_PETEQU_WING:int = 903;
        public static var ITEM_TYPE_PETEQU_ARMOR:int = 904;
        public static var ITEM_TYPE_PETEQU_CUFF:int = 905;
        public static var ITEM_TYPE_PETEQU_DRAGON1:int = 906;
        public static var ITEM_TYPE_PETEQU_DRAGON2:int = 907;
        public static var ACHI_KIND_TYPE:Object = {};
        public static var ACHI_TYPE_NAME:Object = {};
        public static var ACHI_KIND_CHAR:int = 1;
        public static var ACHI_KIND_PET:int = 2;
        public static var ACHI_KIND_IM:int = 3;
        public static var ACHI_KIND_PVP:int = 4;
        public static var ACHI_KIND_PVE:int = 5;
        public static var ACHI_KIND_LIFE:int = 6;
        public static var ACHI_KIND_NAME:Object = {};
        public static var ACHI_TYPE_CHAR_LEVEL:int = 101;
        public static var ACHI_TYPE_CHAR_SKILL:int = 102;
        public static var ACHI_TYPE_CHAR_TRAINING:int = 103;
        public static var ACHI_TYPE_CHAR_FORTUNE:int = 104;
        public static var ACHI_TYPE_CHAR_EQUIP:int = 105;
        public static var ACHI_TYPE_CHAR_PROPERTY:int = 106;
        public static var ACHI_TYPE_CHAR_TITLE:int = 107;
        public static var ACHI_TYPE_CHAR_OTHER:int = 108;
        public static var ACHI_TYPE_CHAR_FAIRY:int = 109;
        public static var SKILL_REQUEST_CHAR_LEVEL:* = 10;
        public static var ACHI_TYPE_PET_COLLECTION:int = 201;
        public static var ACHI_TYPE_PET_TRAINING:int = 202;
        public static var ACHI_TYPE_PET_OTHER:int = 203;
        public static var ACHI_TYPE_PET_EVOLUTION:int = 204;
        public static var ACHI_TYPE_IM_FRIEND:int = 301;
        public static var ACHI_TYPE_IM_MENTOR:int = 302;
        public static var ACHI_TYPE_IM_GUILD:int = 303;
        public static var ACHI_TYPE_IM_COUPLE:int = 304;
        public static var ACHI_TYPE_IM_OHTER:int = 305;
        public static var ACHI_TYPE_PVP_DGFIGHT:int = 401;
        public static var ACHI_TYPE_PVP_CROSSBATTLE:int = 402;
        public static var ACHI_TYPE_PVP_OTHER:int = 404;
        public static var ACHI_TYPE_PVE_KILL:int = 501;
        public static var ACHI_TYPE_PVE_COPY:int = 502;
        public static var ACHI_TYPE_PVE_ACTIVE:int = 503;
        public static var ACHI_TYPE_PVE_QUEST:int = 504;
        public static var ACHI_TYPE_PVE_CONS:int = 505;
        public static var ACHI_TYPE_PVE_HULA:int = 506;
        public static var ACHI_TYPE_PVE_STH:int = 507;
        public static var ACHI_TYPE_LIFE_COOK:int = 601;
        public static var ACHI_TYPE_LIFE_HERB:int = 602;
        public static var ACHI_TYPE_LIFE_FISHING:int = 603;
        public static var ACHI_TYPE_LIFE_PRODUCT:int = 604;
        public static var ACHI_TYPE_LIFE_PLANT:int = 605;
        public static var ACHI_TYPE_LIFE_OTHER:int = 606;
        public static var ACHI_TYPE_LIFE_FARM:int = 607;
        public static var ITEM_TYPE_MAIN_MAGICWEAPON:int = 800;
        public static var ITEM_TYPE_SUB_MAGICWEAPON:int = 801;
        public static var ITEM_TYPE_FLYER_SUBTYPE:int = 1000;
        public static var ITEM_TYPE_DRESS_SUBTYPE:int = 1100;
        public static var ITEM_TYPE_GATHER_GLOVE:int = 1200;
        public static var ITEM_TYPE_GATHER_ROD:int = 1201;
        public static var GENDER_MALE:int = 0;
        public static var GENDER_FEMALE:int = 1;
        public static var GENDER_NONE:int = 2;
        public static var GENDER_NAME:Array = [Language.GAMEPREDEF_S[219], Language.GAMEPREDEF_S[220], Language.GAMEPREDEF_S[221]];
        public static var SLOT_SID_EQUIP:Array = [1, 22];
        public static var SLOT_SID_BAG:Array = [2100, 2130, 2160, 2190, 2220, 2250, 2280, 2310, 2340, 2370];
        public static var SLOT_SID_BANK:Array = [300, 330, 360, 390, 420, 450];
        public static var SLOT_SID_GUILD_BANK:Array = [500, 530, 560, 590, 620];
        public static var SLOT_SID_PET_EQUIP:Array = [1000, 1200];
        public static var SLOT_SID_PET_SOUL:Array = [0, 100];
        public static var MW_MAIN_POSITION:* = {"15":true};
        public static var MW_SUB_POSITION:* = {
            "16":true,
            "17":true,
            "18":true,
            "19":true,
            "20":true
        };
        public static var SLOT_SID_DRESS:* = 21;
        public static var SLOT_SID_WING:* = 22;
        public static const SLOT_SID_TEMPBAG:Array = [80, 99];
        public static var MW_HP_GROW_MAP:* = {
            "0":1,
            "1":1.4,
            "2":2.9,
            "3":4.8,
            "4":7.3,
            "5":11.2,
            "6":15.2,
            "7":19.7,
            "8":27.4,
            "9":34.1,
            "10":40.7,
            "11":47.4,
            "12":55,
            "13":62.6,
            "14":70.2,
            "15":77.8,
            "16":85.4,
            "17":93,
            "18":100.6,
            "19":108.2,
            "20":115.8
        };
        public static var MW_SPEED_GROW_MAP:* = {
            "0":1,
            "1":1.5,
            "2":2,
            "3":3.6,
            "4":6.2,
            "5":8.9,
            "6":11.8,
            "7":13.3,
            "8":16.2,
            "9":19.3,
            "10":22.6,
            "11":25.8,
            "12":29.3,
            "13":32,
            "14":34.7,
            "15":38,
            "16":41.3,
            "17":44.6,
            "18":47.9,
            "19":51.2,
            "20":54.5
        };
        public static var MW_GROW_MAP:* = {
            "1":MW_HP_GROW_MAP,
            "11":MW_SPEED_GROW_MAP
        };
        public static var MW_TRANS_COST_RATE:* = 0.1;
        public static var REFRESH_TIME:Number = 10;
        public static var CHAT_INTERVAL:Number = 1.2;
        public static var CHAT_WORLD_INTERVAL:Number = 125;
        public static var CHAT_TOOFAST:String = Language.GAMEPREDEF_S[222];
        public static var CHAT_WORLD_TOOFAST:String = Language.GAMEPREDEF_S[223];
        public static var CREATURE_CLASS_HUMAN:int = 1;
        public static var CREATURE_CLASS_MONSTER:int = 2;
        public static var CREATURE_CLASS_PLANT:int = 3;
        public static var CREATURE_CLASS_MACHINE:int = 4;
        public static var CREATURE_CLASS_DEVIL:int = 5;
        public static var CREATURE_CLASS_DRAGON:int = 6;
        public static var CREATURE_CLASS_BOSS:int = 7;
        public static var CREATURE_CLASS_NAME:Object = {};
        public static var CREATURE_CLASS_INFO:Object = {};
        public static var CREATURE_QLEVEL:Array = ["", Language.GAMEPREDEF_S[238], Language.GAMEPREDEF_S[239], Language.GAMEPREDEF_S[240]];
        public static var ELEMENT_LIGHT:int = 1;
        public static var ELEMENT_DARK:int = 2;
        public static var ELEMENT_WIND:int = 3;
        public static var ELEMENT_THUNDER:int = 4;
        public static var ELEMENT_WATER:int = 5;
        public static var ELEMENT_FIRE:int = 6;
        public static var ELEMENT_NAME:Object = {};
        public static var ELEMENT_INFO:Object = {};
        public static var PAGE_TYPE_BAG:uint = 1;
        public static var PAGE_TYPE_BANK:uint = 2;
        public static var MAX_BAG_TAB:uint = 9;
        public static var MAX_PET_TAB:uint = 10;
        public static var EMOTION_CODE:Object = {};
        public static var STATE_CODE_PREFIX:String = "2120230";
        public static var EQUIPT_PROP_HP:int = 1;
        public static var EQUIPT_PROP_MP:int = 2;
        public static var EQUIPT_PROP_SP:int = 3;
        public static var EQUIPT_PROP_ATTACK:int = 4;
        public static var EQUIPT_PROP_MATTACK:int = 5;
        public static var EQUIPT_PROP_DEFENCE:int = 6;
        public static var EQUIPT_PROP_MDEFENCE:int = 7;
        public static var EQUIPT_PROP_HIT:int = 8;
        public static var EQUIPT_PROP_DODGE:int = 9;
        public static var EQUIPT_PROP_COUNTER:int = 10;
        public static var EQUIPT_PROP_SPEED:int = 11;
        public static var EQUIPT_PROP_COMBO:int = 12;
        public static var EQUIPT_PROP_CRITICAL:int = 13;
        public static var EQUIPT_PROP_DEFY:int = 14;
        public static var EQUIPT_PROP_STRENGTH:int = 20;
        public static var EQUIPT_PROP_STAMINA:int = 21;
        public static var EQUIPT_PROP_INTELLIGENCE:int = 22;
        public static var EQUIPT_PROP_ENERGY:int = 23;
        public static var EQUIPT_PROP_HP_PER:int = 24;
        public static var EQUIPT_PROP_MP_PER:int = 25;
        public static var EQUIPT_PROP_REBORNRATE:int = 26;
        public static var EQUIPT_PROP_RESICRITICAL:int = 27;
        public static var EQUIPT_PROP_RESIDEBUFF:int = 28;
        public static var EQUIPT_PROP_RESIDEFY:int = 29;
        public static var EQUIPT_PROP_NAME:Object = {};
        public static var EQUSUIT_PROP_HP:int = 1;
        public static var EQUSUIT_PROP_HP_PER:int = 2;
        public static var EQUSUIT_PROP_MP:int = 3;
        public static var EQUSUIT_PROP_MP_PER:int = 4;
        public static var EQUSUIT_PROP_ATTACK:int = 5;
        public static var EQUSUIT_PROP_ATTACK_PER:int = 6;
        public static var EQUSUIT_PROP_MATTACK:int = 7;
        public static var EQUSUIT_PROP_MATTACK_PER:int = 8;
        public static var EQUSUIT_PROP_DEFENCE:int = 9;
        public static var EQUSUIT_PROP_DEFENCE_PER:int = 10;
        public static var EQUSUIT_PROP_MDEFENCE:int = 11;
        public static var EQUSUIT_PROP_MDEFENCE_PER:int = 12;
        public static var EQUSUIT_PROP_HIT:int = 13;
        public static var EQUSUIT_PROP_DODGE:int = 14;
        public static var EQUSUIT_PROP_COUNTER:int = 15;
        public static var EQUSUIT_PROP_SPEED:int = 16;
        public static var EQUSUIT_PROP_SPEED_PER:int = 17;
        public static var EQUSUIT_PROP_COMBO:int = 18;
        public static var EQUSUIT_PROP_CRITICAL:int = 19;
        public static var EQUSUIT_PROP_DEFY:int = 20;
        public static var EQUSUIT_PROP_DEBUFFSUCCRATE:int = 21;
        public static var EQUSUIT_PROP_RESICRITICAL:int = 22;
        public static var EQUSUIT_PROP_REBORNRATE:int = 23;
        public static var EQUSUIT_PROP_RESIDEBUFF:int = 24;
        public static var EQUSUIT_PROP_RESIDEFY:int = 25;
        public static var EQUSUIT_PROP_ENHPHYHURT:int = 26;
        public static var EQUSUIT_PROP_CRITICAL_DAMAGE:int = 27;
        public static var EQUSUIT_PROP_NAME:Object = {};
        public static var EQUIPT_QUALITY:Object = {};
        public static var ARTIFACT_QUALITY:* = {
            "MIN":{
                "min":0.3,
                "max":0.3
            },
            "0":{
                "min":0.3,
                "max":0.3
            },
            "1":{
                "min":0.3,
                "max":0.3
            },
            "2":{
                "min":0.3,
                "max":0.4
            },
            "3":{
                "min":0.4,
                "max":0.5
            },
            "4":{
                "min":0.5,
                "max":0.6
            },
            "5":{
                "min":0.6,
                "max":0.7
            },
            "6":{
                "min":0.7,
                "max":0.8
            },
            "7":{
                "min":0.8,
                "max":0.9
            },
            "8":{
                "min":0.9,
                "max":1
            },
            "MAX":{
                "min":0.9,
                "max":1
            }
        };
        public static var EQUIPT_ACTIVE_ATTACK:int = 1;
        public static var EQUIPT_ACTIVE_MATTACK:int = 2;
        public static var EQUIPT_ACTIVE_CRITICAL:int = 3;
        public static var EQUIPT_ACTIVE_DEFY:int = 4;
        public static var EQUIPT_ACTIVE_REDUCEHURT1:int = 5;
        public static var EQUIPT_ACTIVE_REDUCEHURT2:int = 6;
        public static var EQUIPT_ACTIVE_REDUCEHURT3:int = 7;
        public static var EQUIPT_ACTIVE_HP:int = 8;
        public static var EQUIPT_ACTIVE_NAME:Object = {};
        public static var JEWEL_PROP_STRENGTH:int = 1;
        public static var JEWEL_PROP_AGILITH:int = 2;
        public static var JEWEL_PROP_STAMINA:int = 3;
        public static var JEWEL_PROP_INTELLIGENCE:int = 4;
        public static var JEWEL_PROP_ENERGY:int = 5;
        public static var JEWEL_PROP_LUCK:int = 6;
        public static var JEWEL_PROP_RESIDIZZY:int = 7;
        public static var JEWEL_PROP_RESICONFUSION:int = 8;
        public static var JEWEL_PROP_RESISLEEP:int = 9;
        public static var JEWEL_PROP_RESIPOISON:int = 10;
        public static var JEWEL_PROP_RESIFIRE:int = 11;
        public static var JEWEL_PROP_RESIICE:int = 12;
        public static var JEWEL_PROP_RESILIGHT:int = 13;
        public static var JEWEL_PROP_RESIRAGE:int = 14;
        public static var JEWEL_PROP_NAME:Object = {};
        public static const FEATHER_PROP_ATTACK:int = 1;
        public static const FEATHER_PROP_MATTACK:int = 2;
        public static const FEATHER_PROP_HIT:int = 3;
        public static const FEATHER_PROP_CRITICAL:int = 4;
        public static const FEATHER_PROP_DEFENCE:int = 5;
        public static const FEATHER_PROP_RESICRITICAL:int = 6;
        public static const FEATHER_PROP_HP:int = 7;
        public static const FEATHER_PROP_MP:int = 8;
        public static const FEATHER_PROP_SPEED:int = 9;
        public static const FEATHER_PROP_REBORN:int = 10;
        public static const FEATHER_PROP_CONFUSION:int = 11;
        public static const FEATHER_PROP_DIZZY:int = 12;
        public static const FEATHER_PROP_POISON:int = 13;
        public static const FEATHER_PROP_RAGE:int = 14;
        public static const FEATHER_PROP_SLEEP:int = 15;
        public static const FEATHER_PROP_LIGHT:int = 16;
        public static const FEATHER_PROP_RESICONFUSION:int = 17;
        public static const FEATHER_PROP_RESIDIZZY:int = 18;
        public static const FEATHER_PROP_RESIPOISON:int = 19;
        public static const FEATHER_PROP_RESIRAGE:int = 20;
        public static const FEATHER_PROP_RESISLEEP:int = 21;
        public static const FEATHER_PROP_RESILIGHT:int = 22;
        public static var FEATHER_PROP_NAME:Object = {};
        public static var PRE_EQU_NAME:Object = {};
        public static var POSTFIX_MATERIAL_NAME:Array = [Language.GAMEPREDEF_S[295], Language.GAMEPREDEF_S[296], Language.GAMEPREDEF_S[297], Language.GAMEPREDEF_S[298], Language.GAMEPREDEF_S[299], Language.GAMEPREDEF_S[363]];
        public static const EQUIP_TYPE_ATTACK:int = 1;
        public static const EQUIP_TYPE_DEFENCE:int = 2;
        public static const EQUIP_FUNCTYPE:Object = {};
        public static var EQUIP_POSITION:Object = {};
        public static var PETEQU_NUM:int = 8;
        public static var PETEQU_POS_BEGIN:int = 50;
        public static var PETEQU_POS_END:int = 57;
        public static var MONEY_EQUFUNC_STAR:int = 200;
        public static var MONEY_EQUFUNC_DIG:int = 2000;
        public static var MONEY_EQUFUNC_MAKE:int = 10;
        public static var MONEY_EQUFUNC_NAME:int = 10000;
        public static var MONEY_EQUFUNC_ELEMENT:int = 30000;
        public static var MONEY_EQUFUNC_ACTIVE:int = 50000;
        public static var GOLD_PET_SKILLOPEN:Array = [0, 0, 0, 0, 0, 0, 10, 20, 40, 70, 110, 160, 220, 290, 370, 460];
        public static var GOLD_PET_SKILLOPEN_Q:Array = [0, 1, 3, 10];
        public static var EQUIPT_STAR_NUM:Array = [1, 1.1, 1.21, 1.33, 1.46, 1.61, 1.77, 1.94, 2.14, 2.36, 2.6];
        public static var EQUIPT_STAR_MAX:int = 10;
        public static var EQUIPT_STAR_SUCCESS:Array = [100, 100, 100, 90, 80, 70, 60, 50, 30, 30, 30];
        public static var EQUIPT_STAR_SUCCESS_BUFF:Array = [100, 100, 100, 100, 100, 95, 80, 70, 45, 45, 45];
        public static var WING_JOIN_SUCCESS:Array = [100, 80, 50, 30];
        public static var WING_REDUCE_RATE:Number = 5;
        public static var WING_PREFIX_ITEM_NUM:Object = {
            "3":5,
            "4":15
        };
        public static var WING_PREFIX_ITEM_ID:Number = 2937;
        public static var WING_BIND_ITEM_NUM:Number = 10;
        public static var WING_BIND_ITEM_ID:Number = 2843;
        public static var WING_HOLE_ITEM_NUM:Object = {
            "0":1,
            "1":5,
            "2":25,
            "3":125,
            "4":625
        };
        public static var WING_HOLE_ITEM_ID:Number = 2907;
        public static var WING_HOLE_COLOR_HOLE_MAP:Object = {
            "0":22,
            "1":22,
            "2":22,
            "3":33,
            "4":55
        };
        public static var WING_STAR_ITEM_ID:Number = 2906;
        public static var MAX_PET_COUNT:int = 30;
        public static var MAX_PET_PER_PAGE:int = 18;
        public static var PET_STAR_MAX:int = 12;
        public static var PET_STAR_SUCCESS:Array = [100, 100, 100, 90, 80, 70, 60, 50, 30, 30, 30, 30, 20];
        public static var PET_STAR_SUCCESS_BUFF:Array = [100, 100, 100, 100, 100, 100, 90, 75, 50, 50, 50, 50, 35];
        public static var PET_JOIN_SUCCESS:Array = [100, 80, 50, 30];
        public static var PET_GROWRATE_NUM:Array = [1.1, 1.3, 1.6, 2, 2.5];
        public static var SKILL_AREA_TYPE:Object = {};
        public static var SKILL_KIND_NAME:Array = ["", Language.GAMEPREDEF_S[316], Language.GAMEPREDEF_S[317], Language.GAMEPREDEF_S[318], Language.GAMEPREDEF_S[319], Language.GAMEPREDEF_S[365]];
        public static var SKILL_TYPE_NAME:Object = {};
        public static var SKILL_TYPE_CLOSE:int = 1;
        public static var SKILL_TYPE_REMOTE:int = 2;
        public static var SKILL_TYPE_MAGIC:int = 3;
        public static var SKILL_TYPE_MAGIC_BULLET:int = 4;
        public static var SKILL_TYPE_MAGIC_RECOVER:int = 5;
        public static var SKILL_TYPE_STATE_ADD:int = 6;
        public static var SKILL_TYPE_STATE_DEL:int = 7;
        public static var SKILL_TYPE_FUNC_HURT:int = 8;
        public static var SKILL_TYPE_FUNC_RECOVER:int = 9;
        public static var SKILL_TYPE_DEFENDER:int = 10;
        public static var SKILL_TYPE_OTHER:int = 11;
        public static var SKILL_TYPE_FISHING:int = 14;
        public static var SKILL_TYPE_PLANT:int = 15;
        public static var SKILL_TYPE_HERB:int = 16;
        public static var SKILL_TYPE_COOK:int = 17;
        public static var SKILL_TYPE_PHARMACY:int = 18;
        public static var SKILL_TYPE_HIDDEN_WEAPON:int = 19;
        public static var SKILL_TYPE_SEW:int = 20;
        public static var SKILL_TYPE_COOKBOOK:int = 21;
        public static var SKILL_TYPE_MEDICINEBOOK:int = 22;
        public static var SKILL_USE_ENV:Object = {};
        public static var CHANNEL_PANEL_ALL:String = Language.GAMEPREDEF_S[333];
        public static var CHANNEL_PANEL_GLOBAL:String = Language.GAMEPREDEF_S[334];
        public static var CHANNEL_PANEL_GUILD:String = Language.GAMEPREDEF_S[335];
        public static var CHANNEL_PANEL_GROUP:String = Language.GAMEPREDEF_S[336];
        public static var CHANNEL_PANEL_BATTLE:String = Language.GAMEPREDEF_S[337];
        public static var VALID_DIS_BATTLE_CLOSETO:Number = 60;
        public static var VALID_DIS_BATTLE_BACK:Number = 10;
        public static var BUFF_PROP_HP:uint = 1;
        public static var BUFF_PROP_MP:uint = 2;
        public static var BUFF_PROP_SP:uint = 3;
        public static var BUFF_PROP_ATTACK:uint = 4;
        public static var BUFF_PROP_MATTACK:uint = 5;
        public static var BUFF_PROP_DEFENCE:uint = 6;
        public static var BUFF_PROP_MDEFENCE:uint = 7;
        public static var BUFF_PROP_HIT:uint = 8;
        public static var BUFF_PROP_DODGE:uint = 9;
        public static var BUFF_PROP_COUNTER:uint = 10;
        public static var BUFF_PROP_SPEED:uint = 11;
        public static var BUFF_PROP_COMBO:uint = 12;
        public static var BUFF_PROP_CRITICAL:uint = 13;
        public static var BUFF_PROP_DEFY:uint = 14;
        public static var BUFF_PROP_REDUCEHURT1:uint = 15;
        public static var BUFF_PROP_REDUCEHURT2:uint = 16;
        public static var BUFF_PROP_REDUCEHURT3:uint = 17;
        public static var SYS_MSG_CODE_STARSUCCESS:uint = 100;
        public static var SYS_MSG_CODE_STARFAILURE:uint = 200;
        public static var SYS_MSG_CODE_MAKEPURPLE:uint = 300;
        public static var SYS_MSG_CODE_MAKEYELLOW:uint = 400;
        public static var BADWORD:String = Language.GAMEPREDEF_S[338];
        public static var BADWORDAR:Array = BADWORD.split("|");
        public static var CHAT_STR_MAX:int = 55;
        public static var FREE_ANSWER:int = 20;
        public static var MAX_ANSWER:int = 50;
        public static var ANSWER_MONEY_NUM:Number = 0.083;
        public static var CLASS_QUEST_EXP_NUM:Number = 0.1;
        public static var CLASS_QUEST_MONEY_NUM:Number = 0.17;
        public static var MAX_QUEST_NUM:int = 25;
        public static var MAX_CALLBOARD_QUEST_NUM:int = 4;
        public static var CALLBOARD_AWARD_NUM:Array = [1, 2, 8, 12, 20];
        public static var TEACHER_TITLE:Array = [Language.GAMEPREDEF_S[339], Language.GAMEPREDEF_S[340], Language.GAMEPREDEF_S[341], Language.GAMEPREDEF_S[342], Language.GAMEPREDEF_S[343], Language.GAMEPREDEF_S[344], Language.GAMEPREDEF_S[345]];
        public static var STUDENT_NUM:Array = [0, 5, 10, 15, 20, 25, 30];
        public static var SYSTEM_TIP_STR1:String = Language.GAMEPREDEF_S[346];
        public static var SYSTEM_TIP_STR2:String = Language.GAMEPREDEF_S[347];
        public static var SYSTEM_TIP_STR3:String = Language.GAMEPREDEF_S[408];
        public static var SYSTEM_TIP:Array = [];
        public static const SHOP_SELL_TYPE_HOT:String = "1";
        public static const SHOP_SELL_TYPE_DISCOUNT:String = "2";
        public static const SHOP_SELL_TYPE_LIMIT:String = "3";
        public static const SHOP_SELL_TYPE_NEW:String = "4";
        public static const SHOP_SELL_TYPE_HIDE:String = "5";
        public static const SHOP_TAB_HOT:String = "Hot";
        public static const SHOP_TAB_DISCOUNT:String = "Discount";
        public static const SHOP_TAB_LIMIT:String = "Limit";
        public static const SHOP_TAB_LIMIT_TIME:String = "LimitTime";
        public static const SHOP_TAB_NEW:String = "New";
        public static const SHOP_TAB_PET:String = "Pet";
        public static const SHOP_TAB_TREASURE:String = "Treasure";
        public static const SHOP_TAB_MATERIAL:String = "Material";
        public static const SHOP_TAB_JEWEL:String = "Jewel";
        public static const SHOP_TAB_SCROLL:String = "Scroll";
        public static const SHOP_TAB_FOOD:String = "Food";
        public static const SHOP_TAB_POINT:String = "Point";
        public static const SHOP_TAB_BOOK:String = "Book";
        public static const SHOP_TAB_DRESS:String = "Dress";
        public static const SHOP_TAB_FLYER:String = "Flyer";
        public static const SHOP_TAB_SEARCH:String = "Search";
        public static const SHOP_TAB_Other:String = "Other";
        public static const WORLD_SAY_LEVAL_FREE:Number = 10;
        public static const RUMOUR_SAY_LEVAL_FREE:Number = 10;
        public static const LONG_BUFF_REFRESH_INTERVAL:* = 10000;
        public static const GLOBAL_DOUBLE_EXP_BID:Number = 1092;
        public static const GLOBAL_PET_RATE_BID:Number = 2006;
        public static const MEET_BATTLE_ON_STILL_BID:Number = 1203;
        public static const VIP_SHOP_ID:int = 99;
        public static const VIP_SHOP_REFLASH_GOLD:* = 20;
        public static const STAR_3_VIP:Number = 1206;
        public static const STAR_4_VIP:Number = 1207;
        public static const STAR_5_VIP:Number = 1208;
        public static const STAR_6_VIP:Number = 1209;
        public static const STAR_7_VIP:Number = 1210;
        public static const BBS_1_VIP:Number = 1507;
        public static const BBS_2_VIP:Number = 1508;
        public static const BBS_3_VIP:Number = 1509;
        public static const DOG_FIGHT_B1:Number = 1755;
        public static const DOG_FIGHT_B2:Number = 1756;
        public static const DOG_FIGHT_B3:Number = 1757;
        public static const STAR_3_TID:Number = 66;
        public static const STAR_4_TID:Number = 69;
        public static const STAR_5_TID:Number = 70;
        public static const STAR_6_TID:Number = 71;
        public static const STAR_7_TID:Number = 72;
        public static const DOG_FIGHT_T1:Number = 92;
        public static const DOG_FIGHT_T2:Number = 93;
        public static const DOG_FIGHT_T3:Number = 94;
        public static const FEMALE_TITLE_1:int = 73;
        public static const FEMALE_TITLE_2:int = 74;
        public static const FEMALE_TITLE_3:int = 75;
        public static const FEMALE_TITLE_4:int = 76;
        public static const SPE_RICH_PEOPLE:int = 101;
        public static const SPE_LIGHT_WUYO:int = 138;
        public static const SPE_GODDESS_BLESS:int = 139;
        public static const SPE_ANGRY_SOUL:int = 140;
        public static const SPE_UNDYING_BIRD:int = 141;
        public static const SPE_MOLI_BABY_1:int = 33;
        public static const SPE_MOLI_BABY_2:int = 32;
        public static const SPE_MOLI_BABY_3:int = 31;
        public static const SPE_MOLI_MAN_1:int = 160;
        public static const SPE_MOLI_MAN_2:int = 159;
        public static const SPE_MOLI_MAN_3:int = 158;
        public static var ST_DH1:uint = 192;
        public static var ST_DH2:uint = 193;
        public static var ST_DH3:uint = 194;
        public static var ST_DH4:uint = 195;
        public static var ST_DH5:uint = 196;
        public static var ST_DH6:uint = 197;
        public static var ST_DH7:uint = 198;
        public static const SPE_ACADEMIC_SUCCESS:int = 187;
        public static const SPE_MOLI_SCHOLAR:int = 199;
        public static const SPE_REVENGE_SOUL:int = 200;
        public static const VT_KUAFUZHAN1:int = 310;
        public static const VT_KUAFUZHAN2:int = 311;
        public static const SPE_PK_WINNER_A:int = 205;
        public static const SPE_PK_WINNER_B:int = 206;
        public static const SPE_PK_WINNER_C:int = 207;
        public static const SPE_PK_WINNER_D:int = 208;
        public static const SPE_PK_WINNER_MALE_A:int = 231;
        public static const SPE_PK_WINNER_MALE_B:int = 233;
        public static const SPE_PK_WINNER_MALE_C:int = 235;
        public static const SPE_PK_WINNER_MALE_D:int = 237;
        public static const SPE_PK_WINNER_FEMALE_A:int = 230;
        public static const SPE_PK_WINNER_FEMALE_B:int = 232;
        public static const SPE_PK_WINNER_FEMALE_C:int = 234;
        public static const SPE_PK_WINNER_FEMALE_D:int = 236;
        public static const SPE_QIXI_MALE:int = 263;
        public static const VT_SANBA:int = 324;
        public static const SPE_QIXI_FEMALE:int = 262;
        public static const NEW_SERVER_MER_MALE:int = 266;
        public static const NEW_SERVER_MER_FEMALE:int = 265;
        public static const PK_WINNER_2013:int = 271;
        public static const HAOSHENGYIN_GUANJUN:int = 289;
        public static const HAOSHENGYIN_YAJUN:int = 290;
        public static const HAOSHENGYIN_JIJUN:int = 291;
        public static const SPE_CROSS_PK_A:int = 280;
        public static const SPE_CROSS_PK_B:int = 281;
        public static const SPE_CROSS_PK_C:int = 282;
        public static const SPE_CROSS_PK_D:int = 283;
        public static const SPE_BAOBEI:int = 352;
        public static const CHENHAOTEXIAO_346:int = 346;
        public static const CHENHAOTEXIAO_347:int = 346;
        public static const CHENHAOTEXIAO_348:int = 348;
        public static const CHENHAOTEXIAO_349:int = 349;
        public static const CHENHAOTEXIAO_350:int = 350;
        public static const ZHI_ZHU_ZAI_WO:int = 353;
        public static const XIAN_FA_ZHI_REN:int = 354;
        public static const LAO_BU_KE_PO:int = 355;
        public static const WU_JIAN_BU_CUI:int = 356;
        public static const MOLI_XINGXIANG_1:int = 359;
        public static const MOLI_XINGXIANG_2:int = 360;
        public static const MOLI_XINGXIANG_3:int = 361;
        public static const MOLI_XINGXIANG_4:int = 362;
        public static const MOLI_XINGXIANG_5:int = 363;
        public static const SPE_ANNI_EIGHT:int = 416;
        public static const SPE_YUANDAN:int = 417;
        public static const SPE_SHOWTIME_A:int = 421;
        public static const SPE_SHOWTIME_B:int = 420;
        public static const SPE_SHOWTIME_C:int = 419;
        public static const SPE_SHOWTIME_D:int = 418;
        public static const SPE_MOLI_MAN_2018_1:int = 429;
        public static const SPE_MOLI_MAN_2018_2:int = 430;
        public static const SPE_MOLI_MAN_2018_3:int = 431;
        public static const SPE_PET_PK_20191:int = 434;
        public static const SPE_PET_PK_20192:int = 435;
        public static const SPE_PET_PK_20193:int = 436;
        public static const SPE_ZHONGQIU2019:int = 437;
        public static const SPE_BAISEVDAY2020:int = 445;
        public static const SPE_MOLI_2020_1:int = 448;
        public static const SPE_MOLI_2020_2:int = 447;
        public static const SPE_MOLI_2020_3:int = 446;
        public static const SPE_XCDS_1:int = 449;
        public static const SPE_XCDS_2:int = 450;
        public static const SPE_XCDS_3:int = 451;
        public static const SPE_YSXG:int = 452;
        public static const SPE_ML12:int = 453;
        public static const SPE_TXKC:int = 459;
        public static const SPE_ML13:int = 460;
        public static const SPE_QL2101:int = 463;
        public static const SPE_QL2102:int = 462;
        public static const SPE_QL2103:int = 461;
        public static const SPE_XZ2201:int = 465;
        public static const SPE_XZ2207:int = 466;
        public static const SPE_BUYER2208:int = 467;
        public static const SPE_ML14:int = 468;
        public static const SPE_BUYER2212:int = 469;
        public static const SPE_CHUNRIHUAKAI:int = 470;
        public static const SPE_TONGXINTONGQU:int = 471;
        public static const SPE_ML15:int = 472;
        public static const SPE_WSJ2301:int = 473;
        public static const SPE_WSJ2302:int = 474;
        public static const SPE_MCZDTITLE_A1:int = 475;
        public static const SPE_MCZDTITLE_A2:int = 476;
        public static const SPE_MCZDTITLE_A3:int = 477;
        public static const SPE_MCZDTITLE_B1:int = 478;
        public static const SPE_MCZDTITLE_B2:int = 479;
        public static const SPE_MCZDTITLE_B3:int = 480;
        public static const SPE_MCZDTITLE_C1:int = 481;
        public static const SPE_MCZDTITLE_C2:int = 482;
        public static const SPE_MCZDTITLE_C3:int = 483;
        public static const SPE_MCZDTITLE_D1:int = 484;
        public static const SPE_MCZDTITLE_D2:int = 485;
        public static const SPE_MCZDTITLE_D3:int = 486;
        public static const SPE_MCZDTITLE_E1:int = 487;
        public static const SPE_MCZDTITLE_E2:int = 488;
        public static const SPE_MCZDTITLE_E3:int = 489;
        public static const SPE_MCZDTITLE_F1:int = 490;
        public static const SPE_MCZDTITLE_F2:int = 491;
        public static const SPE_MCZDTITLE_F3:int = 492;
        public static const SPE_MCZDTITLE_A1_F:int = 493;
        public static const SPE_MCZDTITLE_A2_F:int = 494;
        public static const SPE_MCZDTITLE_A3_F:int = 495;
        public static const SPE_MCZDTITLE_B1_F:int = 496;
        public static const SPE_MCZDTITLE_B2_F:int = 497;
        public static const SPE_MCZDTITLE_B3_F:int = 498;
        public static const SPE_MCZDTITLE_C1_F:int = 499;
        public static const SPE_MCZDTITLE_C2_F:int = 500;
        public static const SPE_MCZDTITLE_C3_F:int = 501;
        public static const SPE_MCZDTITLE_D1_F:int = 502;
        public static const SPE_MCZDTITLE_D2_F:int = 503;
        public static const SPE_MCZDTITLE_D3_F:int = 504;
        public static const SPE_MCZDTITLE_E1_F:int = 505;
        public static const SPE_MCZDTITLE_E2_F:int = 506;
        public static const SPE_MCZDTITLE_E3_F:int = 507;
        public static const SPE_MCZDTITLE_F1_F:int = 508;
        public static const SPE_MCZDTITLE_F2_F:int = 509;
        public static const SPE_MCZDTITLE_F3_F:int = 510;
        public static const SPE_LOVERS2024_1:int = 511;
        public static const SPE_LOVERS2024_2:int = 0x0200;
        public static const SPE_LOVERS2024_3:int = 513;
        public static const SPE_SIXIANGSHOUHU:int = 0x0202;
        public static const SPE_MITANGZHILIAN:int = 515;
        public static const SPE_NUANXIANGZUIREN:int = 516;
        public static const SPE_SHUANGXUEQIMENG:int = 517;
        public static const SPE_CHAOJIBIANJU:int = 518;
        public static const SPE_ZUIJIABIANDAO:int = 519;
        public static const SPE_ML16:int = 520;
        public static const SPE_GUIXIANGMITANG:int = 521;
        public static const SPE_MOLIQILV:int = 522;
        public static const SPE_XINGGUANGCUICAN:int = 523;
        public static const SPE_XIUCHANGJIAODIAN:int = 524;
        public static const SPE_MEILIWUTAI:int = 525;
        public static const SPE_FENGSHANGZHIXING:int = 526;
        public static const SPE_SHENSHENGHUIGUANG:int = 527;
        public static const SPE_QIQUWANJIA:int = 528;
        public static const SPE_MOLIZHUIGUANG:int = 530;
        public static const TITLE_IMG_VISIABLE:Array = [73, 74, 75, 76];
        public static const DEFAULT_URL:String = "http://www.google.cn";
        public static const DEFAULT_TITLE:String = "Google";
        public static const VALID_DIS_ADD_GROUP:Number = 30;
        public static const MAX_GROUP_MEM_NUM:Number = 5;
        public static const TYPE_GUILD_BUILD:int = 1;
        public static const TYPE_PRIVATE_BUILD:int = 2;
        public static const TYPE_EXTEND_BUILD:int = 3;
        public static const TYPE_EXTEND_MAP:int = 4;
        public static const UPGRADE_BUILD:int = 1;
        public static const CREATE_BUILD:int = 2;
        public static const PROUDCT_GLOVE_EQUIP:Array = [1123, 1124, 1125, 1126, 1127, 1131];
        public static const EVENT_REFRESH_FUNCSLOTS:String = "EVENT_REFRESH_FUNCSLOTS";
        public static const EVENT_FUNCBAG_CLICK:String = "EVENT_FUNCBAG_CLICK";
        public static var PROP_NAME:Object = {
            "1":Language.GAMEPREDEF_S[398],
            "2":Language.GAMEPREDEF_S[399],
            "3":Language.GAMEPREDEF_S[400],
            "4":Language.GAMEPREDEF_S[401],
            "5":Language.GAMEPREDEF_S[402],
            "6":Language.GAMEPREDEF_S[403]
        };
        public static var TYPE_KICK:Number = 1;
        public static var TYPE_QUIT:Number = 2;
        public static var TYPE_REFUSE:Number = 3;
        public static var TYPE_GIVEUP:Number = 4;
        public static var DONATE_CONTRIB:Number = 1;
        public static var NORMAL_CONTRIB:Number = 2;
        public static var GUILD_MONEY:Number = 3;
        public static var GUILD_EXP:Number = 4;
        public static var IN_BUILDING:Number = 10;
        public static var GUILD_GENERAL_M:Number = 2026;
        public static var GUILD_RARE_M:Number = 2027;
        public static var GUILD_SPE_M:Number = 2039;
        public static var BUILD_NPC_INBUILDING:Number = 1;
        public static var BUILD_NPC_TOBEBUILD:Number = 0;
        public static var BUILD_NPC_INBUILDING_RES:String = "2060090000101";
        public static var BUILD_NPC_TOBEBUILD_RES:String = "2060090000100";
        public static var FLIGHT_HEIGHT:int = 100;
        public static var FLYING_STATE_ON_GROUND:int = 0;
        public static var FLYING_STATE_TAKING_OFF:int = 1;
        public static var FLYING_STATE_IN_THE_AIR:int = 2;
        public static var FLYING_STATE_PRE_LANDING:int = 3;
        public static var FLYING_STATE_LANDING:int = 4;
        public static var FLYING_STATE_DOUBLE_FLY:int = 5;
        public static const DFLYING_DISTANCE_NORMAL:int = 20;
        public static const DFLYING_DISTANCE_PLAYER:int = 40;
        public static var MOUNT_STATE_OFF:int = 0;
        public static var MOUNT_STATE_ON:int = 1;
        public static var FLYING_ZOOM_RATE:Number = 0.7;
        public static var FLYING_PLAYER_ZOOM_RATE:Number = 0.9;
        public static const C_FLYING_ZOOM_RATE:Number = 0.7;
        public static const C_FLYING_PLAYER_ZOOM_RATE:Number = 0.9;
        public static var LEVELUP_REQ_NUM:Object = {
            "40":{
                "id":2333,
                "req":5
            },
            "60":{
                "id":2333,
                "req":10
            },
            "80":{
                "id":2333,
                "req":15
            },
            "100":{
                "id":2333,
                "req":20
            },
            "120":{
                "id":2333,
                "req":25
            },
            "140":{
                "id":2333,
                "req":50
            },
            "160":{
                "id":2333,
                "req":50
            }
        };
        public static var SPEC_LEVELUP_REQ_NUM:Object = {
            "40":{
                "id":2529,
                "req":5
            },
            "60":{
                "id":2529,
                "req":10
            },
            "80":{
                "id":2529,
                "req":15
            },
            "100":{
                "id":2529,
                "req":20
            },
            "120":{
                "id":2529,
                "req":25
            },
            "140":{
                "id":2529,
                "req":30
            }
        };
        public static var MODCOLOR_REQ_NUM:Object = {
            "0":{
                "id":2334,
                "req":1,
                "rate":80
            },
            "1":{
                "id":2334,
                "req":2,
                "rate":50
            },
            "2":{
                "id":2334,
                "req":4,
                "rate":30
            },
            "3":{
                "id":2335,
                "req":8,
                "rate":20
            },
            "4":{
                "id":-1,
                "req":-1,
                "rate":0
            }
        };
        public static var SPEC_MODCOLOR_REQ_NUM:Object = {
            "0":{
                "id":2528,
                "req":1,
                "rate":80
            },
            "1":{
                "id":2528,
                "req":2,
                "rate":50
            },
            "2":{
                "id":2528,
                "req":4,
                "rate":30
            },
            "3":{
                "id":2528,
                "req":6,
                "rate":20
            },
            "4":{
                "id":-1,
                "req":-1,
                "rate":0
            }
        };
        public static var MODBIND_REQ_NUM:* = {
            "40":{
                "lv":"40",
                "id":2809,
                "req":1
            },
            "80":{
                "lv":"80",
                "id":2809,
                "req":2
            },
            "100":{
                "lv":"100",
                "id":2809,
                "req":4
            },
            "120":{
                "lv":"120",
                "id":2809,
                "req":8
            },
            "140":{
                "lv":"140",
                "id":2809,
                "req":16
            },
            "160":{
                "lv":"160",
                "id":2809,
                "req":24
            }
        };
        public static var MODPRE_REQ_NUM:* = {
            "3":{
                "color":"3",
                "id":3491,
                "req":1
            },
            "4":{
                "color":"4",
                "id":3491,
                "req":4
            }
        };
        public static var SPIRITUALITY_COST:* = {
            "1":400000,
            "2":792000,
            "3":0x15F900,
            "4":2470000,
            "5":0x3D8600,
            "6":6300000,
            "7":0x908800,
            "8":13770000,
            "9":19440000,
            "10":26752000,
            "11":36000000,
            "12":47502000,
            "13":61600000,
            "14":78660000,
            "15":99072000,
            "16":111360000,
            "17":124416000,
            "18":138240000,
            "19":152832000,
            "20":168192000
        };
        public static var LIFE_SKILL_PROP_MAP:* = {
            "14":"fishDex",
            "15":"plantDex",
            "16":"herbDex",
            "17":"cookDex",
            "18":"medicineDex"
        };
        public static var SYSTEM_SHOP_ID:Array = [35, 36, 41, 65, 66, 67, 70, 81, 88, 89];
        public static var GLOBAL_FRAME_RATE_DEFAULT:int = 28;
        public static var GLOBAL_FRAME_RATE:int = 24;
        public static var GLOBAL_FRAME_RATE_24:int = 24;
        public static var GLOBAL_FRAME_RATE_20:int = 20;
        public static var PET_NO_FLYACTION:int = 0;
        public static var PET_BEGIN_FLYING:int = 1;
        public static var PET_STOP_FLYING:int = 2;
        public static var SHOW_PET_BUFF:* = 1709;
        public static var SHOW_PET_BUFF2:* = 1979;
        public static var ARTIFACT_QUALITY_ARR:Array = [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
        public static var ARTIFACT_QUALITY_NAME_ARR:Array = [Language.GAMEPREDEF_S[412], Language.GAMEPREDEF_S[413], Language.GAMEPREDEF_S[414], Language.GAMEPREDEF_S[415], Language.GAMEPREDEF_S[416], Language.GAMEPREDEF_S[417], Language.GAMEPREDEF_S[418], Language.GAMEPREDEF_S[419]];
        public static var WING_QUALITY_NAME_ARR:Array = [Language.GAMEPREDEF_S[533], Language.GAMEPREDEF_S[534], Language.GAMEPREDEF_S[535], Language.GAMEPREDEF_S[536], Language.GAMEPREDEF_S[537], Language.GAMEPREDEF_S[538], Language.GAMEPREDEF_S[539], Language.GAMEPREDEF_S[540], Language.GAMEPREDEF_S[541], Language.GAMEPREDEF_S[542]];
        public static var SEND_COMBINE_ARR:Array = [Language.GAMEPREDEF_S[544], Language.GAMEPREDEF_S[545], Language.GAMEPREDEF_S[546], Language.GAMEPREDEF_S[547], Language.GAMEPREDEF_S[548], Language.GAMEPREDEF_S[549], Language.GAMEPREDEF_S[550], Language.GAMEPREDEF_S[551], Language.GAMEPREDEF_S[552], Language.GAMEPREDEF_S[553], Language.GAMEPREDEF_S[609], Language.GAMEPREDEF_S[610], Language.GAMEPREDEF_S[610], Language.GAMEPREDEF_S[612], Language.GAMEPREDEF_S[613], Language.GAMEPREDEF_S[614], Language.GAMEPREDEF_S[615], Language.GAMEPREDEF_S[616], Language.GAMEPREDEF_S[617], Language.GAMEPREDEF_S[618]];
        public static var TYPE_MARRIAGE_SEEKING:int = 0;
        public static var TYPE_MARRIAGE_REQUEST:int = 1;
        public static var MARRIAGE_LIST_MAX_LENGTH:int = 50;
        public static var MARRIAGE_MIN_LEVEL:int = 30;
        public static var MARRIAGE_MIN_MONEY:int = 1000000;
        public static var FLAG_PEOPLE_ENTER_FREE:int = 0;
        public static var FLAG_PEOPLE_ENTER_INVITATION:int = 1;
        public static var FORBID_OPEN_BY_LINK_EVENT_PANEL:Array = [270, 20, 30, 886, 970, 972, 973, 974, 949, 951, 950, 952, 941, 881, 937, 964, 965, 966, 967, 926, 910, 911, 913, 916, 922, 925, 929, 978, 979, 980, 983, 984, 985, 986, 987, 989, 990, 991, 992, 993, 994, 995, 791, 9201, 848, 834, 170, 996, 997, 998, 999, 1000, 661, 681, 700, 878];
        public static var GUIDE_TYPE_FINISH_QUEST:int = 0;
        public static var GUIDE_TYPE_ACTIVE_CLICK:int = 1;
        public static var GUIDE_TYPE_PET_FIGHT_AI:int = 2;
        public static var GUIDE_TYPE_CHAR_ADD_POINTS:int = 3;
        public static var GUIDE_TYPE_WEAPONS_INTRO:int = 4;
        public static var GUIDE_TYPE_ARMOR_INTRO:int = 5;
        public static var GUIDE_TYPE_COLLEGE_INTRO:int = 6;
        public static var GUIDE_TYPE_BATTLE_CMD:int = 7;
        public static var GUIDE_TYPE_MAP_TRAVEL:int = 8;
        public static var GUIDE_TYPE_FIRST_LOGIN:int = 9;
        public static var GUIDE_TYPE_MAGIC_ADD_BAG:int = 10;
        public static var SHOW_GUIDE_TYPE_BUBBLE:int = 0;
        public static var SHOW_GUIDE_TYPE_ALERT:int = 1;
        public static var MAP_ID_BY_CLASS:Array = [-1, 12, 13, 11, 32, 39, 25];
        public static var MAP_ID_CHUYUN:int = 1;
        public static var PET_AUTO_BATTLE_SLOT_ID:Array = [2, 4, 6, 8, 10];
        public static var PET_AUTO_BATTLE_SLIDE_ID:Array = [6, 7, 8, 9];
        public static var HP_ADD_BAG_ON_TRIAL:int = 2847;
        public static var TRAINING_SKILL_ORDER:Object = {
            "SKILL493201":1,
            "SKILL494301":2,
            "SKILL494401":3,
            "SKILL505101":4,
            "SKILL505201":5,
            "SKILL505301":6,
            "SKILL504501":7,
            "SKILL504601":8,
            "SKILL504701":9,
            "SKILL504801":10,
            "SKILL504901":11,
            "SKILL505001":12
        };
        public static var COUPLE_SKILL_CODE:Array = ["SKILL487901", "SKILL463101"];
        public static const COLOR_TXT:String = "<font color='{color}'>{txt}</font>";
        public static var STAR_PROP_DIC:Object = {
            "1":Language.STAR_EFFCT_PANEL_U[1],
            "2":Language.STAR_EFFCT_PANEL_U[2],
            "3":Language.STAR_EFFCT_PANEL_U[3],
            "4":Language.STAR_EFFCT_PANEL_U[4],
            "5":Language.STAR_EFFCT_PANEL_U[5],
            "6":Language.STAR_EFFCT_PANEL_U[6],
            "7":Language.STAR_EFFCT_PANEL_U[7],
            "8":Language.STAR_EFFCT_PANEL_U[8],
            "9":Language.STAR_EFFCT_PANEL_U[9],
            "10":Language.STAR_EFFCT_PANEL_U[10],
            "11":Language.STAR_EFFCT_PANEL_U[11],
            "12":Language.STAR_EFFCT_PANEL_U[12]
        };
        public static var TITLE_KIND_FOREVER:int = 1;
        public static var TITLE_KIND_ACTIVE:int = 2;
        public static var TITLE_KIND_VIP:int = 3;
        public static const ALLOWED_ADVANCED_JOIN:Array = [2, 3];
        public static const MAX_ADVANCED_JOIN:Object = {
            "2":10,
            "3":16
        };
        public static const MIN_ADVANCED_JOIN:int = 4;
        public static const ADVANCED_JOIN_PROBABILITY:Array = new Array();
        public static const NUMBER_ITEM_ADVANCED_JOIN:Object = {
            "2":1,
            "3":2
        };
        public static const WING_MAX_ADVANCED_JOIN:Object = {
            "2":10,
            "3":16
        };
        public static const WING_MIN_ADVANCED_JOIN:int = 4;
        public static const WING_MAX_COLOR_LEVEL:int = 4;
        public static const WING_ADVANCED_JOIN_RATE:Array = new Array();
        public static const BROTHER_TITLE_ID:* = 153;
        public static const NET_DELAY_STATE:Array = [50, 100, 300, 500];
        public static const NET_DELAY_COLOR:Array = ["#66ff00", "#66ff00", "#ffba00", "#ffba00", "#ff0000"];
        public static const FEATHER_UPDATE_RATE:Object = {
            "0":100,
            "1":90,
            "2":75,
            "3":55
        };
        public static const FEATHER_UPDATE_RATE_ADDPER:Number = 5;
        public static const FEATHER_UPDATE_RATE_ADDPER_2:Number = 10;
        public static const FEATHER_LUCKY_ID:Number = 3021;
        public static const FEATHER_LUCKY_ID2:Number = 3017;
        public static const FEATHER_MIX_RATE:Object = {
            "2":60,
            "3":30
        };
        public static const FEATHER_DEL_MONEY:Array = [25000, 125000, 700000, 4500000, 40000000];
        public static const FARM_STATE_CLOSE:int = 0;
        public static const FARM_STATE_OPEN:int = 1;
        public static const FARM_STATE_CAN_OPEN:int = 2;
        public static const FARM_STATE_PLANTED:int = 3;
        public static const FARM_STATE_WAIT:int = 3;
        public static const MINE_NULL:int = -1;
        public static const MINE_GROW_ING:int = 0;
        public static const MINE_GROW_UP:int = 1;
        public static const MAX_FARM_NUM:int = 16;
        public static const FARM_LVUP_CONFIG:Array = [];
        public static const FARM_NUM_MONEY:Array = [];
        public static const DEFAULT_FARM_HEAD_ICON_CODE:Number = 3050070000007;
        public static const RESET_SPIRITUALITY_NEED:int = 40000;
        public static const RESET_STONE_NEED:int = 5;
        public static const MAGIC_WEAPON_RESET_LEVEL_LIMIT:int = 5;
        public static const MAP_GUILD_ID:int = 49;
        public static const ITEM_GUILD_TRANSPORT:int = 2036;
        public static const INST_MAP_ID:int = 1999999;
        public static const INPUT_PANEL_TITLE_SPLIT:* = "|#|";
        public static var FAIRY_COLOR_TO_TEXT:Array = [Language.FAIRY_MANAGER_PANEL_U[25], Language.FAIRY_MANAGER_PANEL_U[26], Language.FAIRY_MANAGER_PANEL_U[27], Language.FAIRY_MANAGER_PANEL_U[28], Language.FAIRY_MANAGER_PANEL_U[29]];
        public static var FAIRY_COLOR_EFFECT:Array = [20, 25, 30, 35, 40];
        public static var FAIRY_MAX_LEVEL:int = 20;
        public static var FAIRY_GROW_LEVEL:int = 50;
        public static const REBIRTH_SKILL_CODE:Object = {
            "SKILL546101":true,
            "SKILL546201":true,
            "SKILL547301":true,
            "SKILL546301":true,
            "SKILL546401":true,
            "SKILL546501":true,
            "SKILL546601":true,
            "SKILL546701":true,
            "SKILL546801":true,
            "SKILL546901":true,
            "SKILL547001":true,
            "SKILL547101":true
        };
        public static const ONLINE_ACT_AWARD_DURATION:int = 30;
        public static const STAR_ADDITION_COLOR:Array = [1, 2, 3, 4, 5];
        public static const STAR_ADDITION_BASIC_SUCCESS:Array = [1, 0.045, 0.0225, 0.01125, 0.005625];
        public static const STAR_ADDITION_ADD_SUCCESS:Array = [0, 0.015, 0.0075, 0.00375, 0.001875];
        public static const STAR_ADDITION_BASIC_MONEY:Object = {
            "1":300,
            "2":4500,
            "3":18000,
            "4":1200,
            "5":36000,
            "6":18000,
            "7":36000,
            "8":36000,
            "9":4500,
            "10":1200,
            "11":18000,
            "12":9000
        };
        public static const STAR_SPEED_UP_ITEM_IDS:Object = {
            "1":3316,
            "2":3317,
            "3":3318,
            "4":3319,
            "5":3320,
            "6":3321,
            "7":3322,
            "8":3323,
            "9":3324,
            "10":3325,
            "11":3326,
            "12":3327
        };
        public static const PET_GROW_ITEM_ADD_EXP:Object = {
            "961":30000,
            "962":150000,
            "964":300000,
            "1585":300000,
            "1586":2000000,
            "1587":0x61A800,
            "1836":12500000,
            "3339":100000000
        };
        public static const MAGIC_WEAPON_REPAIR_ENDURE_BASIC:uint = 500;
        public static const AFK_CAN_BACK_DIS:uint = 300;
        public static var SPECIAL_TITLE_IDARR:Object = {
            "209":true,
            "211":true
        };
        public static var TASK:Object = {
            "1":{
                "id":1,
                "taskIndex":0,
                "taskName":"Mê Huyễn Động",
                "battleCount":6,
                "money":200000,
                "needBagNum":4,
                "gold":9,
                "time":180000
            },
            "2":{
                "id":2,
                "taskIndex":0,
                "taskName":"Kho Báu Đại Mạc",
                "battleCount":6,
                "money":200000,
                "needBagNum":8,
                "gold":9,
                "time":180000
            },
            "3":{
                "id":3,
                "taskIndex":0,
                "taskName":"Lục Tiên Cảnh",
                "battleCount":6,
                "money":200000,
                "needBagNum":6,
                "gold":9,
                "time":180000
            },
            "4":{
                "id":4,
                "taskIndex":0,
                "taskName":"Liệt Diễm Thâm Uyên (Dễ)",
                "battleCount":7,
                "money":150000,
                "needBagNum":5,
                "gold":10,
                "time":180000
            },
            "5":{
                "id":5,
                "taskIndex":0,
                "taskName":"Liệt Diễm Thâm Uyên (Thường)",
                "battleCount":7,
                "money":200000,
                "needBagNum":5,
                "gold":10,
                "time":180000
            },
            "6":{
                "id":6,
                "taskIndex":0,
                "taskName":"Liệt Diễm Thâm Uyên (Khó)",
                "battleCount":8,
                "money":250000,
                "needBagNum":6,
                "gold":12,
                "time":180000
            },
            "7":{
                "id":7,
                "taskIndex":0,
                "taskName":"Trở Về Lang Huyệt (Dễ)",
                "battleCount":7,
                "money":150000,
                "needBagNum":5,
                "gold":10,
                "time":180000
            },
            "8":{
                "id":8,
                "taskIndex":0,
                "taskName":"Trở Về Lang Huyệt (Thường)",
                "battleCount":7,
                "money":200000,
                "needBagNum":5,
                "gold":10,
                "time":180000
            },
            "9":{
                "id":9,
                "taskIndex":0,
                "taskName":"Trở Về Lang Huyệt (Khó)",
                "battleCount":8,
                "money":250000,
                "needBagNum":6,
                "gold":12,
                "time":180000
            },
            "10":{
                "id":10,
                "taskIndex":0,
                "taskName":"Quỷ Hút Máu",
                "battleCount":7,
                "money":150000,
                "needBagNum":6,
                "gold":10,
                "time":180000
            },
            "11":{
                "id":11,
                "taskIndex":0,
                "taskName":"Quỷ Hút Máu (Thường)",
                "battleCount":7,
                "money":200000,
                "needBagNum":6,
                "gold":10,
                "time":180000
            },
            "12":{
                "id":12,
                "taskIndex":0,
                "taskName":"Quỷ Hút Máu  (Khó)",
                "taskName2":"Quỷ Hút Máu",
                "battleCount":8,
                "money":200000,
                "needBagNum":7,
                "gold":12,
                "time":180000
            },
            "13":{
                "id":13,
                "taskIndex":0,
                "taskName":"Thế Giới Số  (Dễ)",
                "taskName2":"Thế Giới Số",
                "battleCount":7,
                "money":100000,
                "needBagNum":8,
                "gold":10,
                "time":180000
            },
            "14":{
                "id":14,
                "taskIndex":0,
                "taskName":"Thế Giới Số  (Thường)",
                "taskName2":"Thế Giới Số",
                "battleCount":7,
                "money":150000,
                "needBagNum":9,
                "gold":10,
                "time":180000
            },
            "15":{
                "id":15,
                "taskIndex":0,
                "taskName":"Thế Giới Số  (Khó)",
                "taskName2":"Thế Giới Số",
                "battleCount":8,
                "money":200000,
                "needBagNum":10,
                "gold":12,
                "time":180000
            },
            "16":{
                "id":16,
                "taskIndex":0,
                "taskName":"Thám Hiểm Di Tích",
                "taskName2":"Thám Hiểm Di Tích",
                "battleCount":8,
                "money":200000,
                "needBagNum":8,
                "gold":12,
                "time":180000
            },
            "51":{
                "id":51,
                "taskIndex":0,
                "taskName":"NV Thần Tu",
                "battleCount":20,
                "money":200000,
                "needBagNum":0,
                "gold":20,
                "time":90000
            },
            "52":{
                "id":52,
                "taskIndex":0,
                "taskName":"NV Thần Tu",
                "battleCount":10,
                "money":200000,
                "needBagNum":1,
                "gold":20,
                "time":90000
            },
            "101":{
                "id":101,
                "taskIndex":1,
                "taskName":"Cung Bạch Dương",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "102":{
                "id":102,
                "taskIndex":1,
                "taskName":"Cung Kim Ngưu",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "103":{
                "id":103,
                "taskIndex":1,
                "taskName":"Cung Song Tử",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "104":{
                "id":104,
                "taskIndex":1,
                "taskName":"Cung Cự Giải",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "105":{
                "id":105,
                "taskIndex":1,
                "taskName":"Cung Sư Tử",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "106":{
                "id":106,
                "taskIndex":1,
                "taskName":"Cung Xử Nữ",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "107":{
                "id":107,
                "taskIndex":1,
                "taskName":"Cung Thiên Bình",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "108":{
                "id":108,
                "taskIndex":1,
                "taskName":"Cung Hổ Cáp",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "109":{
                "id":109,
                "taskIndex":1,
                "taskName":"Cung Nhân Mã",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "110":{
                "id":110,
                "taskIndex":1,
                "taskName":"Cung Ma Kết",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "111":{
                "id":111,
                "taskIndex":1,
                "taskName":"Cung Bảo Bình",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            },
            "112":{
                "id":112,
                "taskIndex":1,
                "taskName":"Cung Song Ngư",
                "battleCount":1,
                "money":0,
                "needBagNum":1,
                "gold":2,
                "time":180000
            }
        };
        public static var EXP_SWEEP:Object = {
            "1":{
                "1":1.5,
                "2":1.5,
                "3":1.5,
                "4":1.5,
                "5":1.5,
                "6":1.5
            },
            "2":{
                "1":2.8,
                "2":2.8,
                "3":2.8,
                "4":2.8,
                "5":2.8,
                "6":2.8
            },
            "3":{
                "1":2.4,
                "2":2.4,
                "3":2.4,
                "4":2.4,
                "5":2.4,
                "6":2.4
            },
            "4":{
                "1":1.8,
                "2":1.8,
                "3":1.8,
                "4":1.8,
                "5":1.8,
                "6":1.8,
                "7":1.8
            },
            "5":{
                "1":2.28,
                "2":2.28,
                "3":2.28,
                "4":2.28,
                "5":2.28,
                "6":2.28,
                "7":2.28
            },
            "6":{
                "1":2.5,
                "2":2.5,
                "3":2.5,
                "4":2.5,
                "5":2.5,
                "6":2.5,
                "7":2.5,
                "8":2.5
            },
            "7":{
                "1":2.1,
                "2":2.1,
                "3":2.1,
                "4":2.1,
                "5":2.1,
                "6":2.1,
                "7":2.1
            },
            "8":{
                "1":2.6,
                "2":2.6,
                "3":2.6,
                "4":2.6,
                "5":2.6,
                "6":2.6,
                "7":2.6
            },
            "9":{
                "1":2.88,
                "2":2.88,
                "3":2.88,
                "4":2.88,
                "5":2.88,
                "6":2.88,
                "7":2.88,
                "8":2.88
            },
            "10":{
                "1":2.14,
                "2":2.14,
                "3":2.14,
                "4":2.14,
                "5":2.14,
                "6":2.14,
                "7":2.14
            },
            "11":{
                "1":2.85,
                "2":2.85,
                "3":2.85,
                "4":2.85,
                "5":2.85,
                "6":2.85,
                "7":2.85
            },
            "12":{
                "1":3.12,
                "2":3.12,
                "3":3.12,
                "4":3.12,
                "5":3.12,
                "6":3.12,
                "7":3.12,
                "8":3.12
            },
            "13":{
                "1":2.14,
                "2":2.14,
                "3":2.14,
                "4":2.14,
                "5":2.14,
                "6":2.14,
                "7":2.14
            },
            "14":{
                "1":2.85,
                "2":2.85,
                "3":2.85,
                "4":2.85,
                "5":2.85,
                "6":2.85,
                "7":2.85
            },
            "15":{
                "1":3.12,
                "2":3.12,
                "3":3.12,
                "4":3.12,
                "5":3.12,
                "6":3.12,
                "7":3.12,
                "8":3.12
            },
            "51":{
                "1":0.095,
                "2":0.19,
                "3":0.285,
                "4":0.38,
                "5":0.475,
                "6":0.57,
                "7":0.665,
                "8":0.76,
                "9":0.855,
                "10":0.95,
                "11":1.045,
                "12":1.14,
                "13":1.235,
                "14":1.33,
                "15":1.425,
                "16":1.52,
                "17":1.615,
                "18":1.71,
                "19":1.805,
                "20":1.9
            }
        };
        public static var MONEY_SWEEP:Object = {
            "10":{
                "1":0.3,
                "2":0.3,
                "3":0.3,
                "4":0.3,
                "5":0.3
            },
            "11":{
                "1":0.3,
                "2":0.3,
                "3":0.3,
                "4":0.3,
                "5":0.3
            },
            "12":{
                "1":0.3,
                "2":0.3,
                "3":0.3,
                "4":0.3,
                "5":0.3
            },
            "13":{
                "1":0.3,
                "2":0.3,
                "3":0.3,
                "4":0.3,
                "5":0.3
            },
            "14":{
                "1":0.3,
                "2":0.3,
                "3":0.3,
                "4":0.3,
                "5":0.3
            },
            "15":{
                "1":0.3,
                "2":0.3,
                "3":0.3,
                "4":0.3,
                "5":0.3
            }
        };
        public static var TASK_CLASSIFICATION:Object = {
            "1":{
                "b":1,
                "e":50,
                "desc":"Phụ Bản"
            },
            "2":{
                "b":51,
                "e":100,
                "desc":"NV ThTu"
            },
            "3":{
                "b":101,
                "e":250,
                "desc":"Tinh Cung"
            }
        };
        public static const DAILY_ACTIVITY:int = 0;
        public static const MONTH_WELFARE_PANEL:int = 1;
        public static const STAR_PANEL:int = 2;
        public static const LIMIT_SHOP_PANEL:int = 8;
        public static const INTERNAL_ACT_PANEL:int = 9;
        public static const SEND_COMBINE_PANEL:int = 12;
        public static const NINE_BOSS_PANEL:int = 13;
        public static const CARD_GAME_PANEL:int = 14;
        public static const WB_BOSS_PANEL:int = 15;
        public static const ANSWER_PANEL:int = 16;
        public static const DONGXUAN_PANEL:int = 17;
        public static const PET_SOUL_PANEL:int = 18;
        public static const VIP_SHOP_PANEL:int = 19;
        public static const AUTO_TASK_PANEL:int = 20;
        public static const LOTTERY_ACT_PANEL:int = 21;
        public static const PVP_ROOM_PANEL:int = 22;
        public static const SIGN_IN_PANEL:int = 5;
        public static const LOTTERY_PANEL:int = 21;
        public static const LUCK_DRAW_PANEL:int = 23;
        public static const MAGIC_ARRAY_PANEL:int = 24;
        public static const SMALL_GAME_PANEL:int = 25;
        public static const MEDAL_PANEL:int = 26;
        public static const MAZE_PANEL:int = 27;
        public static const ASTROLOGIC_PANEL:int = 28;
        public static const HANDBOOK_PANEL:int = 29;
        public static const FINDBACK_PANEL:int = 30;
        public static const CROSSPK_PANEL:int = 31;
        public static const TEAM_CROSSPK_PANEL:int = 32;
        public static const DOUBLE_ELEVEN_PANEL:int = 33;
        public static const CROSS_CONTENTION_PANEL:int = 34;
        public static const PET_TALENT_PANEL:int = 35;
        public static const TREASURE_BOWL_PANEL:int = 36;
        public static const EXTRACT_CARD_ARCIVITY:int = 37;
        public static const TREASURE_HUNT:int = 38;
        public static const STONE_SEAL:int = 39;
        public static const FLOP_POSS:int = 40;
        public static const HULA:int = 41;
        public static const RETURN_REWARD_ACTIVITY:int = 42;
        public static const TRAILS:int = 43;
        public static const DOTA:int = 44;
        public static const GROUPON:int = 45;
        public static const SUMMER_GAMES:int = 46;
        public static const WORLD_CUP:int = 47;
        public static const AUTO_TASK_PANEL_NEW:int = 48;
        public static const BOSS_DAILY:int = 49;
        public static const WAWA_GAME:int = 50;
        public static const MYSTERY_FURNACE:int = 51;
        public static const JUHUASUAN:int = 52;
        public static const MANJIUJIAN:int = 53;
        public static const REBATEEVERYDAY:int = 54;
        public static const TRIPLE_TOWN:int = 55;
        public static const MONTHWELFARE:int = 56;
        public static const HEIYAOSHIZHEN:int = 57;
        public static const PETREALSOUL:int = 58;
        public static const SECRET_TREASUREHUNT:int = 59;
        public static const BLOODY_BATTLE:int = 60;
        public static const WAR_SPRITE:int = 61;
        public static const HAPPYFRONTLINE:int = 62;
        public static const ANNIVERSARY:int = 63;
        public static const MONSTERHEART:int = 64;
        public static const DAILYSIGNINACT:int = 65;
        public static const MAGICCRYSTAL:int = 66;
        public static const STONETOGOLDACT:int = 67;
        public static const MOJINACT:int = 69;
        public static const QILING:int = 68;
        public static const LAODONGGR:int = 70;
        public static const PETSTONE:int = 71;
        public static const EXPLORERMEDAL:int = 72;
        public static const HUANLESHIGUANG:int = 73;
        public static const MOLIYIXIA:int = 74;
        public static const DIAOKEKONGJIAN:int = 75;
        public static const PKGAME:int = 76;
        public static const PETARENAACTIVITY:int = 77;
        public static const CONSUMENOTICE:int = 78;
        public static const XIAOCHUSDASAI:int = 79;
        public static const TEXUNKECHENG:int = 80;
        public static const HUANMOTAXIULIAN:int = 81;
        public static const MOYINTUCE:int = 82;
        public static const MCZD:int = 83;
        public static var TITLE_POINT:Object = {"211":{
                "0":450,
                "1":720,
                "2":2481
            }};
        public static var TITLE_PRE:Object = {"211":{
                "1":"Ngang Ngược",
                "2":"Thần bí",
                "3":"Tinh Nghịch",
                "4":"Khờ Khạo",
                "5":"Phong Lưu",
                "6":"Mơ Mộng",
                "7":"Hào Phóng",
                "8":"Nhí Nhảnh",
                "9":"Lãng Mạn",
                "10":"Gian Ác",
                "11":"Ngốc Nghếch",
                "12":"Đa Tình"
            }};
        public static var TITLE_NEXT:Object = {"211":{
                "1":"Cung Bạch Dương",
                "2":"Cung Kim Ngưu",
                "3":"Cung Song Tử",
                "4":"Cung Cự Giải",
                "5":"Cung Sư Tử",
                "6":"Cung Xử Nữ",
                "7":"Cung Thiên Bình",
                "8":"Cung Hổ Cáp",
                "9":"Cung Nhân Mã",
                "10":"Cung Ma Kết",
                "11":"Cung Bảo Bình",
                "12":"Cung Song Ngư"
            }};
        public static var TITLE_LABLE:Object = {"211":{
                "1":Language.TITLE_CUSTOM[1],
                "2":Language.TITLE_CUSTOM[2]
            }};
        public static var NINE_BOSS_ICON:Object = {
            "1":3130090000038,
            "2":3130090000039,
            "3":3130090000040,
            "4":3130090000041,
            "5":3130090000042,
            "6":3130090000043,
            "7":3130090000044,
            "8":3130090000045,
            "9":3130090000046
        };
        public static var WING_PRO_TOTAL_ADD:Array = [{
            "mainPropNum1":1.03,
            "mainPropNum2":1.03,
            "propNum1":1.03,
            "propNum2":1.03
        }, {
            "mainPropNum1":1.08,
            "mainPropNum2":1.08,
            "propNum1":1.08,
            "propNum2":1.08
        }, {
            "mainPropNum1":1.15,
            "mainPropNum2":1.15,
            "propNum1":1.15,
            "propNum2":1.15
        }, {
            "mainPropNum1":1.24,
            "mainPropNum2":1.24,
            "propNum1":1.24,
            "propNum2":1.24
        }, {
            "mainPropNum1":1.34,
            "mainPropNum2":1.34,
            "propNum1":1.34,
            "propNum2":1.34
        }, {
            "mainPropNum1":1.45,
            "mainPropNum2":1.45,
            "propNum1":1.45,
            "propNum2":1.45
        }, {
            "mainPropNum1":1.57,
            "mainPropNum2":1.57,
            "propNum1":1.57,
            "propNum2":1.57
        }, {
            "mainPropNum1":1.7,
            "mainPropNum2":1.7,
            "propNum1":1.7,
            "propNum2":1.7
        }, {
            "mainPropNum1":1.84,
            "mainPropNum2":1.84,
            "propNum1":1.84,
            "propNum2":1.84
        }, {
            "mainPropNum1":1.99,
            "mainPropNum2":1.99,
            "propNum1":1.99,
            "propNum2":1.99
        }, {
            "mainPropNum1":0,
            "mainPropNum2":0,
            "propNum1":0,
            "propNum2":0
        }];
        public static var PET_SOUL_PRO_NAME:Object = {
            "1":"Giới Hạn HP",
            "2":"Giới Hạn MP",
            "3":"Giới Hạn Nộ Khí",
            "4":"Công Vật Lý",
            "5":"Công Ma Pháp",
            "6":"Phòng Vật Lý",
            "7":"Phòng Ma Pháp",
            "8":"Chính Xác",
            "9":"Né Tránh",
            "10":"Phản Kích",
            "11":"Tốc Độ",
            "12":"Liên Kích",
            "13":"Bạo Kích",
            "14":"Xuyên Phòng Ngự",
            "15":"Miễn Vật Lý",
            "16":"Miễn Ma Pháp",
            "17":"Kháng Choáng",
            "18":"Kháng Loạn",
            "19":"Kháng Hôn Mê",
            "20":"Kháng Trúng Độc",
            "21":"Kháng Thiêu Đốt",
            "22":"Kháng Băng",
            "23":"Kháng Tê Liệt",
            "24":"Kinh Nghiệm",
            "25":"Kinh Nghiệm Pet",
            "26":"Tỉ Lệ Bạo Kích",
            "27":"Lực Bắt Pet",
            "28":"Tỉ Lệ Gặp Địch",
            "29":"Lực Lĩnh Ngộ Pet",
            "30":"Kháng Kích Nộ",
            "31":"Kháng Bạo Kích",
            "32":"BUFF Chính Xác",
            "33":"Tiền Vàng",
            "34":"Miễn Tử",
            "35":"Chế Thuốc",
            "36":"Nấu Ăn",
            "37":"Mê Tông",
            "38":"Truy Tông",
            "39":"Tỉ Lệ Bắt",
            "40":"Sức Lực",
            "41":"Triệt Công Vật Lý",
            "42":"Triệt Công Ma Pháp",
            "52":"Loạn Chính Xác",
            "53":"Choáng Chính Xác",
            "54":"Trúng Độc Chính Xác",
            "55":"Trào Phúng Chính Xác",
            "56":"Hôn Mê Chính Xác",
            "57":"Thạch Hóa Chính Xác",
            "58":"Tính Kháng"
        };
        public static var MW_PRO_COLOR:Array = ["#00FF00", "#1deefb", "#FF33FF", "#FFFF00"];
        public static var MW_SUCC_COST:int = 5;
        public static var MW_SUCC_ITEM:int = 3740;
        public static var ACTIVATE_MW_LEVEL:Array = [50, 50, 50, 50, 50];
        public static var MW_PRO_COST:int = 20;
        public static var ACTIVATE_MW_PRO:Object = {
            "1":{
                "propType":1,
                "valMax":12000,
                "valMin":1200,
                "top0":2680,
                "top1":4926,
                "top2":11999,
                "top3":12000
            },
            "2":{
                "propType":2,
                "valMax":500,
                "valMin":50,
                "top0":112,
                "top1":205,
                "top2":499,
                "top3":500
            },
            "4":{
                "propType":4,
                "valMax":3000,
                "valMin":300,
                "top0":670,
                "top1":1232,
                "top2":2999,
                "top3":3000
            },
            "5":{
                "propType":5,
                "valMax":2400,
                "valMin":240,
                "top0":536,
                "top1":985,
                "top2":2399,
                "top3":2400
            },
            "6":{
                "propType":6,
                "valMax":10000,
                "valMin":1000,
                "top0":2233,
                "top1":4105,
                "top2":9999,
                "top3":10000
            },
            "7":{
                "propType":7,
                "valMax":10000,
                "valMin":1000,
                "top0":2233,
                "top1":4105,
                "top2":9999,
                "top3":10000
            },
            "8":{
                "propType":8,
                "valMax":5,
                "valMin":0.5,
                "top0":1.1,
                "top1":2.1,
                "top2":4.9,
                "top3":5
            },
            "9":{
                "propType":9,
                "valMax":5,
                "valMin":0.5,
                "top0":1.1,
                "top1":2.1,
                "top2":4.9,
                "top3":5
            },
            "11":{
                "propType":11,
                "valMax":1200,
                "valMin":120,
                "top0":268,
                "top1":493,
                "top2":1199,
                "top3":1200
            },
            "13":{
                "propType":13,
                "valMax":4,
                "valMin":0.4,
                "top0":0.9,
                "top1":1.6,
                "top2":3.9,
                "top3":4
            },
            "27":{
                "propType":27,
                "valMax":4,
                "valMin":0.4,
                "top0":0.9,
                "top1":1.6,
                "top2":3.9,
                "top3":4
            }
        };
        public static var SUB_MW_HP_GROW_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_MP_GROW_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_ATTACK_GROW_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_MATTACK_GROW_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_DEFENCE_GROW_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_MDEFENCE_GROW_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_HIT_GROW_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_DODGE_GROW_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_SPEED_GROW_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_HIT_CRITICAL_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var SUB_MW_RESICRI_MAP:* = {
            "0":0,
            "1":4,
            "2":12,
            "3":24
        };
        public static var MW_SUCC_GROW_MAP:* = {
            "1":SUB_MW_HP_GROW_MAP,
            "2":SUB_MW_MP_GROW_MAP,
            "4":SUB_MW_ATTACK_GROW_MAP,
            "5":SUB_MW_MATTACK_GROW_MAP,
            "6":SUB_MW_DEFENCE_GROW_MAP,
            "7":SUB_MW_MDEFENCE_GROW_MAP,
            "8":SUB_MW_HIT_GROW_MAP,
            "9":SUB_MW_DODGE_GROW_MAP,
            "11":SUB_MW_SPEED_GROW_MAP,
            "13":SUB_MW_HIT_CRITICAL_MAP,
            "27":SUB_MW_RESICRI_MAP
        };
        public static var SOUL_CRSTAL_COST:Array = [4000, 5000, 7000, 9000, 12000, 200];
        public static var PET_SOUL_LEVEL:Array = [80, 80, 80, 80, 80, 100, 120, 140];
        public static var PM_NPC_PMLEVEL:Object = {"41":1};
        public static var PM_CHAT_FLAG:Array = [];
        public static var MOUNT_LEV_ITEM:int = 3804;
        public static var MOUNT_UPLEV_ITEM:int = 3805;
        public static var ADV_MOUNT_UPLEV_ITEM:int = 6273;
        public static var PLAYER_PARBUFF_LEVEL_EXP:Array = [];
        public static var PLAYER_PARBUFF_ADD_EXP:Array = [];
        public static var PLAYER_PARBUFF_LEVEL_LIMIT:Array = [];
        public static var PLAYER_PARBUFF_LEVEL_DEF_EFFECT:Array = [];
        public static var PLAYER_PARBUFF_LEVEL_ATT_EFFECT:Array = [];
        public static var PLAYER_PARBUFF_LEVEL_ATK_EFFECT:* = [];
        public static var PLAYER_PARBUFF_LEVEL_SPD_EFFECT:* = [];
        public static var MEDAL_EQUIPT_SID:Object = {
            "1001":Language.MEDAL_P[16],
            "1002":Language.MEDAL_P[17],
            "1003":Language.MEDAL_P[18],
            "1004":Language.MEDAL_P[19],
            "1005":Language.MEDAL_P[20],
            "2001":Language.MEDAL_P[16],
            "2002":Language.MEDAL_P[17],
            "2003":Language.MEDAL_P[18],
            "2004":Language.MEDAL_P[19],
            "2005":Language.MEDAL_P[20]
        };
        public static var MEDAL_OP_SID:Number = 3000;
        public static var MEDAL_BAG_MAX_ID:Number = 600;
        public static var MEDAL_MAX_LEVEL:Number = 10;
        public static var MEDAL_PROP_HP:int = 1;
        public static var MEDAL_PROP_MP:int = 2;
        public static var MEDAL_PROP_SP:int = 3;
        public static var MEDAL_PROP_ATTACK:int = 4;
        public static var MEDAL_PROP_MATTACK:int = 5;
        public static var MEDAL_PROP_DEFENCE:int = 6;
        public static var MEDAL_PROP_MDEFENCE:int = 7;
        public static var MEDAL_PROP_HIT:int = 8;
        public static var MEDAL_PROP_DODGE:int = 9;
        public static var MEDAL_PROP_COUNTER:int = 10;
        public static var MEDAL_PROP_SPEED:int = 11;
        public static var MEDAL_PROP_COMBO:int = 12;
        public static var MEDAL_PROP_CRITICAL:int = 13;
        public static var MEDAL_PROP_DEFY:int = 14;
        public static var MEDAL_PROP_REDUCEHURT1:int = 15;
        public static var MEDAL_PROP_REDUCEHURT2:int = 16;
        public static var MEDAL_PROP_RESIDIZZY:int = 17;
        public static var MEDAL_PROP_RESICONFUSION:int = 18;
        public static var MEDAL_PROP_RESISLEEP:int = 19;
        public static var MEDAL_PROP_RESIPOISON:int = 20;
        public static var MEDAL_PROP_RESIFIRE:int = 21;
        public static var MEDAL_PROP_RESIICE:int = 22;
        public static var MEDAL_PROP_RESILIGHT:int = 23;
        public static var MEDAL_PROP_RESICRITICAL:int = 31;
        public static var MEDAL_PROP_DEBUFFSUCCRATE:int = 32;
        public static var MEDAL_PROP_REBORN:int = 34;
        public static var MEDAL_PROP_DEFDEBUFF:int = 58;
        public static var MEDAL_PROP_PRADEF:int = 59;
        public static var MEDAL_PROP_PRAMAGDEF:int = 60;
        public static var MEDAL_PROP_REDUDEFY:int = 61;
        public static var MEDAL_PROP_ENHPHYHURT:int = 62;
        public static var MEDAL_PROP_ENHMAGICHURT:int = 63;
        public static var MEDAL_PROP_NAME:Object = {};
        public static var SLOT_SHOW_QUALITY_COLOR:Object = {
            "3849":true,
            "3850":true,
            "3851":true,
            "3852":true,
            "3853":true,
            "3854":true,
            "0x0F0F":true,
            "3856":true,
            "3857":true,
            "3858":true,
            "3859":true
        };
        public static var PET_KIND_NAME:Object = {};
        public static var PET_KIND_PEOPLE:int = 1;
        public static var PET_KIND_ANIMAL:int = 2;
        public static var PET_KIND_PLANT:int = 3;
        public static var PET_KIND_MACHINE:int = 4;
        public static var PET_KIND_DEVIL:int = 5;
        public static var PET_KIND_DRAGON:int = 6;
        public static var PET_KIND_BOSS:int = 7;
        public static var PET_KIND_SPECIAL:int = 8;
        public static var PET_KIND_NEW:int = 9;
        public static var PET_KIND_NEW2:int = 10;
        public static var PET_HIDDEN_PROP:Array = [{
            "data":"propCritical",
            "name":Language.PET_HANDBOOK_PANEL_U[90]
        }, {
            "data":"propCombo",
            "name":Language.PET_HANDBOOK_PANEL_U[91]
        }, {
            "data":"propCounter",
            "name":Language.PET_HANDBOOK_PANEL_U[92]
        }, {
            "data":"propHit",
            "name":Language.PET_HANDBOOK_PANEL_U[93]
        }, {
            "data":"propDodge",
            "name":Language.PET_HANDBOOK_PANEL_U[94]
        }];
        public static var PET_SERIE_PROP:Array = new Array();
        public static var PET_ALLSERIE_PROP:Array = new Array();
        public static var PET_ALLSERIE_PROP_INDEX:Object = {
            "4":1,
            "5":2,
            "6":3,
            "7":4,
            "32":5,
            "31":6,
            "10":7,
            "11":8,
            "12":9,
            "13":10,
            "58":11,
            "59":12,
            "60":13,
            "1":14,
            "20":15
        };
        public static var PET_ENVOLUTION_FEATHER_STEP:Array = [];
        public static var PET_ENVOLUTION_FEATHER_PARAM:int = 5;
        public static var PET_ENVOLUTION_FEATHER_COST:Array = [[10, 10, 10, 20, 20, 20, 30, 30, 30], [15, 15, 15, 30, 30, 30, 45, 45, 45], [20, 20, 20, 40, 40, 40, 60, 60, 60]];
        public static var PET_ENVOLUTION_FEATHER_COST_GOLD:Array = [[600, 500, 400, 1900, 1800, 1500, 3900, 3700, 3100], [1100, 1000, 800, 3500, 3400, 2800, 7700, 7500, 0x1900], [1600, 1500, 1300, 5700, 5600, 4700, 12000, 11500, 10000]];
        public static var PET_ENVOLUTION_FEATHER_COST_PROTECT:Array = [[0, 1, 2, 0, 1, 4, 0, 2, 9], [0, 1, 3, 0, 1, 8, 0, 3, 16], [0, 1, 4, 0, 2, 12, 0, 3, 18, 0]];
        public static var FINDBACK_TYPE_XIUXING:String = "xiuxing";
        public static var FINDBACK_TYPE_XUEYUAN:String = "xueyuan";
        public static var FINDBACK_TYPE_PANJUN:String = "panjun";
        public static var FINDBACK_TYPE_FEIMO:String = "feimo";
        public static var FINDBACK_TYPE_XUANSHANG:String = "xuanshang";
        public static var FINDBACK_TYPE_CHONGWU:String = "chongwu";
        public static var FINDBACK_TYPES:Array = [FINDBACK_TYPE_XIUXING, FINDBACK_TYPE_XUEYUAN, FINDBACK_TYPE_CHONGWU, FINDBACK_TYPE_PANJUN, FINDBACK_TYPE_FEIMO, FINDBACK_TYPE_XUANSHANG];
        public static var FINDBACK_TYPE_XIUXING_NUM:Number = 1;
        public static var FINDBACK_TYPE_XIUXING_ROUND:Number = 10;
        public static var FINDBACK_TYPE_XUEYUAN_NUM:Number = 2;
        public static var FINDBACK_TYPE_XUEYUAN_ROUND:Number = 10;
        public static var FINDBACK_TYPE_PANJUN_NUM:Number = 1;
        public static var FINDBACK_TYPE_FEIMO_NUM:Number = 1;
        public static var FINDBACK_TYPE_XUANSHANG_NUM:Number = 10;
        public static var FINDBACK_TYPE_XUANSHANG_REFRESH:Number = 4;
        public static var FINDBACK_TYPE_CHONGWU_NUM:Number = 1;
        public static var FINDBACK_TYPE_CHONGWU_ROUND:Number = 20;
        public static var FINDBACK_SILVER_PER:Number = 0.7;
        public static var notDeleteBuff:Object = {
            "buff_elf_1":1,
            "buff_elf_2":1,
            "buff_elf_3":1,
            "buff_elf_4":1,
            "buff_elf_5":1,
            "buff_elf_6":1,
            "buff_elf_7":1,
            "buff_elf_8":1,
            "buff_elf_9":1,
            "buff_elf_10":1,
            "buff_elf_11":1,
            "buff_elf_12":1,
            "buff_elf_13":1,
            "buff_elf_14":1,
            "buff_elf_15":1,
            "buff_elf_16":1,
            "buff_elf_17":1,
            "buff_elf_7_s2b1":1,
            "buff_elf_8_s2b1":1,
            "buff_elf_9_s2b1":1,
            "buff_elf_15_s2b1":1,
            "buff_elf_17_s2b1":1
        };
        public static var WING_RES_ID:Object = {
            "2070390061003":[1923, 21],
            "2070390062003":[1930, 21],
            "2070390063003":[1931, 21]
        };
        public static var TEXTINPUT_COLOR:Array = ["#FFFFFF", "#FFFFFF", "#00FF00", "#0066FF", "#FF00FF", "#fa5b05"];
        public static var CROSS_CONTENTION_MAP:Object = {
            "1":{
                "sid":1,
                "name":"Núi Lửa"
            },
            "2":{
                "sid":13,
                "name":"Thủy Trạch 1"
            },
            "3":{
                "sid":22,
                "name":"Thủy Trạch 2"
            },
            "4":{
                "sid":30,
                "name":"Cồn Cát 1"
            },
            "5":{
                "sid":46,
                "name":"Cồn Cát 2"
            },
            "6":{
                "sid":59,
                "name":"Cồn Cát 3"
            },
            "7":{
                "sid":70,
                "name":"Cồn Cát 4"
            },
            "8":{
                "sid":77,
                "name":"Đồng Bằng"
            },
            "9":{
                "sid":80,
                "name":"Đồng Bằng 2"
            },
            "10":{
                "sid":83,
                "name":"Đồng Bằng 3"
            },
            "11":{
                "sid":85,
                "name":"Đồng Bằng 4"
            },
            "12":{
                "sid":86,
                "name":"Đồng Bằng 5"
            },
            "13":{
                "sid":87,
                "name":"Đồng Bằng 6"
            },
            "14":{
                "sid":801,
                "name":"Đồng Bằng 7"
            },
            "15":{
                "sid":802,
                "name":"Đồng Bằng 8"
            },
            "16":{
                "sid":803,
                "name":"Núi Tuyết 1"
            },
            "17":{
                "sid":0,
                "name":"Núi Tuyết 2"
            },
            "18":{
                "sid":0,
                "name":"Núi Tuyết 3"
            },
            "19":{
                "sid":0,
                "name":"Núi Tuyết 4"
            },
            "20":{
                "sid":0,
                "name":"Núi Tuyết 5"
            },
            "21":{
                "sid":0,
                "name":"Núi Tuyết 6"
            },
            "22":{
                "sid":0,
                "name":"Núi Tuyết 7"
            },
            "23":{
                "sid":0,
                "name":"Núi Tuyết 8"
            },
            "24":{
                "sid":0,
                "name":"Núi Tuyết 9"
            },
            "25":{
                "sid":0,
                "name":"Núi Tuyết 10"
            },
            "26":{
                "sid":0,
                "name":"Núi Tuyết 11"
            },
            "27":{
                "sid":0,
                "name":"Núi Tuyết 12"
            },
            "28":{
                "sid":0,
                "name":"Núi Tuyết 13"
            },
            "29":{
                "sid":0,
                "name":"Núi Tuyết 14"
            },
            "30":{
                "sid":0,
                "name":"Núi Tuyết 15"
            },
            "31":{
                "sid":0,
                "name":"Núi Tuyết 16"
            },
            "32":{
                "sid":0,
                "name":"Núi Tuyết 17"
            },
            "33":{
                "sid":0,
                "name":"Núi Tuyết 18"
            },
            "34":{
                "sid":0,
                "name":"Núi Tuyết 19"
            },
            "35":{
                "sid":0,
                "name":"Núi Tuyết 20"
            },
            "36":{
                "sid":0,
                "name":"Núi Tuyết 21"
            },
            "37":{
                "sid":0,
                "name":"Núi Tuyết 22"
            },
            "38":{
                "sid":0,
                "name":"Núi Tuyết 23"
            },
            "39":{
                "sid":0,
                "name":"Núi Tuyết 24"
            }
        };
        public static var CROSS_CONTENTION_MAP_LINK:Object = {
            "1":[2, 3],
            "2":[1, 3, 4, 7],
            "3":[1, 2, 5, 6],
            "4":[2, 5, 7, 8, 9],
            "5":[3, 4, 6, 10, 11],
            "6":[3, 5, 7, 12, 13],
            "7":[2, 4, 6, 14, 15],
            "8":[4, 9, 15, 16, 17, 18],
            "9":[4, 8, 10, 19, 20, 21],
            "10":[5, 9, 11, 22, 23, 24],
            "11":[5, 10, 12, 25, 26, 27],
            "12":[6, 11, 13, 28, 29, 30],
            "13":[6, 12, 14, 31, 32, 33],
            "14":[7, 13, 15, 34, 35, 36],
            "15":[7, 8, 14, 37, 38, 39],
            "16":[8, 17, 39],
            "17":[8, 16, 18],
            "18":[8, 17, 19],
            "19":[9, 18, 20],
            "20":[9, 19, 21],
            "21":[9, 20, 22],
            "22":[10, 21, 23],
            "23":[10, 22, 24],
            "24":[10, 23, 25],
            "25":[11, 24, 26],
            "26":[11, 25, 27],
            "27":[11, 26, 28],
            "28":[12, 27, 29],
            "29":[12, 28, 30],
            "30":[12, 29, 31],
            "31":[13, 30, 32],
            "32":[13, 31, 33],
            "33":[13, 32, 34],
            "34":[14, 33, 35],
            "35":[14, 34, 36],
            "36":[14, 35, 37],
            "37":[15, 36, 38],
            "38":[15, 37, 39],
            "39":[15, 38, 16]
        };
        public static var CROSS_CONTENTION_REC_TEMP_DATA:Object = {
            "1":{
                "1":{
                    "nid":2027,
                    "p":1,
                    "x":50,
                    "y":357
                },
                "2":{
                    "nid":2027,
                    "p":1,
                    "x":116,
                    "y":382
                },
                "3":{
                    "nid":2027,
                    "p":1,
                    "x":132,
                    "y":316
                },
                "4":{
                    "nid":2027,
                    "p":1,
                    "x":175,
                    "y":236
                },
                "5":{
                    "nid":2027,
                    "p":1,
                    "x":230,
                    "y":277
                },
                "6":{
                    "nid":2027,
                    "p":1,
                    "x":277,
                    "y":234
                },
                "7":{
                    "nid":2027,
                    "p":1,
                    "x":299,
                    "y":342
                },
                "8":{
                    "nid":2027,
                    "p":1,
                    "x":321,
                    "y":276
                },
                "9":{
                    "nid":2027,
                    "p":1,
                    "x":132,
                    "y":551
                },
                "10":{
                    "nid":2027,
                    "p":1,
                    "x":410,
                    "y":499
                },
                "11":{
                    "nid":2027,
                    "p":1,
                    "x":225,
                    "y":685
                },
                "12":{
                    "nid":2027,
                    "p":1,
                    "x":271,
                    "y":578
                },
                "13":{
                    "nid":2027,
                    "p":1,
                    "x":308,
                    "y":649
                },
                "14":{
                    "nid":2027,
                    "p":1,
                    "x":379,
                    "y":699
                },
                "15":{
                    "nid":2027,
                    "p":1,
                    "x":453,
                    "y":838
                },
                "16":{
                    "nid":2027,
                    "p":1,
                    "x":529,
                    "y":813
                },
                "17":{
                    "nid":2027,
                    "p":1,
                    "x":591,
                    "y":826
                },
                "18":{
                    "nid":2027,
                    "p":1,
                    "x":507,
                    "y":931
                },
                "19":{
                    "nid":2027,
                    "p":1,
                    "x":604,
                    "y":938
                },
                "20":{
                    "nid":2027,
                    "p":1,
                    "x":669,
                    "y":938
                },
                "21":{
                    "nid":2027,
                    "p":1,
                    "x":686,
                    "y":888
                },
                "22":{
                    "nid":2027,
                    "p":1,
                    "x":775,
                    "y":749
                },
                "23":{
                    "nid":2027,
                    "p":1,
                    "x":1156,
                    "y":49
                },
                "24":{
                    "nid":2027,
                    "p":1,
                    "x":1128,
                    "y":142
                },
                "25":{
                    "nid":2027,
                    "p":1,
                    "x":1100,
                    "y":382
                },
                "26":{
                    "nid":2027,
                    "p":1,
                    "x":1211,
                    "y":551
                },
                "27":{
                    "nid":2027,
                    "p":1,
                    "x":1155,
                    "y":710
                },
                "28":{
                    "nid":2027,
                    "p":1,
                    "x":1166,
                    "y":804
                },
                "29":{
                    "nid":2027,
                    "p":1,
                    "x":751,
                    "y":97
                },
                "30":{
                    "nid":2027,
                    "p":1,
                    "x":641,
                    "y":500
                },
                "31":{
                    "nid":2028,
                    "p":2,
                    "x":621,
                    "y":0
                },
                "32":{
                    "nid":2028,
                    "p":2,
                    "x":352,
                    "y":116
                },
                "33":{
                    "nid":2028,
                    "p":2,
                    "x":343,
                    "y":187
                },
                "34":{
                    "nid":2028,
                    "p":2,
                    "x":544,
                    "y":39
                },
                "35":{
                    "nid":2028,
                    "p":2,
                    "x":474,
                    "y":115
                },
                "36":{
                    "nid":2028,
                    "p":2,
                    "x":578,
                    "y":87
                },
                "37":{
                    "nid":2028,
                    "p":2,
                    "x":736,
                    "y":20
                },
                "38":{
                    "nid":2028,
                    "p":2,
                    "x":796,
                    "y":87
                },
                "39":{
                    "nid":2028,
                    "p":2,
                    "x":643,
                    "y":144
                },
                "40":{
                    "nid":2028,
                    "p":2,
                    "x":786,
                    "y":161
                },
                "41":{
                    "nid":2028,
                    "p":2,
                    "x":653,
                    "y":209
                },
                "42":{
                    "nid":2028,
                    "p":2,
                    "x":786,
                    "y":250
                },
                "43":{
                    "nid":2028,
                    "p":2,
                    "x":826,
                    "y":345
                },
                "44":{
                    "nid":2028,
                    "p":2,
                    "x":987,
                    "y":294
                },
                "45":{
                    "nid":2028,
                    "p":2,
                    "x":1006,
                    "y":20
                },
                "46":{
                    "nid":2028,
                    "p":2,
                    "x":955,
                    "y":229
                },
                "47":{
                    "nid":2028,
                    "p":2,
                    "x":1164,
                    "y":229
                },
                "48":{
                    "nid":2028,
                    "p":2,
                    "x":1341,
                    "y":197
                },
                "49":{
                    "nid":2028,
                    "p":2,
                    "x":383,
                    "y":398
                },
                "50":{
                    "nid":2028,
                    "p":2,
                    "x":480,
                    "y":408
                },
                "51":{
                    "nid":2028,
                    "p":2,
                    "x":585,
                    "y":408
                },
                "52":{
                    "nid":2028,
                    "p":2,
                    "x":667,
                    "y":410
                },
                "53":{
                    "nid":2028,
                    "p":2,
                    "x":1164,
                    "y":411
                },
                "54":{
                    "nid":2028,
                    "p":2,
                    "x":1209,
                    "y":466
                },
                "55":{
                    "nid":2028,
                    "p":2,
                    "x":581,
                    "y":757
                },
                "56":{
                    "nid":2028,
                    "p":2,
                    "x":368,
                    "y":800
                },
                "57":{
                    "nid":2028,
                    "p":2,
                    "x":821,
                    "y":704
                },
                "58":{
                    "nid":2028,
                    "p":2,
                    "x":421,
                    "y":922
                },
                "59":{
                    "nid":2028,
                    "p":2,
                    "x":379,
                    "y":277
                },
                "60":{
                    "nid":2028,
                    "p":2,
                    "x":1135,
                    "y":564
                },
                "61":{
                    "nid":2029,
                    "p":3,
                    "x":244,
                    "y":167
                },
                "62":{
                    "nid":2029,
                    "p":3,
                    "x":528,
                    "y":270
                },
                "63":{
                    "nid":2029,
                    "p":3,
                    "x":851,
                    "y":122
                },
                "64":{
                    "nid":2029,
                    "p":3,
                    "x":9,
                    "y":437
                },
                "65":{
                    "nid":2029,
                    "p":3,
                    "x":173,
                    "y":379
                },
                "66":{
                    "nid":2029,
                    "p":3,
                    "x":210,
                    "y":502
                },
                "67":{
                    "nid":2029,
                    "p":3,
                    "x":306,
                    "y":466
                },
                "68":{
                    "nid":2029,
                    "p":3,
                    "x":535,
                    "y":460
                },
                "69":{
                    "nid":2029,
                    "p":3,
                    "x":169,
                    "y":631
                },
                "70":{
                    "nid":2029,
                    "p":3,
                    "x":331,
                    "y":569
                },
                "71":{
                    "nid":2029,
                    "p":3,
                    "x":542,
                    "y":558
                },
                "72":{
                    "nid":2029,
                    "p":3,
                    "x":698,
                    "y":558
                },
                "73":{
                    "nid":2029,
                    "p":3,
                    "x":174,
                    "y":754
                },
                "74":{
                    "nid":2029,
                    "p":3,
                    "x":414,
                    "y":652
                },
                "75":{
                    "nid":2029,
                    "p":3,
                    "x":523,
                    "y":663
                },
                "76":{
                    "nid":2029,
                    "p":3,
                    "x":464,
                    "y":745
                },
                "77":{
                    "nid":2029,
                    "p":3,
                    "x":352,
                    "y":915
                },
                "78":{
                    "nid":2029,
                    "p":3,
                    "x":546,
                    "y":927
                },
                "79":{
                    "nid":2029,
                    "p":3,
                    "x":653,
                    "y":839
                },
                "80":{
                    "nid":2029,
                    "p":3,
                    "x":1246,
                    "y":317
                },
                "81":{
                    "nid":2030,
                    "p":4,
                    "x":447,
                    "y":15
                },
                "82":{
                    "nid":2030,
                    "p":4,
                    "x":813,
                    "y":9
                },
                "83":{
                    "nid":2030,
                    "p":4,
                    "x":714,
                    "y":177
                },
                "84":{
                    "nid":2030,
                    "p":4,
                    "x":1044,
                    "y":229
                },
                "85":{
                    "nid":2030,
                    "p":4,
                    "x":929,
                    "y":332
                },
                "86":{
                    "nid":2030,
                    "p":4,
                    "x":35,
                    "y":518
                },
                "87":{
                    "nid":2030,
                    "p":4,
                    "x":748,
                    "y":461
                },
                "88":{
                    "nid":2030,
                    "p":4,
                    "x":263,
                    "y":829
                },
                "89":{
                    "nid":2030,
                    "p":4,
                    "x":640,
                    "y":738
                },
                "90":{
                    "nid":2030,
                    "p":4,
                    "x":1191,
                    "y":751
                },
                "91":{
                    "nid":2031,
                    "p":5,
                    "x":655,
                    "y":42
                },
                "92":{
                    "nid":2031,
                    "p":5,
                    "x":535,
                    "y":160
                },
                "93":{
                    "nid":2031,
                    "p":5,
                    "x":1240,
                    "y":199
                },
                "94":{
                    "nid":2031,
                    "p":5,
                    "x":90,
                    "y":450
                },
                "95":{
                    "nid":2031,
                    "p":5,
                    "x":456,
                    "y":502
                },
                "96":{
                    "nid":2031,
                    "p":5,
                    "x":877,
                    "y":492
                },
                "97":{
                    "nid":2031,
                    "p":5,
                    "x":1112,
                    "y":466
                },
                "98":{
                    "nid":2031,
                    "p":5,
                    "x":608,
                    "y":615
                },
                "99":{
                    "nid":2031,
                    "p":5,
                    "x":708,
                    "y":660
                },
                "100":{
                    "nid":2031,
                    "p":5,
                    "x":891,
                    "y":699
                }
            },
            "2":{
                "1":{
                    "nid":2032,
                    "p":1,
                    "x":474,
                    "y":74
                },
                "2":{
                    "nid":2032,
                    "p":1,
                    "x":606,
                    "y":4
                },
                "3":{
                    "nid":2032,
                    "p":1,
                    "x":734,
                    "y":146
                },
                "4":{
                    "nid":2032,
                    "p":1,
                    "x":824,
                    "y":76
                },
                "5":{
                    "nid":2032,
                    "p":1,
                    "x":818,
                    "y":146
                },
                "6":{
                    "nid":2032,
                    "p":1,
                    "x":928,
                    "y":103
                },
                "7":{
                    "nid":2032,
                    "p":1,
                    "x":905,
                    "y":278
                },
                "8":{
                    "nid":2032,
                    "p":1,
                    "x":871,
                    "y":417
                },
                "9":{
                    "nid":2032,
                    "p":1,
                    "x":1253,
                    "y":476
                },
                "10":{
                    "nid":2032,
                    "p":1,
                    "x":1164,
                    "y":748
                },
                "11":{
                    "nid":2033,
                    "p":2,
                    "x":113,
                    "y":449
                },
                "12":{
                    "nid":2033,
                    "p":2,
                    "x":465,
                    "y":387
                },
                "13":{
                    "nid":2033,
                    "p":2,
                    "x":745,
                    "y":214
                },
                "14":{
                    "nid":2033,
                    "p":2,
                    "x":1003,
                    "y":85
                },
                "15":{
                    "nid":2033,
                    "p":2,
                    "x":964,
                    "y":207
                },
                "16":{
                    "nid":2033,
                    "p":2,
                    "x":1072,
                    "y":220
                },
                "17":{
                    "nid":2033,
                    "p":2,
                    "x":655,
                    "y":303
                },
                "18":{
                    "nid":2033,
                    "p":2,
                    "x":800,
                    "y":260
                },
                "19":{
                    "nid":2033,
                    "p":2,
                    "x":974,
                    "y":307
                },
                "20":{
                    "nid":2033,
                    "p":2,
                    "x":660,
                    "y":468
                },
                "21":{
                    "nid":2033,
                    "p":2,
                    "x":722,
                    "y":427
                },
                "22":{
                    "nid":2033,
                    "p":2,
                    "x":1040,
                    "y":394
                },
                "23":{
                    "nid":2033,
                    "p":2,
                    "x":1065,
                    "y":776
                },
                "24":{
                    "nid":2033,
                    "p":2,
                    "x":1273,
                    "y":757
                },
                "25":{
                    "nid":2033,
                    "p":2,
                    "x":280,
                    "y":108
                },
                "26":{
                    "nid":2034,
                    "p":3,
                    "x":520,
                    "y":427
                },
                "27":{
                    "nid":2034,
                    "p":3,
                    "x":1147,
                    "y":214
                },
                "28":{
                    "nid":2034,
                    "p":3,
                    "x":1406,
                    "y":284
                },
                "29":{
                    "nid":2034,
                    "p":3,
                    "x":213,
                    "y":661
                },
                "30":{
                    "nid":2034,
                    "p":3,
                    "x":511,
                    "y":540
                },
                "31":{
                    "nid":2034,
                    "p":3,
                    "x":621,
                    "y":523
                },
                "32":{
                    "nid":2034,
                    "p":3,
                    "x":752,
                    "y":497
                },
                "33":{
                    "nid":2034,
                    "p":3,
                    "x":793,
                    "y":378
                },
                "34":{
                    "nid":2034,
                    "p":3,
                    "x":853,
                    "y":550
                },
                "35":{
                    "nid":2034,
                    "p":3,
                    "x":1143,
                    "y":531
                },
                "36":{
                    "nid":2034,
                    "p":3,
                    "x":1290,
                    "y":550
                },
                "37":{
                    "nid":2034,
                    "p":3,
                    "x":1230,
                    "y":617
                },
                "38":{
                    "nid":2034,
                    "p":3,
                    "x":506,
                    "y":842
                },
                "39":{
                    "nid":2034,
                    "p":3,
                    "x":548,
                    "y":776
                },
                "40":{
                    "nid":2034,
                    "p":3,
                    "x":616,
                    "y":722
                },
                "41":{
                    "nid":2034,
                    "p":3,
                    "x":722,
                    "y":695
                },
                "42":{
                    "nid":2034,
                    "p":3,
                    "x":678,
                    "y":700
                },
                "43":{
                    "nid":2034,
                    "p":3,
                    "x":1081,
                    "y":664
                },
                "44":{
                    "nid":2034,
                    "p":3,
                    "x":796,
                    "y":776
                },
                "45":{
                    "nid":2034,
                    "p":3,
                    "x":644,
                    "y":856
                },
                "46":{
                    "nid":2034,
                    "p":3,
                    "x":0x0300,
                    "y":902
                },
                "47":{
                    "nid":2034,
                    "p":3,
                    "x":984,
                    "y":897
                },
                "48":{
                    "nid":2034,
                    "p":3,
                    "x":1076,
                    "y":877
                },
                "49":{
                    "nid":2034,
                    "p":3,
                    "x":1243,
                    "y":849
                },
                "50":{
                    "nid":2034,
                    "p":3,
                    "x":1397,
                    "y":736
                },
                "51":{
                    "nid":2035,
                    "p":4,
                    "x":3,
                    "y":197
                },
                "52":{
                    "nid":2035,
                    "p":4,
                    "x":403,
                    "y":184
                },
                "53":{
                    "nid":2035,
                    "p":4,
                    "x":1167,
                    "y":126
                },
                "54":{
                    "nid":2035,
                    "p":4,
                    "x":17,
                    "y":362
                },
                "55":{
                    "nid":2035,
                    "p":4,
                    "x":124,
                    "y":262
                },
                "56":{
                    "nid":2035,
                    "p":4,
                    "x":224,
                    "y":245
                },
                "57":{
                    "nid":2035,
                    "p":4,
                    "x":563,
                    "y":268
                },
                "58":{
                    "nid":2035,
                    "p":4,
                    "x":176,
                    "y":330
                },
                "59":{
                    "nid":2035,
                    "p":4,
                    "x":314,
                    "y":295
                },
                "60":{
                    "nid":2035,
                    "p":4,
                    "x":398,
                    "y":325
                },
                "61":{
                    "nid":2035,
                    "p":4,
                    "x":358,
                    "y":462
                },
                "62":{
                    "nid":2035,
                    "p":4,
                    "x":946,
                    "y":419
                },
                "63":{
                    "nid":2035,
                    "p":4,
                    "x":1115,
                    "y":340
                },
                "64":{
                    "nid":2035,
                    "p":4,
                    "x":202,
                    "y":559
                },
                "65":{
                    "nid":2035,
                    "p":4,
                    "x":314,
                    "y":579
                },
                "66":{
                    "nid":2035,
                    "p":4,
                    "x":497,
                    "y":622
                },
                "67":{
                    "nid":2035,
                    "p":4,
                    "x":616,
                    "y":631
                },
                "68":{
                    "nid":2035,
                    "p":4,
                    "x":940,
                    "y":590
                },
                "69":{
                    "nid":2035,
                    "p":4,
                    "x":1290,
                    "y":419
                },
                "70":{
                    "nid":2035,
                    "p":4,
                    "x":1406,
                    "y":544
                },
                "71":{
                    "nid":2035,
                    "p":4,
                    "x":95,
                    "y":640
                },
                "72":{
                    "nid":2035,
                    "p":4,
                    "x":280,
                    "y":698
                },
                "73":{
                    "nid":2035,
                    "p":4,
                    "x":433,
                    "y":706
                },
                "74":{
                    "nid":2035,
                    "p":4,
                    "x":77,
                    "y":803
                },
                "75":{
                    "nid":2035,
                    "p":4,
                    "x":179,
                    "y":764
                },
                "76":{
                    "nid":2035,
                    "p":4,
                    "x":331,
                    "y":828
                },
                "77":{
                    "nid":2035,
                    "p":4,
                    "x":155,
                    "y":871
                },
                "78":{
                    "nid":2035,
                    "p":4,
                    "x":915,
                    "y":778
                },
                "79":{
                    "nid":2035,
                    "p":4,
                    "x":1127,
                    "y":819
                },
                "80":{
                    "nid":2035,
                    "p":4,
                    "x":23,
                    "y":715
                },
                "81":{
                    "nid":2036,
                    "p":5,
                    "x":192,
                    "y":85
                },
                "82":{
                    "nid":2036,
                    "p":5,
                    "x":373,
                    "y":71
                },
                "83":{
                    "nid":2036,
                    "p":5,
                    "x":715,
                    "y":52
                },
                "84":{
                    "nid":2036,
                    "p":5,
                    "x":1180,
                    "y":35
                },
                "85":{
                    "nid":2036,
                    "p":5,
                    "x":242,
                    "y":897
                },
                "86":{
                    "nid":2036,
                    "p":5,
                    "x":1321,
                    "y":48
                },
                "87":{
                    "nid":2036,
                    "p":5,
                    "x":1138,
                    "y":606
                },
                "88":{
                    "nid":2036,
                    "p":5,
                    "x":149,
                    "y":159
                },
                "89":{
                    "nid":2036,
                    "p":5,
                    "x":320,
                    "y":177
                },
                "90":{
                    "nid":2036,
                    "p":5,
                    "x":660,
                    "y":200
                },
                "91":{
                    "nid":2036,
                    "p":5,
                    "x":868,
                    "y":180
                },
                "92":{
                    "nid":2036,
                    "p":5,
                    "x":1044,
                    "y":118
                },
                "93":{
                    "nid":2036,
                    "p":5,
                    "x":1319,
                    "y":648
                },
                "94":{
                    "nid":2036,
                    "p":5,
                    "x":0x0101,
                    "y":445
                },
                "95":{
                    "nid":2036,
                    "p":5,
                    "x":1167,
                    "y":408
                },
                "96":{
                    "nid":2036,
                    "p":5,
                    "x":998,
                    "y":507
                },
                "97":{
                    "nid":2036,
                    "p":5,
                    "x":745,
                    "y":583
                },
                "98":{
                    "nid":2036,
                    "p":5,
                    "x":694,
                    "y":778
                },
                "99":{
                    "nid":2036,
                    "p":5,
                    "x":862,
                    "y":849
                },
                "100":{
                    "nid":2036,
                    "p":5,
                    "x":1321,
                    "y":793
                }
            },
            "3":{
                "1":{
                    "nid":2037,
                    "p":1,
                    "x":131,
                    "y":901
                },
                "2":{
                    "nid":2037,
                    "p":1,
                    "x":58,
                    "y":694
                },
                "3":{
                    "nid":2037,
                    "p":1,
                    "x":117,
                    "y":53
                },
                "4":{
                    "nid":2037,
                    "p":1,
                    "x":1170,
                    "y":492
                },
                "5":{
                    "nid":2037,
                    "p":1,
                    "x":1388,
                    "y":882
                },
                "6":{
                    "nid":2038,
                    "p":2,
                    "x":170,
                    "y":77
                },
                "7":{
                    "nid":2038,
                    "p":2,
                    "x":274,
                    "y":62
                },
                "8":{
                    "nid":2038,
                    "p":2,
                    "x":941,
                    "y":77
                },
                "9":{
                    "nid":2038,
                    "p":2,
                    "x":1368,
                    "y":55
                },
                "10":{
                    "nid":2038,
                    "p":2,
                    "x":1405,
                    "y":240
                },
                "11":{
                    "nid":2038,
                    "p":2,
                    "x":170,
                    "y":395
                },
                "12":{
                    "nid":2038,
                    "p":2,
                    "x":36,
                    "y":640
                },
                "13":{
                    "nid":2038,
                    "p":2,
                    "x":115,
                    "y":842
                },
                "14":{
                    "nid":2038,
                    "p":2,
                    "x":1445,
                    "y":354
                },
                "15":{
                    "nid":2038,
                    "p":2,
                    "x":342,
                    "y":901
                },
                "16":{
                    "nid":2039,
                    "p":3,
                    "x":581,
                    "y":125
                },
                "17":{
                    "nid":2039,
                    "p":3,
                    "x":1014,
                    "y":134
                },
                "18":{
                    "nid":2039,
                    "p":3,
                    "x":963,
                    "y":413
                },
                "19":{
                    "nid":2039,
                    "p":3,
                    "x":1344,
                    "y":547
                },
                "20":{
                    "nid":2039,
                    "p":3,
                    "x":979,
                    "y":196
                },
                "21":{
                    "nid":2039,
                    "p":3,
                    "x":1144,
                    "y":226
                },
                "22":{
                    "nid":2039,
                    "p":3,
                    "x":1228,
                    "y":196
                },
                "23":{
                    "nid":2039,
                    "p":3,
                    "x":56,
                    "y":820
                },
                "24":{
                    "nid":2039,
                    "p":3,
                    "x":598,
                    "y":549
                },
                "25":{
                    "nid":2039,
                    "p":3,
                    "x":774,
                    "y":372
                },
                "26":{
                    "nid":2039,
                    "p":3,
                    "x":1081,
                    "y":517
                },
                "27":{
                    "nid":2039,
                    "p":3,
                    "x":956,
                    "y":646
                },
                "28":{
                    "nid":2039,
                    "p":3,
                    "x":1195,
                    "y":431
                },
                "29":{
                    "nid":2039,
                    "p":3,
                    "x":1329,
                    "y":634
                },
                "30":{
                    "nid":2039,
                    "p":3,
                    "x":894,
                    "y":204
                },
                "31":{
                    "nid":2039,
                    "p":3,
                    "x":108,
                    "y":656
                },
                "32":{
                    "nid":2039,
                    "p":3,
                    "x":494,
                    "y":700
                },
                "33":{
                    "nid":2039,
                    "p":3,
                    "x":717,
                    "y":654
                },
                "34":{
                    "nid":2039,
                    "p":3,
                    "x":816,
                    "y":640
                },
                "35":{
                    "nid":2039,
                    "p":3,
                    "x":1189,
                    "y":716
                },
                "36":{
                    "nid":2039,
                    "p":3,
                    "x":1128,
                    "y":399
                },
                "37":{
                    "nid":2039,
                    "p":3,
                    "x":306,
                    "y":611
                },
                "38":{
                    "nid":2039,
                    "p":3,
                    "x":795,
                    "y":820
                },
                "39":{
                    "nid":2039,
                    "p":3,
                    "x":413,
                    "y":929
                },
                "40":{
                    "nid":2039,
                    "p":3,
                    "x":901,
                    "y":920
                },
                "41":{
                    "nid":2040,
                    "p":4,
                    "x":410,
                    "y":55
                },
                "42":{
                    "nid":2040,
                    "p":4,
                    "x":674,
                    "y":566
                },
                "43":{
                    "nid":2040,
                    "p":4,
                    "x":836,
                    "y":55
                },
                "44":{
                    "nid":2040,
                    "p":4,
                    "x":162,
                    "y":226
                },
                "45":{
                    "nid":2040,
                    "p":4,
                    "x":701,
                    "y":789
                },
                "46":{
                    "nid":2040,
                    "p":4,
                    "x":360,
                    "y":117
                },
                "47":{
                    "nid":2040,
                    "p":4,
                    "x":470,
                    "y":171
                },
                "48":{
                    "nid":2040,
                    "p":4,
                    "x":510,
                    "y":84
                },
                "49":{
                    "nid":2040,
                    "p":4,
                    "x":30,
                    "y":239
                },
                "50":{
                    "nid":2040,
                    "p":4,
                    "x":290,
                    "y":700
                },
                "51":{
                    "nid":2040,
                    "p":4,
                    "x":254,
                    "y":239
                },
                "52":{
                    "nid":2040,
                    "p":4,
                    "x":319,
                    "y":198
                },
                "53":{
                    "nid":2040,
                    "p":4,
                    "x":225,
                    "y":735
                },
                "54":{
                    "nid":2040,
                    "p":4,
                    "x":380,
                    "y":711
                },
                "55":{
                    "nid":2040,
                    "p":4,
                    "x":979,
                    "y":565
                },
                "56":{
                    "nid":2040,
                    "p":4,
                    "x":186,
                    "y":317
                },
                "57":{
                    "nid":2040,
                    "p":4,
                    "x":83,
                    "y":391
                },
                "58":{
                    "nid":2040,
                    "p":4,
                    "x":310,
                    "y":780
                },
                "59":{
                    "nid":2040,
                    "p":4,
                    "x":979,
                    "y":476
                },
                "60":{
                    "nid":2040,
                    "p":4,
                    "x":894,
                    "y":461
                },
                "61":{
                    "nid":2040,
                    "p":4,
                    "x":1144,
                    "y":334
                },
                "62":{
                    "nid":2040,
                    "p":4,
                    "x":101,
                    "y":172
                },
                "63":{
                    "nid":2040,
                    "p":4,
                    "x":170,
                    "y":614
                },
                "64":{
                    "nid":2040,
                    "p":4,
                    "x":261,
                    "y":509
                },
                "65":{
                    "nid":2040,
                    "p":4,
                    "x":310,
                    "y":334
                },
                "66":{
                    "nid":2040,
                    "p":4,
                    "x":808,
                    "y":493
                },
                "67":{
                    "nid":2040,
                    "p":4,
                    "x":1195,
                    "y":517
                },
                "68":{
                    "nid":2040,
                    "p":4,
                    "x":1041,
                    "y":609
                },
                "69":{
                    "nid":2040,
                    "p":4,
                    "x":1266,
                    "y":851
                },
                "70":{
                    "nid":2040,
                    "p":4,
                    "x":1422,
                    "y":412
                },
                "71":{
                    "nid":2040,
                    "p":4,
                    "x":565,
                    "y":904
                },
                "72":{
                    "nid":2040,
                    "p":4,
                    "x":963,
                    "y":891
                },
                "73":{
                    "nid":2040,
                    "p":4,
                    "x":1391,
                    "y":640
                },
                "74":{
                    "nid":2040,
                    "p":4,
                    "x":802,
                    "y":904
                },
                "75":{
                    "nid":2040,
                    "p":4,
                    "x":598,
                    "y":804
                },
                "76":{
                    "nid":2041,
                    "p":5,
                    "x":582,
                    "y":32
                },
                "77":{
                    "nid":2041,
                    "p":5,
                    "x":1128,
                    "y":585
                },
                "78":{
                    "nid":2041,
                    "p":5,
                    "x":656,
                    "y":99
                },
                "79":{
                    "nid":2041,
                    "p":5,
                    "x":1295,
                    "y":16
                },
                "80":{
                    "nid":2041,
                    "p":5,
                    "x":197,
                    "y":145
                },
                "81":{
                    "nid":2041,
                    "p":5,
                    "x":660,
                    "y":369
                },
                "82":{
                    "nid":2041,
                    "p":5,
                    "x":880,
                    "y":122
                },
                "83":{
                    "nid":2041,
                    "p":5,
                    "x":1041,
                    "y":409
                },
                "84":{
                    "nid":2041,
                    "p":5,
                    "x":1328,
                    "y":162
                },
                "85":{
                    "nid":2041,
                    "p":5,
                    "x":1238,
                    "y":276
                },
                "86":{
                    "nid":2041,
                    "p":5,
                    "x":1423,
                    "y":556
                },
                "87":{
                    "nid":2041,
                    "p":5,
                    "x":91,
                    "y":302
                },
                "88":{
                    "nid":2041,
                    "p":5,
                    "x":863,
                    "y":562
                },
                "89":{
                    "nid":2041,
                    "p":5,
                    "x":536,
                    "y":742
                },
                "90":{
                    "nid":2041,
                    "p":5,
                    "x":1206,
                    "y":624
                },
                "91":{
                    "nid":2041,
                    "p":5,
                    "x":1111,
                    "y":773
                },
                "92":{
                    "nid":2041,
                    "p":5,
                    "x":1295,
                    "y":702
                },
                "93":{
                    "nid":2041,
                    "p":5,
                    "x":360,
                    "y":595
                },
                "94":{
                    "nid":2041,
                    "p":5,
                    "x":749,
                    "y":551
                },
                "95":{
                    "nid":2041,
                    "p":5,
                    "x":152,
                    "y":764
                },
                "96":{
                    "nid":2041,
                    "p":5,
                    "x":179,
                    "y":877
                },
                "97":{
                    "nid":2041,
                    "p":5,
                    "x":687,
                    "y":901
                },
                "98":{
                    "nid":2041,
                    "p":5,
                    "x":1373,
                    "y":799
                },
                "99":{
                    "nid":2041,
                    "p":5,
                    "x":397,
                    "y":813
                },
                "100":{
                    "nid":2041,
                    "p":5,
                    "x":490,
                    "y":844
                }
            },
            "4":{
                "1":{
                    "nid":2042,
                    "p":1,
                    "x":526,
                    "y":51
                },
                "2":{
                    "nid":2042,
                    "p":1,
                    "x":494,
                    "y":268
                },
                "3":{
                    "nid":2042,
                    "p":1,
                    "x":680,
                    "y":455
                },
                "4":{
                    "nid":2042,
                    "p":1,
                    "x":683,
                    "y":545
                },
                "5":{
                    "nid":2042,
                    "p":1,
                    "x":1053,
                    "y":583
                },
                "6":{
                    "nid":2043,
                    "p":2,
                    "x":412,
                    "y":303
                },
                "7":{
                    "nid":2043,
                    "p":2,
                    "x":998,
                    "y":198
                },
                "8":{
                    "nid":2043,
                    "p":2,
                    "x":1176,
                    "y":358
                },
                "9":{
                    "nid":2043,
                    "p":2,
                    "x":842,
                    "y":490
                },
                "10":{
                    "nid":2043,
                    "p":2,
                    "x":803,
                    "y":624
                },
                "11":{
                    "nid":2044,
                    "p":3,
                    "x":196,
                    "y":16
                },
                "12":{
                    "nid":2044,
                    "p":3,
                    "x":362,
                    "y":22
                },
                "13":{
                    "nid":2044,
                    "p":3,
                    "x":748,
                    "y":58
                },
                "14":{
                    "nid":2044,
                    "p":3,
                    "x":429,
                    "y":114
                },
                "15":{
                    "nid":2044,
                    "p":3,
                    "x":533,
                    "y":122
                },
                "16":{
                    "nid":2044,
                    "p":3,
                    "x":774,
                    "y":172
                },
                "17":{
                    "nid":2044,
                    "p":3,
                    "x":1114,
                    "y":98
                },
                "18":{
                    "nid":2044,
                    "p":3,
                    "x":140,
                    "y":224
                },
                "19":{
                    "nid":2044,
                    "p":3,
                    "x":228,
                    "y":224
                },
                "20":{
                    "nid":2044,
                    "p":3,
                    "x":429,
                    "y":196
                },
                "21":{
                    "nid":2044,
                    "p":3,
                    "x":327,
                    "y":295
                },
                "22":{
                    "nid":2044,
                    "p":3,
                    "x":349,
                    "y":370
                },
                "23":{
                    "nid":2044,
                    "p":3,
                    "x":37,
                    "y":436
                },
                "24":{
                    "nid":2044,
                    "p":3,
                    "x":231,
                    "y":417
                },
                "25":{
                    "nid":2044,
                    "p":3,
                    "x":417,
                    "y":470
                },
                "26":{
                    "nid":2044,
                    "p":3,
                    "x":493,
                    "y":515
                },
                "27":{
                    "nid":2044,
                    "p":3,
                    "x":572,
                    "y":492
                },
                "28":{
                    "nid":2044,
                    "p":3,
                    "x":604,
                    "y":411
                },
                "29":{
                    "nid":2044,
                    "p":3,
                    "x":196,
                    "y":601
                },
                "30":{
                    "nid":2044,
                    "p":3,
                    "x":542,
                    "y":749
                },
                "31":{
                    "nid":2045,
                    "p":4,
                    "x":245,
                    "y":58
                },
                "32":{
                    "nid":2045,
                    "p":4,
                    "x":595,
                    "y":12
                },
                "33":{
                    "nid":2045,
                    "p":4,
                    "x":834,
                    "y":0
                },
                "34":{
                    "nid":2045,
                    "p":4,
                    "x":1202,
                    "y":78
                },
                "35":{
                    "nid":2045,
                    "p":4,
                    "x":1315,
                    "y":78
                },
                "36":{
                    "nid":2045,
                    "p":4,
                    "x":327,
                    "y":106
                },
                "37":{
                    "nid":2045,
                    "p":4,
                    "x":834,
                    "y":94
                },
                "38":{
                    "nid":2045,
                    "p":4,
                    "x":323,
                    "y":195
                },
                "39":{
                    "nid":2045,
                    "p":4,
                    "x":1010,
                    "y":106
                },
                "40":{
                    "nid":2045,
                    "p":4,
                    "x":526,
                    "y":198
                },
                "41":{
                    "nid":2045,
                    "p":4,
                    "x":630,
                    "y":190
                },
                "42":{
                    "nid":2045,
                    "p":4,
                    "x":888,
                    "y":160
                },
                "43":{
                    "nid":2045,
                    "p":4,
                    "x":140,
                    "y":303
                },
                "44":{
                    "nid":2045,
                    "p":4,
                    "x":238,
                    "y":324
                },
                "45":{
                    "nid":2045,
                    "p":4,
                    "x":576,
                    "y":273
                },
                "46":{
                    "nid":2045,
                    "p":4,
                    "x":826,
                    "y":261
                },
                "47":{
                    "nid":2045,
                    "p":4,
                    "x":1017,
                    "y":261
                },
                "48":{
                    "nid":2045,
                    "p":4,
                    "x":650,
                    "y":334
                },
                "49":{
                    "nid":2045,
                    "p":4,
                    "x":834,
                    "y":362
                },
                "50":{
                    "nid":2045,
                    "p":4,
                    "x":928,
                    "y":362
                },
                "51":{
                    "nid":2045,
                    "p":4,
                    "x":323,
                    "y":440
                },
                "52":{
                    "nid":2045,
                    "p":4,
                    "x":758,
                    "y":432
                },
                "53":{
                    "nid":2045,
                    "p":4,
                    "x":984,
                    "y":424
                },
                "54":{
                    "nid":2045,
                    "p":4,
                    "x":106,
                    "y":513
                },
                "55":{
                    "nid":2045,
                    "p":4,
                    "x":245,
                    "y":502
                },
                "56":{
                    "nid":2045,
                    "p":4,
                    "x":327,
                    "y":540
                },
                "57":{
                    "nid":2045,
                    "p":4,
                    "x":567,
                    "y":585
                },
                "58":{
                    "nid":2045,
                    "p":4,
                    "x":685,
                    "y":624
                },
                "59":{
                    "nid":2045,
                    "p":4,
                    "x":857,
                    "y":679
                },
                "60":{
                    "nid":2045,
                    "p":4,
                    "x":258,
                    "y":640
                },
                "61":{
                    "nid":2045,
                    "p":4,
                    "x":362,
                    "y":633
                },
                "62":{
                    "nid":2045,
                    "p":4,
                    "x":467,
                    "y":671
                },
                "63":{
                    "nid":2045,
                    "p":4,
                    "x":567,
                    "y":679
                },
                "64":{
                    "nid":2045,
                    "p":4,
                    "x":21,
                    "y":688
                },
                "65":{
                    "nid":2045,
                    "p":4,
                    "x":90,
                    "y":733
                },
                "66":{
                    "nid":2045,
                    "p":4,
                    "x":593,
                    "y":722
                },
                "67":{
                    "nid":2045,
                    "p":4,
                    "x":371,
                    "y":770
                },
                "68":{
                    "nid":2045,
                    "p":4,
                    "x":478,
                    "y":811
                },
                "69":{
                    "nid":2045,
                    "p":4,
                    "x":567,
                    "y":811
                },
                "70":{
                    "nid":2045,
                    "p":4,
                    "x":810,
                    "y":813
                },
                "71":{
                    "nid":2046,
                    "p":5,
                    "x":630,
                    "y":68
                },
                "72":{
                    "nid":2046,
                    "p":5,
                    "x":975,
                    "y":12
                },
                "73":{
                    "nid":2046,
                    "p":5,
                    "x":716,
                    "y":246
                },
                "74":{
                    "nid":2046,
                    "p":5,
                    "x":915,
                    "y":261
                },
                "75":{
                    "nid":2046,
                    "p":5,
                    "x":1326,
                    "y":180
                },
                "76":{
                    "nid":2046,
                    "p":5,
                    "x":1214,
                    "y":246
                },
                "77":{
                    "nid":2046,
                    "p":5,
                    "x":728,
                    "y":339
                },
                "78":{
                    "nid":2046,
                    "p":5,
                    "x":1078,
                    "y":333
                },
                "79":{
                    "nid":2046,
                    "p":5,
                    "x":150,
                    "y":436
                },
                "80":{
                    "nid":2046,
                    "p":5,
                    "x":897,
                    "y":453
                },
                "81":{
                    "nid":2046,
                    "p":5,
                    "x":1118,
                    "y":430
                },
                "82":{
                    "nid":2046,
                    "p":5,
                    "x":1237,
                    "y":432
                },
                "83":{
                    "nid":2046,
                    "p":5,
                    "x":1404,
                    "y":460
                },
                "84":{
                    "nid":2046,
                    "p":5,
                    "x":1029,
                    "y":507
                },
                "85":{
                    "nid":2046,
                    "p":5,
                    "x":1202,
                    "y":531
                },
                "86":{
                    "nid":2046,
                    "p":5,
                    "x":1315,
                    "y":523
                },
                "87":{
                    "nid":2046,
                    "p":5,
                    "x":1107,
                    "y":585
                },
                "88":{
                    "nid":2046,
                    "p":5,
                    "x":1244,
                    "y":633
                },
                "89":{
                    "nid":2046,
                    "p":5,
                    "x":90,
                    "y":633
                },
                "90":{
                    "nid":2046,
                    "p":5,
                    "x":449,
                    "y":585
                },
                "91":{
                    "nid":2046,
                    "p":5,
                    "x":189,
                    "y":702
                },
                "92":{
                    "nid":2046,
                    "p":5,
                    "x":655,
                    "y":718
                },
                "93":{
                    "nid":2046,
                    "p":5,
                    "x":764,
                    "y":711
                },
                "94":{
                    "nid":2046,
                    "p":5,
                    "x":693,
                    "y":800
                },
                "95":{
                    "nid":2046,
                    "p":5,
                    "x":1088,
                    "y":735
                },
                "96":{
                    "nid":2046,
                    "p":5,
                    "x":1261,
                    "y":727
                },
                "97":{
                    "nid":2046,
                    "p":5,
                    "x":1118,
                    "y":811
                },
                "98":{
                    "nid":2046,
                    "p":5,
                    "x":1219,
                    "y":821
                },
                "99":{
                    "nid":2046,
                    "p":5,
                    "x":1326,
                    "y":824
                },
                "100":{
                    "nid":2046,
                    "p":5,
                    "x":1404,
                    "y":770
                }
            },
            "5":{
                "1":{
                    "nid":2047,
                    "p":1,
                    "x":334,
                    "y":240
                },
                "2":{
                    "nid":2047,
                    "p":1,
                    "x":40,
                    "y":147
                },
                "3":{
                    "nid":2047,
                    "p":1,
                    "x":207,
                    "y":21
                },
                "4":{
                    "nid":2047,
                    "p":1,
                    "x":535,
                    "y":613
                },
                "5":{
                    "nid":2047,
                    "p":1,
                    "x":1288,
                    "y":147
                },
                "6":{
                    "nid":0x0800,
                    "p":2,
                    "x":104,
                    "y":659
                },
                "7":{
                    "nid":0x0800,
                    "p":2,
                    "x":1296,
                    "y":40
                },
                "8":{
                    "nid":0x0800,
                    "p":2,
                    "x":100,
                    "y":281
                },
                "9":{
                    "nid":0x0800,
                    "p":2,
                    "x":60,
                    "y":611
                },
                "10":{
                    "nid":0x0800,
                    "p":2,
                    "x":383,
                    "y":19
                },
                "11":{
                    "nid":2049,
                    "p":3,
                    "x":376,
                    "y":196
                },
                "12":{
                    "nid":2049,
                    "p":3,
                    "x":305,
                    "y":183
                },
                "13":{
                    "nid":2049,
                    "p":3,
                    "x":93,
                    "y":363
                },
                "14":{
                    "nid":2049,
                    "p":3,
                    "x":984,
                    "y":0
                },
                "15":{
                    "nid":2049,
                    "p":3,
                    "x":93,
                    "y":707
                },
                "16":{
                    "nid":2049,
                    "p":3,
                    "x":314,
                    "y":659
                },
                "17":{
                    "nid":2049,
                    "p":3,
                    "x":500,
                    "y":549
                },
                "18":{
                    "nid":2049,
                    "p":3,
                    "x":1218,
                    "y":138
                },
                "19":{
                    "nid":2049,
                    "p":3,
                    "x":386,
                    "y":659
                },
                "20":{
                    "nid":2049,
                    "p":3,
                    "x":1050,
                    "y":869
                },
                "21":{
                    "nid":2050,
                    "p":4,
                    "x":115,
                    "y":74
                },
                "22":{
                    "nid":2050,
                    "p":4,
                    "x":154,
                    "y":203
                },
                "23":{
                    "nid":2050,
                    "p":4,
                    "x":472,
                    "y":17
                },
                "24":{
                    "nid":2050,
                    "p":4,
                    "x":572,
                    "y":19
                },
                "25":{
                    "nid":2050,
                    "p":4,
                    "x":672,
                    "y":19
                },
                "26":{
                    "nid":2050,
                    "p":4,
                    "x":87,
                    "y":147
                },
                "27":{
                    "nid":2050,
                    "p":4,
                    "x":775,
                    "y":19
                },
                "28":{
                    "nid":2050,
                    "p":4,
                    "x":864,
                    "y":28
                },
                "29":{
                    "nid":2050,
                    "p":4,
                    "x":672,
                    "y":425
                },
                "30":{
                    "nid":2050,
                    "p":4,
                    "x":894,
                    "y":244
                },
                "31":{
                    "nid":2050,
                    "p":4,
                    "x":394,
                    "y":458
                },
                "32":{
                    "nid":2050,
                    "p":4,
                    "x":572,
                    "y":404
                },
                "33":{
                    "nid":2050,
                    "p":4,
                    "x":734,
                    "y":336
                },
                "34":{
                    "nid":2050,
                    "p":4,
                    "x":767,
                    "y":437
                },
                "35":{
                    "nid":2050,
                    "p":4,
                    "x":931,
                    "y":370
                },
                "36":{
                    "nid":2050,
                    "p":4,
                    "x":472,
                    "y":404
                },
                "37":{
                    "nid":2050,
                    "p":4,
                    "x":650,
                    "y":336
                },
                "38":{
                    "nid":2050,
                    "p":4,
                    "x":594,
                    "y":691
                },
                "39":{
                    "nid":2050,
                    "p":4,
                    "x":828,
                    "y":333
                },
                "40":{
                    "nid":2050,
                    "p":4,
                    "x":853,
                    "y":501
                },
                "41":{
                    "nid":2050,
                    "p":4,
                    "x":193,
                    "y":643
                },
                "42":{
                    "nid":2050,
                    "p":4,
                    "x":677,
                    "y":528
                },
                "43":{
                    "nid":2050,
                    "p":4,
                    "x":783,
                    "y":548
                },
                "44":{
                    "nid":2050,
                    "p":4,
                    "x":864,
                    "y":593
                },
                "45":{
                    "nid":2050,
                    "p":4,
                    "x":950,
                    "y":524
                },
                "46":{
                    "nid":2050,
                    "p":4,
                    "x":357,
                    "y":549
                },
                "47":{
                    "nid":2050,
                    "p":4,
                    "x":672,
                    "y":627
                },
                "48":{
                    "nid":2050,
                    "p":4,
                    "x":767,
                    "y":657
                },
                "49":{
                    "nid":2050,
                    "p":4,
                    "x":890,
                    "y":696
                },
                "50":{
                    "nid":2050,
                    "p":4,
                    "x":968,
                    "y":636
                },
                "51":{
                    "nid":2050,
                    "p":4,
                    "x":599,
                    "y":790
                },
                "52":{
                    "nid":2050,
                    "p":4,
                    "x":1393,
                    "y":579
                },
                "53":{
                    "nid":2050,
                    "p":4,
                    "x":448,
                    "y":766
                },
                "54":{
                    "nid":2050,
                    "p":4,
                    "x":984,
                    "y":721
                },
                "55":{
                    "nid":2050,
                    "p":4,
                    "x":677,
                    "y":738
                },
                "56":{
                    "nid":2050,
                    "p":4,
                    "x":775,
                    "y":774
                },
                "57":{
                    "nid":2050,
                    "p":4,
                    "x":1372,
                    "y":138
                },
                "58":{
                    "nid":2050,
                    "p":4,
                    "x":472,
                    "y":687
                },
                "59":{
                    "nid":2050,
                    "p":4,
                    "x":872,
                    "y":785
                },
                "60":{
                    "nid":2050,
                    "p":4,
                    "x":1364,
                    "y":347
                },
                "61":{
                    "nid":2051,
                    "p":5,
                    "x":599,
                    "y":216
                },
                "62":{
                    "nid":2051,
                    "p":5,
                    "x":494,
                    "y":216
                },
                "63":{
                    "nid":2051,
                    "p":5,
                    "x":472,
                    "y":118
                },
                "64":{
                    "nid":2051,
                    "p":5,
                    "x":572,
                    "y":122
                },
                "65":{
                    "nid":2051,
                    "p":5,
                    "x":677,
                    "y":122
                },
                "66":{
                    "nid":2051,
                    "p":5,
                    "x":60,
                    "y":792
                },
                "67":{
                    "nid":2051,
                    "p":5,
                    "x":182,
                    "y":785
                },
                "68":{
                    "nid":2051,
                    "p":5,
                    "x":279,
                    "y":785
                },
                "69":{
                    "nid":2051,
                    "p":5,
                    "x":789,
                    "y":216
                },
                "70":{
                    "nid":2051,
                    "p":5,
                    "x":697,
                    "y":216
                },
                "71":{
                    "nid":2051,
                    "p":5,
                    "x":1140,
                    "y":17
                },
                "72":{
                    "nid":2051,
                    "p":5,
                    "x":972,
                    "y":69
                },
                "73":{
                    "nid":2051,
                    "p":5,
                    "x":1070,
                    "y":105
                },
                "74":{
                    "nid":2051,
                    "p":5,
                    "x":1140,
                    "y":203
                },
                "75":{
                    "nid":2051,
                    "p":5,
                    "x":1256,
                    "y":230
                },
                "76":{
                    "nid":2051,
                    "p":5,
                    "x":984,
                    "y":166
                },
                "77":{
                    "nid":2051,
                    "p":5,
                    "x":1159,
                    "y":285
                },
                "78":{
                    "nid":2051,
                    "p":5,
                    "x":1097,
                    "y":347
                },
                "79":{
                    "nid":2051,
                    "p":5,
                    "x":890,
                    "y":122
                },
                "80":{
                    "nid":2051,
                    "p":5,
                    "x":789,
                    "y":122
                },
                "81":{
                    "nid":2051,
                    "p":5,
                    "x":1050,
                    "y":245
                },
                "82":{
                    "nid":2051,
                    "p":5,
                    "x":335,
                    "y":336
                },
                "83":{
                    "nid":2051,
                    "p":5,
                    "x":459,
                    "y":308
                },
                "84":{
                    "nid":2051,
                    "p":5,
                    "x":562,
                    "y":308
                },
                "85":{
                    "nid":2051,
                    "p":5,
                    "x":305,
                    "y":425
                },
                "86":{
                    "nid":2051,
                    "p":5,
                    "x":68,
                    "y":447
                },
                "87":{
                    "nid":2051,
                    "p":5,
                    "x":201,
                    "y":425
                },
                "88":{
                    "nid":2051,
                    "p":5,
                    "x":243,
                    "y":515
                },
                "89":{
                    "nid":2051,
                    "p":5,
                    "x":1245,
                    "y":471
                },
                "90":{
                    "nid":2051,
                    "p":5,
                    "x":1364,
                    "y":471
                },
                "91":{
                    "nid":2051,
                    "p":5,
                    "x":146,
                    "y":503
                },
                "92":{
                    "nid":2051,
                    "p":5,
                    "x":1159,
                    "y":443
                },
                "93":{
                    "nid":2051,
                    "p":5,
                    "x":1159,
                    "y":559
                },
                "94":{
                    "nid":2051,
                    "p":5,
                    "x":1195,
                    "y":666
                },
                "95":{
                    "nid":2051,
                    "p":5,
                    "x":1315,
                    "y":681
                },
                "96":{
                    "nid":2051,
                    "p":5,
                    "x":1062,
                    "y":443
                },
                "97":{
                    "nid":2051,
                    "p":5,
                    "x":1273,
                    "y":579
                },
                "98":{
                    "nid":2051,
                    "p":5,
                    "x":1050,
                    "y":549
                },
                "99":{
                    "nid":2051,
                    "p":5,
                    "x":1099,
                    "y":643
                },
                "100":{
                    "nid":2051,
                    "p":5,
                    "x":1117,
                    "y":744
                }
            }
        };
        public static var CROSS_CONTENTION_P_DATA:Object = {
            "1":{
                "lvl":50,
                "score":1,
                "bp":4130220000300,
                "lvl2":69
            },
            "2":{
                "lvl":70,
                "score":2,
                "bp":4130220000299,
                "lvl2":89
            },
            "3":{
                "lvl":90,
                "score":3,
                "bp":4130220000298,
                "lvl2":109
            },
            "4":{
                "lvl":110,
                "score":4,
                "bp":4130220000301,
                "lvl2":129
            },
            "5":{
                "lvl":130,
                "score":6,
                "bp":4130220000302,
                "lvl2":150
            }
        };
        public static var CROSS_CONTENTION_MAP_REC_INIT:Object = {
            "1":5,
            "2":4,
            "3":4,
            "4":3,
            "5":3,
            "6":3,
            "7":3,
            "8":2,
            "9":2,
            "10":2,
            "11":2,
            "12":2,
            "13":2,
            "14":2,
            "15":2,
            "16":1,
            "17":1,
            "18":1,
            "19":1,
            "20":1,
            "21":1,
            "22":1,
            "23":1,
            "24":1,
            "25":1,
            "26":1,
            "27":1,
            "28":1,
            "29":1,
            "30":1,
            "31":1,
            "32":1,
            "33":1,
            "34":1,
            "35":1,
            "36":1,
            "37":1,
            "38":1,
            "39":1
        };
        public static var CROSS_CONTENTION_BOSS_DATA:Object = {
            "1":{"data":[{
                    "nid":2026,
                    "p":[1341, 846]
                }]},
            "2":{"data":[{
                    "nid":2025,
                    "p":[733, 0x0202]
                }]},
            "3":{"data":[{
                    "nid":2025,
                    "p":[733, 0x0202]
                }]},
            "4":{"data":[{
                    "nid":2024,
                    "p":[1286, 420]
                }]},
            "5":{"data":[{
                    "nid":2024,
                    "p":[1286, 420]
                }]},
            "6":{"data":[{
                    "nid":2024,
                    "p":[1286, 420]
                }]},
            "7":{"data":[{
                    "nid":2024,
                    "p":[1286, 420]
                }]},
            "8":{"data":[{
                    "nid":2023,
                    "p":[813, 644]
                }]},
            "9":{"data":[{
                    "nid":2023,
                    "p":[813, 644]
                }]},
            "10":{"data":[{
                    "nid":2023,
                    "p":[813, 644]
                }]},
            "11":{"data":[{
                    "nid":2023,
                    "p":[813, 644]
                }]},
            "12":{"data":[{
                    "nid":2023,
                    "p":[813, 644]
                }]},
            "13":{"data":[{
                    "nid":2023,
                    "p":[813, 644]
                }]},
            "14":{"data":[{
                    "nid":2023,
                    "p":[813, 644]
                }]},
            "15":{"data":[{
                    "nid":2023,
                    "p":[813, 644]
                }]},
            "16":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "17":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "18":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "19":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "20":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "21":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "22":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "23":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "24":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "25":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "26":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "27":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "28":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "29":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "30":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "31":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "32":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "33":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "34":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "35":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "36":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "37":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "38":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]},
            "39":{"data":[{
                    "nid":2022,
                    "p":[877, 565]
                }]}
        };
        public static var AREAR_COLOR:Array = ["#FFFFFF", "#FFFFFF", "#00FF00", "#0080FF", "#8080FF", "#FF8040"];
        public static var CROSS_CONTENTION_MAP_ENTRANCE:Object = {
            "16":[1],
            "18":[22],
            "20":[801],
            "21":[802],
            "23":[46],
            "24":[59],
            "26":[80],
            "27":[86],
            "28":[87],
            "29":[85],
            "30":[83],
            "31":[77],
            "32":[70],
            "34":[30],
            "36":[800],
            "38":[13]
        };
        public static var CROSS_CONTENTION_UNITED_SERVER_NAME:Object = {
            "501":(Language.CROSS_CONTENTION_PANEL_U[145] + "_1"),
            "505":(Language.CROSS_CONTENTION_PANEL_U[147] + "_1"),
            "506":(Language.CROSS_CONTENTION_PANEL_U[147] + "_52"),
            "508":(Language.CROSS_CONTENTION_PANEL_U[147] + "_23"),
            "528":(Language.CROSS_CONTENTION_PANEL_U[147] + "_42"),
            "603":(Language.CROSS_CONTENTION_PANEL_U[147] + "_48"),
            "604":(Language.CROSS_CONTENTION_PANEL_U[147] + "_51"),
            "605":(Language.CROSS_CONTENTION_PANEL_U[147] + "_50"),
            "601":(Language.CROSS_CONTENTION_PANEL_U[147] + "_53"),
            "0x0200":(Language.CROSS_CONTENTION_PANEL_U[149] + "_1"),
            "513":(Language.CROSS_CONTENTION_PANEL_U[149] + "_5"),
            "0x0202":(Language.CROSS_CONTENTION_PANEL_U[149] + "_11"),
            "526":(Language.CROSS_CONTENTION_PANEL_U[149] + "_24"),
            "515":(Language.CROSS_CONTENTION_PANEL_U[150] + "_1"),
            "516":(Language.CROSS_CONTENTION_PANEL_U[151] + "_1"),
            "517":(Language.CROSS_CONTENTION_PANEL_U[152] + "_1"),
            "520":(Language.CROSS_CONTENTION_PANEL_U[153] + "_1"),
            "521":(Language.CROSS_CONTENTION_PANEL_U[153] + "_4"),
            "522":(Language.CROSS_CONTENTION_PANEL_U[153] + "_8"),
            "523":(Language.CROSS_CONTENTION_PANEL_U[153] + "_14"),
            "524":(Language.CROSS_CONTENTION_PANEL_U[153] + "_17"),
            "525":(Language.CROSS_CONTENTION_PANEL_U[153] + "_18"),
            "527":(Language.CROSS_CONTENTION_PANEL_U[153] + "_19"),
            "529":(Language.CROSS_CONTENTION_PANEL_U[153] + "_20"),
            "530":(Language.CROSS_CONTENTION_PANEL_U[153] + "_21"),
            "531":(Language.CROSS_CONTENTION_PANEL_U[153] + "_22")
        };
        public static const CROSS_CONTENTION_UINT_ID_START:int = 600000;
        public static var TREASURE_NPC:* = {
            "2072":true,
            "2073":true,
            "2074":true
        };
        public static var TRIALS_PASS_MAP:* = {
            "558":1,
            "559":2,
            "560":3,
            "562":4,
            "563":4,
            "564":4,
            "565":4,
            "566":4,
            "567":4,
            "568":4,
            "569":4,
            "570":4,
            "571":4,
            "572":4,
            "573":4,
            "574":4,
            "575":4,
            "576":4,
            "561":5
        };
        public static var STAGE_EIGHT_LEVEL:* = 20;
        public static var STAGE_EIGHT_MIN:* = 0.9;
        public static var STAGE_EIGHT_MAX:* = 2;
        public static var STAGE_EIGHT_ITEMID:uint = 4758;
        public static const QILING_ITEMID:int = 5974;
        public static const DRESS_CRYSTAL_PRICE:int = 1;
        public static const DRESS_JEWEL_PRICE:int = 5;
        public static const SUBLIME_ITEMID:int = 4841;
        public static const SUBLIME_LEVEL:int = 50;
        public static const SUBLIME_MAX:int = 50;
        public static const RESTRAIN_ITEMID:int = 4842;
        public static const RESTRAIN_ITEM_NUM:int = 1;
        public static const RESTRAIN_ITEM_PRICE:int = 5;
        public static var WORLD_CUP_INFO:Object = {
            "bl":{
                "icon":4130220000399,
                "icon2":4130220000438,
                "icon3":4130220000638,
                "name":"波兰"
            },
            "agt":{
                "icon":4130220000400,
                "icon2":4130220000439,
                "icon3":4130220000639,
                "name":"阿根廷"
            },
            "adly":{
                "icon":4130220000401,
                "icon2":4130220000440,
                "icon3":4130220000640,
                "name":"澳大利亚"
            },
            "bx":{
                "icon":4130220000402,
                "icon2":4130220000441,
                "icon3":4130220000641,
                "name":"巴西"
            },
            "bls":{
                "icon":4130220000403,
                "icon2":4130220000442,
                "icon3":4130220000642,
                "name":"比利时"
            },
            "bd":{
                "icon":4130220000404,
                "icon2":4130220000443,
                "icon3":4130220000643,
                "name":"冰岛"
            },
            "dg":{
                "icon":4130220000405,
                "icon2":4130220000444,
                "icon3":4130220000644,
                "name":"德国"
            },
            "els":{
                "icon":4130220000406,
                "icon2":4130220000445,
                "icon3":4130220000645,
                "name":"俄罗斯"
            },
            "bnm":{
                "icon":4130220000407,
                "icon2":4130220000446,
                "icon3":4130220000646,
                "name":"巴拿马"
            },
            "fg":{
                "icon":4130220000408,
                "icon2":4130220000447,
                "icon3":4130220000647,
                "name":"法国"
            },
            "glby":{
                "icon":4130220000409,
                "icon2":4130220000448,
                "icon3":4130220000648,
                "name":"哥伦比亚"
            },
            "gsdlj":{
                "icon":4130220000410,
                "icon2":4130220000449,
                "icon3":4130220000649,
                "name":"哥斯达黎加"
            },
            "hg":{
                "icon":4130220000411,
                "icon2":4130220000450,
                "icon3":4130220000650,
                "name":"韩国"
            },
            "snje":{
                "icon":4130220000412,
                "icon2":4130220000451,
                "icon3":4130220000651,
                "name":"塞内加尔"
            },
            "aj":{
                "icon":4130220000413,
                "icon2":4130220000452,
                "icon3":4130220000652,
                "name":"埃及"
            },
            "bilu":{
                "icon":4130220000414,
                "icon2":4130220000453,
                "icon3":4130220000653,
                "name":"秘鲁"
            },
            "rd":{
                "icon":4130220000415,
                "icon2":4130220000454,
                "icon3":4130220000654,
                "name":"瑞典"
            },
            "tns":{
                "icon":4130220000416,
                "icon2":4130220000455,
                "icon3":4130220000655,
                "name":"突尼斯"
            },
            "kldy":{
                "icon":4130220000417,
                "icon2":4130220000456,
                "icon3":4130220000656,
                "name":"克罗地亚"
            },
            "dm":{
                "icon":4130220000418,
                "icon2":4130220000457,
                "icon3":4130220000657,
                "name":"丹麦"
            },
            "mxg":{
                "icon":4130220000419,
                "icon2":4130220000458,
                "icon3":4130220000658,
                "name":"墨西哥"
            },
            "nrly":{
                "icon":4130220000420,
                "icon2":4130220000459,
                "icon3":4130220000659,
                "name":"尼日利亚"
            },
            "pty":{
                "icon":4130220000421,
                "icon2":4130220000460,
                "icon3":4130220000660,
                "name":"葡萄牙"
            },
            "rb":{
                "icon":4130220000422,
                "icon2":4130220000461,
                "icon3":4130220000661,
                "name":"日本"
            },
            "rs":{
                "icon":4130220000423,
                "icon2":4130220000462,
                "icon3":4130220000662,
                "name":"瑞士"
            },
            "wlg":{
                "icon":4130220000424,
                "icon2":4130220000463,
                "icon3":4130220000663,
                "name":"乌拉圭"
            },
            "xby":{
                "icon":4130220000425,
                "icon2":4130220000464,
                "icon3":4130220000664,
                "name":"西班牙"
            },
            "sewy":{
                "icon":4130220000426,
                "icon2":4130220000465,
                "icon3":4130220000665,
                "name":"塞尔维亚"
            },
            "yl":{
                "icon":4130220000427,
                "icon2":4130220000466,
                "icon3":4130220000666,
                "name":"伊朗"
            },
            "stalb":{
                "icon":4130220000428,
                "icon2":4130220000467,
                "icon3":4130220000667,
                "name":"沙特阿拉伯"
            },
            "ygl":{
                "icon":4130220000429,
                "icon2":4130220000468,
                "icon3":4130220000668,
                "name":"英格兰"
            },
            "mlg":{
                "icon":4130220000430,
                "icon2":4130220000469,
                "icon3":4130220000669,
                "name":"摩洛哥"
            }
        };
        public static var MC_BIRTH_CONFIG:Object = {};
        public static const AWAKEN_MIN_LEVEL:uint = 80;
        public static const AWAKEN_ITEMID:int = 4913;
        public static const AWAKEN_EDGE:uint = 77;
        public static const AWAKEN_PERCENT_PROP:Object = {
            "62":true,
            "63":true
        };
        public static const AWAKEN_PROP_DICT:Object = {
            "1":"HP",
            "4":"Công VL",
            "5":"Công MP",
            "6":"Phòng VL",
            "7":"Phòng MP",
            "8":"C.Xác",
            "9":"N.Tránh",
            "11":"Tốc",
            "13":"B.Kích",
            "14":"XPN",
            "31":"Kh.Bạo",
            "34":"Miễn Tử",
            "59":"Giảm STVL Cuối",
            "60":"Giảm STMP Cuối",
            "61":"Kháng XPN",
            "62":"Tăng STVL Cuối",
            "63":"Tăng STMP Cuối"
        };
        public static const CONTRACT_EXP:String = "Exp";
        public static const CONTRACT_DICT:Object = {
            "1":"hp",
            "2":"speed",
            "3":"physics",
            "4":"magic"
        };
        public static const MAX_CONTRACT_LEVEL:int = 50;
        public static const GUARD_NAME:Object = {
            "0":Language.PANEL_PETGUARDINSIDE[15],
            "1":((Language.PANEL_PETGUARDINSIDE[16] + "-") + Language.PANEL_PETGUARDINSIDE[18]),
            "2":((Language.PANEL_PETGUARDINSIDE[16] + "-") + Language.PANEL_PETGUARDINSIDE[19]),
            "3":((Language.PANEL_PETGUARDINSIDE[16] + "-") + Language.PANEL_PETGUARDINSIDE[20]),
            "4":((Language.PANEL_PETGUARDINSIDE[16] + "-") + Language.PANEL_PETGUARDINSIDE[21]),
            "10":((Language.PANEL_PETGUARDINSIDE[17] + "-") + Language.PANEL_PETGUARDINSIDE[18]),
            "20":((Language.PANEL_PETGUARDINSIDE[17] + "-") + Language.PANEL_PETGUARDINSIDE[19]),
            "30":((Language.PANEL_PETGUARDINSIDE[17] + "-") + Language.PANEL_PETGUARDINSIDE[20]),
            "40":((Language.PANEL_PETGUARDINSIDE[17] + "-") + Language.PANEL_PETGUARDINSIDE[21])
        };
        public static const MAGIC_CRYSTAL_UP:Object = {
            "0":{
                "0":{
                    "max":100,
                    "num":20,
                    "t":1,
                    "v":12000
                },
                "1":{
                    "max":200,
                    "num":30,
                    "t":1,
                    "v":24000
                },
                "2":{
                    "max":300,
                    "num":40,
                    "t":1,
                    "v":36000
                },
                "3":{
                    "max":400,
                    "num":50,
                    "t":1,
                    "v":48000
                },
                "4":{
                    "max":500,
                    "num":60,
                    "t":1,
                    "v":60000
                },
                "5":{
                    "max":600,
                    "num":60,
                    "t":1,
                    "v":72000
                },
                "6":{
                    "max":700,
                    "num":70,
                    "t":1,
                    "v":84000
                },
                "7":{
                    "max":800,
                    "num":80,
                    "t":1,
                    "v":96000
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":1,
                    "v":108000
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":1,
                    "v":120000
                }
            },
            "1":{
                "0":{
                    "max":100,
                    "num":20,
                    "t":2,
                    "v":4000
                },
                "1":{
                    "max":200,
                    "num":30,
                    "t":2,
                    "v":8000
                },
                "2":{
                    "max":300,
                    "num":40,
                    "t":2,
                    "v":12000
                },
                "3":{
                    "max":400,
                    "num":50,
                    "t":2,
                    "v":16000
                },
                "4":{
                    "max":500,
                    "num":60,
                    "t":2,
                    "v":20000
                },
                "5":{
                    "max":600,
                    "num":60,
                    "t":2,
                    "v":24000
                },
                "6":{
                    "max":700,
                    "num":70,
                    "t":2,
                    "v":28000
                },
                "7":{
                    "max":800,
                    "num":80,
                    "t":2,
                    "v":0x7D00
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":2,
                    "v":36000
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":2,
                    "v":40000
                }
            },
            "2":{
                "0":{
                    "max":100,
                    "num":20,
                    "t":4,
                    "v":3000
                },
                "1":{
                    "max":200,
                    "num":30,
                    "t":4,
                    "v":6000
                },
                "2":{
                    "max":300,
                    "num":40,
                    "t":4,
                    "v":9000
                },
                "3":{
                    "max":400,
                    "num":50,
                    "t":4,
                    "v":12000
                },
                "4":{
                    "max":500,
                    "num":60,
                    "t":4,
                    "v":15000
                },
                "5":{
                    "max":600,
                    "num":60,
                    "t":4,
                    "v":18000
                },
                "6":{
                    "max":700,
                    "num":70,
                    "t":4,
                    "v":21000
                },
                "7":{
                    "max":800,
                    "num":80,
                    "t":4,
                    "v":24000
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":4,
                    "v":27000
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":4,
                    "v":30000
                }
            },
            "3":{
                "0":{
                    "max":100,
                    "num":20,
                    "t":5,
                    "v":2400
                },
                "1":{
                    "max":200,
                    "num":30,
                    "t":5,
                    "v":4800
                },
                "2":{
                    "max":300,
                    "num":40,
                    "t":5,
                    "v":7200
                },
                "3":{
                    "max":400,
                    "num":50,
                    "t":5,
                    "v":9600
                },
                "4":{
                    "max":500,
                    "num":60,
                    "t":5,
                    "v":12000
                },
                "5":{
                    "max":600,
                    "num":60,
                    "t":5,
                    "v":14400
                },
                "6":{
                    "max":700,
                    "num":70,
                    "t":5,
                    "v":16800
                },
                "7":{
                    "max":800,
                    "num":80,
                    "t":5,
                    "v":0x4B00
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":5,
                    "v":21600
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":5,
                    "v":24000
                }
            },
            "4":{
                "0":{
                    "max":100,
                    "num":20,
                    "t":6,
                    "v":9600
                },
                "1":{
                    "max":200,
                    "num":30,
                    "t":6,
                    "v":0x4B00
                },
                "2":{
                    "max":300,
                    "num":40,
                    "t":6,
                    "v":28800
                },
                "3":{
                    "max":400,
                    "num":50,
                    "t":6,
                    "v":0x9600
                },
                "4":{
                    "max":500,
                    "num":60,
                    "t":6,
                    "v":48000
                },
                "5":{
                    "max":600,
                    "num":60,
                    "t":6,
                    "v":0xE100
                },
                "6":{
                    "max":700,
                    "num":70,
                    "t":6,
                    "v":67200
                },
                "7":{
                    "max":800,
                    "num":80,
                    "t":6,
                    "v":76800
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":6,
                    "v":86400
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":6,
                    "v":96000
                }
            },
            "5":{
                "0":{
                    "max":100,
                    "num":20,
                    "t":7,
                    "v":9600
                },
                "1":{
                    "max":200,
                    "num":30,
                    "t":7,
                    "v":0x4B00
                },
                "2":{
                    "max":300,
                    "num":40,
                    "t":7,
                    "v":28800
                },
                "3":{
                    "max":400,
                    "num":50,
                    "t":7,
                    "v":0x9600
                },
                "4":{
                    "max":500,
                    "num":60,
                    "t":7,
                    "v":48000
                },
                "5":{
                    "max":600,
                    "num":60,
                    "t":7,
                    "v":0xE100
                },
                "6":{
                    "max":700,
                    "num":70,
                    "t":7,
                    "v":67200
                },
                "7":{
                    "max":800,
                    "num":80,
                    "t":7,
                    "v":76800
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":7,
                    "v":86400
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":7,
                    "v":96000
                }
            },
            "6":{
                "0":{
                    "max":100,
                    "num":20,
                    "t":11,
                    "v":1200
                },
                "1":{
                    "max":200,
                    "num":30,
                    "t":11,
                    "v":2400
                },
                "2":{
                    "max":300,
                    "num":40,
                    "t":11,
                    "v":3600
                },
                "3":{
                    "max":400,
                    "num":50,
                    "t":11,
                    "v":4800
                },
                "4":{
                    "max":500,
                    "num":60,
                    "t":11,
                    "v":6000
                },
                "5":{
                    "max":600,
                    "num":60,
                    "t":11,
                    "v":7200
                },
                "6":{
                    "max":700,
                    "num":70,
                    "t":11,
                    "v":8400
                },
                "7":{
                    "max":800,
                    "num":80,
                    "t":11,
                    "v":9600
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":11,
                    "v":10800
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":11,
                    "v":12000
                }
            },
            "7":{
                "0":{
                    "max":100,
                    "num":12,
                    "t":13,
                    "v":1.2
                },
                "1":{
                    "max":200,
                    "num":24,
                    "t":13,
                    "v":2.4
                },
                "2":{
                    "max":300,
                    "num":32,
                    "t":13,
                    "v":3.6
                },
                "3":{
                    "max":400,
                    "num":40,
                    "t":13,
                    "v":4.8
                },
                "4":{
                    "max":500,
                    "num":48,
                    "t":13,
                    "v":6
                },
                "5":{
                    "max":600,
                    "num":52,
                    "t":13,
                    "v":7.2
                },
                "6":{
                    "max":700,
                    "num":62,
                    "t":13,
                    "v":8.4
                },
                "7":{
                    "max":800,
                    "num":70,
                    "t":13,
                    "v":9.6
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":13,
                    "v":10.8
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":13,
                    "v":12
                }
            },
            "8":{
                "0":{
                    "max":100,
                    "num":12,
                    "t":31,
                    "v":1.2
                },
                "1":{
                    "max":200,
                    "num":24,
                    "t":31,
                    "v":2.4
                },
                "2":{
                    "max":300,
                    "num":32,
                    "t":31,
                    "v":3.6
                },
                "3":{
                    "max":400,
                    "num":40,
                    "t":31,
                    "v":4.8
                },
                "4":{
                    "max":500,
                    "num":48,
                    "t":31,
                    "v":6
                },
                "5":{
                    "max":600,
                    "num":52,
                    "t":31,
                    "v":7.2
                },
                "6":{
                    "max":700,
                    "num":62,
                    "t":31,
                    "v":8.4
                },
                "7":{
                    "max":800,
                    "num":70,
                    "t":31,
                    "v":9.6
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":31,
                    "v":10.8
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":31,
                    "v":12
                }
            },
            "9":{
                "0":{
                    "max":100,
                    "num":24,
                    "t":14,
                    "v":0.5
                },
                "1":{
                    "max":200,
                    "num":32,
                    "t":14,
                    "v":1
                },
                "2":{
                    "max":300,
                    "num":42,
                    "t":14,
                    "v":1.5
                },
                "3":{
                    "max":400,
                    "num":52,
                    "t":14,
                    "v":2
                },
                "4":{
                    "max":500,
                    "num":64,
                    "t":14,
                    "v":2.5
                },
                "5":{
                    "max":600,
                    "num":64,
                    "t":14,
                    "v":3
                },
                "6":{
                    "max":700,
                    "num":72,
                    "t":14,
                    "v":3.5
                },
                "7":{
                    "max":800,
                    "num":88,
                    "t":14,
                    "v":4
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":14,
                    "v":4.5
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":14,
                    "v":5
                }
            },
            "10":{
                "0":{
                    "max":100,
                    "num":24,
                    "t":61,
                    "v":0.5
                },
                "1":{
                    "max":200,
                    "num":32,
                    "t":61,
                    "v":1
                },
                "2":{
                    "max":300,
                    "num":42,
                    "t":61,
                    "v":1.5
                },
                "3":{
                    "max":400,
                    "num":52,
                    "t":61,
                    "v":2
                },
                "4":{
                    "max":500,
                    "num":64,
                    "t":61,
                    "v":2.5
                },
                "5":{
                    "max":600,
                    "num":64,
                    "t":61,
                    "v":3
                },
                "6":{
                    "max":700,
                    "num":72,
                    "t":61,
                    "v":3.5
                },
                "7":{
                    "max":800,
                    "num":88,
                    "t":61,
                    "v":4
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":61,
                    "v":4.5
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":61,
                    "v":5
                }
            },
            "11":{
                "0":{
                    "max":100,
                    "num":12,
                    "t":8,
                    "v":1.2
                },
                "1":{
                    "max":200,
                    "num":24,
                    "t":8,
                    "v":2.4
                },
                "2":{
                    "max":300,
                    "num":32,
                    "t":8,
                    "v":3.6
                },
                "3":{
                    "max":400,
                    "num":40,
                    "t":8,
                    "v":4.8
                },
                "4":{
                    "max":500,
                    "num":48,
                    "t":8,
                    "v":6
                },
                "5":{
                    "max":600,
                    "num":52,
                    "t":8,
                    "v":7.2
                },
                "6":{
                    "max":700,
                    "num":62,
                    "t":8,
                    "v":8.4
                },
                "7":{
                    "max":800,
                    "num":70,
                    "t":8,
                    "v":9.6
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":8,
                    "v":10.8
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":8,
                    "v":12
                }
            },
            "12":{
                "0":{
                    "max":100,
                    "num":12,
                    "t":9,
                    "v":1.2
                },
                "1":{
                    "max":200,
                    "num":24,
                    "t":9,
                    "v":2.4
                },
                "2":{
                    "max":300,
                    "num":32,
                    "t":9,
                    "v":3.6
                },
                "3":{
                    "max":400,
                    "num":40,
                    "t":9,
                    "v":4.8
                },
                "4":{
                    "max":500,
                    "num":48,
                    "t":9,
                    "v":6
                },
                "5":{
                    "max":600,
                    "num":52,
                    "t":9,
                    "v":7.2
                },
                "6":{
                    "max":700,
                    "num":62,
                    "t":9,
                    "v":8.4
                },
                "7":{
                    "max":800,
                    "num":70,
                    "t":9,
                    "v":9.6
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":9,
                    "v":10.8
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":9,
                    "v":12
                }
            },
            "13":{
                "0":{
                    "max":100,
                    "num":24,
                    "t":32,
                    "v":1
                },
                "1":{
                    "max":200,
                    "num":32,
                    "t":32,
                    "v":2
                },
                "2":{
                    "max":300,
                    "num":42,
                    "t":32,
                    "v":3
                },
                "3":{
                    "max":400,
                    "num":52,
                    "t":32,
                    "v":4
                },
                "4":{
                    "max":500,
                    "num":64,
                    "t":32,
                    "v":5
                },
                "5":{
                    "max":600,
                    "num":64,
                    "t":32,
                    "v":6
                },
                "6":{
                    "max":700,
                    "num":72,
                    "t":32,
                    "v":7
                },
                "7":{
                    "max":800,
                    "num":88,
                    "t":32,
                    "v":8
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":32,
                    "v":9
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":32,
                    "v":10
                }
            },
            "14":{
                "0":{
                    "max":100,
                    "num":24,
                    "t":58,
                    "v":1
                },
                "1":{
                    "max":200,
                    "num":32,
                    "t":58,
                    "v":2
                },
                "2":{
                    "max":300,
                    "num":42,
                    "t":58,
                    "v":3
                },
                "3":{
                    "max":400,
                    "num":52,
                    "t":58,
                    "v":4
                },
                "4":{
                    "max":500,
                    "num":64,
                    "t":58,
                    "v":5
                },
                "5":{
                    "max":600,
                    "num":64,
                    "t":58,
                    "v":6
                },
                "6":{
                    "max":700,
                    "num":72,
                    "t":58,
                    "v":7
                },
                "7":{
                    "max":800,
                    "num":88,
                    "t":58,
                    "v":8
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":58,
                    "v":9
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":58,
                    "v":10
                }
            },
            "15":{
                "0":{
                    "max":100,
                    "num":12,
                    "t":72,
                    "v":1.2
                },
                "1":{
                    "max":200,
                    "num":24,
                    "t":72,
                    "v":2.4
                },
                "2":{
                    "max":300,
                    "num":32,
                    "t":72,
                    "v":3.6
                },
                "3":{
                    "max":400,
                    "num":40,
                    "t":72,
                    "v":4.8
                },
                "4":{
                    "max":500,
                    "num":48,
                    "t":72,
                    "v":6
                },
                "5":{
                    "max":600,
                    "num":52,
                    "t":72,
                    "v":7.2
                },
                "6":{
                    "max":700,
                    "num":62,
                    "t":72,
                    "v":8.4
                },
                "7":{
                    "max":800,
                    "num":70,
                    "t":72,
                    "v":9.6
                },
                "8":{
                    "max":900,
                    "num":90,
                    "t":72,
                    "v":10.8
                },
                "9":{
                    "max":1000,
                    "num":0,
                    "t":72,
                    "v":12
                }
            }
        };
        public static const MAGIC_CRYSTAL_ACTIVE:Object = {
            "0":{"num":10},
            "1":{"num":10},
            "2":{"num":10},
            "3":{"num":10},
            "4":{"num":10},
            "5":{"num":10},
            "6":{"num":10},
            "7":{"num":8},
            "8":{"num":8},
            "9":{"num":12},
            "10":{"num":12},
            "11":{"num":8},
            "12":{"num":8},
            "13":{"num":12},
            "14":{"num":12},
            "15":{"num":8}
        };
        public static const MAGIC_CRYSTAL_PROP_ICON:Object = {
            "0":4130220000898,
            "1":4130220000919,
            "2":4130220000906,
            "3":4130220000910,
            "4":4130220000911,
            "5":4130220000912,
            "6":4130220000921,
            "7":4130220000913,
            "8":4130220000914,
            "9":4130220000917,
            "10":4130220000918,
            "11":4130220000915,
            "12":4130220000916,
            "13":4130220000922,
            "14":4130220000923,
            "15":4130220000920
        };
        public static const PROP_SUFFIX:Object = {
            "14":2,
            "32":2,
            "71":2,
            "62":3,
            "63":3,
            "13":2,
            "4":1,
            "5":1,
            "11":1,
            "8":2,
            "72":2,
            "1":1,
            "59":3,
            "60":3,
            "58":2,
            "34":2,
            "61":2,
            "31":2,
            "9":2,
            "6":1,
            "7":1,
            "2":1,
            "10":2
        };
        public static var QI_LING_ITEM:int = 5974;
        public static var QILING_COLOR:Array = [100, 41, 24, 11, 0];
        public static var QILING_COLOR_CODE:Array = ["#FA5B05", "#FF33FF", "#0066FF", "#00FF00", "#FFFFFF"];
        public static var ANTI_WAIGUA_BOSSID:Array = [2553];

        {
            Alert.yesLabel = Language.GAMEPREDEF_S[0];
            Alert.noLabel = Language.GAMEPREDEF_S[1];
            Alert.cancelLabel = Language.GAMEPREDEF_S[2];
            Alert.okLabel = Language.GAMEPREDEF_S[3];
            ST_TEXT[ST_NORMAL] = Language.GAMEPREDEF_S[13];
            ST_TEXT[ST_RUNNING] = Language.GAMEPREDEF_S[14];
            ST_TEXT[ST_SHOPPING] = Language.GAMEPREDEF_S[15];
            ST_TEXT[ST_TRADE] = Language.GAMEPREDEF_S[16];
            ST_TEXT[ST_BATTLE] = Language.GAMEPREDEF_S[17];
            ST_TEXT[ST_LEVELUP] = Language.GAMEPREDEF_S[18];
            ST_TEXT[ST_CHANGING_MAP] = Language.GAMEPREDEF_S[19];
            ST_TEXT[ST_MAKE] = Language.GAMEPREDEF_S[20];
            ST_TEXT[ST_BANK] = Language.GAMEPREDEF_S[21];
            ST_TEXT[ST_MAIL] = Language.GAMEPREDEF_S[22];
            ST_TEXT[ST_AUCTION] = Language.GAMEPREDEF_S[23];
            ST_TEXT[ST_HANGUP] = Language.GAMEPREDEF_S[24];
            NPC_TYPE_NAME[0] = "";
            NPC_TYPE_NAME[NPC_TYPE_QUEST] = Language.GAMEPREDEF_S[25];
            NPC_TYPE_NAME[NPC_TYPE_SHOP] = Language.GAMEPREDEF_S[26];
            NPC_TYPE_NAME[NPC_TYPE_MAIL] = Language.GAMEPREDEF_S[27];
            NPC_TYPE_NAME[NPC_TYPE_PLAN] = Language.GAMEPREDEF_S[28];
            NPC_TYPE_NAME[NPC_TYPE_AUCTION] = Language.GAMEPREDEF_S[29];
            NPC_TYPE_NAME[NPC_TYPE_SKILL] = Language.GAMEPREDEF_S[30];
            NPC_TYPE_NAME[NPC_TYPE_BANK] = Language.GAMEPREDEF_S[31];
            NPC_TYPE_NAME[NPC_TYPE_HEAL] = Language.GAMEPREDEF_S[32];
            NPC_TYPE_NAME[NPC_TYPE_TRANSPORT] = Language.GAMEPREDEF_S[33];
            NPC_TYPE_NAME[NPC_TYPE_BATTLE] = Language.GAMEPREDEF_S[34];
            NPC_TYPE_NAME[NPC_TYPE_CLASSQUEST] = Language.GAMEPREDEF_S[35];
            NPC_TYPE_NAME[NPC_TYPE_MAT] = Language.GAMEPREDEF_S[36];
            NPC_TYPE_NAME[NPC_TYPE_CALLBOARD] = Language.GAMEPREDEF_S[37];
            NPC_TYPE_NAME[NPC_TYPE_ANSWER] = Language.GAMEPREDEF_S[38];
            NPC_TYPE_NAME[NPC_TYPE_TUTOR] = Language.GAMEPREDEF_S[357];
            QUEST_TYPE_NAME[QUEST_TYPE_NEWHAND] = Language.GAMEPREDEF_S[39];
            QUEST_TYPE_NAME[QUEST_TYPE_MAIN] = Language.GAMEPREDEF_S[40];
            QUEST_TYPE_NAME[QUEST_TYPE_CLASS] = Language.GAMEPREDEF_S[41];
            QUEST_TYPE_NAME[QUEST_TYPE_WORLD] = Language.GAMEPREDEF_S[42];
            QUEST_TYPE_NAME[QUEST_TYPE_BUSINESS] = Language.GAMEPREDEF_S[43];
            QUEST_TYPE_NAME[QUEST_TYPE_ACTIVITY] = Language.GAMEPREDEF_S[44];
            QUEST_TYPE_NAME[QUEST_TYPE_LOOP] = Language.GAMEPREDEF_S[45];
            QUEST_TYPE_NAME[QUEST_TYPE_CHALLENGE] = Language.GAMEPREDEF_S[46];
            QUEST_TYPE_NAME[QUEST_TYPE_CALLBOARD] = Language.GAMEPREDEF_S[47];
            QUEST_TYPE_NAME[QUEST_TYPE_GROWUP] = Language.GAMEPREDEF_S[353];
            QUEST_TYPE_NAME[QUEST_TYPE_GUILD] = Language.GAMEPREDEF_S[366];
            QUEST_TYPE_NAME[QUEST_TYPE_LUCKY] = Language.GAMEPREDEF_S[389];
            QUEST_TYPE_APPR[QUEST_TYPE_NEWHAND] = Language.QUESTGUIDE_S[2];
            QUEST_TYPE_APPR[QUEST_TYPE_MAIN] = Language.QUESTGUIDE_S[3];
            QUEST_TYPE_APPR[QUEST_TYPE_CLASS] = Language.QUESTGUIDE_S[4];
            QUEST_TYPE_APPR[QUEST_TYPE_WORLD] = Language.QUESTGUIDE_S[5];
            QUEST_TYPE_APPR[QUEST_TYPE_ACTIVITY] = Language.QUESTGUIDE_S[6];
            QUEST_TYPE_APPR[QUEST_TYPE_CALLBOARD] = Language.QUESTGUIDE_S[7];
            QUEST_TYPE_APPR[QUEST_TYPE_GROWUP] = Language.QUESTGUIDE_S[8];
            QUEST_TYPE_APPR[QUEST_TYPE_GUILD] = Language.QUESTGUIDE_S[9];
            QUEST_TYPE_APPR[QUEST_TYPE_LUCKY] = Language.QUESTGUIDE_S[10];
            QUEST_SUB_TYPE_APPR[LOOP_TYPE_GUILD] = Language.QUESTGUIDE_S[11];
            QUEST_SUB_TYPE_APPR[LOOP_TYPE_VALENTINE] = Language.QUESTGUIDE_S[12];
            QUEST_SUB_TYPE_APPR[LOOP_TYPE_THIEF] = Language.QUESTGUIDE_S[13];
            QUEST_SUB_TYPE_APPR[LOOP_TYPE_PET] = Language.QUESTGUIDE_S[14];
            QUEST_SUB_TYPE_APPR[LOOP_TYPE_PRACTICE] = Language.QUESTGUIDE_S[15];
            QUEST_SUB_TYPE_APPR[LOOP_TYPE_SPIRITUALITY] = Language.QUESTGUIDE_S[16];
            QUEST_SUB_TYPE_APPR[LOOP_TYPE_SPIRIT_FESTIVAL] = Language.QUESTGUIDE_S[17];
            QUEST_SUB_TYPE_APPR[LOOP_TYPE_TWO_HUNDRED] = Language.QUESTGUIDE_S[18];
            QUEST_SUB_TYPE_APPR[LOOP_TYPE_EVIL] = Language.QUESTGUIDE_S[21];
            RES_URL_FOLDER[RES_URL_WORD1_NONE] = "";
            RES_URL_FOLDER[RES_URL_WORD1_SCENE] = "scene/";
            RES_URL_FOLDER[RES_URL_WORD1_SITEM] = "item/";
            RES_URL_FOLDER[RES_URL_WORD1_ITEM] = "item/";
            RES_URL_FOLDER[RES_URL_WORD1_TILE] = "tile/";
            RES_URL_FOLDER[RES_URL_WORD1_PC] = "creature/";
            RES_URL_FOLDER[RES_URL_WORD1_NPC] = "creature/";
            RES_URL_FOLDER[RES_URL_WORD1_EQUIP] = "equip/";
            RES_URL_FOLDER[RES_URL_WORD1_EFF] = "effect/";
            RES_URL_FOLDER[RES_URL_WORD1_WAV] = "sound/";
            RES_URL_FOLDER[RES_URL_WORD1_BLT] = "bullet/";
            RES_URL_FOLDER[RES_URL_WORD1_EM] = "emotion/";
            RES_URL_FOLDER[RES_URL_WORD1_ST] = "state/";
            RES_URL_FOLDER[RES_URL_WORD1_UI] = "ui/";
            RES_URL_FOLDER[RES_URL_WORD1_SKILL] = "skill/";
            RES_URL_WORD1[RES_URL_WORD1_NONE] = "";
            RES_URL_WORD1[RES_URL_WORD1_SCENE] = "SCENE_";
            RES_URL_WORD1[RES_URL_WORD1_SITEM] = "SITEM_";
            RES_URL_WORD1[RES_URL_WORD1_ITEM] = "ITEM_";
            RES_URL_WORD1[RES_URL_WORD1_TILE] = "TILE_";
            RES_URL_WORD1[RES_URL_WORD1_PC] = "PC_";
            RES_URL_WORD1[RES_URL_WORD1_NPC] = "NPC_";
            RES_URL_WORD1[RES_URL_WORD1_EQUIP] = "EQUIP_";
            RES_URL_WORD1[RES_URL_WORD1_EFF] = "EFF_";
            RES_URL_WORD1[RES_URL_WORD1_WAV] = "WAV_";
            RES_URL_WORD1[RES_URL_WORD1_BLT] = "BLT_";
            RES_URL_WORD1[RES_URL_WORD1_EM] = "EM_";
            RES_URL_WORD1[RES_URL_WORD1_ST] = "ST_";
            RES_URL_WORD1[RES_URL_WORD1_UI] = "UI_";
            RES_URL_WORD1[RES_URL_WORD1_SKILL] = "SKILL_";
            RES_URL_WORD1TOCODE["SCENE"] = RES_URL_WORD1_SCENE;
            RES_URL_WORD1TOCODE["SITEM"] = RES_URL_WORD1_SITEM;
            RES_URL_WORD1TOCODE["ITEM"] = RES_URL_WORD1_ITEM;
            RES_URL_WORD1TOCODE["TILE"] = RES_URL_WORD1_TILE;
            RES_URL_WORD1TOCODE["PC"] = RES_URL_WORD1_PC;
            RES_URL_WORD1TOCODE["NPC"] = RES_URL_WORD1_NPC;
            RES_URL_WORD1TOCODE["EQUIP"] = RES_URL_WORD1_EQUIP;
            RES_URL_WORD1TOCODE["EFF"] = RES_URL_WORD1_EFF;
            RES_URL_WORD1TOCODE["WAV"] = RES_URL_WORD1_WAV;
            RES_URL_WORD1TOCODE["BLT"] = RES_URL_WORD1_BLT;
            RES_URL_WORD1TOCODE["EM"] = RES_URL_WORD1_EM;
            RES_URL_WORD1TOCODE["ST"] = RES_URL_WORD1_ST;
            RES_URL_WORD1TOCODE["UI"] = RES_URL_WORD1_UI;
            RES_URL_WORD1TOCODE["SKILL"] = RES_URL_WORD1_SKILL;
            RES_URL_WORD2[RES_URL_WORD2_NONE] = "";
            RES_URL_WORD2[RES_URL_WORD2_FOLDER] = "FOLDER_";
            RES_URL_WORD2[RES_URL_WORD2_TREE] = "TREE_";
            RES_URL_WORD2[RES_URL_WORD2_FLOWER] = "FLOWER_";
            RES_URL_WORD2[RES_URL_WORD2_HOUSE] = "HOUSE_";
            RES_URL_WORD2[RES_URL_WORD2_SPAWN] = "SPAWN_";
            RES_URL_WORD2[RES_URL_WORD2_DESERT] = "DESERT_";
            RES_URL_WORD2[RES_URL_WORD2_FOREST] = "FOREST_";
            RES_URL_WORD2[RES_URL_WORD2_MALE] = "MALE_";
            RES_URL_WORD2[RES_URL_WORD2_FEMALE] = "FEMALE_";
            RES_URL_WORD2[RES_URL_WORD2_FUNC] = "FUNC_";
            RES_URL_WORD2[RES_URL_WORD2_CRE] = "CRE_";
            RES_URL_WORD2[RES_URL_WORD2_WEAPON] = "WEAPON_";
            RES_URL_WORD2[RES_URL_WORD2_SCENE] = "SCENE_";
            RES_URL_WORD2[RES_URL_WORD2_PLAYER] = "PLAYER_";
            RES_URL_WORD2[RES_URL_WORD2_SIDE] = "SIDE_";
            RES_URL_WORD2[RES_URL_WORD2_SCREEN] = "SCREEN_";
            RES_URL_WORD2[RES_URL_WORD2_NPC] = "NPC_";
            RES_URL_WORD2[RES_URL_WORD2_UI] = "UI_";
            RES_URL_WORD2[RES_URL_WORD2_EFF] = "EFF_";
            RES_URL_WORD2[RES_URL_WORD2_FIRE] = "FIRE_";
            RES_URL_WORD2[RES_URL_WORD2_NORMAL] = "NORMAL_";
            RES_URL_WORD2[RES_URL_WORD2_LOCAL] = "LOCAL_";
            RES_URL_WORD2[RES_URL_WORD2_GLOBAL] = "GLOBAL_";
            RES_URL_WORD2[RES_URL_WORD2_STAGE] = "STAGE_";
            RES_URL_WORD2[RES_URL_WORD2_BATTLE] = "BATTLE_";
            RES_URL_WORD2[RES_URL_WORD2_LOADING] = "LOADING_";
            RES_URL_WORD2[RES_URL_WORD2_FLY] = "FLY_";
            RES_URL_WORD2[RES_URL_WORD2_WING] = "WING_";
            RES_URL_WORD2[RES_URL_WORD2_FC1] = "FC1_";
            RES_URL_WORD2[RES_URL_WORD2_FC2] = "FC2_";
            RES_URL_WORD2[RES_URL_WORD2_FC3] = "FC3_";
            RES_URL_WORD2[RES_URL_WORD2_FC4] = "FC4_";
            RES_URL_WORD2[RES_URL_WORD2_FC5] = "FC5_";
            RES_URL_WORD2[RES_URL_WORD2_FC6] = "FC6_";
            RES_URL_WORD2[RES_URL_WORD2_MC1] = "MC1_";
            RES_URL_WORD2[RES_URL_WORD2_MC2] = "MC2_";
            RES_URL_WORD2[RES_URL_WORD2_MC3] = "MC3_";
            RES_URL_WORD2[RES_URL_WORD2_MC4] = "MC4_";
            RES_URL_WORD2[RES_URL_WORD2_MC5] = "MC5_";
            RES_URL_WORD2[RES_URL_WORD2_MC6] = "MC6_";
            RES_URL_WORD2TOCODE["FOLDER"] = RES_URL_WORD2_FOLDER;
            RES_URL_WORD2TOCODE["FLOWER"] = RES_URL_WORD2_FLOWER;
            RES_URL_WORD2TOCODE["TREE"] = RES_URL_WORD2_TREE;
            RES_URL_WORD2TOCODE["HOUSE"] = RES_URL_WORD2_HOUSE;
            RES_URL_WORD2TOCODE["SPAWN"] = RES_URL_WORD2_SPAWN;
            RES_URL_WORD2TOCODE["DESERT"] = RES_URL_WORD2_DESERT;
            RES_URL_WORD2TOCODE["FOREST"] = RES_URL_WORD2_FOREST;
            RES_URL_WORD2TOCODE["MALE"] = RES_URL_WORD2_MALE;
            RES_URL_WORD2TOCODE["FEMALE"] = RES_URL_WORD2_FEMALE;
            RES_URL_WORD2TOCODE["FUNC"] = RES_URL_WORD2_FUNC;
            RES_URL_WORD2TOCODE["CRE"] = RES_URL_WORD2_CRE;
            RES_URL_WORD2TOCODE["WEAPON"] = RES_URL_WORD2_WEAPON;
            RES_URL_WORD2TOCODE["SCENE"] = RES_URL_WORD2_SCENE;
            RES_URL_WORD2TOCODE["PLAYER"] = RES_URL_WORD2_PLAYER;
            RES_URL_WORD2TOCODE["SIDE"] = RES_URL_WORD2_SIDE;
            RES_URL_WORD2TOCODE["SCREEN"] = RES_URL_WORD2_SCREEN;
            RES_URL_WORD2TOCODE["NPC"] = RES_URL_WORD2_NPC;
            RES_URL_WORD2TOCODE["UI"] = RES_URL_WORD2_UI;
            RES_URL_WORD2TOCODE["EFF"] = RES_URL_WORD2_EFF;
            RES_URL_WORD2TOCODE["FIRE"] = RES_URL_WORD2_FIRE;
            RES_URL_WORD2TOCODE["NORMAL"] = RES_URL_WORD2_NORMAL;
            RES_URL_WORD2TOCODE["LOCAL"] = RES_URL_WORD2_LOCAL;
            RES_URL_WORD2TOCODE["GLOBAL"] = RES_URL_WORD2_GLOBAL;
            RES_URL_WORD2TOCODE["STAGE"] = RES_URL_WORD2_STAGE;
            RES_URL_WORD2TOCODE["BATTLE"] = RES_URL_WORD2_BATTLE;
            RES_URL_WORD2TOCODE["LOADING"] = RES_URL_WORD2_LOADING;
            RES_URL_WORD2TOCODE["FC1"] = RES_URL_WORD2_FC1;
            RES_URL_WORD2TOCODE["FC2"] = RES_URL_WORD2_FC2;
            RES_URL_WORD2TOCODE["FC3"] = RES_URL_WORD2_FC3;
            RES_URL_WORD2TOCODE["FC4"] = RES_URL_WORD2_FC4;
            RES_URL_WORD2TOCODE["FC5"] = RES_URL_WORD2_FC5;
            RES_URL_WORD2TOCODE["FC6"] = RES_URL_WORD2_FC6;
            RES_URL_WORD2TOCODE["MC1"] = RES_URL_WORD2_MC1;
            RES_URL_WORD2TOCODE["MC2"] = RES_URL_WORD2_MC2;
            RES_URL_WORD2TOCODE["MC3"] = RES_URL_WORD2_MC3;
            RES_URL_WORD2TOCODE["MC4"] = RES_URL_WORD2_MC4;
            RES_URL_WORD2TOCODE["MC5"] = RES_URL_WORD2_MC5;
            RES_URL_WORD2TOCODE["MC6"] = RES_URL_WORD2_MC6;
            RES_URL_EXT[RES_URL_EXT_NONE] = "";
            RES_URL_EXT[RES_URL_EXT_SWF] = ".swf";
            RES_URL_EXT[RES_URL_EXT_JPG] = ".jpg";
            RES_URL_EXT[RES_URL_EXT_PNG] = ".png";
            RES_URL_EXT[RES_URL_EXT_WAV] = ".wav";
            RES_URL_EXT[RES_URL_EXT_MP3] = ".mp3";
            RES_URL_EXT[RES_URL_EXT_OGG] = ".ogg";
            RES_URL_EXTTOCODE["swf"] = RES_URL_EXT_SWF;
            RES_URL_EXTTOCODE["jpg"] = RES_URL_EXT_JPG;
            RES_URL_EXTTOCODE["png"] = RES_URL_EXT_PNG;
            RES_URL_EXTTOCODE["wav"] = RES_URL_EXT_WAV;
            RES_URL_EXTTOCODE["mp3"] = RES_URL_EXT_MP3;
            RES_URL_EXTTOCODE["ogg"] = RES_URL_EXT_OGG;
            TBL_INDEX_ARRAY[TBL_ACCOUNT] = "email";
            TBL_INDEX_ARRAY[TBL_AUCTION] = "ownerId";
            TBL_INDEX_ARRAY[TBL_CHARACTOR] = "guid";
            TBL_INDEX_ARRAY[TBL_CHARACTOR_BUFF] = "cid";
            TBL_INDEX_ARRAY[TBL_CHARACTOR_INTERFACE] = "cid";
            TBL_INDEX_ARRAY[TBL_CHARACTOR_MAP] = "cid";
            TBL_INDEX_ARRAY[TBL_CHARACTOR_PLAN_TYPE] = "cid";
            TBL_INDEX_ARRAY[TBL_CHARACTOR_QUEST] = "cid";
            TBL_INDEX_ARRAY[TBL_CHARACTOR_SKILL] = "cid";
            TBL_INDEX_ARRAY[TBL_CHARACTOR_SLOT] = "cid";
            TBL_INDEX_ARRAY[TBL_CHARACTOR_TITLE] = "cid";
            TBL_INDEX_ARRAY[TBL_CLASS] = null;
            TBL_INDEX_ARRAY[TBL_CREATURE] = "classId";
            TBL_INDEX_ARRAY[TBL_CREATURE_LOOT] = "cid";
            TBL_INDEX_ARRAY[TBL_CREATURE_SKILL] = "cid";
            TBL_INDEX_ARRAY[TBL_CRE_POINT] = null;
            TBL_INDEX_ARRAY[TBL_ELEMENT_TEMPLATE] = null;
            TBL_INDEX_ARRAY[TBL_ELEMENT_JEWEL] = "eid";
            TBL_INDEX_ARRAY[TBL_EQUIPT_INSTANCE] = null;
            TBL_INDEX_ARRAY[TBL_EQUIPT_TEMPLATE] = "type";
            TBL_INDEX_ARRAY[TBL_EQUIPT_JEWEL] = "eid";
            TBL_INDEX_ARRAY[TBL_EQUIPT_TYPE] = null;
            TBL_INDEX_ARRAY[TBL_FEEDBACK] = "guid";
            TBL_INDEX_ARRAY[TBL_GUILD] = "cid";
            TBL_INDEX_ARRAY[TBL_GUILD_MAP] = "gid";
            TBL_INDEX_ARRAY[TBL_GUILD_MEMBER] = "gid";
            TBL_INDEX_ARRAY[TBL_GUILD_RANK] = "gid";
            TBL_INDEX_ARRAY[TBL_GUILD_SLOT] = "gid";
            TBL_INDEX_ARRAY[TBL_ITEM_INSTANCE] = null;
            TBL_INDEX_ARRAY[TBL_ITEM_TEMPLATE] = "name";
            TBL_INDEX_ARRAY[TBL_JEWEL_INSTANCE] = null;
            TBL_INDEX_ARRAY[TBL_JEWEL_TEMPLATE] = null;
            TBL_INDEX_ARRAY[TBL_MAIL] = "receiverId";
            TBL_INDEX_ARRAY[TBL_MAP] = "safeFlag";
            TBL_INDEX_ARRAY[TBL_MAP_CREATURE] = "mid";
            TBL_INDEX_ARRAY[TBL_NPC] = "posMapId";
            TBL_INDEX_ARRAY[TBL_NPC_CREATURE] = "nid";
            TBL_INDEX_ARRAY[TBL_NPC_QUEST] = "nid";
            TBL_INDEX_ARRAY[TBL_NPC_SKILL] = "nid";
            TBL_INDEX_ARRAY[TBL_PET] = "cid";
            TBL_INDEX_ARRAY[TBL_PET_SKILL] = "pid";
            TBL_INDEX_ARRAY[TBL_PET_SLOT] = "pid";
            TBL_INDEX_ARRAY[TBL_PLAN] = "st";
            TBL_INDEX_ARRAY[TBL_PLAN_AWARD] = "pid";
            TBL_INDEX_ARRAY[TBL_PLAN_REQUIRE] = "pid";
            TBL_INDEX_ARRAY[TBL_QUEST] = "subType";
            TBL_INDEX_ARRAY[TBL_QUEST_AWARD] = "qid";
            TBL_INDEX_ARRAY[TBL_QUEST_REQUIRE] = "qid";
            TBL_INDEX_ARRAY[TBL_RELATIONSHIP] = "selfId";
            TBL_INDEX_ARRAY[TBL_SCENEITEM_INSTANCE] = "posMapId";
            TBL_INDEX_ARRAY[TBL_SCENEITEM_TEMPLATE] = null;
            TBL_INDEX_ARRAY[TBL_SHOP_SLOT] = "sid";
            TBL_INDEX_ARRAY[TBL_SKILL] = "codeName";
            TBL_INDEX_ARRAY[TBL_SHOP] = "name";
            TBL_INDEX_ARRAY[TBL_SKILL_KIND] = "sid";
            TBL_INDEX_ARRAY[TBL_SKILL_POOL] = "pi";
            TBL_INDEX_ARRAY[TBL_SKILL_TYPE] = "sid";
            TBL_INDEX_ARRAY[TBL_QUEST_LOOP] = "nid";
            TBL_INDEX_ARRAY[TBL_TITLE] = "k";
            TBL_INDEX_ARRAY[TBL_MAP_CELL] = "mid";
            TBL_INDEX_ARRAY[TBL_ANSWER] = null;
            TBL_INDEX_ARRAY[TBL_PLAN_KIND] = null;
            TBL_INDEX_ARRAY[TBL_NPC_PLAN] = "npcId";
            TBL_INDEX_ARRAY[TBL_QUEST_PRE] = "qid";
            TBL_INDEX_ARRAY[TBL_CHARACTOR_QUEST_KILL] = "cid";
            TBL_INDEX_ARRAY[TBL_BUFF] = null;
            TBL_INDEX_ARRAY[TBL_BUILDING] = "type";
            TBL_INDEX_ARRAY[TBL_ACHIEVEMENT] = "kind";
            TBL_INDEX_ARRAY[TBL_ACHIEVEMENT_REQUIRE] = "aid";
            TBL_INDEX_ARRAY[TBL_GUIDE] = "type";
            TBL_INDEX_ARRAY[TBL_NAME_LIB] = "type";
            TBL_INDEX_ARRAY[TBL_DIARY] = null;
            TBL_INDEX_ARRAY[TBL_STARS_TEMPLATE] = "type";
            TBL_INDEX_ARRAY[TBL_WAR_MAP] = "type";
            TBL_INDEX_ARRAY[TBL_PET_SOUL] = "name";
            TBL_INDEX_ARRAY[TBL_MOUNT] = "type";
            TBL_INDEX_ARRAY[TBL_MOUNT_DRESS] = "type";
            TBL_INDEX_ARRAY[TBL_MEDAL] = "basicTid";
            TBL_INDEX_ARRAY[TBL_CREATURE_HANDBOOK] = "classId";
            TBL_INDEX_ARRAY[TBL_PET_TALENT] = "basicTid";
            TBL_INDEX_ARRAY[TBL_ARTIFACT] = "tid";
            TBL_INDEX_ARRAY[TBL_CREDIT] = "shopId";
            TBL_INDEX_ARRAY[TBL_MYSTRE] = "kind";
            TBL_INDEX_ARRAY[TBL_MYSTRE_RECIPE] = "level";
            TBL_INDEX_ARRAY[TBL_DECO_RUNE] = "canExchange";
            TBL_INDEX_ARRAY[TBL_CREATUREH_COMBINE] = "disPlay";
            TBL_INDEX_ARRAY[TBL_PET_GUARD] = "sid";
            TBL_INDEX_ARRAY[TBL_MYTC_DETAIL] = "tid";
            TBL_INDEX_ARRAY2[TBL_ACCOUNT] = null;
            TBL_INDEX_ARRAY2[TBL_AUCTION] = "itemKind";
            TBL_INDEX_ARRAY2[TBL_CHARACTOR] = "name";
            TBL_INDEX_ARRAY2[TBL_CHARACTOR_BUFF] = null;
            TBL_INDEX_ARRAY2[TBL_CHARACTOR_INTERFACE] = null;
            TBL_INDEX_ARRAY2[TBL_CHARACTOR_MAP] = null;
            TBL_INDEX_ARRAY2[TBL_CHARACTOR_PLAN_TYPE] = null;
            TBL_INDEX_ARRAY2[TBL_CHARACTOR_QUEST] = null;
            TBL_INDEX_ARRAY2[TBL_CHARACTOR_SKILL] = null;
            TBL_INDEX_ARRAY2[TBL_CHARACTOR_SLOT] = null;
            TBL_INDEX_ARRAY2[TBL_CHARACTOR_TITLE] = null;
            TBL_INDEX_ARRAY2[TBL_CLASS] = null;
            TBL_INDEX_ARRAY2[TBL_CREATURE] = null;
            TBL_INDEX_ARRAY2[TBL_CREATURE_LOOT] = null;
            TBL_INDEX_ARRAY2[TBL_CREATURE_SKILL] = null;
            TBL_INDEX_ARRAY2[TBL_CRE_POINT] = null;
            TBL_INDEX_ARRAY2[TBL_ELEMENT_TEMPLATE] = null;
            TBL_INDEX_ARRAY2[TBL_ELEMENT_JEWEL] = null;
            TBL_INDEX_ARRAY2[TBL_EQUIPT_INSTANCE] = null;
            TBL_INDEX_ARRAY2[TBL_EQUIPT_TEMPLATE] = null;
            TBL_INDEX_ARRAY2[TBL_EQUIPT_JEWEL] = null;
            TBL_INDEX_ARRAY2[TBL_EQUIPT_TYPE] = null;
            TBL_INDEX_ARRAY2[TBL_FEEDBACK] = null;
            TBL_INDEX_ARRAY2[TBL_GUILD] = null;
            TBL_INDEX_ARRAY2[TBL_GUILD_MAP] = null;
            TBL_INDEX_ARRAY2[TBL_GUILD_MEMBER] = "cid";
            TBL_INDEX_ARRAY2[TBL_GUILD_RANK] = null;
            TBL_INDEX_ARRAY2[TBL_GUILD_SLOT] = null;
            TBL_INDEX_ARRAY2[TBL_ITEM_INSTANCE] = null;
            TBL_INDEX_ARRAY2[TBL_ITEM_TEMPLATE] = null;
            TBL_INDEX_ARRAY2[TBL_JEWEL_INSTANCE] = null;
            TBL_INDEX_ARRAY2[TBL_JEWEL_TEMPLATE] = null;
            TBL_INDEX_ARRAY2[TBL_MAIL] = null;
            TBL_INDEX_ARRAY2[TBL_MAP] = null;
            TBL_INDEX_ARRAY2[TBL_MAP_CREATURE] = null;
            TBL_INDEX_ARRAY2[TBL_NPC] = "name";
            TBL_INDEX_ARRAY2[TBL_NPC_CREATURE] = null;
            TBL_INDEX_ARRAY2[TBL_NPC_QUEST] = null;
            TBL_INDEX_ARRAY2[TBL_NPC_SKILL] = null;
            TBL_INDEX_ARRAY2[TBL_PET] = null;
            TBL_INDEX_ARRAY2[TBL_PET_SKILL] = null;
            TBL_INDEX_ARRAY2[TBL_PET_SLOT] = null;
            TBL_INDEX_ARRAY2[TBL_PLAN] = null;
            TBL_INDEX_ARRAY2[TBL_PLAN_AWARD] = null;
            TBL_INDEX_ARRAY2[TBL_PLAN_REQUIRE] = null;
            TBL_INDEX_ARRAY2[TBL_QUEST] = "startNpc";
            TBL_INDEX_ARRAY2[TBL_QUEST_AWARD] = null;
            TBL_INDEX_ARRAY2[TBL_QUEST_REQUIRE] = null;
            TBL_INDEX_ARRAY2[TBL_RELATIONSHIP] = "otherId";
            TBL_INDEX_ARRAY2[TBL_SCENEITEM_INSTANCE] = "ownerId";
            TBL_INDEX_ARRAY2[TBL_SCENEITEM_TEMPLATE] = null;
            TBL_INDEX_ARRAY2[TBL_SHOP_SLOT] = "st";
            TBL_INDEX_ARRAY2[TBL_SKILL] = "reqClass";
            TBL_INDEX_ARRAY2[TBL_SHOP] = null;
            TBL_INDEX_ARRAY2[TBL_SKILL_KIND] = null;
            TBL_INDEX_ARRAY2[TBL_SKILL_POOL] = null;
            TBL_INDEX_ARRAY2[TBL_SKILL_TYPE] = null;
            TBL_INDEX_ARRAY2[TBL_QUEST_LOOP] = null;
            TBL_INDEX_ARRAY2[TBL_TITLE] = null;
            TBL_INDEX_ARRAY2[TBL_MAP_CELL] = null;
            TBL_INDEX_ARRAY2[TBL_ANSWER] = null;
            TBL_INDEX_ARRAY2[TBL_PLAN_KIND] = null;
            TBL_INDEX_ARRAY2[TBL_NPC_PLAN] = null;
            TBL_INDEX_ARRAY2[TBL_QUEST_PRE] = "itemId";
            TBL_INDEX_ARRAY2[TBL_CHARACTOR_QUEST_KILL] = "charactorQuestId";
            TBL_INDEX_ARRAY2[TBL_BUFF] = null;
            TBL_INDEX_ARRAY2[TBL_BUILDING] = "codeName";
            TBL_INDEX_ARRAY2[TBL_ACHIEVEMENT] = "type";
            TBL_INDEX_ARRAY2[TBL_DIARY] = null;
            TBL_INDEX_ARRAY2[TBL_STARS_TEMPLATE] = "level";
            TBL_INDEX_ARRAY2[TBL_WAR_MAP] = null;
            TBL_INDEX_ARRAY2[TBL_PET_SOUL] = "type";
            TBL_INDEX_ARRAY2[TBL_MEDAL] = "sid";
            TBL_INDEX_ARRAY2[TBL_CREATURE_HANDBOOK] = "id";
            TBL_INDEX_ARRAY2[TBL_PET_TALENT] = "sid";
            TBL_INDEX_ARRAY3[TBL_ACCOUNT] = null;
            TBL_INDEX_ARRAY3[TBL_AUCTION] = "itemType";
            TBL_INDEX_ARRAY3[TBL_CHARACTOR] = "ti";
            TBL_INDEX_ARRAY3[TBL_CHARACTOR_BUFF] = null;
            TBL_INDEX_ARRAY3[TBL_CHARACTOR_INTERFACE] = null;
            TBL_INDEX_ARRAY3[TBL_CHARACTOR_MAP] = null;
            TBL_INDEX_ARRAY3[TBL_CHARACTOR_PLAN_TYPE] = null;
            TBL_INDEX_ARRAY3[TBL_CHARACTOR_QUEST] = null;
            TBL_INDEX_ARRAY3[TBL_CHARACTOR_SKILL] = null;
            TBL_INDEX_ARRAY3[TBL_CHARACTOR_SLOT] = null;
            TBL_INDEX_ARRAY3[TBL_CHARACTOR_TITLE] = null;
            TBL_INDEX_ARRAY3[TBL_CLASS] = null;
            TBL_INDEX_ARRAY3[TBL_CREATURE] = null;
            TBL_INDEX_ARRAY3[TBL_CREATURE_LOOT] = null;
            TBL_INDEX_ARRAY3[TBL_CREATURE_SKILL] = null;
            TBL_INDEX_ARRAY3[TBL_CRE_POINT] = null;
            TBL_INDEX_ARRAY3[TBL_ELEMENT_TEMPLATE] = null;
            TBL_INDEX_ARRAY3[TBL_ELEMENT_JEWEL] = null;
            TBL_INDEX_ARRAY3[TBL_EQUIPT_INSTANCE] = null;
            TBL_INDEX_ARRAY3[TBL_EQUIPT_TEMPLATE] = null;
            TBL_INDEX_ARRAY3[TBL_EQUIPT_JEWEL] = null;
            TBL_INDEX_ARRAY3[TBL_EQUIPT_TYPE] = null;
            TBL_INDEX_ARRAY3[TBL_FEEDBACK] = null;
            TBL_INDEX_ARRAY3[TBL_GUILD] = null;
            TBL_INDEX_ARRAY3[TBL_GUILD_MAP] = null;
            TBL_INDEX_ARRAY3[TBL_GUILD_MEMBER] = null;
            TBL_INDEX_ARRAY3[TBL_GUILD_RANK] = null;
            TBL_INDEX_ARRAY3[TBL_GUILD_SLOT] = null;
            TBL_INDEX_ARRAY3[TBL_ITEM_INSTANCE] = null;
            TBL_INDEX_ARRAY3[TBL_ITEM_TEMPLATE] = "type";
            TBL_INDEX_ARRAY3[TBL_JEWEL_INSTANCE] = null;
            TBL_INDEX_ARRAY3[TBL_JEWEL_TEMPLATE] = null;
            TBL_INDEX_ARRAY3[TBL_MAIL] = null;
            TBL_INDEX_ARRAY3[TBL_MAP] = null;
            TBL_INDEX_ARRAY3[TBL_MAP_CREATURE] = null;
            TBL_INDEX_ARRAY3[TBL_NPC] = "classId";
            TBL_INDEX_ARRAY3[TBL_NPC_CREATURE] = null;
            TBL_INDEX_ARRAY3[TBL_NPC_QUEST] = null;
            TBL_INDEX_ARRAY3[TBL_NPC_SKILL] = null;
            TBL_INDEX_ARRAY3[TBL_PET] = null;
            TBL_INDEX_ARRAY3[TBL_PET_SKILL] = null;
            TBL_INDEX_ARRAY3[TBL_PET_SLOT] = null;
            TBL_INDEX_ARRAY3[TBL_PLAN] = null;
            TBL_INDEX_ARRAY3[TBL_PLAN_AWARD] = null;
            TBL_INDEX_ARRAY3[TBL_PLAN_REQUIRE] = null;
            TBL_INDEX_ARRAY3[TBL_WAR_MAP] = null;
            TBL_INDEX_ARRAY3[TBL_QUEST] = "type";
            TBL_INDEX_ARRAY3[TBL_QUEST_AWARD] = null;
            TBL_INDEX_ARRAY3[TBL_QUEST_REQUIRE] = null;
            TBL_INDEX_ARRAY3[TBL_RELATIONSHIP] = null;
            TBL_INDEX_ARRAY3[TBL_SCENEITEM_INSTANCE] = null;
            TBL_INDEX_ARRAY3[TBL_SCENEITEM_TEMPLATE] = null;
            TBL_INDEX_ARRAY3[TBL_SHOP_SLOT] = null;
            TBL_INDEX_ARRAY3[TBL_SKILL] = "useEnv";
            TBL_INDEX_ARRAY3[TBL_SHOP] = null;
            TBL_INDEX_ARRAY3[TBL_SKILL_KIND] = null;
            TBL_INDEX_ARRAY3[TBL_SKILL_POOL] = null;
            TBL_INDEX_ARRAY3[TBL_SKILL_TYPE] = null;
            TBL_INDEX_ARRAY3[TBL_QUEST_LOOP] = null;
            TBL_INDEX_ARRAY3[TBL_TITLE] = null;
            TBL_INDEX_ARRAY3[TBL_MAP_CELL] = null;
            TBL_INDEX_ARRAY3[TBL_ANSWER] = null;
            TBL_INDEX_ARRAY3[TBL_PLAN_KIND] = null;
            TBL_INDEX_ARRAY3[TBL_NPC_PLAN] = null;
            TBL_INDEX_ARRAY3[TBL_QUEST_PRE] = null;
            TBL_INDEX_ARRAY3[TBL_CHARACTOR_QUEST_KILL] = null;
            TBL_INDEX_ARRAY3[TBL_BUFF] = null;
            TBL_INDEX_ARRAY3[TBL_DIARY] = null;
            TBL_INDEX_ARRAY3[TBL_STARS_TEMPLATE] = null;
            TBL_INDEX_ARRAY3[TBL_CREATURE_HANDBOOK] = "relateId";
            LINK_TYPE_ARRAY[TBL_NPC] = "N";
            LINK_TYPE_ARRAY[TBL_SKILL] = "SK";
            LINK_TYPE_ARRAY[TBL_PET] = "PET";
            LINK_TYPE_ARRAY[TBL_SCENEITEM_INSTANCE] = "SC";
            LINK_TYPE_ARRAY[TBL_SCENEITEM_TEMPLATE] = "SCT";
            LINK_TYPE_ARRAY[TBL_EQUIPT_INSTANCE] = "EQ";
            LINK_TYPE_ARRAY[TBL_EQUIPT_TEMPLATE] = "EQT";
            LINK_TYPE_ARRAY[TBL_ITEM_INSTANCE] = "IT";
            LINK_TYPE_ARRAY[TBL_ITEM_TEMPLATE] = "ITT";
            LINK_TYPE_ARRAY[TBL_JEWEL_INSTANCE] = "JE";
            LINK_TYPE_ARRAY[TBL_JEWEL_TEMPLATE] = "JET";
            LINK_TYPE_ARRAY[TBL_CRE_POINT] = "EL";
            LINK_TYPE_ARRAY[TBL_ELEMENT_TEMPLATE] = "ELT";
            LINK_TYPE_ARRAY[TBL_CHARACTOR] = "PID";
            LINK_TYPE_ARRAY[TBL_CREATURE] = "M";
            LINK_TYPE_ARRAY[TBL_QUEST] = "Q";
            LINK_TYPE_ARRAY[TBL_MAP] = "MA";
            LINK_TYPE_ARRAY[TBL_PET_SOUL] = "SOUL";
            LINK_TYPE_ARRAY[TBL_MEDAL] = "MEDAL";
            LINK_TYPE_ARRAY[TBL_PET_TALENT] = "TALENT";
            LINK_TYPE_ARRAY[1000] = "PLAYER";
            LINK_TYPE_ARRAY[1001] = "ME";
            LINK_TYPE_ARRAY[1002] = "C";
            LINK_TYPE_ARRAY[1003] = "P";
            LINK_TYPE_ARRAY[1004] = "QO";
            LINK_TYPE_ARRAY[TBL_POS] = "POS";
            LINK_TYPE_ARRAY[TBL_ACHIEVEMENT] = "ACH";
            LINK_TYPE_ARRAY[1005] = "ACTIVITY";
            LINK_TYPE_ARRAY[1006] = "HELP";
            LINK_TYPE_ARRAY[1007] = "MARRIAGE";
            LINK_TYPE_ARRAY[1008] = "PETFIGHT";
            LINK_TYPE_ARRAY[1009] = "PFMORE";
            LINK_TYPE_ARRAY[TOOLTIP_EVENT] = "ET";
            LINK_TYPE_ARRAY[TOOLTIP_TITLE] = "TITLE";
            LINK_TYPE_ARRAY[TBL_RECIPE] = "RECIPE";
            LINK_TYPE_ARRAY["Hongbao"] = "HB";
            CURRENCY_TIP[0] = Language.GAMEPREDEF_S[48];
            CURRENCY_TIP[1] = Language.GAMEPREDEF_S[49];
            CURRENCY_TIP[2] = Language.GAMEPREDEF_S[50];
            CURRENCY_TIP[3] = Language.GAMEPREDEF_S[51];
            CURRENCY_TIP[4] = Language.GAMEPREDEF_S[52];
            CURRENCY_TIP[5] = Language.GAMEPREDEF_S[53];
            CURRENCY_TIP[6] = Language.GAMEPREDEF_S[54];
            CURRENCY_TIP[7] = Language.GAMEPREDEF_S[55];
            CURRENCY_TIP[8] = Language.GAMEPREDEF_S[56];
            CURRENCY_TIP[9] = Language.GAMEPREDEF_S[57];
            CURRENCY_TIP[10] = Language.GAMEPREDEF_S[356];
            CURRENCY_TIP[11] = Language.GAMEPREDEF_S[361];
            CURRENCY_TIP[12] = Language.GAMEPREDEF_S[362];
            CURRENCY_TIP[13] = Language.GAMEPREDEF_S[410];
            CURRENCY_TIP[14] = Language.GAMEPREDEF_S[411];
            CURRENCY_TIP[15] = Language.GAMEPREDEF_S[420];
            CURRENCY_TIP[16] = Language.GAMEPREDEF_S[421];
            CURRENCY_TIP[17] = Language.GAMEPREDEF_S[422];
            CURRENCY_TIP[18] = Language.GAMEPREDEF_S[455];
            CURRENCY_TIP[19] = Language.GAMEPREDEF_S[456];
            CURRENCY_TIP[20] = Language.GAMEPREDEF_S[460];
            CURRENCY_TIP[21] = Language.GAMEPREDEF_S[464];
            CURRENCY_TIP[22] = Language.GAMEPREDEF_S[465];
            CURRENCY_TIP[23] = Language.GAMEPREDEF_S[466];
            CURRENCY_TIP[24] = Language.GAMEPREDEF_S[498];
            CURRENCY_TIP[25] = Language.GAMEPREDEF_S[503];
            CURRENCY_TIP[26] = Language.GAMEPREDEF_S[504];
            CURRENCY_TIP[27] = Language.GAMEPREDEF_S[505];
            CURRENCY_TIP[28] = Language.GAMEPREDEF_S[506];
            CURRENCY_TIP[29] = Language.GAMEPREDEF_S[507];
            CURRENCY_TIP[30] = Language.GAMEPREDEF_S[509];
            CURRENCY_TIP[31] = Language.GAMEPREDEF_S[543];
            CURRENCY_TIP[32] = Language.GAMEPREDEF_S[555];
            CURRENCY_TIP[33] = Language.GAMEPREDEF_S[556];
            CURRENCY_TIP[34] = Language.GAMEPREDEF_S[559];
            CURRENCY_TIP[35] = Language.GAMEPREDEF_S[561];
            CURRENCY_TIP[36] = Language.GAMEPREDEF_S[576];
            CURRENCY_TIP[37] = Language.GAMEPREDEF_S[577];
            CURRENCY_TIP[38] = Language.GAMEPREDEF_S[581];
            CURRENCY_TIP[39] = Language.GAMEPREDEF_S[582];
            CURRENCY_TIP[40] = Language.GAMEPREDEF_S[583];
            CURRENCY_TIP[41] = Language.GAMEPREDEF_S[585];
            CURRENCY_TIP[42] = Language.GAMEPREDEF_S[586];
            CURRENCY_TIP[43] = Language.GAMEPREDEF_S[587];
            CURRENCY_TIP[44] = Language.GAMEPREDEF_S[592];
            CURRENCY_TIP[45] = Language.GAMEPREDEF_S[593];
            CURRENCY_TIP[46] = Language.GAMEPREDEF_S[594];
            CURRENCY_TIP[47] = Language.GAMEPREDEF_S[595];
            CURRENCY_TIP[48] = Language.GAMEPREDEF_S[596];
            CURRENCY_TIP[58] = Language.GAMEPREDEF_S[599];
            CURRENCY_TIP[60] = Language.GAMEPREDEF_S[600];
            CURRENCY_TIP[49] = Language.GAMEPREDEF_S[601];
            CURRENCY_TIP[61] = Language.GAMEPREDEF_S[602];
            CURRENCY_TIP[62] = Language.GAMEPREDEF_S[603];
            CURRENCY_TIP[64] = Language.GAMEPREDEF_S[604];
            CURRENCY_TIP[65] = Language.GAMEPREDEF_S[605];
            CURRENCY_TIP[66] = Language.GAMEPREDEF_S[606];
            CURRENCY_TIP[69] = Language.SYSTEMSHOPPANEL_U[9];
            CURRENCY_TIP[70] = Language.SYSTEMSHOPPANEL_U[9];
            CURRENCY_TIP[71] = Language.SYSTEMSHOPPANEL_U[9];
            SYS_MSG[SYS_MSG_NO_ENOUGH_MONEY] = Language.GAMEPREDEF_S[58];
            SYS_MSG[SYS_MSG_NO_ENOUGH_EXPSKILL] = Language.GAMEPREDEF_S[59];
            SYS_MSG[SYS_MSG_NO_ENOUGH_GOLD] = Language.GAMEPREDEF_S[60];
            SYS_MSG[SYS_MSG_NO_GUILD] = Language.GAMEPREDEF_S[61];
            SYS_MSG[SYS_MSG_SPECIAL_CLASSQUEST] = Language.GAMEPREDEF_S[62];
            SYS_MSG[SYS_MSG_SPECIAL_REPAIR] = Language.GAMEPREDEF_S[63];
            SYS_MSG[SYS_MSG_NO_ENOUGH_DEX] = Language.GAMEPREDEF_S[392];
            CLASS_LEVEL[0] = Language.GAMEPREDEF_S[82];
            CLASS_LEVEL[1] = Language.GAMEPREDEF_S[83];
            CLASS_LEVEL[2] = Language.GAMEPREDEF_S[84];
            CLASS_LEVEL[3] = Language.GAMEPREDEF_S[85];
            CLASS_LEVEL[4] = Language.GAMEPREDEF_S[86];
            CLASS_LEVEL[5] = Language.GAMEPREDEF_S[87];
            CLASS_LEVEL[10] = Language.GAMEPREDEF_S[560];
            PLAYER_LEVEL_EXP[0] = 1;
            PLAYER_LEVEL_EXP[1] = 73;
            PLAYER_LEVEL_EXP[2] = 358;
            PLAYER_LEVEL_EXP[3] = 926;
            PLAYER_LEVEL_EXP[4] = 1775;
            PLAYER_LEVEL_EXP[5] = 3162;
            PLAYER_LEVEL_EXP[6] = 5360;
            PLAYER_LEVEL_EXP[7] = 8649;
            PLAYER_LEVEL_EXP[8] = 13232;
            PLAYER_LEVEL_EXP[9] = 18510;
            PLAYER_LEVEL_EXP[10] = 25771;
            PLAYER_LEVEL_EXP[11] = 38644;
            PLAYER_LEVEL_EXP[12] = 62425;
            PLAYER_LEVEL_EXP[13] = 98030;
            PLAYER_LEVEL_EXP[14] = 139609;
            PLAYER_LEVEL_EXP[15] = 187700;
            PLAYER_LEVEL_EXP[16] = 242854;
            PLAYER_LEVEL_EXP[17] = 305634;
            PLAYER_LEVEL_EXP[18] = 376620;
            PLAYER_LEVEL_EXP[19] = 456403;
            PLAYER_LEVEL_EXP[20] = 545587;
            PLAYER_LEVEL_EXP[21] = 717011;
            PLAYER_LEVEL_EXP[22] = 906836;
            PLAYER_LEVEL_EXP[23] = 1116173;
            PLAYER_LEVEL_EXP[24] = 1346151;
            PLAYER_LEVEL_EXP[25] = 1597921;
            PLAYER_LEVEL_EXP[26] = 1872656;
            PLAYER_LEVEL_EXP[27] = 2171545;
            PLAYER_LEVEL_EXP[28] = 2495799;
            PLAYER_LEVEL_EXP[29] = 2846648;
            PLAYER_LEVEL_EXP[30] = 3225339;
            PLAYER_LEVEL_EXP[31] = 3872914;
            PLAYER_LEVEL_EXP[32] = 4568755;
            PLAYER_LEVEL_EXP[33] = 5314933;
            PLAYER_LEVEL_EXP[34] = 6113546;
            PLAYER_LEVEL_EXP[35] = 6966720;
            PLAYER_LEVEL_EXP[36] = 7876610;
            PLAYER_LEVEL_EXP[37] = 8845396;
            PLAYER_LEVEL_EXP[38] = 9875286;
            PLAYER_LEVEL_EXP[39] = 10968516;
            PLAYER_LEVEL_EXP[40] = 12127346;
            PLAYER_LEVEL_EXP[41] = 13958479;
            PLAYER_LEVEL_EXP[42] = 15894402;
            PLAYER_LEVEL_EXP[43] = 17938602;
            PLAYER_LEVEL_EXP[44] = 20094609;
            PLAYER_LEVEL_EXP[45] = 22365986;
            PLAYER_LEVEL_EXP[46] = 24756337;
            PLAYER_LEVEL_EXP[47] = 27269299;
            PLAYER_LEVEL_EXP[48] = 29908546;
            PLAYER_LEVEL_EXP[49] = 32677789;
            PLAYER_LEVEL_EXP[50] = 35580773;
            PLAYER_LEVEL_EXP[51] = 39909930;
            PLAYER_LEVEL_EXP[52] = 44440326;
            PLAYER_LEVEL_EXP[53] = 49177442;
            PLAYER_LEVEL_EXP[54] = 54126808;
            PLAYER_LEVEL_EXP[55] = 59294002;
            PLAYER_LEVEL_EXP[56] = 64684650;
            PLAYER_LEVEL_EXP[57] = 70304425;
            PLAYER_LEVEL_EXP[58] = 76159046;
            PLAYER_LEVEL_EXP[59] = 82254281;
            PLAYER_LEVEL_EXP[60] = 88595943;
            PLAYER_LEVEL_EXP[61] = 97641138;
            PLAYER_LEVEL_EXP[62] = 107040501;
            PLAYER_LEVEL_EXP[63] = 116802195;
            PLAYER_LEVEL_EXP[64] = 126934442;
            PLAYER_LEVEL_EXP[65] = 137445524;
            PLAYER_LEVEL_EXP[66] = 148343787;
            PLAYER_LEVEL_EXP[67] = 159637634;
            PLAYER_LEVEL_EXP[68] = 171335530;
            PLAYER_LEVEL_EXP[69] = 183445997;
            PLAYER_LEVEL_EXP[70] = 200125583;
            PLAYER_LEVEL_EXP[71] = 217377226;
            PLAYER_LEVEL_EXP[72] = 235212503;
            PLAYER_LEVEL_EXP[73] = 253643068;
            PLAYER_LEVEL_EXP[74] = 272680653;
            PLAYER_LEVEL_EXP[75] = 292337065;
            PLAYER_LEVEL_EXP[76] = 312624185;
            PLAYER_LEVEL_EXP[77] = 333553972;
            PLAYER_LEVEL_EXP[78] = 355138455;
            PLAYER_LEVEL_EXP[79] = 377389742;
            PLAYER_LEVEL_EXP[80] = 400320010;
            PLAYER_LEVEL_EXP[81] = 430987144;
            PLAYER_LEVEL_EXP[82] = 481135878;
            PLAYER_LEVEL_EXP[83] = 544632067;
            PLAYER_LEVEL_EXP[84] = 609975310;
            PLAYER_LEVEL_EXP[85] = 677197405;
            PLAYER_LEVEL_EXP[86] = 746330331;
            PLAYER_LEVEL_EXP[87] = 817406242;
            PLAYER_LEVEL_EXP[88] = 890457474;
            PLAYER_LEVEL_EXP[89] = 965516537;
            PLAYER_LEVEL_EXP[90] = 1119715703;
            PLAYER_LEVEL_EXP[91] = 1311889013;
            PLAYER_LEVEL_EXP[92] = 1509175146;
            PLAYER_LEVEL_EXP[93] = 1711654712;
            PLAYER_LEVEL_EXP[94] = 1919408737;
            PLAYER_LEVEL_EXP[95] = 2132518665;
            PLAYER_LEVEL_EXP[96] = 2351066353;
            PLAYER_LEVEL_EXP[97] = 2575134073;
            PLAYER_LEVEL_EXP[98] = 2804804502;
            PLAYER_LEVEL_EXP[99] = 3040160730;
            PLAYER_LEVEL_EXP[100] = 3281286249;
            PLAYER_LEVEL_EXP[101] = 3643071467;
            PLAYER_LEVEL_EXP[102] = 4137048416;
            PLAYER_LEVEL_EXP[103] = 4642787454;
            PLAYER_LEVEL_EXP[104] = 5160454786;
            PLAYER_LEVEL_EXP[105] = 5690217397;
            PLAYER_LEVEL_EXP[106] = 6232243037;
            PLAYER_LEVEL_EXP[107] = 6786700227;
            PLAYER_LEVEL_EXP[108] = 7353758250;
            PLAYER_LEVEL_EXP[109] = 7933587150;
            PLAYER_LEVEL_EXP[110] = 8526357728;
            PLAYER_LEVEL_EXP[111] = 9219328851;
            PLAYER_LEVEL_EXP[112] = 9927982209;
            PLAYER_LEVEL_EXP[113] = 10652481000;
            PLAYER_LEVEL_EXP[114] = 11392988425;
            PLAYER_LEVEL_EXP[115] = 12149667685;
            PLAYER_LEVEL_EXP[116] = 12922681978;
            PLAYER_LEVEL_EXP[117] = 13712194506;
            PLAYER_LEVEL_EXP[118] = 14518368467;
            PLAYER_LEVEL_EXP[119] = 15341367063;
            PLAYER_LEVEL_EXP[120] = 16181353493;
            PLAYER_LEVEL_EXP[121] = 17360652416;
            PLAYER_LEVEL_EXP[122] = 18564504541;
            PLAYER_LEVEL_EXP[123] = 19793145487;
            PLAYER_LEVEL_EXP[124] = 21160780456;
            PLAYER_LEVEL_EXP[125] = 22555971857;
            PLAYER_LEVEL_EXP[126] = 23978976728;
            PLAYER_LEVEL_EXP[127] = 25550975059;
            PLAYER_LEVEL_EXP[128] = 27153661571;
            PLAYER_LEVEL_EXP[129] = 28787314722;
            PLAYER_LEVEL_EXP[130] = 30708351167;
            PLAYER_LEVEL_EXP[131] = 32927971392;
            PLAYER_LEVEL_EXP[132] = 35456588954;
            PLAYER_LEVEL_EXP[133] = 38304752050;
            PLAYER_LEVEL_EXP[134] = 41483143517;
            PLAYER_LEVEL_EXP[135] = 45002580833;
            PLAYER_LEVEL_EXP[136] = 48874016114;
            PLAYER_LEVEL_EXP[137] = 53108536117;
            PLAYER_LEVEL_EXP[138] = 57717362239;
            PLAYER_LEVEL_EXP[139] = 62711850518;
            PLAYER_LEVEL_EXP[140] = 68103491630;
            PLAYER_LEVEL_EXP[141] = 73823200061;
            PLAYER_LEVEL_EXP[142] = 79880194932;
            PLAYER_LEVEL_EXP[143] = 86459105254;
            PLAYER_LEVEL_EXP[144] = 93402868044;
            PLAYER_LEVEL_EXP[145] = 100722929301;
            PLAYER_LEVEL_EXP[146] = 108501826395;
            PLAYER_LEVEL_EXP[147] = 116647097207;
            PLAYER_LEVEL_EXP[148] = 125168179055;
            PLAYER_LEVEL_EXP[149] = 134261045691;
            PLAYER_LEVEL_EXP[150] = 143758162043;
            PLAYER_LEVEL_EXP[151] = 153840933347;
            PLAYER_LEVEL_EXP[152] = 164332614724;
            PLAYER_LEVEL_EXP[153] = 175229703451;
            PLAYER_LEVEL_EXP[154] = 186541855042;
            PLAYER_LEVEL_EXP[155] = 198273024113;
            PLAYER_LEVEL_EXP[156] = 210446658418;
            PLAYER_LEVEL_EXP[157] = 223074858412;
            PLAYER_LEVEL_EXP[158] = 236104176058;
            PLAYER_LEVEL_EXP[159] = 249573971320;
            PLAYER_LEVEL_EXP[160] = 263494117908;
            PLAYER_RELEVEL_EXP[0] = 1;
            PLAYER_RELEVEL_EXP[1] = 500;
            PLAYER_RELEVEL_EXP[2] = 1350;
            PLAYER_RELEVEL_EXP[3] = 2750;
            PLAYER_RELEVEL_EXP[4] = 5150;
            PLAYER_RELEVEL_EXP[5] = 9150;
            PLAYER_RELEVEL_EXP[6] = 15550;
            PLAYER_RELEVEL_EXP[7] = 25500;
            PLAYER_RELEVEL_EXP[8] = 40700;
            PLAYER_RELEVEL_EXP[9] = 63300;
            PLAYER_RELEVEL_EXP[10] = 95850;
            PLAYER_RELEVEL_EXP[11] = 141900;
            PLAYER_RELEVEL_EXP[12] = 205800;
            PLAYER_RELEVEL_EXP[13] = 293150;
            PLAYER_RELEVEL_EXP[14] = 410900;
            PLAYER_RELEVEL_EXP[15] = 567750;
            PLAYER_RELEVEL_EXP[16] = 774150;
            PLAYER_RELEVEL_EXP[17] = 1043200;
            PET_LEVEL_EXP[0] = 1;
            PET_LEVEL_EXP[1] = 37;
            PET_LEVEL_EXP[2] = 179;
            PET_LEVEL_EXP[3] = 463;
            PET_LEVEL_EXP[4] = 888;
            PET_LEVEL_EXP[5] = 1581;
            PET_LEVEL_EXP[6] = 2680;
            PET_LEVEL_EXP[7] = 4325;
            PET_LEVEL_EXP[8] = 6616;
            PET_LEVEL_EXP[9] = 9255;
            PET_LEVEL_EXP[10] = 12886;
            PET_LEVEL_EXP[11] = 19322;
            PET_LEVEL_EXP[12] = 31213;
            PET_LEVEL_EXP[13] = 49015;
            PET_LEVEL_EXP[14] = 69805;
            PET_LEVEL_EXP[15] = 93850;
            PET_LEVEL_EXP[16] = 121427;
            PET_LEVEL_EXP[17] = 152817;
            PET_LEVEL_EXP[18] = 188310;
            PET_LEVEL_EXP[19] = 228201;
            PET_LEVEL_EXP[20] = 272794;
            PET_LEVEL_EXP[21] = 358506;
            PET_LEVEL_EXP[22] = 453418;
            PET_LEVEL_EXP[23] = 558086;
            PET_LEVEL_EXP[24] = 673075;
            PET_LEVEL_EXP[25] = 798961;
            PET_LEVEL_EXP[26] = 936328;
            PET_LEVEL_EXP[27] = 1085772;
            PET_LEVEL_EXP[28] = 1247900;
            PET_LEVEL_EXP[29] = 1423324;
            PET_LEVEL_EXP[30] = 1612670;
            PET_LEVEL_EXP[31] = 1936457;
            PET_LEVEL_EXP[32] = 2284377;
            PET_LEVEL_EXP[33] = 2657466;
            PET_LEVEL_EXP[34] = 3056773;
            PET_LEVEL_EXP[35] = 3483360;
            PET_LEVEL_EXP[36] = 3938305;
            PET_LEVEL_EXP[37] = 4422698;
            PET_LEVEL_EXP[38] = 4937643;
            PET_LEVEL_EXP[39] = 5484258;
            PET_LEVEL_EXP[40] = 6063673;
            PET_LEVEL_EXP[41] = 6979240;
            PET_LEVEL_EXP[42] = 7947201;
            PET_LEVEL_EXP[43] = 8969301;
            PET_LEVEL_EXP[44] = 10047304;
            PET_LEVEL_EXP[45] = 11182993;
            PET_LEVEL_EXP[46] = 12378169;
            PET_LEVEL_EXP[47] = 13634650;
            PET_LEVEL_EXP[48] = 14954273;
            PET_LEVEL_EXP[49] = 16338895;
            PET_LEVEL_EXP[50] = 17790387;
            PET_LEVEL_EXP[51] = 19954965;
            PET_LEVEL_EXP[52] = 22220163;
            PET_LEVEL_EXP[53] = 24588721;
            PET_LEVEL_EXP[54] = 27063404;
            PET_LEVEL_EXP[55] = 29647001;
            PET_LEVEL_EXP[56] = 32342325;
            PET_LEVEL_EXP[57] = 35152212;
            PET_LEVEL_EXP[58] = 38079523;
            PET_LEVEL_EXP[59] = 41127141;
            PET_LEVEL_EXP[60] = 44297972;
            PET_LEVEL_EXP[61] = 48820569;
            PET_LEVEL_EXP[62] = 53520251;
            PET_LEVEL_EXP[63] = 58401098;
            PET_LEVEL_EXP[64] = 63467221;
            PET_LEVEL_EXP[65] = 68722762;
            PET_LEVEL_EXP[66] = 74171894;
            PET_LEVEL_EXP[67] = 79818817;
            PET_LEVEL_EXP[68] = 85667765;
            PET_LEVEL_EXP[69] = 91722998;
            PET_LEVEL_EXP[70] = 100062792;
            PET_LEVEL_EXP[71] = 108688613;
            PET_LEVEL_EXP[72] = 117606251;
            PET_LEVEL_EXP[73] = 126821534;
            PET_LEVEL_EXP[74] = 136340327;
            PET_LEVEL_EXP[75] = 146168532;
            PET_LEVEL_EXP[76] = 156312093;
            PET_LEVEL_EXP[77] = 166776986;
            PET_LEVEL_EXP[78] = 177569228;
            PET_LEVEL_EXP[79] = 188694871;
            PET_LEVEL_EXP[80] = 200160005;
            PET_LEVEL_EXP[81] = 215493572;
            PET_LEVEL_EXP[82] = 240567939;
            PET_LEVEL_EXP[83] = 272316033;
            PET_LEVEL_EXP[84] = 304987655;
            PET_LEVEL_EXP[85] = 338598703;
            PET_LEVEL_EXP[86] = 373165165;
            PET_LEVEL_EXP[87] = 408703121;
            PET_LEVEL_EXP[88] = 445228737;
            PET_LEVEL_EXP[89] = 482758269;
            PET_LEVEL_EXP[90] = 521308060;
            PET_LEVEL_EXP[91] = 569351388;
            PET_LEVEL_EXP[92] = 618672921;
            PET_LEVEL_EXP[93] = 669292812;
            PET_LEVEL_EXP[94] = 721231319;
            PET_LEVEL_EXP[95] = 774508801;
            PET_LEVEL_EXP[96] = 829145723;
            PET_LEVEL_EXP[97] = 885162653;
            PET_LEVEL_EXP[98] = 942580260;
            PET_LEVEL_EXP[99] = 1001419317;
            PET_LEVEL_EXP[100] = 1061700697;
            PET_LEVEL_EXP[101] = 1182295769;
            PET_LEVEL_EXP[102] = 1305790007;
            PET_LEVEL_EXP[103] = 1432224766;
            PET_LEVEL_EXP[104] = 1561641599;
            PET_LEVEL_EXP[105] = 1694082252;
            PET_LEVEL_EXP[106] = 1829588662;
            PET_LEVEL_EXP[107] = 1968202959;
            PET_LEVEL_EXP[108] = 2109967465;
            PET_LEVEL_EXP[109] = 2254924690;
            PET_LEVEL_EXP[110] = 2403117335;
            PET_LEVEL_EXP[111] = 2664859140;
            PET_LEVEL_EXP[112] = 2932340298;
            PET_LEVEL_EXP[113] = 3205635566;
            PET_LEVEL_EXP[114] = 3484820024;
            PET_LEVEL_EXP[115] = 3769969072;
            PET_LEVEL_EXP[116] = 4061158427;
            PET_LEVEL_EXP[117] = 4358464126;
            PET_LEVEL_EXP[118] = 4661962520;
            PET_LEVEL_EXP[119] = 4971730275;
            PET_LEVEL_EXP[120] = 5307724846;
            PET_LEVEL_EXP[121] = 5779444415;
            PET_LEVEL_EXP[122] = 6260985265;
            PET_LEVEL_EXP[123] = 6752441643;
            PET_LEVEL_EXP[124] = 7299495631;
            PET_LEVEL_EXP[125] = 7857572191;
            PET_LEVEL_EXP[126] = 8426774140;
            PET_LEVEL_EXP[127] = 9055573472;
            PET_LEVEL_EXP[128] = 9696648077;
            PET_LEVEL_EXP[129] = 10350109337;
            PET_LEVEL_EXP[130] = 11118523915;
            PET_LEVEL_EXP[131] = 12006372005;
            PET_LEVEL_EXP[132] = 13017819030;
            PET_LEVEL_EXP[133] = 14157084269;
            PET_LEVEL_EXP[134] = 15428440856;
            PET_LEVEL_EXP[135] = 16836215782;
            PET_LEVEL_EXP[136] = 18384789894;
            PET_LEVEL_EXP[137] = 20078597895;
            PET_LEVEL_EXP[138] = 21922128344;
            PET_LEVEL_EXP[139] = 23919923656;
            PET_LEVEL_EXP[140] = 25879326819;
            PET_LEVEL_EXP[141] = 28052816023;
            PET_LEVEL_EXP[142] = 30354474074;
            PET_LEVEL_EXP[143] = 32854459997;
            PET_LEVEL_EXP[144] = 35493089857;
            PET_LEVEL_EXP[145] = 38274713134;
            PET_LEVEL_EXP[146] = 41230694030;
            PET_LEVEL_EXP[147] = 44325896939;
            PET_LEVEL_EXP[148] = 47563908041;
            PET_LEVEL_EXP[149] = 51019197363;
            PET_LEVEL_EXP[150] = 54628101576;
            PET_LEVEL_EXP[151] = 58459554672;
            PET_LEVEL_EXP[152] = 62446393595;
            PET_LEVEL_EXP[153] = 66587287311;
            PET_LEVEL_EXP[154] = 70885904916;
            PET_LEVEL_EXP[155] = 75343749163;
            PET_LEVEL_EXP[156] = 79969730199;
            PET_LEVEL_EXP[157] = 84768446197;
            PET_LEVEL_EXP[158] = 89719586902;
            PET_LEVEL_EXP[159] = 94838109102;
            FAIRY_LEVEL_EXP[0] = 1;
            FAIRY_LEVEL_EXP[1] = 50;
            FAIRY_LEVEL_EXP[2] = 250;
            FAIRY_LEVEL_EXP[3] = 700;
            FAIRY_LEVEL_EXP[4] = 1500;
            FAIRY_LEVEL_EXP[5] = 2750;
            FAIRY_LEVEL_EXP[6] = 4550;
            FAIRY_LEVEL_EXP[7] = 7000;
            FAIRY_LEVEL_EXP[8] = 10200;
            FAIRY_LEVEL_EXP[9] = 14250;
            FAIRY_LEVEL_EXP[10] = 19250;
            FAIRY_LEVEL_EXP[11] = 25300;
            FAIRY_LEVEL_EXP[12] = 32500;
            FAIRY_LEVEL_EXP[13] = 40950;
            FAIRY_LEVEL_EXP[14] = 50750;
            FAIRY_LEVEL_EXP[15] = 62000;
            FAIRY_LEVEL_EXP[16] = 74800;
            FAIRY_LEVEL_EXP[17] = 89250;
            FAIRY_LEVEL_EXP[18] = 105450;
            FAIRY_LEVEL_EXP[19] = 123500;
            FAIRY_GROW_EXP[0] = 500;
            FAIRY_GROW_EXP[1] = 1500;
            FAIRY_GROW_EXP[2] = 3500;
            FAIRY_GROW_EXP[3] = 7000;
            FAIRY_GROW_EXP[4] = 12500;
            FAIRY_GROW_EXP[5] = 20500;
            FAIRY_GROW_EXP[6] = 31500;
            FAIRY_GROW_EXP[7] = 46000;
            FAIRY_GROW_EXP[8] = 64500;
            FAIRY_GROW_EXP[9] = 87500;
            FAIRY_GROW_EXP[10] = 115500;
            FAIRY_GROW_EXP[11] = 149000;
            FAIRY_GROW_EXP[12] = 188500;
            FAIRY_GROW_EXP[13] = 234500;
            FAIRY_GROW_EXP[14] = 287500;
            FAIRY_GROW_EXP[15] = 348000;
            FAIRY_GROW_EXP[16] = 416500;
            FAIRY_GROW_EXP[17] = 493500;
            FAIRY_GROW_EXP[18] = 579500;
            FAIRY_GROW_EXP[19] = 675000;
            FAIRY_GROW_EXP[20] = 780500;
            FAIRY_GROW_EXP[21] = 896500;
            FAIRY_GROW_EXP[22] = 1023500;
            FAIRY_GROW_EXP[23] = 1162000;
            FAIRY_GROW_EXP[24] = 1312500;
            FAIRY_GROW_EXP[25] = 1475500;
            FAIRY_GROW_EXP[26] = 1651500;
            FAIRY_GROW_EXP[27] = 1841000;
            FAIRY_GROW_EXP[28] = 2044500;
            FAIRY_GROW_EXP[29] = 2262500;
            FAIRY_GROW_EXP[30] = 2495500;
            FAIRY_GROW_EXP[31] = 2744000;
            FAIRY_GROW_EXP[32] = 3008500;
            FAIRY_GROW_EXP[33] = 3289500;
            FAIRY_GROW_EXP[34] = 3587500;
            FAIRY_GROW_EXP[35] = 3903000;
            FAIRY_GROW_EXP[36] = 4236500;
            FAIRY_GROW_EXP[37] = 4588500;
            FAIRY_GROW_EXP[38] = 4959500;
            FAIRY_GROW_EXP[39] = 5350000;
            FAIRY_GROW_EXP[40] = 5760500;
            FAIRY_GROW_EXP[41] = 6191500;
            FAIRY_GROW_EXP[42] = 6643500;
            FAIRY_GROW_EXP[43] = 7117000;
            FAIRY_GROW_EXP[44] = 7612500;
            FAIRY_GROW_EXP[45] = 8130500;
            FAIRY_GROW_EXP[46] = 8671500;
            FAIRY_GROW_EXP[47] = 9236000;
            FAIRY_GROW_EXP[48] = 9824500;
            FAIRY_GROW_EXP[49] = 10437500;
            BASIC_GET_EXP[0] = 1;
            BASIC_GET_EXP[1] = 11220;
            BASIC_GET_EXP[2] = 12240;
            BASIC_GET_EXP[3] = 13260;
            BASIC_GET_EXP[4] = 14280;
            BASIC_GET_EXP[5] = 15300;
            BASIC_GET_EXP[6] = 16320;
            BASIC_GET_EXP[7] = 17340;
            BASIC_GET_EXP[8] = 18360;
            BASIC_GET_EXP[9] = 19380;
            BASIC_GET_EXP[10] = 20400;
            BASIC_GET_EXP[11] = 26775;
            BASIC_GET_EXP[12] = 28050;
            BASIC_GET_EXP[13] = 29325;
            BASIC_GET_EXP[14] = 30600;
            BASIC_GET_EXP[15] = 31875;
            BASIC_GET_EXP[16] = 33150;
            BASIC_GET_EXP[17] = 34425;
            BASIC_GET_EXP[18] = 35700;
            BASIC_GET_EXP[19] = 36975;
            BASIC_GET_EXP[20] = 38250;
            BASIC_GET_EXP[21] = 47430;
            BASIC_GET_EXP[22] = 48960;
            BASIC_GET_EXP[23] = 50490;
            BASIC_GET_EXP[24] = 52020;
            BASIC_GET_EXP[25] = 53550;
            BASIC_GET_EXP[26] = 55080;
            BASIC_GET_EXP[27] = 56610;
            BASIC_GET_EXP[28] = 58140;
            BASIC_GET_EXP[29] = 59670;
            BASIC_GET_EXP[30] = 61200;
            BASIC_GET_EXP[31] = 73185;
            BASIC_GET_EXP[32] = 74970;
            BASIC_GET_EXP[33] = 76755;
            BASIC_GET_EXP[34] = 78540;
            BASIC_GET_EXP[35] = 80325;
            BASIC_GET_EXP[36] = 82110;
            BASIC_GET_EXP[37] = 83895;
            BASIC_GET_EXP[38] = 85680;
            BASIC_GET_EXP[39] = 87465;
            BASIC_GET_EXP[40] = 89250;
            BASIC_GET_EXP[41] = 104040;
            BASIC_GET_EXP[42] = 106080;
            BASIC_GET_EXP[43] = 108120;
            BASIC_GET_EXP[44] = 110160;
            BASIC_GET_EXP[45] = 112200;
            BASIC_GET_EXP[46] = 114240;
            BASIC_GET_EXP[47] = 116280;
            BASIC_GET_EXP[48] = 118320;
            BASIC_GET_EXP[49] = 120360;
            BASIC_GET_EXP[50] = 122400;
            BASIC_GET_EXP[51] = 139995;
            BASIC_GET_EXP[52] = 142290;
            BASIC_GET_EXP[53] = 144585;
            BASIC_GET_EXP[54] = 146880;
            BASIC_GET_EXP[55] = 149175;
            BASIC_GET_EXP[56] = 151470;
            BASIC_GET_EXP[57] = 153765;
            BASIC_GET_EXP[58] = 156060;
            BASIC_GET_EXP[59] = 158355;
            BASIC_GET_EXP[60] = 160650;
            BASIC_GET_EXP[61] = 181050;
            BASIC_GET_EXP[62] = 183600;
            BASIC_GET_EXP[63] = 186150;
            BASIC_GET_EXP[64] = 188700;
            BASIC_GET_EXP[65] = 191250;
            BASIC_GET_EXP[66] = 193800;
            BASIC_GET_EXP[67] = 196350;
            BASIC_GET_EXP[68] = 198900;
            BASIC_GET_EXP[69] = 201450;
            BASIC_GET_EXP[70] = 224400;
            BASIC_GET_EXP[71] = 227205;
            BASIC_GET_EXP[72] = 230010;
            BASIC_GET_EXP[73] = 232815;
            BASIC_GET_EXP[74] = 235620;
            BASIC_GET_EXP[75] = 238425;
            BASIC_GET_EXP[76] = 241230;
            BASIC_GET_EXP[77] = 244035;
            BASIC_GET_EXP[78] = 246840;
            BASIC_GET_EXP[79] = 249645;
            BASIC_GET_EXP[80] = 252450;
            BASIC_GET_EXP[81] = 278460;
            BASIC_GET_EXP[82] = 281520;
            BASIC_GET_EXP[83] = 284580;
            BASIC_GET_EXP[84] = 287640;
            BASIC_GET_EXP[85] = 290700;
            BASIC_GET_EXP[86] = 293760;
            BASIC_GET_EXP[87] = 296820;
            BASIC_GET_EXP[88] = 299880;
            BASIC_GET_EXP[89] = 302940;
            BASIC_GET_EXP[90] = 306000;
            BASIC_GET_EXP[91] = 334815;
            BASIC_GET_EXP[92] = 338130;
            BASIC_GET_EXP[93] = 341445;
            BASIC_GET_EXP[94] = 344760;
            BASIC_GET_EXP[95] = 348075;
            BASIC_GET_EXP[96] = 351390;
            BASIC_GET_EXP[97] = 354705;
            BASIC_GET_EXP[98] = 358020;
            BASIC_GET_EXP[99] = 361335;
            BASIC_GET_EXP[100] = 392700;
            BASIC_GET_EXP[101] = 396270;
            BASIC_GET_EXP[102] = 399840;
            BASIC_GET_EXP[103] = 403410;
            BASIC_GET_EXP[104] = 406980;
            BASIC_GET_EXP[105] = 410550;
            BASIC_GET_EXP[106] = 414120;
            BASIC_GET_EXP[107] = 417690;
            BASIC_GET_EXP[108] = 421260;
            BASIC_GET_EXP[109] = 424830;
            BASIC_GET_EXP[110] = 428400;
            BASIC_GET_EXP[111] = 493680;
            BASIC_GET_EXP[112] = 497760;
            BASIC_GET_EXP[113] = 501840;
            BASIC_GET_EXP[114] = 505920;
            BASIC_GET_EXP[115] = 573750;
            BASIC_GET_EXP[116] = 578340;
            BASIC_GET_EXP[117] = 582930;
            BASIC_GET_EXP[118] = 652800;
            BASIC_GET_EXP[119] = 657900;
            BASIC_GET_EXP[120] = 663000;
            BASIC_GET_EXP[121] = 734910;
            BASIC_GET_EXP[122] = 740520;
            BASIC_GET_EXP[123] = 746130;
            BASIC_GET_EXP[124] = 820080;
            BASIC_GET_EXP[125] = 826200;
            BASIC_GET_EXP[126] = 832320;
            BASIC_GET_EXP[127] = 908310;
            BASIC_GET_EXP[128] = 914940;
            BASIC_GET_EXP[129] = 921570;
            BASIC_GET_EXP[130] = 1071000;
            BASIC_GET_EXP[131] = 1222470;
            BASIC_GET_EXP[132] = 1375980;
            BASIC_GET_EXP[133] = 1531530;
            BASIC_GET_EXP[134] = 1689120;
            BASIC_GET_EXP[135] = 1848750;
            BASIC_GET_EXP[136] = 2010420;
            BASIC_GET_EXP[137] = 2174130;
            BASIC_GET_EXP[138] = 2339880;
            BASIC_GET_EXP[139] = 2507670;
            BASIC_GET_EXP[140] = 2677500;
            BASIC_GET_EXP[141] = 2809722;
            BASIC_GET_EXP[142] = 2943597;
            BASIC_GET_EXP[143] = 3163417;
            BASIC_GET_EXP[144] = 3303903;
            BASIC_GET_EXP[145] = 3446868;
            BASIC_GET_EXP[146] = 3625368;
            BASIC_GET_EXP[147] = 3757590;
            BASIC_GET_EXP[148] = 3891465;
            BASIC_GET_EXP[149] = 4111285;
            BASIC_GET_EXP[150] = 4251771;
            BASIC_GET_EXP[151] = 4469938;
            BASIC_GET_EXP[152] = 4606292;
            BASIC_GET_EXP[153] = 4738514;
            BASIC_GET_EXP[154] = 4872389;
            BASIC_GET_EXP[155] = 5005438;
            BASIC_GET_EXP[156] = 5145924;
            BASIC_GET_EXP[157] = 5288889;
            BASIC_GET_EXP[158] = 5407063;
            BASIC_GET_EXP[159] = 5539285;
            BASIC_GET_EXP[160] = 5673160;
            BASIC_GET_MONEY[0] = 1;
            BASIC_GET_MONEY[1] = 2380;
            BASIC_GET_MONEY[2] = 2380;
            BASIC_GET_MONEY[3] = 2380;
            BASIC_GET_MONEY[4] = 2380;
            BASIC_GET_MONEY[5] = 2380;
            BASIC_GET_MONEY[6] = 2783;
            BASIC_GET_MONEY[7] = 2783;
            BASIC_GET_MONEY[8] = 2783;
            BASIC_GET_MONEY[9] = 2783;
            BASIC_GET_MONEY[10] = 2783;
            BASIC_GET_MONEY[11] = 3657;
            BASIC_GET_MONEY[12] = 3657;
            BASIC_GET_MONEY[13] = 3657;
            BASIC_GET_MONEY[14] = 3657;
            BASIC_GET_MONEY[15] = 3657;
            BASIC_GET_MONEY[16] = 5135;
            BASIC_GET_MONEY[17] = 5135;
            BASIC_GET_MONEY[18] = 5135;
            BASIC_GET_MONEY[19] = 5135;
            BASIC_GET_MONEY[20] = 5135;
            BASIC_GET_MONEY[21] = 7420;
            BASIC_GET_MONEY[22] = 7420;
            BASIC_GET_MONEY[23] = 7420;
            BASIC_GET_MONEY[24] = 7420;
            BASIC_GET_MONEY[25] = 7420;
            BASIC_GET_MONEY[26] = 10780;
            BASIC_GET_MONEY[27] = 10780;
            BASIC_GET_MONEY[28] = 10780;
            BASIC_GET_MONEY[29] = 10780;
            BASIC_GET_MONEY[30] = 10780;
            BASIC_GET_MONEY[31] = 15551;
            BASIC_GET_MONEY[32] = 15551;
            BASIC_GET_MONEY[33] = 15551;
            BASIC_GET_MONEY[34] = 15551;
            BASIC_GET_MONEY[35] = 15551;
            BASIC_GET_MONEY[36] = 22137;
            BASIC_GET_MONEY[37] = 22137;
            BASIC_GET_MONEY[38] = 22137;
            BASIC_GET_MONEY[39] = 22137;
            BASIC_GET_MONEY[40] = 22137;
            BASIC_GET_MONEY[41] = 31007;
            BASIC_GET_MONEY[42] = 31007;
            BASIC_GET_MONEY[43] = 31007;
            BASIC_GET_MONEY[44] = 31007;
            BASIC_GET_MONEY[45] = 31007;
            BASIC_GET_MONEY[46] = 42700;
            BASIC_GET_MONEY[47] = 42700;
            BASIC_GET_MONEY[48] = 42700;
            BASIC_GET_MONEY[49] = 42700;
            BASIC_GET_MONEY[50] = 42700;
            BASIC_GET_MONEY[51] = 57820;
            BASIC_GET_MONEY[52] = 57820;
            BASIC_GET_MONEY[53] = 57820;
            BASIC_GET_MONEY[54] = 57820;
            BASIC_GET_MONEY[55] = 57820;
            BASIC_GET_MONEY[56] = 77039;
            BASIC_GET_MONEY[57] = 77039;
            BASIC_GET_MONEY[58] = 77039;
            BASIC_GET_MONEY[59] = 77039;
            BASIC_GET_MONEY[60] = 77039;
            BASIC_GET_MONEY[61] = 101097;
            BASIC_GET_MONEY[62] = 101097;
            BASIC_GET_MONEY[63] = 101097;
            BASIC_GET_MONEY[64] = 101097;
            BASIC_GET_MONEY[65] = 101097;
            BASIC_GET_MONEY[66] = 130799;
            BASIC_GET_MONEY[67] = 130799;
            BASIC_GET_MONEY[68] = 130799;
            BASIC_GET_MONEY[69] = 130799;
            BASIC_GET_MONEY[70] = 130799;
            BASIC_GET_MONEY[71] = 167020;
            BASIC_GET_MONEY[72] = 167020;
            BASIC_GET_MONEY[73] = 167020;
            BASIC_GET_MONEY[74] = 167020;
            BASIC_GET_MONEY[75] = 167020;
            BASIC_GET_MONEY[76] = 210700;
            BASIC_GET_MONEY[77] = 210700;
            BASIC_GET_MONEY[78] = 210700;
            BASIC_GET_MONEY[79] = 210700;
            BASIC_GET_MONEY[80] = 210700;
            BASIC_GET_MONEY[81] = 262847;
            BASIC_GET_MONEY[82] = 262847;
            BASIC_GET_MONEY[83] = 262847;
            BASIC_GET_MONEY[84] = 262847;
            BASIC_GET_MONEY[85] = 262847;
            BASIC_GET_MONEY[86] = 324537;
            BASIC_GET_MONEY[87] = 324537;
            BASIC_GET_MONEY[88] = 324537;
            BASIC_GET_MONEY[89] = 324537;
            BASIC_GET_MONEY[90] = 324537;
            BASIC_GET_MONEY[91] = 396911;
            BASIC_GET_MONEY[92] = 396911;
            BASIC_GET_MONEY[93] = 396911;
            BASIC_GET_MONEY[94] = 396911;
            BASIC_GET_MONEY[95] = 396911;
            BASIC_GET_MONEY[96] = 481180;
            BASIC_GET_MONEY[97] = 481180;
            BASIC_GET_MONEY[98] = 481180;
            BASIC_GET_MONEY[99] = 481180;
            BASIC_GET_MONEY[100] = 481180;
            BASIC_GET_MONEY[101] = 578620;
            BASIC_GET_MONEY[102] = 578620;
            BASIC_GET_MONEY[103] = 578620;
            BASIC_GET_MONEY[104] = 578620;
            BASIC_GET_MONEY[105] = 578620;
            BASIC_GET_MONEY[106] = 690575;
            BASIC_GET_MONEY[107] = 690575;
            BASIC_GET_MONEY[108] = 690575;
            BASIC_GET_MONEY[109] = 690575;
            BASIC_GET_MONEY[110] = 690575;
            BASIC_GET_MONEY[111] = 818457;
            BASIC_GET_MONEY[112] = 818457;
            BASIC_GET_MONEY[113] = 818457;
            BASIC_GET_MONEY[114] = 818457;
            BASIC_GET_MONEY[115] = 818457;
            BASIC_GET_MONEY[116] = 963743;
            BASIC_GET_MONEY[117] = 963743;
            BASIC_GET_MONEY[118] = 963743;
            BASIC_GET_MONEY[119] = 963743;
            BASIC_GET_MONEY[120] = 963743;
            BASIC_GET_MONEY[121] = 1127980;
            BASIC_GET_MONEY[122] = 1127980;
            BASIC_GET_MONEY[123] = 1127980;
            BASIC_GET_MONEY[124] = 1127980;
            BASIC_GET_MONEY[125] = 1127980;
            BASIC_GET_MONEY[126] = 1312780;
            BASIC_GET_MONEY[127] = 1312780;
            BASIC_GET_MONEY[128] = 1312780;
            BASIC_GET_MONEY[129] = 1312780;
            BASIC_GET_MONEY[130] = 1312780;
            BASIC_GET_MONEY[131] = 1510278;
            BASIC_GET_MONEY[132] = 1510278;
            BASIC_GET_MONEY[133] = 1510278;
            BASIC_GET_MONEY[134] = 1510278;
            BASIC_GET_MONEY[135] = 1510278;
            BASIC_GET_MONEY[136] = 1725180;
            BASIC_GET_MONEY[137] = 1725180;
            BASIC_GET_MONEY[138] = 1725180;
            BASIC_GET_MONEY[139] = 1725180;
            BASIC_GET_MONEY[140] = 1725180;
            BASIC_GET_MONEY[141] = 1955780;
            BASIC_GET_MONEY[142] = 1955780;
            BASIC_GET_MONEY[143] = 1955780;
            BASIC_GET_MONEY[144] = 1955780;
            BASIC_GET_MONEY[145] = 1955780;
            BASIC_GET_MONEY[146] = 2206784;
            BASIC_GET_MONEY[147] = 2206784;
            BASIC_GET_MONEY[148] = 2206784;
            BASIC_GET_MONEY[149] = 2206784;
            BASIC_GET_MONEY[150] = 2206784;
            BASIC_GET_MONEY[151] = 2475287;
            BASIC_GET_MONEY[152] = 2475287;
            BASIC_GET_MONEY[153] = 2475287;
            BASIC_GET_MONEY[154] = 2475287;
            BASIC_GET_MONEY[155] = 2475287;
            BASIC_GET_MONEY[156] = 2758873;
            BASIC_GET_MONEY[157] = 2758873;
            BASIC_GET_MONEY[158] = 2758873;
            BASIC_GET_MONEY[159] = 2758873;
            BASIC_GET_MONEY[160] = 2758873;
            ELEMENT_COLOR[ELEMENT_LIGHT] = "#FFCC00";
            ELEMENT_COLOR[ELEMENT_DARK] = "#FF9900";
            ELEMENT_COLOR[ELEMENT_WIND] = "#FF66CC";
            ELEMENT_COLOR[ELEMENT_THUNDER] = "#00FF00";
            ELEMENT_COLOR[ELEMENT_WATER] = "#3399CC";
            ELEMENT_COLOR[ELEMENT_FIRE] = "#33FF66";
            ITEM_KIND_NAME[ITEM_KIND_MAINHAND] = Language.GAMEPREDEF_S[167];
            ITEM_KIND_NAME[ITEM_KIND_SUBHAND] = Language.GAMEPREDEF_S[168];
            ITEM_KIND_NAME[ITEM_KIND_DEFENCE] = Language.GAMEPREDEF_S[169];
            ITEM_KIND_NAME[ITEM_KIND_JEWELRY] = Language.GAMEPREDEF_S[170];
            ITEM_KIND_NAME[ITEM_KIND_ITEM] = Language.GAMEPREDEF_S[171];
            ITEM_KIND_NAME[ITEM_KIND_MATERIAL] = Language.GAMEPREDEF_S[172];
            ITEM_KIND_NAME[ITEM_KIND_PET] = Language.GAMEPREDEF_S[173];
            ITEM_KIND_NAME[ITEM_KIND_PETEQU] = Language.GAMEPREDEF_S[370];
            ITEM_KIND_NAME[ITEM_KIND_FLYER] = Language.GAMEPREDEF_S[383];
            ITEM_KIND_NAME[ITEM_KIND_MAGICWEAPON] = Language.GAMEPREDEF_S[384];
            ITEM_KIND_NAME[ITEM_KIND_DRESS] = Language.GAMEPREDEF_S[390];
            ITEM_KIND_NAME[ITEM_KIND_GATHER] = Language.GAMEPREDEF_S[394];
            ITEM_KIND_NAME[ITEM_KIND_WING] = Language.GAMEPREDEF_S[459];
            ITEM_KIND_NAME[ITEM_KIND_FEATHER] = Language.GAMEPREDEF_S[467];
            ITEM_KIND_TYPE[ITEM_KIND_MAINHAND] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_HAMMER] = Language.GAMEPREDEF_S[174];
            ITEM_TYPE_NAME[ITEM_TYPE_STICK] = Language.GAMEPREDEF_S[175];
            ITEM_TYPE_NAME[ITEM_TYPE_GUN] = Language.GAMEPREDEF_S[176];
            ITEM_TYPE_NAME[ITEM_TYPE_SWORDONE] = Language.GAMEPREDEF_S[177];
            ITEM_TYPE_NAME[ITEM_TYPE_GUITAR] = Language.GAMEPREDEF_S[178];
            ITEM_TYPE_NAME[ITEM_TYPE_BAT] = Language.GAMEPREDEF_S[179];
            ITEM_KIND_TYPE[ITEM_KIND_MAINHAND][ITEM_TYPE_HAMMER] = ITEM_TYPE_HAMMER;
            ITEM_KIND_TYPE[ITEM_KIND_MAINHAND][ITEM_TYPE_STICK] = ITEM_TYPE_STICK;
            ITEM_KIND_TYPE[ITEM_KIND_MAINHAND][ITEM_TYPE_GUN] = ITEM_TYPE_GUN;
            ITEM_KIND_TYPE[ITEM_KIND_MAINHAND][ITEM_TYPE_SWORDONE] = ITEM_TYPE_SWORDONE;
            ITEM_KIND_TYPE[ITEM_KIND_MAINHAND][ITEM_TYPE_GUITAR] = ITEM_TYPE_GUITAR;
            ITEM_KIND_TYPE[ITEM_KIND_MAINHAND][ITEM_TYPE_BAT] = ITEM_TYPE_BAT;
            ITEM_KIND_TYPE[ITEM_KIND_SUBHAND] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_SHIELD] = Language.GAMEPREDEF_S[180];
            ITEM_TYPE_NAME[ITEM_TYPE_BOOK] = Language.GAMEPREDEF_S[181];
            ITEM_TYPE_NAME[ITEM_TYPE_CUFF] = Language.GAMEPREDEF_S[182];
            ITEM_TYPE_NAME[ITEM_TYPE_KNIFE] = Language.GAMEPREDEF_S[183];
            ITEM_TYPE_NAME[ITEM_TYPE_PICK] = Language.GAMEPREDEF_S[184];
            ITEM_TYPE_NAME[ITEM_TYPE_GLOVE] = Language.GAMEPREDEF_S[185];
            ITEM_KIND_TYPE[ITEM_KIND_SUBHAND][ITEM_TYPE_SHIELD] = ITEM_TYPE_SHIELD;
            ITEM_KIND_TYPE[ITEM_KIND_SUBHAND][ITEM_TYPE_BOOK] = ITEM_TYPE_BOOK;
            ITEM_KIND_TYPE[ITEM_KIND_SUBHAND][ITEM_TYPE_CUFF] = ITEM_TYPE_CUFF;
            ITEM_KIND_TYPE[ITEM_KIND_SUBHAND][ITEM_TYPE_KNIFE] = ITEM_TYPE_KNIFE;
            ITEM_KIND_TYPE[ITEM_KIND_SUBHAND][ITEM_TYPE_PICK] = ITEM_TYPE_PICK;
            ITEM_KIND_TYPE[ITEM_KIND_SUBHAND][ITEM_TYPE_GLOVE] = ITEM_TYPE_GLOVE;
            ITEM_KIND_TYPE[ITEM_KIND_DEFENCE] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_HAT] = Language.GAMEPREDEF_S[186];
            ITEM_TYPE_NAME[ITEM_TYPE_CLOTHES] = Language.GAMEPREDEF_S[187];
            ITEM_TYPE_NAME[ITEM_TYPE_TROUSERS] = Language.GAMEPREDEF_S[188];
            ITEM_TYPE_NAME[ITEM_TYPE_BELT] = Language.GAMEPREDEF_S[189];
            ITEM_TYPE_NAME[ITEM_TYPE_SHOE] = Language.GAMEPREDEF_S[190];
            ITEM_TYPE_NAME[ITEM_TYPE_SHOULDER] = Language.GAMEPREDEF_S[191];
            ITEM_KIND_TYPE[ITEM_KIND_DEFENCE][ITEM_TYPE_HAT] = ITEM_TYPE_HAT;
            ITEM_KIND_TYPE[ITEM_KIND_DEFENCE][ITEM_TYPE_CLOTHES] = ITEM_TYPE_CLOTHES;
            ITEM_KIND_TYPE[ITEM_KIND_DEFENCE][ITEM_TYPE_TROUSERS] = ITEM_TYPE_TROUSERS;
            ITEM_KIND_TYPE[ITEM_KIND_DEFENCE][ITEM_TYPE_BELT] = ITEM_TYPE_BELT;
            ITEM_KIND_TYPE[ITEM_KIND_DEFENCE][ITEM_TYPE_SHOE] = ITEM_TYPE_SHOE;
            ITEM_KIND_TYPE[ITEM_KIND_DEFENCE][ITEM_TYPE_SHOULDER] = ITEM_TYPE_SHOULDER;
            ITEM_KIND_TYPE[ITEM_KIND_JEWELRY] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_NECKLACE] = Language.GAMEPREDEF_S[192];
            ITEM_TYPE_NAME[ITEM_TYPE_RING] = Language.GAMEPREDEF_S[193];
            ITEM_TYPE_NAME[ITEM_TYPE_JEWELRY1] = Language.GAMEPREDEF_S[194];
            ITEM_TYPE_NAME[ITEM_TYPE_JEWELRY2] = Language.GAMEPREDEF_S[195];
            ITEM_KIND_TYPE[ITEM_KIND_JEWELRY][ITEM_TYPE_NECKLACE] = ITEM_TYPE_NECKLACE;
            ITEM_KIND_TYPE[ITEM_KIND_JEWELRY][ITEM_TYPE_RING] = ITEM_TYPE_RING;
            ITEM_KIND_TYPE[ITEM_KIND_JEWELRY][ITEM_TYPE_JEWELRY1] = ITEM_TYPE_JEWELRY1;
            ITEM_KIND_TYPE[ITEM_KIND_JEWELRY][ITEM_TYPE_JEWELRY2] = ITEM_TYPE_JEWELRY2;
            ITEM_KIND_TYPE[ITEM_KIND_WING] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_WING] = Language.GAMEPREDEF_S[459];
            ITEM_KIND_TYPE[ITEM_KIND_WING][ITEM_TYPE_WING] = ITEM_TYPE_WING;
            ITEM_KIND_TYPE[ITEM_KIND_FEATHER] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_FEATHER_A] = Language.GAMEPREDEF_S[490];
            ITEM_TYPE_NAME[ITEM_TYPE_FEATHER_B] = Language.GAMEPREDEF_S[491];
            ITEM_TYPE_NAME[ITEM_TYPE_FEATHER_C] = Language.GAMEPREDEF_S[492];
            ITEM_TYPE_NAME[ITEM_TYPE_FEATHER_D] = Language.GAMEPREDEF_S[493];
            ITEM_TYPE_NAME[ITEM_TYPE_FEATHER_MIX] = Language.GAMEPREDEF_S[494];
            ITEM_KIND_TYPE[ITEM_KIND_FEATHER][ITEM_TYPE_FEATHER_A] = ITEM_TYPE_FEATHER_A;
            ITEM_KIND_TYPE[ITEM_KIND_FEATHER][ITEM_TYPE_FEATHER_B] = ITEM_TYPE_FEATHER_B;
            ITEM_KIND_TYPE[ITEM_KIND_FEATHER][ITEM_TYPE_FEATHER_C] = ITEM_TYPE_FEATHER_C;
            ITEM_KIND_TYPE[ITEM_KIND_FEATHER][ITEM_TYPE_FEATHER_D] = ITEM_TYPE_FEATHER_D;
            ITEM_KIND_TYPE[ITEM_KIND_FEATHER][ITEM_TYPE_FEATHER_MIX] = ITEM_TYPE_FEATHER_MIX;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_REEL] = Language.GAMEPREDEF_S[196];
            ITEM_TYPE_NAME[ITEM_TYPE_MEDICINE] = Language.GAMEPREDEF_S[197];
            ITEM_TYPE_NAME[ITEM_TYPE_FOOD] = Language.GAMEPREDEF_S[198];
            ITEM_TYPE_NAME[ITEM_TYPE_JEWEL] = Language.GAMEPREDEF_S[199];
            ITEM_TYPE_NAME[ITEM_TYPE_STAR] = Language.GAMEPREDEF_S[200];
            ITEM_TYPE_NAME[ITEM_TYPE_SKILLBOOK] = Language.GAMEPREDEF_S[201];
            ITEM_TYPE_NAME[ITEM_TYPE_CREBOOK] = Language.GAMEPREDEF_S[202];
            ITEM_TYPE_NAME[ITEM_TYPE_PETFUNC] = Language.GAMEPREDEF_S[203];
            ITEM_TYPE_NAME[ITEM_TYPE_QUEST] = Language.GAMEPREDEF_S[204];
            ITEM_TYPE_NAME[ITEM_TYPE_KEY] = Language.GAMEPREDEF_S[205];
            ITEM_TYPE_NAME[ITEM_TYPE_OTHER] = Language.GAMEPREDEF_S[206];
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_LEVELUP] = Language.GAMEPREDEF_S[379];
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_MODCOLOR] = Language.GAMEPREDEF_S[380];
            ITEM_TYPE_NAME[ITEM_TYPE_MW_REPAIR] = Language.GAMEPREDEF_S[385];
            ITEM_TYPE_NAME[ITEM_TYPE_MW_SKILL_RESET] = Language.GAMEPREDEF_S[386];
            ITEM_TYPE_NAME[ITEM_TYPE_MW_TRANS] = Language.GAMEPREDEF_S[391];
            ITEM_TYPE_NAME[ITEM_TYPE_FISHING_TOOL] = Language.GAMEPREDEF_S[396];
            ITEM_TYPE_NAME[ITEM_TYPE_FORMULA] = Language.GAMEPREDEF_S[407];
            ITEM_TYPE_NAME[ITEM_TYPE_TEMP_BAG] = Language.GAMEPREDEF_S[462];
            ITEM_TYPE_NAME[ITEM_TYPE_WING_ENHANCE] = Language.GAMEPREDEF_S[508];
            ITEM_TYPE_NAME[ITEM_TYPE_FAIRY_SKILL_ITEM] = Language.GAMEPREDEF_S[522];
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_REEL] = ITEM_TYPE_REEL;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_MEDICINE] = ITEM_TYPE_MEDICINE;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_FOOD] = ITEM_TYPE_FOOD;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_JEWEL] = ITEM_TYPE_JEWEL;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_STAR] = ITEM_TYPE_STAR;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_SKILLBOOK] = ITEM_TYPE_SKILLBOOK;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_CREBOOK] = ITEM_TYPE_CREBOOK;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_PETFUNC] = ITEM_TYPE_PETFUNC;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_QUEST] = ITEM_TYPE_QUEST;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_KEY] = ITEM_TYPE_KEY;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_OTHER] = ITEM_TYPE_OTHER;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_MW_REPAIR] = ITEM_TYPE_MW_REPAIR;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_MW_SKILL_RESET] = ITEM_TYPE_MW_SKILL_RESET;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_MW_TRANS] = ITEM_TYPE_MW_TRANS;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_FISHING_TOOL] = ITEM_TYPE_FISHING_TOOL;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_FORMULA] = ITEM_TYPE_FORMULA;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_PETEQU_LEVELUP] = ITEM_TYPE_PETEQU_LEVELUP;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_PETEQU_MODCOLOR] = ITEM_TYPE_PETEQU_MODCOLOR;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_TEMP_BAG] = ITEM_TYPE_TEMP_BAG;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_WING_ENHANCE] = ITEM_TYPE_WING_ENHANCE;
            ITEM_KIND_TYPE[ITEM_KIND_ITEM][ITEM_TYPE_FAIRY_SKILL_ITEM] = ITEM_TYPE_FAIRY_SKILL_ITEM;
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_DIAMOND] = Language.GAMEPREDEF_S[207];
            ITEM_TYPE_NAME[ITEM_TYPE_METAL] = Language.GAMEPREDEF_S[208];
            ITEM_TYPE_NAME[ITEM_TYPE_WOOD] = Language.GAMEPREDEF_S[209];
            ITEM_TYPE_NAME[ITEM_TYPE_JADE] = Language.GAMEPREDEF_S[210];
            ITEM_TYPE_NAME[ITEM_TYPE_CLOTH] = Language.GAMEPREDEF_S[211];
            ITEM_TYPE_NAME[ITEM_TYPE_FUR] = Language.GAMEPREDEF_S[212];
            ITEM_TYPE_NAME[ITEM_TYPE_FISH] = Language.GAMEPREDEF_S[397];
            ITEM_TYPE_NAME[ITEM_TYPE_PLANT] = Language.GAMEPREDEF_S[405];
            ITEM_TYPE_NAME[ITEM_TYPE_HERB] = Language.GAMEPREDEF_S[406];
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL][ITEM_TYPE_DIAMOND] = ITEM_TYPE_DIAMOND;
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL][ITEM_TYPE_METAL] = ITEM_TYPE_METAL;
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL][ITEM_TYPE_WOOD] = ITEM_TYPE_WOOD;
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL][ITEM_TYPE_JADE] = ITEM_TYPE_JADE;
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL][ITEM_TYPE_CLOTH] = ITEM_TYPE_CLOTH;
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL][ITEM_TYPE_FUR] = ITEM_TYPE_FUR;
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL][ITEM_TYPE_FISH] = ITEM_TYPE_FISH;
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL][ITEM_TYPE_PLANT] = ITEM_TYPE_PLANT;
            ITEM_KIND_TYPE[ITEM_KIND_MATERIAL][ITEM_TYPE_HERB] = ITEM_TYPE_HERB;
            ITEM_KIND_TYPE[ITEM_KIND_PET] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_PET_HUMAN] = Language.GAMEPREDEF_S[213];
            ITEM_TYPE_NAME[ITEM_TYPE_PET_MONSTER] = Language.GAMEPREDEF_S[214];
            ITEM_TYPE_NAME[ITEM_TYPE_PET_PLANT] = Language.GAMEPREDEF_S[215];
            ITEM_TYPE_NAME[ITEM_TYPE_PET_MACHINE] = Language.GAMEPREDEF_S[216];
            ITEM_TYPE_NAME[ITEM_TYPE_PET_DEVIL] = Language.GAMEPREDEF_S[217];
            ITEM_TYPE_NAME[ITEM_TYPE_PET_DRAGON] = Language.GAMEPREDEF_S[218];
            ITEM_KIND_TYPE[ITEM_KIND_PET][ITEM_TYPE_PET_HUMAN] = ITEM_TYPE_PET_HUMAN;
            ITEM_KIND_TYPE[ITEM_KIND_PET][ITEM_TYPE_PET_MONSTER] = ITEM_TYPE_PET_MONSTER;
            ITEM_KIND_TYPE[ITEM_KIND_PET][ITEM_TYPE_PET_PLANT] = ITEM_TYPE_PET_PLANT;
            ITEM_KIND_TYPE[ITEM_KIND_PET][ITEM_TYPE_PET_MACHINE] = ITEM_TYPE_PET_MACHINE;
            ITEM_KIND_TYPE[ITEM_KIND_PET][ITEM_TYPE_PET_DEVIL] = ITEM_TYPE_PET_DEVIL;
            ITEM_KIND_TYPE[ITEM_KIND_PET][ITEM_TYPE_PET_DRAGON] = ITEM_TYPE_PET_DRAGON;
            ITEM_KIND_TYPE[ITEM_KIND_PETEQU] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_SPUR] = Language.GAMEPREDEF_S[371];
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_NECK] = Language.GAMEPREDEF_S[372];
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_BELL] = Language.GAMEPREDEF_S[373];
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_WING] = Language.GAMEPREDEF_S[374];
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_ARMOR] = Language.GAMEPREDEF_S[375];
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_CUFF] = Language.GAMEPREDEF_S[376];
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_DRAGON1] = Language.GAMEPREDEF_S[377];
            ITEM_TYPE_NAME[ITEM_TYPE_PETEQU_DRAGON2] = Language.GAMEPREDEF_S[378];
            ITEM_KIND_TYPE[ITEM_KIND_PETEQU][ITEM_TYPE_PETEQU_SPUR] = ITEM_TYPE_PETEQU_SPUR;
            ITEM_KIND_TYPE[ITEM_KIND_PETEQU][ITEM_TYPE_PETEQU_NECK] = ITEM_TYPE_PETEQU_NECK;
            ITEM_KIND_TYPE[ITEM_KIND_PETEQU][ITEM_TYPE_PETEQU_BELL] = ITEM_TYPE_PETEQU_BELL;
            ITEM_KIND_TYPE[ITEM_KIND_PETEQU][ITEM_TYPE_PETEQU_WING] = ITEM_TYPE_PETEQU_WING;
            ITEM_KIND_TYPE[ITEM_KIND_PETEQU][ITEM_TYPE_PETEQU_ARMOR] = ITEM_TYPE_PETEQU_ARMOR;
            ITEM_KIND_TYPE[ITEM_KIND_PETEQU][ITEM_TYPE_PETEQU_CUFF] = ITEM_TYPE_PETEQU_CUFF;
            ITEM_KIND_TYPE[ITEM_KIND_PETEQU][ITEM_TYPE_PETEQU_DRAGON1] = ITEM_TYPE_PETEQU_DRAGON1;
            ITEM_KIND_TYPE[ITEM_KIND_PETEQU][ITEM_TYPE_PETEQU_DRAGON2] = ITEM_TYPE_PETEQU_DRAGON2;
            ACHI_KIND_NAME[ACHI_KIND_CHAR] = Language.GAMEPREDEF_S[423];
            ACHI_KIND_NAME[ACHI_KIND_PET] = Language.GAMEPREDEF_S[424];
            ACHI_KIND_NAME[ACHI_KIND_IM] = Language.GAMEPREDEF_S[425];
            ACHI_KIND_NAME[ACHI_KIND_PVP] = Language.GAMEPREDEF_S[426];
            ACHI_KIND_NAME[ACHI_KIND_PVE] = Language.GAMEPREDEF_S[427];
            ACHI_KIND_NAME[ACHI_KIND_LIFE] = Language.GAMEPREDEF_S[428];
            ACHI_KIND_TYPE[ACHI_KIND_CHAR] = {};
            ACHI_KIND_TYPE[ACHI_KIND_CHAR][ACHI_TYPE_CHAR_LEVEL] = ACHI_TYPE_CHAR_LEVEL;
            ACHI_KIND_TYPE[ACHI_KIND_CHAR][ACHI_TYPE_CHAR_SKILL] = ACHI_TYPE_CHAR_SKILL;
            ACHI_KIND_TYPE[ACHI_KIND_CHAR][ACHI_TYPE_CHAR_TRAINING] = ACHI_TYPE_CHAR_TRAINING;
            ACHI_KIND_TYPE[ACHI_KIND_CHAR][ACHI_TYPE_CHAR_FORTUNE] = ACHI_TYPE_CHAR_FORTUNE;
            ACHI_KIND_TYPE[ACHI_KIND_CHAR][ACHI_TYPE_CHAR_EQUIP] = ACHI_TYPE_CHAR_EQUIP;
            ACHI_KIND_TYPE[ACHI_KIND_CHAR][ACHI_TYPE_CHAR_PROPERTY] = ACHI_TYPE_CHAR_PROPERTY;
            ACHI_KIND_TYPE[ACHI_KIND_CHAR][ACHI_TYPE_CHAR_TITLE] = ACHI_TYPE_CHAR_TITLE;
            ACHI_KIND_TYPE[ACHI_KIND_CHAR][ACHI_TYPE_CHAR_OTHER] = ACHI_TYPE_CHAR_OTHER;
            ACHI_KIND_TYPE[ACHI_KIND_CHAR][ACHI_TYPE_CHAR_FAIRY] = ACHI_TYPE_CHAR_FAIRY;
            ACHI_TYPE_NAME[ACHI_TYPE_CHAR_LEVEL] = Language.GAMEPREDEF_S[429];
            ACHI_TYPE_NAME[ACHI_TYPE_CHAR_SKILL] = Language.GAMEPREDEF_S[430];
            ACHI_TYPE_NAME[ACHI_TYPE_CHAR_TRAINING] = Language.GAMEPREDEF_S[431];
            ACHI_TYPE_NAME[ACHI_TYPE_CHAR_FORTUNE] = Language.GAMEPREDEF_S[432];
            ACHI_TYPE_NAME[ACHI_TYPE_CHAR_EQUIP] = Language.GAMEPREDEF_S[433];
            ACHI_TYPE_NAME[ACHI_TYPE_CHAR_PROPERTY] = Language.GAMEPREDEF_S[434];
            ACHI_TYPE_NAME[ACHI_TYPE_CHAR_TITLE] = Language.GAMEPREDEF_S[435];
            ACHI_TYPE_NAME[ACHI_TYPE_CHAR_OTHER] = Language.GAMEPREDEF_S[436];
            ACHI_TYPE_NAME[ACHI_TYPE_CHAR_FAIRY] = Language.GAMEPREDEF_S[517];
            ACHI_KIND_TYPE[ACHI_KIND_PET] = {};
            ACHI_KIND_TYPE[ACHI_KIND_PET][ACHI_TYPE_PET_COLLECTION] = ACHI_TYPE_PET_COLLECTION;
            ACHI_KIND_TYPE[ACHI_KIND_PET][ACHI_TYPE_PET_TRAINING] = ACHI_TYPE_PET_TRAINING;
            ACHI_KIND_TYPE[ACHI_KIND_PET][ACHI_TYPE_PET_OTHER] = ACHI_TYPE_PET_OTHER;
            ACHI_KIND_TYPE[ACHI_KIND_PET][ACHI_TYPE_PET_EVOLUTION] = ACHI_TYPE_PET_EVOLUTION;
            ACHI_TYPE_NAME[ACHI_TYPE_PET_COLLECTION] = Language.GAMEPREDEF_S[437];
            ACHI_TYPE_NAME[ACHI_TYPE_PET_TRAINING] = Language.GAMEPREDEF_S[438];
            ACHI_TYPE_NAME[ACHI_TYPE_PET_OTHER] = Language.GAMEPREDEF_S[436];
            ACHI_TYPE_NAME[ACHI_TYPE_PET_EVOLUTION] = Language.GAMEPREDEF_S[575];
            ACHI_KIND_TYPE[ACHI_KIND_IM] = {};
            ACHI_KIND_TYPE[ACHI_KIND_IM][ACHI_TYPE_IM_FRIEND] = ACHI_TYPE_IM_FRIEND;
            ACHI_KIND_TYPE[ACHI_KIND_IM][ACHI_TYPE_IM_MENTOR] = ACHI_TYPE_IM_MENTOR;
            ACHI_KIND_TYPE[ACHI_KIND_IM][ACHI_TYPE_IM_GUILD] = ACHI_TYPE_IM_GUILD;
            ACHI_KIND_TYPE[ACHI_KIND_IM][ACHI_TYPE_IM_COUPLE] = ACHI_TYPE_IM_COUPLE;
            ACHI_KIND_TYPE[ACHI_KIND_IM][ACHI_TYPE_IM_OHTER] = ACHI_TYPE_IM_OHTER;
            ACHI_TYPE_NAME[ACHI_TYPE_IM_FRIEND] = Language.GAMEPREDEF_S[439];
            ACHI_TYPE_NAME[ACHI_TYPE_IM_MENTOR] = Language.GAMEPREDEF_S[440];
            ACHI_TYPE_NAME[ACHI_TYPE_IM_GUILD] = Language.GAMEPREDEF_S[441];
            ACHI_TYPE_NAME[ACHI_TYPE_IM_COUPLE] = Language.GAMEPREDEF_S[442];
            ACHI_TYPE_NAME[ACHI_TYPE_IM_OHTER] = Language.GAMEPREDEF_S[436];
            ACHI_KIND_TYPE[ACHI_KIND_PVP] = {};
            ACHI_KIND_TYPE[ACHI_KIND_PVP][ACHI_TYPE_PVP_DGFIGHT] = ACHI_TYPE_PVP_DGFIGHT;
            ACHI_KIND_TYPE[ACHI_KIND_PVP][ACHI_TYPE_PVP_CROSSBATTLE] = ACHI_TYPE_PVP_CROSSBATTLE;
            ACHI_KIND_TYPE[ACHI_KIND_PVP][ACHI_TYPE_PVP_OTHER] = ACHI_TYPE_PVP_OTHER;
            ACHI_TYPE_NAME[ACHI_TYPE_PVP_DGFIGHT] = Language.GAMEPREDEF_S[443];
            ACHI_TYPE_NAME[ACHI_TYPE_PVP_CROSSBATTLE] = Language.GAMEPREDEF_S[444];
            ACHI_TYPE_NAME[ACHI_TYPE_PVP_OTHER] = Language.GAMEPREDEF_S[436];
            ACHI_KIND_TYPE[ACHI_KIND_PVE] = {};
            ACHI_KIND_TYPE[ACHI_KIND_PVE][ACHI_TYPE_PVE_KILL] = ACHI_TYPE_PVE_KILL;
            ACHI_KIND_TYPE[ACHI_KIND_PVE][ACHI_TYPE_PVE_COPY] = ACHI_TYPE_PVE_COPY;
            ACHI_KIND_TYPE[ACHI_KIND_PVE][ACHI_TYPE_PVE_ACTIVE] = ACHI_TYPE_PVE_ACTIVE;
            ACHI_KIND_TYPE[ACHI_KIND_PVE][ACHI_TYPE_PVE_QUEST] = ACHI_TYPE_PVE_QUEST;
            ACHI_KIND_TYPE[ACHI_KIND_PVE][ACHI_TYPE_PVE_CONS] = ACHI_TYPE_PVE_CONS;
            ACHI_KIND_TYPE[ACHI_KIND_PVE][ACHI_TYPE_PVE_HULA] = ACHI_TYPE_PVE_HULA;
            ACHI_KIND_TYPE[ACHI_KIND_PVE][ACHI_TYPE_PVE_STH] = ACHI_TYPE_PVE_STH;
            ACHI_TYPE_NAME[ACHI_TYPE_PVE_KILL] = Language.GAMEPREDEF_S[446];
            ACHI_TYPE_NAME[ACHI_TYPE_PVE_COPY] = Language.GAMEPREDEF_S[447];
            ACHI_TYPE_NAME[ACHI_TYPE_PVE_ACTIVE] = Language.GAMEPREDEF_S[448];
            ACHI_TYPE_NAME[ACHI_TYPE_PVE_QUEST] = Language.GAMEPREDEF_S[449];
            ACHI_TYPE_NAME[ACHI_TYPE_PVE_CONS] = Language.GAMEPREDEF_S[510];
            ACHI_TYPE_NAME[ACHI_TYPE_PVE_HULA] = Language.GAMEPREDEF_S[584];
            ACHI_TYPE_NAME[ACHI_TYPE_PVE_STH] = Language.GAMEPREDEF_S[591];
            ACHI_KIND_TYPE[ACHI_KIND_LIFE] = {};
            ACHI_KIND_TYPE[ACHI_KIND_LIFE][ACHI_TYPE_LIFE_COOK] = ACHI_TYPE_LIFE_COOK;
            ACHI_KIND_TYPE[ACHI_KIND_LIFE][ACHI_TYPE_LIFE_HERB] = ACHI_TYPE_LIFE_HERB;
            ACHI_KIND_TYPE[ACHI_KIND_LIFE][ACHI_TYPE_LIFE_FISHING] = ACHI_TYPE_LIFE_FISHING;
            ACHI_KIND_TYPE[ACHI_KIND_LIFE][ACHI_TYPE_LIFE_PRODUCT] = ACHI_TYPE_LIFE_PRODUCT;
            ACHI_KIND_TYPE[ACHI_KIND_LIFE][ACHI_TYPE_LIFE_PLANT] = ACHI_TYPE_LIFE_PLANT;
            ACHI_KIND_TYPE[ACHI_KIND_LIFE][ACHI_TYPE_LIFE_OTHER] = ACHI_TYPE_LIFE_OTHER;
            ACHI_KIND_TYPE[ACHI_KIND_LIFE][ACHI_TYPE_LIFE_FARM] = ACHI_TYPE_LIFE_FARM;
            ACHI_TYPE_NAME[ACHI_TYPE_LIFE_COOK] = Language.GAMEPREDEF_S[450];
            ACHI_TYPE_NAME[ACHI_TYPE_LIFE_HERB] = Language.GAMEPREDEF_S[451];
            ACHI_TYPE_NAME[ACHI_TYPE_LIFE_FISHING] = Language.GAMEPREDEF_S[452];
            ACHI_TYPE_NAME[ACHI_TYPE_LIFE_PRODUCT] = Language.GAMEPREDEF_S[453];
            ACHI_TYPE_NAME[ACHI_TYPE_LIFE_PLANT] = Language.GAMEPREDEF_S[454];
            ACHI_TYPE_NAME[ACHI_TYPE_LIFE_OTHER] = Language.GAMEPREDEF_S[436];
            ACHI_TYPE_NAME[ACHI_TYPE_LIFE_FARM] = Language.GAMEPREDEF_S[497];
            ITEM_KIND_TYPE[ITEM_KIND_MAGICWEAPON] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_MAIN_MAGICWEAPON] = Language.GAMEPREDEF_S[381];
            ITEM_TYPE_NAME[ITEM_TYPE_SUB_MAGICWEAPON] = Language.GAMEPREDEF_S[382];
            ITEM_KIND_TYPE[ITEM_KIND_MAGICWEAPON][ITEM_TYPE_MAIN_MAGICWEAPON] = ITEM_TYPE_MAIN_MAGICWEAPON;
            ITEM_KIND_TYPE[ITEM_KIND_MAGICWEAPON][ITEM_TYPE_SUB_MAGICWEAPON] = ITEM_TYPE_SUB_MAGICWEAPON;
            ITEM_KIND_TYPE[ITEM_KIND_FLYER] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_FLYER_SUBTYPE] = Language.GAMEPREDEF_S[383];
            ITEM_KIND_TYPE[ITEM_KIND_FLYER][ITEM_TYPE_FLYER_SUBTYPE] = ITEM_TYPE_FLYER_SUBTYPE;
            ITEM_KIND_TYPE[ITEM_KIND_DRESS] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_DRESS_SUBTYPE] = Language.GAMEPREDEF_S[390];
            ITEM_KIND_TYPE[ITEM_KIND_DRESS][ITEM_TYPE_DRESS_SUBTYPE] = ITEM_TYPE_DRESS_SUBTYPE;
            ITEM_KIND_TYPE[ITEM_KIND_GATHER] = {};
            ITEM_TYPE_NAME[ITEM_TYPE_GATHER_GLOVE] = Language.GAMEPREDEF_S[367];
            ITEM_TYPE_NAME[ITEM_TYPE_GATHER_ROD] = Language.GAMEPREDEF_S[395];
            ITEM_KIND_TYPE[ITEM_KIND_GATHER][ITEM_TYPE_GATHER_GLOVE] = ITEM_TYPE_GATHER_GLOVE;
            ITEM_KIND_TYPE[ITEM_KIND_GATHER][ITEM_TYPE_GATHER_ROD] = ITEM_TYPE_GATHER_ROD;
            CREATURE_CLASS_NAME[CREATURE_CLASS_HUMAN] = Language.GAMEPREDEF_S[224];
            CREATURE_CLASS_NAME[CREATURE_CLASS_MONSTER] = Language.GAMEPREDEF_S[225];
            CREATURE_CLASS_NAME[CREATURE_CLASS_PLANT] = Language.GAMEPREDEF_S[226];
            CREATURE_CLASS_NAME[CREATURE_CLASS_MACHINE] = Language.GAMEPREDEF_S[227];
            CREATURE_CLASS_NAME[CREATURE_CLASS_DEVIL] = Language.GAMEPREDEF_S[228];
            CREATURE_CLASS_NAME[CREATURE_CLASS_DRAGON] = Language.GAMEPREDEF_S[229];
            CREATURE_CLASS_NAME[CREATURE_CLASS_BOSS] = Language.GAMEPREDEF_S[230];
            CREATURE_CLASS_INFO[CREATURE_CLASS_HUMAN] = Language.GAMEPREDEF_S[231];
            CREATURE_CLASS_INFO[CREATURE_CLASS_MONSTER] = Language.GAMEPREDEF_S[232];
            CREATURE_CLASS_INFO[CREATURE_CLASS_PLANT] = Language.GAMEPREDEF_S[233];
            CREATURE_CLASS_INFO[CREATURE_CLASS_MACHINE] = Language.GAMEPREDEF_S[234];
            CREATURE_CLASS_INFO[CREATURE_CLASS_DEVIL] = Language.GAMEPREDEF_S[235];
            CREATURE_CLASS_INFO[CREATURE_CLASS_DRAGON] = Language.GAMEPREDEF_S[236];
            CREATURE_CLASS_INFO[CREATURE_CLASS_BOSS] = Language.GAMEPREDEF_S[237];
            ELEMENT_NAME[0] = Language.GAMEPREDEF_S[241];
            ELEMENT_NAME[ELEMENT_LIGHT] = Language.GAMEPREDEF_S[242];
            ELEMENT_NAME[ELEMENT_DARK] = Language.GAMEPREDEF_S[243];
            ELEMENT_NAME[ELEMENT_WIND] = Language.GAMEPREDEF_S[244];
            ELEMENT_NAME[ELEMENT_THUNDER] = Language.GAMEPREDEF_S[245];
            ELEMENT_NAME[ELEMENT_WATER] = Language.GAMEPREDEF_S[246];
            ELEMENT_NAME[ELEMENT_FIRE] = Language.GAMEPREDEF_S[247];
            ELEMENT_INFO[0] = Language.GAMEPREDEF_S[248];
            ELEMENT_INFO[ELEMENT_LIGHT] = Language.GAMEPREDEF_S[249];
            ELEMENT_INFO[ELEMENT_DARK] = Language.GAMEPREDEF_S[250];
            ELEMENT_INFO[ELEMENT_WIND] = Language.GAMEPREDEF_S[251];
            ELEMENT_INFO[ELEMENT_THUNDER] = Language.GAMEPREDEF_S[252];
            ELEMENT_INFO[ELEMENT_WATER] = Language.GAMEPREDEF_S[253];
            ELEMENT_INFO[ELEMENT_FIRE] = Language.GAMEPREDEF_S[254];
            EMOTION_CODE["/no"] = 2110200000001;
            EMOTION_CODE["/pig"] = 2110200000002;
            EMOTION_CODE["/yes"] = 2110200000003;
            EMOTION_CODE["/heart"] = 2110200000004;
            EMOTION_CODE["/icy"] = 2110200000005;
            EMOTION_CODE["/shit"] = 2110200000006;
            EMOTION_CODE["/laugh"] = 2110200000007;
            EMOTION_CODE["/devil"] = 2110200000008;
            EMOTION_CODE["/daze"] = 2110200000009;
            EMOTION_CODE["/face"] = 2110200000010;
            EMOTION_CODE["/shy"] = 2110200000011;
            EMOTION_CODE["/tear"] = 2110200000012;
            EMOTION_CODE["/distress"] = 2110200000013;
            EMOTION_CODE["/excite"] = 2110200000014;
            EMOTION_CODE["/anger"] = 2110200000015;
            EMOTION_CODE["/depress"] = 2110200000016;
            EMOTION_CODE["/sigh"] = 2110200000017;
            EMOTION_CODE["/smile"] = 2110200000018;
            EMOTION_CODE["/shock"] = 2110200000019;
            EMOTION_CODE["/cry"] = 2110200000020;
            EMOTION_CODE["/mess"] = 2110200000021;
            EMOTION_CODE["/bnhh"] = 2110200000022;
            EMOTION_CODE["/xfmm"] = 2110200000023;
            EQUIPT_PROP_NAME[EQUIPT_PROP_HP] = Language.GAMEPREDEF_S[0xFF];
            EQUIPT_PROP_NAME[EQUIPT_PROP_MP] = Language.GAMEPREDEF_S[0x0100];
            EQUIPT_PROP_NAME[EQUIPT_PROP_SP] = Language.GAMEPREDEF_S[0x0101];
            EQUIPT_PROP_NAME[EQUIPT_PROP_ATTACK] = Language.GAMEPREDEF_S[258];
            EQUIPT_PROP_NAME[EQUIPT_PROP_MATTACK] = Language.GAMEPREDEF_S[259];
            EQUIPT_PROP_NAME[EQUIPT_PROP_DEFENCE] = Language.GAMEPREDEF_S[260];
            EQUIPT_PROP_NAME[EQUIPT_PROP_MDEFENCE] = Language.GAMEPREDEF_S[261];
            EQUIPT_PROP_NAME[EQUIPT_PROP_HIT] = Language.GAMEPREDEF_S[262];
            EQUIPT_PROP_NAME[EQUIPT_PROP_DODGE] = Language.GAMEPREDEF_S[263];
            EQUIPT_PROP_NAME[EQUIPT_PROP_COUNTER] = Language.GAMEPREDEF_S[264];
            EQUIPT_PROP_NAME[EQUIPT_PROP_SPEED] = Language.GAMEPREDEF_S[265];
            EQUIPT_PROP_NAME[EQUIPT_PROP_COMBO] = Language.GAMEPREDEF_S[266];
            EQUIPT_PROP_NAME[EQUIPT_PROP_CRITICAL] = Language.GAMEPREDEF_S[267];
            EQUIPT_PROP_NAME[EQUIPT_PROP_DEFY] = Language.GAMEPREDEF_S[268];
            EQUIPT_PROP_NAME[EQUIPT_PROP_STRENGTH] = Language.GAMEPREDEF_S[277];
            EQUIPT_PROP_NAME[EQUIPT_PROP_STAMINA] = Language.GAMEPREDEF_S[279];
            EQUIPT_PROP_NAME[EQUIPT_PROP_INTELLIGENCE] = Language.GAMEPREDEF_S[280];
            EQUIPT_PROP_NAME[EQUIPT_PROP_ENERGY] = Language.GAMEPREDEF_S[281];
            EQUIPT_PROP_NAME[EQUIPT_PROP_HP_PER] = Language.GAMEPREDEF_S[0xFF];
            EQUIPT_PROP_NAME[EQUIPT_PROP_MP_PER] = Language.GAMEPREDEF_S[0x0100];
            EQUIPT_PROP_NAME[EQUIPT_PROP_RESICRITICAL] = Language.GAMEPREDEF_S[558];
            EQUIPT_PROP_NAME[EQUIPT_PROP_RESIDEBUFF] = Language.GAMEPREDEF_S[589];
            EQUIPT_PROP_NAME[EQUIPT_PROP_RESIDEFY] = Language.GAMEPREDEF_S[590];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_HP] = Language.GAMEPREDEF_S[0xFF];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_HP_PER] = Language.GAMEPREDEF_S[0xFF];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_MP] = Language.GAMEPREDEF_S[0x0100];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_MP_PER] = Language.GAMEPREDEF_S[0x0100];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_ATTACK] = Language.GAMEPREDEF_S[258];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_ATTACK_PER] = Language.GAMEPREDEF_S[258];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_MATTACK] = Language.GAMEPREDEF_S[259];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_MATTACK_PER] = Language.GAMEPREDEF_S[259];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_DEFENCE] = Language.GAMEPREDEF_S[260];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_DEFENCE_PER] = Language.GAMEPREDEF_S[260];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_MDEFENCE] = Language.GAMEPREDEF_S[261];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_MDEFENCE_PER] = Language.GAMEPREDEF_S[261];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_HIT] = Language.GAMEPREDEF_S[262];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_DODGE] = Language.GAMEPREDEF_S[263];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_COUNTER] = Language.GAMEPREDEF_S[264];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_SPEED] = Language.GAMEPREDEF_S[265];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_SPEED_PER] = Language.GAMEPREDEF_S[265];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_COMBO] = Language.GAMEPREDEF_S[266];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_CRITICAL] = Language.GAMEPREDEF_S[267];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_DEFY] = Language.GAMEPREDEF_S[268];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_DEBUFFSUCCRATE] = Language.GAMEPREDEF_S[387];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_RESICRITICAL] = Language.GAMEPREDEF_S[388];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_RESIDEBUFF] = Language.GAMEPREDEF_S[589];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_RESIDEFY] = Language.GAMEPREDEF_S[590];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_ENHPHYHURT] = Language.GAMEPREDEF_S[597];
            EQUSUIT_PROP_NAME[EQUSUIT_PROP_CRITICAL_DAMAGE] = Language.GAMEPREDEF_S[598];
            EQUIPT_QUALITY[-1] = 1;
            EQUIPT_QUALITY[0] = 1;
            EQUIPT_QUALITY[1] = 1.05;
            EQUIPT_QUALITY[2] = 1.1;
            EQUIPT_QUALITY[3] = 1.15;
            EQUIPT_QUALITY[4] = 1.2;
            EQUIPT_QUALITY[5] = 1.25;
            EQUIPT_QUALITY[6] = 1.3;
            EQUIPT_QUALITY[7] = 1.35;
            EQUIPT_QUALITY[8] = 1.4;
            EQUIPT_QUALITY[9] = 1.45;
            EQUIPT_QUALITY[10] = 1.5;
            EQUIPT_QUALITY[11] = 1.6;
            EQUIPT_QUALITY[12] = 1.7;
            EQUIPT_QUALITY[13] = 1.8;
            EQUIPT_QUALITY[14] = 1.9;
            EQUIPT_QUALITY[15] = 2.1;
            EQUIPT_QUALITY[16] = 2.3;
            EQUIPT_QUALITY[17] = 2.5;
            EQUIPT_QUALITY[18] = 2.7;
            EQUIPT_QUALITY[19] = 2.9;
            EQUIPT_QUALITY[20] = 3.5;
            EQUIPT_ACTIVE_NAME[EQUIPT_ACTIVE_ATTACK] = Language.GAMEPREDEF_S[269];
            EQUIPT_ACTIVE_NAME[EQUIPT_ACTIVE_MATTACK] = Language.GAMEPREDEF_S[270];
            EQUIPT_ACTIVE_NAME[EQUIPT_ACTIVE_CRITICAL] = Language.GAMEPREDEF_S[271];
            EQUIPT_ACTIVE_NAME[EQUIPT_ACTIVE_DEFY] = Language.GAMEPREDEF_S[272];
            EQUIPT_ACTIVE_NAME[EQUIPT_ACTIVE_REDUCEHURT1] = Language.GAMEPREDEF_S[273];
            EQUIPT_ACTIVE_NAME[EQUIPT_ACTIVE_REDUCEHURT2] = Language.GAMEPREDEF_S[274];
            EQUIPT_ACTIVE_NAME[EQUIPT_ACTIVE_REDUCEHURT3] = Language.GAMEPREDEF_S[275];
            EQUIPT_ACTIVE_NAME[EQUIPT_ACTIVE_HP] = Language.GAMEPREDEF_S[276];
            JEWEL_PROP_NAME[JEWEL_PROP_STRENGTH] = Language.GAMEPREDEF_S[277];
            JEWEL_PROP_NAME[JEWEL_PROP_AGILITH] = Language.GAMEPREDEF_S[278];
            JEWEL_PROP_NAME[JEWEL_PROP_STAMINA] = Language.GAMEPREDEF_S[279];
            JEWEL_PROP_NAME[JEWEL_PROP_INTELLIGENCE] = Language.GAMEPREDEF_S[280];
            JEWEL_PROP_NAME[JEWEL_PROP_ENERGY] = Language.GAMEPREDEF_S[281];
            JEWEL_PROP_NAME[JEWEL_PROP_LUCK] = Language.GAMEPREDEF_S[282];
            JEWEL_PROP_NAME[JEWEL_PROP_RESIDIZZY] = Language.GAMEPREDEF_S[283];
            JEWEL_PROP_NAME[JEWEL_PROP_RESICONFUSION] = Language.GAMEPREDEF_S[284];
            JEWEL_PROP_NAME[JEWEL_PROP_RESISLEEP] = Language.GAMEPREDEF_S[285];
            JEWEL_PROP_NAME[JEWEL_PROP_RESIPOISON] = Language.GAMEPREDEF_S[286];
            JEWEL_PROP_NAME[JEWEL_PROP_RESIFIRE] = Language.GAMEPREDEF_S[287];
            JEWEL_PROP_NAME[JEWEL_PROP_RESIICE] = Language.GAMEPREDEF_S[288];
            JEWEL_PROP_NAME[JEWEL_PROP_RESILIGHT] = Language.GAMEPREDEF_S[289];
            JEWEL_PROP_NAME[JEWEL_PROP_RESIRAGE] = Language.GAMEPREDEF_S[368];
            FEATHER_PROP_NAME[FEATHER_PROP_ATTACK] = Language.GAMEPREDEF_S[468];
            FEATHER_PROP_NAME[FEATHER_PROP_MATTACK] = Language.GAMEPREDEF_S[469];
            FEATHER_PROP_NAME[FEATHER_PROP_HIT] = Language.GAMEPREDEF_S[470];
            FEATHER_PROP_NAME[FEATHER_PROP_CRITICAL] = Language.GAMEPREDEF_S[471];
            FEATHER_PROP_NAME[FEATHER_PROP_DEFENCE] = Language.GAMEPREDEF_S[472];
            FEATHER_PROP_NAME[FEATHER_PROP_RESICRITICAL] = Language.GAMEPREDEF_S[473];
            FEATHER_PROP_NAME[FEATHER_PROP_HP] = Language.GAMEPREDEF_S[474];
            FEATHER_PROP_NAME[FEATHER_PROP_MP] = Language.GAMEPREDEF_S[475];
            FEATHER_PROP_NAME[FEATHER_PROP_SPEED] = Language.GAMEPREDEF_S[476];
            FEATHER_PROP_NAME[FEATHER_PROP_REBORN] = Language.GAMEPREDEF_S[477];
            FEATHER_PROP_NAME[FEATHER_PROP_CONFUSION] = Language.GAMEPREDEF_S[478];
            FEATHER_PROP_NAME[FEATHER_PROP_DIZZY] = Language.GAMEPREDEF_S[479];
            FEATHER_PROP_NAME[FEATHER_PROP_POISON] = Language.GAMEPREDEF_S[480];
            FEATHER_PROP_NAME[FEATHER_PROP_RAGE] = Language.GAMEPREDEF_S[481];
            FEATHER_PROP_NAME[FEATHER_PROP_SLEEP] = Language.GAMEPREDEF_S[482];
            FEATHER_PROP_NAME[FEATHER_PROP_LIGHT] = Language.GAMEPREDEF_S[483];
            FEATHER_PROP_NAME[FEATHER_PROP_RESICONFUSION] = Language.GAMEPREDEF_S[484];
            FEATHER_PROP_NAME[FEATHER_PROP_RESIDIZZY] = Language.GAMEPREDEF_S[485];
            FEATHER_PROP_NAME[FEATHER_PROP_RESIPOISON] = Language.GAMEPREDEF_S[486];
            FEATHER_PROP_NAME[FEATHER_PROP_RESIRAGE] = Language.GAMEPREDEF_S[487];
            FEATHER_PROP_NAME[FEATHER_PROP_RESISLEEP] = Language.GAMEPREDEF_S[488];
            FEATHER_PROP_NAME[FEATHER_PROP_RESILIGHT] = Language.GAMEPREDEF_S[489];
            PRE_EQU_NAME[-1] = "";
            PRE_EQU_NAME[0] = "";
            PRE_EQU_NAME[1] = Language.GAMEPREDEF_S[290];
            PRE_EQU_NAME[2] = Language.GAMEPREDEF_S[291];
            PRE_EQU_NAME[3] = Language.GAMEPREDEF_S[292];
            PRE_EQU_NAME[4] = Language.GAMEPREDEF_S[293];
            PRE_EQU_NAME[5] = Language.GAMEPREDEF_S[294];
            PRE_EQU_NAME[11] = "";
            EQUIP_FUNCTYPE[1] = EQUIP_TYPE_DEFENCE;
            EQUIP_FUNCTYPE[2] = EQUIP_TYPE_DEFENCE;
            EQUIP_FUNCTYPE[3] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[4] = EQUIP_TYPE_DEFENCE;
            EQUIP_FUNCTYPE[5] = EQUIP_TYPE_DEFENCE;
            EQUIP_FUNCTYPE[6] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[7] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[8] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[9] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[10] = EQUIP_TYPE_DEFENCE;
            EQUIP_FUNCTYPE[11] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[12] = EQUIP_TYPE_DEFENCE;
            EQUIP_FUNCTYPE[50] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[51] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[52] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[53] = EQUIP_TYPE_DEFENCE;
            EQUIP_FUNCTYPE[54] = EQUIP_TYPE_DEFENCE;
            EQUIP_FUNCTYPE[55] = EQUIP_TYPE_DEFENCE;
            EQUIP_FUNCTYPE[56] = EQUIP_TYPE_ATTACK;
            EQUIP_FUNCTYPE[57] = EQUIP_TYPE_DEFENCE;
            EQUIP_POSITION[1] = Language.GAMEPREDEF_S[300];
            EQUIP_POSITION[2] = Language.GAMEPREDEF_S[301];
            EQUIP_POSITION[3] = Language.GAMEPREDEF_S[302];
            EQUIP_POSITION[4] = Language.GAMEPREDEF_S[303];
            EQUIP_POSITION[5] = Language.GAMEPREDEF_S[304];
            EQUIP_POSITION[6] = Language.GAMEPREDEF_S[305];
            EQUIP_POSITION[7] = Language.GAMEPREDEF_S[306];
            EQUIP_POSITION[8] = Language.GAMEPREDEF_S[307];
            EQUIP_POSITION[9] = Language.GAMEPREDEF_S[308];
            EQUIP_POSITION[10] = Language.GAMEPREDEF_S[309];
            EQUIP_POSITION[11] = Language.GAMEPREDEF_S[310];
            EQUIP_POSITION[12] = Language.GAMEPREDEF_S[311];
            EQUIP_POSITION[13] = Language.GAMEPREDEF_S[409];
            EQUIP_POSITION[14] = Language.GAMEPREDEF_S[383];
            EQUIP_POSITION[15] = Language.GAMEPREDEF_S[381];
            EQUIP_POSITION[16] = (Language.GAMEPREDEF_S[382] + "1");
            EQUIP_POSITION[17] = (Language.GAMEPREDEF_S[382] + "2");
            EQUIP_POSITION[18] = (Language.GAMEPREDEF_S[382] + "3");
            EQUIP_POSITION[19] = (Language.GAMEPREDEF_S[382] + "4");
            EQUIP_POSITION[20] = (Language.GAMEPREDEF_S[382] + "5");
            EQUIP_POSITION[21] = Language.GAMEPREDEF_S[390];
            EQUIP_POSITION[22] = Language.GAMEPREDEF_S[459];
            EQUIP_POSITION[50] = Language.GAMEPREDEF_S[371];
            EQUIP_POSITION[51] = Language.GAMEPREDEF_S[372];
            EQUIP_POSITION[52] = Language.GAMEPREDEF_S[373];
            EQUIP_POSITION[53] = Language.GAMEPREDEF_S[374];
            EQUIP_POSITION[54] = Language.GAMEPREDEF_S[375];
            EQUIP_POSITION[55] = Language.GAMEPREDEF_S[376];
            EQUIP_POSITION[56] = Language.GAMEPREDEF_S[377];
            EQUIP_POSITION[57] = Language.GAMEPREDEF_S[378];
            SKILL_AREA_TYPE[0] = "";
            SKILL_AREA_TYPE[1] = Language.GAMEPREDEF_S[312];
            SKILL_AREA_TYPE[2] = Language.GAMEPREDEF_S[313];
            SKILL_AREA_TYPE[3] = Language.GAMEPREDEF_S[314];
            SKILL_AREA_TYPE[4] = Language.GAMEPREDEF_S[315];
            SKILL_TYPE_NAME[SKILL_TYPE_CLOSE] = Language.GAMEPREDEF_S[320];
            SKILL_TYPE_NAME[SKILL_TYPE_REMOTE] = Language.GAMEPREDEF_S[321];
            SKILL_TYPE_NAME[SKILL_TYPE_MAGIC] = Language.GAMEPREDEF_S[322];
            SKILL_TYPE_NAME[SKILL_TYPE_MAGIC_BULLET] = Language.GAMEPREDEF_S[323];
            SKILL_TYPE_NAME[SKILL_TYPE_MAGIC_RECOVER] = Language.GAMEPREDEF_S[324];
            SKILL_TYPE_NAME[SKILL_TYPE_STATE_ADD] = Language.GAMEPREDEF_S[325];
            SKILL_TYPE_NAME[SKILL_TYPE_STATE_DEL] = Language.GAMEPREDEF_S[326];
            SKILL_TYPE_NAME[SKILL_TYPE_FUNC_HURT] = Language.GAMEPREDEF_S[327];
            SKILL_TYPE_NAME[SKILL_TYPE_FUNC_RECOVER] = Language.GAMEPREDEF_S[328];
            SKILL_TYPE_NAME[SKILL_TYPE_OTHER] = Language.GAMEPREDEF_S[329];
            SKILL_TYPE_NAME[SKILL_TYPE_DEFENDER] = Language.GAMEPREDEF_S[330];
            SKILL_TYPE_NAME[SKILL_TYPE_FISHING] = Language.GAMEPREDEF_S[404];
            SKILL_TYPE_NAME[SKILL_TYPE_PLANT] = Language.GAMEPREDEF_S[404];
            SKILL_TYPE_NAME[SKILL_TYPE_HERB] = Language.GAMEPREDEF_S[404];
            SKILL_TYPE_NAME[SKILL_TYPE_COOK] = Language.GAMEPREDEF_S[404];
            SKILL_TYPE_NAME[SKILL_TYPE_PHARMACY] = Language.GAMEPREDEF_S[404];
            SKILL_TYPE_NAME[SKILL_TYPE_HIDDEN_WEAPON] = Language.GAMEPREDEF_S[404];
            SKILL_TYPE_NAME[SKILL_TYPE_SEW] = Language.GAMEPREDEF_S[404];
            SKILL_USE_ENV[0] = "";
            SKILL_USE_ENV[1] = Language.GAMEPREDEF_S[331];
            SKILL_USE_ENV[2] = Language.GAMEPREDEF_S[332];
            SYSTEM_TIP[1] = SYSTEM_TIP_STR1.split("|");
            SYSTEM_TIP[2] = SYSTEM_TIP_STR2.split("|");
            SYSTEM_TIP[3] = SYSTEM_TIP_STR3.split("|");
            ADVANCED_JOIN_PROBABILITY[2] = {
                "4":50,
                "5":53,
                "6":58,
                "7":65,
                "8":74,
                "9":85,
                "10":100
            };
            ADVANCED_JOIN_PROBABILITY[3] = {
                "4":30,
                "5":33,
                "6":36,
                "7":40,
                "8":44,
                "9":49,
                "10":54,
                "11":60,
                "12":66,
                "13":73,
                "14":81,
                "15":90,
                "16":100
            };
            WING_ADVANCED_JOIN_RATE[2] = {
                "4":50,
                "5":53,
                "6":58,
                "7":65,
                "8":74,
                "9":85,
                "10":100
            };
            WING_ADVANCED_JOIN_RATE[3] = {
                "4":30,
                "5":33,
                "6":36,
                "7":40,
                "8":44,
                "9":49,
                "10":54,
                "11":60,
                "12":66,
                "13":73,
                "14":81,
                "15":90,
                "16":100
            };
            FARM_LVUP_CONFIG[1] = {
                "exp":60,
                "money":400000,
                "maxFarm":4,
                "lv":20
            };
            FARM_LVUP_CONFIG[2] = {
                "exp":240,
                "money":2600000,
                "maxFarm":6,
                "lv":50
            };
            FARM_LVUP_CONFIG[3] = {
                "exp":640,
                "money":11000000,
                "maxFarm":8,
                "lv":80
            };
            FARM_LVUP_CONFIG[4] = {
                "exp":1920,
                "money":42000000,
                "maxFarm":12,
                "lv":100
            };
            FARM_LVUP_CONFIG[5] = {
                "exp":1921,
                "money":42000000,
                "maxFarm":16,
                "lv":120
            };
            FARM_NUM_MONEY[0] = 0;
            FARM_NUM_MONEY[1] = 0;
            FARM_NUM_MONEY[2] = 30000;
            FARM_NUM_MONEY[3] = 60000;
            FARM_NUM_MONEY[4] = 120000;
            FARM_NUM_MONEY[5] = 210000;
            FARM_NUM_MONEY[6] = 330000;
            FARM_NUM_MONEY[7] = 480000;
            FARM_NUM_MONEY[8] = 660000;
            FARM_NUM_MONEY[9] = 960000;
            FARM_NUM_MONEY[10] = 1380000;
            FARM_NUM_MONEY[11] = 0x1D4C00;
            FARM_NUM_MONEY[12] = 2620000;
            FARM_NUM_MONEY[13] = 3480000;
            FARM_NUM_MONEY[14] = 4500000;
            FARM_NUM_MONEY[15] = 5680000;
            PM_CHAT_FLAG[0] = "";
            PM_CHAT_FLAG[1] = Language.PM_PANEL[21];
            PM_CHAT_FLAG[2] = Language.PM_PANEL[22];
            PM_CHAT_FLAG[3] = Language.PM_PANEL[23];
            PM_CHAT_FLAG[4] = Language.PM_PANEL[24];
            PM_CHAT_FLAG[5] = Language.PM_PANEL[25];
            PM_CHAT_FLAG[6] = Language.PM_PANEL[26];
            PM_CHAT_FLAG[7] = Language.PM_PANEL[27];
            PM_CHAT_FLAG[8] = Language.PM_PANEL[28];
            PM_CHAT_FLAG[9] = Language.PM_PANEL[29];
            PLAYER_PARBUFF_LEVEL_EXP[0] = 253;
            PLAYER_PARBUFF_LEVEL_EXP[1] = 753;
            PLAYER_PARBUFF_LEVEL_EXP[2] = 1495;
            PLAYER_PARBUFF_LEVEL_EXP[3] = 2474;
            PLAYER_PARBUFF_LEVEL_EXP[4] = 3684;
            PLAYER_PARBUFF_LEVEL_EXP[5] = 5122;
            PLAYER_PARBUFF_LEVEL_EXP[6] = 6782;
            PLAYER_PARBUFF_LEVEL_EXP[7] = 8659;
            PLAYER_PARBUFF_LEVEL_EXP[8] = 10750;
            PLAYER_PARBUFF_LEVEL_EXP[9] = 13050;
            PLAYER_PARBUFF_LEVEL_EXP[10] = 15555;
            PLAYER_PARBUFF_LEVEL_EXP[11] = 18261;
            PLAYER_PARBUFF_LEVEL_EXP[12] = 21164;
            PLAYER_PARBUFF_LEVEL_EXP[13] = 24260;
            PLAYER_PARBUFF_LEVEL_EXP[14] = 27546;
            PLAYER_PARBUFF_LEVEL_EXP[15] = 31017;
            PLAYER_PARBUFF_LEVEL_EXP[16] = 34672;
            PLAYER_PARBUFF_LEVEL_EXP[17] = 38505;
            PLAYER_PARBUFF_LEVEL_EXP[18] = 42514;
            PLAYER_PARBUFF_LEVEL_EXP[19] = 46696;
            PLAYER_PARBUFF_LEVEL_EXP[20] = 51047;
            PLAYER_PARBUFF_LEVEL_EXP[21] = 55565;
            PLAYER_PARBUFF_LEVEL_EXP[22] = 60247;
            PLAYER_PARBUFF_LEVEL_EXP[23] = 65089;
            PLAYER_PARBUFF_LEVEL_EXP[24] = 70089;
            PLAYER_PARBUFF_LEVEL_EXP[25] = 75244;
            PLAYER_PARBUFF_LEVEL_EXP[26] = 80552;
            PLAYER_PARBUFF_LEVEL_EXP[27] = 86009;
            PLAYER_PARBUFF_LEVEL_EXP[28] = 91614;
            PLAYER_PARBUFF_LEVEL_EXP[29] = 97364;
            PLAYER_PARBUFF_ADD_EXP[0] = 1;
            PLAYER_PARBUFF_ADD_EXP[1] = 2;
            PLAYER_PARBUFF_ADD_EXP[2] = 3;
            PLAYER_PARBUFF_ADD_EXP[3] = 4;
            PLAYER_PARBUFF_ADD_EXP[4] = 5;
            PLAYER_PARBUFF_ADD_EXP[5] = 6;
            PLAYER_PARBUFF_ADD_EXP[6] = 7;
            PLAYER_PARBUFF_ADD_EXP[7] = 8;
            PLAYER_PARBUFF_ADD_EXP[8] = 9;
            PLAYER_PARBUFF_ADD_EXP[9] = 9;
            PLAYER_PARBUFF_ADD_EXP[10] = 10;
            PLAYER_PARBUFF_ADD_EXP[11] = 10;
            PLAYER_PARBUFF_ADD_EXP[12] = 11;
            PLAYER_PARBUFF_ADD_EXP[13] = 11;
            PLAYER_PARBUFF_ADD_EXP[14] = 12;
            PLAYER_PARBUFF_ADD_EXP[15] = 12;
            PLAYER_PARBUFF_ADD_EXP[16] = 13;
            PLAYER_PARBUFF_ADD_EXP[17] = 13;
            PLAYER_PARBUFF_ADD_EXP[18] = 13;
            PLAYER_PARBUFF_ADD_EXP[19] = 14;
            PLAYER_PARBUFF_ADD_EXP[20] = 14;
            PLAYER_PARBUFF_ADD_EXP[21] = 14;
            PLAYER_PARBUFF_ADD_EXP[22] = 15;
            PLAYER_PARBUFF_ADD_EXP[23] = 15;
            PLAYER_PARBUFF_ADD_EXP[24] = 15;
            PLAYER_PARBUFF_ADD_EXP[25] = 16;
            PLAYER_PARBUFF_ADD_EXP[26] = 16;
            PLAYER_PARBUFF_ADD_EXP[27] = 16;
            PLAYER_PARBUFF_ADD_EXP[28] = 17;
            PLAYER_PARBUFF_ADD_EXP[29] = 17;
            PLAYER_PARBUFF_LEVEL_LIMIT[0] = 1;
            PLAYER_PARBUFF_LEVEL_LIMIT[1] = 2;
            PLAYER_PARBUFF_LEVEL_LIMIT[2] = 3;
            PLAYER_PARBUFF_LEVEL_LIMIT[3] = 4;
            PLAYER_PARBUFF_LEVEL_LIMIT[4] = 5;
            PLAYER_PARBUFF_LEVEL_LIMIT[5] = 6;
            PLAYER_PARBUFF_LEVEL_LIMIT[6] = 7;
            PLAYER_PARBUFF_LEVEL_LIMIT[7] = 8;
            PLAYER_PARBUFF_LEVEL_LIMIT[8] = 9;
            PLAYER_PARBUFF_LEVEL_LIMIT[9] = 9;
            PLAYER_PARBUFF_LEVEL_LIMIT[10] = 10;
            PLAYER_PARBUFF_LEVEL_LIMIT[11] = 10;
            PLAYER_PARBUFF_LEVEL_LIMIT[12] = 11;
            PLAYER_PARBUFF_LEVEL_LIMIT[13] = 11;
            PLAYER_PARBUFF_LEVEL_LIMIT[14] = 12;
            PLAYER_PARBUFF_LEVEL_LIMIT[15] = 12;
            PLAYER_PARBUFF_LEVEL_LIMIT[16] = 13;
            PLAYER_PARBUFF_LEVEL_LIMIT[17] = 13;
            PLAYER_PARBUFF_LEVEL_LIMIT[18] = 13;
            PLAYER_PARBUFF_LEVEL_LIMIT[19] = 14;
            PLAYER_PARBUFF_LEVEL_LIMIT[20] = 14;
            PLAYER_PARBUFF_LEVEL_LIMIT[21] = 14;
            PLAYER_PARBUFF_LEVEL_LIMIT[22] = 15;
            PLAYER_PARBUFF_LEVEL_LIMIT[23] = 15;
            PLAYER_PARBUFF_LEVEL_LIMIT[24] = 15;
            PLAYER_PARBUFF_LEVEL_LIMIT[25] = 16;
            PLAYER_PARBUFF_LEVEL_LIMIT[26] = 16;
            PLAYER_PARBUFF_LEVEL_LIMIT[27] = 16;
            PLAYER_PARBUFF_LEVEL_LIMIT[28] = 17;
            PLAYER_PARBUFF_LEVEL_LIMIT[29] = 17;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[0] = 0;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[1] = 6;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[2] = 18;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[3] = 36;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[4] = 59;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[5] = 87;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[6] = 121;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[7] = 159;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[8] = 202;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[9] = 250;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[10] = 302;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[11] = 359;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[12] = 420;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[13] = 485;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[14] = 553;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[15] = 625;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[16] = 701;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[17] = 780;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[18] = 862;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[19] = 947;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[20] = 1034;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[21] = 1125;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[22] = 1217;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[23] = 1312;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[24] = 1409;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[25] = 1508;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[26] = 1609;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[27] = 1712;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[28] = 1815;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[29] = 1920;
            PLAYER_PARBUFF_LEVEL_DEF_EFFECT[30] = 2026;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[0] = 0;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[1] = 6;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[2] = 18;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[3] = 36;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[4] = 59;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[5] = 87;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[6] = 121;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[7] = 159;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[8] = 202;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[9] = 250;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[10] = 302;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[11] = 359;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[12] = 420;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[13] = 485;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[14] = 553;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[15] = 625;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[16] = 701;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[17] = 780;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[18] = 862;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[19] = 947;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[20] = 1034;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[21] = 1125;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[22] = 1217;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[23] = 1312;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[24] = 1409;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[25] = 1508;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[26] = 1609;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[27] = 1712;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[28] = 1815;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[29] = 1920;
            PLAYER_PARBUFF_LEVEL_ATT_EFFECT[30] = 2026;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[0] = 0;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[1] = 6;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[2] = 18;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[3] = 36;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[4] = 59;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[5] = 87;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[6] = 121;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[7] = 159;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[8] = 202;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[9] = 250;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[10] = 302;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[11] = 359;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[12] = 420;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[13] = 485;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[14] = 553;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[15] = 625;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[16] = 701;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[17] = 780;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[18] = 862;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[19] = 947;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[20] = 1060;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[21] = 1173;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[22] = 1315;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[23] = 1493;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[24] = 1694;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[25] = 1927;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[26] = 2186;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[27] = 2485;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[28] = 2812;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[29] = 3150;
            PLAYER_PARBUFF_LEVEL_ATK_EFFECT[30] = 3500;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[0] = 0;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[1] = 6;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[2] = 18;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[3] = 36;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[4] = 59;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[5] = 87;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[6] = 121;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[7] = 159;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[8] = 202;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[9] = 250;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[10] = 302;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[11] = 359;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[12] = 420;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[13] = 485;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[14] = 553;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[15] = 625;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[16] = 701;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[17] = 780;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[18] = 862;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[19] = 947;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[20] = 1060;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[21] = 1173;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[22] = 1315;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[23] = 1493;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[24] = 1694;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[25] = 1927;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[26] = 2186;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[27] = 2485;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[28] = 2812;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[29] = 3150;
            PLAYER_PARBUFF_LEVEL_SPD_EFFECT[30] = 3500;
            MEDAL_PROP_NAME[MEDAL_PROP_HP] = Language.GAMEPREDEF_S[0xFF];
            MEDAL_PROP_NAME[MEDAL_PROP_MP] = Language.GAMEPREDEF_S[0x0100];
            MEDAL_PROP_NAME[MEDAL_PROP_SP] = Language.GAMEPREDEF_S[0x0101];
            MEDAL_PROP_NAME[MEDAL_PROP_ATTACK] = Language.GAMEPREDEF_S[258];
            MEDAL_PROP_NAME[MEDAL_PROP_MATTACK] = Language.GAMEPREDEF_S[259];
            MEDAL_PROP_NAME[MEDAL_PROP_DEFENCE] = Language.GAMEPREDEF_S[260];
            MEDAL_PROP_NAME[MEDAL_PROP_MDEFENCE] = Language.GAMEPREDEF_S[261];
            MEDAL_PROP_NAME[MEDAL_PROP_HIT] = Language.GAMEPREDEF_S[262];
            MEDAL_PROP_NAME[MEDAL_PROP_DODGE] = Language.GAMEPREDEF_S[263];
            MEDAL_PROP_NAME[MEDAL_PROP_COUNTER] = Language.GAMEPREDEF_S[264];
            MEDAL_PROP_NAME[MEDAL_PROP_SPEED] = Language.GAMEPREDEF_S[265];
            MEDAL_PROP_NAME[MEDAL_PROP_COMBO] = Language.GAMEPREDEF_S[266];
            MEDAL_PROP_NAME[MEDAL_PROP_CRITICAL] = Language.GAMEPREDEF_S[267];
            MEDAL_PROP_NAME[MEDAL_PROP_DEFY] = Language.GAMEPREDEF_S[268];
            MEDAL_PROP_NAME[MEDAL_PROP_REDUCEHURT1] = Language.GAMEPREDEF_S[564];
            MEDAL_PROP_NAME[MEDAL_PROP_REDUCEHURT2] = Language.GAMEPREDEF_S[565];
            MEDAL_PROP_NAME[MEDAL_PROP_RESIDIZZY] = Language.GAMEPREDEF_S[566];
            MEDAL_PROP_NAME[MEDAL_PROP_RESICONFUSION] = Language.GAMEPREDEF_S[567];
            MEDAL_PROP_NAME[MEDAL_PROP_RESISLEEP] = Language.GAMEPREDEF_S[568];
            MEDAL_PROP_NAME[MEDAL_PROP_RESIPOISON] = Language.GAMEPREDEF_S[569];
            MEDAL_PROP_NAME[MEDAL_PROP_RESIFIRE] = Language.GAMEPREDEF_S[570];
            MEDAL_PROP_NAME[MEDAL_PROP_RESIICE] = Language.GAMEPREDEF_S[571];
            MEDAL_PROP_NAME[MEDAL_PROP_RESILIGHT] = Language.GAMEPREDEF_S[572];
            MEDAL_PROP_NAME[MEDAL_PROP_RESICRITICAL] = Language.GAMEPREDEF_S[558];
            MEDAL_PROP_NAME[MEDAL_PROP_DEBUFFSUCCRATE] = Language.GAMEPREDEF_S[563];
            MEDAL_PROP_NAME[MEDAL_PROP_REBORN] = Language.GAMEPREDEF_S[477];
            MEDAL_PROP_NAME[MEDAL_PROP_DEFDEBUFF] = Language.GAMEPREDEF_S[562];
            MEDAL_PROP_NAME[MEDAL_PROP_PRADEF] = Language.GAMEPREDEF_S[573];
            MEDAL_PROP_NAME[MEDAL_PROP_PRAMAGDEF] = Language.GAMEPREDEF_S[574];
            MEDAL_PROP_NAME[MEDAL_PROP_REDUDEFY] = Language.GAMEPREDEF_S[578];
            MEDAL_PROP_NAME[MEDAL_PROP_ENHPHYHURT] = Language.GAMEPREDEF_S[579];
            MEDAL_PROP_NAME[MEDAL_PROP_ENHMAGICHURT] = Language.GAMEPREDEF_S[580];
            PET_KIND_NAME[PET_KIND_PEOPLE] = Language.PET_HANDBOOK_PANEL_U[12];
            PET_KIND_NAME[PET_KIND_ANIMAL] = Language.PET_HANDBOOK_PANEL_U[13];
            PET_KIND_NAME[PET_KIND_PLANT] = Language.PET_HANDBOOK_PANEL_U[14];
            PET_KIND_NAME[PET_KIND_MACHINE] = Language.PET_HANDBOOK_PANEL_U[15];
            PET_KIND_NAME[PET_KIND_DEVIL] = Language.PET_HANDBOOK_PANEL_U[16];
            PET_KIND_NAME[PET_KIND_DRAGON] = Language.PET_HANDBOOK_PANEL_U[17];
            PET_KIND_NAME[PET_KIND_BOSS] = Language.PET_HANDBOOK_PANEL_U[18];
            PET_KIND_NAME[PET_KIND_SPECIAL] = Language.PET_HANDBOOK_PANEL_U[110];
            PET_KIND_NAME[PET_KIND_NEW] = Language.PET_HANDBOOK_PANEL_U[118];
            PET_KIND_NAME[PET_KIND_NEW2] = Language.PET_HANDBOOK_PANEL_U[120];
            PET_SERIE_PROP[0] = {};
            PET_SERIE_PROP[1] = {
                "1":{
                    "propType":5,
                    "propNum":480,
                    "percentFlag":0
                },
                "2":{
                    "propType":13,
                    "propNum":1,
                    "percentFlag":0
                },
                "3":{
                    "propType":11,
                    "propNum":240,
                    "percentFlag":0
                }
            };
            PET_SERIE_PROP[2] = {
                "1":{
                    "propType":13,
                    "propNum":1,
                    "percentFlag":0
                },
                "2":{
                    "propType":4,
                    "propNum":600,
                    "percentFlag":0
                },
                "3":{
                    "propType":11,
                    "propNum":240,
                    "percentFlag":0
                }
            };
            PET_SERIE_PROP[3] = {
                "1":{
                    "propType":32,
                    "propNum":1,
                    "percentFlag":0
                },
                "2":{
                    "propType":5,
                    "propNum":480,
                    "percentFlag":0
                },
                "3":{
                    "propType":1,
                    "propNum":2400,
                    "percentFlag":0
                }
            };
            PET_SERIE_PROP[4] = {
                "1":{
                    "propType":11,
                    "propNum":240,
                    "percentFlag":0
                },
                "2":{
                    "propType":1,
                    "propNum":2400,
                    "percentFlag":0
                },
                "3":{
                    "propType":58,
                    "propNum":1,
                    "percentFlag":0
                }
            };
            PET_SERIE_PROP[5] = {
                "1":{
                    "propType":58,
                    "propNum":1,
                    "percentFlag":0
                },
                "2":{
                    "propType":1,
                    "propNum":2400,
                    "percentFlag":0
                },
                "3":{
                    "propType":11,
                    "propNum":240,
                    "percentFlag":0
                }
            };
            PET_SERIE_PROP[6] = {
                "1":{
                    "propType":58,
                    "propNum":1,
                    "percentFlag":0
                },
                "2":{
                    "propType":32,
                    "propNum":1,
                    "percentFlag":0
                },
                "3":{
                    "propType":1,
                    "propNum":2400,
                    "percentFlag":0
                }
            };
            PET_SERIE_PROP[7] = {
                "1":{
                    "propType":13,
                    "propNum":2,
                    "percentFlag":0
                },
                "2":{
                    "propType":5,
                    "propNum":480,
                    "percentFlag":0
                },
                "3":{
                    "propType":4,
                    "propNum":600,
                    "percentFlag":0
                }
            };
            PET_SERIE_PROP[8] = {
                "1":{
                    "propType":32,
                    "propNum":2,
                    "percentFlag":0
                },
                "2":{
                    "propType":5,
                    "propNum":480,
                    "percentFlag":0
                },
                "3":{
                    "propType":4,
                    "propNum":600,
                    "percentFlag":0
                }
            };
            PET_SERIE_PROP[9] = {};
            PET_ALLSERIE_PROP[1] = {
                "propType":4,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[2] = {
                "propType":5,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[3] = {
                "propType":6,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[4] = {
                "propType":7,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[5] = {
                "propType":32,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[6] = {
                "propType":31,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[7] = {
                "propType":10,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[8] = {
                "propType":11,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[9] = {
                "propType":12,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[10] = {
                "propType":13,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[11] = {
                "propType":58,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[12] = {
                "propType":59,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[13] = {
                "propType":60,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[14] = {
                "propType":1,
                "percentFlag":0
            };
            PET_ALLSERIE_PROP[15] = {
                "propType":20,
                "percentFlag":0
            };
            PET_ENVOLUTION_FEATHER_STEP[1407] = [];
            PET_ENVOLUTION_FEATHER_STEP[1407][0] = [[0, 0, 0, 0, 60, 135, 135, 254, 404, 404], [404, 404, 404, 404, 508, 658, 658, 882, 1151, 1151], [1151, 1151, 1151, 1151, 1300, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1407][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 287], [287, 287, 287, 376, 376, 376, 513, 513, 513, 752], [752, 752, 752, 872, 872, 872, 1088, 1328, 1582, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1407][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 272], [272, 309, 309, 403, 403, 403, 553, 553, 553, 792], [792, 844, 844, 982, 982, 982, 1169, 1364, 1603, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1407][3] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 261], [261, 261, 371, 371, 371, 371, 491, 491, 491, 640], [640, 640, 796, 796, 796, 796, 960, 1140, 1349, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1407][4] = [[0, 0, 0, 0, 95, 220, 220, 388, 571, 571], [571, 571, 571, 571, 725, 907, 907, 1163, 1448, 1448], [1448, 1448, 1448, 1448, 1660, 1973, 1973, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1408] = [];
            PET_ENVOLUTION_FEATHER_STEP[1408][0] = [[0, 0, 0, 0, 60, 135, 135, 254, 404, 404], [404, 404, 404, 404, 508, 658, 658, 882, 1151, 1151], [1151, 1151, 1151, 1151, 1300, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1408][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 287], [287, 287, 287, 376, 376, 376, 513, 513, 513, 752], [752, 752, 752, 872, 872, 872, 1088, 1328, 1582, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1408][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 272], [272, 309, 309, 403, 403, 403, 553, 553, 553, 792], [792, 844, 844, 982, 982, 982, 1169, 1364, 1603, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1408][3] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 261], [261, 261, 371, 371, 371, 371, 491, 491, 491, 640], [640, 640, 796, 796, 796, 796, 960, 1140, 1349, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1408][4] = [[0, 0, 0, 0, 95, 220, 220, 388, 571, 571], [571, 571, 571, 571, 725, 907, 907, 1163, 1448, 1448], [1448, 1448, 1448, 1448, 1660, 1973, 1973, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1409] = [];
            PET_ENVOLUTION_FEATHER_STEP[1409][0] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 1010, 1161, 1161, 1161, 1435, 1435]];
            PET_ENVOLUTION_FEATHER_STEP[1409][1] = [[0, 0, 0, 0, 90, 199, 199, 368, 550, 550], [550, 550, 550, 550, 719, 932, 932, 1163, 1417, 1417], [1417, 1417, 1417, 1417, 1507, 1671, 1671, 1883, 1883, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1409][2] = [[0, 0, 66, 66, 66, 66, 137, 137, 137, 226], [226, 226, 337, 337, 337, 337, 457, 578, 578, 787], [787, 787, 942, 942, 1099, 1099, 1263, 1465, 1671, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1409][3] = [[0, 22, 22, 73, 73, 73, 142, 142, 142, 249], [249, 286, 286, 381, 381, 381, 517, 517, 683, 862], [862, 914, 914, 1022, 1022, 1172, 1337, 1591, 1860, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1409][4] = [[0, 0, 0, 60, 60, 60, 164, 164, 164, 344], [344, 344, 344, 433, 433, 433, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1211, 1211, 1211, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1410] = [];
            PET_ENVOLUTION_FEATHER_STEP[1410][0] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 1010, 1161, 1161, 1161, 1435, 1435]];
            PET_ENVOLUTION_FEATHER_STEP[1410][1] = [[0, 0, 0, 0, 90, 199, 199, 368, 550, 550], [550, 550, 550, 550, 719, 932, 932, 1163, 1417, 1417], [1417, 1417, 1417, 1417, 1507, 1671, 1671, 1883, 1883, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1410][2] = [[0, 0, 66, 66, 66, 66, 137, 137, 137, 226], [226, 226, 337, 337, 337, 337, 457, 578, 578, 787], [787, 787, 942, 942, 1099, 1099, 1263, 1465, 1671, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1410][3] = [[0, 22, 22, 73, 73, 73, 142, 142, 142, 249], [249, 286, 286, 381, 381, 381, 517, 517, 683, 862], [862, 914, 914, 1022, 1022, 1172, 1337, 1591, 1860, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1410][4] = [[0, 0, 0, 60, 60, 60, 164, 164, 164, 344], [344, 344, 344, 433, 433, 433, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1211, 1211, 1211, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1411] = [];
            PET_ENVOLUTION_FEATHER_STEP[1411][0] = [[0, 22, 22, 73, 73, 73, 178, 178, 178, 387], [387, 424, 424, 530, 530, 650, 829, 829, 1039, 1337], [1337, 1389, 1389, 1558, 1558, 1558, 1812, 1812, 1812, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1411][1] = [[0, 0, 0, 60, 60, 60, 124, 124, 124, 205], [205, 205, 205, 283, 372, 372, 479, 479, 479, 629], [629, 629, 706, 796, 915, 1042, 1252, 1476, 1794, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[1411][2] = [[0, 0, 66, 66, 66, 66, 141, 141, 141, 228], [228, 228, 338, 338, 338, 338, 458, 458, 458, 637], [637, 637, 715, 715, 715, 797, 902, 1051, 1256, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[1411][3] = [[0, 0, 0, 0, 80, 179, 179, 321, 486, 486], [486, 486, 486, 486, 570, 678, 678, 917, 1247, 1247], [1247, 1247, 1247, 1247, 1347, 1347, 1347, 1347, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1411][4] = [[0, 0, 0, 0, 75, 175, 175, 321, 489, 489], [489, 489, 489, 489, 573, 677, 677, 918, 918, 918], [918, 918, 918, 918, 1060, 1316, 1316, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1412] = [];
            PET_ENVOLUTION_FEATHER_STEP[1412][0] = [[0, 22, 22, 73, 73, 73, 178, 178, 178, 387], [387, 424, 424, 530, 530, 650, 829, 829, 1039, 1337], [1337, 1389, 1389, 1558, 1558, 1558, 1812, 1812, 1812, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1412][1] = [[0, 0, 0, 60, 60, 60, 124, 124, 124, 205], [205, 205, 205, 283, 372, 372, 479, 479, 479, 629], [629, 629, 706, 796, 915, 1042, 1252, 1476, 1794, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[1412][2] = [[0, 0, 66, 66, 66, 66, 141, 141, 141, 228], [228, 228, 338, 338, 338, 338, 458, 458, 458, 637], [637, 637, 715, 715, 715, 797, 902, 1051, 1256, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[1412][3] = [[0, 0, 0, 0, 80, 179, 179, 321, 486, 486], [486, 486, 486, 486, 570, 678, 678, 917, 1247, 1247], [1247, 1247, 1247, 1247, 1347, 1347, 1347, 1347, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1412][4] = [[0, 0, 0, 0, 75, 175, 175, 321, 489, 489], [489, 489, 489, 489, 573, 677, 677, 918, 918, 918], [918, 918, 918, 918, 1060, 1316, 1316, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1413] = [];
            PET_ENVOLUTION_FEATHER_STEP[1413][0] = [[0, 0, 0, 0, 74, 164, 164, 299, 448, 448], [448, 448, 448, 448, 568, 732, 732, 971, 1240, 1240], [1240, 1240, 1240, 1240, 1240, 1525, 1525, 1525, 1525, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1413][1] = [[0, 0, 36, 80, 80, 80, 172, 172, 172, 295], [295, 295, 359, 432, 432, 432, 576, 576, 576, 785], [785, 785, 877, 973, 973, 973, 1197, 1436, 1733, 2063]];
            PET_ENVOLUTION_FEATHER_STEP[1413][2] = [[0, 0, 0, 0, 81, 190, 190, 344, 526, 526], [526, 526, 526, 526, 665, 833, 833, 1074, 1358, 1358], [1358, 1358, 1358, 1358, 1614, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1413][3] = [[0, 22, 22, 52, 52, 52, 128, 128, 128, 265], [265, 302, 302, 361, 361, 361, 498, 498, 498, 677], [677, 729, 729, 808, 808, 898, 1033, 1242, 1466, 1830]];
            PET_ENVOLUTION_FEATHER_STEP[1413][4] = [[0, 0, 30, 68, 68, 68, 145, 145, 145, 262], [262, 262, 308, 361, 361, 361, 486, 486, 486, 725], [725, 725, 788, 871, 962, 1068, 1233, 1456, 1695, 1937]];
            PET_ENVOLUTION_FEATHER_STEP[1414] = [];
            PET_ENVOLUTION_FEATHER_STEP[1414][0] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 293], [293, 293, 404, 404, 404, 404, 538, 680, 680, 890], [890, 890, 1045, 1045, 1202, 1202, 1366, 1636, 1934, 2242]];
            PET_ENVOLUTION_FEATHER_STEP[1414][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 269], [269, 269, 269, 364, 364, 364, 498, 498, 498, 737], [737, 737, 737, 936, 936, 936, 1175, 1175, 1175, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1414][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 0x0101], [0x0101, 294, 294, 383, 383, 383, 520, 520, 670, 849], [849, 901, 901, 961, 961, 1110, 1304, 1304, 1304, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1414][3] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 985, 1136, 1136, 1315, 1525, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1414][4] = [[0, 0, 0, 0, 90, 199, 199, 368, 565, 565], [565, 565, 565, 565, 734, 946, 946, 1165, 1434, 1434], [1434, 1434, 1434, 1434, 1549, 1714, 1714, 1908, 2152, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1415] = [];
            PET_ENVOLUTION_FEATHER_STEP[1415][0] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 293], [293, 293, 404, 404, 404, 404, 538, 680, 680, 890], [890, 890, 1045, 1045, 1202, 1202, 1366, 1636, 1934, 2242]];
            PET_ENVOLUTION_FEATHER_STEP[1415][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 269], [269, 269, 269, 364, 364, 364, 498, 498, 498, 737], [737, 737, 737, 936, 936, 936, 1175, 1175, 1175, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1415][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 0x0101], [0x0101, 294, 294, 383, 383, 383, 520, 520, 670, 849], [849, 901, 901, 961, 961, 1110, 1304, 1304, 1304, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1415][3] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 985, 1136, 1136, 1315, 1525, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1415][4] = [[0, 0, 0, 0, 90, 199, 199, 368, 565, 565], [565, 565, 565, 565, 734, 946, 946, 1165, 1434, 1434], [1434, 1434, 1434, 1434, 1549, 1714, 1714, 1908, 2152, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1416] = [];
            PET_ENVOLUTION_FEATHER_STEP[1416][0] = [[0, 0, 0, 0, 74, 164, 164, 299, 448, 448], [448, 448, 448, 448, 568, 732, 732, 971, 1240, 1240], [1240, 1240, 1240, 1240, 1240, 1525, 1525, 1525, 1525, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1416][1] = [[0, 0, 36, 80, 80, 80, 172, 172, 172, 295], [295, 295, 359, 432, 432, 432, 576, 576, 576, 785], [785, 785, 877, 973, 973, 973, 1197, 1436, 1733, 2063]];
            PET_ENVOLUTION_FEATHER_STEP[1416][2] = [[0, 0, 0, 0, 81, 190, 190, 344, 526, 526], [526, 526, 526, 526, 665, 833, 833, 1074, 1358, 1358], [1358, 1358, 1358, 1358, 1614, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1416][3] = [[0, 22, 22, 52, 52, 52, 128, 128, 128, 265], [265, 302, 302, 361, 361, 361, 498, 498, 498, 677], [677, 729, 729, 808, 808, 898, 1033, 1242, 1466, 1830]];
            PET_ENVOLUTION_FEATHER_STEP[1416][4] = [[0, 0, 30, 68, 68, 68, 145, 145, 145, 262], [262, 262, 308, 361, 361, 361, 486, 486, 486, 725], [725, 725, 788, 871, 962, 1068, 1233, 1456, 1695, 1937]];
            PET_ENVOLUTION_FEATHER_STEP[1417] = [];
            PET_ENVOLUTION_FEATHER_STEP[1417][0] = [[0, 0, 0, 0, 78, 176, 176, 324, 503, 503], [503, 503, 503, 503, 642, 821, 821, 1060, 1329, 1329], [1329, 1329, 1329, 1329, 1509, 1733, 1733, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1417][1] = [[0, 0, 66, 66, 66, 66, 131, 131, 131, 238], [238, 238, 349, 349, 349, 349, 483, 483, 483, 692], [692, 692, 847, 847, 847, 847, 1057, 1282, 1669, 2063]];
            PET_ENVOLUTION_FEATHER_STEP[1417][2] = [[0, 22, 22, 73, 73, 73, 163, 163, 163, 282], [282, 319, 319, 384, 384, 384, 491, 491, 491, 670], [670, 722, 722, 831, 831, 831, 966, 1115, 0x0500, 1471]];
            PET_ENVOLUTION_FEATHER_STEP[1417][3] = [[0, 0, 0, 0, 77, 178, 178, 319, 471, 471], [471, 471, 471, 471, 591, 744, 744, 984, 1269, 1269], [1269, 1269, 1269, 1269, 1451, 1692, 1692, 1692, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1417][4] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 299], [299, 299, 299, 419, 419, 419, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1196, 1196, 1196, 1489]];
            PET_ENVOLUTION_FEATHER_STEP[1418] = [];
            PET_ENVOLUTION_FEATHER_STEP[1418][0] = [[0, 22, 22, 73, 73, 73, 178, 178, 178, 387], [387, 424, 424, 530, 530, 650, 829, 829, 1039, 1337], [1337, 1389, 1389, 1558, 1558, 1558, 1812, 1812, 1812, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1418][1] = [[0, 0, 0, 60, 60, 60, 124, 124, 124, 205], [205, 205, 205, 283, 372, 372, 479, 479, 479, 629], [629, 629, 706, 796, 915, 1042, 1252, 1476, 1794, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[1418][2] = [[0, 0, 66, 66, 66, 66, 141, 141, 141, 228], [228, 228, 338, 338, 338, 338, 458, 458, 458, 637], [637, 637, 715, 715, 715, 797, 902, 1051, 1256, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[1418][3] = [[0, 0, 0, 0, 80, 179, 179, 321, 486, 486], [486, 486, 486, 486, 570, 678, 678, 917, 1247, 1247], [1247, 1247, 1247, 1247, 1347, 1347, 1347, 1347, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1418][4] = [[0, 0, 0, 0, 75, 175, 175, 321, 489, 489], [489, 489, 489, 489, 573, 677, 677, 918, 918, 918], [918, 918, 918, 918, 1060, 1316, 1316, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1419] = [];
            PET_ENVOLUTION_FEATHER_STEP[1419][0] = [[0, 0, 0, 0, 78, 176, 176, 324, 503, 503], [503, 503, 503, 503, 642, 821, 821, 1060, 1329, 1329], [1329, 1329, 1329, 1329, 1509, 1733, 1733, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1419][1] = [[0, 0, 66, 66, 66, 66, 131, 131, 131, 238], [238, 238, 349, 349, 349, 349, 483, 483, 483, 692], [692, 692, 847, 847, 847, 847, 1057, 1282, 1669, 2063]];
            PET_ENVOLUTION_FEATHER_STEP[1419][2] = [[0, 22, 22, 73, 73, 73, 163, 163, 163, 282], [282, 319, 319, 384, 384, 384, 491, 491, 491, 670], [670, 722, 722, 831, 831, 831, 966, 1115, 0x0500, 1471]];
            PET_ENVOLUTION_FEATHER_STEP[1419][3] = [[0, 0, 0, 0, 77, 178, 178, 319, 471, 471], [471, 471, 471, 471, 591, 744, 744, 984, 1269, 1269], [1269, 1269, 1269, 1269, 1451, 1692, 1692, 1692, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1419][4] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 299], [299, 299, 299, 419, 419, 419, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1196, 1196, 1196, 1489]];
            PET_ENVOLUTION_FEATHER_STEP[1420] = [];
            PET_ENVOLUTION_FEATHER_STEP[1420][0] = [[0, 0, 0, 0, 60, 135, 135, 254, 404, 404], [404, 404, 404, 404, 508, 658, 658, 882, 1151, 1151], [1151, 1151, 1151, 1151, 1300, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1420][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 287], [287, 287, 287, 376, 376, 376, 513, 513, 513, 752], [752, 752, 752, 872, 872, 872, 1088, 1328, 1582, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1420][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 272], [272, 309, 309, 403, 403, 403, 553, 553, 553, 792], [792, 844, 844, 982, 982, 982, 1169, 1364, 1603, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1420][3] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 261], [261, 261, 371, 371, 371, 371, 491, 491, 491, 640], [640, 640, 796, 796, 796, 796, 960, 1140, 1349, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1420][4] = [[0, 0, 0, 0, 95, 220, 220, 388, 571, 571], [571, 571, 571, 571, 725, 907, 907, 1163, 1448, 1448], [1448, 1448, 1448, 1448, 1660, 1973, 1973, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1421] = [];
            PET_ENVOLUTION_FEATHER_STEP[1421][0] = [[0, 0, 0, 0, 60, 135, 135, 254, 404, 404], [404, 404, 404, 404, 508, 658, 658, 882, 1151, 1151], [1151, 1151, 1151, 1151, 1300, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1421][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 287], [287, 287, 287, 376, 376, 376, 513, 513, 513, 752], [752, 752, 752, 872, 872, 872, 1088, 1328, 1582, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1421][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 272], [272, 309, 309, 403, 403, 403, 553, 553, 553, 792], [792, 844, 844, 982, 982, 982, 1169, 1364, 1603, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1421][3] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 261], [261, 261, 371, 371, 371, 371, 491, 491, 491, 640], [640, 640, 796, 796, 796, 796, 960, 1140, 1349, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1421][4] = [[0, 0, 0, 0, 95, 220, 220, 388, 571, 571], [571, 571, 571, 571, 725, 907, 907, 1163, 1448, 1448], [1448, 1448, 1448, 1448, 1660, 1973, 1973, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1422] = [];
            PET_ENVOLUTION_FEATHER_STEP[1422][0] = [[0, 0, 0, 0, 74, 164, 164, 299, 448, 448], [448, 448, 448, 448, 568, 732, 732, 971, 1240, 1240], [1240, 1240, 1240, 1240, 1240, 1525, 1525, 1525, 1525, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1422][1] = [[0, 0, 36, 80, 80, 80, 172, 172, 172, 295], [295, 295, 359, 432, 432, 432, 576, 576, 576, 785], [785, 785, 877, 973, 973, 973, 1197, 1436, 1733, 2063]];
            PET_ENVOLUTION_FEATHER_STEP[1422][2] = [[0, 0, 0, 0, 81, 190, 190, 344, 526, 526], [526, 526, 526, 526, 665, 833, 833, 1074, 1358, 1358], [1358, 1358, 1358, 1358, 1614, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1422][3] = [[0, 22, 22, 52, 52, 52, 128, 128, 128, 265], [265, 302, 302, 361, 361, 361, 498, 498, 498, 677], [677, 729, 729, 808, 808, 898, 1033, 1242, 1466, 1830]];
            PET_ENVOLUTION_FEATHER_STEP[1422][4] = [[0, 0, 30, 68, 68, 68, 145, 145, 145, 262], [262, 262, 308, 361, 361, 361, 486, 486, 486, 725], [725, 725, 788, 871, 962, 1068, 1233, 1456, 1695, 1937]];
            PET_ENVOLUTION_FEATHER_STEP[1423] = [];
            PET_ENVOLUTION_FEATHER_STEP[1423][0] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 1010, 1161, 1161, 1161, 1435, 1435]];
            PET_ENVOLUTION_FEATHER_STEP[1423][1] = [[0, 0, 0, 0, 90, 199, 199, 368, 550, 550], [550, 550, 550, 550, 719, 932, 932, 1163, 1417, 1417], [1417, 1417, 1417, 1417, 1507, 1671, 1671, 1883, 1883, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1423][2] = [[0, 0, 66, 66, 66, 66, 137, 137, 137, 226], [226, 226, 337, 337, 337, 337, 457, 578, 578, 787], [787, 787, 942, 942, 1099, 1099, 1263, 1465, 1671, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1423][3] = [[0, 22, 22, 73, 73, 73, 142, 142, 142, 249], [249, 286, 286, 381, 381, 381, 517, 517, 683, 862], [862, 914, 914, 1022, 1022, 1172, 1337, 1591, 1860, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1423][4] = [[0, 0, 0, 60, 60, 60, 164, 164, 164, 344], [344, 344, 344, 433, 433, 433, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1211, 1211, 1211, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1424] = [];
            PET_ENVOLUTION_FEATHER_STEP[1424][0] = [[0, 0, 0, 0, 60, 135, 135, 254, 404, 404], [404, 404, 404, 404, 508, 658, 658, 882, 1151, 1151], [1151, 1151, 1151, 1151, 1300, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1424][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 287], [287, 287, 287, 376, 376, 376, 513, 513, 513, 752], [752, 752, 752, 872, 872, 872, 1088, 1328, 1582, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1424][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 272], [272, 309, 309, 403, 403, 403, 553, 553, 553, 792], [792, 844, 844, 982, 982, 982, 1169, 1364, 1603, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1424][3] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 261], [261, 261, 371, 371, 371, 371, 491, 491, 491, 640], [640, 640, 796, 796, 796, 796, 960, 1140, 1349, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1424][4] = [[0, 0, 0, 0, 95, 220, 220, 388, 571, 571], [571, 571, 571, 571, 725, 907, 907, 1163, 1448, 1448], [1448, 1448, 1448, 1448, 1660, 1973, 1973, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1425] = [];
            PET_ENVOLUTION_FEATHER_STEP[1425][0] = [[0, 0, 0, 0, 60, 135, 135, 254, 404, 404], [404, 404, 404, 404, 508, 658, 658, 882, 1151, 1151], [1151, 1151, 1151, 1151, 1300, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1425][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 287], [287, 287, 287, 376, 376, 376, 513, 513, 513, 752], [752, 752, 752, 872, 872, 872, 1088, 1328, 1582, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1425][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 272], [272, 309, 309, 403, 403, 403, 553, 553, 553, 792], [792, 844, 844, 982, 982, 982, 1169, 1364, 1603, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1425][3] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 261], [261, 261, 371, 371, 371, 371, 491, 491, 491, 640], [640, 640, 796, 796, 796, 796, 960, 1140, 1349, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1425][4] = [[0, 0, 0, 0, 95, 220, 220, 388, 571, 571], [571, 571, 571, 571, 725, 907, 907, 1163, 1448, 1448], [1448, 1448, 1448, 1448, 1660, 1973, 1973, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[1426] = [];
            PET_ENVOLUTION_FEATHER_STEP[1426][0] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 293], [293, 293, 404, 404, 404, 404, 538, 680, 680, 890], [890, 890, 1045, 1045, 1202, 1202, 1366, 1636, 1934, 2242]];
            PET_ENVOLUTION_FEATHER_STEP[1426][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 269], [269, 269, 269, 364, 364, 364, 498, 498, 498, 737], [737, 737, 737, 936, 936, 936, 1175, 1175, 1175, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1426][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 0x0101], [0x0101, 294, 294, 383, 383, 383, 520, 520, 670, 849], [849, 901, 901, 961, 961, 1110, 1304, 1304, 1304, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1426][3] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 985, 1136, 1136, 1315, 1525, 1525]];
            PET_ENVOLUTION_FEATHER_STEP[1426][4] = [[0, 0, 0, 0, 90, 199, 199, 368, 565, 565], [565, 565, 565, 565, 734, 946, 946, 1165, 1434, 1434], [1434, 1434, 1434, 1434, 1549, 1714, 1714, 1908, 2152, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1427] = [];
            PET_ENVOLUTION_FEATHER_STEP[1427][0] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 1010, 1161, 1161, 1161, 1435, 1435]];
            PET_ENVOLUTION_FEATHER_STEP[1427][1] = [[0, 0, 0, 0, 90, 199, 199, 368, 550, 550], [550, 550, 550, 550, 719, 932, 932, 1163, 1417, 1417], [1417, 1417, 1417, 1417, 1507, 1671, 1671, 1883, 1883, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1427][2] = [[0, 0, 66, 66, 66, 66, 137, 137, 137, 226], [226, 226, 337, 337, 337, 337, 457, 578, 578, 787], [787, 787, 942, 942, 1099, 1099, 1263, 1465, 1671, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1427][3] = [[0, 22, 22, 73, 73, 73, 142, 142, 142, 249], [249, 286, 286, 381, 381, 381, 517, 517, 683, 862], [862, 914, 914, 1022, 1022, 1172, 1337, 1591, 1860, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1427][4] = [[0, 0, 0, 60, 60, 60, 164, 164, 164, 344], [344, 344, 344, 433, 433, 433, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1211, 1211, 1211, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1428] = [];
            PET_ENVOLUTION_FEATHER_STEP[1428][0] = [[0, 22, 22, 73, 73, 73, 178, 178, 178, 387], [387, 424, 424, 530, 530, 650, 829, 829, 1039, 1337], [1337, 1389, 1389, 1558, 1558, 1558, 1812, 1812, 1812, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1428][1] = [[0, 0, 0, 60, 60, 60, 124, 124, 124, 205], [205, 205, 205, 283, 372, 372, 479, 479, 479, 629], [629, 629, 706, 796, 915, 1042, 1252, 1476, 1794, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[1428][2] = [[0, 0, 66, 66, 66, 66, 141, 141, 141, 228], [228, 228, 338, 338, 338, 338, 458, 458, 458, 637], [637, 637, 715, 715, 715, 797, 902, 1051, 1256, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[1428][3] = [[0, 0, 0, 0, 80, 179, 179, 321, 486, 486], [486, 486, 486, 486, 570, 678, 678, 917, 1247, 1247], [1247, 1247, 1247, 1247, 1347, 1347, 1347, 1347, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1428][4] = [[0, 0, 0, 0, 75, 175, 175, 321, 489, 489], [489, 489, 489, 489, 573, 677, 677, 918, 918, 918], [918, 918, 918, 918, 1060, 1316, 1316, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1675] = [];
            PET_ENVOLUTION_FEATHER_STEP[1675][0] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 1010, 1161, 1161, 1161, 1435, 1435]];
            PET_ENVOLUTION_FEATHER_STEP[1675][1] = [[0, 0, 0, 0, 90, 199, 199, 368, 550, 550], [550, 550, 550, 550, 719, 932, 932, 1163, 1417, 1417], [1417, 1417, 1417, 1417, 1507, 1671, 1671, 1883, 1883, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1675][2] = [[0, 0, 66, 66, 66, 66, 137, 137, 137, 226], [226, 226, 337, 337, 337, 337, 457, 578, 578, 787], [787, 787, 942, 942, 1099, 1099, 1263, 1465, 1671, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1675][3] = [[0, 22, 22, 73, 73, 73, 142, 142, 142, 249], [249, 286, 286, 381, 381, 381, 517, 517, 683, 862], [862, 914, 914, 1022, 1022, 1172, 1337, 1591, 1860, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1675][4] = [[0, 0, 0, 60, 60, 60, 164, 164, 164, 344], [344, 344, 344, 433, 433, 433, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1211, 1211, 1211, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[1677] = [];
            PET_ENVOLUTION_FEATHER_STEP[1677][0] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 1010, 1161, 1161, 1161, 1435, 1435]];
            PET_ENVOLUTION_FEATHER_STEP[1677][1] = [[0, 0, 0, 0, 90, 199, 199, 368, 550, 550], [550, 550, 550, 550, 719, 932, 932, 1163, 1417, 1417], [1417, 1417, 1417, 1417, 1507, 1671, 1671, 1883, 1883, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1677][2] = [[0, 0, 66, 66, 66, 66, 137, 137, 137, 226], [226, 226, 337, 337, 337, 337, 457, 578, 578, 787], [787, 787, 942, 942, 1099, 1099, 1263, 1465, 1671, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[1677][3] = [[0, 22, 22, 73, 73, 73, 142, 142, 142, 249], [249, 286, 286, 381, 381, 381, 517, 517, 683, 862], [862, 914, 914, 1022, 1022, 1172, 1337, 1591, 1860, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[1677][4] = [[0, 0, 0, 60, 60, 60, 164, 164, 164, 344], [344, 344, 344, 433, 433, 433, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1211, 1211, 1211, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2072] = [];
            PET_ENVOLUTION_FEATHER_STEP[2072][0] = [[0, 0, 0, 0, 60, 135, 135, 254, 404, 404], [404, 404, 404, 404, 508, 658, 658, 882, 1151, 1151], [1151, 1151, 1151, 1151, 1300, 1614, 1614, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2072][1] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 287], [287, 287, 287, 376, 376, 376, 513, 513, 513, 752], [752, 752, 752, 872, 872, 872, 1088, 1328, 1582, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[2072][2] = [[0, 22, 22, 73, 73, 73, 137, 137, 137, 272], [272, 309, 309, 403, 403, 403, 553, 553, 553, 792], [792, 844, 844, 982, 982, 982, 1169, 1364, 1603, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[2072][3] = [[0, 0, 66, 66, 66, 66, 156, 156, 156, 261], [261, 261, 371, 371, 371, 371, 491, 491, 491, 640], [640, 640, 796, 796, 796, 796, 960, 1140, 1349, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2072][4] = [[0, 0, 0, 0, 95, 220, 220, 388, 571, 571], [571, 571, 571, 571, 725, 907, 907, 1163, 1448, 1448], [1448, 1448, 1448, 1448, 1660, 1973, 1973, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[2146] = [];
            PET_ENVOLUTION_FEATHER_STEP[2146][0] = [[0, 22, 22, 73, 73, 73, 178, 178, 178, 387], [387, 424, 424, 530, 530, 650, 829, 829, 1039, 1337], [1337, 1389, 1389, 1558, 1558, 1558, 1812, 1812, 1812, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[2146][1] = [[0, 0, 0, 60, 60, 60, 124, 124, 124, 205], [205, 205, 205, 283, 372, 372, 479, 479, 479, 629], [629, 629, 706, 796, 915, 1042, 1252, 1476, 1794, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[2146][2] = [[0, 0, 66, 66, 66, 66, 141, 141, 141, 228], [228, 228, 338, 338, 338, 338, 458, 458, 458, 637], [637, 637, 715, 715, 715, 797, 902, 1051, 1256, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[2146][3] = [[0, 0, 0, 0, 80, 179, 179, 321, 486, 486], [486, 486, 486, 486, 570, 678, 678, 917, 1247, 1247], [1247, 1247, 1247, 1247, 1347, 1347, 1347, 1347, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2146][4] = [[0, 0, 0, 0, 75, 175, 175, 321, 489, 489], [489, 489, 489, 489, 573, 677, 677, 918, 918, 918], [918, 918, 918, 918, 1060, 1316, 1316, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2222] = [];
            PET_ENVOLUTION_FEATHER_STEP[2222][0] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 1010, 1161, 1161, 1161, 1435, 1435]];
            PET_ENVOLUTION_FEATHER_STEP[2222][1] = [[0, 0, 0, 0, 90, 199, 199, 368, 550, 550], [550, 550, 550, 550, 719, 932, 932, 1163, 1417, 1417], [1417, 1417, 1417, 1417, 1507, 1671, 1671, 1883, 1883, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[2222][2] = [[0, 0, 66, 66, 66, 66, 137, 137, 137, 226], [226, 226, 337, 337, 337, 337, 457, 578, 578, 787], [787, 787, 942, 942, 1099, 1099, 1263, 1465, 1671, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[2222][3] = [[0, 22, 22, 73, 73, 73, 142, 142, 142, 249], [249, 286, 286, 381, 381, 381, 517, 517, 683, 862], [862, 914, 914, 1022, 1022, 1172, 1337, 1591, 1860, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[2222][4] = [[0, 0, 0, 60, 60, 60, 164, 164, 164, 344], [344, 344, 344, 433, 433, 433, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1211, 1211, 1211, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2247] = [];
            PET_ENVOLUTION_FEATHER_STEP[2247][0] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 1010, 1161, 1161, 1161, 1435, 1435]];
            PET_ENVOLUTION_FEATHER_STEP[2247][1] = [[0, 0, 0, 0, 90, 199, 199, 368, 550, 550], [550, 550, 550, 550, 719, 932, 932, 1163, 1417, 1417], [1417, 1417, 1417, 1417, 1507, 1671, 1671, 1883, 1883, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[2247][2] = [[0, 0, 66, 66, 66, 66, 137, 137, 137, 226], [226, 226, 337, 337, 337, 337, 457, 578, 578, 787], [787, 787, 942, 942, 1099, 1099, 1263, 1465, 1671, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[2247][3] = [[0, 22, 22, 73, 73, 73, 142, 142, 142, 249], [249, 286, 286, 381, 381, 381, 517, 517, 683, 862], [862, 914, 914, 1022, 1022, 1172, 1337, 1591, 1860, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[2247][4] = [[0, 0, 0, 60, 60, 60, 164, 164, 164, 344], [344, 344, 344, 433, 433, 433, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1211, 1211, 1211, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2250] = [];
            PET_ENVOLUTION_FEATHER_STEP[2250][0] = [[0, 0, 0, 0, 78, 176, 176, 324, 503, 503], [503, 503, 503, 503, 642, 821, 821, 1060, 1329, 1329], [1329, 1329, 1329, 1329, 1509, 1733, 1733, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[2250][1] = [[0, 0, 66, 66, 66, 66, 131, 131, 131, 238], [238, 238, 349, 349, 349, 349, 483, 483, 483, 692], [692, 692, 847, 847, 847, 847, 1057, 1282, 1669, 2063]];
            PET_ENVOLUTION_FEATHER_STEP[2250][2] = [[0, 22, 22, 73, 73, 73, 163, 163, 163, 282], [282, 319, 319, 384, 384, 384, 491, 491, 491, 670], [670, 722, 722, 831, 831, 831, 966, 1115, 0x0500, 1471]];
            PET_ENVOLUTION_FEATHER_STEP[2250][3] = [[0, 0, 0, 0, 77, 178, 178, 319, 471, 471], [471, 471, 471, 471, 591, 744, 744, 984, 1269, 1269], [1269, 1269, 1269, 1269, 1451, 1692, 1692, 1692, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[2250][4] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 299], [299, 299, 299, 419, 419, 419, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1196, 1196, 1196, 1489]];
            PET_ENVOLUTION_FEATHER_STEP[2274] = [];
            PET_ENVOLUTION_FEATHER_STEP[2274][0] = [[0, 22, 22, 73, 73, 73, 178, 178, 178, 387], [387, 424, 424, 530, 530, 650, 829, 829, 1039, 1337], [1337, 1389, 1389, 1558, 1558, 1558, 1812, 1812, 1812, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[2274][1] = [[0, 0, 0, 60, 60, 60, 124, 124, 124, 205], [205, 205, 205, 283, 372, 372, 479, 479, 479, 629], [629, 629, 706, 796, 915, 1042, 1252, 1476, 1794, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[2274][2] = [[0, 0, 66, 66, 66, 66, 141, 141, 141, 228], [228, 228, 338, 338, 338, 338, 458, 458, 458, 637], [637, 637, 715, 715, 715, 797, 902, 1051, 1256, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[2274][3] = [[0, 0, 0, 0, 80, 179, 179, 321, 486, 486], [486, 486, 486, 486, 570, 678, 678, 917, 1247, 1247], [1247, 1247, 1247, 1247, 1347, 1347, 1347, 1347, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2274][4] = [[0, 0, 0, 0, 75, 175, 175, 321, 489, 489], [489, 489, 489, 489, 573, 677, 677, 918, 918, 918], [918, 918, 918, 918, 1060, 1316, 1316, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2278] = [];
            PET_ENVOLUTION_FEATHER_STEP[2278][0] = [[0, 0, 0, 0, 65, 155, 155, 275, 424, 424], [424, 424, 424, 424, 0x0202, 633, 633, 761, 895, 895], [895, 895, 895, 895, 1010, 1161, 1161, 1161, 1435, 1435]];
            PET_ENVOLUTION_FEATHER_STEP[2278][1] = [[0, 0, 0, 0, 90, 199, 199, 368, 550, 550], [550, 550, 550, 550, 719, 932, 932, 1163, 1417, 1417], [1417, 1417, 1417, 1417, 1507, 1671, 1671, 1883, 1883, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[2278][2] = [[0, 0, 66, 66, 66, 66, 137, 137, 137, 226], [226, 226, 337, 337, 337, 337, 457, 578, 578, 787], [787, 787, 942, 942, 1099, 1099, 1263, 1465, 1671, 1883]];
            PET_ENVOLUTION_FEATHER_STEP[2278][3] = [[0, 22, 22, 73, 73, 73, 142, 142, 142, 249], [249, 286, 286, 381, 381, 381, 517, 517, 683, 862], [862, 914, 914, 1022, 1022, 1172, 1337, 1591, 1860, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[2278][4] = [[0, 0, 0, 60, 60, 60, 164, 164, 164, 344], [344, 344, 344, 433, 433, 433, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1211, 1211, 1211, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2280] = [];
            PET_ENVOLUTION_FEATHER_STEP[2280][0] = [[0, 22, 22, 73, 73, 73, 178, 178, 178, 387], [387, 424, 424, 530, 530, 650, 829, 829, 1039, 1337], [1337, 1389, 1389, 1558, 1558, 1558, 1812, 1812, 1812, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[2280][1] = [[0, 0, 0, 60, 60, 60, 124, 124, 124, 205], [205, 205, 205, 283, 372, 372, 479, 479, 479, 629], [629, 629, 706, 796, 915, 1042, 1252, 1476, 1794, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[2280][2] = [[0, 0, 66, 66, 66, 66, 141, 141, 141, 228], [228, 228, 338, 338, 338, 338, 458, 458, 458, 637], [637, 637, 715, 715, 715, 797, 902, 1051, 1256, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[2280][3] = [[0, 0, 0, 0, 80, 179, 179, 321, 486, 486], [486, 486, 486, 486, 570, 678, 678, 917, 1247, 1247], [1247, 1247, 1247, 1247, 1347, 1347, 1347, 1347, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2280][4] = [[0, 0, 0, 0, 75, 175, 175, 321, 489, 489], [489, 489, 489, 489, 573, 677, 677, 918, 918, 918], [918, 918, 918, 918, 1060, 1316, 1316, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2282] = [];
            PET_ENVOLUTION_FEATHER_STEP[2282][0] = [[0, 22, 22, 73, 73, 73, 178, 178, 178, 387], [387, 424, 424, 530, 530, 650, 829, 829, 1039, 1337], [1337, 1389, 1389, 1558, 1558, 1558, 1812, 1812, 1812, 2152]];
            PET_ENVOLUTION_FEATHER_STEP[2282][1] = [[0, 0, 0, 60, 60, 60, 124, 124, 124, 205], [205, 205, 205, 283, 372, 372, 479, 479, 479, 629], [629, 629, 706, 796, 915, 1042, 1252, 1476, 1794, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[2282][2] = [[0, 0, 66, 66, 66, 66, 141, 141, 141, 228], [228, 228, 338, 338, 338, 338, 458, 458, 458, 637], [637, 637, 715, 715, 715, 797, 902, 1051, 1256, 1794]];
            PET_ENVOLUTION_FEATHER_STEP[2282][3] = [[0, 0, 0, 0, 80, 179, 179, 321, 486, 486], [486, 486, 486, 486, 570, 678, 678, 917, 1247, 1247], [1247, 1247, 1247, 1247, 1347, 1347, 1347, 1347, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2282][4] = [[0, 0, 0, 0, 75, 175, 175, 321, 489, 489], [489, 489, 489, 489, 573, 677, 677, 918, 918, 918], [918, 918, 918, 918, 1060, 1316, 1316, 1614, 1614, 1614]];
            PET_ENVOLUTION_FEATHER_STEP[2291] = [];
            PET_ENVOLUTION_FEATHER_STEP[2291][0] = [[0, 0, 0, 0, 78, 176, 176, 324, 503, 503], [503, 503, 503, 503, 642, 821, 821, 1060, 1329, 1329], [1329, 1329, 1329, 1329, 1509, 1733, 1733, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[2291][1] = [[0, 0, 66, 66, 66, 66, 131, 131, 131, 238], [238, 238, 349, 349, 349, 349, 483, 483, 483, 692], [692, 692, 847, 847, 847, 847, 1057, 1282, 1669, 2063]];
            PET_ENVOLUTION_FEATHER_STEP[2291][2] = [[0, 22, 22, 73, 73, 73, 163, 163, 163, 282], [282, 319, 319, 384, 384, 384, 491, 491, 491, 670], [670, 722, 722, 831, 831, 831, 966, 1115, 0x0500, 1471]];
            PET_ENVOLUTION_FEATHER_STEP[2291][3] = [[0, 0, 0, 0, 77, 178, 178, 319, 471, 471], [471, 471, 471, 471, 591, 744, 744, 984, 1269, 1269], [1269, 1269, 1269, 1269, 1451, 1692, 1692, 1692, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[2291][4] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 299], [299, 299, 299, 419, 419, 419, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1196, 1196, 1196, 1489]];
            PET_ENVOLUTION_FEATHER_STEP[2293] = [];
            PET_ENVOLUTION_FEATHER_STEP[2293][0] = [[0, 0, 0, 0, 78, 176, 176, 324, 503, 503], [503, 503, 503, 503, 642, 821, 821, 1060, 1329, 1329], [1329, 1329, 1329, 1329, 1509, 1733, 1733, 1973, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[2293][1] = [[0, 0, 66, 66, 66, 66, 131, 131, 131, 238], [238, 238, 349, 349, 349, 349, 483, 483, 483, 692], [692, 692, 847, 847, 847, 847, 1057, 1282, 1669, 2063]];
            PET_ENVOLUTION_FEATHER_STEP[2293][2] = [[0, 22, 22, 73, 73, 73, 163, 163, 163, 282], [282, 319, 319, 384, 384, 384, 491, 491, 491, 670], [670, 722, 722, 831, 831, 831, 966, 1115, 0x0500, 1471]];
            PET_ENVOLUTION_FEATHER_STEP[2293][3] = [[0, 0, 0, 0, 77, 178, 178, 319, 471, 471], [471, 471, 471, 471, 591, 744, 744, 984, 1269, 1269], [1269, 1269, 1269, 1269, 1451, 1692, 1692, 1692, 1973, 1973]];
            PET_ENVOLUTION_FEATHER_STEP[2293][4] = [[0, 0, 0, 60, 60, 60, 149, 149, 149, 299], [299, 299, 299, 419, 419, 419, 583, 583, 583, 822], [822, 822, 822, 972, 972, 972, 1196, 1196, 1196, 1489]];
            MC_BIRTH_CONFIG[1] = {
                "4":55,
                "5":58,
                "6":63,
                "7":70,
                "8":79,
                "9":90,
                "10":100
            };
            MC_BIRTH_CONFIG[2] = {
                "4":35,
                "5":38,
                "6":41,
                "7":45,
                "8":49,
                "9":54,
                "10":59,
                "11":65,
                "12":71,
                "13":78,
                "14":86,
                "15":95,
                "16":100
            };
            MC_BIRTH_CONFIG[3] = [100, 100, 100, 100, 100, 100, 85, 70, 45, 45, 45, 45, 30];
            MC_BIRTH_CONFIG[4] = {
                "0":100,
                "1":100,
                "2":85,
                "3":65
            };
            MC_BIRTH_CONFIG[5] = [100, 90, 55, 35];
            MC_BIRTH_CONFIG[6] = [[50, 41, 34, 43, 34, 29, 36, 29, 29], [41, 34, 33, 34, 30, 26, 29, 26, 23], [43, 34, 27, 34, 29, 23, 34, 26, 17]];
            MC_BIRTH_CONFIG[7] = {
                "301":0.15,
                "302":0.1,
                "401":0.3,
                "402":0.15
            };
            MC_BIRTH_CONFIG[8] = [100, 100, 100, 100, 100, 90, 75, 65, 40, 40, 40];
            MC_BIRTH_CONFIG[9] = {};
            MC_BIRTH_CONFIG[9][0] = 100;
            MC_BIRTH_CONFIG[9][1] = 60;
            MC_BIRTH_CONFIG[9][2] = 40;
            MC_BIRTH_CONFIG[9][3] = 30;
            MC_BIRTH_CONFIG[10] = {
                "4":55,
                "5":58,
                "6":63,
                "7":70,
                "8":79,
                "9":90,
                "10":100
            };
            MC_BIRTH_CONFIG[11] = {
                "4":35,
                "5":38,
                "6":41,
                "7":45,
                "8":49,
                "9":54,
                "10":59,
                "11":65,
                "12":71,
                "13":78,
                "14":86,
                "15":95,
                "16":100
            };
            MC_BIRTH_CONFIG[12] = {
                "2":75,
                "3":35
            };
            MC_BIRTH_CONFIG[13] = {};
            MC_BIRTH_CONFIG[13][21] = 130;
            MC_BIRTH_CONFIG[13][22] = 120;
            MC_BIRTH_CONFIG[13][23] = 110;
            MC_BIRTH_CONFIG[13][24] = 110;
            MC_BIRTH_CONFIG[13][25] = 110;
            MC_BIRTH_CONFIG[14] = [1, 0.0675, 0.03375, 0.016875, 0.0084375];
            MC_BIRTH_CONFIG[15] = [100, 90, 55, 35];
            MC_BIRTH_CONFIG[16] = {};
            MC_BIRTH_CONFIG[16][1] = 100;
            MC_BIRTH_CONFIG[16][2] = 100;
            MC_BIRTH_CONFIG[16][3] = 90;
            MC_BIRTH_CONFIG[16][4] = 80;
            MC_BIRTH_CONFIG[16][5] = 70;
            MC_BIRTH_CONFIG[16][6] = 65;
            MC_BIRTH_CONFIG[16][7] = 60;
            MC_BIRTH_CONFIG[16][8] = 55;
            MC_BIRTH_CONFIG[16][9] = 50;
            MC_BIRTH_CONFIG[16][10] = 45;
            MC_BIRTH_CONFIG[16][11] = 100;
            MC_BIRTH_CONFIG[16][12] = 90;
            MC_BIRTH_CONFIG[16][13] = 80;
            MC_BIRTH_CONFIG[16][14] = 70;
            MC_BIRTH_CONFIG[16][15] = 65;
            MC_BIRTH_CONFIG[16][16] = 60;
            MC_BIRTH_CONFIG[16][17] = 55;
            MC_BIRTH_CONFIG[16][18] = 50;
            MC_BIRTH_CONFIG[16][19] = 45;
            MC_BIRTH_CONFIG[16][20] = 40;
            MC_BIRTH_CONFIG[16][21] = 90;
            MC_BIRTH_CONFIG[16][22] = 80;
            MC_BIRTH_CONFIG[16][23] = 70;
            MC_BIRTH_CONFIG[16][24] = 65;
            MC_BIRTH_CONFIG[16][25] = 60;
            MC_BIRTH_CONFIG[16][26] = 55;
            MC_BIRTH_CONFIG[16][27] = 50;
            MC_BIRTH_CONFIG[16][28] = 45;
            MC_BIRTH_CONFIG[16][29] = 40;
            MC_BIRTH_CONFIG[16][30] = 40;
            MC_BIRTH_CONFIG[16][31] = 80;
            MC_BIRTH_CONFIG[16][32] = 70;
            MC_BIRTH_CONFIG[16][33] = 65;
            MC_BIRTH_CONFIG[16][34] = 60;
            MC_BIRTH_CONFIG[16][35] = 55;
            MC_BIRTH_CONFIG[16][36] = 50;
            MC_BIRTH_CONFIG[16][37] = 45;
            MC_BIRTH_CONFIG[16][38] = 40;
            MC_BIRTH_CONFIG[16][39] = 40;
            MC_BIRTH_CONFIG[16][40] = 40;
            MC_BIRTH_CONFIG[16][41] = 70;
            MC_BIRTH_CONFIG[16][42] = 65;
            MC_BIRTH_CONFIG[16][43] = 60;
            MC_BIRTH_CONFIG[16][44] = 55;
            MC_BIRTH_CONFIG[16][45] = 50;
            MC_BIRTH_CONFIG[16][46] = 45;
            MC_BIRTH_CONFIG[16][47] = 40;
            MC_BIRTH_CONFIG[16][48] = 40;
            MC_BIRTH_CONFIG[16][49] = 40;
            MC_BIRTH_CONFIG[16][50] = 40;
            MC_BIRTH_CONFIG[17] = {};
            MC_BIRTH_CONFIG[17][1] = 100;
            MC_BIRTH_CONFIG[17][2] = 100;
            MC_BIRTH_CONFIG[17][3] = 90;
            MC_BIRTH_CONFIG[17][4] = 80;
            MC_BIRTH_CONFIG[17][5] = 70;
            MC_BIRTH_CONFIG[17][6] = 65;
            MC_BIRTH_CONFIG[17][7] = 60;
            MC_BIRTH_CONFIG[17][8] = 55;
            MC_BIRTH_CONFIG[17][9] = 50;
            MC_BIRTH_CONFIG[17][10] = 45;
            MC_BIRTH_CONFIG[17][11] = 100;
            MC_BIRTH_CONFIG[17][12] = 90;
            MC_BIRTH_CONFIG[17][13] = 80;
            MC_BIRTH_CONFIG[17][14] = 70;
            MC_BIRTH_CONFIG[17][15] = 65;
            MC_BIRTH_CONFIG[17][16] = 60;
            MC_BIRTH_CONFIG[17][17] = 55;
            MC_BIRTH_CONFIG[17][18] = 50;
            MC_BIRTH_CONFIG[17][19] = 45;
            MC_BIRTH_CONFIG[17][20] = 40;
            MC_BIRTH_CONFIG[17][21] = 90;
            MC_BIRTH_CONFIG[17][22] = 80;
            MC_BIRTH_CONFIG[17][23] = 70;
            MC_BIRTH_CONFIG[17][24] = 65;
            MC_BIRTH_CONFIG[17][25] = 60;
            MC_BIRTH_CONFIG[17][26] = 55;
            MC_BIRTH_CONFIG[17][27] = 50;
            MC_BIRTH_CONFIG[17][28] = 45;
            MC_BIRTH_CONFIG[17][29] = 40;
            MC_BIRTH_CONFIG[17][30] = 40;
            MC_BIRTH_CONFIG[17][31] = 80;
            MC_BIRTH_CONFIG[17][32] = 70;
            MC_BIRTH_CONFIG[17][33] = 65;
            MC_BIRTH_CONFIG[17][34] = 60;
            MC_BIRTH_CONFIG[17][35] = 55;
            MC_BIRTH_CONFIG[17][36] = 50;
            MC_BIRTH_CONFIG[17][37] = 45;
            MC_BIRTH_CONFIG[17][38] = 40;
            MC_BIRTH_CONFIG[17][39] = 40;
            MC_BIRTH_CONFIG[17][40] = 40;
            MC_BIRTH_CONFIG[17][41] = 70;
            MC_BIRTH_CONFIG[17][42] = 65;
            MC_BIRTH_CONFIG[17][43] = 60;
            MC_BIRTH_CONFIG[17][44] = 55;
            MC_BIRTH_CONFIG[17][45] = 50;
            MC_BIRTH_CONFIG[17][46] = 45;
            MC_BIRTH_CONFIG[17][47] = 40;
            MC_BIRTH_CONFIG[17][48] = 40;
            MC_BIRTH_CONFIG[17][49] = 40;
            MC_BIRTH_CONFIG[17][50] = 40;
            MC_BIRTH_CONFIG[18] = {};
            MC_BIRTH_CONFIG[18][1] = 100;
            MC_BIRTH_CONFIG[18][2] = 100;
            MC_BIRTH_CONFIG[18][3] = 90;
            MC_BIRTH_CONFIG[18][4] = 80;
            MC_BIRTH_CONFIG[18][5] = 70;
            MC_BIRTH_CONFIG[18][6] = 60;
            MC_BIRTH_CONFIG[18][7] = 55;
            MC_BIRTH_CONFIG[18][8] = 50;
            MC_BIRTH_CONFIG[18][9] = 45;
            MC_BIRTH_CONFIG[18][10] = 40;
            MC_BIRTH_CONFIG[18][11] = 80;
            MC_BIRTH_CONFIG[18][12] = 75;
            MC_BIRTH_CONFIG[18][13] = 70;
            MC_BIRTH_CONFIG[18][14] = 65;
            MC_BIRTH_CONFIG[18][15] = 60;
            MC_BIRTH_CONFIG[18][16] = 55;
            MC_BIRTH_CONFIG[18][17] = 50;
            MC_BIRTH_CONFIG[18][18] = 45;
            MC_BIRTH_CONFIG[18][19] = 40;
            MC_BIRTH_CONFIG[18][20] = 40;
            MC_BIRTH_CONFIG[18][21] = 75;
            MC_BIRTH_CONFIG[18][22] = 70;
            MC_BIRTH_CONFIG[18][23] = 65;
            MC_BIRTH_CONFIG[18][24] = 60;
            MC_BIRTH_CONFIG[18][25] = 55;
            MC_BIRTH_CONFIG[18][26] = 50;
            MC_BIRTH_CONFIG[18][27] = 45;
            MC_BIRTH_CONFIG[18][28] = 40;
            MC_BIRTH_CONFIG[18][29] = 40;
            MC_BIRTH_CONFIG[18][30] = 40;
            MC_BIRTH_CONFIG[18][31] = 70;
            MC_BIRTH_CONFIG[18][32] = 65;
            MC_BIRTH_CONFIG[18][33] = 60;
            MC_BIRTH_CONFIG[18][34] = 55;
            MC_BIRTH_CONFIG[18][35] = 50;
            MC_BIRTH_CONFIG[18][36] = 45;
            MC_BIRTH_CONFIG[18][37] = 40;
            MC_BIRTH_CONFIG[18][38] = 40;
            MC_BIRTH_CONFIG[18][39] = 40;
            MC_BIRTH_CONFIG[18][40] = 40;
            MC_BIRTH_CONFIG[18][41] = 65;
            MC_BIRTH_CONFIG[18][42] = 60;
            MC_BIRTH_CONFIG[18][43] = 55;
            MC_BIRTH_CONFIG[18][44] = 50;
            MC_BIRTH_CONFIG[18][45] = 45;
            MC_BIRTH_CONFIG[18][46] = 40;
            MC_BIRTH_CONFIG[18][47] = 40;
            MC_BIRTH_CONFIG[18][48] = 40;
            MC_BIRTH_CONFIG[18][49] = 40;
            MC_BIRTH_CONFIG[18][50] = 40;
            MC_BIRTH_CONFIG[19] = 10;
            MC_BIRTH_CONFIG[20] = {
                "1":5,
                "2":25
            };
            MC_BIRTH_CONFIG[21] = 0.99;
            MC_BIRTH_CONFIG[22] = 5;
        }


        private static function loadKeayWords4399():void
        {
            var request:URLRequest;
            var loader:URLStream;
            var onLoadKeayWords4399:Function;
            request = new URLRequest("res/4399.txt");
            loader = new URLStream();
            onLoadKeayWords4399 = function (_arg_1:Event):void
            {
                var _local_2:URLStream;
                var _local_3:String;
                _local_2 = (_arg_1.currentTarget as URLStream);
                _local_3 = _local_2.readMultiByte(_local_2.bytesAvailable, "gb2312");
                Language.GAMEPREDEF_S[338] = _local_3;
            };
            loader.addEventListener(Event.COMPLETE, onLoadKeayWords4399);
            loader.load(request);
        }

        public static function set config(_arg_1:XML):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:RegExp;
            var _local_5:String;
            SERVER_ADD_GLOBAL = (SERVER_PROTOCAL_LOGIC + _arg_1.server.logic);
            SERVER_ADD_RES = _arg_1.server.resource;
            if (SERVER_ADD_REG == "#")
            {
                SERVER_ADD_REG = _arg_1.server.reg;
            };
            if (SERVER_ADD_PAY == "#")
            {
                SERVER_ADD_PAY = _arg_1.server.pay;
            };
            SERVER_ADD_GLO = _arg_1.server.logic;
            if (_arg_1.server.sdo)
            {
                SERVER_ADD_SDO = _arg_1.server.sdo;
            };
            SERVER_NAME = _arg_1.server.name;
            MASTER_DOMAIN = SERVER_ADD_GLO.split(":")[0];
            SERVER_PORT_AND_PATH = SERVER_ADD_GLO.split(":")[1];
            _local_2 = _arg_1.server.replayurl;
            if (_local_2.length > 0)
            {
                BATTLE_REPLAY_URL = _arg_1.server.replayurl;
            };
            if (ExternalInterface.available)
            {
                _local_3 = ExternalInterface.call("window.location.href.toString");
                if (_local_3)
                {
                    if (_local_3.indexOf("s2.qeedoo.com") >= 0)
                    {
                        SERVER_ADD_RES = SERVER_ADD_RES.replace("s.lezi.com", "s2.qeedoo.com");
                    }
                    else
                    {
                        _local_4 = /[s][1-9][0-9]*/;
                        if (_local_4.test(_local_3.toString()))
                        {
                            _local_5 = _local_4.exec(_local_3.toString());
                            if (_local_3.indexOf((_local_5 + ".mo.renren.com")) > 0)
                            {
                                SERVER_ADD_RES = SERVER_ADD_RES.replace((_local_5 + ".mo.renren.com"), (_local_5.replace("s", "x") + ".mo.renren.com"));
                            };
                        };
                    };
                };
            };
        }

        public static function set interfaceSetting(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:SharedObject;
            _local_2 = 0;
            while (_local_2 <= 3)
            {
                MSG_CHANNEL[_local_2].selected = Boolean(Number(_arg_1[("c" + _local_2)]));
                _local_2++;
            };
            GLOBAL_SETTING = _arg_1;
            _local_3 = SharedObject.getLocal("musicSetting");
            if (((_local_3) && (_local_3.data.hasOwnProperty("musicSetting"))))
            {
                GLOBAL_SETTING["am"] = _local_3.data.musicSetting;
            }
            else
            {
                _local_3.data.musicSetting = GLOBAL_SETTING["am"];
            };
            if (!Boolean(Number(GLOBAL_SETTING["flyEffect"])))
            {
                FLYING_ZOOM_RATE = 1;
                FLYING_PLAYER_ZOOM_RATE = 1;
            };
            if (!_arg_1.maxView)
            {
                GLOBAL_SETTING.maxView = 100;
            };
        }

        public static function set gconfig(_arg_1:XML):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:String;
            var _local_5:String;
            var _local_6:Array;
            var _local_7:int;
            var _local_8:String;
            SERVER_ADD_GUIDE = _arg_1.server.guide;
            SERVER_ADD_FESTIVAL = _arg_1.server.festival;
            SERVER_ADD_CLASSIFY = _arg_1.server.classify;
            SERVER_JUMP_IFEXIST = _arg_1.server.jnz;
            SERVER_ADD_PROXY = _arg_1.server.proxyServer;
            PANEL_WELFARE_VISIBLE = ((_arg_1.server.panel_welfare == "true") ? true : false);
            _local_2 = _arg_1.server.resource;
            _local_3 = _arg_1.server.reg;
            _local_4 = _arg_1.server.pay;
            if (_local_2.length > 0)
            {
                SERVER_ADD_RES = _arg_1.server.resource;
            };
            if (_local_3.length > 0)
            {
                SERVER_ADD_REG = _arg_1.server.reg;
            };
            if (_local_4.length > 0)
            {
                SERVER_ADD_PAY = _arg_1.server.pay;
            };
            if (ExternalInterface.available)
            {
                _local_8 = ExternalInterface.call("window.location.href.toString");
                if (_local_8)
                {
                    if (_local_8.indexOf("s2.qeedoo.com") >= 0)
                    {
                        SERVER_ADD_RES = SERVER_ADD_RES.replace("s.lezi.com", "s2.qeedoo.com");
                    };
                };
            };
            if (((_arg_1.server.test) && (_arg_1.server.test == 1)))
            {
                IS_TEST_CLIENT = true;
            };
            _local_5 = _arg_1.server.shop;
            if (_local_5 == null)
            {
                return;
            };
            _local_6 = _local_5.split(",");
            _local_7 = 0;
            while (_local_7 < _local_6.length)
            {
                SHOP_HIDE_LIST[_local_6[_local_7]] = "t";
                _local_7++;
            };
            if (SERVER_ADD_RES.indexOf("4399") >= 0)
            {
                Language.ANTIADDICTCANVAS_U[6] = Language.ANTIADDICTCANVAS_U[6].toString().replace("{webName}", Language.ANTIADDICTCANVAS_U[11]);
                loadKeayWords4399();
            }
            else
            {
                if (SERVER_ADD_REG.indexOf("kaixin") >= 0)
                {
                    Language.ANTIADDICTCANVAS_U[6] = Language.ANTIADDICTCANVAS_U[6].toString().replace("{webName}", Language.ANTIADDICTCANVAS_U[12]);
                }
                else
                {
                    if (SERVER_ADD_PAY.indexOf("duowan") >= 0)
                    {
                        Language.ANTIADDICTCANVAS_U[6] = Language.ANTIADDICTCANVAS_U[6].toString().replace("{webName}", Language.ANTIADDICTCANVAS_U[13]);
                    }
                    else
                    {
                        if (SERVER_ADD_RES.indexOf("game2") >= 0)
                        {
                            Language.ANTIADDICTCANVAS_U[6] = Language.ANTIADDICTCANVAS_U[6].toString().replace("{webName}", Language.ANTIADDICTCANVAS_U[41]);
                            loadKeayWords4399();
                        }
                        else
                        {
                            Language.ANTIADDICTCANVAS_U[6] = Language.ANTIADDICTCANVAS_U[6].toString().replace("{webName}", Language.ANTIADDICTCANVAS_U[10]);
                        };
                    };
                };
            };
        }

        public static function getServerName(_arg_1:Number):String
        {
            var _local_2:int;
            if (_arg_1 >= CROSS_CONTENTION_UINT_ID_START)
            {
                _local_2 = ((_arg_1 + 1) % CROSS_CONTENTION_UINT_ID_START);
                return (Language.CROSS_CONTENTION_PANEL_U[161] + _local_2);
            };
            if (((_arg_1 >= 500) && (_arg_1 <= 799)))
            {
                return (GamePredef.CROSS_CONTENTION_UNITED_SERVER_NAME[_arg_1]);
            };
            if ((((_arg_1 >= 0) && (_arg_1 < 500)) || (_arg_1 >= 800)))
            {
                return (_arg_1.toString());
            };
            return ("");
        }

        public static function set serverDualIp(_arg_1:XML):void
        {
            var _local_2:XMLList;
            var _local_3:String;
            var _local_4:String;
            var _local_5:int;
            var _local_6:XML;
            var _local_7:XMLList;
            var _local_8:XML;
            dnsConfig = _arg_1;
            _local_2 = _arg_1.elements();
            _local_3 = "";
            _local_4 = "";
            _local_5 = 0;
            for each (_local_6 in _local_2)
            {
                _local_3 = _local_6.@domain;
                if (_local_3 == GamePredef.MASTER_DOMAIN)
                {
                    while (ipList.length != 0)
                    {
                        ipList.pop();
                    };
                    _local_7 = _local_6.elements();
                    for each (_local_8 in _local_7)
                    {
                        _local_4 = _local_8.@sp;
                        ipList[_local_4] = _local_8.text().toString();
                        _local_5++;
                    };
                    break;
                };
            };
            if (_local_5 == 0)
            {
                DOMAIN_IN_LIST = false;
            }
            else
            {
                DOMAIN_IN_LIST = true;
            };
        }


        public function rtmpt():void
        {
        }


    }
}//package com.qeedoo.game.predef

