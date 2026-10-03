// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MonsterHeartPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.MonsterHeartSlot;
    import mx.controls.Label;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Image;
    import mx.controls.CheckBox;
    import mx.containers.Canvas;
    import mx.controls.NumericStepper;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.controls.HRule;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.game.data.DataManager;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.view.comp.TipMonsterHeart;
    import mx.events.NumericStepperEvent;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    use namespace mx_internal;

    public class MonsterHeartPanel extends DragableCanvas implements IBindingClient 
    {

        private static var countPerPage:uint = 18;
        private static var labelCountPerPage:uint = 9;
        private static var Max_Level:uint = 6;
        private static var displayNum:uint = 148;
        private static var BagTypeArr:Array = ["ren", "shou", "zhi", "ji", "mo", "lon", "te"];
        private static var MHUPMH_RATE:Object = {
            "1":{
                "1":0,
                "2":25,
                "3":50,
                "4":75,
                "5":100
            },
            "2":{
                "1":0,
                "2":20,
                "3":40,
                "4":60,
                "5":80
            },
            "3":{
                "1":0,
                "2":15,
                "3":30,
                "4":45,
                "5":60
            },
            "4":{
                "1":0,
                "2":10,
                "3":20,
                "4":30,
                "5":40
            },
            "5":{
                "1":0,
                "2":1,
                "3":5,
                "4":10,
                "5":20
            }
        };
        public static var JGZ_COLOR:Object = {
            "0":"【Cấp 1】",
            "1":"【Cấp 2】",
            "6":"【Cấp 3】",
            "11":"【Cấp 4】",
            "16":"【Cấp 5】"
        };
        private static var HTYPE_NAME:Array = ["", "Người", "Thú", "TV", "Máy", "Ma", "Long", "BOSS"];
        private static var fangxiangArr:Array = [1, 2, 0, 2, 1, 0, 0, 1, 2, 0, 2, 1];
        private static var resIconArr:Array = [[4130220000708, 4130220001028, 4130220000908, 4130220001018, 4130220000808, 4130220001038], [4130220000709, 4130220001029, 4130220000909, 4130220001019, 4130220000809, 4130220001039], [4130220000707, 4130220001027, 4130220000907, 4130220001017, 4130220000807, 4130220001037]];
        private static var levelIconArr:Array = [[4130220000727, 4130220000728, 4130220000729, 4130220000730, 4130220000731, 4130220000727], [4130220000732, 4130220000733, 4130220000734, 4130220000735, 4130220000736, 4130220000732], [4130220000737, 4130220000738, 4130220000739, 4130220000740, 4130220000741, 4130220000737], [4130220000742, 4130220000743, 4130220000744, 4130220000745, 4130220000746, 4130220000742], [4130220000747, 4130220000748, 4130220000749, 4130220000750, 4130220000751, 4130220000747]];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _61299297jinshiHeartSlot:MonsterHeartSlot;
        private var _339046421showMax2:Label;
        private var _514994608holeNum6:MonsterHeartSlot;
        private var _1919589879showName1:Label;
        private var _453832204showHeart5:Label;
        private var _808329852vsFlop:ViewStack;
        private var _514994611holeNum3:MonsterHeartSlot;
        private var _344721025bagBtn3:BasicGlowButton;
        private var _397275891bagHole16:MonsterHeartSlot;
        private var _1409449289pageSelectLabel:PageSelector;
        private var _1919589872showName8:Label;
        private var _279430197afterUpSlot:MonsterHeartSlot;
        private var _453832207showHeart8:Label;
        private var choiceBox:int = 1;
        private var _1011903869mhTitle:BasicTitleCanvas;
        private var _338940989showPro3:Label;
        public var _MonsterHeartPanel_Image15:Image;
        public var _MonsterHeartPanel_Image16:Image;
        public var _MonsterHeartPanel_Image17:Image;
        public var _MonsterHeartPanel_Image18:Image;
        public var _MonsterHeartPanel_Image19:Image;
        private var _338940985showPro7:Label;
        private var _1892607996imLine4:Image;
        private var _1863324754bangBtn2:BasicGlowButton;
        private var _397275895bagHole12:MonsterHeartSlot;
        public var _MonsterHeartPanel_Image21:Image;
        private var _344721021bagBtn7:BasicGlowButton;
        public var _MonsterHeartPanel_Image20:Image;
        private var _1919589876showName4:Label;
        private var _2091025333bagHole3:MonsterHeartSlot;
        private var labelPageNo:uint = 0;
        private var _339046417showMax6:Label;
        private var _339046420showMax3:Label;
        private var _344721026bagBtn2:BasicGlowButton;
        private var _2003452392upSuccessRate:Label;
        private var _1892608000imLine8:Image;
        private var _514994607holeNum7:MonsterHeartSlot;
        private var _453832200showHeart1:Label;
        private var _2091301004needExpText:Label;
        private var _514994610holeNum4:MonsterHeartSlot;
        private var _1054773958levelShowImage:Image;
        private var _397275892bagHole15:MonsterHeartSlot;
        private var _453832203showHeart4:Label;
        private var _1919589873showName7:Label;
        private var _1464427278showCombine4:Label;
        private var _changed:Boolean = false;
        private var _1892607997imLine5:Image;
        private var _1464427281showCombine1:Label;
        private var _338940988showPro4:Label;
        private var _344721022bagBtn6:BasicGlowButton;
        private var _338940991showPro1:Label;
        private var _338940984showPro8:Label;
        private var _1458694313imLine10:Image;
        private var _453832206showHeart7:Label;
        private var itemPageNo:uint = 0;
        private var _2091025329bagHole7:MonsterHeartSlot;
        private var _1333480055ifUseJinshiHeart:CheckBox;
        private var _2091025336bagHole0:MonsterHeartSlot;
        private var _2091025332bagHole4:MonsterHeartSlot;
        private var _397275896bagHole11:MonsterHeartSlot;
        private var _1919589877showName3:Label;
        private var _344721027bagBtn1:BasicGlowButton;
        private var _1892608001imLine9:Image;
        private var _339046416showMax7:Label;
        private var _1450694496BagCanvas:Canvas;
        private var _1892607993imLine1:Image;
        private var _636843653upGradeJishu:NumericStepper;
        private var _514994613holeNum1:MonsterHeartSlot;
        private var _1280191633needUpSlot:MonsterHeartSlot;
        private var _1599588207resolveExp:Label;
        private var _1892607998imLine6:Image;
        private var _344721023bagBtn5:BasicGlowButton;
        private var _397275893bagHole14:MonsterHeartSlot;
        private var _1600033182nowBoxLevelLab:Label;
        private var _338940987showPro5:Label;
        private var monsterHeartBagAdded:Boolean = false;
        private var _1919589874showName6:Label;
        private var _338940983showPro9:Label;
        private var _453832202showHeart3:Label;
        private var _338940990showPro2:Label;
        private var _1458694312imLine11:Image;
        private var _2091025328bagHole8:MonsterHeartSlot;
        private var choiceBag:int = 1;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _2091025335bagHole1:MonsterHeartSlot;
        private var _2091025331bagHole5:MonsterHeartSlot;
        private var _453832205showHeart6:Label;
        private var _1892607994imLine2:Image;
        private var _1730037146needExpLab:Label;
        private var _1464427277showCombine5:Label;
        private var _397275897bagHole10:MonsterHeartSlot;
        private var _339046415showMax8:Label;
        private var _1460564552haveExpLab:Label;
        private var _1919589878showName2:Label;
        private var _339046419showMax4:Label;
        private var _1464427280showCombine2:Label;
        private var _339046422showMax1:Label;
        private var _514994609holeNum5:MonsterHeartSlot;
        public var _MonsterHeartPanel_Image1:Image;
        private var _397275890bagHole17:MonsterHeartSlot;
        private var _453832208showHeart9:Label;
        private var _1952778762resolveSlot:MonsterHeartSlot;
        private var _1919589871showName9:Label;
        private var _514994612holeNum2:MonsterHeartSlot;
        private var _boxIndex:Number = 1;
        private var _1892607999imLine7:Image;
        private var _1573867231ifUseByGold:CheckBox;
        private var _344721024bagBtn4:BasicGlowButton;
        private var _338940986showPro6:Label;
        private var _397275894bagHole13:MonsterHeartSlot;
        private var _402246975resolveNumNS:NumericStepper;
        private var _1919589875showName5:Label;
        private var _1458694311imLine12:Image;
        private var _1273109611pageSelect:PageSelector;
        private var _2091025327bagHole9:MonsterHeartSlot;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _2091025334bagHole2:MonsterHeartSlot;
        private var _1892607995imLine3:Image;
        private var _2091025330bagHole6:MonsterHeartSlot;
        private var _1523019390maxResolveNum:Number = 999;
        private var _453832201showHeart2:Label;
        private var _281628040nowRatioLab:Label;
        private var _339046418showMax5:Label;
        private var _1464427279showCombine3:Label;
        private var _339046414showMax9:Label;
        private var max_slot:uint = 180;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":720,
                    "height":480,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"mhTitle",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn0",
                        "events":{"click":"__bangBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "labelPlacement":"bottom",
                                "width":60,
                                "height":25,
                                "x":18,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn1",
                        "events":{"click":"__bangBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "width":110,
                                "height":25,
                                "x":78,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn2",
                        "events":{"click":"__bangBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "width":60,
                                "height":25,
                                "x":188,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bagBtn1",
                        "events":{"click":"__bagBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "label":"Người",
                                "labelPlacement":"bottom",
                                "width":25,
                                "height":25,
                                "x":473,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bagBtn2",
                        "events":{"click":"__bagBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "label":"Thú",
                                "labelPlacement":"bottom",
                                "width":25,
                                "height":25,
                                "x":498,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bagBtn3",
                        "events":{"click":"__bagBtn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "label":"TV",
                                "labelPlacement":"bottom",
                                "width":25,
                                "height":25,
                                "x":523,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bagBtn4",
                        "events":{"click":"__bagBtn4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "label":"Máy",
                                "labelPlacement":"bottom",
                                "width":25,
                                "height":25,
                                "x":548,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bagBtn5",
                        "events":{"click":"__bagBtn5_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "label":"Ma",
                                "labelPlacement":"bottom",
                                "width":25,
                                "height":25,
                                "x":573,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bagBtn6",
                        "events":{"click":"__bagBtn6_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "label":"Long",
                                "labelPlacement":"bottom",
                                "width":25,
                                "height":25,
                                "x":598,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bagBtn7",
                        "events":{"click":"__bagBtn7_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "label":"BOSS",
                                "labelPlacement":"bottom",
                                "width":33,
                                "height":25,
                                "x":623,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsFlop",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":9,
                                "y":59,
                                "width":704,
                                "height":404,
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":59,
                                            "x":9,
                                            "width":704,
                                            "height":404,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MonsterHeartPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "width":704,
                                                        "height":404
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "label":"Hornor",
                                                        "y":0,
                                                        "x":0,
                                                        "width":450,
                                                        "height":400,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"levelShowImage",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":56,
                                                                    "y":37,
                                                                    "width":40,
                                                                    "height":54
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":30,
                                                                    "x":64.5,
                                                                    "width":321,
                                                                    "height":346,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":49,
                                                                                "y":40,
                                                                                "width":105,
                                                                                "height":69
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":162,
                                                                                "y":233,
                                                                                "width":105,
                                                                                "height":69
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":165,
                                                                                "y":169,
                                                                                "width":102,
                                                                                "height":74
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":52,
                                                                                "y":228,
                                                                                "width":102,
                                                                                "height":74
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":52,
                                                                                "y":174,
                                                                                "width":102,
                                                                                "height":69
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":162,
                                                                                "y":103,
                                                                                "width":105,
                                                                                "height":69
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":163.5,
                                                                                "y":37,
                                                                                "width":102,
                                                                                "height":74
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":52,
                                                                                "y":97,
                                                                                "width":102,
                                                                                "height":74
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":17,
                                                                                "height":113,
                                                                                "x":260.5,
                                                                                "y":114
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":17,
                                                                                "height":113,
                                                                                "x":152,
                                                                                "y":174
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":17,
                                                                                "height":113,
                                                                                "x":41,
                                                                                "y":114
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"imLine3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":17,
                                                                                "height":113,
                                                                                "x":152,
                                                                                "y":53
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_MonsterHeartPanel_Image15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":321,
                                                                                "height":346,
                                                                                "x":0,
                                                                                "y":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MonsterHeartSlot,
                                                                        "id":"holeNum1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "monsterHeartHolePos":1,
                                                                                "width":34,
                                                                                "height":34,
                                                                                "y":153,
                                                                                "x":143
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MonsterHeartSlot,
                                                                        "id":"holeNum2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "monsterHeartHolePos":2,
                                                                                "width":34,
                                                                                "height":34,
                                                                                "y":28,
                                                                                "x":143
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MonsterHeartSlot,
                                                                        "id":"holeNum3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "monsterHeartHolePos":3,
                                                                                "width":34,
                                                                                "height":34,
                                                                                "y":89,
                                                                                "x":253
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MonsterHeartSlot,
                                                                        "id":"holeNum4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "monsterHeartHolePos":4,
                                                                                "width":34,
                                                                                "height":34,
                                                                                "y":214,
                                                                                "x":253
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MonsterHeartSlot,
                                                                        "id":"holeNum5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "monsterHeartHolePos":5,
                                                                                "width":34,
                                                                                "height":34,
                                                                                "y":273,
                                                                                "x":142
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MonsterHeartSlot,
                                                                        "id":"holeNum6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "monsterHeartHolePos":6,
                                                                                "width":34,
                                                                                "height":34,
                                                                                "y":214,
                                                                                "x":33
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MonsterHeartSlot,
                                                                        "id":"holeNum7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "monsterHeartHolePos":7,
                                                                                "width":34,
                                                                                "height":34,
                                                                                "y":89,
                                                                                "x":33
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MonsterHeartPanel_Button1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "4";
                                                                this.verticalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"styleName":"WspPageSelLeft"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MonsterHeartPanel_Button2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "4";
                                                                this.verticalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"styleName":"WspPageSelRight"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"needExpText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":280,
                                                                    "y":320,
                                                                    "text":"Ma Năng cần：",
                                                                    "width":91
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":280,
                                                                    "y":341,
                                                                    "text":"Ma Năng có：",
                                                                    "width":91
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"needExpLab",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":374,
                                                                    "y":320,
                                                                    "text":"0",
                                                                    "width":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"haveExpLab",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":374,
                                                                    "y":341,
                                                                    "width":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "events":{"click":"___MonsterHeartPanel_BasicGlowButton11_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":329,
                                                                    "y":367,
                                                                    "label":"Thăng cấp"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":17,
                                                                    "y":350,
                                                                    "text":"Cấp:"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"nowBoxLevelLab",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":90,
                                                                    "y":350,
                                                                    "text":"Lv1"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":17,
                                                                    "y":370,
                                                                    "text":"Hệ số tăng:",
                                                                    "width":89
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"nowRatioLab",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":101,
                                                                    "y":370,
                                                                    "text":"0%"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "label":"Hornor",
                                                        "y":195,
                                                        "width":250,
                                                        "height":205,
                                                        "x":453,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":98.5,
                                                                    "y":10,
                                                                    "text":"Tổ hợp tăng"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HRule,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":40,
                                                                    "y":33,
                                                                    "width":170
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":43,
                                                                    "text":"Label",
                                                                    "width":230
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":69,
                                                                    "text":"Label",
                                                                    "width":230
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":95,
                                                                    "text":"Label",
                                                                    "width":230
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":121,
                                                                    "text":"Label",
                                                                    "width":230
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":147,
                                                                    "text":"Label",
                                                                    "width":230
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":59,
                                            "x":9,
                                            "width":704,
                                            "height":404,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MonsterHeartPanel_Image16",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "width":704,
                                                        "height":404
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "x":0,
                                                        "width":450,
                                                        "height":404,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MonsterHeartPanel_Image17",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":108,
                                                                    "x":118,
                                                                    "width":100,
                                                                    "height":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MonsterHeartSlot,
                                                            "id":"needUpSlot",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "movable":false,
                                                                    "isOpen":true,
                                                                    "width":34,
                                                                    "height":34,
                                                                    "y":136,
                                                                    "x":149
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MonsterHeartPanel_Image18",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":108,
                                                                    "x":248,
                                                                    "width":100,
                                                                    "height":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MonsterHeartSlot,
                                                            "id":"afterUpSlot",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "movable":false,
                                                                    "isOpen":true,
                                                                    "width":34,
                                                                    "height":34,
                                                                    "y":136,
                                                                    "x":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MonsterHeartPanel_Image19",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":226,
                                                                    "x":180,
                                                                    "width":100,
                                                                    "height":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MonsterHeartSlot,
                                                            "id":"jinshiHeartSlot",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "movable":false,
                                                                    "isOpen":true,
                                                                    "width":34,
                                                                    "height":34,
                                                                    "y":254,
                                                                    "x":210
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":NumericStepper,
                                                            "id":"upGradeJishu",
                                                            "events":{"change":"__upGradeJishu_change"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":146,
                                                                    "y":200,
                                                                    "minimum":2,
                                                                    "maximum":5,
                                                                    "width":48.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":142,
                                                                    "y":325,
                                                                    "text":"Dung luyện thất bại không mất Ma Tâm"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":146,
                                                                    "y":225,
                                                                    "text":"Đặt Ma Tâm"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":192,
                                                                    "y":110,
                                                                    "text":"Thành công："
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"upSuccessRate",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":220,
                                                                    "y":124,
                                                                    "text":"0%"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___MonsterHeartPanel_BasicDelayButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":30000,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":266.5,
                                                                    "y":200,
                                                                    "label":"Toàn bộ"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___MonsterHeartPanel_BasicDelayButton2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":30000,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":200,
                                                                    "y":175,
                                                                    "label":"D.Luyện"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"ifUseByGold",
                                                            "events":{"click":"__ifUseByGold_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":142,
                                                                    "y":363,
                                                                    "label":"Không đủ tự động mua (800 vàng)"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"ifUseJinshiHeart",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":142,
                                                                    "y":345
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "label":"Hornor",
                                                        "y":195,
                                                        "width":247,
                                                        "height":205,
                                                        "x":454,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":48,
                                                                    "y":152,
                                                                    "text":"Phân giải nhận：",
                                                                    "width":121
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 63855;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":48,
                                                                    "y":168,
                                                                    "text":"Ma Năng",
                                                                    "width":62
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___MonsterHeartPanel_BasicDelayButton3_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":5000,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":120,
                                                                    "y":125,
                                                                    "label":"Phân giải",
                                                                    "width":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"resolveExp",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":115,
                                                                    "y":168,
                                                                    "text":"+0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":NumericStepper,
                                                            "id":"resolveNumNS",
                                                            "events":{"change":"__resolveNumNS_change"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "minimum":1,
                                                                    "maximum":9999,
                                                                    "x":57,
                                                                    "y":125,
                                                                    "width":55
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MonsterHeartPanel_Image20",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":30,
                                                                    "x":68,
                                                                    "width":100,
                                                                    "height":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MonsterHeartSlot,
                                                            "id":"resolveSlot",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "movable":false,
                                                                    "isOpen":true,
                                                                    "width":34,
                                                                    "height":34,
                                                                    "x":99,
                                                                    "y":58
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":59,
                                            "x":9,
                                            "width":702,
                                            "height":410,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MonsterHeartPanel_Image21",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "width":702,
                                                        "height":410
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showName1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":110,
                                                        "text":"Label",
                                                        "width":88,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showName2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":137,
                                                        "text":"Label",
                                                        "width":88,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showName3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":165,
                                                        "text":"Label",
                                                        "width":88,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showName4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":193,
                                                        "text":"Label",
                                                        "width":88,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showName5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":220,
                                                        "text":"Label",
                                                        "width":88,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showName6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":247,
                                                        "text":"Label",
                                                        "width":88,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showName7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":273,
                                                        "text":"Label",
                                                        "width":88,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showName8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":300,
                                                        "text":"Label",
                                                        "width":88,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showName9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":326,
                                                        "text":"Label",
                                                        "width":88,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showHeart1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":110,
                                                        "text":"Label",
                                                        "width":228,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showHeart2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":137,
                                                        "text":"Label",
                                                        "width":228,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showHeart3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":165,
                                                        "text":"Label",
                                                        "width":228,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showHeart4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":193,
                                                        "text":"Label",
                                                        "width":228,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showHeart5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":220,
                                                        "text":"Label",
                                                        "width":228,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showHeart6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":247,
                                                        "text":"Label",
                                                        "width":228,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showHeart7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":273,
                                                        "text":"Label",
                                                        "width":228,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showHeart8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":300,
                                                        "text":"Label",
                                                        "width":228,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showHeart9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":326,
                                                        "text":"Label",
                                                        "width":228,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showPro1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":409,
                                                        "y":110,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showPro2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":409,
                                                        "y":137,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showPro3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":409,
                                                        "y":165,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showPro4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":409,
                                                        "y":193,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showPro5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":409,
                                                        "y":220,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showPro6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":409,
                                                        "y":247,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showPro7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":409,
                                                        "y":273,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showPro8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":409,
                                                        "y":300,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showPro9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":409,
                                                        "y":326,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showMax1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":539,
                                                        "y":110,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showMax2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":539,
                                                        "y":137,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showMax3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":539,
                                                        "y":165,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showMax4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":539,
                                                        "y":193,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showMax5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":539,
                                                        "y":220,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showMax6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":539,
                                                        "y":247,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showMax7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":539,
                                                        "y":273,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showMax8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":539,
                                                        "y":300,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"showMax9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":539,
                                                        "y":326,
                                                        "text":"Label",
                                                        "width":120,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelectLabel",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":373,
                                                        "x":276
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"BagCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "y":59,
                                "width":247,
                                "height":192,
                                "x":462,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":40,
                                            "x":15
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":40,
                                            "x":52
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":40,
                                            "x":89
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":40,
                                            "x":126
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":40,
                                            "x":163
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":40,
                                            "x":200
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":80,
                                            "x":15
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":80,
                                            "x":52
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":80,
                                            "x":89
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":80,
                                            "x":126
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":80,
                                            "x":163
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":80,
                                            "x":200
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole12",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":120,
                                            "x":15
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole13",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":120,
                                            "x":52
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole14",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":120,
                                            "x":89
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole15",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":120,
                                            "x":126
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole16",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":120,
                                            "x":163
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MonsterHeartSlot,
                                    "id":"bagHole17",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":34,
                                            "height":34,
                                            "y":120,
                                            "x":200
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HRule,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42,
                                            "y":29,
                                            "width":170
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "right";
                                        this.color = 0xF9F900;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":98.5,
                                            "y":4,
                                            "text":"Túi Ma Tâm"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"pageSelect",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":162,
                                            "x":50
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        public var monsterHeartBag:Object = {};
        private var _dm:DataManager = DataManager.getInstance();
        private var itemAC:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        private var bagData:Object = {};
        private var monsterHeartData:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MonsterHeartPanel()
        {
            mx_internal::_document = this;
            this.width = 720;
            this.height = 480;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            this.addEventListener("creationComplete", ___MonsterHeartPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MonsterHeartPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get imLine1():Image
        {
            return (this._1892607993imLine1);
        }

        public function set imLine1(_arg_1:Image):void
        {
            var _local_2:Object = this._1892607993imLine1;
            if (_local_2 !== _arg_1)
            {
                this._1892607993imLine1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine1", _local_2, _arg_1));
            };
        }

        private function upgradeMonsterHeartItem(isAll:Boolean):void
        {
            var tempNumUp:Number;
            var giid:Number;
            var i:* = undefined;
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var gfunc:Function;
            var goldfunc:Function;
            tempNumUp = upGradeJishu.value;
            if (((tempNumUp < 2) || (tempNumUp > 5)))
            {
                return;
            };
            if ((((needUpSlot.giid < 0) || (!(needUpSlot.giid))) || (!(needUpSlot.slotData))))
            {
                return;
            };
            giid = needUpSlot.giid;
            var type:Number = needUpSlot.slotData.type;
            var typeName:String = BagTypeArr[(type - 1)];
            var ifHaveItem:Boolean;
            for (i in bagData[typeName])
            {
                if (giid == bagData[typeName][i].itemId)
                {
                    ifHaveItem = true;
                    if (bagData[typeName][i].n < tempNumUp)
                    {
                        Alert.show(Language.MONSTER_HEART[6], "", Alert.YES);
                        return;
                    };
                };
            };
            if (((ifUseJinshiHeart.selected) && (ifUseByGold.selected)))
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                goldLockFlag = bagPanel.goldLockFlag;
                if (((goldLockFlag) || (!(bagPanel))))
                {
                    gfunc = function (_arg_1:String):void
                    {
                        _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                    };
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                    return;
                };
            };
            if (!ifHaveItem)
            {
                Alert.show(Language.MONSTER_HEART[6], "", Alert.YES);
                return;
            };
            if ((((ifUseJinshiHeart.selected) && (!(ifUseByGold.selected))) && (_core.player.mhjingshi <= 0)))
            {
                Alert.show(Language.MONSTER_HEART[7], "", Alert.YES);
                return;
            };
            if (((ifUseJinshiHeart.selected) && (ifUseByGold.selected)))
            {
                if (((_core.player.gold < 800) && (_core.player.mhjingshi <= 0)))
                {
                    Alert.show("Không đủ vàng", "", Alert.YES);
                    return;
                };
                goldfunc = function (event:CloseEvent):void
                {
                    var bagPanel:BagPanel;
                    var goldLockFlag:Boolean;
                    var gfunc:Function;
                    if (event.detail == Alert.YES)
                    {
                        bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                        goldLockFlag = bagPanel.goldLockFlag;
                        if (((goldLockFlag) || (!(bagPanel))))
                        {
                            gfunc = function (_arg_1:String):void
                            {
                                _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                            };
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                            return;
                        };
                        _core.remote.call("upgradeMonsterHeartItem", null, isAll, giid, tempNumUp, ifUseJinshiHeart.selected, ifUseByGold.selected);
                    };
                };
                Alert.show("Không đủ Tâm Tinh Thạch sẽ tự động dùng vàng để mua?", "", (Alert.YES | Alert.NO), null, goldfunc);
            }
            else
            {
                _core.remote.call("upgradeMonsterHeartItem", null, isAll, giid, tempNumUp, ifUseJinshiHeart.selected, ifUseByGold.selected);
            };
        }

        public function ___MonsterHeartPanel_Button2_click(_arg_1:MouseEvent):void
        {
            onPageSelect(2);
        }

        private function onInitMonsterHeartData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            monsterHeartData = _arg_1["data"];
            bagData = _arg_1["bag"];
            setImageLineVis();
            freshenOneBox();
            resolveSlot.clean();
            needUpSlot.clean();
            afterUpSlot.clean();
            jinshiHeartSlot.giid = 5884;
            jinshiHeartSlot.type = GamePredef.TBL_ITEM_TEMPLATE;
            jinshiHeartSlot.slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][5884];
            freshenNeedExp();
            updataBagChange();
            labelUpdatePage();
        }

        [Bindable(event="propertyChange")]
        public function get imLine2():Image
        {
            return (this._1892607994imLine2);
        }

        [Bindable(event="propertyChange")]
        public function get imLine3():Image
        {
            return (this._1892607995imLine3);
        }

        [Bindable(event="propertyChange")]
        public function get imLine4():Image
        {
            return (this._1892607996imLine4);
        }

        [Bindable(event="propertyChange")]
        public function get imLine8():Image
        {
            return (this._1892608000imLine8);
        }

        [Bindable(event="propertyChange")]
        public function get imLine9():Image
        {
            return (this._1892608001imLine9);
        }

        public function set imLine9(_arg_1:Image):void
        {
            var _local_2:Object = this._1892608001imLine9;
            if (_local_2 !== _arg_1)
            {
                this._1892608001imLine9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine9", _local_2, _arg_1));
            };
        }

        public function set imLine5(_arg_1:Image):void
        {
            var _local_2:Object = this._1892607997imLine5;
            if (_local_2 !== _arg_1)
            {
                this._1892607997imLine5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine5", _local_2, _arg_1));
            };
        }

        public function set imLine6(_arg_1:Image):void
        {
            var _local_2:Object = this._1892607998imLine6;
            if (_local_2 !== _arg_1)
            {
                this._1892607998imLine6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imLine5():Image
        {
            return (this._1892607997imLine5);
        }

        [Bindable(event="propertyChange")]
        public function get imLine7():Image
        {
            return (this._1892607999imLine7);
        }

        public function set imLine8(_arg_1:Image):void
        {
            var _local_2:Object = this._1892608000imLine8;
            if (_local_2 !== _arg_1)
            {
                this._1892608000imLine8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine8", _local_2, _arg_1));
            };
        }

        public function set showHeart2(_arg_1:Label):void
        {
            var _local_2:Object = this._453832201showHeart2;
            if (_local_2 !== _arg_1)
            {
                this._453832201showHeart2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHeart2", _local_2, _arg_1));
            };
        }

        public function set showHeart6(_arg_1:Label):void
        {
            var _local_2:Object = this._453832205showHeart6;
            if (_local_2 !== _arg_1)
            {
                this._453832205showHeart6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHeart6", _local_2, _arg_1));
            };
        }

        public function set resolveSlot(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._1952778762resolveSlot;
            if (_local_2 !== _arg_1)
            {
                this._1952778762resolveSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolveSlot", _local_2, _arg_1));
            };
        }

        public function set showHeart7(_arg_1:Label):void
        {
            var _local_2:Object = this._453832206showHeart7;
            if (_local_2 !== _arg_1)
            {
                this._453832206showHeart7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHeart7", _local_2, _arg_1));
            };
        }

        public function set showHeart4(_arg_1:Label):void
        {
            var _local_2:Object = this._453832203showHeart4;
            if (_local_2 !== _arg_1)
            {
                this._453832203showHeart4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHeart4", _local_2, _arg_1));
            };
        }

        public function set showHeart1(_arg_1:Label):void
        {
            var _local_2:Object = this._453832200showHeart1;
            if (_local_2 !== _arg_1)
            {
                this._453832200showHeart1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHeart1", _local_2, _arg_1));
            };
        }

        public function set showName1(_arg_1:Label):void
        {
            var _local_2:Object = this._1919589879showName1;
            if (_local_2 !== _arg_1)
            {
                this._1919589879showName1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showName1", _local_2, _arg_1));
            };
        }

        public function set showMax5(_arg_1:Label):void
        {
            var _local_2:Object = this._339046418showMax5;
            if (_local_2 !== _arg_1)
            {
                this._339046418showMax5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showMax5", _local_2, _arg_1));
            };
        }

        public function set showHeart3(_arg_1:Label):void
        {
            var _local_2:Object = this._453832202showHeart3;
            if (_local_2 !== _arg_1)
            {
                this._453832202showHeart3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHeart3", _local_2, _arg_1));
            };
        }

        public function set showHeart8(_arg_1:Label):void
        {
            var _local_2:Object = this._453832207showHeart8;
            if (_local_2 !== _arg_1)
            {
                this._453832207showHeart8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHeart8", _local_2, _arg_1));
            };
        }

        public function set showHeart5(_arg_1:Label):void
        {
            var _local_2:Object = this._453832204showHeart5;
            if (_local_2 !== _arg_1)
            {
                this._453832204showHeart5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHeart5", _local_2, _arg_1));
            };
        }

        public function set showName5(_arg_1:Label):void
        {
            var _local_2:Object = this._1919589875showName5;
            if (_local_2 !== _arg_1)
            {
                this._1919589875showName5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showName5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showMax8():Label
        {
            return (this._339046415showMax8);
        }

        public function set imLine7(_arg_1:Image):void
        {
            var _local_2:Object = this._1892607999imLine7;
            if (_local_2 !== _arg_1)
            {
                this._1892607999imLine7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine7", _local_2, _arg_1));
            };
        }

        public function setGoldLock(_arg_1:Boolean):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var _local_3:Boolean = _local_2.goldLockFlag;
            if (((!(_local_3 == _arg_1)) && (_local_2)))
            {
                _local_2.goldLockFlag = _arg_1;
            };
        }

        public function set showHeart9(_arg_1:Label):void
        {
            var _local_2:Object = this._453832208showHeart9;
            if (_local_2 !== _arg_1)
            {
                this._453832208showHeart9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showHeart9", _local_2, _arg_1));
            };
        }

        public function set showName4(_arg_1:Label):void
        {
            var _local_2:Object = this._1919589876showName4;
            if (_local_2 !== _arg_1)
            {
                this._1919589876showName4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showName4", _local_2, _arg_1));
            };
        }

        public function set showName9(_arg_1:Label):void
        {
            var _local_2:Object = this._1919589871showName9;
            if (_local_2 !== _arg_1)
            {
                this._1919589871showName9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showName9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showMax3():Label
        {
            return (this._339046420showMax3);
        }

        public function set showName6(_arg_1:Label):void
        {
            var _local_2:Object = this._1919589874showName6;
            if (_local_2 !== _arg_1)
            {
                this._1919589874showName6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showName6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get afterUpSlot():MonsterHeartSlot
        {
            return (this._279430197afterUpSlot);
        }

        public function set showMax8(_arg_1:Label):void
        {
            var _local_2:Object = this._339046415showMax8;
            if (_local_2 !== _arg_1)
            {
                this._339046415showMax8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showMax8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showMax4():Label
        {
            return (this._339046419showMax4);
        }

        public function set showName8(_arg_1:Label):void
        {
            var _local_2:Object = this._1919589872showName8;
            if (_local_2 !== _arg_1)
            {
                this._1919589872showName8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showName8", _local_2, _arg_1));
            };
        }

        public function set showName3(_arg_1:Label):void
        {
            var _local_2:Object = this._1919589877showName3;
            if (_local_2 !== _arg_1)
            {
                this._1919589877showName3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showName3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showMax9():Label
        {
            return (this._339046414showMax9);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole0():MonsterHeartSlot
        {
            return (this._2091025336bagHole0);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole1():MonsterHeartSlot
        {
            return (this._2091025335bagHole1);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole4():MonsterHeartSlot
        {
            return (this._2091025332bagHole4);
        }

        public function ___MonsterHeartPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            upgradeMonsterHeartItem(true);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole6():MonsterHeartSlot
        {
            return (this._2091025330bagHole6);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole7():MonsterHeartSlot
        {
            return (this._2091025329bagHole7);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole2():MonsterHeartSlot
        {
            return (this._2091025334bagHole2);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole3():MonsterHeartSlot
        {
            return (this._2091025333bagHole3);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole5():MonsterHeartSlot
        {
            return (this._2091025331bagHole5);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole9():MonsterHeartSlot
        {
            return (this._2091025327bagHole9);
        }

        public function set showName2(_arg_1:Label):void
        {
            var _local_2:Object = this._1919589878showName2;
            if (_local_2 !== _arg_1)
            {
                this._1919589878showName2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showName2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bagHole8():MonsterHeartSlot
        {
            return (this._2091025328bagHole8);
        }

        public function changeResolveExp():void
        {
            var _local_6:*;
            if ((((resolveSlot.giid < 0) || (!(resolveSlot.giid))) || (!(resolveSlot.slotData))))
            {
                return;
            };
            var _local_1:Number = resolveSlot.giid;
            var _local_2:Object = GameData.d[GamePredef.TBL_CREATUREH_HEART][_local_1];
            var _local_3:Number = resolveNumNS.value;
            var _local_4:Number = resolveSlot.slotData.type;
            var _local_5:String = BagTypeArr[(_local_4 - 1)];
            for (_local_6 in bagData[_local_5])
            {
                if (_local_1 == bagData[_local_5][_local_6].itemId)
                {
                    maxResolveNum = bagData[_local_5][_local_6].n;
                };
            };
            resolveExp.htmlText = ("+" + (Number(_local_2.exp) * _local_3));
        }

        public function __bagBtn1_click(_arg_1:MouseEvent):void
        {
            changeBagView(1);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelect():PageSelector
        {
            return (this._1273109611pageSelect);
        }

        public function set afterUpSlot(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._279430197afterUpSlot;
            if (_local_2 !== _arg_1)
            {
                this._279430197afterUpSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afterUpSlot", _local_2, _arg_1));
            };
        }

        public function set showName7(_arg_1:Label):void
        {
            var _local_2:Object = this._1919589873showName7;
            if (_local_2 !== _arg_1)
            {
                this._1919589873showName7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showName7", _local_2, _arg_1));
            };
        }

        private function setMHSlotUpSuccessRate():void
        {
            var _local_1:Number = upGradeJishu.value;
            if (((_local_1 < 2) || (_local_1 > 5)))
            {
                return;
            };
            if ((((needUpSlot.giid < 0) || (!(needUpSlot.giid))) || (!(needUpSlot.slotData))))
            {
                return;
            };
            var _local_2:Number = needUpSlot.giid;
            var _local_3:Object = GameData.d[GamePredef.TBL_CREATUREH_HEART][_local_2];
            var _local_4:Number = (Number(_local_3.color) + 1);
            upSuccessRate.htmlText = (MHUPMH_RATE[_local_4][_local_1] + "%");
        }

        public function set bagHole0(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025336bagHole0;
            if (_local_2 !== _arg_1)
            {
                this._2091025336bagHole0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get resolveExp():Label
        {
            return (this._1599588207resolveExp);
        }

        public function set bagHole1(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025335bagHole1;
            if (_local_2 !== _arg_1)
            {
                this._2091025335bagHole1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole1", _local_2, _arg_1));
            };
        }

        public function set bagHole3(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025333bagHole3;
            if (_local_2 !== _arg_1)
            {
                this._2091025333bagHole3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole3", _local_2, _arg_1));
            };
        }

        public function set bagHole4(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025332bagHole4;
            if (_local_2 !== _arg_1)
            {
                this._2091025332bagHole4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole4", _local_2, _arg_1));
            };
        }

        public function set bagHole7(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025329bagHole7;
            if (_local_2 !== _arg_1)
            {
                this._2091025329bagHole7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole7", _local_2, _arg_1));
            };
        }

        public function set holeNum2(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._514994612holeNum2;
            if (_local_2 !== _arg_1)
            {
                this._514994612holeNum2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeNum2", _local_2, _arg_1));
            };
        }

        public function set bagHole8(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025328bagHole8;
            if (_local_2 !== _arg_1)
            {
                this._2091025328bagHole8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole8", _local_2, _arg_1));
            };
        }

        public function set bagHole5(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025331bagHole5;
            if (_local_2 !== _arg_1)
            {
                this._2091025331bagHole5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole5", _local_2, _arg_1));
            };
        }

        public function onUpgradeMonsterHeartBox(_arg_1:Object):void
        {
            monsterHeartData.heartBoxLev = _arg_1;
            freshenNeedExp();
            setImageLineVis();
        }

        public function set holeNum5(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._514994609holeNum5;
            if (_local_2 !== _arg_1)
            {
                this._514994609holeNum5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeNum5", _local_2, _arg_1));
            };
        }

        public function set holeNum6(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._514994608holeNum6;
            if (_local_2 !== _arg_1)
            {
                this._514994608holeNum6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeNum6", _local_2, _arg_1));
            };
        }

        public function set bagHole9(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025327bagHole9;
            if (_local_2 !== _arg_1)
            {
                this._2091025327bagHole9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole9", _local_2, _arg_1));
            };
        }

        public function set bagHole6(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025330bagHole6;
            if (_local_2 !== _arg_1)
            {
                this._2091025330bagHole6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole6", _local_2, _arg_1));
            };
        }

        public function set holeNum1(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._514994613holeNum1;
            if (_local_2 !== _arg_1)
            {
                this._514994613holeNum1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeNum1", _local_2, _arg_1));
            };
        }

        public function set holeNum7(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._514994607holeNum7;
            if (_local_2 !== _arg_1)
            {
                this._514994607holeNum7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeNum7", _local_2, _arg_1));
            };
        }

        public function set holeNum4(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._514994610holeNum4;
            if (_local_2 !== _arg_1)
            {
                this._514994610holeNum4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeNum4", _local_2, _arg_1));
            };
        }

        public function set bagHole2(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._2091025334bagHole2;
            if (_local_2 !== _arg_1)
            {
                this._2091025334bagHole2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole2", _local_2, _arg_1));
            };
        }

        public function ___MonsterHeartPanel_Button1_click(_arg_1:MouseEvent):void
        {
            onPageSelect(1);
        }

        public function __bagBtn6_click(_arg_1:MouseEvent):void
        {
            changeBagView(6);
        }

        public function set holeNum3(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._514994611holeNum3;
            if (_local_2 !== _arg_1)
            {
                this._514994611holeNum3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeNum3", _local_2, _arg_1));
            };
        }

        public function set needExpLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1730037146needExpLab;
            if (_local_2 !== _arg_1)
            {
                this._1730037146needExpLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needExpLab", _local_2, _arg_1));
            };
        }

        public function set pageSelect(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._1273109611pageSelect;
            if (_local_2 !== _arg_1)
            {
                this._1273109611pageSelect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelect", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCombine1():Label
        {
            return (this._1464427281showCombine1);
        }

        public function set nowRatioLab(_arg_1:Label):void
        {
            var _local_2:Object = this._281628040nowRatioLab;
            if (_local_2 !== _arg_1)
            {
                this._281628040nowRatioLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nowRatioLab", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCombine4():Label
        {
            return (this._1464427278showCombine4);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine5():Label
        {
            return (this._1464427277showCombine5);
        }

        public function set ifUseJinshiHeart(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1333480055ifUseJinshiHeart;
            if (_local_2 !== _arg_1)
            {
                this._1333480055ifUseJinshiHeart = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ifUseJinshiHeart", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCombine2():Label
        {
            return (this._1464427280showCombine2);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine3():Label
        {
            return (this._1464427279showCombine3);
        }

        private function changeBagView(_arg_1:int):void
        {
            choiceBag = _arg_1;
            var _local_2:int = 1;
            while (_local_2 <= 7)
            {
                this[("bagBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bagBtn" + _arg_1)].selected = true;
            updataBagChange();
        }

        private function pageClear():void
        {
            var _local_1:int;
            while (_local_1 < countPerPage)
            {
                this[("bagHole" + _local_1)].reset();
                _local_1++;
            };
        }

        private function set maxResolveNum(_arg_1:Number):void
        {
            var _local_2:Object = this._1523019390maxResolveNum;
            if (_local_2 !== _arg_1)
            {
                this._1523019390maxResolveNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxResolveNum", _local_2, _arg_1));
            };
        }

        public function __ifUseByGold_click(_arg_1:MouseEvent):void
        {
            ifUseByGold_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole14():MonsterHeartSlot
        {
            return (this._397275893bagHole14);
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        private function _MonsterHeartPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONSTER_HEART[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mhTitle.text = _arg_1;
            }, "mhTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONSTER_HEART[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONSTER_HEART[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONSTER_HEART[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000710));
            }, function (_arg_1:Object):void
            {
                _MonsterHeartPanel_Image1.source = _arg_1;
            }, "_MonsterHeartPanel_Image1.source");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000709));
            }, function (_arg_1:Object):void
            {
                imLine1.source = _arg_1;
            }, "imLine1.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000709));
            }, function (_arg_1:Object):void
            {
                imLine12.source = _arg_1;
            }, "imLine12.source");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000707));
            }, function (_arg_1:Object):void
            {
                imLine9.source = _arg_1;
            }, "imLine9.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000707));
            }, function (_arg_1:Object):void
            {
                imLine11.source = _arg_1;
            }, "imLine11.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000709));
            }, function (_arg_1:Object):void
            {
                imLine8.source = _arg_1;
            }, "imLine8.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000709));
            }, function (_arg_1:Object):void
            {
                imLine5.source = _arg_1;
            }, "imLine5.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000707));
            }, function (_arg_1:Object):void
            {
                imLine2.source = _arg_1;
            }, "imLine2.source");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000707));
            }, function (_arg_1:Object):void
            {
                imLine4.source = _arg_1;
            }, "imLine4.source");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000708));
            }, function (_arg_1:Object):void
            {
                imLine7.source = _arg_1;
            }, "imLine7.source");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000708));
            }, function (_arg_1:Object):void
            {
                imLine10.source = _arg_1;
            }, "imLine10.source");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000708));
            }, function (_arg_1:Object):void
            {
                imLine6.source = _arg_1;
            }, "imLine6.source");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000708));
            }, function (_arg_1:Object):void
            {
                imLine3.source = _arg_1;
            }, "imLine3.source");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000717));
            }, function (_arg_1:Object):void
            {
                _MonsterHeartPanel_Image15.source = _arg_1;
            }, "_MonsterHeartPanel_Image15.source");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BOX);
            }, function (_arg_1:int):void
            {
                holeNum1.slotType = _arg_1;
            }, "holeNum1.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BOX);
            }, function (_arg_1:int):void
            {
                holeNum2.slotType = _arg_1;
            }, "holeNum2.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BOX);
            }, function (_arg_1:int):void
            {
                holeNum3.slotType = _arg_1;
            }, "holeNum3.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BOX);
            }, function (_arg_1:int):void
            {
                holeNum4.slotType = _arg_1;
            }, "holeNum4.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BOX);
            }, function (_arg_1:int):void
            {
                holeNum5.slotType = _arg_1;
            }, "holeNum5.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BOX);
            }, function (_arg_1:int):void
            {
                holeNum6.slotType = _arg_1;
            }, "holeNum6.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BOX);
            }, function (_arg_1:int):void
            {
                holeNum7.slotType = _arg_1;
            }, "holeNum7.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.monsterHeart;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                haveExpLab.text = _arg_1;
            }, "haveExpLab.text");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000711));
            }, function (_arg_1:Object):void
            {
                _MonsterHeartPanel_Image16.source = _arg_1;
            }, "_MonsterHeartPanel_Image16.source");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000716));
            }, function (_arg_1:Object):void
            {
                _MonsterHeartPanel_Image17.source = _arg_1;
            }, "_MonsterHeartPanel_Image17.source");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_UP);
            }, function (_arg_1:int):void
            {
                needUpSlot.slotType = _arg_1;
            }, "needUpSlot.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000716));
            }, function (_arg_1:Object):void
            {
                _MonsterHeartPanel_Image18.source = _arg_1;
            }, "_MonsterHeartPanel_Image18.source");
            result[29] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000716));
            }, function (_arg_1:Object):void
            {
                _MonsterHeartPanel_Image19.source = _arg_1;
            }, "_MonsterHeartPanel_Image19.source");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONSTER_HEART[12].toString().replace("{num}", _core.player.mhjingshi);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                ifUseJinshiHeart.label = _arg_1;
            }, "ifUseJinshiHeart.label");
            result[31] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000716));
            }, function (_arg_1:Object):void
            {
                _MonsterHeartPanel_Image20.source = _arg_1;
            }, "_MonsterHeartPanel_Image20.source");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_RESOLVE);
            }, function (_arg_1:int):void
            {
                resolveSlot.slotType = _arg_1;
            }, "resolveSlot.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000718));
            }, function (_arg_1:Object):void
            {
                _MonsterHeartPanel_Image21.source = _arg_1;
            }, "_MonsterHeartPanel_Image21.source");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole0.slotType = _arg_1;
            }, "bagHole0.slotType");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole1.slotType = _arg_1;
            }, "bagHole1.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole2.slotType = _arg_1;
            }, "bagHole2.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole3.slotType = _arg_1;
            }, "bagHole3.slotType");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole4.slotType = _arg_1;
            }, "bagHole4.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole5.slotType = _arg_1;
            }, "bagHole5.slotType");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole6.slotType = _arg_1;
            }, "bagHole6.slotType");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole7.slotType = _arg_1;
            }, "bagHole7.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole8.slotType = _arg_1;
            }, "bagHole8.slotType");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole9.slotType = _arg_1;
            }, "bagHole9.slotType");
            result[44] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole10.slotType = _arg_1;
            }, "bagHole10.slotType");
            result[45] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole11.slotType = _arg_1;
            }, "bagHole11.slotType");
            result[46] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole12.slotType = _arg_1;
            }, "bagHole12.slotType");
            result[47] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole13.slotType = _arg_1;
            }, "bagHole13.slotType");
            result[48] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole14.slotType = _arg_1;
            }, "bagHole14.slotType");
            result[49] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole15.slotType = _arg_1;
            }, "bagHole15.slotType");
            result[50] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole16.slotType = _arg_1;
            }, "bagHole16.slotType");
            result[51] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MONSTERHEART_BAG);
            }, function (_arg_1:int):void
            {
                bagHole17.slotType = _arg_1;
            }, "bagHole17.slotType");
            result[52] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole13():MonsterHeartSlot
        {
            return (this._397275894bagHole13);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole16():MonsterHeartSlot
        {
            return (this._397275891bagHole16);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole17():MonsterHeartSlot
        {
            return (this._397275890bagHole17);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole11():MonsterHeartSlot
        {
            return (this._397275896bagHole11);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole12():MonsterHeartSlot
        {
            return (this._397275895bagHole12);
        }

        public function set upGradeJishu(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._636843653upGradeJishu;
            if (_local_2 !== _arg_1)
            {
                this._636843653upGradeJishu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upGradeJishu", _local_2, _arg_1));
            };
        }

        private function labelUpdatePage():void
        {
            pageSelectLabel.initPageSeletor(displayNum, labelCountPerPage);
            pageSelectLabel.pageNo = labelPageNo;
        }

        [Bindable(event="propertyChange")]
        public function get ifUseByGold():CheckBox
        {
            return (this._1573867231ifUseByGold);
        }

        public function set resolveExp(_arg_1:Label):void
        {
            var _local_2:Object = this._1599588207resolveExp;
            if (_local_2 !== _arg_1)
            {
                this._1599588207resolveExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolveExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bagHole15():MonsterHeartSlot
        {
            return (this._397275892bagHole15);
        }

        private function labelDrawPage(_arg_1:int, _arg_2:int):void
        {
            var _local_4:int;
            var _local_5:Object;
            var _local_6:*;
            var _local_7:Object;
            var _local_8:String;
            var _local_9:Array;
            var _local_10:Number;
            var _local_11:String;
            var _local_12:int;
            var _local_13:Number;
            var _local_14:Number;
            var _local_3:int;
            while (_local_3 < labelCountPerPage)
            {
                _local_4 = (_local_3 + 1);
                this[("showName" + _local_4)].htmlText = "";
                this[("showHeart" + _local_4)].htmlText = "";
                this[("showPro" + _local_4)].htmlText = "";
                this[("showMax" + _local_4)].htmlText = "";
                if (_local_3 < _arg_2)
                {
                    _local_5 = _dm.gameDataIndex[GamePredef.TBL_CREATUREH_COMBINE][(_arg_1 + _local_4)];
                    for (_local_6 in _local_5)
                    {
                        _local_7 = _local_5[_local_6];
                        this[("showName" + _local_4)].htmlText = _local_7.name;
                        _local_8 = _local_7.typeCombine;
                        _local_9 = _local_8.split("|");
                        _local_10 = _local_9[0];
                        _local_11 = HTYPE_NAME[_local_10];
                        _local_12 = 1;
                        while (_local_12 < _local_9.length)
                        {
                            _local_10 = _local_9[_local_12];
                            _local_11 = (_local_11 + ("+" + HTYPE_NAME[_local_10]));
                            _local_12++;
                        };
                        this[("showHeart" + _local_4)].htmlText = _local_11;
                        _local_13 = _local_7.propType1;
                        this[("showPro" + _local_4)].htmlText = Language.TIP_MONSTER_H[_local_13];
                        _local_14 = _local_7.maxNum;
                        this[("showMax" + _local_4)].htmlText = (_local_14 / 10000);
                    };
                };
                _local_3++;
            };
        }

        private function labelPageChange(_arg_1:int, _arg_2:int):void
        {
            labelPageNo = pageSelectLabel.pageNo;
            labelDrawPage(_arg_1, _arg_2);
        }

        [Bindable(event="propertyChange")]
        public function get resolveNumNS():NumericStepper
        {
            return (this._402246975resolveNumNS);
        }

        [Bindable(event="propertyChange")]
        public function get levelShowImage():Image
        {
            return (this._1054773958levelShowImage);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelectLabel():PageSelector
        {
            return (this._1409449289pageSelectLabel);
        }

        [Bindable(event="propertyChange")]
        public function get bagHole10():MonsterHeartSlot
        {
            return (this._397275897bagHole10);
        }

        public function __bagBtn5_click(_arg_1:MouseEvent):void
        {
            changeBagView(5);
        }

        [Bindable(event="propertyChange")]
        public function get bagBtn1():BasicGlowButton
        {
            return (this._344721027bagBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get bagBtn2():BasicGlowButton
        {
            return (this._344721026bagBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get bagBtn3():BasicGlowButton
        {
            return (this._344721025bagBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get bagBtn4():BasicGlowButton
        {
            return (this._344721024bagBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get bagBtn5():BasicGlowButton
        {
            return (this._344721023bagBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get bagBtn6():BasicGlowButton
        {
            return (this._344721022bagBtn6);
        }

        [Bindable(event="propertyChange")]
        public function get bagBtn7():BasicGlowButton
        {
            return (this._344721021bagBtn7);
        }

        [Bindable(event="propertyChange")]
        public function get vsFlop():ViewStack
        {
            return (this._808329852vsFlop);
        }

        [Bindable(event="propertyChange")]
        public function get mhTitle():BasicTitleCanvas
        {
            return (this._1011903869mhTitle);
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            changeView(2);
        }

        public function updateMonsterHeartBox(_arg_1:Object):void
        {
            if (_arg_1)
            {
                monsterHeartData = _arg_1;
                freshenOneBox();
                setImageLineVis();
                freshenNeedExp();
            };
        }

        [Bindable(event="propertyChange")]
        public function get nowBoxLevelLab():Label
        {
            return (this._1600033182nowBoxLevelLab);
        }

        [Bindable(event="propertyChange")]
        public function get jinshiHeartSlot():MonsterHeartSlot
        {
            return (this._61299297jinshiHeartSlot);
        }

        [Bindable(event="propertyChange")]
        public function get haveExpLab():Label
        {
            return (this._1460564552haveExpLab);
        }

        private function resolveHeart():void
        {
            var i:* = undefined;
            var gfunc:Function;
            if (!_core.delPass)
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                return;
            };
            var resNum:Number = resolveNumNS.value;
            if ((((resolveSlot.giid < 0) || (!(resolveSlot.giid))) || (!(resolveSlot.slotData))))
            {
                return;
            };
            var giid:Number = resolveSlot.giid;
            var type:Number = resolveSlot.slotData.type;
            var typeName:String = BagTypeArr[(type - 1)];
            for (i in bagData[typeName])
            {
                if (giid == bagData[typeName][i].itemId)
                {
                    if (bagData[typeName][i].n < resNum)
                    {
                        Alert.show(Language.MONSTER_HEART[6], "", Alert.YES);
                        return;
                    };
                    _core.remote.call("resolveMonsterHeart", null, giid, resNum);
                };
            };
        }

        private function _MonsterHeartPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MONSTER_HEART[0];
            _local_1 = Language.MONSTER_HEART[1];
            _local_1 = Language.MONSTER_HEART[2];
            _local_1 = Language.MONSTER_HEART[3];
            _local_1 = ResManager.getIconUrl(4130220000710);
            _local_1 = ResManager.getIconUrl(4130220000709);
            _local_1 = ResManager.getIconUrl(4130220000709);
            _local_1 = ResManager.getIconUrl(4130220000707);
            _local_1 = ResManager.getIconUrl(4130220000707);
            _local_1 = ResManager.getIconUrl(4130220000709);
            _local_1 = ResManager.getIconUrl(4130220000709);
            _local_1 = ResManager.getIconUrl(4130220000707);
            _local_1 = ResManager.getIconUrl(4130220000707);
            _local_1 = ResManager.getIconUrl(4130220000708);
            _local_1 = ResManager.getIconUrl(4130220000708);
            _local_1 = ResManager.getIconUrl(4130220000708);
            _local_1 = ResManager.getIconUrl(4130220000708);
            _local_1 = ResManager.getIconUrl(4130220000717);
            _local_1 = Slot.SLOT_MONSTERHEART_BOX;
            _local_1 = Slot.SLOT_MONSTERHEART_BOX;
            _local_1 = Slot.SLOT_MONSTERHEART_BOX;
            _local_1 = Slot.SLOT_MONSTERHEART_BOX;
            _local_1 = Slot.SLOT_MONSTERHEART_BOX;
            _local_1 = Slot.SLOT_MONSTERHEART_BOX;
            _local_1 = Slot.SLOT_MONSTERHEART_BOX;
            _local_1 = _core.player.monsterHeart;
            _local_1 = ResManager.getIconUrl(4130220000711);
            _local_1 = ResManager.getIconUrl(4130220000716);
            _local_1 = Slot.SLOT_MONSTERHEART_UP;
            _local_1 = ResManager.getIconUrl(4130220000716);
            _local_1 = ResManager.getIconUrl(4130220000716);
            _local_1 = Language.MONSTER_HEART[12].toString().replace("{num}", _core.player.mhjingshi);
            _local_1 = ResManager.getIconUrl(4130220000716);
            _local_1 = Slot.SLOT_MONSTERHEART_RESOLVE;
            _local_1 = ResManager.getIconUrl(4130220000718);
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
            _local_1 = Slot.SLOT_MONSTERHEART_BAG;
        }

        public function set showCombine2(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427280showCombine2;
            if (_local_2 !== _arg_1)
            {
                this._1464427280showCombine2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine2", _local_2, _arg_1));
            };
        }

        public function updateMonsterHeartBagByType(_arg_1:Object, _arg_2:Number):void
        {
            if (initialized)
            {
                bagData = _arg_1;
                if (_arg_2 == choiceBag)
                {
                    updataBagChange();
                };
            };
        }

        public function set showCombine1(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427281showCombine1;
            if (_local_2 !== _arg_1)
            {
                this._1464427281showCombine1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upSuccessRate():Label
        {
            return (this._2003452392upSuccessRate);
        }

        public function set showCombine4(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427278showCombine4;
            if (_local_2 !== _arg_1)
            {
                this._1464427278showCombine4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine4", _local_2, _arg_1));
            };
        }

        public function set showCombine5(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427277showCombine5;
            if (_local_2 !== _arg_1)
            {
                this._1464427277showCombine5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine5", _local_2, _arg_1));
            };
        }

        private function drawPage(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_3:int;
            while (_local_3 < countPerPage)
            {
                this[("bagHole" + _local_3)].clean();
                if (_local_3 < _arg_2)
                {
                    if ((((itemAC[(_arg_1 + _local_3)]) && (itemAC[(_arg_1 + _local_3)].itemId)) && (itemAC[(_arg_1 + _local_3)].n)))
                    {
                        this[("bagHole" + _local_3)].monsterHeartBagPos = itemAC[(_arg_1 + _local_3)].id;
                        this[("bagHole" + _local_3)].monsterHeartType = choiceBag;
                        this[("bagHole" + _local_3)].type = GamePredef.TBL_CREATUREH_HEART;
                        this[("bagHole" + _local_3)].giid = itemAC[(_arg_1 + _local_3)].itemId;
                        this[("bagHole" + _local_3)].stackNum = itemAC[(_arg_1 + _local_3)].n;
                        this[("bagHole" + _local_3)].slotData = GameData.d[GamePredef.TBL_CREATUREH_HEART][itemAC[(_arg_1 + _local_3)].itemId];
                        _local_4 = _core.data.getGameData(131, itemAC[(_arg_1 + _local_3)].itemId);
                        (((_local_4) && (_local_4.color)) && (this[("bagHole" + _local_3)].setStyleName(_local_4.color)));
                    };
                };
                _local_3++;
            };
        }

        public function set showCombine3(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427279showCombine3;
            if (_local_2 !== _arg_1)
            {
                this._1464427279showCombine3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showHeart1():Label
        {
            return (this._453832200showHeart1);
        }

        [Bindable(event="propertyChange")]
        public function get showHeart2():Label
        {
            return (this._453832201showHeart2);
        }

        [Bindable(event="propertyChange")]
        public function get resolveSlot():MonsterHeartSlot
        {
            return (this._1952778762resolveSlot);
        }

        [Bindable(event="propertyChange")]
        public function get showHeart4():Label
        {
            return (this._453832203showHeart4);
        }

        [Bindable(event="propertyChange")]
        public function get showHeart6():Label
        {
            return (this._453832205showHeart6);
        }

        public function set bagHole10(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._397275897bagHole10;
            if (_local_2 !== _arg_1)
            {
                this._397275897bagHole10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole10", _local_2, _arg_1));
            };
        }

        private function upgradeBox():void
        {
            var needExp:Number;
            var gold:Number;
            var choiceBoxLev:Number = monsterHeartData.heartBoxLev[choiceBox];
            var boxId:Number = ((choiceBox * 10) + choiceBoxLev);
            needExp = GameData.d[GamePredef.TBL_CREATUREH_CONTAIN][boxId].exp;
            var func:Function = function (event:CloseEvent):void
            {
                var bagPanel:BagPanel;
                var goldLockFlag:Boolean;
                var gfunc:Function;
                if (event.detail == Alert.YES)
                {
                    if (needExp > _core.player.monsterHeart)
                    {
                        bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                        goldLockFlag = bagPanel.goldLockFlag;
                        if (((goldLockFlag) || (!(bagPanel))))
                        {
                            gfunc = function (_arg_1:String):void
                            {
                                _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                            };
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                            return;
                        };
                    };
                    _core.remote.call("upgradeMonsterHeartBox", null, _boxIndex);
                };
            };
            if (choiceBoxLev >= 6)
            {
                Alert.show("Đã max cấp", "", Alert.YES);
                return;
            };
            if (needExp > _core.player.monsterHeart)
            {
                gold = GameData.d[GamePredef.TBL_CREATUREH_CONTAIN][boxId].goldNum;
                Alert.show(Language.MONSTER_HEART[4].toString().replace("{num}", gold), "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                Alert.show(Language.MONSTER_HEART[5].toString().replace("{num}", needExp), "", (Alert.YES | Alert.NO), null, func);
            };
        }

        public function set bagHole11(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._397275896bagHole11;
            if (_local_2 !== _arg_1)
            {
                this._397275896bagHole11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showHeart3():Label
        {
            return (this._453832202showHeart3);
        }

        public function set bagHole12(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._397275895bagHole12;
            if (_local_2 !== _arg_1)
            {
                this._397275895bagHole12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole12", _local_2, _arg_1));
            };
        }

        public function set bagHole13(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._397275894bagHole13;
            if (_local_2 !== _arg_1)
            {
                this._397275894bagHole13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showHeart7():Label
        {
            return (this._453832206showHeart7);
        }

        public function set bagHole14(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._397275893bagHole14;
            if (_local_2 !== _arg_1)
            {
                this._397275893bagHole14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showHeart9():Label
        {
            return (this._453832208showHeart9);
        }

        [Bindable(event="propertyChange")]
        public function get showName2():Label
        {
            return (this._1919589878showName2);
        }

        [Bindable(event="propertyChange")]
        public function get showHeart5():Label
        {
            return (this._453832204showHeart5);
        }

        [Bindable(event="propertyChange")]
        public function get showName6():Label
        {
            return (this._1919589874showName6);
        }

        public function set bagHole15(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._397275892bagHole15;
            if (_local_2 !== _arg_1)
            {
                this._397275892bagHole15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole15", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showName9():Label
        {
            return (this._1919589871showName9);
        }

        public function set bagHole16(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._397275891bagHole16;
            if (_local_2 !== _arg_1)
            {
                this._397275891bagHole16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole16", _local_2, _arg_1));
            };
        }

        public function set bagHole17(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._397275890bagHole17;
            if (_local_2 !== _arg_1)
            {
                this._397275890bagHole17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagHole17", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showName4():Label
        {
            return (this._1919589876showName4);
        }

        [Bindable(event="propertyChange")]
        public function get showName5():Label
        {
            return (this._1919589875showName5);
        }

        [Bindable(event="propertyChange")]
        public function get showHeart8():Label
        {
            return (this._453832207showHeart8);
        }

        public function __bagBtn4_click(_arg_1:MouseEvent):void
        {
            changeBagView(4);
        }

        [Bindable(event="propertyChange")]
        public function get showName1():Label
        {
            return (this._1919589879showName1);
        }

        [Bindable(event="propertyChange")]
        public function get showName7():Label
        {
            return (this._1919589873showName7);
        }

        [Bindable(event="propertyChange")]
        public function get showName8():Label
        {
            return (this._1919589872showName8);
        }

        public function set ifUseByGold(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1573867231ifUseByGold;
            if (_local_2 !== _arg_1)
            {
                this._1573867231ifUseByGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ifUseByGold", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showName3():Label
        {
            return (this._1919589877showName3);
        }

        [Bindable(event="propertyChange")]
        public function get holeNum1():MonsterHeartSlot
        {
            return (this._514994613holeNum1);
        }

        [Bindable(event="propertyChange")]
        public function get holeNum3():MonsterHeartSlot
        {
            return (this._514994611holeNum3);
        }

        [Bindable(event="propertyChange")]
        public function get holeNum4():MonsterHeartSlot
        {
            return (this._514994610holeNum4);
        }

        [Bindable(event="propertyChange")]
        public function get holeNum5():MonsterHeartSlot
        {
            return (this._514994609holeNum5);
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        [Bindable(event="propertyChange")]
        public function get holeNum7():MonsterHeartSlot
        {
            return (this._514994607holeNum7);
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        [Bindable(event="propertyChange")]
        public function get needExpLab():Label
        {
            return (this._1730037146needExpLab);
        }

        [Bindable(event="propertyChange")]
        public function get holeNum6():MonsterHeartSlot
        {
            return (this._514994608holeNum6);
        }

        [Bindable(event="propertyChange")]
        public function get holeNum2():MonsterHeartSlot
        {
            return (this._514994612holeNum2);
        }

        public function set levelShowImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1054773958levelShowImage;
            if (_local_2 !== _arg_1)
            {
                this._1054773958levelShowImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelShowImage", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nowRatioLab():Label
        {
            return (this._281628040nowRatioLab);
        }

        private function changeView(_arg_1:Number):void
        {
            var _local_3:int;
            vsFlop.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 3)
            {
                this[("bangBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
            if (_arg_1 == 2)
            {
                BagCanvas.visible = false;
                _local_3 = 1;
                while (_local_3 <= 7)
                {
                    this[("bagBtn" + _local_3)].visible = false;
                    _local_3++;
                };
            }
            else
            {
                BagCanvas.visible = true;
                _local_3 = 1;
                while (_local_3 <= 7)
                {
                    this[("bagBtn" + _local_3)].visible = true;
                    _local_3++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get ifUseJinshiHeart():CheckBox
        {
            return (this._1333480055ifUseJinshiHeart);
        }

        public function set resolveNumNS(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._402246975resolveNumNS;
            if (_local_2 !== _arg_1)
            {
                this._402246975resolveNumNS = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolveNumNS", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upGradeJishu():NumericStepper
        {
            return (this._636843653upGradeJishu);
        }

        [Bindable(event="propertyChange")]
        private function get maxResolveNum():Number
        {
            return (this._1523019390maxResolveNum);
        }

        public function set pageSelectLabel(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._1409449289pageSelectLabel;
            if (_local_2 !== _arg_1)
            {
                this._1409449289pageSelectLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelectLabel", _local_2, _arg_1));
            };
        }

        private function updataBagChange():void
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_1:String = BagTypeArr[(choiceBag - 1)];
            var _local_2:Object = bagData[_local_1];
            pageSelect.onPageChanged = pageChange;
            pageSelectLabel.onPageChanged = labelPageChange;
            pageSelect.onPageCleared = pageClear;
            itemAC.removeAll();
            for (_local_3 in _local_2)
            {
                _local_4 = new Object();
                _local_4.id = _local_3;
                _local_4.itemId = _local_2[_local_3].itemId;
                _local_4.n = _local_2[_local_3].n;
                itemAC.addItem(_local_4);
            };
            updatePage();
        }

        public function set imLine11(_arg_1:Image):void
        {
            var _local_2:Object = this._1458694312imLine11;
            if (_local_2 !== _arg_1)
            {
                this._1458694312imLine11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine11", _local_2, _arg_1));
            };
        }

        public function set imLine10(_arg_1:Image):void
        {
            var _local_2:Object = this._1458694313imLine10;
            if (_local_2 !== _arg_1)
            {
                this._1458694313imLine10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine10", _local_2, _arg_1));
            };
        }

        private function freshenOneBox():void
        {
            var _local_2:Number;
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:String;
            var _local_6:Number;
            var _local_7:Object;
            var _local_8:*;
            var _local_9:Number;
            var _local_10:String;
            var _local_1:int = 1;
            while (_local_1 <= 7)
            {
                _local_2 = ((choiceBox * 10) + _local_1);
                _local_3 = GameData.d[GamePredef.TBL_CREATUREH_POINT][_local_2];
                this[("holeNum" + _local_1)].reset();
                this[("holeNum" + _local_1)].toolTip = "";
                this[("holeNum" + _local_1)].monsterHeartBox = choiceBox;
                if (!monsterHeartData.hadActHole[choiceBox][_local_1])
                {
                    _local_4 = _local_3.quality;
                    _local_5 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_3.itemId].name;
                    _local_5 = (_local_5 + JGZ_COLOR[_local_4]);
                    _local_6 = _local_3.goldnum;
                    this[("holeNum" + _local_1)].toolTip = Language.MONSTER_HEART[11].toString().replace("{name}", _local_5).replace("{num}", _local_3.num).replace("{gold}", _local_6);
                    this[("holeNum" + _local_1)].setOpen(false);
                }
                else
                {
                    this[("holeNum" + _local_1)].setOpen(true);
                    if (monsterHeartData.hadActHole[choiceBox][_local_1] > 0)
                    {
                        this[("holeNum" + _local_1)].type = GamePredef.TBL_CREATUREH_HEART;
                        this[("holeNum" + _local_1)].giid = monsterHeartData.hadActHole[choiceBox][_local_1];
                        this[("holeNum" + _local_1)].slotData = GameData.d[GamePredef.TBL_CREATUREH_HEART][monsterHeartData.hadActHole[choiceBox][_local_1]];
                        _local_7 = _core.data.getGameData(131, monsterHeartData.hadActHole[choiceBox][_local_1]);
                        (((_local_7) && (_local_7.color)) && (this[("holeNum" + _local_1)].setStyleName(_local_7.color)));
                    }
                    else
                    {
                        _local_8 = ((choiceBox * 10) + _local_1);
                        _local_9 = GameData.d[GamePredef.TBL_CREATUREH_POINT][_local_8].type;
                        _local_10 = Language.MONSTER_HEART[10];
                        if (_local_9 < 0)
                        {
                            _local_10 = (_local_10 + (("<font color='#00FF00'>" + "Tất cả hệ") + "</font>"));
                        }
                        else
                        {
                            _local_10 = (_local_10 + (("<font color='#00FF00'>" + TipMonsterHeart.MONHEART_TYPE[_local_9]) + "</font>"));
                        };
                        this[("holeNum" + _local_1)].toolTip = _local_10;
                    };
                };
                _local_1++;
            };
        }

        public function set imLine12(_arg_1:Image):void
        {
            var _local_2:Object = this._1458694311imLine12;
            if (_local_2 !== _arg_1)
            {
                this._1458694311imLine12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine12", _local_2, _arg_1));
            };
        }

        public function __upGradeJishu_change(_arg_1:NumericStepperEvent):void
        {
            setMHSlotUpSuccessRate();
        }

        public function ___MonsterHeartPanel_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            resolveHeart();
        }

        public function __resolveNumNS_change(_arg_1:NumericStepperEvent):void
        {
            changeResolveExp();
        }

        public function set needUpSlot(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._1280191633needUpSlot;
            if (_local_2 !== _arg_1)
            {
                this._1280191633needUpSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needUpSlot", _local_2, _arg_1));
            };
        }

        public function set BagCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1450694496BagCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1450694496BagCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "BagCanvas", _local_2, _arg_1));
            };
        }

        public function __bagBtn3_click(_arg_1:MouseEvent):void
        {
            changeBagView(3);
        }

        public function set needExpText(_arg_1:Label):void
        {
            var _local_2:Object = this._2091301004needExpText;
            if (_local_2 !== _arg_1)
            {
                this._2091301004needExpText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needExpText", _local_2, _arg_1));
            };
        }

        public function set bagBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._344721027bagBtn1;
            if (_local_2 !== _arg_1)
            {
                this._344721027bagBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagBtn1", _local_2, _arg_1));
            };
        }

        public function set bagBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._344721026bagBtn2;
            if (_local_2 !== _arg_1)
            {
                this._344721026bagBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagBtn2", _local_2, _arg_1));
            };
        }

        public function set bagBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._344721025bagBtn3;
            if (_local_2 !== _arg_1)
            {
                this._344721025bagBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagBtn3", _local_2, _arg_1));
            };
        }

        private function updatePage():void
        {
            pageSelect.initPageSeletor(itemAC.length, countPerPage);
            pageSelect.pageNo = itemPageNo;
        }

        public function set bagBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._344721022bagBtn6;
            if (_local_2 !== _arg_1)
            {
                this._344721022bagBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagBtn6", _local_2, _arg_1));
            };
        }

        protected function ifUseByGold_clickHandler(_arg_1:MouseEvent):void
        {
            if (((ifUseByGold.selected) && (!(ifUseJinshiHeart.selected))))
            {
                ifUseJinshiHeart.selected = true;
            };
        }

        public function set bagBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._344721023bagBtn5;
            if (_local_2 !== _arg_1)
            {
                this._344721023bagBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagBtn5", _local_2, _arg_1));
            };
        }

        public function set bagBtn7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._344721021bagBtn7;
            if (_local_2 !== _arg_1)
            {
                this._344721021bagBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagBtn7", _local_2, _arg_1));
            };
        }

        public function updateMonsterHeartPanel(_arg_1:Object):void
        {
            monsterHeartData = _arg_1["data"];
            bagData = _arg_1["bag"];
            setImageLineVis();
            freshenOneBox();
            freshenNeedExp();
            updataBagChange();
        }

        public function ___MonsterHeartPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        public function set vsFlop(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._808329852vsFlop;
            if (_local_2 !== _arg_1)
            {
                this._808329852vsFlop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsFlop", _local_2, _arg_1));
            };
        }

        public function set bagBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._344721024bagBtn4;
            if (_local_2 !== _arg_1)
            {
                this._344721024bagBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagBtn4", _local_2, _arg_1));
            };
        }

        private function pageChange(_arg_1:int, _arg_2:int):void
        {
            itemPageNo = pageSelect.pageNo;
            drawPage(_arg_1, _arg_2);
        }

        public function set mhTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1011903869mhTitle;
            if (_local_2 !== _arg_1)
            {
                this._1011903869mhTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mhTitle", _local_2, _arg_1));
            };
        }

        private function setImageLineVis():void
        {
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:*;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Object;
            var _local_16:String;
            var _local_17:Array;
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Number;
            var _local_21:Number;
            var _local_22:int;
            var _local_23:String;
            var _local_24:Number;
            var _local_25:Number;
            var _local_26:Number;
            var _local_27:int;
            var _local_1:Number = ((choiceBox * 10) + 1);
            var _local_2:String = GameData.d[GamePredef.TBL_CREATUREH_CONTAIN][_local_1].line;
            var _local_3:Array = _local_2.split("|");
            var _local_4:int = 1;
            while (_local_4 <= 12)
            {
                this[("imLine" + _local_4)].visible = false;
                _local_8 = fangxiangArr[(_local_4 - 1)];
                _local_9 = resIconArr[_local_8][0];
                this[("imLine" + _local_4)].source = ResManager.getIconUrl(_local_9);
                _local_4++;
            };
            var _local_5:int;
            while (_local_5 < _local_3.length)
            {
                this[("imLine" + _local_3[_local_5])].visible = true;
                _local_5++;
            };
            var _local_6:int = 1;
            while (_local_6 <= 5)
            {
                this[("showCombine" + _local_6)].visible = false;
                _local_6++;
            };
            var _local_7:Object = monsterHeartData.hadActCombine[choiceBox];
            if (_local_7)
            {
                _local_10 = (choiceBox * 10);
                _local_11 = 1;
                for (_local_12 in _local_7)
                {
                    _local_13 = Math.floor((Number(_local_12) / 100));
                    if (_local_13 != _local_10)
                    {
                        _local_10 = _local_13;
                        _local_14 = ((Number(_local_12) * 10) + Number(_local_7[_local_12].color));
                        _local_15 = GameData.d[GamePredef.TBL_CREATUREH_COMBINE][_local_14];
                        _local_16 = _local_15.lineCombine;
                        _local_17 = _local_16.split("|");
                        _local_18 = ((choiceBox * 10) + Number(monsterHeartData.heartBoxLev[choiceBox]));
                        _local_19 = GameData.d[GamePredef.TBL_CREATUREH_CONTAIN][_local_18].num;
                        _local_20 = (_local_19 / 10000);
                        _local_21 = (Number(_local_7[_local_12].talent) / 10000);
                        _local_22 = 0;
                        while (_local_22 < _local_17.length)
                        {
                            _local_26 = (Number(_local_17[_local_22]) - 1);
                            _local_8 = fangxiangArr[_local_26];
                            _local_27 = (_local_10 % 10);
                            _local_9 = resIconArr[_local_8][_local_27];
                            this[("imLine" + _local_17[_local_22])].source = ResManager.getIconUrl(_local_9);
                            _local_22++;
                        };
                        _local_23 = (("<font color='#F9F900'>" + _local_15.name) + "</font>");
                        _local_24 = _local_15.propType1;
                        _local_25 = Math.ceil(((_local_21 * _local_20) * Number(_local_15.pNum1)));
                        this[("showCombine" + _local_11)].visible = true;
                        switch (_local_24)
                        {
                            case 1:
                            case 2:
                            case 4:
                            case 5:
                            case 6:
                            case 7:
                            case 8:
                            case 9:
                            case 10:
                            case 11:
                            case 12:
                            case 13:
                            case 14:
                            case 31:
                            case 32:
                            case 58:
                            case 61:
                            case 71:
                            case 34:
                            case 72:
                                this[("showCombine" + _local_11)].htmlText = (((((_local_23 + "  ") + "<font color='#00FFFF'>") + Language.TIP_MONSTER_H[_local_24]) + (_local_25 / 10000)) + "</font>");
                                break;
                            case 59:
                            case 60:
                            case 62:
                            case 63:
                                this[("showCombine" + _local_11)].htmlText = ((((((_local_23 + "  ") + "<font color='#00FFFF'>") + Language.TIP_MONSTER_H[_local_24]) + (_local_25 / 100)) + "%") + "</font>");
                                break;
                        };
                        _local_11++;
                    };
                };
            };
        }

        public function set jinshiHeartSlot(_arg_1:MonsterHeartSlot):void
        {
            var _local_2:Object = this._61299297jinshiHeartSlot;
            if (_local_2 !== _arg_1)
            {
                this._61299297jinshiHeartSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jinshiHeartSlot", _local_2, _arg_1));
            };
        }

        public function set nowBoxLevelLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1600033182nowBoxLevelLab;
            if (_local_2 !== _arg_1)
            {
                this._1600033182nowBoxLevelLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nowBoxLevelLab", _local_2, _arg_1));
            };
        }

        private function freshenNeedExp():void
        {
            var _local_1:Number = monsterHeartData.heartBoxLev[choiceBox];
            var _local_2:Number = levelIconArr[(choiceBox - 1)][(_local_1 - 1)];
            levelShowImage.source = ResManager.getIconUrl(_local_2);
            var _local_3:Number = ((choiceBox * 10) + monsterHeartData.heartBoxLev[choiceBox]);
            var _local_4:Object = GameData.d[GamePredef.TBL_CREATUREH_CONTAIN][_local_3];
            var _local_5:Number = _local_4.exp;
            if (monsterHeartData.heartBoxLev[choiceBox] == 6)
            {
                needExpText.visible = false;
                needExpLab.visible = false;
                nowBoxLevelLab.htmlText = (("Lv" + monsterHeartData.heartBoxLev[choiceBox]) + "（Max）");
            }
            else
            {
                needExpText.visible = true;
                needExpLab.visible = true;
                needExpLab.htmlText = _local_5.toString();
                nowBoxLevelLab.htmlText = ("Lv" + monsterHeartData.heartBoxLev[choiceBox]);
            };
            nowRatioLab.htmlText = (((_local_4.num / 100) - 100) + "%");
        }

        public function set bangBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324756bangBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1863324756bangBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imLine12():Image
        {
            return (this._1458694311imLine12);
        }

        public function set bangBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324755bangBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1863324755bangBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn1", _local_2, _arg_1));
            };
        }

        public function set bangBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324754bangBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1863324754bangBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imLine10():Image
        {
            return (this._1458694313imLine10);
        }

        public function ___MonsterHeartPanel_BasicGlowButton11_click(_arg_1:MouseEvent):void
        {
            upgradeBox();
        }

        [Bindable(event="propertyChange")]
        public function get BagCanvas():Canvas
        {
            return (this._1450694496BagCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get imLine11():Image
        {
            return (this._1458694312imLine11);
        }

        [Bindable(event="propertyChange")]
        public function get needUpSlot():MonsterHeartSlot
        {
            return (this._1280191633needUpSlot);
        }

        public function set haveExpLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1460564552haveExpLab;
            if (_local_2 !== _arg_1)
            {
                this._1460564552haveExpLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "haveExpLab", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needExpText():Label
        {
            return (this._2091301004needExpText);
        }

        public function set showPro1(_arg_1:Label):void
        {
            var _local_2:Object = this._338940991showPro1;
            if (_local_2 !== _arg_1)
            {
                this._338940991showPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPro1", _local_2, _arg_1));
            };
        }

        public function set showPro2(_arg_1:Label):void
        {
            var _local_2:Object = this._338940990showPro2;
            if (_local_2 !== _arg_1)
            {
                this._338940990showPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPro2", _local_2, _arg_1));
            };
        }

        public function set showPro3(_arg_1:Label):void
        {
            var _local_2:Object = this._338940989showPro3;
            if (_local_2 !== _arg_1)
            {
                this._338940989showPro3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPro3", _local_2, _arg_1));
            };
        }

        public function set showPro5(_arg_1:Label):void
        {
            var _local_2:Object = this._338940987showPro5;
            if (_local_2 !== _arg_1)
            {
                this._338940987showPro5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPro5", _local_2, _arg_1));
            };
        }

        public function set showPro6(_arg_1:Label):void
        {
            var _local_2:Object = this._338940986showPro6;
            if (_local_2 !== _arg_1)
            {
                this._338940986showPro6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPro6", _local_2, _arg_1));
            };
        }

        public function ___MonsterHeartPanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            upgradeMonsterHeartItem(false);
        }

        override public function initialize():void
        {
            var target:MonsterHeartPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MonsterHeartPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MonsterHeartPanelWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        public function set showPro9(_arg_1:Label):void
        {
            var _local_2:Object = this._338940983showPro9;
            if (_local_2 !== _arg_1)
            {
                this._338940983showPro9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPro9", _local_2, _arg_1));
            };
        }

        public function set showPro7(_arg_1:Label):void
        {
            var _local_2:Object = this._338940985showPro7;
            if (_local_2 !== _arg_1)
            {
                this._338940985showPro7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPro7", _local_2, _arg_1));
            };
        }

        public function __bagBtn2_click(_arg_1:MouseEvent):void
        {
            changeBagView(2);
        }

        public function set showPro8(_arg_1:Label):void
        {
            var _local_2:Object = this._338940984showPro8;
            if (_local_2 !== _arg_1)
            {
                this._338940984showPro8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPro8", _local_2, _arg_1));
            };
        }

        private function onPageSelect(_arg_1:int):void
        {
            var _local_2:int = (5 + _boxIndex);
            if (_arg_1 == 1)
            {
                _local_2--;
                _boxIndex = (_local_2 % 5);
                if (_boxIndex == 0)
                {
                    _boxIndex = 5;
                };
            }
            else
            {
                _boxIndex = (++_local_2 % 5);
                if (_boxIndex == 0)
                {
                    _boxIndex = 5;
                };
            };
            choiceBox = _boxIndex;
            freshenNeedExp();
            freshenOneBox();
            setImageLineVis();
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn0():BasicGlowButton
        {
            return (this._1863324756bangBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn1():BasicGlowButton
        {
            return (this._1863324755bangBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn2():BasicGlowButton
        {
            return (this._1863324754bangBtn2);
        }

        public function set showPro4(_arg_1:Label):void
        {
            var _local_2:Object = this._338940988showPro4;
            if (_local_2 !== _arg_1)
            {
                this._338940988showPro4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPro4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showPro1():Label
        {
            return (this._338940991showPro1);
        }

        [Bindable(event="propertyChange")]
        public function get showPro2():Label
        {
            return (this._338940990showPro2);
        }

        [Bindable(event="propertyChange")]
        public function get showPro3():Label
        {
            return (this._338940989showPro3);
        }

        [Bindable(event="propertyChange")]
        public function get showPro5():Label
        {
            return (this._338940987showPro5);
        }

        [Bindable(event="propertyChange")]
        public function get showPro6():Label
        {
            return (this._338940986showPro6);
        }

        [Bindable(event="propertyChange")]
        public function get showPro9():Label
        {
            return (this._338940983showPro9);
        }

        [Bindable(event="propertyChange")]
        public function get showPro4():Label
        {
            return (this._338940988showPro4);
        }

        [Bindable(event="propertyChange")]
        public function get showPro7():Label
        {
            return (this._338940985showPro7);
        }

        [Bindable(event="propertyChange")]
        public function get showPro8():Label
        {
            return (this._338940984showPro8);
        }

        public function set upSuccessRate(_arg_1:Label):void
        {
            var _local_2:Object = this._2003452392upSuccessRate;
            if (_local_2 !== _arg_1)
            {
                this._2003452392upSuccessRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upSuccessRate", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initMonsterHeartData", new Responder(onInitMonsterHeartData));
        }

        public function set showMax2(_arg_1:Label):void
        {
            var _local_2:Object = this._339046421showMax2;
            if (_local_2 !== _arg_1)
            {
                this._339046421showMax2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showMax2", _local_2, _arg_1));
            };
        }

        public function set showMax1(_arg_1:Label):void
        {
            var _local_2:Object = this._339046422showMax1;
            if (_local_2 !== _arg_1)
            {
                this._339046422showMax1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showMax1", _local_2, _arg_1));
            };
        }

        public function set showMax7(_arg_1:Label):void
        {
            var _local_2:Object = this._339046416showMax7;
            if (_local_2 !== _arg_1)
            {
                this._339046416showMax7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showMax7", _local_2, _arg_1));
            };
        }

        public function set showMax4(_arg_1:Label):void
        {
            var _local_2:Object = this._339046419showMax4;
            if (_local_2 !== _arg_1)
            {
                this._339046419showMax4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showMax4", _local_2, _arg_1));
            };
        }

        public function set showMax9(_arg_1:Label):void
        {
            var _local_2:Object = this._339046414showMax9;
            if (_local_2 !== _arg_1)
            {
                this._339046414showMax9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showMax9", _local_2, _arg_1));
            };
        }

        public function set showMax6(_arg_1:Label):void
        {
            var _local_2:Object = this._339046417showMax6;
            if (_local_2 !== _arg_1)
            {
                this._339046417showMax6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showMax6", _local_2, _arg_1));
            };
        }

        public function set showMax3(_arg_1:Label):void
        {
            var _local_2:Object = this._339046420showMax3;
            if (_local_2 !== _arg_1)
            {
                this._339046420showMax3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showMax3", _local_2, _arg_1));
            };
        }

        public function updateMonsterHeartAfterUp(_arg_1:Boolean, _arg_2:Number):void
        {
            if (_arg_1)
            {
                _core.sysMidNote("Kết thúc dung luyện toàn bộ dung luyện Ma Tâm");
            }
            else
            {
                if (_arg_2 == 1)
                {
                    _core.sysMidNote("Dung luyện thành công");
                }
                else
                {
                    _core.sysMidNote("Dung luyện thất bại");
                };
            };
            needUpSlot.stackNum = 1;
            afterUpSlot.stackNum = _arg_2;
        }

        [Bindable(event="propertyChange")]
        public function get showMax1():Label
        {
            return (this._339046422showMax1);
        }

        [Bindable(event="propertyChange")]
        public function get showMax2():Label
        {
            return (this._339046421showMax2);
        }

        public function __bagBtn7_click(_arg_1:MouseEvent):void
        {
            changeBagView(7);
        }

        [Bindable(event="propertyChange")]
        public function get showMax5():Label
        {
            return (this._339046418showMax5);
        }

        [Bindable(event="propertyChange")]
        public function get showMax6():Label
        {
            return (this._339046417showMax6);
        }

        [Bindable(event="propertyChange")]
        public function get showMax7():Label
        {
            return (this._339046416showMax7);
        }

        public function set imLine2(_arg_1:Image):void
        {
            var _local_2:Object = this._1892607994imLine2;
            if (_local_2 !== _arg_1)
            {
                this._1892607994imLine2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine2", _local_2, _arg_1));
            };
        }

        public function setMHSlotAfterUp(_arg_1:Number):void
        {
            setMHSlotUpSuccessRate();
            var _local_2:Object = GameData.d[GamePredef.TBL_CREATUREH_HEART][_arg_1];
            var _local_3:Number = (Number(_local_2.color) + 1);
            if (((!(_local_2)) || (_local_3 > 5)))
            {
                return;
            };
            var _local_4:Number = (_arg_1 + 1);
            afterUpSlot.clean();
            afterUpSlot.type = GamePredef.TBL_CREATUREH_HEART;
            afterUpSlot.giid = _local_4;
            afterUpSlot.slotData = GameData.d[GamePredef.TBL_CREATUREH_HEART][_local_4];
            var _local_5:Object = _core.data.getGameData(131, _local_4);
            (((_local_5) && (_local_5.color)) && (afterUpSlot.setStyleName(_local_3)));
        }

        public function set imLine3(_arg_1:Image):void
        {
            var _local_2:Object = this._1892607995imLine3;
            if (_local_2 !== _arg_1)
            {
                this._1892607995imLine3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imLine6():Image
        {
            return (this._1892607998imLine6);
        }

        public function set imLine4(_arg_1:Image):void
        {
            var _local_2:Object = this._1892607996imLine4;
            if (_local_2 !== _arg_1)
            {
                this._1892607996imLine4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imLine4", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

