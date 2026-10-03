// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.view.ViewManager

package com.qeedoo.game.view
{
    import com.qeedoo.game.config.Language;
    import flash.display.Stage;
    import flash.display.Sprite;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.ui.ISlot;
    import flash.events.MouseEvent;
    import com.qeedoo.game.object.Creature;
    import flash.events.Event;
    import com.qeedoo.game.object.Pet;
    import flash.display.DisplayObject;

    public class ViewManager 
    {

        public static const TYPE_MAIN:uint = 1;
        public static const TYPE_PANEL:uint = 16;
        public static const TYPE_OTHER:uint = 0x0100;
        public static const TYPE_ALL:uint = 0x111111;
        public static const VIEW_APP:uint = 0;
        public static const MENU_POPUP:uint = 5;
        public static const UI_CONTAINER:uint = 10;
        public static const STAGE_CONTAINER:uint = 20;
        public static const STAGE_MAIN:uint = 25;
        public static const STAGE_BATTLE:uint = 30;
        public static const STAGE_MAIN_CONTAINER:uint = 31;
        public static const STAGE_BATTLE_CONTAINER:uint = 32;
        public static const STAGE_LOADING:uint = 34;
        public static const TOOLTIP_REQSTAR:uint = 39;
        public static const TOOLTIP_EQUIP:uint = 40;
        public static const TOOLTIP_BUILDING:uint = 41;
        public static const TOOLTIP_ACHIEVEMENT:uint = 42;
        public static const TOOLTIP_WING:uint = 43;
        public static const TOOLTIP_EVENT:uint = 44;
        public static const TOOLTIP_PET:uint = 45;
        public static const TOOLTIP_NPC:uint = 46;
        public static const TOOLTIP_SALEINFO:uint = 47;
        public static const TOOLTIP_STAR_BUILD:uint = 48;
        public static const TOOLTIP_TITLE:uint = 49;
        public static const TOOLTIP_SKILL:uint = 50;
        public static const TOOLTIP_QUEST:uint = 53;
        public static const TOOLTIP_MAP:uint = 54;
        public static const TOOLTIP_ITEM:uint = 55;
        public static const TOOLTIP_BATTLE:uint = 56;
        public static const VIEW_CANVAS_LOADING:uint = 57;
        public static const TOOLTIP_REQSKILL:uint = 58;
        public static const TOOLTIP_DEVSKILL:uint = 59;
        public static const TOOLTIP_PET_SOUL:uint = 61;
        public static const TOOLTIP_ALL_SOUL:uint = 62;
        public static const TOOLTIP_MOUNT:uint = 63;
        public static const TOOLTIP_MEDAL:uint = 64;
        public static const TOOLTIP_TALENT:uint = 65;
        public static const TOOLTIP_RECIPE:uint = 66;
        public static const TOOLTIP_DECO_SHOW:uint = 67;
        public static const TOOLTIP_DECO_RUNE:uint = 68;
        public static const TOOLTIP_RUNE_CHIP:uint = 69;
        public static const TOOLTIP_MYS_TREASURE:uint = 70;
        public static const TOOLTIP_PRS_CHIP:uint = 71;
        public static const TOOLTIP_MONSTERHEART:uint = 72;
        public static const TOOLTIP_PET_STONE:uint = 73;
        public static const FORE_L_R:uint = 60;
        public static const VIEW_FORE_LOGIN:uint = 70;
        public static const VIEW_FORE_REGISTER:uint = 80;
        public static const FORE_C_C:uint = 90;
        public static const D_PASS_PANEL:uint = 96;
        public static const VIEW_FORE_CHARACTORCHOOSE:uint = 100;
        public static const VIEW_FORE_CHARACTORCREATE:uint = 110;
        public static const MAIN_SELF:uint = 120;
        public static const MAIN_AUTO_BATTLE:uint = 121;
        public static const MAIN_AUTOBATTLE_SET:uint = 122;
        public static const MAIN_AUTO_EXP:uint = 123;
        public static const MAIN_GROUP:uint = 130;
        public static const MAIN_SYS:uint = 150;
        public static const MAIN_SYS_BTN_BAR:uint = 155;
        public static const MAIN_CHAT:uint = 160;
        public static const MAIN_LONGBUFF:uint = 165;
        public static const MAIN_LINE:uint = 170;
        public static const MAIN_MINIMAP:uint = 180;
        public static const MAIN_INCOME:uint = 190;
        public static const MAIN_WARN:uint = 195;
        public static const MAIN_AWARD_WARN:uint = 196;
        public static const MAIN_TEMP_BAG_WARN:uint = 197;
        public static const MAIN_TARGET:uint = 200;
        public static const MAIN_CNOTICE:uint = 201;
        public static const MAIN_RNOTICE:uint = 202;
        public static const MAIN_CONSUMP:uint = 203;
        public static const POPU_MONEYITEM:uint = 204;
        public static const MAIN_PET:uint = 205;
        public static const MAIN_ACTION:uint = 207;
        public static const MAIN_TARGET_SELECT:uint = 208;
        public static const MAIN_USER_BAR:uint = 209;
        public static const PANEL_QUEST_REWORD:uint = 210;
        public static const PANEL_TEST_SKILL:uint = 211;
        public static const PANEL_BATTLE_REWORD:uint = 220;
        public static const PANEL_CHARACTOR:uint = 230;
        public static const PANEL_BAG:uint = 240;
        public static const PANEL_SKILL:uint = 250;
        public static const PANEL_PLAN:uint = 260;
        public static const PANEL_PETMANAGER:uint = 265;
        public static const PANEL_PET:uint = 270;
        public static const PANEL_PETTRADE:uint = 275;
        public static const PANEL_QUEST:uint = 280;
        public static const PANEL_QUESTMANAGER:uint = 295;
        public static const PANEL_HELP:uint = 300;
        public static const CANVA_GUIDE:uint = 306;
        public static const POP_GUIDE:uint = 307;
        public static const PANEL_SYSTEM:uint = 310;
        public static const PANEL_INFO:uint = 320;
        public static const PANEL_BANK:uint = 330;
        public static const PANEL_GUILD:uint = 340;
        public static const PANEL_ADDGUILD:uint = 345;
        public static const PANEL_SHOP:uint = 350;
        public static const PANEL_NUM:uint = 360;
        public static const PANEL_TRADE:uint = 370;
        public static const PANEL_MAP:uint = 380;
        public static const PANEL_CONSOLE:uint = 390;
        public static const PANEL_CHATMANAGER:uint = 400;
        public static const PANEL_MAILMANAGER:uint = 410;
        public static const PANEL_MAIL:uint = 420;
        public static const PANEL_CHARACTORINFO:uint = 435;
        public static const PANEL_TASKMANAGER:uint = 440;
        public static const PANEL_SKILLMANAGER:uint = 445;
        public static const PANEL_TXT:uint = 450;
        public static const PANEL_EQUIPTFUNC:uint = 460;
        public static const PANEL_PETFUNC:uint = 463;
        public static const PANEL_PETADVANCED:uint = 464;
        public static const PANEL_AUCTION:uint = 465;
        public static const PANEL_LEARNSKILL:uint = 470;
        public static const PANEL_INPUT:uint = 480;
        public static const PANEL_CHARACTOR_PROPERTY:uint = 490;
        public static const PANEL_CHARACTOR_HONOR:uint = 500;
        public static const PANEL_CHARACTOR_NATURAL:uint = 510;
        public static const PANEL_ACTION:uint = 520;
        public static const PANEL_NPCFUNC:uint = 530;
        public static const PANEL_NPCFUNCOTHER:uint = 535;
        public static const PANEL_NPCSCRIPT:uint = 536;
        public static const PANEL_IM:uint = 540;
        public static const PANEL_SYSTEM_SHOP:uint = 550;
        public static const PANEL_SYSTEM_SHOP_TROLLEY:uint = 551;
        public static const PANEL_GROUP:uint = 560;
        public static const PANEL_GROUP_RECRUIT:uint = 561;
        public static const PANEL_GROUP_RECRUIT_NEW:uint = 562;
        public static const PANEL_GROUP_RECRUIT_DETAIL:uint = 563;
        public static const PANEL_GROUP_RECRUIT_UPDATE:uint = 564;
        public static const PANEL_PRODUCT:uint = 580;
        public static const PANEL_TREASURE:uint = 590;
        public static const PANEL_EXCHANGE:uint = 600;
        public static const PANEL_NUMINPUT:uint = 620;
        public static const PANEL_BATTLESET:uint = 630;
        public static const PANEL_TITLE:uint = 640;
        public static const PANEL_CALLBOARD:uint = 650;
        public static const PANEL_BATTLEAUTO:uint = 660;
        public static const PANEL_WB_BATTLEAUTO:uint = 661;
        public static const PANEL_ANSWER:uint = 670;
        public static const PANEL_AWARD:uint = 680;
        public static const PANEL_BLOODADD:uint = 681;
        public static const PANEL_ACTIVE:uint = 690;
        public static const PANEL_BOSSKEY:uint = 700;
        public static const PANEL_GUILDCONTRIB:uint = 710;
        public static const PANEL_GUILDWAREHOUSE:uint = 720;
        public static const PANEL_CONSTRUCTIONMANAGER:uint = 730;
        public static const PANEL_BUILDINFO:uint = 740;
        public static const PANEL_GUILD_SKILL_DEV:uint = 750;
        public static const PANEL_BUILDPROCESS:uint = 760;
        public static const PANEL_GUILDHELP:uint = 770;
        public static const PANEL_NPCSHOWMSG:uint = 780;
        public static const POP_NEW_PLAER_ALERT:uint = 781;
        public static const POP_LOCAL_ALERT:uint = 782;
        public static const PANEL_NPCSHOWRANK:uint = 790;
        public static const PANEL_LOTTO:uint = 791;
        public static const PANEL_LOTTO_BAG:uint = 792;
        public static const PANEL_MARRIAGE:uint = 793;
        public static const POP_MARRIAGE_SEEKING:uint = 794;
        public static const PANEL_CHANGE_COLOR:uint = 795;
        public static const POP_NEW_PLAER_GUIDE:uint = 796;
        public static const PANEL_WEDDING_BOOK:uint = 797;
        public static const PANEL_ACHIEVE:uint = 798;
        public static const PANEL_ACHIEVE_WATCHING:uint = 799;
        public static const PANEL_CHATCONFIG:uint = 800;
        public static const PANEL_FAZENDA:uint = 801;
        public static const PANEL_FAZENDA_SHOP:uint = 802;
        public static const PANEL_FAZENDA_BAG:uint = 803;
        public static const PANEL_STAR_ADDITION:uint = 804;
        public static const PANEL_STAR_EFFECT:uint = 805;
        public static const PANEL_STAR_SPEED_UP:uint = 806;
        public static const PANEL_AWARD_ALL:uint = 810;
        public static const PANEL_LIFESKILL:uint = 820;
        public static const PANEL_CROSS_BATTLE_RANK:uint = 821;
        public static const PANEL_WING_PREVIEW:uint = 823;
        public static const PANEL_WING_FUNC:uint = 822;
        public static const PANEL_GAMEINTRO:uint = 824;
        public static const PANEL_QUESTIONING:uint = 825;
        public static const PANEL_WING_ADVANCED:uint = 826;
        public static const PANEL_SHOW_LOVE:uint = 827;
        public static const POP_SEND_LOVE:uint = 828;
        public static const PANEL_TEMPORARY_BAG:uint = 829;
        public static const POP_AI_CONFIGURE:uint = 830;
        public static const PANEL_PETFIGHT_CONF:uint = 831;
        public static const POP_FAZENDA_LOG:uint = 832;
        public static const PANEL_MULITI_ITEM:uint = 833;
        public static const PANEL_PET_ARENA:uint = 834;
        public static const PANEL_PET_ARENA_RANK:uint = 835;
        public static const PANEL_PET_ARENA_PREV_RANK:uint = 836;
        public static const POP_STAR_BATTLE_REPORT:uint = 837;
        public static const PANEL_FAIRY_MANAGER:uint = 838;
        public static const PANEL_MAIL_NOTICE:uint = 839;
        public static const PANEL_WB_RESULT:uint = 840;
        public static const PANEL_WELFARE:uint = 841;
        public static const PANEL_TASKSWEEP:uint = 842;
        public static const PANEL_NEWSERVER:uint = 843;
        public static const PANEL_TITLE_CUSTOM:uint = 844;
        public static const NINE_BOSS_PANEL:uint = 845;
        public static const PANEL_WING_COLOR:uint = 846;
        public static const PANEL_SENDCOMBINE:uint = 847;
        public static const PANEL_PET_SOUL:uint = 848;
        public static const PANEL_CARDGAME:uint = 849;
        public static const PANEL_SOUL_EXP:uint = 850;
        public static const PANEL_SOUL_EXCHANGE:uint = 851;
        public static const PANEL_PM:uint = 852;
        public static const PANEL_PM_INFO:uint = 853;
        public static const PANEL_JEWEL_EXCHANGE:uint = 854;
        public static const PANEL_VIP_SHOP:uint = 855;
        public static const PANEL_PM_AUCTION:uint = 856;
        public static const PANEL_LOTTERY:uint = 857;
        public static const PANEL_LOTTERY_BAG:uint = 858;
        public static const PANEL_SIGN_IN:uint = 859;
        public static const PANEL_VIP_SUCCINCT:uint = 860;
        public static const PANEL_PVP_ROOM_LIST:uint = 861;
        public static const PANEL_PVP_RESULT:uint = 862;
        public static const PANEL_MOUNT:uint = 863;
        public static const PANEL_CHANGE_RES:uint = 864;
        public static const PANEL_LUCK_DRAW:uint = 865;
        public static const PANEL_LUCK_DRAW_BAG:uint = 866;
        public static const PANEL_MAGIC_ARRAY:uint = 867;
        public static const PANEL_MILITARY:uint = 868;
        public static const PANEL_MAZE:uint = 881;
        public static const PANEL_MAZE_QUESTION:uint = 882;
        public static const PANEL_MAZE_SHOP:uint = 875;
        public static const PANEL_MAZE_LOTTERY:uint = 876;
        public static const PANEL_MAZE_INFO:uint = 877;
        public static const PANEL_MAZE_EVENT_INFO:uint = 878;
        public static const PANEL_MAZE_PLAY_RULE:uint = 879;
        public static const PANEL_MAZE_DISC:uint = 880;
        public static const PANEL_Small_Game:uint = 869;
        public static const PANEL_Small_Game_HideSeek:uint = 870;
        public static const PANEL_Small_Game_TwoSame:uint = 871;
        public static const PANEL_Small_Game_MagicPower:uint = 872;
        public static const PANEL_Small_Game_Speed:uint = 873;
        public static const PANEL_MEDAL:uint = 874;
        public static const PANEL_ASTROLOGIC:uint = 883;
        public static const PANEL_PET_HANDBOOK:uint = 884;
        public static const PANEL_PET_EVOLUTION:uint = 885;
        public static const PANEL_FINDBACK:uint = 886;
        public static const PANEL_GUESS_NUMBER:uint = 887;
        public static const PANEL_CROSS_FIGHT:uint = 888;
        public static const PANEL_CROSS_FIGHT_TEAM:uint = 889;
        public static const PANEL_FAIRY_SKILL_CONFIG:uint = 890;
        public static const PANEL_BATTLE_INFO:uint = 891;
        public static const PANEL_CROSS_TEAM_FIGHT:uint = 892;
        public static const PANEL_CROSS_TEAM_FIGHT_BET:uint = 893;
        public static const PANEL_DOUBLE_ELEVEN:uint = 894;
        public static const PANEL_CROSS_CONTENTION_TOTAL:uint = 895;
        public static const PANEL_CROSS_CONTENTION_SINGLE:uint = 896;
        public static const PANEL_CROSS_CONTENTION_SINGLE_INFO:uint = 897;
        public static const PANEL_CROSS_CONTENTION_AREA:uint = 898;
        public static const PANEL_CROSS_CONTENTION_FIGHT:uint = 899;
        public static const PANEL_CROSS_CONTENTION_FIRST_AWARD:uint = 900;
        public static const PANEL_CROSS_CONTENTION_SCORE_AWARD:uint = 901;
        public static const PANEL_CROSS_CONTENTION_TIME_AWARD:uint = 902;
        public static const PANEL_CROSS_CONTENTION_BOSS_AREA:uint = 903;
        public static const PANEL_PET_TALENT:uint = 904;
        public static const PANEL_PET_TALENT_FUNC:uint = 905;
        public static const PANEL_TREASURE_BOWL:uint = 906;
        public static const PANEL_CROSS_CONTENTION_BATTLE_INFO:uint = 907;
        public static const PANEL_CROSS_CONTENTION_RANK:uint = 908;
        public static const PANEL_EXTRACT_CARD_ACTIVITY:uint = 909;
        public static const PANEL_STONE_SEAL:uint = 910;
        public static const PANEL_STONE_SEAL_BORE:uint = 911;
        public static const PANEL_FLOP_PASS:uint = 913;
        public static const PANEL_STAR_EXCHANGE:uint = 912;
        public static const PANEL_HULA:uint = 914;
        public static const PANEL_RETURN_REWARD:uint = 915;
        public static const PANEL_TRIALS:uint = 916;
        public static const PANEL_TRIALS_AWARD:uint = 917;
        public static const PANEL_DOTA:uint = 918;
        public static const PANEL_GROUPON:uint = 919;
        public static const PANEL_SUMMER_GAME:uint = 920;
        public static const PANEL_SUMMER_GAME_WASTELAND:uint = 921;
        public static const PANEL_WORLD_CUP:uint = 922;
        public static const PANEL_WORLD_CUP_VS:uint = 925;
        public static const PANEL_SUMMER_GAME_DIABETES:uint = 923;
        public static const PANEL_SUMMER_GAME_HORSE_RACE:uint = 924;
        public static const PANEL_DRESS:uint = 926;
        public static const PANEL_RECIPE_EXCHANGE:uint = 927;
        public static const PANEL_AUTOTASK:uint = 928;
        public static const PANEL_WORLD_CUP_CHANGE:uint = 929;
        public static const PANEL_NPC_SHOP:uint = 930;
        public static const PANEL_BOSS_DAILY:uint = 931;
        public static const PANEL_AWAKEN:uint = 932;
        public static const PANEL_WAWA_GAME:uint = 933;
        public static const PANEL_WAWA_CHANGE:uint = 934;
        public static const PANEL_CHARGE_NOTICE:uint = 935;
        public static const PANEL_MYSTERY_FURNACE:uint = 936;
        public static const PANEL_TRAIN_SOUL:uint = 937;
        public static const PANEL_JUHUASUAN:uint = 938;
        public static const PANEL_JUHUASUAN_ALERT:uint = 939;
        public static const PANEL_MANJIUJIAN:uint = 940;
        public static const PANEL_DECORATE:uint = 941;
        public static const PANEL_REBATEEVERYDAY:uint = 942;
        public static const PANEL_REBATEEVERYDAY_ALERT:uint = 943;
        public static const PANEL_TRIPLE_TOWN:uint = 944;
        public static const PANEL_TRIPLE_TURN:uint = 945;
        public static const PANEL_MONTHWELFARE:uint = 946;
        public static const PANEL_MONTHWELFARE_ALERT:uint = 947;
        public static const PANEL_MONTHWELFARE_BAG:uint = 948;
        public static const PANEL_HEIYAOSHI:uint = 949;
        public static const PANEL_HEIYAOSHI_ALERT:uint = 950;
        public static const PANEL_PET_REAl_SOUL:uint = 951;
        public static const PANEL_SECRET_TREASUREHUNT:uint = 952;
        public static const PANEL_SECRET_TREASUREHUNT_ALERT:uint = 953;
        public static const PANEL_SECRET_TREASUREHUNT_ONE:uint = 954;
        public static const PANEL_SECRET_TREASUREHUNT_END:uint = 955;
        public static const PANEL_SECRET_TREASUREHUNT_AUTO:uint = 956;
        public static const PANEL_BLOODY_BATTLE_INFO:uint = 957;
        public static const PANEL_WAR_BATTLE:uint = 958;
        public static const PANEL_HAPPYFRONTLINE:uint = 959;
        public static const PANEL_ANNIVERSARY:uint = 960;
        public static const PANEL_FARMMASTER:uint = 961;
        public static const PANEL_STONEMASTER:uint = 962;
        public static const PANEL_CUBEMASTER:uint = 963;
        public static const PANEL_MONSTERHEART:uint = 964;
        public static const PANEL_PETGUARD:uint = 965;
        public static const PANEL_PETGUARDINSIDE:uint = 966;
        public static const PANEL_DAILYSIGNINACT:uint = 967;
        public static const PANEL_MAGICCRYSTAL:uint = 968;
        public static const PANEL_STONETOGOLDACT:uint = 969;
        public static const PANEL_MOJINACT:uint = 970;
        public static const PANEL_QILING:uint = 971;
        public static const PANEL_PET_STONE:uint = 972;
        public static const PANEL_ADD_OPE:uint = 973;
        public static const PANEL_EXPLORER_MEDAL:uint = 974;
        public static const PANEL_SUDOKU:uint = 975;
        public static const PANEL_DUIDUIPENG:uint = 976;
        public static const PANEL_SHOWTIME:uint = 977;
        public static const PANEL_ANNI_ZHUANPAN:uint = 978;
        public static const PANEL_PET_PVE:uint = 979;
        public static const PANEL_PET_PVE_CONFIG:uint = 980;
        public static const POP_PET_PVE_AI_CONFIGURE:uint = 981;
        public static const PANEL_PK_GAME:uint = 982;
        public static const PANEL_PET_ARENA_ACTIVITY_RANK:uint = 983;
        public static const PANEL_PETFIGHT_CONF_ACTIVITY:uint = 984;
        public static const PANEL_PET_ARENA_PREV_ACTIVITY_RANK:uint = 985;
        public static const POP_AI_CONFIGURE_ACTIVITY:uint = 986;
        public static const PANEL_PET_ARENA_ACTIVITY:uint = 987;
        public static const PANEL_CONSUME_NOTICE_ACTIVITY:uint = 988;
        public static const PANEL_XIAOCHUSDASAI_ACTIVITY:uint = 989;
        public static const PANEL_PREPURCHASE_ACTIVITY:uint = 990;
        public static const PANEL_TEXUNKECHENG_ACTIVITY:uint = 991;
        public static const PANEL_TEXUNKECHENG_EXP_PANEL:uint = 992;
        public static const PANEL_XIULIAN_PANEL:uint = 993;
        public static const PANEL_MOYINTUCE_PANEL:uint = 994;
        public static const PANEL_REDENVELOPE_PANEL:uint = 995;
        public static const PANEL_MCZD:uint = 996;
        public static const PANEL_MCZD_PETFIGHT_CONF:uint = 997;
        public static const POP_MCZD_PET_PVE_AI_CONFIGURE:uint = 998;
        public static const POP_MCZD_BATTLE_REPORT:uint = 999;
        public static const PANEL_MCZD_ALL_RANK:uint = 1000;
        public static const PANEL_JXHD:uint = 1001;
        public static const PANEL_MQDT:uint = 1002;
        public static const PANEL_TKYYHInfo:uint = 1003;
        public static const PANEL_ANNIVERSARYSIGNIN:uint = 1004;
        public static const SCORENAME_CONFIG:Object = {};
        public static const NPCSHOP_CONFIG:Object = {
            "1":{
                "name":Language.NPC_SHOP_PANEL[0],
                "hint":Language.NPC_SHOP_PANEL[3],
                "data":Language.NPC_SHOP_PANEL[1],
                "score":Language.NPC_SHOP_PANEL[2],
                "prop":"wisdonCrystal"
            },
            "2":{
                "name":Language.NPC_SHOP_PANEL[100],
                "hint":Language.NPC_SHOP_PANEL[103],
                "data":Language.NPC_SHOP_PANEL[102],
                "score":Language.NPC_SHOP_PANEL[106],
                "prop":"couragePoint"
            },
            "3":{
                "name":Language.NPC_SHOP_PANEL[200],
                "hint":Language.NPC_SHOP_PANEL[203],
                "data":Language.NPC_SHOP_PANEL[202],
                "score":Language.NPC_SHOP_PANEL[204],
                "prop":"heroScore2507"
            },
            "4":{
                "name":Language.NPC_SHOP_PANEL[300],
                "hint":Language.NPC_SHOP_PANEL[303],
                "data":Language.NPC_SHOP_PANEL[302],
                "score":Language.NPC_SHOP_PANEL[304],
                "prop":"anni2017"
            },
            "5":{
                "name":Language.NPC_SHOP_PANEL[311],
                "hint":Language.NPC_SHOP_PANEL[303],
                "data":Language.NPC_SHOP_PANEL[312],
                "score":Language.NPC_SHOP_PANEL[313],
                "prop":"xmCandy24"
            },
            "6":{
                "name":Language.NPC_SHOP_PANEL[315],
                "hint":Language.NPC_SHOP_PANEL[303],
                "data":Language.NPC_SHOP_PANEL[316],
                "score":Language.NPC_SHOP_PANEL[317],
                "prop":"xcds2403p"
            },
            "7":{
                "name":Language.NPC_SHOP_PANEL[323],
                "hint":Language.NPC_SHOP_PANEL[303],
                "data":Language.NPC_SHOP_PANEL[324],
                "score":Language.NPC_SHOP_PANEL[325],
                "prop":"txkc2508p"
            },
            "8":{
                "name":"Truy tìm kho báu",
                "hint":Language.NPC_SHOP_PANEL[303],
                "data":Language.NPC_SHOP_PANEL[327],
                "score":"Xem tiến độ:",
                "prop":"dmbk2509p"
            },
            "9":{
                "name":"Lễ hội",
                "hint":Language.NPC_SHOP_PANEL[303],
                "data":Language.NPC_SHOP_PANEL[332],
                "score":"Thưởng:",
                "prop":"tkyyhpointV2"
            }
        };
        public static const MID_MAIN_WARN:uint = 999;
        private static const limitOpenIds:Array = [PANEL_HULA, PANEL_RETURN_REWARD, PANEL_TRIALS, PANEL_TRIALS_AWARD];
        public static const VIEW_BATTLE_PLAYERCMD:uint = 1450;
        public static const VIEW_BATTLE_PETCMD:uint = 1460;
        public static const VIEW_BATTLE_TIME:uint = 1470;
        public static const UI_MAIN:uint = 1600;
        public static const UI_PANEL:uint = 1610;
        public static const UI_TOOLTIP:uint = 1620;
        public static const UI_POPUP:uint = 1630;
        public static const UI_LOGIN:uint = 1640;
        public static const UI_SHADE:uint = 1650;
        public static const MAIN_BATTLE_PLAYER:uint = 2090;
        public static const MAIN_BATTLE_PET:uint = 2091;
        public static const MAIN_QUEST_GUIDE:uint = 2100;
        public static const MAIN_ADDICT_WARN:uint = 2110;
        public static const MAIN_GW_SCORE:uint = 2111;
        public static const MAIN_ADVENTURE:uint = 2112;
        public static const MAIN_GATHER_PROGRESS:uint = 2113;
        public static const MAIN_SYSTEM_INFO:uint = 2114;
        public static const MAIN_DOG_FIGHT:uint = 2115;
        public static const MAIN_ADD_ITEM_EFFECT:uint = 2116;
        public static const MAIN_ADDICT_INFO:uint = 2117;
        public static const SHADE_PVP:uint = 5001;
        public static const POPU_PROGRESSBAR:uint = 9200;
        public static const POPU_SOUL_PRODUCT:uint = 9201;
        public static const POPU_PVP_WAIT:uint = 9202;
        public static const POPU_SYS_MSG:uint = 9300;
        public static const POPU_SYS_NOTE:uint = 9350;
        public static const POPU_WORLDMAP:uint = 9400;
        public static const POPU_UIHELP:uint = 9500;
        public static const POPU_WAIT:uint = 9600;
        public static const POPU_NET_SELECT:uint = 9700;
        public static const POPU_STAR_INSTACE_MAP:uint = 9900;
        public static const POPU_GM:uint = 19600;
        public static const POP_TEMP_BAG_SLOT:uint = 19700;
        public static const PANEL_WB_TIMER:uint = 19800;
        public static const WB_RANK_CANVAS:uint = 19900;
        public static const MAIN_ACTIVITY:uint = 20000;
        public static const DAILY_ACTIVITY:uint = 20001;
        public static const DETAIL_PROP_PANEL:uint = 30000;
        public static const DETAIL_PROP_PANEL_PET:uint = 30001;
        public static const SLOT_NUM:uint = 2800;
        public static const MAX_HOUSEWARE_SLOT_NUM:uint = 150;
        public static const PANEL_VDAY:uint = 2118;
        public static const POP_SEND_VDAY:uint = 2119;
        private static var _instance:ViewManager;

        private var _stage:Stage;
        private var _initialized:Boolean = false;
        private var _voDict:Object;
        private var _bDict:Object;
        private var _slotDict:Object;
        private var _actionState:int;
        private var _mouseIcon:Sprite;
        private var _nDict:Object;
        private var _pDict:Object;
        private var _uiDict:Object;
        private var _mouseState:int;
        private var _mousePetId:Number;
        private var _ipDict:Object;
        private var _mouseTargetType:int;
        private var _cDict:Object;
        private var _eDict:Object;
        private var _sDict:Object;

        {
            SCORENAME_CONFIG[32] = Language.NPC_SHOP_PANEL[9];
            SCORENAME_CONFIG[34] = Language.NPC_SHOP_PANEL[101];
            SCORENAME_CONFIG[41] = Language.NPC_SHOP_PANEL[201];
            SCORENAME_CONFIG[49] = Language.NPC_SHOP_PANEL[301];
            SCORENAME_CONFIG[66] = Language.NPC_SHOP_PANEL[314];
            SCORENAME_CONFIG[67] = Language.NPC_SHOP_PANEL[318];
            SCORENAME_CONFIG[68] = Language.NPC_SHOP_PANEL[326];
            SCORENAME_CONFIG[70] = Language.NPC_SHOP_PANEL[328];
            SCORENAME_CONFIG[72] = Language.NPC_SHOP_PANEL[331];
        }

        public function ViewManager(_arg_1:Single)
        {
        }

        public static function getInstance():ViewManager
        {
            if (_instance == null)
            {
                _instance = new ViewManager(new Single());
            };
            return (_instance);
        }


        public function set stage(_arg_1:Stage):void
        {
            _stage = _arg_1;
        }

        public function show(_arg_1:uint):void
        {
            setVisible(_arg_1, true);
        }

        public function get stage():Stage
        {
            return (_stage);
        }

        public function showBlueMsg(_arg_1:String):void
        {
            var _local_2:Object = getUI(ViewManager.MAIN_CHAT);
            _local_2.showBlueMsg(_arg_1);
        }

        public function init(_arg_1:Stage):void
        {
            _uiDict = {};
            _voDict = {};
            _slotDict = {};
            _cDict = {};
            _nDict = {};
            _sDict = {};
            _ipDict = {};
            _bDict = {};
            _eDict = {};
            _pDict = {};
            _actionState = GamePredef.ACTION_NONE;
            _mouseState = GamePredef.ACTION_NONE;
            _stage = _arg_1;
        }

        public function addVO(_arg_1:uint, _arg_2:Object):void
        {
            _voDict[_arg_1] = _arg_2;
        }

        public function removeB(_arg_1:Number):void
        {
            if (_bDict[_arg_1])
            {
                _bDict[_arg_1].destroy();
                delete _bDict[_arg_1];
            };
        }

        public function removeE(_arg_1:Number):void
        {
            if (_eDict[_arg_1])
            {
                _eDict[_arg_1].destroy();
                delete _eDict[_arg_1];
            };
        }

        public function hide(_arg_1:uint):void
        {
            setVisible(_arg_1, false);
        }

        public function get nDict():Object
        {
            return (_nDict);
        }

        public function addSlot(_arg_1:int, _arg_2:ISlot):void
        {
            _slotDict[(SLOT_NUM + _arg_1)] = _arg_2;
        }

        public function removeN(_arg_1:Number):void
        {
            if (_nDict[_arg_1])
            {
                _nDict[_arg_1].destroy();
                delete _nDict[_arg_1];
            };
        }

        public function removeP(_arg_1:Number):void
        {
            if (_pDict[_arg_1])
            {
                _pDict[_arg_1].destroy();
                delete _pDict[_arg_1];
            };
        }

        public function get pDict():Object
        {
            return (_pDict);
        }

        public function removeC(_arg_1:Number):void
        {
            if (_cDict[_arg_1])
            {
                _cDict[_arg_1].destroy();
                delete _cDict[_arg_1];
            };
        }

        public function removeS(_arg_1:int):void
        {
            _sDict[_arg_1].visible = false;
            delete _sDict[_arg_1];
        }

        public function showLottoBlueMsg(_arg_1:String):void
        {
            var _local_2:Object = getUI(ViewManager.PANEL_LOTTO);
            if (_local_2)
            {
                _local_2.showLottoBlueMsg(_arg_1);
            };
        }

        public function reset():void
        {
            var _local_1:Object;
            var _local_2:Object;
            for each (_local_1 in _uiDict)
            {
                if (_local_1.hasOwnProperty("reset"))
                {
                    _local_1.reset();
                };
            };
            for each (_local_2 in _slotDict)
            {
                if (_local_2.hasOwnProperty("clean"))
                {
                    _local_2.clean();
                };
            };
        }

        public function showSelect():void
        {
            restoreUI();
            _stage.addEventListener(MouseEvent.MOUSE_DOWN, restoreUI);
            hide(UI_CONTAINER);
            show(MAIN_TARGET_SELECT);
        }

        public function showAll(_arg_1:uint=1):void
        {
            var _local_2:Object;
            for each (_local_2 in _uiDict)
            {
                if ((((_local_2.hasOwnProperty("show")) && (_local_2.hasOwnProperty("viewType"))) && (_local_2.viewType & _arg_1)))
                {
                    _local_2.show();
                };
            };
        }

        public function getUI(_arg_1:uint):Object
        {
            if (!_uiDict[_arg_1])
            {
                createUI(_arg_1);
            };
            return (_uiDict[_arg_1]);
        }

        public function showMidMsg(_arg_1:String):void
        {
            var _local_2:Object = getUI(ViewManager.POPU_SYS_MSG);
            _local_2.addText(_arg_1);
        }

        public function getSlot(_arg_1:int):ISlot
        {
            return (_slotDict[(SLOT_NUM + _arg_1)]);
        }

        public function switchLayer(_arg_1:Creature, _arg_2:Boolean):void
        {
            getUI(STAGE_MAIN_CONTAINER).switchC(_arg_1, _arg_2);
        }

        private function setEnabled(_arg_1:uint, _arg_2:Boolean=true):void
        {
            var _local_3:Object = getUI(_arg_1);
            if (_local_3)
            {
                _local_3.enabled = _arg_2;
            };
        }

        public function enable(_arg_1:uint):void
        {
            setEnabled(_arg_1, false);
        }

        public function get ipDict():Object
        {
            return (_ipDict);
        }

        public function addIP(_arg_1:int, _arg_2:Object):void
        {
            _ipDict[_arg_1] = _arg_2;
        }

        public function showRedMsg(_arg_1:String):void
        {
            var _local_2:Object = getUI(ViewManager.MAIN_CHAT);
            _local_2.showRedMsg(_arg_1);
        }

        public function getVO(_arg_1:uint):Object
        {
            return (_voDict[_arg_1]);
        }

        private function createUI(_arg_1:uint):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            if (((_voDict[_arg_1]) && (_voDict[_arg_1].cls)))
            {
                _local_2 = _voDict[_arg_1];
                _local_3 = new ((_local_2.cls as Class))();
                _uiDict[_arg_1] = _local_3;
                for (_local_4 in _local_2.prop)
                {
                    _local_3[_local_4] = _local_2.prop[_local_4];
                };
                for (_local_5 in _local_2.style)
                {
                    _local_3.setStyle(_local_5.toString(), _local_2.style[_local_5].toString());
                };
                if (_local_2.initVisible)
                {
                    _local_2.parent.addChild(_local_3);
                }
                else
                {
                    _local_3.container = _local_2.parent;
                };
            };
        }

        public function resoreMouse(_arg_1:Event=null):void
        {
            _stage.removeEventListener(MouseEvent.CLICK, resoreMouse);
            if (_mouseIcon)
            {
                _mouseIcon.stopDrag();
                _stage.removeChild(_mouseIcon);
                _mouseIcon = null;
            };
            _mouseState = GamePredef.ACTION_NONE;
        }

        public function showMidNote(_arg_1:String):void
        {
            var _local_2:Object = getUI(ViewManager.POPU_SYS_NOTE);
            _local_2.addText(_arg_1);
        }

        public function changeVisible(_arg_1:uint):void
        {
            if (limitOpenIds.indexOf(_arg_1) > -1)
            {
                return;
            };
            var _local_2:Object = getUI(_arg_1);
            if (_local_2)
            {
                _local_2.visible = (!(_local_2.visible));
            };
        }

        public function showMouse(_arg_1:Class):void
        {
            resoreMouse();
            _stage.addEventListener(MouseEvent.CLICK, resoreMouse);
            _mouseIcon = new (_arg_1)();
            _mouseIcon.x = (_stage.mouseX + 10);
            _mouseIcon.y = (_stage.mouseY + 10);
            _mouseIcon.startDrag();
            _stage.addChild(_mouseIcon);
        }

        public function restoreUI(_arg_1:Event=null):void
        {
            _stage.removeEventListener(MouseEvent.MOUSE_DOWN, restoreUI);
            show(UI_CONTAINER);
            hide(MAIN_TARGET_SELECT);
            _actionState = GamePredef.ACTION_NONE;
        }

        public function showLotteryBlueMsg(_arg_1:String):void
        {
            var _local_2:Object = getUI(ViewManager.PANEL_LOTTERY);
            if (_local_2)
            {
                _local_2.showLotteryBlueMsg(_arg_1);
            };
        }

        public function removeIP(_arg_1:int):void
        {
            if (_ipDict[_arg_1])
            {
                _ipDict[_arg_1].destroy();
                delete _ipDict[_arg_1];
            };
        }

        public function getB(_arg_1:Number):Object
        {
            return (_bDict[_arg_1]);
        }

        public function getC(_arg_1:Number):Object
        {
            return (_cDict[_arg_1]);
        }

        public function getE(_arg_1:Number):Object
        {
            return (_eDict[_arg_1]);
        }

        private function setVisible(_arg_1:uint, _arg_2:Boolean=true):void
        {
            var _local_3:Object = getUI(_arg_1);
            if (_local_3)
            {
                _local_3.visible = _arg_2;
            };
        }

        public function clearStage():void
        {
            destroyList(_cDict);
            destroyList(_sDict);
            destroyList(_nDict);
            destroyList(_ipDict);
            destroyList(_eDict);
            destroyList(_bDict);
            destroyList(_pDict);
        }

        public function get cDict():Object
        {
            return (_cDict);
        }

        public function getS(_arg_1:int):Object
        {
            return (_sDict[_arg_1]);
        }

        public function getN(_arg_1:Number):Object
        {
            return (_nDict[_arg_1]);
        }

        public function addB(_arg_1:Object):void
        {
            _bDict[_arg_1.id] = getUI(STAGE_MAIN_CONTAINER).addB(_arg_1);
        }

        public function addC(_arg_1:Object):void
        {
            _cDict[_arg_1.id] = getUI(STAGE_MAIN_CONTAINER).addC(_arg_1);
        }

        public function addE(_arg_1:Object):void
        {
            _eDict[_arg_1.id] = getUI(STAGE_MAIN_CONTAINER).addB(_arg_1);
        }

        private function destroyList(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            for (_local_2 in _arg_1)
            {
                _local_3 = _arg_1[_local_2];
                _local_3.destroy();
                delete _arg_1[_local_2];
            };
            _arg_1 = null;
            _arg_1 = {};
        }

        public function get sDict():Object
        {
            return (_sDict);
        }

        public function addN(_arg_1:Object):void
        {
            _nDict[_arg_1.id] = getUI(STAGE_MAIN_CONTAINER).addN(_arg_1);
        }

        public function addP(_arg_1:Pet):void
        {
            _pDict[_arg_1.cid] = getUI(STAGE_MAIN_CONTAINER).addP(_arg_1);
        }

        public function showSysMsg(_arg_1:String):void
        {
            var _local_2:Object = getUI(ViewManager.MAIN_CHAT);
            _local_2.showSystemMsg(_arg_1);
        }

        public function addS(_arg_1:Object):void
        {
            _sDict[_arg_1.id] = getUI(STAGE_MAIN_CONTAINER).addS(_arg_1);
            if (_arg_1.type == 3)
            {
                addIP(_arg_1.id, _sDict[_arg_1.id]);
            };
        }

        public function initView(_arg_1:uint):void
        {
            getUI(_arg_1).initView();
        }

        public function set mouseState(_arg_1:int):void
        {
            _mouseState = _arg_1;
        }

        public function getP(_arg_1:Number):Object
        {
            return (_pDict[_arg_1]);
        }

        public function set mouseTargetType(_arg_1:int):void
        {
            _mouseTargetType = _arg_1;
        }

        public function isVisible(_arg_1:uint):Boolean
        {
            var _local_2:Object = getUI(_arg_1);
            if (_local_2)
            {
                return (_local_2.visible);
            };
            return (false);
        }

        public function set mousePetId(_arg_1:Number):void
        {
            _mousePetId = _arg_1;
        }

        public function get mouseState():int
        {
            return (_mouseState);
        }

        public function disable(_arg_1:uint):void
        {
            setEnabled(_arg_1, true);
        }

        public function get mouseTargetType():int
        {
            return (_mouseTargetType);
        }

        public function get mousePetId():Number
        {
            return (_mousePetId);
        }

        public function set actionState(_arg_1:int):void
        {
            _actionState = _arg_1;
        }

        public function get actionState():int
        {
            return (_actionState);
        }

        public function addUI(_arg_1:uint, _arg_2:DisplayObject, _arg_3:Boolean=false):void
        {
            _uiDict[_arg_1] = _arg_2;
            _arg_2.visible = _arg_3;
        }

        public function getIP(_arg_1:int):Object
        {
            return (_ipDict[_arg_1]);
        }

        public function hideAll(_arg_1:uint=1):void
        {
            var _local_2:Object;
            for each (_local_2 in _uiDict)
            {
                if (!((_local_2.hasOwnProperty("hideAble")) && (!(_local_2.hideAble))))
                {
                    if ((((_local_2.hasOwnProperty("hide")) && (_local_2.hasOwnProperty("viewType"))) && (_local_2.viewType & _arg_1)))
                    {
                        _local_2.hide();
                    };
                };
            };
        }


    }
}//package com.qeedoo.game.view

class Single 
{


}


