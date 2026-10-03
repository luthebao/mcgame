// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SmallGameSpeedPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlotCreature;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.Image;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.setTimeout;
    import flash.net.Responder;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.clearTimeout;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.controls.Alert;
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

    public class SmallGameSpeedPanel extends DragableCanvas implements IBindingClient 
    {

        private static const SMALL_GAME_MAX_TIMES:int = 3;
        private static const SMALL_GAME_ADD_TIME_COST:int = 10;
        private static const SMALL_GAME_POINT_PLAY_TIME:Number = 2000;
        private static const SMALL_GAME_PLAY_INTERVAL:Number = 1000;
        private static const SMALL_GAME_START_ID:Number = 3880;
        private static const SMALL_GAME_END_ID:Number = 3881;
        private static const SMALL_GAME_SLOT_TOTAL_NUM:int = 49;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1641501082idSlot3:ItemSlotCreature;
        private var _653073985idSlot28:ItemSlotCreature;
        private var _653073992idSlot21:ItemSlotCreature;
        private var _653073989idSlot24:ItemSlotCreature;
        private var _653073990idSlot23:ItemSlotCreature;
        private var _896883712idTodayTimes:BasicTxtButton;
        private var _isPlaying:Boolean = false;
        private var _winTimes:int = 0;
        private var _isThrowing:Boolean = false;
        private var _463521703idLostTimes:BasicTxtButton;
        private var _actionType:String = "my";
        private var _1641501080idSlot1:ItemSlotCreature;
        private var _1641501087idSlot8:ItemSlotCreature;
        private var _1638814005idPoint:Image;
        public var _SmallGameSpeedPanel_Button4:Button;
        private var _653073926idSlot45:ItemSlotCreature;
        private var _pcStep:Number = 1;
        private var _653073928idSlot43:ItemSlotCreature;
        private var _653073924idSlot47:ItemSlotCreature;
        private var _653073931idSlot40:ItemSlotCreature;
        private var _653073922idSlot49:ItemSlotCreature;
        private var _653074015idSlot19:ItemSlotCreature;
        private var winOrLost:Boolean = false;
        private var _653074019idSlot15:ItemSlotCreature;
        private var _1641501085idSlot6:ItemSlotCreature;
        private var _653074017idSlot17:ItemSlotCreature;
        private var _653074020idSlot14:ItemSlotCreature;
        private var _653074024idSlot10:ItemSlotCreature;
        private var _653073955idSlot37:ItemSlotCreature;
        private var _653074022idSlot12:ItemSlotCreature;
        private var _653073957idSlot35:ItemSlotCreature;
        private var _653073959idSlot33:ItemSlotCreature;
        private var _playTotalTimes:int = 1;
        private var _1445731091idPlayBtn:Button;
        private var _653073962idSlot30:ItemSlotCreature;
        private var stepHandler:int = 0;
        private var _653073953idSlot39:ItemSlotCreature;
        private var _653073960idSlot32:ItemSlotCreature;
        private var _1641501083idSlot4:ItemSlotCreature;
        public var _SmallGameSpeedPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _playTimes:int = 0;
        private var _653073988idSlot25:ItemSlotCreature;
        private var _lostTimes:int = 0;
        private var _653073984idSlot29:ItemSlotCreature;
        private var _653073986idSlot27:ItemSlotCreature;
        private var _653073991idSlot22:ItemSlotCreature;
        private var _653073993idSlot20:ItemSlotCreature;
        private var _maxStep:Number = 1;
        private var _1641501081idSlot2:ItemSlotCreature;
        private var _prevStep:Number = 1;
        private var _1641501088idSlot9:ItemSlotCreature;
        private var _985338109idStartGameBtn:Button;
        private var _581600507idWinTimes:BasicTxtButton;
        private var _currentPoint:int = 0;
        private var _653073929idSlot42:ItemSlotCreature;
        private var _653073927idSlot44:ItemSlotCreature;
        private var _backForwardStep:Number = 0;
        private var _1641501086idSlot7:ItemSlotCreature;
        private var _653073925idSlot46:ItemSlotCreature;
        private var _1404615706idGetAwardBtn:Button;
        private var _stepType:String = "";
        private var _653073930idSlot41:ItemSlotCreature;
        private var _653073923idSlot48:ItemSlotCreature;
        private var pointHandler:int = 0;
        private var _653074018idSlot16:ItemSlotCreature;
        private var _653074016idSlot18:ItemSlotCreature;
        private var _653074021idSlot13:ItemSlotCreature;
        private var _653074023idSlot11:ItemSlotCreature;
        private var _myStep:Number = 1;
        private var _653073954idSlot38:ItemSlotCreature;
        private var _1641501084idSlot5:ItemSlotCreature;
        private var _653073958idSlot34:ItemSlotCreature;
        private var _653073956idSlot36:ItemSlotCreature;
        private var _653073961idSlot31:ItemSlotCreature;
        private var roundHandler:int = 0;
        private var _653073987idSlot26:ItemSlotCreature;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":506,
                    "height":416,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SmallGameSpeedPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "width":446,
                                "height":20,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idTodayTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":50,
                                            "y":0,
                                            "width":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idWinTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":170,
                                            "y":0,
                                            "width":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idLostTimes",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":290,
                                            "y":0,
                                            "width":100
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":68,
                                "width":446,
                                "height":298,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot2",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "44";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot3",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "80";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot4",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "116";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot5",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "152";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot6",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "188";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot7",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "224";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot8",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "260";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot9",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "296";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot10",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "332";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot11",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "368";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot12",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "404";
                                        this.top = "5";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot13",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "404";
                                        this.top = "41";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot29",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot28",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "44";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot27",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "80";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot21",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "152";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot20",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "188";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot19",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "224";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot18",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "260";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot17",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "296";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot16",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "332";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot15",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "368";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot14",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "404";
                                        this.top = "77";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot30",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.top = "113";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot26",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "80";
                                        this.top = "113";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot22",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "152";
                                        this.top = "113";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot31",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.top = "149";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot25",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "80";
                                        this.top = "149";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot24",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "116";
                                        this.top = "149";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot23",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "152";
                                        this.top = "149";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot32",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.top = "185";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot45",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "332";
                                        this.top = "185";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot46",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "368";
                                        this.top = "185";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot47",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "404";
                                        this.top = "185";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot33",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.top = "221";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot34",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "44";
                                        this.top = "221";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot35",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "80";
                                        this.top = "221";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot36",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "116";
                                        this.top = "221";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot37",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "152";
                                        this.top = "221";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot38",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "188";
                                        this.top = "221";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot44",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "332";
                                        this.top = "221";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot48",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "404";
                                        this.top = "221";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot39",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "188";
                                        this.top = "257";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot40",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "224";
                                        this.top = "257";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot41",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "260";
                                        this.top = "257";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot42",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "296";
                                        this.top = "257";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot43",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "332";
                                        this.top = "257";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idSlot49",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "404";
                                        this.top = "257";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"sourceGroup":true});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"idPoint",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":120,
                                            "height":214,
                                            "x":275,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"idPlayBtn",
                                    "events":{"click":"__idPlayBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "53";
                                        this.verticalCenter = "82";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":80
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":374,
                                "width":446,
                                "height":25,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"idStartGameBtn",
                                    "events":{"click":"__idStartGameBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":0,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "width":80
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"idGetAwardBtn",
                                    "events":{"click":"__idGetAwardBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":180,
                                            "y":0,
                                            "enabled":false,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_SmallGameSpeedPanel_Button4",
                                    "events":{"click":"___SmallGameSpeedPanel_Button4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":280,
                                            "y":0,
                                            "styleName":"BtnStdRed",
                                            "width":80
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
        private var pointsIcons:Array = ["2060090400033", "2060090400027", "2060090400028", "2060090400029", "2060090400030", "2060090400031", "2060090400032"];
        private var slotIcons:Object = {
            "exp":3876,
            "money":3877,
            "goods":3878,
            "step":3879
        };
        private var defineSlots:Object = {
            "1":"",
            "2":"exp",
            "3":"",
            "4":"money",
            "5":"",
            "6":"step",
            "7":"",
            "8":"exp",
            "9":"goods",
            "10":"money",
            "11":"",
            "12":"",
            "13":"exp",
            "14":"step",
            "15":"",
            "16":"money",
            "17":"",
            "18":"exp",
            "19":"",
            "20":"",
            "21":"goods",
            "22":"",
            "23":"money",
            "24":"",
            "25":"",
            "26":"exp",
            "27":"",
            "28":"step",
            "29":"",
            "30":"exp",
            "31":"",
            "32":"",
            "33":"",
            "34":"",
            "35":"money",
            "36":"",
            "37":"goods",
            "38":"",
            "39":"exp",
            "40":"step",
            "41":"",
            "42":"",
            "43":"",
            "44":"",
            "45":"exp",
            "46":"money",
            "47":"",
            "48":"",
            "49":""
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SmallGameSpeedPanel()
        {
            mx_internal::_document = this;
            this.width = 506;
            this.height = 416;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___SmallGameSpeedPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SmallGameSpeedPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get idSlot38():ItemSlotCreature
        {
            return (this._653073954idSlot38);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot39():ItemSlotCreature
        {
            return (this._653073953idSlot39);
        }

        public function set idSlot38(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073954idSlot38;
            if (_local_2 !== _arg_1)
            {
                this._653073954idSlot38 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot38", _local_2, _arg_1));
            };
        }

        public function set idSlot39(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073953idSlot39;
            if (_local_2 !== _arg_1)
            {
                this._653073953idSlot39 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot39", _local_2, _arg_1));
            };
        }

        public function set idSlot47(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073924idSlot47;
            if (_local_2 !== _arg_1)
            {
                this._653073924idSlot47 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot47", _local_2, _arg_1));
            };
        }

        public function set idSlot43(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073928idSlot43;
            if (_local_2 !== _arg_1)
            {
                this._653073928idSlot43 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot43", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot45():ItemSlotCreature
        {
            return (this._653073926idSlot45);
        }

        private function clearPrevStepStyle():void
        {
            var _local_1:int;
            var _local_2:Number = ((_actionType == "pc") ? _myStep : _pcStep);
            var _local_3:int = ((_actionType == "pc") ? 1 : 5);
            if (_prevStep == _local_2)
            {
                _local_1 = _local_3;
            };
            this[("idSlot" + _prevStep)].setStyleName(_local_1);
        }

        public function onSaveGame(_arg_1:Object):void
        {
            var _local_2:String = ((_arg_1.flag) ? Language.SMALL_GAME_P[13] : Language.SMALL_GAME_P[14]);
            winOrLost = ((_arg_1.flag) ? true : false);
            if (_arg_1.flag)
            {
                _winTimes++;
            }
            else
            {
                _lostTimes++;
            };
            idGetAwardBtn.enabled = true;
            _core.sysMsg(_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot42():ItemSlotCreature
        {
            return (this._653073929idSlot42);
        }

        public function set idSlot42(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073929idSlot42;
            if (_local_2 !== _arg_1)
            {
                this._653073929idSlot42 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot42", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot7():ItemSlotCreature
        {
            return (this._1641501086idSlot7);
        }

        private function setStepStyle():void
        {
            var _local_1:int = ((_actionType == "pc") ? 5 : 1);
            var _local_2:Number = ((_actionType == "pc") ? _pcStep : _myStep);
            this[("idSlot" + _local_2)].setStyleName(_local_1);
            clearPrevStepStyle();
        }

        public function set idSlot33(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073959idSlot33;
            if (_local_2 !== _arg_1)
            {
                this._653073959idSlot33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot33", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot40():ItemSlotCreature
        {
            return (this._653073931idSlot40);
        }

        public function set idSlot46(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073925idSlot46;
            if (_local_2 !== _arg_1)
            {
                this._653073925idSlot46 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot46", _local_2, _arg_1));
            };
        }

        public function set idWinTimes(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._581600507idWinTimes;
            if (_local_2 !== _arg_1)
            {
                this._581600507idWinTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idWinTimes", _local_2, _arg_1));
            };
        }

        public function set idSlot48(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073923idSlot48;
            if (_local_2 !== _arg_1)
            {
                this._653073923idSlot48 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot48", _local_2, _arg_1));
            };
        }

        public function set idSlot44(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073927idSlot44;
            if (_local_2 !== _arg_1)
            {
                this._653073927idSlot44 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot44", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot49():ItemSlotCreature
        {
            return (this._653073922idSlot49);
        }

        [Bindable(event="propertyChange")]
        public function get idGetAwardBtn():Button
        {
            return (this._1404615706idGetAwardBtn);
        }

        private function _play():void
        {
            var _local_1:Number = forwardStep();
            var _local_2:Number = ((_actionType == "my") ? _myStep : _pcStep);
            var _local_3:Number = (_local_2 + _local_1);
            _prevStep = _local_2;
            _local_3 = ((_local_3 > SMALL_GAME_SLOT_TOTAL_NUM) ? SMALL_GAME_SLOT_TOTAL_NUM : _local_3);
            _maxStep = _local_3;
            if (_actionType == "my")
            {
                _myStep = _maxStep;
            }
            else
            {
                _pcStep = _maxStep;
            };
            setPoint();
            pointHandler = setTimeout(changeStep, SMALL_GAME_POINT_PLAY_TIME);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot8():ItemSlotCreature
        {
            return (this._1641501087idSlot8);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot9():ItemSlotCreature
        {
            return (this._1641501088idSlot9);
        }

        public function set idStartGameBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._985338109idStartGameBtn;
            if (_local_2 !== _arg_1)
            {
                this._985338109idStartGameBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idStartGameBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot48():ItemSlotCreature
        {
            return (this._653073923idSlot48);
        }

        public function set idGetAwardBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1404615706idGetAwardBtn;
            if (_local_2 !== _arg_1)
            {
                this._1404615706idGetAwardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idGetAwardBtn", _local_2, _arg_1));
            };
        }

        public function set idSlot6(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501085idSlot6;
            if (_local_2 !== _arg_1)
            {
                this._1641501085idSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot6", _local_2, _arg_1));
            };
        }

        private function stepAction():void
        {
            var _local_1:Number = ((_actionType == "my") ? _myStep : _pcStep);
            _stepType = defineSlots[_local_1];
            if (_actionType == "my")
            {
                _core.remote.call("getSmallGameStepAward", new Responder(onStepAction), "speed", _stepType, _myStep, _pcStep);
            }
            else
            {
                if (((_actionType == "pc") && (_stepType == "step")))
                {
                    randomStep();
                    stepHandler = setTimeout(stepToStep, 500);
                }
                else
                {
                    if (_actionType == "pc")
                    {
                        afterStepAction();
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot6():ItemSlotCreature
        {
            return (this._1641501085idSlot6);
        }

        private function randomStep():Number
        {
            var _local_1:int = -6;
            var _local_2:int = 6;
            _backForwardStep = Math.round(ToolKit.genRangeRandom(_local_1, _local_2));
            if (!_backForwardStep)
            {
                return (randomStep());
            };
            return (_backForwardStep);
        }

        private function setPoint():void
        {
            idPoint.source = ResManager.getResUrl(pointsIcons[_currentPoint]);
        }

        [Bindable(event="propertyChange")]
        public function get idTodayTimes():BasicTxtButton
        {
            return (this._896883712idTodayTimes);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot47():ItemSlotCreature
        {
            return (this._653073924idSlot47);
        }

        public function set idTodayTimes(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._896883712idTodayTimes;
            if (_local_2 !== _arg_1)
            {
                this._896883712idTodayTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTodayTimes", _local_2, _arg_1));
            };
        }

        public function set idPoint(_arg_1:Image):void
        {
            var _local_2:Object = this._1638814005idPoint;
            if (_local_2 !== _arg_1)
            {
                this._1638814005idPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPoint", _local_2, _arg_1));
            };
        }

        public function set idSlot49(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073922idSlot49;
            if (_local_2 !== _arg_1)
            {
                this._653073922idSlot49 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot49", _local_2, _arg_1));
            };
        }

        private function onAddPlayTime(_arg_1:Boolean):void
        {
            if (!_arg_1)
            {
                _playTotalTimes--;
            };
            resetPlayData();
            checkGameStartBtn();
        }

        private function initProp(_arg_1:Boolean):void
        {
            _pcStep = 1;
            _myStep = 1;
            _maxStep = 1;
            _prevStep = 1;
            idPoint.source = ResManager.getResUrl(pointsIcons[0]);
            (_actionType == "my");
            _isThrowing = false;
            initSlotBorder();
            if (_arg_1)
            {
                idStartGameBtn.enabled = false;
                if (_playTotalTimes > _playTimes)
                {
                    idPlayBtn.enabled = true;
                };
            }
            else
            {
                idStartGameBtn.enabled = true;
                idPlayBtn.enabled = false;
                winOrLost = false;
                _isPlaying = false;
            };
            setStepStyle();
            idGetAwardBtn.enabled = false;
        }

        private function changeStep():void
        {
            if (pointHandler)
            {
                clearTimeout(pointHandler);
                pointHandler = 0;
            };
            setStepStyle();
            stepAction();
        }

        public function initPanel():void
        {
            if (!initialized)
            {
                _core.player.normalView.pause();
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            callLater(_core.player.normalView.resume);
            initProp(false);
            initSlotDisplay();
            _core.remote.call("getSmallGameStatus", new Responder(onGetSmallGameStatus), "speed");
        }

        [Bindable(event="propertyChange")]
        public function get idPlayBtn():Button
        {
            return (this._1445731091idPlayBtn);
        }

        private function onGetSmallGameStatus(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Object;
            var _local_4:Number;
            if (_arg_1.state)
            {
                _playTimes = _arg_1.playTimes;
                _playTotalTimes = _arg_1.playTotalTimes;
                _winTimes = _arg_1.winTimes;
                _lostTimes = _arg_1.lostTimes;
                _local_2 = Number(_arg_1.awardFlag);
                _local_3 = _arg_1.extend;
                resetPlayData();
                checkGameStartBtn();
                _local_4 = (((_local_3) && (_local_3.myStep)) ? Number(_local_3.myStep) : 0);
                if (((_local_2 >= 0) || (_local_4 > 1)))
                {
                    idStartGameBtn.enabled = false;
                    idPlayBtn.enabled = false;
                    idGetAwardBtn.enabled = true;
                    winOrLost = true;
                    _isPlaying = true;
                    if (((_local_4 > 1) && (_local_2 < 0)))
                    {
                        winOrLost = false;
                        idPlayBtn.enabled = true;
                        idGetAwardBtn.enabled = false;
                        _myStep = _local_4;
                        _pcStep = _local_3.pcStep;
                        _prevStep = _myStep;
                        _maxStep = ((_myStep > _pcStep) ? _myStep : _pcStep);
                        this[("idSlot" + _myStep)].setStyleName(1);
                        this[("idSlot" + _pcStep)].setStyleName(5);
                        if (((!(_myStep == 1)) && (!(_pcStep == 1))))
                        {
                            this["idSlot1"].setStyleName(0);
                        };
                    };
                };
                if (((!(idStartGameBtn.enabled)) && (!(idPlayBtn.enabled))))
                {
                    idGetAwardBtn.enabled = true;
                };
            };
        }

        private function initSlotBorder():void
        {
            var _local_1:String;
            for (_local_1 in defineSlots)
            {
                this[("idSlot" + _local_1)].setStyleName(0);
            };
        }

        [Bindable(event="propertyChange")]
        public function get idWinTimes():BasicTxtButton
        {
            return (this._581600507idWinTimes);
        }

        private function init():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get idStartGameBtn():Button
        {
            return (this._985338109idStartGameBtn);
        }

        private function afterStepAction():void
        {
            if (_maxStep >= SMALL_GAME_SLOT_TOTAL_NUM)
            {
                decideWinner();
            }
            else
            {
                _actionType = ((_actionType == "my") ? "pc" : "my");
                if (_actionType == "pc")
                {
                    roundHandler = setTimeout(pcPlay, SMALL_GAME_PLAY_INTERVAL);
                }
                else
                {
                    _isThrowing = false;
                    idPlayBtn.enabled = true;
                };
            };
        }

        public function __idStartGameBtn_click(_arg_1:MouseEvent):void
        {
            startGame();
        }

        public function set idSlot1(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501080idSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1641501080idSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot1", _local_2, _arg_1));
            };
        }

        public function set idSlot11(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074023idSlot11;
            if (_local_2 !== _arg_1)
            {
                this._653074023idSlot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idPoint():Image
        {
            return (this._1638814005idPoint);
        }

        public function set idSlot13(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074021idSlot13;
            if (_local_2 !== _arg_1)
            {
                this._653074021idSlot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot13", _local_2, _arg_1));
            };
        }

        public function set idSlot10(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074024idSlot10;
            if (_local_2 !== _arg_1)
            {
                this._653074024idSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot10", _local_2, _arg_1));
            };
        }

        private function forwardStep():Number
        {
            var _local_1:int = 1;
            var _local_2:int = 6;
            var _local_3:int = Math.round(ToolKit.genRangeRandom(_local_1, _local_2));
            if ((((_local_3 < _local_1) || (_local_3 > _local_2)) || (_currentPoint == _local_3)))
            {
                return (forwardStep());
            };
            _currentPoint = _local_3;
            return (_currentPoint);
        }

        private function play():void
        {
            if (((_isThrowing) || (!(_isPlaying))))
            {
                return;
            };
            if (_maxStep >= SMALL_GAME_SLOT_TOTAL_NUM)
            {
                _core.sysMsg(Language.SMALL_GAME_P[45]);
            }
            else
            {
                if (_actionType == "my")
                {
                    _isThrowing = true;
                    idPlayBtn.enabled = false;
                    _play();
                };
            };
        }

        public function set idSlot16(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074018idSlot16;
            if (_local_2 !== _arg_1)
            {
                this._653074018idSlot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot16", _local_2, _arg_1));
            };
        }

        public function set idSlot4(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501083idSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1641501083idSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot4", _local_2, _arg_1));
            };
        }

        public function set idSlot17(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074017idSlot17;
            if (_local_2 !== _arg_1)
            {
                this._653074017idSlot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot17", _local_2, _arg_1));
            };
        }

        public function set idSlot14(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074020idSlot14;
            if (_local_2 !== _arg_1)
            {
                this._653074020idSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot14", _local_2, _arg_1));
            };
        }

        public function set idSlot18(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074016idSlot18;
            if (_local_2 !== _arg_1)
            {
                this._653074016idSlot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot18", _local_2, _arg_1));
            };
        }

        public function set idSlot19(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074015idSlot19;
            if (_local_2 !== _arg_1)
            {
                this._653074015idSlot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot19", _local_2, _arg_1));
            };
        }

        public function __idGetAwardBtn_click(_arg_1:MouseEvent):void
        {
            getAwardAndReset();
        }

        public function set idSlot5(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501084idSlot5;
            if (_local_2 !== _arg_1)
            {
                this._1641501084idSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot5", _local_2, _arg_1));
            };
        }

        private function _SmallGameSpeedPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SMALL_GAME_P[43];
            _local_1 = Language.SMALL_GAME_P[4];
            _local_1 = Language.SMALL_GAME_P[5];
            _local_1 = Language.SMALL_GAME_P[6];
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Language.SMALL_GAME_P[44];
            _local_1 = Language.SMALL_GAME_P[8];
            _local_1 = Language.SMALL_GAME_P[10];
            _local_1 = Language.SMALL_GAME_P[7];
        }

        public function set idSlot7(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501086idSlot7;
            if (_local_2 !== _arg_1)
            {
                this._1641501086idSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot7", _local_2, _arg_1));
            };
        }

        public function set idSlot12(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074022idSlot12;
            if (_local_2 !== _arg_1)
            {
                this._653074022idSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot12", _local_2, _arg_1));
            };
        }

        public function set idSlot8(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501087idSlot8;
            if (_local_2 !== _arg_1)
            {
                this._1641501087idSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot8", _local_2, _arg_1));
            };
        }

        public function set idLostTimes(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._463521703idLostTimes;
            if (_local_2 !== _arg_1)
            {
                this._463521703idLostTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idLostTimes", _local_2, _arg_1));
            };
        }

        public function set idSlot9(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501088idSlot9;
            if (_local_2 !== _arg_1)
            {
                this._1641501088idSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot9", _local_2, _arg_1));
            };
        }

        private function setSlotData(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:Object = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_arg_2];
            this[("idSlot" + _arg_1)].type = GamePredef.TBL_ITEM_TEMPLATE;
            this[("idSlot" + _arg_1)].giid = _local_3.id;
            this[("idSlot" + _arg_1)].slotData = _local_3;
            this[("idSlot" + _arg_1)].stackNum = 1;
        }

        public function set idSlot3(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501082idSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1641501082idSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot3", _local_2, _arg_1));
            };
        }

        public function set idSlot2(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501081idSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1641501081idSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot2", _local_2, _arg_1));
            };
        }

        private function onStepAction(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:int;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Object;
            if (_actionType == "my")
            {
                _local_2 = "";
                _local_3 = 0;
                switch (_stepType)
                {
                    case "exp":
                        _local_3 = _arg_1.val;
                        _local_2 = Language.SMALL_GAME_P[46].replace("{num}", _local_3);
                        break;
                    case "money":
                        _local_3 = _arg_1.val;
                        _local_2 = Language.SMALL_GAME_P[47].replace("{num}", _local_3);
                        break;
                    case "goods":
                        _local_4 = _arg_1.type;
                        _local_5 = _arg_1.item;
                        _local_6 = _core.data.gameData[_local_4][_local_5];
                        _local_2 = Language.SMALL_GAME_P[48].replace("{name}", _local_6.name);
                        break;
                    case "step":
                        randomStep();
                        stepHandler = setTimeout(stepToStep, 500);
                        _local_2 = ((_backForwardStep > 0) ? Language.SMALL_GAME_P[49] : Language.SMALL_GAME_P[50]);
                        _local_2 = _local_2.replace("{num}", Math.abs(_backForwardStep));
                        break;
                };
                if (_local_2)
                {
                    _core.sysMsg(_local_2);
                };
            };
            if (_stepType != "step")
            {
                afterStepAction();
            };
        }

        public function ___SmallGameSpeedPanel_Button4_click(_arg_1:MouseEvent):void
        {
            addPlayTime();
        }

        private function resetPlayData():void
        {
            idTodayTimes.text = (((Language.SMALL_GAME_P[4] + _playTimes) + "/") + _playTotalTimes);
            idWinTimes.text = (Language.SMALL_GAME_P[51] + _winTimes);
            idLostTimes.text = (Language.SMALL_GAME_P[52] + _lostTimes);
        }

        public function set idSlot21(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073992idSlot21;
            if (_local_2 !== _arg_1)
            {
                this._653073992idSlot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot21", _local_2, _arg_1));
            };
        }

        public function set idSlot22(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073991idSlot22;
            if (_local_2 !== _arg_1)
            {
                this._653073991idSlot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot22", _local_2, _arg_1));
            };
        }

        private function startGame():void
        {
            initProp(true);
            if (((_playTimes < _playTotalTimes) && (!(_isPlaying))))
            {
                trace("startGame");
                _actionType = "my";
                _isPlaying = true;
            }
            else
            {
                _core.sysMsg(Language.SMALL_GAME_P[24]);
            };
        }

        public function set idSlot20(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073993idSlot20;
            if (_local_2 !== _arg_1)
            {
                this._653073993idSlot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot20", _local_2, _arg_1));
            };
        }

        public function set idSlot26(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073987idSlot26;
            if (_local_2 !== _arg_1)
            {
                this._653073987idSlot26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot26", _local_2, _arg_1));
            };
        }

        public function ___SmallGameSpeedPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set idSlot24(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073989idSlot24;
            if (_local_2 !== _arg_1)
            {
                this._653073989idSlot24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot24", _local_2, _arg_1));
            };
        }

        private function onGetAwardAndReset(_arg_1:Boolean):void
        {
            _isPlaying = false;
            idGetAwardBtn.enabled = false;
            idStartGameBtn.enabled = true;
            if (!_arg_1)
            {
                _playTimes = (_winTimes + _lostTimes);
            };
            resetPlayData();
        }

        private function getAwardAndReset():void
        {
            _core.remote.call("getSmallGameAward", new Responder(onGetAwardAndReset), "speed");
        }

        public function set idSlot23(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073990idSlot23;
            if (_local_2 !== _arg_1)
            {
                this._653073990idSlot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot23", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:SmallGameSpeedPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SmallGameSpeedPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SmallGameSpeedPanelWatcherSetupUtil");
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
        public function get idSlot11():ItemSlotCreature
        {
            return (this._653074023idSlot11);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot13():ItemSlotCreature
        {
            return (this._653074021idSlot13);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot14():ItemSlotCreature
        {
            return (this._653074020idSlot14);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot16():ItemSlotCreature
        {
            return (this._653074018idSlot16);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot12():ItemSlotCreature
        {
            return (this._653074022idSlot12);
        }

        public function set idSlot29(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073984idSlot29;
            if (_local_2 !== _arg_1)
            {
                this._653073984idSlot29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot29", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot5():ItemSlotCreature
        {
            return (this._1641501084idSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot17():ItemSlotCreature
        {
            return (this._653074017idSlot17);
        }

        [Bindable(event="propertyChange")]
        public function get idLostTimes():BasicTxtButton
        {
            return (this._463521703idLostTimes);
        }

        public function set idSlot27(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073986idSlot27;
            if (_local_2 !== _arg_1)
            {
                this._653073986idSlot27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot27", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot15():ItemSlotCreature
        {
            return (this._653074019idSlot15);
        }

        public function set idSlot15(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074019idSlot15;
            if (_local_2 !== _arg_1)
            {
                this._653074019idSlot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot15", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot1():ItemSlotCreature
        {
            return (this._1641501080idSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot2():ItemSlotCreature
        {
            return (this._1641501081idSlot2);
        }

        public function set idSlot30(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073962idSlot30;
            if (_local_2 !== _arg_1)
            {
                this._653073962idSlot30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot30", _local_2, _arg_1));
            };
        }

        private function initSlotDisplay():void
        {
            var _local_2:String;
            var _local_3:Number;
            var _local_1:* = "";
            for (_local_2 in defineSlots)
            {
                _local_1 = defineSlots[_local_2];
                if (_local_1)
                {
                    _local_3 = slotIcons[_local_1];
                    if (_local_3)
                    {
                        setSlotData(Number(_local_2), _local_3);
                    };
                };
            };
            setSlotData(1, SMALL_GAME_START_ID);
            setSlotData(SMALL_GAME_SLOT_TOTAL_NUM, SMALL_GAME_END_ID);
        }

        public function set idSlot31(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073961idSlot31;
            if (_local_2 !== _arg_1)
            {
                this._653073961idSlot31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot31", _local_2, _arg_1));
            };
        }

        public function set idSlot35(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073957idSlot35;
            if (_local_2 !== _arg_1)
            {
                this._653073957idSlot35 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot35", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot10():ItemSlotCreature
        {
            return (this._653074024idSlot10);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot24():ItemSlotCreature
        {
            return (this._653073989idSlot24);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot26():ItemSlotCreature
        {
            return (this._653073987idSlot26);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot23():ItemSlotCreature
        {
            return (this._653073990idSlot23);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot18():ItemSlotCreature
        {
            return (this._653074016idSlot18);
        }

        private function decideWinner():void
        {
            _playTimes++;
            var _local_1:Boolean = ((_actionType == "my") ? true : false);
            _core.remote.call("saveSmallGame", new Responder(onSaveGame), "speed", _local_1);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot22():ItemSlotCreature
        {
            return (this._653073991idSlot22);
        }

        public function set idSlot37(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073955idSlot37;
            if (_local_2 !== _arg_1)
            {
                this._653073955idSlot37 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot37", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot25():ItemSlotCreature
        {
            return (this._653073988idSlot25);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot27():ItemSlotCreature
        {
            return (this._653073986idSlot27);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot20():ItemSlotCreature
        {
            return (this._653073993idSlot20);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot21():ItemSlotCreature
        {
            return (this._653073992idSlot21);
        }

        public function set idSlot28(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073985idSlot28;
            if (_local_2 !== _arg_1)
            {
                this._653073985idSlot28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot28", _local_2, _arg_1));
            };
        }

        private function stepToStep():void
        {
            if (stepHandler)
            {
                clearTimeout(stepHandler);
                stepHandler = 0;
            };
            var _local_1:Number = (_backForwardStep + ((_actionType == "my") ? _myStep : _pcStep));
            if (_local_1 > SMALL_GAME_SLOT_TOTAL_NUM)
            {
                _local_1 = SMALL_GAME_SLOT_TOTAL_NUM;
            };
            if (_local_1 < 1)
            {
                _local_1 = 1;
            };
            _prevStep = (_local_1 - _backForwardStep);
            _maxStep = ((_maxStep >= _local_1) ? _maxStep : _local_1);
            if (_actionType == "my")
            {
                _myStep = _local_1;
            }
            else
            {
                _pcStep = _local_1;
            };
            setStepStyle();
            stepAction();
        }

        private function checkGameStartBtn():void
        {
            idStartGameBtn.enabled = (((_playTimes < _playTotalTimes) && (!(_isPlaying))) ? true : false);
        }

        public function __idPlayBtn_click(_arg_1:MouseEvent):void
        {
            play();
        }

        [Bindable(event="propertyChange")]
        public function get idSlot29():ItemSlotCreature
        {
            return (this._653073984idSlot29);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot33():ItemSlotCreature
        {
            return (this._653073959idSlot33);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot30():ItemSlotCreature
        {
            return (this._653073962idSlot30);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot31():ItemSlotCreature
        {
            return (this._653073961idSlot31);
        }

        private function pcPlay():void
        {
            trace("pcPlay");
            if (roundHandler)
            {
                clearTimeout(roundHandler);
                roundHandler = 0;
            };
            _play();
        }

        [Bindable(event="propertyChange")]
        public function get idSlot3():ItemSlotCreature
        {
            return (this._1641501082idSlot3);
        }

        public function set idPlayBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1445731091idPlayBtn;
            if (_local_2 !== _arg_1)
            {
                this._1445731091idPlayBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idPlayBtn", _local_2, _arg_1));
            };
        }

        private function addPlayTime():void
        {
            if (_playTotalTimes >= SMALL_GAME_MAX_TIMES)
            {
                Alert.show(Language.SMALL_GAME_P[15]);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _playTotalTimes++;
                    _core.remote.call("addSmallGameTime", new Responder(onAddPlayTime), "speed");
                };
            };
            var showString:String = Language.SMALL_GAME_P[16].replace("{gold}", SMALL_GAME_ADD_TIME_COST);
            Alert.show(showString, "", (Alert.YES | Alert.NO), this, func);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot36():ItemSlotCreature
        {
            return (this._653073956idSlot36);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot37():ItemSlotCreature
        {
            return (this._653073955idSlot37);
        }

        public function set idSlot36(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073956idSlot36;
            if (_local_2 !== _arg_1)
            {
                this._653073956idSlot36 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot36", _local_2, _arg_1));
            };
        }

        private function _SmallGameSpeedPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SmallGameSpeedPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SmallGameSpeedPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTodayTimes.text = _arg_1;
            }, "idTodayTimes.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idWinTimes.text = _arg_1;
            }, "idWinTimes.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idLostTimes.text = _arg_1;
            }, "idLostTimes.text");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot1.slotType = _arg_1;
            }, "idSlot1.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot2.slotType = _arg_1;
            }, "idSlot2.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot3.slotType = _arg_1;
            }, "idSlot3.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot4.slotType = _arg_1;
            }, "idSlot4.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot5.slotType = _arg_1;
            }, "idSlot5.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot6.slotType = _arg_1;
            }, "idSlot6.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot7.slotType = _arg_1;
            }, "idSlot7.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot8.slotType = _arg_1;
            }, "idSlot8.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot9.slotType = _arg_1;
            }, "idSlot9.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot10.slotType = _arg_1;
            }, "idSlot10.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot11.slotType = _arg_1;
            }, "idSlot11.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot12.slotType = _arg_1;
            }, "idSlot12.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot13.slotType = _arg_1;
            }, "idSlot13.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot29.slotType = _arg_1;
            }, "idSlot29.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot28.slotType = _arg_1;
            }, "idSlot28.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot27.slotType = _arg_1;
            }, "idSlot27.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot21.slotType = _arg_1;
            }, "idSlot21.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot20.slotType = _arg_1;
            }, "idSlot20.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot19.slotType = _arg_1;
            }, "idSlot19.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot18.slotType = _arg_1;
            }, "idSlot18.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot17.slotType = _arg_1;
            }, "idSlot17.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot16.slotType = _arg_1;
            }, "idSlot16.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot15.slotType = _arg_1;
            }, "idSlot15.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot14.slotType = _arg_1;
            }, "idSlot14.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot30.slotType = _arg_1;
            }, "idSlot30.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot26.slotType = _arg_1;
            }, "idSlot26.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot22.slotType = _arg_1;
            }, "idSlot22.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot31.slotType = _arg_1;
            }, "idSlot31.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot25.slotType = _arg_1;
            }, "idSlot25.slotType");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot24.slotType = _arg_1;
            }, "idSlot24.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot23.slotType = _arg_1;
            }, "idSlot23.slotType");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot32.slotType = _arg_1;
            }, "idSlot32.slotType");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot45.slotType = _arg_1;
            }, "idSlot45.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot46.slotType = _arg_1;
            }, "idSlot46.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot47.slotType = _arg_1;
            }, "idSlot47.slotType");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot33.slotType = _arg_1;
            }, "idSlot33.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot34.slotType = _arg_1;
            }, "idSlot34.slotType");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot35.slotType = _arg_1;
            }, "idSlot35.slotType");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot36.slotType = _arg_1;
            }, "idSlot36.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot37.slotType = _arg_1;
            }, "idSlot37.slotType");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot38.slotType = _arg_1;
            }, "idSlot38.slotType");
            result[44] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot44.slotType = _arg_1;
            }, "idSlot44.slotType");
            result[45] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot48.slotType = _arg_1;
            }, "idSlot48.slotType");
            result[46] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot39.slotType = _arg_1;
            }, "idSlot39.slotType");
            result[47] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot40.slotType = _arg_1;
            }, "idSlot40.slotType");
            result[48] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot41.slotType = _arg_1;
            }, "idSlot41.slotType");
            result[49] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot42.slotType = _arg_1;
            }, "idSlot42.slotType");
            result[50] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot43.slotType = _arg_1;
            }, "idSlot43.slotType");
            result[51] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot49.slotType = _arg_1;
            }, "idSlot49.slotType");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idPlayBtn.label = _arg_1;
            }, "idPlayBtn.label");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idStartGameBtn.label = _arg_1;
            }, "idStartGameBtn.label");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idGetAwardBtn.label = _arg_1;
            }, "idGetAwardBtn.label");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SmallGameSpeedPanel_Button4.label = _arg_1;
            }, "_SmallGameSpeedPanel_Button4.label");
            result[56] = binding;
            return (result);
        }

        public function set idSlot32(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073960idSlot32;
            if (_local_2 !== _arg_1)
            {
                this._653073960idSlot32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot32", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot35():ItemSlotCreature
        {
            return (this._653073957idSlot35);
        }

        public function set idSlot25(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073988idSlot25;
            if (_local_2 !== _arg_1)
            {
                this._653073988idSlot25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot25", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot4():ItemSlotCreature
        {
            return (this._1641501083idSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot32():ItemSlotCreature
        {
            return (this._653073960idSlot32);
        }

        public function set idSlot40(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073931idSlot40;
            if (_local_2 !== _arg_1)
            {
                this._653073931idSlot40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot40", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot34():ItemSlotCreature
        {
            return (this._653073958idSlot34);
        }

        public function set idSlot41(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073930idSlot41;
            if (_local_2 !== _arg_1)
            {
                this._653073930idSlot41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot41", _local_2, _arg_1));
            };
        }

        public function set idSlot45(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073926idSlot45;
            if (_local_2 !== _arg_1)
            {
                this._653073926idSlot45 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot45", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot19():ItemSlotCreature
        {
            return (this._653074015idSlot19);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot28():ItemSlotCreature
        {
            return (this._653073985idSlot28);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot44():ItemSlotCreature
        {
            return (this._653073927idSlot44);
        }

        public function set idSlot34(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653073958idSlot34;
            if (_local_2 !== _arg_1)
            {
                this._653073958idSlot34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot34", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSlot46():ItemSlotCreature
        {
            return (this._653073925idSlot46);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot41():ItemSlotCreature
        {
            return (this._653073930idSlot41);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot43():ItemSlotCreature
        {
            return (this._653073928idSlot43);
        }


    }
}//package com.qeedoo.ui.view.compDragable

