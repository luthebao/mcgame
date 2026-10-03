// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.HorseRace

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import flash.display.MovieClip;
    import mx.containers.Canvas;
    import mx.controls.Button;
    import mx.controls.Label;
    import flash.display.Loader;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.IntroText;
    import flash.display.BitmapData;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.UIComponent;
    import mx.core.mx_internal;
    import com.qeedoo.effects.EnterFrameMove;
    import flash.events.Event;
    import mx.events.PropertyChangeEvent;
    import flash.display.Bitmap;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import flash.display.Sprite;
    import flash.events.IOErrorEvent;
    import flash.net.Responder;
    import flash.geom.Matrix;
    import flash.utils.setTimeout;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.resource.ResManager;
    import mx.controls.Alert;
    import flash.utils.getDefinitionByName;
    import mx.events.CloseEvent;
    import mx.events.FlexEvent;
    import flash.net.URLRequest;
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

    public class HorseRace extends DragableCanvas implements IBindingClient 
    {

        public static var rects:Array = [];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1850821991action2Img:Image;
        private var horseC:MovieClip;
        private var btn_left:MovieClip;
        private var _934426595result:Canvas;
        private var popC:MovieClip;
        private var pitE:Boolean = false;
        private var btn_crash:Button;
        private var _1161803588action2:Label;
        private var btn_jump:MovieClip;
        private var _145245137container2:Canvas;
        private var _601215973currentStep:Label;
        private var moving:Boolean = false;
        private var btn_right:MovieClip;
        private var stoneE:Boolean = false;
        private var mc_stone:MovieClip;
        private var _1850792200action1Img:Image;
        private var btn_down:MovieClip;
        private var _106433028panel:Canvas;
        private var btn_start:MovieClip;
        private var wData:Object;
        private var _1457826029currentStep2:Label;
        private var btn_middle:MovieClip;
        private var load:Loader;
        public var _HorseRace_ItemSlot1:ItemSlot;
        public var _HorseRace_ItemSlot2:ItemSlot;
        private var _1161803589action1:Label;
        private var mc_radish:MovieClip;
        private var radishE:Boolean = false;
        private var _115312txt:IntroText;
        private var _1835012049todayScore:Label;
        private var btn_up:MovieClip;
        private var five_jump_counter:int = 0;
        public var _HorseRace_Label3:Label;
        public var _HorseRace_Label5:Label;
        public var _HorseRace_Label6:Label;
        private var HORSE_RACE_BOX_TYPE1:int = 1;
        private var HORSE_RACE_BOX_TYPE2:int = 2;
        private var HORSE_RACE_BOX_TYPE3:int = 3;
        private var mc_pit:MovieClip;
        private var _145245136container1:Canvas;
        private var itemBMD1:BitmapData;
        private var itemBMD2:BitmapData;
        private var itemBMD3:BitmapData;
        public var _HorseRace_BasicGlowButton1:BasicGlowButton;
        private var btn_cancel:MovieClip;
        private var rankData:Array;
        public var _HorseRace_Image3:Image;
        private var load_state:int = 0;
        public var _HorseRace_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_HorseRace_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":38,
                                "width":680,
                                "height":440,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"panel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":665,
                                            "height":220,
                                            "x":8,
                                            "y":5,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"container1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"result",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "visible":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"currentStep2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "-35";
                                                                this.color = 0xFFFF;
                                                                this.textAlign = "center";
                                                                this.fontSize = 30;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":35,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"todayScore",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "0";
                                                                this.color = 0xFFFF;
                                                                this.textAlign = "center";
                                                                this.fontSize = 30;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":35,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_HorseRace_BasicGlowButton1",
                                                            "events":{"click":"___HorseRace_BasicGlowButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "40";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"styleName":"BtnStdRed"});
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
                                            "width":180,
                                            "height":205,
                                            "x":8,
                                            "y":229,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"_HorseRace_ItemSlot1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":25,
                                                        "y":70,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"action1Img",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26,
                                                        "y":71
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"_HorseRace_ItemSlot2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":80,
                                                        "y":70,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"action2Img",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":81,
                                                        "y":71
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_HorseRace_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "32";
                                                    this.left = "0";
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.strokeColor = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":15,
                                                        "y":27,
                                                        "width":150,
                                                        "height":1
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"currentStep",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "7";
                                                    this.left = "0";
                                                    this.color = 0xFFFF00;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_HorseRace_Label5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "50";
                                                    this.left = "20";
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":45,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_HorseRace_Label6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "50";
                                                    this.left = "75";
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":45,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"container2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___HorseRace_Button1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"horseCrash",
                                                                    "y":140
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"action1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "105";
                                                    this.left = "30";
                                                    this.color = 0xFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":35,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"action2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "105";
                                                    this.left = "85";
                                                    this.color = 0xFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":35,
                                                        "height":16
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
                                            "width":280,
                                            "height":205,
                                            "x":190,
                                            "y":229,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_HorseRace_Image3"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":200,
                                            "height":205,
                                            "x":473,
                                            "y":229,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"txt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "5";
                                                    this.top = "5";
                                                    this.right = "5";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":195,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var HORSE_RACE_MAP_TYPE1:Object = {
            "1":{
                "6":3,
                "15":1,
                "23":2,
                "39":1,
                "44":3,
                "60":3,
                "61":2,
                "76":1,
                "80":2,
                "87":3
            },
            "2":{
                "6":1,
                "11":2,
                "12":3,
                "26":1,
                "31":3,
                "33":2,
                "44":3,
                "54":1,
                "71":2,
                "76":3,
                "87":1,
                "99":2
            },
            "3":{
                "6":3,
                "15":2,
                "26":1,
                "28":3,
                "39":1,
                "47":2,
                "59":1,
                "62":3,
                "76":1,
                "85":2,
                "96":1
            }
        };
        private var HORSE_RACE_MAP_TYPE2:Object = {
            "1":{
                "6":2,
                "12":3,
                "23":2,
                "39":1,
                "45":3,
                "53":2,
                "62":3,
                "80":1,
                "83":3,
                "84":2
            },
            "2":{
                "12":2,
                "13":3,
                "19":1,
                "35":3,
                "39":2,
                "49":3,
                "61":1,
                "68":3,
                "69":2,
                "88":1,
                "94":2
            },
            "3":{
                "12":1,
                "25":3,
                "27":2,
                "39":1,
                "60":3,
                "61":2,
                "80":1,
                "88":2
            }
        };
        private var HORSE_RACE_MAP_TYPE3:Object = {
            "1":{
                "9":1,
                "27":3,
                "29":2,
                "39":2,
                "40":3,
                "54":1,
                "79":2,
                "88":2
            },
            "2":{
                "16":2,
                "19":3,
                "29":1,
                "32":3,
                "45":2,
                "67":1,
                "69":3,
                "92":1
            },
            "3":{
                "9":3,
                "12":2,
                "29":2,
                "44":1,
                "51":3,
                "67":2,
                "74":3,
                "82":2
            }
        };
        private var HORSE_RACE_MAP_TYPE4:Object = {
            "1":{
                "17":1,
                "20":3,
                "32":1,
                "34":3,
                "54":1,
                "62":3,
                "78":1,
                "89":3,
                "94":2
            },
            "2":{
                "9":2,
                "25":2,
                "35":2,
                "47":2,
                "60":2,
                "74":2,
                "86":2,
                "87":3,
                "92":2,
                "94":2
            },
            "3":{
                "11":1,
                "27":3,
                "42":1,
                "57":3,
                "67":1,
                "70":3,
                "83":1,
                "91":3,
                "94":2
            }
        };
        private var HORSE_RACE_MAP_TYPE5:Object = {
            "1":{
                "9":2,
                "19":3,
                "21":2,
                "33":1,
                "43":3,
                "46":2,
                "57":2,
                "62":3,
                "82":3,
                "87":2
            },
            "2":{
                "12":3,
                "14":2,
                "31":2,
                "46":3,
                "52":2,
                "62":1,
                "82":1
            },
            "3":{
                "9":2,
                "15":2,
                "26":3,
                "28":2,
                "35":2,
                "44":2,
                "53":3,
                "54":2,
                "56":2,
                "58":3,
                "60":2,
                "62":2,
                "63":3,
                "64":2,
                "68":1,
                "76":3,
                "86":2,
                "94":1
            }
        };
        private var HORSE_RACE_MAP_TYPE6:Object = {
            "1":{
                "12":1,
                "35":2,
                "36":3,
                "64":2,
                "83":3,
                "85":2
            },
            "2":{
                "14":3,
                "17":2,
                "35":1,
                "64":3,
                "90":1
            },
            "3":{
                "9":3,
                "22":1,
                "42":3,
                "44":2,
                "64":1,
                "82":3,
                "83":2
            }
        };
        private var HORSE_RACE_MAP_TYPE7:Object = {
            "1":{
                "9":2,
                "14":3,
                "26":2,
                "31":3,
                "44":1,
                "49":3,
                "68":2,
                "71":3,
                "90":1
            },
            "2":{
                "14":1,
                "20":3,
                "38":2,
                "39":3,
                "65":1,
                "66":3,
                "87":2
            },
            "3":{
                "9":3,
                "20":1,
                "26":3,
                "42":2,
                "57":3,
                "59":2,
                "77":1,
                "78":3
            }
        };
        private var HORSE_RACE_MAP_TYPE8:Object = {
            "1":{
                "11":3,
                "25":2,
                "41":2,
                "60":2,
                "69":1,
                "86":2
            },
            "2":{
                "9":3,
                "14":2,
                "25":1,
                "33":2,
                "64":2,
                "80":1,
                "96":2
            },
            "3":{
                "10":3,
                "15":1,
                "41":2,
                "60":1,
                "73":2,
                "94":2
            }
        };
        private var HORSE_RACE_MAP_TYPE9:Object = {
            "1":{
                "12":2,
                "13":3,
                "28":2,
                "49":3,
                "50":2,
                "66":3,
                "90":2
            },
            "2":{
                "15":1,
                "17":3,
                "35":2,
                "61":1,
                "76":3,
                "90":1
            },
            "3":{
                "9":2,
                "10":3,
                "29":3,
                "41":1,
                "57":3,
                "76":2,
                "92":2
            }
        };
        private var HORSE_RACE_MAP_TYPE10:Object = {
            "1":{
                "12":3,
                "18":1,
                "36":3,
                "53":2,
                "76":1,
                "77":3
            },
            "2":{
                "18":3,
                "28":2,
                "41":3,
                "48":1,
                "67":3,
                "76":2,
                "87":3,
                "97":1
            },
            "3":{
                "10":2,
                "21":3,
                "30":1,
                "50":3,
                "61":2,
                "78":3,
                "94":2
            }
        };
        private var HORSE_RACE_MAP_TYPES:Object = {
            "1":HORSE_RACE_MAP_TYPE1,
            "2":HORSE_RACE_MAP_TYPE2,
            "3":HORSE_RACE_MAP_TYPE3,
            "4":HORSE_RACE_MAP_TYPE4,
            "5":HORSE_RACE_MAP_TYPE5,
            "6":HORSE_RACE_MAP_TYPE6,
            "7":HORSE_RACE_MAP_TYPE7,
            "8":HORSE_RACE_MAP_TYPE8,
            "9":HORSE_RACE_MAP_TYPE9,
            "10":HORSE_RACE_MAP_TYPE10
        };
        public var effects:Array = [];
        private var _core:Core = Core.getInstance();
        private var _978091684rankTxt:ArrayCollection = new ArrayCollection();
        private var mapBMC:UIComponent = new UIComponent();
        private var mapBMs:Array = [];
        private var popBMC:UIComponent = new UIComponent();
        private var horseBMC:UIComponent = new UIComponent();
        private var horseBMDS:Array = [];
        private var actions:Array = [];
        private var steps:Array = [];
        private var mStoneC:UIComponent = new UIComponent();
        private var mPitC:UIComponent = new UIComponent();
        private var mRadishC:UIComponent = new UIComponent();
        private var actionImg:Array = [0, 4130220000481, 4130220000482, 4130220000479, 4130220000480, 4130220000483];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function HorseRace()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 500;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            HorseRace._watcherSetupUtil = _arg_1;
        }


        private function fiveJump(_arg_1:Event=null):void
        {
            if (int(int(wData["index"])) > 102)
            {
                wData["index"] = 102;
            };
            mapBMC.x = ((-50 * int(wData["index"])) + (50 * five_jump_counter));
            horseBMC.y = (10 + (int(wData["line"]) * 50));
            if (five_jump_counter <= 0)
            {
                showStoneEffect();
                horseC.gotoAndPlay(horseC.currentFrame);
                popC.gotoAndPlay(horseC.currentFrame);
                return;
            };
            five_jump_counter--;
            var _local_2:EnterFrameMove = new EnterFrameMove();
            _local_2.target = mapBMC;
            _local_2.stepLength = 10;
            _local_2.yBy = 0;
            _local_2.xBy = -25;
            _local_2.addEventListener(EnterFrameMove.EFFECT_END, fiveJumpEnd1);
            _local_2.play(true);
            var _local_3:EnterFrameMove = new EnterFrameMove();
            _local_3.target = horseBMC;
            _local_3.stepLength = 10;
            _local_3.xBy = 0;
            _local_3.yBy = -25;
            horseC.gotoAndStop(1);
            _local_3.play(true);
        }

        private function left(_arg_1:Event):void
        {
            if (((moving) || (actions.length == 2)))
            {
                return;
            };
            actions.push(4);
            refreshActionsText();
        }

        public function set panel(_arg_1:Canvas):void
        {
            var _local_2:Object = this._106433028panel;
            if (_local_2 !== _arg_1)
            {
                this._106433028panel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panel", _local_2, _arg_1));
            };
        }

        public function set action1Img(_arg_1:Image):void
        {
            var _local_2:Object = this._1850792200action1Img;
            if (_local_2 !== _arg_1)
            {
                this._1850792200action1Img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "action1Img", _local_2, _arg_1));
            };
        }

        private function jump1End(_arg_1:Event):void
        {
            horseBMC.y = ((13 + (int((wData["line"] - 1)) * 50)) - 25);
            popBMC.y = (horseBMC.y - 10);
            var _local_2:EnterFrameMove = new EnterFrameMove();
            _local_2.target = horseBMC;
            _local_2.stepLength = 10;
            _local_2.xBy = 0;
            _local_2.yBy = 75;
            _local_2.addEventListener(EnterFrameMove.EFFECT_END, jump2End);
            _local_2.play(true);
            var _local_3:EnterFrameMove = new EnterFrameMove();
            _local_3 = new EnterFrameMove();
            _local_3.target = popBMC;
            _local_3.stepLength = 10;
            _local_3.xBy = 0;
            _local_3.yBy = 75;
            _local_3.play(true);
        }

        [Bindable(event="propertyChange")]
        public function get result():Canvas
        {
            return (this._934426595result);
        }

        private function right(_arg_1:Event):void
        {
            if (((moving) || (actions.length == 2)))
            {
                return;
            };
            actions.push(3);
            refreshActionsText();
        }

        [Bindable(event="propertyChange")]
        public function get panel():Canvas
        {
            return (this._106433028panel);
        }

        private function jump(_arg_1:Event):void
        {
            if (((moving) || (actions.length == 2)))
            {
                return;
            };
            actions.push(5);
            refreshActionsText();
        }

        private function closeHandler(_arg_1:Event):void
        {
            if (horseC)
            {
                horseC.gotoAndStop(horseC.currentFrame);
            };
        }

        public function set result(_arg_1:Canvas):void
        {
            var _local_2:Object = this._934426595result;
            if (_local_2 !== _arg_1)
            {
                this._934426595result = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "result", _local_2, _arg_1));
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_2:UIComponent;
            var _local_29:Class;
            var _local_30:MovieClip;
            var _local_31:BitmapData;
            var _local_32:Bitmap;
            var _local_3:int = 1;
            while (_local_3 <= 8)
            {
                _local_29 = (load.contentLoaderInfo.applicationDomain.getDefinition(("map" + _local_3)) as Class);
                _local_30 = new (_local_29)();
                _local_31 = new BitmapData(_local_30.width, _local_30.height, true, 0xFFFFFF);
                _local_31.draw(_local_30);
                _local_32 = new Bitmap(_local_31);
                mapBMs.push(_local_32);
                _local_3++;
            };
            container1.addChild(mapBMC);
            var _local_4:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("item1") as Class);
            var _local_5:MovieClip = new (_local_4)();
            itemBMD1 = new BitmapData(50, 50, true, 0xFFFFFF);
            itemBMD1.draw(_local_5);
            var _local_6:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("item2") as Class);
            var _local_7:MovieClip = new (_local_6)();
            itemBMD2 = new BitmapData(50, 50, true, 0xFFFFFF);
            itemBMD2.draw(_local_7);
            var _local_8:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("item3") as Class);
            var _local_9:MovieClip = new (_local_8)();
            itemBMD3 = new BitmapData(50, 50, true, 0xFFFFFF);
            itemBMD3.draw(_local_9);
            var _local_10:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("btn_up") as Class);
            btn_up = new (_local_10)();
            _local_2 = new UIComponent();
            _local_2.x = 42;
            _local_2.y = 124;
            _local_2.toolTip = Language.SUMMER_GAME_PANEL[61];
            _local_2.addChild(btn_up);
            btn_up.addEventListener(MouseEvent.CLICK, up);
            container2.addChild(_local_2);
            var _local_11:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("btn_down") as Class);
            btn_down = new (_local_11)();
            _local_2 = new UIComponent();
            _local_2.x = 42;
            _local_2.y = 172;
            _local_2.toolTip = Language.SUMMER_GAME_PANEL[62];
            _local_2.addChild(btn_down);
            btn_down.addEventListener(MouseEvent.CLICK, down);
            container2.addChild(_local_2);
            var _local_12:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("btn_middle") as Class);
            btn_middle = new (_local_12)();
            var _local_13:UIComponent = new UIComponent();
            _local_13.addChild(btn_middle);
            _local_13.x = 42;
            _local_13.y = 144;
            container2.addChildAt(_local_13, 0);
            var _local_14:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("btn_minus") as Class);
            btn_left = new (_local_14)();
            _local_2 = new UIComponent();
            _local_2.x = 22;
            _local_2.y = 144;
            _local_2.toolTip = Language.SUMMER_GAME_PANEL[64];
            _local_2.addChild(btn_left);
            btn_left.addEventListener(MouseEvent.CLICK, left);
            container2.addChild(_local_2);
            var _local_15:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("btn_add") as Class);
            btn_right = new (_local_15)();
            _local_2 = new UIComponent();
            _local_2.x = 70;
            _local_2.y = 144;
            _local_2.toolTip = Language.SUMMER_GAME_PANEL[63];
            _local_2.addChild(btn_right);
            btn_right.addEventListener(MouseEvent.CLICK, right);
            container2.addChild(_local_2);
            var _local_16:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("horse") as Class);
            horseC = new (_local_16)();
            horseBMC.addChild(horseC);
            horseBMC.x = 100;
            container1.addChild(horseBMC);
            var _local_17:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("pop") as Class);
            popC = new (_local_17)();
            popC.speed.text = "1";
            popBMC.addChild(popC);
            popBMC.x = (horseBMC.x - 40);
            container1.addChild(popBMC);
            var _local_18:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("btn_jump") as Class);
            btn_jump = new (_local_18)();
            btn_jump.addEventListener(MouseEvent.CLICK, jump);
            var _local_19:UIComponent = new UIComponent();
            _local_19.addChild(btn_jump);
            _local_19.x = 100;
            _local_19.y = 140;
            container2.addChild(_local_19);
            var _local_20:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("btn_cancel") as Class);
            btn_cancel = new (_local_20)();
            btn_cancel.addEventListener(MouseEvent.CLICK, back);
            var _local_21:UIComponent = new UIComponent();
            _local_21.x = 120;
            _local_21.y = 90;
            _local_21.addChild(btn_cancel);
            container2.addChild(_local_21);
            var _local_22:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("btn_start") as Class);
            btn_start = new (_local_22)();
            btn_start.addEventListener(MouseEvent.CLICK, start);
            var _local_23:UIComponent = new UIComponent();
            _local_23.addChild(btn_start);
            _local_23.x = 120;
            _local_23.y = 65;
            container2.addChild(_local_23);
            var _local_24:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("mc_stone") as Class);
            mc_stone = new (_local_24)();
            mStoneC.addChild(mc_stone);
            mStoneC.visible = false;
            container1.addChild(mStoneC);
            var _local_25:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("mc_pit") as Class);
            mc_pit = new (_local_25)();
            mPitC.addChild(mc_pit);
            mPitC.visible = false;
            container1.addChild(mPitC);
            var _local_26:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("mc_radish") as Class);
            mc_radish = new (_local_26)();
            mRadishC.addChild(mc_radish);
            mRadishC.visible = false;
            container1.addChild(mRadishC);
            var _local_27:Sprite = new Sprite();
            _local_27.graphics.beginFill(0xFFFFFF, 1);
            _local_27.graphics.drawRect(0, 0, 665, 220);
            _local_27.graphics.endFill();
            var _local_28:UIComponent = new UIComponent();
            _local_28.x = container1.x;
            _local_28.y = container1.y;
            _local_28.addChild(_local_27);
            panel.addChild(_local_28);
            container1.mask = _local_27;
            load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            init();
            _core.remote.call("summerGameHorseRace", new Responder(onGetData));
        }

        private function clean():void
        {
        }

        private function start(_arg_1:Event):void
        {
            if (moving)
            {
                return;
            };
            if (actions.length < 2)
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[48]);
                return;
            };
            moving = true;
            _core.remote.call("horseRaceGo", null, actions);
            actions.length = 0;
            refreshActionsText();
        }

        private function moveNext():void
        {
            var _local_9:EnterFrameMove;
            popC.speed.text = wData["speed"];
            if (steps.length == 0)
            {
                moving = false;
                wData["step"] = (int(wData["step"]) + 1);
                popC.speed.text = wData["speed"];
                currentStep.htmlText = (((Language.SUMMER_GAME_PANEL[41] + "<font color='#00ffff'>") + wData["step"]) + "</font>");
                currentStep2.text = (Language.SUMMER_GAME_PANEL[41] + wData["step"]);
                showTodayScore();
                return;
            };
            var _local_1:Object = steps.shift();
            if (!_local_1)
            {
                moveNext();
                return;
            };
            var _local_2:int = _local_1["type"];
            var _local_3:int = _local_1["num"];
            var _local_4:int = _local_1["line1"];
            var _local_5:int = _local_1["line2"];
            var _local_6:int = _local_1["speed1"];
            var _local_7:int = _local_1["speed2"];
            stoneE = _local_1["mc_stone"];
            pitE = _local_1["mc_pit"];
            radishE = _local_1["mc_radish"];
            if (((_local_2 == 1) || (_local_2 == 2)))
            {
                wData["line"] = _local_5;
                wData["speed"] = _local_7;
            }
            else
            {
                if (((_local_2 == 3) || (_local_2 == 4)))
                {
                    wData["speed"] = _local_7;
                }
                else
                {
                    if (_local_2 == 5)
                    {
                        wData["speed"] = _local_7;
                    }
                    else
                    {
                        if (_local_2 == 6)
                        {
                            wData["speed"] = _local_7;
                        };
                    };
                };
            };
            if ((int(wData["index"]) + _local_3) > 102)
            {
                _local_3 = (102 - int(wData["index"]));
                wData["index"] = 102;
            }
            else
            {
                wData["index"] = (int(wData["index"]) + _local_3);
            };
            var _local_8:EnterFrameMove = new EnterFrameMove();
            if ((((_local_2 == 1) || (_local_2 == 2)) && (!(_local_4 == _local_5))))
            {
                _local_8.target = horseBMC;
                _local_8.stepLength = 10;
                _local_8.xBy = 0;
                _local_8.yBy = (50 * ((_local_2 == 1) ? -1 : 1));
                _local_8.addEventListener(EnterFrameMove.EFFECT_END, lineChangeEnd);
                _local_8.play(true);
                _local_9 = new EnterFrameMove();
                _local_9.target = popBMC;
                _local_9.stepLength = 10;
                _local_9.xBy = 0;
                _local_9.yBy = (50 * ((_local_2 == 1) ? -1 : 1));
                _local_9.play(true);
            }
            else
            {
                if ((((_local_2 == 3) || (_local_2 == 4)) && (_local_3 > 0)))
                {
                    _local_8.target = mapBMC;
                    _local_8.stepLength = (10 * _local_6);
                    _local_8.yBy = 0;
                    _local_8.xBy = (-50 * _local_3);
                    _local_8.addEventListener(EnterFrameMove.EFFECT_END, mapMoveEnd);
                    _local_8.play(true);
                }
                else
                {
                    if (_local_2 == 5)
                    {
                        _local_8.target = horseBMC;
                        _local_8.stepLength = 10;
                        _local_8.xBy = 0;
                        _local_8.yBy = -75;
                        _local_8.addEventListener(EnterFrameMove.EFFECT_END, jump1End);
                        horseC.gotoAndStop(1);
                        _local_8.play(true);
                        _local_9 = new EnterFrameMove();
                        _local_9.target = popBMC;
                        _local_9.stepLength = 10;
                        _local_9.xBy = 0;
                        _local_9.yBy = -75;
                        _local_9.play(true);
                        if (_local_3 > 0)
                        {
                            _local_9 = new EnterFrameMove();
                            _local_9.target = mapBMC;
                            _local_9.stepLength = 10;
                            _local_9.yBy = 0;
                            _local_9.xBy = (-50 * _local_3);
                            _local_9.play(true);
                        };
                    }
                    else
                    {
                        if (((_local_2 == 6) && (_local_3 > 0)))
                        {
                            refreshMap();
                            five_jump_counter = _local_3;
                            showRadishEffect();
                        }
                        else
                        {
                            showStoneEffect();
                            moving = false;
                            wData["step"] = (int(wData["step"]) + 1);
                            popC.speed.text = wData["speed"];
                            currentStep.htmlText = (((Language.SUMMER_GAME_PANEL[41] + "<font color='#00ffff'>") + wData["step"]) + "</font>");
                            currentStep2.text = (Language.SUMMER_GAME_PANEL[41] + wData["step"]);
                        };
                    };
                };
            };
        }

        private function mapMoveEnd(_arg_1:Event):void
        {
            if (int(int(wData["index"])) > 102)
            {
                wData["index"] = 102;
            };
            mapBMC.x = (-50 * int(wData["index"]));
            showStoneEffect();
        }

        private function jump2End(_arg_1:Event):void
        {
            horseBMC.y = (13 + (int(wData["line"]) * 50));
            popBMC.y = (horseBMC.y - 10);
            if (int(int(wData["index"])) > 102)
            {
                wData["index"] = 102;
            };
            mapBMC.x = (-50 * int(wData["index"]));
            horseC.gotoAndPlay(horseC.currentFrame);
            popC.gotoAndPlay(horseC.currentFrame);
            showStoneEffect();
        }

        [Bindable(event="propertyChange")]
        public function get txt():IntroText
        {
            return (this._115312txt);
        }

        private function refreshMap():void
        {
            var _local_1:int;
            var _local_7:Bitmap;
            var _local_8:int;
            var _local_9:BitmapData;
            var _local_10:Bitmap;
            while (mapBMC.numChildren > 1)
            {
                mapBMC.removeChildAt(0);
            };
            _local_1 = 0;
            while (_local_1 < mapBMs.length)
            {
                _local_7 = mapBMs[_local_1];
                _local_7.x = (800 * _local_1);
                mapBMC.addChild(_local_7);
                _local_1++;
            };
            var _local_2:int = wData["type"];
            var _local_3:Object = wData["eats"];
            var _local_4:Object = HORSE_RACE_MAP_TYPES[_local_2];
            if (!_local_4)
            {
                return;
            };
            var _local_5:Matrix = new Matrix();
            _local_5.scale(0.5, 1);
            var _local_6:int = 1;
            while (_local_6 <= 3)
            {
                _local_1 = 1;
                while (_local_1 < 101)
                {
                    _local_8 = _local_4[_local_6][_local_1];
                    if (_local_8 > 0)
                    {
                        _local_9 = null;
                        if (_local_8 == 1)
                        {
                            _local_9 = itemBMD1;
                        }
                        else
                        {
                            if (_local_8 == 2)
                            {
                                _local_9 = itemBMD2;
                            }
                            else
                            {
                                if (_local_8 == 3)
                                {
                                    if (!(((_local_3) && (_local_3[_local_6])) && (_local_3[_local_6][_local_1])))
                                    {
                                        _local_9 = itemBMD3;
                                    };
                                };
                            };
                        };
                        if (_local_9)
                        {
                            _local_10 = new Bitmap(_local_9);
                            _local_10.x = ((50 * (_local_1 - 1)) + 150);
                            _local_10.y = ((50 * (_local_6 - 1)) + 70);
                            mapBMC.addChild(_local_10);
                        };
                    };
                    _local_1++;
                };
                _local_6++;
            };
        }

        private function up(_arg_1:Event):void
        {
            if (((moving) || (actions.length == 2)))
            {
                return;
            };
            if (((int(wData["line"]) == 1) && (actions.length == 0)))
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[54]);
                return;
            };
            actions.push(1);
            refreshActionsText();
        }

        private function down(_arg_1:Event):void
        {
            if (((moving) || (actions.length == 2)))
            {
                return;
            };
            if (((int(wData["line"]) == 3) && (actions.length == 0)))
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[55]);
                return;
            };
            actions.push(2);
            refreshActionsText();
        }

        [Bindable(event="propertyChange")]
        private function get rankTxt():ArrayCollection
        {
            return (this._978091684rankTxt);
        }

        private function getAward():void
        {
            if (!result.visible)
            {
                return;
            };
            _core.remote.call("horseRaceGetAward", new Responder(onGetAward));
        }

        private function clearPage():void
        {
            rankTxt.removeAll();
        }

        private function showTodayScore():void
        {
            if (((wData) && (int(wData["state"]) == 2)))
            {
                todayScore.text = (Language.SUMMER_GAME_PANEL[40] + wData["score"]);
                result.visible = true;
            }
            else
            {
                todayScore.text = Language.SUMMER_GAME_PANEL[31];
            };
        }

        public function ___HorseRace_Button1_click(_arg_1:MouseEvent):void
        {
            crash();
        }

        [Bindable(event="propertyChange")]
        public function get action1():Label
        {
            return (this._1161803589action1);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" horseRace load res Error ");
        }

        [Bindable(event="propertyChange")]
        public function get action2():Label
        {
            return (this._1161803588action2);
        }

        public function set action2Img(_arg_1:Image):void
        {
            var _local_2:Object = this._1850821991action2Img;
            if (_local_2 !== _arg_1)
            {
                this._1850821991action2Img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "action2Img", _local_2, _arg_1));
            };
        }

        private function fiveJumpEnd1(_arg_1:Event):void
        {
            var _local_2:EnterFrameMove = new EnterFrameMove();
            _local_2.target = mapBMC;
            _local_2.stepLength = 10;
            _local_2.yBy = 0;
            _local_2.xBy = -25;
            _local_2.addEventListener(EnterFrameMove.EFFECT_END, fiveJump);
            _local_2.play(true);
            var _local_3:EnterFrameMove = new EnterFrameMove();
            _local_3.target = horseBMC;
            _local_3.stepLength = 10;
            _local_3.xBy = 0;
            _local_3.yBy = 25;
            _local_3.play(true);
        }

        private function showRadishEffect():void
        {
            if (radishE)
            {
                radishE = false;
                mRadishC.x = horseBMC.x;
                mRadishC.y = (horseBMC.y - horseC.height);
                mRadishC.visible = true;
                setTimeout(hideRadishEffect, 1000);
            }
            else
            {
                moveNext();
            };
        }

        public function set txt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._115312txt;
            if (_local_2 !== _arg_1)
            {
                this._115312txt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt", _local_2, _arg_1));
            };
        }

        private function back(_arg_1:Event):void
        {
            if (moving)
            {
                return;
            };
            if (actions.length > 0)
            {
                actions.length--;
                refreshActionsText();
            };
        }

        [Bindable(event="propertyChange")]
        public function get currentStep2():Label
        {
            return (this._1457826029currentStep2);
        }

        private function sortByScore(_arg_1:Object, _arg_2:Object):Number
        {
            if (_arg_1.rank == _arg_2.rank)
            {
                return (0);
            };
            if (_arg_1.rank > _arg_2.rank)
            {
                return (1);
            };
            return (-1);
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        private function _HorseRace_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HorseRace_BasicTitleCanvas1.text = _arg_1;
            }, "_HorseRace_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                currentStep2.filters = _arg_1;
            }, "currentStep2.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                todayScore.filters = _arg_1;
            }, "todayScore.filters");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HorseRace_BasicGlowButton1.label = _arg_1;
            }, "_HorseRace_BasicGlowButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                _HorseRace_ItemSlot1.slotType = _arg_1;
            }, "_HorseRace_ItemSlot1.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                _HorseRace_ItemSlot2.slotType = _arg_1;
            }, "_HorseRace_ItemSlot2.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[65];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HorseRace_Label3.text = _arg_1;
            }, "_HorseRace_Label3.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _HorseRace_Label3.filters = _arg_1;
            }, "_HorseRace_Label3.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                currentStep.filters = _arg_1;
            }, "currentStep.filters");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HorseRace_Label5.text = _arg_1;
            }, "_HorseRace_Label5.text");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _HorseRace_Label5.filters = _arg_1;
            }, "_HorseRace_Label5.filters");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HorseRace_Label6.text = _arg_1;
            }, "_HorseRace_Label6.text");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _HorseRace_Label6.filters = _arg_1;
            }, "_HorseRace_Label6.filters");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000724));
            }, function (_arg_1:Object):void
            {
                _HorseRace_Image3.source = _arg_1;
            }, "_HorseRace_Image3.source");
            result[13] = binding;
            return (result);
        }

        private function onCrash(_arg_1:Boolean):void
        {
            if (!_arg_1)
            {
                return;
            };
            moving = true;
            var _local_2:EnterFrameMove = new EnterFrameMove();
            _local_2.target = mapBMC;
            _local_2.stepLength = 10;
            _local_2.yBy = 0;
            _local_2.xBy = (-50 * 10);
            _local_2.addEventListener(EnterFrameMove.EFFECT_END, crashEnd);
            _local_2.play(true);
        }

        private function init():void
        {
            addEventListener(EVENT_CLOSE, closeHandler);
            txt.htmlText = Language.SUMMER_GAME_PANEL[39];
        }

        [Bindable(event="propertyChange")]
        public function get action1Img():Image
        {
            return (this._1850792200action1Img);
        }

        private function showStoneEffect():void
        {
            if (stoneE)
            {
                stoneE = false;
                mStoneC.x = horseBMC.x;
                mStoneC.y = (horseBMC.y - horseC.height);
                mStoneC.visible = true;
                setTimeout(hideStoneEffect, 1000);
            }
            else
            {
                if (pitE)
                {
                    pitE = false;
                    mPitC.x = horseBMC.x;
                    mPitC.y = (horseBMC.y - horseC.height);
                    mPitC.visible = true;
                    setTimeout(hideStoneEffect, 1000);
                }
                else
                {
                    moveNext();
                };
            };
        }

        private function _HorseRace_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SUMMER_GAME_PANEL[38];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.SUMMER_GAME_PANEL[16];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.SUMMER_GAME_PANEL[65];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.SUMMER_GAME_PANEL[43];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.SUMMER_GAME_PANEL[44];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = ResManager.getIconUrl(4130220000724);
        }

        public function onGo(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                moving = false;
                return;
            };
            if (!_arg_1["flag"])
            {
                moving = false;
                this.visible = false;
                return;
            };
            steps = _arg_1["steps"];
            wData["state"] = _arg_1["state"];
            wData["score"] = _arg_1["score"];
            wData["eats"] = _arg_1["eats"];
            moveNext();
        }

        public function onGetData(_arg_1:Object):void
        {
            var _local_2:String;
            if (!_arg_1)
            {
                return;
            };
            if (!_arg_1["data"])
            {
                visible = false;
                return;
            };
            clean();
            if (!_arg_1["flag"])
            {
                _local_2 = Language.SUMMER_GAME_PANEL[56];
                Alert.show(_local_2, "", Alert.YES, null);
            };
            wData = _arg_1["data"];
            if (int(int(wData["index"])) > 102)
            {
                wData["index"] = 102;
            };
            mapBMC.x = (-50 * int(wData["index"]));
            horseBMC.y = (13 + (int(wData["line"]) * 50));
            popBMC.y = (horseBMC.y - 10);
            if (horseC)
            {
                horseC.gotoAndPlay(horseC.currentFrame);
            };
            currentStep.htmlText = (((Language.SUMMER_GAME_PANEL[41] + "<font color='#00ffff'>") + wData["step"]) + "</font>");
            currentStep2.text = (Language.SUMMER_GAME_PANEL[41] + wData["step"]);
            showTodayScore();
            refreshLand(wData["data"]);
            popC.speed.text = ((wData["speed"]) || (1));
            refreshMap();
            if (int(wData["state"]) == 2)
            {
                result.visible = true;
            };
        }

        public function ___HorseRace_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        private function set rankTxt(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._978091684rankTxt;
            if (_local_2 !== _arg_1)
            {
                this._978091684rankTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankTxt", _local_2, _arg_1));
            };
        }

        private function refreshLand(_arg_1:Array):void
        {
            if (!_arg_1)
            {
                return;
            };
            clean();
        }

        [Bindable(event="propertyChange")]
        public function get action2Img():Image
        {
            return (this._1850821991action2Img);
        }

        public function set action1(_arg_1:Label):void
        {
            var _local_2:Object = this._1161803589action1;
            if (_local_2 !== _arg_1)
            {
                this._1161803589action1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "action1", _local_2, _arg_1));
            };
        }

        public function set action2(_arg_1:Label):void
        {
            var _local_2:Object = this._1161803588action2;
            if (_local_2 !== _arg_1)
            {
                this._1161803588action2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "action2", _local_2, _arg_1));
            };
        }

        private function lineChangeEnd(_arg_1:Event):void
        {
            horseBMC.y = (13 + (int(wData["line"]) * 50));
            popBMC.y = (horseBMC.y - 10);
            showStoneEffect();
        }

        override public function initialize():void
        {
            var target:HorseRace;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _HorseRace_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_HorseRaceWatcherSetupUtil");
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

        private function hideRadishEffect():void
        {
            mRadishC.visible = false;
            fiveJump();
        }

        public function set container1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._145245136container1;
            if (_local_2 !== _arg_1)
            {
                this._145245136container1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container1", _local_2, _arg_1));
            };
        }

        public function set container2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._145245137container2;
            if (_local_2 !== _arg_1)
            {
                this._145245137container2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container2", _local_2, _arg_1));
            };
        }

        public function onGetAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (!_arg_1["flag"])
            {
                this.visible = false;
                return;
            };
            if (wData)
            {
                wData.state = 2;
            };
        }

        private function refreshRank():void
        {
            rankData.sort(sortByScore);
        }

        public function set todayScore(_arg_1:Label):void
        {
            var _local_2:Object = this._1835012049todayScore;
            if (_local_2 !== _arg_1)
            {
                this._1835012049todayScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "todayScore", _local_2, _arg_1));
            };
        }

        private function crash():void
        {
            if (moving)
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("horseCrash", new Responder(onCrash));
                };
            };
            Alert.show(Language.ANNIVERSARY_LANG[20].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        private function hideStoneEffect():void
        {
            mStoneC.visible = false;
            mPitC.visible = false;
            moveNext();
        }

        private function crashEnd(_arg_1:Event):void
        {
            moving = false;
            _core.remote.call("summerGameHorseRace", null);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            rankTxt.removeAll();
            var _local_3:int;
            while (_local_3 < 10)
            {
                _local_4 = rankData[(_local_3 + _arg_1)];
                if (_local_4)
                {
                    rankTxt.addItem(_local_4);
                };
                _local_3++;
            };
        }

        public function set currentStep(_arg_1:Label):void
        {
            var _local_2:Object = this._601215973currentStep;
            if (_local_2 !== _arg_1)
            {
                this._601215973currentStep = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentStep", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get container2():Canvas
        {
            return (this._145245137container2);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            result.visible = false;
            getHorseRaceRes();
        }

        [Bindable(event="propertyChange")]
        public function get todayScore():Label
        {
            return (this._1835012049todayScore);
        }

        [Bindable(event="propertyChange")]
        public function get container1():Canvas
        {
            return (this._145245136container1);
        }

        [Bindable(event="propertyChange")]
        public function get currentStep():Label
        {
            return (this._601215973currentStep);
        }

        private function getHorseRaceRes():void
        {
            if (load_state != 0)
            {
                _core.remote.call("summerGameHorseRace", null);
                return;
            };
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2080130000469)));
                load_state = 1;
            };
        }

        public function set currentStep2(_arg_1:Label):void
        {
            var _local_2:Object = this._1457826029currentStep2;
            if (_local_2 !== _arg_1)
            {
                this._1457826029currentStep2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentStep2", _local_2, _arg_1));
            };
        }

        private function refreshActionsText():void
        {
            action1.text = "";
            action2.text = "";
            var _local_1:* = "";
            var _local_2:* = "";
            if (actions.length > 1)
            {
                action2.text = Language.SUMMER_GAME_PANEL[(48 + actions[1])];
                _local_2 = ResManager.getIconUrl(actionImg[actions[1]]);
            };
            if (actions.length > 0)
            {
                action1.text = Language.SUMMER_GAME_PANEL[(48 + actions[0])];
                _local_1 = ResManager.getIconUrl(actionImg[actions[0]]);
            };
            if (action2Img.source != _local_2)
            {
                action2Img.source = _local_2;
            };
            if (action1Img.source != _local_1)
            {
                action1Img.source = _local_1;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

