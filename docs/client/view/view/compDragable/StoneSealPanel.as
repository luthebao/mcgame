// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.StoneSealPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import flash.events.EventDispatcher;
    import com.qeedoo.ui.view.comp.ItemSlotJewel;
    import mx.containers.Canvas;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.ItemSlotStoneSeal;
    import mx.controls.Label;
    import flash.display.MovieClip;
    import mx.controls.Text;
    import mx.core.UIComponent;
    import flash.display.Loader;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import flash.events.IEventDispatcher;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.event.GameDataEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.FlexEvent;
    import flash.net.Responder;
    import mx.managers.PopUpManager;
    import com.qeedoo.ui.resource.ResManager;
    import flash.net.URLRequest;
    import flash.utils.getDefinitionByName;
    import mx.events.CloseEvent;
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

    public class StoneSealPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _2074309061isWatch:Boolean = false;
        public static const EQUIP_ID_MIN:int = 1;
        public static const EQUIP_ID_MAX:int = 12;
        public static const STONE_SEAL_CONF_EXTRA_PROPERTY:Object = {
            "1":{
                "1":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "2":{
                    "n":13,
                    "f":0,
                    "v":5.40001
                },
                "3":{
                    "n":31,
                    "f":0,
                    "v":5.40001
                },
                "4":{
                    "n":12,
                    "f":0,
                    "v":2.88001
                },
                "5":{
                    "n":59,
                    "f":0,
                    "v":4.32001
                },
                "6":{
                    "n":4,
                    "f":0,
                    "v":3960.01
                },
                "7":{
                    "n":53,
                    "f":0,
                    "v":10.8
                },
                "8":{
                    "n":52,
                    "f":0,
                    "v":10.8
                },
                "9":{
                    "n":56,
                    "f":0,
                    "v":10.8
                },
                "10":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "11":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "12":{
                    "n":55,
                    "f":0,
                    "v":10.8
                },
                "13":{
                    "n":57,
                    "f":0,
                    "v":10.8
                },
                "14":{
                    "n":55,
                    "f":0,
                    "v":10.8
                }
            },
            "2":{
                "2":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "3":{
                    "n":10,
                    "f":0,
                    "v":4.32001
                },
                "4":{
                    "n":14,
                    "f":0,
                    "v":1.8
                },
                "5":{
                    "n":62,
                    "f":0,
                    "v":5.76001
                },
                "6":{
                    "n":11,
                    "f":0,
                    "v":1440
                },
                "7":{
                    "n":53,
                    "f":0,
                    "v":10.8
                },
                "8":{
                    "n":52,
                    "f":0,
                    "v":10.8
                },
                "9":{
                    "n":56,
                    "f":0,
                    "v":10.8
                },
                "10":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "11":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "12":{
                    "n":55,
                    "f":0,
                    "v":10.8
                },
                "13":{
                    "n":57,
                    "f":0,
                    "v":10.8
                },
                "14":{
                    "n":55,
                    "f":0,
                    "v":10.8
                }
            },
            "3":{
                "3":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "4":{
                    "n":61,
                    "f":0,
                    "v":3.60001
                },
                "5":{
                    "n":60,
                    "f":1,
                    "v":4.32001
                },
                "6":{
                    "n":1,
                    "f":0,
                    "v":18000
                },
                "7":{
                    "n":53,
                    "f":0,
                    "v":10.8
                },
                "8":{
                    "n":52,
                    "f":0,
                    "v":10.8
                },
                "9":{
                    "n":56,
                    "f":0,
                    "v":10.8
                },
                "10":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "11":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "12":{
                    "n":55,
                    "f":0,
                    "v":10.8
                },
                "13":{
                    "n":57,
                    "f":0,
                    "v":10.8
                },
                "14":{
                    "n":55,
                    "f":0,
                    "v":10.8
                }
            },
            "4":{
                "4":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "5":{
                    "n":63,
                    "f":0,
                    "v":5.76001
                },
                "6":{
                    "n":5,
                    "f":0,
                    "v":1440
                },
                "7":{
                    "n":53,
                    "f":0,
                    "v":10.8
                },
                "8":{
                    "n":52,
                    "f":0,
                    "v":10.8
                },
                "9":{
                    "n":56,
                    "f":0,
                    "v":10.8
                },
                "10":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "11":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "12":{
                    "n":55,
                    "f":0,
                    "v":10.8
                },
                "13":{
                    "n":57,
                    "f":0,
                    "v":10.8
                },
                "14":{
                    "n":55,
                    "f":0,
                    "v":10.8
                }
            },
            "5":{
                "5":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "6":{
                    "n":2,
                    "f":0,
                    "v":1353.6
                },
                "7":{
                    "n":53,
                    "f":0,
                    "v":10.8
                },
                "8":{
                    "n":52,
                    "f":0,
                    "v":10.8
                },
                "9":{
                    "n":56,
                    "f":0,
                    "v":10.8
                },
                "10":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "11":{
                    "n":54,
                    "f":0,
                    "v":10.8
                },
                "12":{
                    "n":55,
                    "f":0,
                    "v":10.8
                },
                "13":{
                    "n":57,
                    "f":0,
                    "v":10.8
                },
                "14":{
                    "n":55,
                    "f":0,
                    "v":10.8
                }
            },
            "6":{
                "6":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "7":{
                    "n":32,
                    "f":0,
                    "v":5.40001
                },
                "8":{
                    "n":32,
                    "f":0,
                    "v":5.40001
                },
                "9":{
                    "n":32,
                    "f":0,
                    "v":5.40001
                },
                "10":{
                    "n":32,
                    "f":0,
                    "v":5.40001
                },
                "11":{
                    "n":32,
                    "f":0,
                    "v":5.40001
                },
                "12":{
                    "n":32,
                    "f":0,
                    "v":5.40001
                },
                "13":{
                    "n":32,
                    "f":0,
                    "v":5.40001
                },
                "14":{
                    "n":32,
                    "f":0,
                    "v":5.40001
                }
            },
            "7":{
                "7":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "8":{
                    "n":4,
                    "f":0,
                    "v":3960.01
                },
                "9":{
                    "n":6,
                    "f":0,
                    "v":20160
                },
                "10":{
                    "n":5,
                    "f":0,
                    "v":1440
                },
                "11":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                },
                "12":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                },
                "13":{
                    "n":7,
                    "f":0,
                    "v":18720
                },
                "14":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                }
            },
            "8":{
                "8":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "9":{
                    "n":7,
                    "f":0,
                    "v":18720
                },
                "10":{
                    "n":7,
                    "f":0,
                    "v":18720
                },
                "11":{
                    "n":5,
                    "f":0,
                    "v":1440
                },
                "12":{
                    "n":4,
                    "f":0,
                    "v":3960.01
                },
                "13":{
                    "n":6,
                    "f":0,
                    "v":20160
                },
                "14":{
                    "n":6,
                    "f":0,
                    "v":1440
                }
            },
            "9":{
                "9":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "10":{
                    "n":6,
                    "f":0,
                    "v":20160
                },
                "11":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                },
                "12":{
                    "n":5,
                    "f":0,
                    "v":1440
                },
                "13":{
                    "n":7,
                    "f":0,
                    "v":18720
                },
                "14":{
                    "n":4,
                    "f":0,
                    "v":3960.01
                }
            },
            "10":{
                "10":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "11":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                },
                "12":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                },
                "13":{
                    "n":4,
                    "f":0,
                    "v":3960.01
                },
                "14":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                }
            },
            "11":{
                "11":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "12":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                },
                "13":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                },
                "14":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                }
            },
            "12":{
                "12":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "13":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                },
                "14":{
                    "n":34,
                    "f":0,
                    "v":4.32001
                }
            },
            "13":{
                "13":{
                    "n":0,
                    "f":0,
                    "v":100000
                },
                "14":{
                    "n":5,
                    "f":0,
                    "v":1440
                }
            },
            "14":{"14":{
                    "n":0,
                    "f":0,
                    "v":100000
                }}
        };
        public static const STONE_SEAL_CONF_NEGATIVE:Object = {
            "1":{"1":0},
            "2":{"2":0},
            "3":{"3":0},
            "4":{"4":0},
            "5":{"5":0},
            "6":{"6":0},
            "7":{"7":0},
            "8":{"8":0},
            "9":{"9":0},
            "10":{"10":0},
            "11":{"11":0},
            "12":{"12":0},
            "13":{"13":0},
            "14":{"14":0}
        };
        public static const STONE_SEAL_SUCCINCT_CONF:Array = [1, 1, 3.332, 6.0148, 15.81847, 23.26693];
        private static var _watcherSetupUtil:IWatcherSetupUtil;
        private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();

        private var _1439005507equipStone2:ItemSlotJewel;
        private var _1913453667canvas51111:Canvas;
        private var _738071899iconOne2:Image;
        private var _769132addStone0:ItemSlotStoneSeal;
        private var _2108267724sealStone4:ItemSlotStoneSeal;
        private var _1655941410selectTxt2:Label;
        private var _738071897iconOne4:Image;
        private var _738071895iconOne6:Image;
        private var _738071893iconOne8:Image;
        private var equipSlot:Object = null;
        private var sealMC:MovieClip;
        private var _769134addStone2:ItemSlotStoneSeal;
        private var _2108267727sealStone7:ItemSlotStoneSeal;
        private var _1633645860allAddPropTxt1:Text;
        private var _1161068495allAddPropLag:Label;
        private var _1439005500equipStone9:ItemSlotJewel;
        private var _737913978iconTwo9:Image;
        private var _2108267722sealStone2:ItemSlotStoneSeal;
        private var _737913981iconTwo6:Image;
        private var _769136addStone4:ItemSlotStoneSeal;
        private var _1439005503equipStone6:ItemSlotJewel;
        private var _1804642237btnsCanvas2:UIComponent;
        private var removeAllBtn:MovieClip;
        private var _769140addStone8:ItemSlotStoneSeal;
        private var _1633645861allAddPropTxt2:Text;
        private var watchSlots:Object = null;
        private var _737913987iconTwo0:Image;
        private var _1439005506equipStone3:ItemSlotJewel;
        private var _738071901iconOne0:Image;
        private var _737913985iconTwo2:Image;
        private var _1625307030selectedPropCanvas:Canvas;
        private var _737913983iconTwo4:Image;
        private var _1439005509equipStone0:ItemSlotJewel;
        private var _1655941408selectTxt4:Label;
        private var _769138addStone6:ItemSlotStoneSeal;
        private var _2108267725sealStone5:ItemSlotStoneSeal;
        private var _1655941411selectTxt1:Label;
        private var _1710794012_btnEnabled:Boolean = false;
        private var load:Loader;
        private var _588885630equipSid:int = -1;
        private var res_load_state:int = 0;
        private var _738071898iconOne3:Image;
        private var _3449699prop:Canvas;
        private var _738071892iconOne9:Image;
        private var watchData:Object;
        private var _helpAlert:Alert;
        private var _738071896iconOne5:Image;
        private var _2108267728sealStone8:ItemSlotStoneSeal;
        private var _1075298147equipItem:ItemSlot;
        private var sealBtn:MovieClip;
        private var _738071894iconOne7:Image;
        private var selectIndex:int = 1;
        private var _769133addStone1:ItemSlotStoneSeal;
        private var _1439005502equipStone7:ItemSlotJewel;
        private var _2108267720sealStone0:ItemSlotStoneSeal;
        private var _2108267723sealStone3:ItemSlotStoneSeal;
        private var _1439005505equipStone4:ItemSlotJewel;
        private var _1439005508equipStone1:ItemSlotJewel;
        private var watchCid:Number = 0;
        private var _769135addStone3:ItemSlotStoneSeal;
        private var _737913979iconTwo8:Image;
        private var mcClass:Class;
        private var _1655941409selectTxt3:Label;
        private var _145245136container1:UIComponent;
        private var _737913980iconTwo7:Image;
        private var _2108267726sealStone6:ItemSlotStoneSeal;
        private var _737913986iconTwo1:Image;
        private var _737913984iconTwo3:Image;
        private var _1462326131canvas6111:Canvas;
        private var inited:Boolean = false;
        private var _738071900iconOne1:Image;
        private var _1859329585btnsCanvas:UIComponent;
        private var _769137addStone5:ItemSlotStoneSeal;
        private var equipNameMC:MovieClip;
        private var _1762562555allAddPropCanvas:Canvas;
        private var _769141addStone9:ItemSlotStoneSeal;
        private var _737913982iconTwo5:Image;
        private var _2108267721sealStone1:ItemSlotStoneSeal;
        private var _1439005501equipStone8:ItemSlotJewel;
        private var _2108267729sealStone9:ItemSlotStoneSeal;
        public var _StoneSealPanel_LinkButton1:LinkButton;
        private var charFlag:Object = null;
        private var watchEquips:Object = null;
        private var _1439005504equipStone5:ItemSlotJewel;
        private var _769139addStone7:ItemSlotStoneSeal;
        private var _110371416title:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":782,
                    "height":530,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"title"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvas51111",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":39,
                                "height":469,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":UIComponent,
                                    "id":"container1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"canvas6111",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":752,
                                            "height":469,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":UIComponent,
                                                "id":"btnsCanvas",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.top = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":190,
                                                        "height":220
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"equipItem",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "184";
                                                    this.top = "35";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "acceptable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "252";
                                                    this.top = "35";
                                                    this.horizontalGap = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox1_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone0"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox2_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone1"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox3_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone2"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox4_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone3"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox5_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone4"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox6_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone5"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox7_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone6"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox8_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone7"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox9_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone8"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "events":{"mouseOver":"___StoneSealPanel_VBox10_mouseOver"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 6;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":48,
                                                                    "height":300,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotJewel,
                                                                        "id":"equipStone9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconOne9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"sealStone9"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"iconTwo9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "width":35,
                                                                                "height":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStoneSeal,
                                                                        "id":"addStone9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "acceptable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":UIComponent,
                                                "id":"btnsCanvas2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.top = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":190,
                                                        "height":220
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"prop",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "25";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"selectedPropCanvas",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":50,
                                                                    "width":275,
                                                                    "height":110,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"selectTxt1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "5";
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":280});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"selectTxt2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "40";
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":280});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"selectTxt3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "60";
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":280});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"selectTxt4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "80";
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":280});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"allAddPropCanvas",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":395,
                                                                    "width":375,
                                                                    "height":110,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"allAddPropLag",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "5";
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "bold";
                                                                            this.color = 0xFFF200;
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Text,
                                                                        "id":"allAddPropTxt1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "25";
                                                                            this.color = 0xFFFF;
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":165});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Text,
                                                                        "id":"allAddPropTxt2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "175";
                                                                            this.top = "25";
                                                                            this.color = 0xFFFF;
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":165});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_StoneSealPanel_LinkButton1",
                                                "events":{"click":"___StoneSealPanel_LinkButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textDecoration = "underline";
                                                    this.right = "35";
                                                    this.bottom = "150";
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":17});
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
        private var _core:Core = Core.getInstance();
        private var _dm:DataManager = DataManager.getInstance();
        private var btns:Array = [];
        private var sealIcons:Array = [];
        private var mcPositions:Array = [[0, 0], [56, 87], [70, 164], [26, 169], [53, 138], [68, 184], [27, 79], [113, 152], [58, 43], [101, 49], [61, 137], [134, 79], [60, 212]];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function StoneSealPanel()
        {
            mx_internal::_document = this;
            this.width = 782;
            this.height = 530;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
            this.addEventListener("creationComplete", ___StoneSealPanel_DragableCanvas1_creationComplete);
        }

        [Bindable(event="propertyChange")]
        public static function get isWatch():Boolean
        {
            return (StoneSealPanel._2074309061isWatch);
        }

        public static function set isWatch(_arg_1:Boolean):void
        {
            var _local_3:IEventDispatcher;
            var _local_2:Object = StoneSealPanel._2074309061isWatch;
            if (_local_2 !== _arg_1)
            {
                StoneSealPanel._2074309061isWatch = _arg_1;
                _local_3 = StoneSealPanel.staticEventDispatcher;
                if (_local_3 != null)
                {
                    _local_3.dispatchEvent(PropertyChangeEvent.createUpdateEvent(StoneSealPanel, "isWatch", _local_2, _arg_1));
                };
            };
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StoneSealPanel._watcherSetupUtil = _arg_1;
        }

        public static function get staticEventDispatcher():IEventDispatcher
        {
            return (_staticBindingEventDispatcher);
        }


        public function set sealStone7(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267727sealStone7;
            if (_local_2 !== _arg_1)
            {
                this._2108267727sealStone7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get allAddPropCanvas():Canvas
        {
            return (this._1762562555allAddPropCanvas);
        }

        public function set allAddPropCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1762562555allAddPropCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1762562555allAddPropCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allAddPropCanvas", _local_2, _arg_1));
            };
        }

        public function ___StoneSealPanel_VBox10_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 10;
            refreshSelectPropTxt();
        }

        private function onSwap(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag)))
            {
                charFlag = _arg_1["data"];
                setSealStone();
                refreshAddPropTxt();
            };
        }

        public function ___StoneSealPanel_VBox5_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 5;
            refreshSelectPropTxt();
        }

        private function setSealStone():void
        {
            var _local_1:Object = {};
            if ((((charFlag) && (charFlag[equipSid])) && (charFlag[equipSid]["data"])))
            {
                _local_1 = charFlag[equipSid]["data"];
            };
            var _local_2:int;
            while (_local_2 < 10)
            {
                if (this[("sealStone" + _local_2)])
                {
                    this[("sealStone" + _local_2)].enabled = true;
                    if (isNaN(_local_1[("s" + (_local_2 + 1))]))
                    {
                        this[("sealStone" + _local_2)].setOpen(false);
                    }
                    else
                    {
                        if (int(_local_1[("s" + (_local_2 + 1))]) > -1)
                        {
                            this[("sealStone" + _local_2)].setOpen(true, int(_local_1[("s" + (_local_2 + 1))]));
                        }
                        else
                        {
                            this[("sealStone" + _local_2)].setOpen(false);
                        };
                    };
                };
                _local_2++;
            };
            refreshSelectPropTxt();
        }

        private function _StoneSealPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STONE_SEAL_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                equipItem.slotType = _arg_1;
            }, "equipItem.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone0.movable = _arg_1;
            }, "sealStone0.movable");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone0.acceptable = _arg_1;
            }, "sealStone0.acceptable");
            result[3] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone1.movable = _arg_1;
            }, "sealStone1.movable");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone1.acceptable = _arg_1;
            }, "sealStone1.acceptable");
            result[5] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone2.movable = _arg_1;
            }, "sealStone2.movable");
            result[6] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone2.acceptable = _arg_1;
            }, "sealStone2.acceptable");
            result[7] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone3.movable = _arg_1;
            }, "sealStone3.movable");
            result[8] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone3.acceptable = _arg_1;
            }, "sealStone3.acceptable");
            result[9] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone4.movable = _arg_1;
            }, "sealStone4.movable");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone4.acceptable = _arg_1;
            }, "sealStone4.acceptable");
            result[11] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone5.movable = _arg_1;
            }, "sealStone5.movable");
            result[12] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone5.acceptable = _arg_1;
            }, "sealStone5.acceptable");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone6.movable = _arg_1;
            }, "sealStone6.movable");
            result[14] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone6.acceptable = _arg_1;
            }, "sealStone6.acceptable");
            result[15] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone7.movable = _arg_1;
            }, "sealStone7.movable");
            result[16] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone7.acceptable = _arg_1;
            }, "sealStone7.acceptable");
            result[17] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone8.movable = _arg_1;
            }, "sealStone8.movable");
            result[18] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone8.acceptable = _arg_1;
            }, "sealStone8.acceptable");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone9.movable = _arg_1;
            }, "sealStone9.movable");
            result[20] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(isWatch));
            }, function (_arg_1:Boolean):void
            {
                sealStone9.acceptable = _arg_1;
            }, "sealStone9.acceptable");
            result[21] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _StoneSealPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_StoneSealPanel_LinkButton1.overSkin");
            result[22] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _StoneSealPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_StoneSealPanel_LinkButton1.upSkin");
            result[23] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _StoneSealPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_StoneSealPanel_LinkButton1.downSkin");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STONE_SEAL_PANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StoneSealPanel_LinkButton1.label = _arg_1;
            }, "_StoneSealPanel_LinkButton1.label");
            result[25] = binding;
            return (result);
        }

        private function setEquipStone(_arg_1:GameDataEvent=null):void
        {
            var _local_5:int;
            if (!equipSlot)
            {
                return;
            };
            var _local_2:Object = getEquipInfo();
            if (!_local_2)
            {
                if (!isWatch)
                {
                    _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + equipSlot.type) + "_") + equipSlot.itemId), setEquipStone);
                };
                return;
            };
            var _local_3:int = int(_local_2.holeNum);
            var _local_4:int;
            while (_local_4 < 10)
            {
                _local_5 = int(_local_2[("t" + (_local_4 + 1))]);
                if (_local_5 > 0)
                {
                    this[("equipStone" + _local_4)].selected = false;
                    this[("equipStone" + _local_4)].type = GamePredef.TBL_ITEM_TEMPLATE;
                    this[("equipStone" + _local_4)].giid = _local_5;
                }
                else
                {
                    this[("equipStone" + _local_4)].selected = false;
                    this[("equipStone" + _local_4)].clean();
                };
                this[("equipStone" + _local_4)].enabled = ((_local_4 + 1) <= _local_3);
                _local_4++;
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_9:String;
            var _local_10:Class;
            var _local_11:UIComponent;
            var _local_12:MovieClip;
            var _local_13:Class;
            var _local_14:MovieClip;
            var _local_2:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("map") as Class);
            var _local_3:MovieClip = new (_local_2)();
            _local_3.gotoAndStop(1);
            container1.addChild(_local_3);
            var _local_4:int = 1;
            _local_4 = 1;
            while (_local_4 <= 12)
            {
                _local_9 = ("btn" + _local_4);
                if (load.contentLoaderInfo.applicationDomain.hasDefinition(_local_9))
                {
                    _local_10 = (load.contentLoaderInfo.applicationDomain.getDefinition(_local_9) as Class);
                    _local_11 = new UIComponent();
                    _local_12 = new (_local_10)();
                    _local_12.gotoAndStop(1);
                    _local_11.addChild(_local_12);
                    btnsCanvas.addChild(_local_11);
                    _local_11.x = mcPositions[_local_4][0];
                    _local_11.y = mcPositions[_local_4][1];
                    _local_11.toolTip = Language.GAMEPREDEF_S[(299 + _local_4)];
                    _local_12.addEventListener(MouseEvent.CLICK, btnClick);
                    btns[_local_4] = _local_12;
                };
                _local_4++;
            };
            var _local_5:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("equipNameMC") as Class);
            equipNameMC = new (_local_5)();
            equipNameMC.x = 168;
            equipNameMC.y = 136;
            equipNameMC.gotoAndStop(1);
            equipNameMC.visible = false;
            btnsCanvas.addChild(equipNameMC);
            var _local_6:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("sealMC") as Class);
            sealMC = new (_local_6)();
            sealMC.x = 160;
            sealMC.y = 208;
            sealMC.gotoAndStop(1);
            btnsCanvas.addChildAt(sealMC, 1);
            var _local_7:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("removeAllBtn") as Class);
            removeAllBtn = new (_local_7)();
            removeAllBtn.x = 447;
            removeAllBtn.y = 279;
            removeAllBtn.addEventListener(MouseEvent.CLICK, removeAllStone);
            btnsCanvas2.addChild(removeAllBtn);
            var _local_8:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("sealBtn") as Class);
            sealBtn = new (_local_8)();
            sealBtn.gotoAndStop(1);
            sealBtn.x = 327;
            sealBtn.y = 279;
            sealBtn.addEventListener(MouseEvent.CLICK, toSuccinct);
            btnsCanvas2.addChild(sealBtn);
            _local_4 = 0;
            while (_local_4 < 10)
            {
                _local_13 = (load.contentLoaderInfo.applicationDomain.getDefinition("sealIcons") as Class);
                _local_14 = new (_local_13)();
                _local_14.gotoAndStop(_local_14.totalFrames);
                _local_11 = new UIComponent();
                _local_11.addChild(_local_14);
                this[("addStone" + _local_4)].addChild(_local_11);
                sealIcons[_local_4] = _local_14;
                _local_4++;
            };
            res_load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
        }

        private function getHoleNumber():int
        {
            if ((((!(charFlag)) || (!(charFlag[equipSid]))) || (!(charFlag[equipSid]["data"]))))
            {
                return (0);
            };
            var _local_1:Object = charFlag[equipSid]["data"];
            var _local_2:int;
            var _local_3:int = 1;
            while (_local_3 <= 10)
            {
                if (((!(isNaN(_local_1[("s" + _local_3)]))) && (int(_local_1[("s" + _local_3)]) > -1)))
                {
                    _local_2++;
                };
                _local_3++;
            };
            return (_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get btnsCanvas2():UIComponent
        {
            return (this._1804642237btnsCanvas2);
        }

        private function getEquipInfo():Object
        {
            if (isWatch)
            {
                return (watchEquips[equipSlot.itemId]);
            };
            return (_core.data.getGameData(equipSlot.type, equipSlot.itemId));
        }

        public function set allAddPropTxt2(_arg_1:Text):void
        {
            var _local_2:Object = this._1633645861allAddPropTxt2;
            if (_local_2 !== _arg_1)
            {
                this._1633645861allAddPropTxt2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allAddPropTxt2", _local_2, _arg_1));
            };
        }

        private function refreshSelectPropTxt(_arg_1:GameDataEvent=null):void
        {
            var _local_9:int;
            var _local_10:int;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Number;
            var _local_2:int = 1;
            var _local_3:Object = {};
            if ((((charFlag) && (charFlag[equipSid])) && (charFlag[equipSid]["data"])))
            {
                _local_3 = charFlag[equipSid]["data"];
                _local_2 = int(charFlag[equipSid]["lvl"]);
            };
            if (sealMC)
            {
                sealMC.gotoAndStop(_local_2);
            };
            if (!equipSlot)
            {
                return;
            };
            selectTxt1.htmlText = Language.STONE_SEAL_PANEL_U[25].toString().replace("{num}", selectIndex);
            selectTxt2.htmlText = Language.STONE_SEAL_PANEL_U[1];
            selectTxt3.htmlText = Language.STONE_SEAL_PANEL_U[2];
            selectTxt4.htmlText = Language.STONE_SEAL_PANEL_U[26];
            var _local_4:Object = getEquipInfo();
            if (((!(_local_4)) && (!(isWatch))))
            {
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + equipSlot.type) + "_") + equipSlot.itemId), refreshSelectPropTxt);
                return;
            };
            if (!_local_4)
            {
                _local_4 = {};
            };
            var _local_5:int = int(_local_4[("t" + selectIndex)]);
            var _local_6:Object = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_5];
            if (_local_6)
            {
                if (int(_local_6.propType) == 0)
                {
                    selectTxt2.htmlText = (selectTxt2.htmlText + (("<font color='#00FFFF'>" + Language.STONE_SEAL_PANEL_U[39]) + "</font>"));
                }
                else
                {
                    selectTxt2.htmlText = (selectTxt2.htmlText + (((("<font color='#00FFFF'>" + GamePredef.JEWEL_PROP_NAME[_local_6.propType]) + " +") + _local_6.proplNum) + "</font>"));
                };
            }
            else
            {
                selectTxt2.htmlText = (selectTxt2.htmlText + (("<font color='#00FFFF'>" + Language.STONE_SEAL_PANEL_U[22]) + "</font>"));
            };
            var _local_7:int = int(_local_3[("s" + selectIndex)]);
            var _local_8:Object = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_7];
            if (((_local_3[("s" + selectIndex)] == "-1") || (_local_7 == -1)))
            {
                selectTxt3.htmlText = (selectTxt3.htmlText + (("<font color='#00FFFF'>" + Language.STONE_SEAL_PANEL_U[23]) + "</font>"));
            }
            else
            {
                if (_local_8)
                {
                    if (int(_local_8.propType) == 0)
                    {
                        selectTxt3.htmlText = (selectTxt3.htmlText + (("<font color='#00FFFF'>" + Language.STONE_SEAL_PANEL_U[39]) + "</font>"));
                    }
                    else
                    {
                        if (((_local_6) && (_local_6.propType == _local_8.propType)))
                        {
                            _local_9 = Math.min(_local_6.propType, _local_8.propType);
                            _local_10 = Math.max(_local_6.propType, _local_8.propType);
                            _local_11 = getWeakenNum(_local_9, _local_10);
                            _local_12 = (_local_11 * _local_8.proplNum);
                            _local_12 = (Math.floor((_local_12 * 100)) / 100);
                            selectTxt3.htmlText = (selectTxt3.htmlText + (((("<font color='#00FFFF'>" + GamePredef.JEWEL_PROP_NAME[_local_8.propType]) + " +") + _local_12) + "</font>"));
                            selectTxt3.htmlText = (selectTxt3.htmlText + Language.STONE_SEAL_PANEL_U[28]);
                        }
                        else
                        {
                            selectTxt3.htmlText = (selectTxt3.htmlText + (((("<font color='#00FFFF'>" + GamePredef.JEWEL_PROP_NAME[_local_8.propType]) + " +") + _local_8.proplNum) + "</font>"));
                        };
                    };
                }
                else
                {
                    selectTxt3.htmlText = (selectTxt3.htmlText + (("<font color='#00FFFF'>" + Language.STONE_SEAL_PANEL_U[24]) + "</font>"));
                };
            };
            if (((((_local_6) && (_local_8)) && (int(_local_6.propType) > 0)) && (int(_local_8.propType) > 0)))
            {
                _local_13 = _local_6.propType;
                _local_14 = _local_8.propType;
                _local_15 = Math.min(_local_13, _local_14);
                _local_16 = Math.max(_local_13, _local_14);
                _local_17 = STONE_SEAL_CONF_EXTRA_PROPERTY[_local_15][_local_16]["n"];
                if (_local_17 == 0)
                {
                    selectTxt4.htmlText = (selectTxt4.htmlText + (("<font color='#00FFFF'>" + Language.STONE_SEAL_PANEL_U[27]) + "</font>"));
                }
                else
                {
                    _local_18 = _local_6.proplNum;
                    _local_19 = _local_8.proplNum;
                    _local_20 = STONE_SEAL_CONF_EXTRA_PROPERTY[_local_15][_local_16]["v"];
                    _local_20 = (((_local_20 / 10000) * getAddPropNum(_local_6.color, _local_8.color)) * STONE_SEAL_SUCCINCT_CONF[_local_2]);
                    _local_20 = (Math.floor((_local_20 * 100)) / 100);
                    selectTxt4.htmlText = (selectTxt4.htmlText + (((("<font color='#00FFFF'>" + Language.BUFF_PROP_NAME_ARR[_local_17]) + " +") + _local_20) + "</font>"));
                };
            }
            else
            {
                selectTxt4.htmlText = (selectTxt4.htmlText + (("<font color='#00FFFF'>" + Language.STONE_SEAL_PANEL_U[27]) + "</font>"));
            };
        }

        [Bindable(event="propertyChange")]
        public function get title():BasicTitleCanvas
        {
            return (this._110371416title);
        }

        public function toBore(_arg_1:int):void
        {
            if (((_arg_1 < 1) || (_arg_1 > 10)))
            {
                return;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_STONE_SEAL_BORE);
            if (_local_2)
            {
                _local_2.showPanel(this, 1, equipSid, getHoleNumber(), _arg_1, -1);
            };
        }

        public function ___StoneSealPanel_VBox8_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 8;
            refreshSelectPropTxt();
        }

        public function set allAddPropTxt1(_arg_1:Text):void
        {
            var _local_2:Object = this._1633645860allAddPropTxt1;
            if (_local_2 !== _arg_1)
            {
                this._1633645860allAddPropTxt1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allAddPropTxt1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addStone1():ItemSlotStoneSeal
        {
            return (this._769133addStone1);
        }

        [Bindable(event="propertyChange")]
        public function get addStone3():ItemSlotStoneSeal
        {
            return (this._769135addStone3);
        }

        [Bindable(event="propertyChange")]
        public function get addStone5():ItemSlotStoneSeal
        {
            return (this._769137addStone5);
        }

        [Bindable(event="propertyChange")]
        public function get addStone6():ItemSlotStoneSeal
        {
            return (this._769138addStone6);
        }

        [Bindable(event="propertyChange")]
        public function get addStone0():ItemSlotStoneSeal
        {
            return (this._769132addStone0);
        }

        [Bindable(event="propertyChange")]
        public function get addStone2():ItemSlotStoneSeal
        {
            return (this._769134addStone2);
        }

        [Bindable(event="propertyChange")]
        public function get addStone7():ItemSlotStoneSeal
        {
            return (this._769139addStone7);
        }

        [Bindable(event="propertyChange")]
        public function get addStone8():ItemSlotStoneSeal
        {
            return (this._769140addStone8);
        }

        [Bindable(event="propertyChange")]
        public function get addStone4():ItemSlotStoneSeal
        {
            return (this._769136addStone4);
        }

        [Bindable(event="propertyChange")]
        public function get addStone9():ItemSlotStoneSeal
        {
            return (this._769141addStone9);
        }

        [Bindable(event="propertyChange")]
        private function get equipSid():int
        {
            return (this._588885630equipSid);
        }

        public function set btnsCanvas2(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._1804642237btnsCanvas2;
            if (_local_2 !== _arg_1)
            {
                this._1804642237btnsCanvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnsCanvas2", _local_2, _arg_1));
            };
        }

        private function btnClick(_arg_1:MouseEvent):void
        {
            var _local_2:Object = _arg_1.currentTarget;
            var _local_3:int = btns.indexOf(_local_2);
            if (((_local_3 >= 1) && (_local_3 <= 12)))
            {
                equipSid = _local_3;
                equipClick();
            };
        }

        public function ___StoneSealPanel_VBox3_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 3;
            refreshSelectPropTxt();
        }

        public function onEquipChange():void
        {
            if (((visible) && (initialized)))
            {
                equipClick();
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconOne0():Image
        {
            return (this._738071901iconOne0);
        }

        [Bindable(event="propertyChange")]
        public function get iconOne4():Image
        {
            return (this._738071897iconOne4);
        }

        [Bindable(event="propertyChange")]
        public function get iconOne5():Image
        {
            return (this._738071896iconOne5);
        }

        [Bindable(event="propertyChange")]
        public function get iconOne6():Image
        {
            return (this._738071895iconOne6);
        }

        public function ___StoneSealPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get iconOne1():Image
        {
            return (this._738071900iconOne1);
        }

        public function onSuccinct(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag)))
            {
                charFlag = _arg_1["data"];
                setSealStone();
                refreshAddPropTxt();
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconOne7():Image
        {
            return (this._738071894iconOne7);
        }

        [Bindable(event="propertyChange")]
        public function get iconOne8():Image
        {
            return (this._738071893iconOne8);
        }

        [Bindable(event="propertyChange")]
        public function get iconOne9():Image
        {
            return (this._738071892iconOne9);
        }

        [Bindable(event="propertyChange")]
        public function get iconOne2():Image
        {
            return (this._738071899iconOne2);
        }

        [Bindable(event="propertyChange")]
        public function get equipStone0():ItemSlotJewel
        {
            return (this._1439005509equipStone0);
        }

        public function toSwap(_arg_1:int, _arg_2:int):void
        {
            if (isWatch)
            {
                return;
            };
            if (((_arg_1 < 1) || (_arg_1 > 10)))
            {
                return;
            };
            if (((equipSid >= EQUIP_ID_MIN) && (equipSid <= EQUIP_ID_MAX)))
            {
                _core.remote.call("stoneSealSwapStone", new Responder(onSwap), equipSid, _arg_1, _arg_2);
            };
        }

        [Bindable(event="propertyChange")]
        public function get equipStone3():ItemSlotJewel
        {
            return (this._1439005506equipStone3);
        }

        [Bindable(event="propertyChange")]
        public function get equipStone5():ItemSlotJewel
        {
            return (this._1439005504equipStone5);
        }

        [Bindable(event="propertyChange")]
        public function get equipStone6():ItemSlotJewel
        {
            return (this._1439005503equipStone6);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" stone seal load Error ");
        }

        [Bindable(event="propertyChange")]
        public function get equipStone2():ItemSlotJewel
        {
            return (this._1439005507equipStone2);
        }

        [Bindable(event="propertyChange")]
        public function get iconOne3():Image
        {
            return (this._738071898iconOne3);
        }

        [Bindable(event="propertyChange")]
        public function get equipStone7():ItemSlotJewel
        {
            return (this._1439005502equipStone7);
        }

        [Bindable(event="propertyChange")]
        public function get equipStone1():ItemSlotJewel
        {
            return (this._1439005508equipStone1);
        }

        [Bindable(event="propertyChange")]
        public function get sealStone4():ItemSlotStoneSeal
        {
            return (this._2108267724sealStone4);
        }

        public function set equipItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1075298147equipItem;
            if (_local_2 !== _arg_1)
            {
                this._1075298147equipItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipItem", _local_2, _arg_1));
            };
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.STONE_SEAL_PANEL_U[30].toString();
            _helpAlert = Alert.show(_local_1, Language.STONE_SEAL_PANEL_U[30].toString(), Alert.YES, null, null);
        }

        [Bindable(event="propertyChange")]
        public function get sealStone0():ItemSlotStoneSeal
        {
            return (this._2108267720sealStone0);
        }

        [Bindable(event="propertyChange")]
        public function get sealStone1():ItemSlotStoneSeal
        {
            return (this._2108267721sealStone1);
        }

        [Bindable(event="propertyChange")]
        public function get equipStone8():ItemSlotJewel
        {
            return (this._1439005501equipStone8);
        }

        [Bindable(event="propertyChange")]
        public function get equipStone9():ItemSlotJewel
        {
            return (this._1439005500equipStone9);
        }

        [Bindable(event="propertyChange")]
        public function get sealStone5():ItemSlotStoneSeal
        {
            return (this._2108267725sealStone5);
        }

        public function set prop(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3449699prop;
            if (_local_2 !== _arg_1)
            {
                this._3449699prop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sealStone7():ItemSlotStoneSeal
        {
            return (this._2108267727sealStone7);
        }

        [Bindable(event="propertyChange")]
        public function get sealStone2():ItemSlotStoneSeal
        {
            return (this._2108267722sealStone2);
        }

        private function refresh():void
        {
            equipClick();
        }

        public function set addStone2(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769134addStone2;
            if (_local_2 !== _arg_1)
            {
                this._769134addStone2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone2", _local_2, _arg_1));
            };
        }

        public function ___StoneSealPanel_VBox6_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 6;
            refreshSelectPropTxt();
        }

        public function set addStone4(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769136addStone4;
            if (_local_2 !== _arg_1)
            {
                this._769136addStone4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone4", _local_2, _arg_1));
            };
        }

        public function set addStone5(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769137addStone5;
            if (_local_2 !== _arg_1)
            {
                this._769137addStone5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sealStone3():ItemSlotStoneSeal
        {
            return (this._2108267723sealStone3);
        }

        public function set addStone6(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769138addStone6;
            if (_local_2 !== _arg_1)
            {
                this._769138addStone6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone6", _local_2, _arg_1));
            };
        }

        public function set addStone3(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769135addStone3;
            if (_local_2 !== _arg_1)
            {
                this._769135addStone3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone3", _local_2, _arg_1));
            };
        }

        public function set addStone0(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769132addStone0;
            if (_local_2 !== _arg_1)
            {
                this._769132addStone0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone0", _local_2, _arg_1));
            };
        }

        public function set addStone1(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769133addStone1;
            if (_local_2 !== _arg_1)
            {
                this._769133addStone1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone1", _local_2, _arg_1));
            };
        }

        public function set addStone9(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769141addStone9;
            if (_local_2 !== _arg_1)
            {
                this._769141addStone9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _btnEnabled():Boolean
        {
            return (this._1710794012_btnEnabled);
        }

        [Bindable(event="propertyChange")]
        public function get equipStone4():ItemSlotJewel
        {
            return (this._1439005505equipStone4);
        }

        public function set addStone7(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769139addStone7;
            if (_local_2 !== _arg_1)
            {
                this._769139addStone7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone7", _local_2, _arg_1));
            };
        }

        private function getWeakenNum(_arg_1:int, _arg_2:int):Number
        {
            var _local_3:Number = 1;
            if ((((STONE_SEAL_CONF_NEGATIVE) && (STONE_SEAL_CONF_NEGATIVE[_arg_1])) && (!(STONE_SEAL_CONF_NEGATIVE[_arg_1][_arg_2] == null))))
            {
                _local_3 = STONE_SEAL_CONF_NEGATIVE[_arg_1][_arg_2];
            };
            return (_local_3);
        }

        [Bindable(event="propertyChange")]
        public function get sealStone6():ItemSlotStoneSeal
        {
            return (this._2108267726sealStone6);
        }

        [Bindable(event="propertyChange")]
        public function get sealStone9():ItemSlotStoneSeal
        {
            return (this._2108267729sealStone9);
        }

        [Bindable(event="propertyChange")]
        public function get selectTxt2():Label
        {
            return (this._1655941410selectTxt2);
        }

        public function set iconTwo0(_arg_1:Image):void
        {
            var _local_2:Object = this._737913987iconTwo0;
            if (_local_2 !== _arg_1)
            {
                this._737913987iconTwo0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sealStone8():ItemSlotStoneSeal
        {
            return (this._2108267728sealStone8);
        }

        public function set canvas6111(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1462326131canvas6111;
            if (_local_2 !== _arg_1)
            {
                this._1462326131canvas6111 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas6111", _local_2, _arg_1));
            };
        }

        private function btnEnable():void
        {
            _btnEnabled = ((!(isWatch)) && (equipSid > 0));
        }

        public function set addStone8(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._769140addStone8;
            if (_local_2 !== _arg_1)
            {
                this._769140addStone8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStone8", _local_2, _arg_1));
            };
        }

        public function toRemove(_arg_1:int):void
        {
            if (isWatch)
            {
                return;
            };
            if (((_arg_1 < 1) || (_arg_1 > 10)))
            {
                return;
            };
            if (((equipSid >= EQUIP_ID_MIN) && (equipSid <= EQUIP_ID_MAX)))
            {
                _core.remote.call("stoneSealRemoveStone", new Responder(onRemove), equipSid, _arg_1);
            };
        }

        public function set iconTwo1(_arg_1:Image):void
        {
            var _local_2:Object = this._737913986iconTwo1;
            if (_local_2 !== _arg_1)
            {
                this._737913986iconTwo1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo1", _local_2, _arg_1));
            };
        }

        public function set iconTwo2(_arg_1:Image):void
        {
            var _local_2:Object = this._737913985iconTwo2;
            if (_local_2 !== _arg_1)
            {
                this._737913985iconTwo2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo2", _local_2, _arg_1));
            };
        }

        public function set iconTwo6(_arg_1:Image):void
        {
            var _local_2:Object = this._737913981iconTwo6;
            if (_local_2 !== _arg_1)
            {
                this._737913981iconTwo6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo6", _local_2, _arg_1));
            };
        }

        public function showPanel(_arg_1:Boolean, _arg_2:Number=0):void
        {
            isWatch = _arg_1;
            watchCid = _arg_2;
            equipSid = -1;
            initView();
            resetAll();
            if (initialized)
            {
                equipClick();
            };
            visible = true;
            if (!_dm.sInited)
            {
                _core.remote.call("getInitSlot", new Responder(setSlot));
                return;
            };
        }

        public function set iconTwo8(_arg_1:Image):void
        {
            var _local_2:Object = this._737913979iconTwo8;
            if (_local_2 !== _arg_1)
            {
                this._737913979iconTwo8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo8", _local_2, _arg_1));
            };
        }

        public function set iconTwo5(_arg_1:Image):void
        {
            var _local_2:Object = this._737913982iconTwo5;
            if (_local_2 !== _arg_1)
            {
                this._737913982iconTwo5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo5", _local_2, _arg_1));
            };
        }

        public function set iconTwo9(_arg_1:Image):void
        {
            var _local_2:Object = this._737913978iconTwo9;
            if (_local_2 !== _arg_1)
            {
                this._737913978iconTwo9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get selectTxt4():Label
        {
            return (this._1655941408selectTxt4);
        }

        public function set iconTwo3(_arg_1:Image):void
        {
            var _local_2:Object = this._737913984iconTwo3;
            if (_local_2 !== _arg_1)
            {
                this._737913984iconTwo3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo3", _local_2, _arg_1));
            };
        }

        public function set iconTwo4(_arg_1:Image):void
        {
            var _local_2:Object = this._737913983iconTwo4;
            if (_local_2 !== _arg_1)
            {
                this._737913983iconTwo4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo4", _local_2, _arg_1));
            };
        }

        public function set title(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get selectTxt1():Label
        {
            return (this._1655941411selectTxt1);
        }

        public function ___StoneSealPanel_VBox1_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 1;
            refreshSelectPropTxt();
        }

        private function set equipSid(_arg_1:int):void
        {
            var _local_2:Object = this._588885630equipSid;
            if (_local_2 !== _arg_1)
            {
                this._588885630equipSid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipSid", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get allAddPropTxt2():Text
        {
            return (this._1633645861allAddPropTxt2);
        }

        public function ___StoneSealPanel_VBox9_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 9;
            refreshSelectPropTxt();
        }

        public function set iconTwo7(_arg_1:Image):void
        {
            var _local_2:Object = this._737913980iconTwo7;
            if (_local_2 !== _arg_1)
            {
                this._737913980iconTwo7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconTwo7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get allAddPropTxt1():Text
        {
            return (this._1633645860allAddPropTxt1);
        }

        private function onStoneSealSetStone(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag)))
            {
                charFlag = _arg_1["data"];
                setSealStone();
                refreshAddPropTxt();
            };
        }

        private function toSuccinct(_arg_1:MouseEvent):void
        {
            var _local_2:int = 1;
            if (((charFlag) && (charFlag[equipSid])))
            {
                _local_2 = int(charFlag[equipSid]["lvl"]);
            };
            if (_local_2 >= 5)
            {
                Alert.show(Language.STONE_SEAL_PANEL_U[33], Language.STONE_SEAL_PANEL_U[33], Alert.YES, null, null);
                return;
            };
            var _local_3:Object = _core.view.getUI(ViewManager.PANEL_STONE_SEAL_BORE);
            if (_local_3)
            {
                _local_3.showPanel(this, 2, equipSid, -1, -1, _local_2);
            };
        }

        public function onGetData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (!inited)
            {
                getRes();
                inited = true;
            };
            charFlag = _arg_1["data"];
            isWatch = _arg_1["watch"];
            watchEquips = _arg_1["equip"];
            watchSlots = _arg_1["slot"];
            setSealStone();
            btnEnable();
            if (equipSid == -1)
            {
                equipSid = 3;
                equipClick();
            };
        }

        [Bindable(event="propertyChange")]
        public function get selectTxt3():Label
        {
            return (this._1655941409selectTxt3);
        }

        private function onRemove(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag)))
            {
                charFlag = _arg_1["data"];
                setSealStone();
                refreshAddPropTxt();
            };
        }

        public function stoneSealSetStone(_arg_1:ItemSlot, _arg_2:ItemSlotStoneSeal):void
        {
            if (((isWatch) || (!(_btnEnabled))))
            {
                return;
            };
            if (_arg_2.sealIndex >= 0)
            {
                _core.remote.call("stoneSealSetStone", new Responder(onStoneSealSetStone), equipSid, _arg_2.sealIndex, _arg_1.slotData.id, _arg_1.tempBagFlag);
            };
        }

        public function set iconOne0(_arg_1:Image):void
        {
            var _local_2:Object = this._738071901iconOne0;
            if (_local_2 !== _arg_1)
            {
                this._738071901iconOne0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne0", _local_2, _arg_1));
            };
        }

        private function equipClick():void
        {
            var _local_2:Object;
            if (!_dm.sInited)
            {
                return;
            };
            resetAll();
            var _local_1:Object;
            if (isWatch)
            {
                _local_1 = ((watchSlots) || ({}));
            }
            else
            {
                _local_1 = _dm.sList;
            };
            for each (_local_2 in _local_1)
            {
                if (((_local_2) && (int(_local_2.sid) == equipSid)))
                {
                    this["equipItem"].slotData = _local_2;
                    this["equipItem"].type = _local_2.type;
                    this["equipItem"].giid = _local_2.itemId;
                    equipSlot = _local_2;
                    setEquipStone();
                    break;
                };
            };
            setSealStone();
            if (equipNameMC)
            {
                equipNameMC.gotoAndStop(equipSid);
                equipNameMC.visible = true;
            };
            refreshAddPropTxt();
            btnEnable();
        }

        public function set iconOne1(_arg_1:Image):void
        {
            var _local_2:Object = this._738071900iconOne1;
            if (_local_2 !== _arg_1)
            {
                this._738071900iconOne1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne1", _local_2, _arg_1));
            };
        }

        private function getAddPropNum(_arg_1:int, _arg_2:int):Number
        {
            return ((_arg_1 + _arg_2) + 2);
        }

        public function set iconOne2(_arg_1:Image):void
        {
            var _local_2:Object = this._738071899iconOne2;
            if (_local_2 !== _arg_1)
            {
                this._738071899iconOne2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne2", _local_2, _arg_1));
            };
        }

        public function set iconOne3(_arg_1:Image):void
        {
            var _local_2:Object = this._738071898iconOne3;
            if (_local_2 !== _arg_1)
            {
                this._738071898iconOne3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne3", _local_2, _arg_1));
            };
        }

        public function set iconOne7(_arg_1:Image):void
        {
            var _local_2:Object = this._738071894iconOne7;
            if (_local_2 !== _arg_1)
            {
                this._738071894iconOne7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne7", _local_2, _arg_1));
            };
        }

        public function set iconOne4(_arg_1:Image):void
        {
            var _local_2:Object = this._738071897iconOne4;
            if (_local_2 !== _arg_1)
            {
                this._738071897iconOne4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne4", _local_2, _arg_1));
            };
        }

        public function ___StoneSealPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        public function set iconOne9(_arg_1:Image):void
        {
            var _local_2:Object = this._738071892iconOne9;
            if (_local_2 !== _arg_1)
            {
                this._738071892iconOne9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne9", _local_2, _arg_1));
            };
        }

        public function ___StoneSealPanel_VBox4_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 4;
            refreshSelectPropTxt();
        }

        public function set canvas51111(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1913453667canvas51111;
            if (_local_2 !== _arg_1)
            {
                this._1913453667canvas51111 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas51111", _local_2, _arg_1));
            };
        }

        public function set iconOne8(_arg_1:Image):void
        {
            var _local_2:Object = this._738071893iconOne8;
            if (_local_2 !== _arg_1)
            {
                this._738071893iconOne8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne8", _local_2, _arg_1));
            };
        }

        public function set iconOne5(_arg_1:Image):void
        {
            var _local_2:Object = this._738071896iconOne5;
            if (_local_2 !== _arg_1)
            {
                this._738071896iconOne5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get equipItem():ItemSlot
        {
            return (this._1075298147equipItem);
        }

        private function init():void
        {
            var _local_1:int;
            while (_local_1 < 10)
            {
                if (this[("sealStone" + _local_1)])
                {
                    this[("sealStone" + _local_1)].sealIndex = (_local_1 + 1);
                    this[("sealStone" + _local_1)].styleName = "";
                };
                if (this[("equipStone" + _local_1)])
                {
                    this[("equipStone" + _local_1)].styleName = "";
                };
                if (this[("addStone" + _local_1)])
                {
                    this[("addStone" + _local_1)].styleName = "";
                };
                if (this[("iconOne" + _local_1)])
                {
                    serImageSouce(this[("iconOne" + _local_1)], ResManager.getIconUrl(4130220000375));
                };
                if (this[("iconTwo" + _local_1)])
                {
                    serImageSouce(this[("iconTwo" + _local_1)], ResManager.getIconUrl(4130220000378));
                };
                _local_1++;
            };
            if (equipItem)
            {
                equipItem.styleName = "";
            };
        }

        private function getRes():void
        {
            if (res_load_state != 0)
            {
                return;
            };
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2080130101004)));
                res_load_state = 1;
            };
        }

        private function onRemoveAll(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag)))
            {
                charFlag = _arg_1["data"];
                setSealStone();
                refreshAddPropTxt();
            };
        }

        [Bindable(event="propertyChange")]
        public function get canvas6111():Canvas
        {
            return (this._1462326131canvas6111);
        }

        public function set equipStone2(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005507equipStone2;
            if (_local_2 !== _arg_1)
            {
                this._1439005507equipStone2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prop():Canvas
        {
            return (this._3449699prop);
        }

        public function set equipStone3(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005506equipStone3;
            if (_local_2 !== _arg_1)
            {
                this._1439005506equipStone3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone3", _local_2, _arg_1));
            };
        }

        public function set equipStone0(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005509equipStone0;
            if (_local_2 !== _arg_1)
            {
                this._1439005509equipStone0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone0", _local_2, _arg_1));
            };
        }

        public function set equipStone4(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005505equipStone4;
            if (_local_2 !== _arg_1)
            {
                this._1439005505equipStone4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone4", _local_2, _arg_1));
            };
        }

        private function refreshAddPropTxt(_arg_1:GameDataEvent=null):void
        {
            var _local_7:int;
            var _local_8:Object;
            var _local_9:int;
            var _local_10:Object;
            var _local_11:MovieClip;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Number;
            allAddPropTxt1.htmlText = "";
            allAddPropTxt2.htmlText = "";
            allAddPropLag.htmlText = "";
            if (!equipSlot)
            {
                return;
            };
            var _local_2:Object = getEquipInfo();
            if (((!(_local_2)) && (!(isWatch))))
            {
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + equipSlot.type) + "_") + equipSlot.itemId), refreshAddPropTxt);
                return;
            };
            var _local_3:Object = {};
            var _local_4:int = 1;
            if ((((charFlag) && (charFlag[equipSid])) && (charFlag[equipSid]["data"])))
            {
                _local_3 = charFlag[equipSid]["data"];
                _local_4 = int(charFlag[equipSid]["lvl"]);
            };
            allAddPropLag.htmlText = Language.STONE_SEAL_PANEL_U[3].toString().replace("{num}", _local_4);
            if (!_local_2)
            {
                _local_2 = {};
            };
            var _local_5:int;
            var _local_6:int = 1;
            while (_local_6 <= 10)
            {
                _local_7 = int(_local_2[("t" + _local_6)]);
                _local_8 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_7];
                _local_9 = int(_local_3[("s" + _local_6)]);
                _local_10 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_9];
                _local_11 = sealIcons[(_local_6 - 1)];
                if (((((_local_8) && (_local_10)) && (int(_local_8.propType) > 0)) && (int(_local_10.propType) > 0)))
                {
                    _local_12 = _local_8.propType;
                    _local_13 = _local_10.propType;
                    _local_14 = Math.min(_local_12, _local_13);
                    _local_15 = Math.max(_local_12, _local_13);
                    _local_16 = STONE_SEAL_CONF_EXTRA_PROPERTY[_local_14][_local_15]["n"];
                    _local_17 = getWeakenNum(_local_14, _local_15);
                    if (_local_16 == 0)
                    {
                        if (_local_11)
                        {
                            _local_11.gotoAndStop(_local_11.totalFrames);
                        };
                    }
                    else
                    {
                        _local_18 = _local_8.proplNum;
                        _local_19 = _local_10.proplNum;
                        _local_20 = STONE_SEAL_CONF_EXTRA_PROPERTY[_local_14][_local_15]["v"];
                        _local_20 = (((_local_20 / 10000) * getAddPropNum(_local_8.color, _local_10.color)) * STONE_SEAL_SUCCINCT_CONF[_local_4]);
                        _local_20 = (Math.floor((_local_20 * 100)) / 100);
                        this[("addStone" + (_local_6 - 1))].toolTip = ((Language.BUFF_PROP_NAME_ARR[_local_16] + " +") + _local_20);
                        if (_local_11)
                        {
                            _local_11.gotoAndStop(_local_16);
                        };
                        if ((_local_5 % 2) == 0)
                        {
                            allAddPropTxt1.htmlText = (allAddPropTxt1.htmlText + (((Language.BUFF_PROP_NAME_ARR[_local_16] + " +") + _local_20) + "\n"));
                        }
                        else
                        {
                            allAddPropTxt2.htmlText = (allAddPropTxt2.htmlText + (((Language.BUFF_PROP_NAME_ARR[_local_16] + " +") + _local_20) + "\n"));
                        };
                        _local_5++;
                    };
                    if (_local_17 == 1)
                    {
                        serImageSouce(this[("iconOne" + (_local_6 - 1))], ResManager.getIconUrl(4130220000376));
                        serImageSouce(this[("iconTwo" + (_local_6 - 1))], ResManager.getIconUrl(4130220000379));
                    }
                    else
                    {
                        serImageSouce(this[("iconOne" + (_local_6 - 1))], ResManager.getIconUrl(4130220000377));
                        serImageSouce(this[("iconTwo" + (_local_6 - 1))], ResManager.getIconUrl(4130220000380));
                    };
                }
                else
                {
                    if (_local_11)
                    {
                        _local_11.gotoAndStop(_local_11.totalFrames);
                    };
                    serImageSouce(this[("iconOne" + (_local_6 - 1))], ResManager.getIconUrl(4130220000375));
                    serImageSouce(this[("iconTwo" + (_local_6 - 1))], ResManager.getIconUrl(4130220000378));
                };
                _local_6++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconTwo6():Image
        {
            return (this._737913981iconTwo6);
        }

        [Bindable(event="propertyChange")]
        public function get iconTwo1():Image
        {
            return (this._737913986iconTwo1);
        }

        public function set equipStone8(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005501equipStone8;
            if (_local_2 !== _arg_1)
            {
                this._1439005501equipStone8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone8", _local_2, _arg_1));
            };
        }

        private function setSlot(_arg_1:Object):void
        {
            _dm.initSlotData(_arg_1);
            equipClick();
        }

        public function set equipStone9(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005500equipStone9;
            if (_local_2 !== _arg_1)
            {
                this._1439005500equipStone9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone9", _local_2, _arg_1));
            };
        }

        public function set equipStone6(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005503equipStone6;
            if (_local_2 !== _arg_1)
            {
                this._1439005503equipStone6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconTwo0():Image
        {
            return (this._737913987iconTwo0);
        }

        [Bindable(event="propertyChange")]
        public function get iconTwo9():Image
        {
            return (this._737913978iconTwo9);
        }

        [Bindable(event="propertyChange")]
        public function get iconTwo2():Image
        {
            return (this._737913985iconTwo2);
        }

        override public function initialize():void
        {
            var target:StoneSealPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StoneSealPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_StoneSealPanelWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get iconTwo5():Image
        {
            return (this._737913982iconTwo5);
        }

        public function set sealStone1(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267721sealStone1;
            if (_local_2 !== _arg_1)
            {
                this._2108267721sealStone1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone1", _local_2, _arg_1));
            };
        }

        public function set equipStone7(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005502equipStone7;
            if (_local_2 !== _arg_1)
            {
                this._1439005502equipStone7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconTwo4():Image
        {
            return (this._737913983iconTwo4);
        }

        public function set equipStone1(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005508equipStone1;
            if (_local_2 !== _arg_1)
            {
                this._1439005508equipStone1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone1", _local_2, _arg_1));
            };
        }

        private function serImageSouce(_arg_1:Image, _arg_2:String):void
        {
            if (((_arg_1) && (!(_arg_1.source == _arg_2))))
            {
                _arg_1.source = _arg_2;
            };
        }

        public function set sealStone5(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267725sealStone5;
            if (_local_2 !== _arg_1)
            {
                this._2108267725sealStone5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone5", _local_2, _arg_1));
            };
        }

        public function set equipStone5(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object = this._1439005504equipStone5;
            if (_local_2 !== _arg_1)
            {
                this._1439005504equipStone5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipStone5", _local_2, _arg_1));
            };
        }

        public function set sealStone2(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267722sealStone2;
            if (_local_2 !== _arg_1)
            {
                this._2108267722sealStone2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone2", _local_2, _arg_1));
            };
        }

        public function set iconOne6(_arg_1:Image):void
        {
            var _local_2:Object = this._738071895iconOne6;
            if (_local_2 !== _arg_1)
            {
                this._738071895iconOne6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconOne6", _local_2, _arg_1));
            };
        }

        public function set container1(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._145245136container1;
            if (_local_2 !== _arg_1)
            {
                this._145245136container1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container1", _local_2, _arg_1));
            };
        }

        public function set sealStone0(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267720sealStone0;
            if (_local_2 !== _arg_1)
            {
                this._2108267720sealStone0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone0", _local_2, _arg_1));
            };
        }

        public function set sealStone6(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267726sealStone6;
            if (_local_2 !== _arg_1)
            {
                this._2108267726sealStone6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canvas51111():Canvas
        {
            return (this._1913453667canvas51111);
        }

        public function ___StoneSealPanel_VBox7_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 7;
            refreshSelectPropTxt();
        }

        [Bindable(event="propertyChange")]
        public function get iconTwo8():Image
        {
            return (this._737913979iconTwo8);
        }

        public function set allAddPropLag(_arg_1:Label):void
        {
            var _local_2:Object = this._1161068495allAddPropLag;
            if (_local_2 !== _arg_1)
            {
                this._1161068495allAddPropLag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allAddPropLag", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconTwo3():Image
        {
            return (this._737913984iconTwo3);
        }

        public function set sealStone4(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267724sealStone4;
            if (_local_2 !== _arg_1)
            {
                this._2108267724sealStone4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone4", _local_2, _arg_1));
            };
        }

        public function set selectTxt2(_arg_1:Label):void
        {
            var _local_2:Object = this._1655941410selectTxt2;
            if (_local_2 !== _arg_1)
            {
                this._1655941410selectTxt2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectTxt2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconTwo7():Image
        {
            return (this._737913980iconTwo7);
        }

        public function onBore(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.flag)))
            {
                charFlag = _arg_1["data"];
                setSealStone();
                refreshAddPropTxt();
            };
        }

        public function set selectTxt1(_arg_1:Label):void
        {
            var _local_2:Object = this._1655941411selectTxt1;
            if (_local_2 !== _arg_1)
            {
                this._1655941411selectTxt1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectTxt1", _local_2, _arg_1));
            };
        }

        public function set selectTxt3(_arg_1:Label):void
        {
            var _local_2:Object = this._1655941409selectTxt3;
            if (_local_2 !== _arg_1)
            {
                this._1655941409selectTxt3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectTxt3", _local_2, _arg_1));
            };
        }

        private function _StoneSealPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.STONE_SEAL_PANEL_U[0];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = (!(isWatch));
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.STONE_SEAL_PANEL_U[29];
        }

        public function set selectTxt4(_arg_1:Label):void
        {
            var _local_2:Object = this._1655941408selectTxt4;
            if (_local_2 !== _arg_1)
            {
                this._1655941408selectTxt4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectTxt4", _local_2, _arg_1));
            };
        }

        private function set _btnEnabled(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1710794012_btnEnabled;
            if (_local_2 !== _arg_1)
            {
                this._1710794012_btnEnabled = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_btnEnabled", _local_2, _arg_1));
            };
        }

        public function set sealStone8(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267728sealStone8;
            if (_local_2 !== _arg_1)
            {
                this._2108267728sealStone8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get container1():UIComponent
        {
            return (this._145245136container1);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (!isWatch)
            {
                _core.remote.call("stoneSealGetData", new Responder(onGetData));
            }
            else
            {
                onGetData(watchData);
            };
        }

        [Bindable(event="propertyChange")]
        public function get allAddPropLag():Label
        {
            return (this._1161068495allAddPropLag);
        }

        public function set btnsCanvas(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._1859329585btnsCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1859329585btnsCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnsCanvas", _local_2, _arg_1));
            };
        }

        private function resetAll():void
        {
            var _local_2:MovieClip;
            if (!initialized)
            {
                return;
            };
            var _local_1:int;
            if (this["equipItem"])
            {
                this["equipItem"].clean();
                this["equipItem"].slotData = null;
                this["equipItem"].type = 0;
                this["equipItem"].giid = 0;
            };
            _local_1 = 0;
            while (_local_1 < 10)
            {
                if (this[("equipStone" + _local_1)])
                {
                    this[("equipStone" + _local_1)].clean();
                    this[("equipStone" + _local_1)].selected = false;
                    this[("equipStone" + _local_1)].type = 0;
                    this[("equipStone" + _local_1)].giid = 0;
                    this[("equipStone" + _local_1)].enabled = true;
                };
                if (this[("sealStone" + _local_1)])
                {
                    this[("sealStone" + _local_1)].setOpen(false);
                    this[("sealStone" + _local_1)].enabled = false;
                };
                if (this[("addStone" + _local_1)])
                {
                    this[("addStone" + _local_1)].toolTip = Language.STONE_SEAL_PANEL_U[31];
                    _local_2 = sealIcons[_local_1];
                    if (_local_2)
                    {
                        _local_2.gotoAndStop(_local_2.totalFrames);
                    };
                };
                if (this[("iconOne" + _local_1)])
                {
                    serImageSouce(this[("iconOne" + _local_1)], ResManager.getIconUrl(4130220000375));
                };
                if (this[("iconTwo" + _local_1)])
                {
                    serImageSouce(this[("iconTwo" + _local_1)], ResManager.getIconUrl(4130220000378));
                };
                _local_1++;
            };
            if (allAddPropTxt1)
            {
                allAddPropTxt1.htmlText = "";
            };
            if (allAddPropTxt2)
            {
                allAddPropTxt2.htmlText = "";
            };
            if (allAddPropLag)
            {
                allAddPropLag.htmlText = "";
            };
            equipSlot = null;
            if (selectTxt1)
            {
                selectTxt1.htmlText = Language.STONE_SEAL_PANEL_U[25].toString().replace("{num}", 1);
            };
            if (selectTxt2)
            {
                selectTxt2.htmlText = (((Language.STONE_SEAL_PANEL_U[1] + "<font color='#00FFFF'>") + Language.STONE_SEAL_PANEL_U[22]) + "</font>");
            };
            if (selectTxt3)
            {
                selectTxt3.htmlText = (((Language.STONE_SEAL_PANEL_U[2] + "<font color='#00FFFF'>") + Language.STONE_SEAL_PANEL_U[24]) + "</font>");
            };
            if (selectTxt4)
            {
                selectTxt4.htmlText = (((Language.STONE_SEAL_PANEL_U[26] + "<font color='#00FFFF'>") + Language.STONE_SEAL_PANEL_U[27]) + "</font>");
            };
        }

        public function set sealStone9(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267729sealStone9;
            if (_local_2 !== _arg_1)
            {
                this._2108267729sealStone9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone9", _local_2, _arg_1));
            };
        }

        public function set sealStone3(_arg_1:ItemSlotStoneSeal):void
        {
            var _local_2:Object = this._2108267723sealStone3;
            if (_local_2 !== _arg_1)
            {
                this._2108267723sealStone3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sealStone3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnsCanvas():UIComponent
        {
            return (this._1859329585btnsCanvas);
        }

        public function ___StoneSealPanel_VBox2_mouseOver(_arg_1:MouseEvent):void
        {
            selectIndex = 2;
            refreshSelectPropTxt();
        }

        [Bindable(event="propertyChange")]
        public function get selectedPropCanvas():Canvas
        {
            return (this._1625307030selectedPropCanvas);
        }

        private function removeAllStone(e:MouseEvent):void
        {
            if (((isWatch) || (!(_btnEnabled))))
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("stoneSealRemoveAllStone", new Responder(onRemoveAll), equipSid);
                };
            };
            if (((equipSid >= EQUIP_ID_MIN) && (equipSid <= EQUIP_ID_MAX)))
            {
                Alert.show(Language.STONE_SEAL_PANEL_U[32], "", (Alert.YES | Alert.NO), null, func);
            };
        }

        public function onGetWatchData(_arg_1:Object):void
        {
            isWatch = true;
            watchData = _arg_1;
            initView();
            visible = true;
        }

        public function set selectedPropCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1625307030selectedPropCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1625307030selectedPropCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedPropCanvas", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

