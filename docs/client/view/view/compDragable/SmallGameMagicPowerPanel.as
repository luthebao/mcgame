// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SmallGameMagicPowerPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlotCreature;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.containers.Tile;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.FlexEvent;
    import flash.net.Responder;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.Binding;
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

    public class SmallGameMagicPowerPanel extends DragableCanvas implements IBindingClient 
    {

        private static const SMALL_GAME_MAX_TIMES:int = 8;
        private static const SMALL_GAME_ADD_TIME_COST:int = 7;
        private static const SMALL_GAME_REDUCE_TIMES:int = 5;
        private static const SMALL_GAME_FLOAT_AREA:Number = 30;
        private static const SMALL_GAME_SLOT_TOTAL_NUM:int = 8;
        private static const SMALL_GAME_SLOT_DISPLAY_NUM:int = 16;
        private static var TREASURE_ICON:Number = 4130220000206;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1641501082idSlot3:ItemSlotCreature;
        private var _1729326123idSysStoneWeight:BasicTxtButton;
        private var _1800403608idSysSlot8:ItemSlotCreature;
        public var _SmallGameMagicPowerPanel_Button6:Button;
        private var _896883712idTodayTimes:BasicTxtButton;
        private var _2139993087idReduceSlot:ItemSlotCreature;
        private var _isPlaying:Boolean = false;
        private var _winTimes:int = 0;
        private var _463521703idLostTimes:BasicTxtButton;
        private var _1800403611idSysSlot5:ItemSlotCreature;
        private var _832944829idAddPowerBtn:Button;
        private var _1641501080idSlot1:ItemSlotCreature;
        private var _1302135960idReducePowerBtn:Button;
        private var _1641501087idSlot8:ItemSlotCreature;
        private var _1800403614idSysSlot2:ItemSlotCreature;
        private var _653074019idSlot15:ItemSlotCreature;
        private var _reduceSlotId:Number = 3875;
        private var winOrLost:Boolean = false;
        private var _1641501085idSlot6:ItemSlotCreature;
        private var _653074022idSlot12:ItemSlotCreature;
        private var _653074020idSlot14:ItemSlotCreature;
        public var _SmallGameMagicPowerPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1800403609idSysSlot7:ItemSlotCreature;
        private var _playTotalTimes:int = 3;
        private var _653074024idSlot10:ItemSlotCreature;
        private var _reduceStone:Number = 0;
        private var _1641501083idSlot4:ItemSlotCreature;
        private var _1800403612idSysSlot4:ItemSlotCreature;
        private var _playTimes:int = 0;
        public var _SmallGameMagicPowerPanel_Image1:Image;
        private var _lostTimes:int = 0;
        private var _1443719346idSaveGameBtn:Button;
        private var _1641501081idSlot2:ItemSlotCreature;
        private var _1800403615idSysSlot1:ItemSlotCreature;
        private var _1641501088idSlot9:ItemSlotCreature;
        private var _581600507idWinTimes:BasicTxtButton;
        private var _985338109idStartGameBtn:Button;
        private var _1800403610idSysSlot6:ItemSlotCreature;
        private var _1641501086idSlot7:ItemSlotCreature;
        private var _1404615706idGetAwardBtn:Button;
        private var _653074018idSlot16:ItemSlotCreature;
        private var _1800403613idSysSlot3:ItemSlotCreature;
        private var _653074021idSlot13:ItemSlotCreature;
        private var _systemStone:Number = 0;
        private var _238328048idCurrStoneWeight:BasicTxtButton;
        private var _reduceTimes:int = 0;
        private var _1641501084idSlot5:ItemSlotCreature;
        private var _currStone:Number = 0;
        private var _653074023idSlot11:ItemSlotCreature;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":380,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SmallGameMagicPowerPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":21,
                                "y":58,
                                "width":93,
                                "height":176,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":10,
                                            "width":76,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSysSlot1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"sourceGroup":true});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSysSlot2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"sourceGroup":true});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":50,
                                            "width":76,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSysSlot3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"sourceGroup":true});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSysSlot4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"sourceGroup":true});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":90,
                                            "width":76,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSysSlot5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"sourceGroup":true});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSysSlot6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"sourceGroup":true});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":130,
                                            "width":76,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSysSlot7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"sourceGroup":true});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSysSlot8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"sourceGroup":true});
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
                                "x":10,
                                "y":240,
                                "width":113,
                                "height":77,
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
                                            "x":10,
                                            "y":10,
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
                                            "x":10,
                                            "y":30,
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
                                            "x":10,
                                            "y":50,
                                            "width":100
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
                                "x":142,
                                "y":58,
                                "width":180,
                                "height":200,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idCurrStoneWeight",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "10";
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"",
                                            "width":110
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":7,
                                            "y":35,
                                            "width":162,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot1",
                                                "events":{"click":"__idSlot1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot2",
                                                "events":{"click":"__idSlot2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot3",
                                                "events":{"click":"__idSlot3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot4",
                                                "events":{"click":"__idSlot4_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":7,
                                            "y":75,
                                            "width":162,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot5",
                                                "events":{"click":"__idSlot5_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot6",
                                                "events":{"click":"__idSlot6_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot7",
                                                "events":{"click":"__idSlot7_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot8",
                                                "events":{"click":"__idSlot8_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":7,
                                            "y":115,
                                            "width":162,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot9",
                                                "events":{"click":"__idSlot9_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot10",
                                                "events":{"click":"__idSlot10_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot11",
                                                "events":{"click":"__idSlot11_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot12",
                                                "events":{"click":"__idSlot12_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":7,
                                            "y":155,
                                            "width":162,
                                            "height":36,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot13",
                                                "events":{"click":"__idSlot13_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot14",
                                                "events":{"click":"__idSlot14_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot15",
                                                "events":{"click":"__idSlot15_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotCreature,
                                                "id":"idSlot16",
                                                "events":{"click":"__idSlot16_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"enabled":false});
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"idAddPowerBtn",
                        "events":{"click":"__idAddPowerBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "enabled":false,
                                "styleName":"BtnStdRed",
                                "x":153,
                                "y":270,
                                "width":70
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"idSaveGameBtn",
                        "events":{"click":"__idSaveGameBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "enabled":false,
                                "styleName":"BtnStdRed",
                                "x":242,
                                "y":270,
                                "width":70
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":360,
                                "y":58,
                                "width":130,
                                "height":200,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_SmallGameMagicPowerPanel_Image1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "10";
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":80,
                                            "height":75,
                                            "useHandCursor":false,
                                            "buttonMode":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"idSysStoneWeight",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "88";
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"0",
                                            "width":35
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotCreature,
                                    "id":"idReduceSlot",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "123";
                                        this.horizontalCenter = "0";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"movable":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"idReducePowerBtn",
                                    "events":{"click":"__idReducePowerBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "163";
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "width":60
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"idStartGameBtn",
                        "events":{"click":"__idStartGameBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":100,
                                "y":340,
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
                                "x":200,
                                "y":340,
                                "enabled":false,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_SmallGameMagicPowerPanel_Button6",
                        "events":{"click":"___SmallGameMagicPowerPanel_Button6_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":300,
                                "y":340,
                                "styleName":"BtnStdRed",
                                "width":80
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _slotIds:Array = [3867, 3868, 3869, 3870, 3871, 3872, 3873, 3874];
        private var _stoneSlots:Object = {
            "3867":{
                "min":1,
                "max":5
            },
            "3868":{
                "min":6,
                "max":10
            },
            "3869":{
                "min":11,
                "max":30
            },
            "3870":{
                "min":31,
                "max":50
            },
            "3871":{
                "min":51,
                "max":100
            },
            "3872":{
                "min":101,
                "max":199
            },
            "3873":{
                "min":200,
                "max":499
            },
            "3874":{
                "min":500,
                "max":999
            }
        };
        private var _sysRandStoneRange:Object = {
            "min":2000,
            "max":3500
        };
        private var _reduceStoneRange:Object = {
            "min":100,
            "max":199
        };
        private var _currSlotWeight:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SmallGameMagicPowerPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 380;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___SmallGameMagicPowerPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SmallGameMagicPowerPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get idTodayTimes():BasicTxtButton
        {
            return (this._896883712idTodayTimes);
        }

        public function __idSlot10_click(_arg_1:MouseEvent):void
        {
            eraseSlot(10);
        }

        public function __idSlot4_click(_arg_1:MouseEvent):void
        {
            eraseSlot(4);
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

        public function set idWinTimes(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._581600507idWinTimes;
            if (_local_2 !== _arg_1)
            {
                this._581600507idWinTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idWinTimes", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idGetAwardBtn():Button
        {
            return (this._1404615706idGetAwardBtn);
        }

        public function onSaveGame(_arg_1:Object):void
        {
            _isPlaying = false;
            var _local_2:String = ((_arg_1.flag) ? Language.SMALL_GAME_P[13] : Language.SMALL_GAME_P[14]);
            winOrLost = ((_arg_1.flag) ? true : false);
            if (winOrLost)
            {
                idGetAwardBtn.enabled = true;
            };
            resetCurrStoneWeight(_currStone.toString());
            if (_playTimes < _playTotalTimes)
            {
                idStartGameBtn.enabled = true;
            };
            _core.sysMsg(_local_2);
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

        public function set idCurrStoneWeight(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._238328048idCurrStoneWeight;
            if (_local_2 !== _arg_1)
            {
                this._238328048idCurrStoneWeight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idCurrStoneWeight", _local_2, _arg_1));
            };
        }

        private function resetSlotList(_arg_1:Boolean):void
        {
            var _local_2:int = 1;
            while (_local_2 <= SMALL_GAME_SLOT_DISPLAY_NUM)
            {
                this[("idSlot" + _local_2)].clean();
                this[("idSlot" + _local_2)].enabled = _arg_1;
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSysStoneWeight():BasicTxtButton
        {
            return (this._1729326123idSysStoneWeight);
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

        public function __idSlot1_click(_arg_1:MouseEvent):void
        {
            eraseSlot(1);
        }

        public function __idSlot15_click(_arg_1:MouseEvent):void
        {
            eraseSlot(15);
        }

        public function __idSlot9_click(_arg_1:MouseEvent):void
        {
            eraseSlot(9);
        }

        public function set idSysStoneWeight(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1729326123idSysStoneWeight;
            if (_local_2 !== _arg_1)
            {
                this._1729326123idSysStoneWeight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSysStoneWeight", _local_2, _arg_1));
            };
        }

        private function resetCurrStoneWeight(_arg_1:String):void
        {
            idCurrStoneWeight.text = (Language.SMALL_GAME_P[35] + _arg_1);
        }

        private function compareStone():Boolean
        {
            calculateStone();
            trace(((((((("_systemStone : " + _systemStone) + " -- ") + _currStone) + " -- ") + (_systemStone + SMALL_GAME_FLOAT_AREA)) + " -- ") + (_systemStone - SMALL_GAME_FLOAT_AREA)));
            return (((_currStone <= (_systemStone + SMALL_GAME_FLOAT_AREA)) && (_currStone >= (_systemStone - SMALL_GAME_FLOAT_AREA))) ? true : false);
        }

        private function displaySysStone():void
        {
            _systemStone = Math.round(ToolKit.genRangeRandom(_sysRandStoneRange.min, _sysRandStoneRange.max));
            idSysStoneWeight.text = String(_systemStone);
        }

        public function onAddPlayTime(_arg_1:Boolean):void
        {
            if (!_arg_1)
            {
                _playTotalTimes--;
            };
            resetPlayData();
            checkGameStartBtn();
        }

        public function __idSlot6_click(_arg_1:MouseEvent):void
        {
            eraseSlot(6);
        }

        private function _SmallGameMagicPowerPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SMALL_GAME_P[3];
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Slot.SLOT_JEWEL;
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
            _local_1 = Language.SMALL_GAME_P[36];
            _local_1 = Language.SMALL_GAME_P[37];
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(TREASURE_ICON));
            _local_1 = Slot.SLOT_JEWEL;
            _local_1 = Language.SMALL_GAME_P[38];
            _local_1 = Language.SMALL_GAME_P[8];
            _local_1 = Language.SMALL_GAME_P[10];
            _local_1 = Language.SMALL_GAME_P[7];
        }

        public function __idSlot12_click(_arg_1:MouseEvent):void
        {
            eraseSlot(12);
        }

        private function initProp(_arg_1:Boolean):void
        {
            _systemStone = 0;
            _currStone = 0;
            _reduceStone = 0;
            _reduceTimes = SMALL_GAME_REDUCE_TIMES;
            if (_arg_1)
            {
                idStartGameBtn.enabled = false;
                idReducePowerBtn.enabled = true;
                idAddPowerBtn.enabled = true;
                idSaveGameBtn.enabled = true;
            }
            else
            {
                winOrLost = false;
                _isPlaying = false;
                idAddPowerBtn.enabled = false;
                idSaveGameBtn.enabled = false;
                idReducePowerBtn.enabled = false;
                idSysStoneWeight.text = "";
            };
            idGetAwardBtn.enabled = false;
        }

        [Bindable(event="propertyChange")]
        public function get idReducePowerBtn():Button
        {
            return (this._1302135960idReducePowerBtn);
        }

        private function calculateStone():void
        {
            _currStone = 0;
            var _local_1:int;
            while (_local_1 < SMALL_GAME_SLOT_DISPLAY_NUM)
            {
                _currStone = (_currStone + Number(_currSlotWeight[_local_1]));
                _local_1++;
            };
            _currStone = (_currStone - Number(_reduceStone));
            if (_currStone < 0)
            {
                _currStone = 0;
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSaveGameBtn():Button
        {
            return (this._1443719346idSaveGameBtn);
        }

        [Bindable(event="propertyChange")]
        public function get idAddPowerBtn():Button
        {
            return (this._832944829idAddPowerBtn);
        }

        private function refreshCurrStone():void
        {
            var _local_1:* = "";
            calculateStone();
            _local_1 = _currStone.toString();
            if (Number(_currStone) >= 2000)
            {
                _local_1 = (_currStone.toString().substr(0, 2) + "**");
            }
            else
            {
                if (Number(_currStone) >= 1000)
                {
                    _local_1 = (_currStone.toString().substr(0, 3) + "*");
                };
            };
            resetCurrStoneWeight(_local_1);
        }

        public function __idSlot3_click(_arg_1:MouseEvent):void
        {
            eraseSlot(3);
        }

        public function set idSysSlot2(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1800403614idSysSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1800403614idSysSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSysSlot2", _local_2, _arg_1));
            };
        }

        public function set idSysSlot3(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1800403613idSysSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1800403613idSysSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSysSlot3", _local_2, _arg_1));
            };
        }

        public function set idSysSlot4(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1800403612idSysSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1800403612idSysSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSysSlot4", _local_2, _arg_1));
            };
        }

        public function set idSysSlot1(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1800403615idSysSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1800403615idSysSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSysSlot1", _local_2, _arg_1));
            };
        }

        public function set idSysSlot6(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1800403610idSysSlot6;
            if (_local_2 !== _arg_1)
            {
                this._1800403610idSysSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSysSlot6", _local_2, _arg_1));
            };
        }

        public function set idSysSlot7(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1800403609idSysSlot7;
            if (_local_2 !== _arg_1)
            {
                this._1800403609idSysSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSysSlot7", _local_2, _arg_1));
            };
        }

        public function set idSysSlot8(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1800403608idSysSlot8;
            if (_local_2 !== _arg_1)
            {
                this._1800403608idSysSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSysSlot8", _local_2, _arg_1));
            };
        }

        public function set idSysSlot5(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1800403611idSysSlot5;
            if (_local_2 !== _arg_1)
            {
                this._1800403611idSysSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSysSlot5", _local_2, _arg_1));
            };
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
            initSlotWeight();
            initSlotList();
            resetCurrStoneWeight("0");
            _core.remote.call("getSmallGameStatus", new Responder(onGetSmallGameStatus), "magicPower");
        }

        private function addPower():void
        {
            var docObj:Object;
            docObj = this;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:String;
                var _local_3:int;
                var _local_4:Number;
                var _local_5:Object;
                var _local_6:Number;
                if (_arg_1.detail == Alert.YES)
                {
                    _local_2 = "";
                    _local_3 = 1;
                    while (_local_3 <= SMALL_GAME_SLOT_DISPLAY_NUM)
                    {
                        if (Number(_currSlotWeight[(_local_3 - 1)]) <= 0)
                        {
                            _local_2 = ("idSlot" + _local_3);
                            _local_4 = (((docObj.hasOwnProperty(_local_2)) && (docObj[_local_2].giid)) ? docObj[_local_2].giid : 0);
                            if (!((!(_local_4)) || (_local_4 < 0)))
                            {
                                _local_5 = _stoneSlots[_local_4];
                                _local_6 = Math.round(ToolKit.genRangeRandom(_local_5.min, _local_5.max));
                                _currSlotWeight[(_local_3 - 1)] = _local_6;
                                docObj[("idSlot" + _local_3)].enabled = false;
                            };
                        };
                        _local_3++;
                    };
                    refreshCurrStone();
                };
            };
            Alert.show(Language.SMALL_GAME_P[40], "", (Alert.YES | Alert.NO), this, func);
        }

        private function initSlotList():void
        {
            var _local_1:Object = new Object();
            var _local_2:int = 1;
            var _local_3:int = _slotIds.length;
            var _local_4:* = "";
            while (_local_2 <= _local_3)
            {
                _local_4 = _slotIds[(_local_2 - 1)];
                _local_1 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_4];
                this[("idSysSlot" + _local_2)].type = GamePredef.TBL_ITEM_TEMPLATE;
                this[("idSysSlot" + _local_2)].giid = _local_1.id;
                this[("idSysSlot" + _local_2)].slotData = _local_1;
                this[("idSysSlot" + _local_2)].stackNum = 1;
                _local_2++;
            };
            _local_1 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_reduceSlotId];
            this["idReduceSlot"].type = GamePredef.TBL_ITEM_TEMPLATE;
            this["idReduceSlot"].giid = _local_1.id;
            this["idReduceSlot"].slotData = _local_1;
            this["idReduceSlot"].stackNum = _reduceTimes;
        }

        private function onGetSmallGameStatus(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1.state)
            {
                _playTimes = _arg_1.playTimes;
                _playTotalTimes = _arg_1.playTotalTimes;
                _winTimes = _arg_1.winTimes;
                _lostTimes = _arg_1.lostTimes;
                _local_2 = _arg_1.awardFlag;
                resetPlayData();
                checkGameStartBtn();
                if (((_winTimes) && (_winTimes > _local_2)))
                {
                    idStartGameBtn.enabled = false;
                    idGetAwardBtn.enabled = true;
                    winOrLost = true;
                    _isPlaying = true;
                };
                if (((!(idStartGameBtn.enabled)) && (_playTimes < _playTotalTimes)))
                {
                    idGetAwardBtn.enabled = true;
                };
            };
        }

        public function __idReducePowerBtn_click(_arg_1:MouseEvent):void
        {
            reducePower();
        }

        public function __idSlot14_click(_arg_1:MouseEvent):void
        {
            eraseSlot(14);
        }

        public function __idSlot8_click(_arg_1:MouseEvent):void
        {
            eraseSlot(8);
        }

        [Bindable(event="propertyChange")]
        public function get idWinTimes():BasicTxtButton
        {
            return (this._581600507idWinTimes);
        }

        private function saveGame():void
        {
            if (_playTimes >= _playTotalTimes)
            {
                _core.sysMsg(Language.SMALL_GAME_P[24]);
                idAddPowerBtn.enabled = false;
                idSaveGameBtn.enabled = false;
                idReducePowerBtn.enabled = false;
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:Boolean;
                if (_arg_1.detail == Alert.YES)
                {
                    idReducePowerBtn.enabled = false;
                    idAddPowerBtn.enabled = false;
                    idSaveGameBtn.enabled = false;
                    _local_2 = compareStone();
                    _playTimes++;
                    if (_local_2)
                    {
                        _winTimes++;
                    }
                    else
                    {
                        _lostTimes++;
                    };
                    resetPlayData();
                    _core.remote.call("saveSmallGame", new Responder(onSaveGame), "magicPower", _local_2);
                    idSaveGameBtn.enabled = false;
                };
            };
            Alert.show(Language.SMALL_GAME_P[41], "", (Alert.YES | Alert.NO), this, func);
        }

        private function init():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get idCurrStoneWeight():BasicTxtButton
        {
            return (this._238328048idCurrStoneWeight);
        }

        public function __idStartGameBtn_click(_arg_1:MouseEvent):void
        {
            startGame();
        }

        public function set idReducePowerBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1302135960idReducePowerBtn;
            if (_local_2 !== _arg_1)
            {
                this._1302135960idReducePowerBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idReducePowerBtn", _local_2, _arg_1));
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

        public function set idSlot12(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074022idSlot12;
            if (_local_2 !== _arg_1)
            {
                this._653074022idSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot12", _local_2, _arg_1));
            };
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

        public function set idSlot14(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074020idSlot14;
            if (_local_2 !== _arg_1)
            {
                this._653074020idSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot14", _local_2, _arg_1));
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

        public function set idSlot3(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501082idSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1641501082idSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot3", _local_2, _arg_1));
            };
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

        public function set idSlot8(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501087idSlot8;
            if (_local_2 !== _arg_1)
            {
                this._1641501087idSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot8", _local_2, _arg_1));
            };
        }

        private function reducePower():void
        {
            var docObj:Object;
            var func:Function;
            docObj = this;
            if (_reduceTimes > 0)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    var _local_2:Number;
                    if (_arg_1.detail == Alert.YES)
                    {
                        _reduceTimes--;
                        docObj["idReduceSlot"].stackNum = _reduceTimes;
                        _local_2 = Math.round(ToolKit.genRangeRandom(_reduceStoneRange.min, _reduceStoneRange.max));
                        _reduceStone = (_reduceStone + _local_2);
                        if (_reduceStone > _currStone)
                        {
                            _reduceStone = _currStone;
                        };
                        refreshCurrStone();
                        if (_reduceTimes <= 0)
                        {
                            resetReduceValid(false);
                        };
                    };
                };
                Alert.show(Language.SMALL_GAME_P[39], "", (Alert.YES | Alert.NO), this, func);
            }
            else
            {
                resetReduceValid(false);
                _core.sysMsg(Language.SMALL_GAME_P[39]);
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

        public function __idSlot11_click(_arg_1:MouseEvent):void
        {
            eraseSlot(11);
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

        public function set idSlot10(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._653074024idSlot10;
            if (_local_2 !== _arg_1)
            {
                this._653074024idSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot10", _local_2, _arg_1));
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

        public function __idSlot5_click(_arg_1:MouseEvent):void
        {
            eraseSlot(5);
        }

        private function initSlotWeight():void
        {
            _currSlotWeight = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
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

        private function _SmallGameMagicPowerPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SmallGameMagicPowerPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SmallGameMagicPowerPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSysSlot1.slotType = _arg_1;
            }, "idSysSlot1.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSysSlot2.slotType = _arg_1;
            }, "idSysSlot2.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSysSlot3.slotType = _arg_1;
            }, "idSysSlot3.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSysSlot4.slotType = _arg_1;
            }, "idSysSlot4.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSysSlot5.slotType = _arg_1;
            }, "idSysSlot5.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSysSlot6.slotType = _arg_1;
            }, "idSysSlot6.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSysSlot7.slotType = _arg_1;
            }, "idSysSlot7.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSysSlot8.slotType = _arg_1;
            }, "idSysSlot8.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTodayTimes.text = _arg_1;
            }, "idTodayTimes.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idWinTimes.text = _arg_1;
            }, "idWinTimes.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idLostTimes.text = _arg_1;
            }, "idLostTimes.text");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot1.slotType = _arg_1;
            }, "idSlot1.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot2.slotType = _arg_1;
            }, "idSlot2.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot3.slotType = _arg_1;
            }, "idSlot3.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot4.slotType = _arg_1;
            }, "idSlot4.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot5.slotType = _arg_1;
            }, "idSlot5.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot6.slotType = _arg_1;
            }, "idSlot6.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot7.slotType = _arg_1;
            }, "idSlot7.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot8.slotType = _arg_1;
            }, "idSlot8.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot9.slotType = _arg_1;
            }, "idSlot9.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot10.slotType = _arg_1;
            }, "idSlot10.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot11.slotType = _arg_1;
            }, "idSlot11.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot12.slotType = _arg_1;
            }, "idSlot12.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot13.slotType = _arg_1;
            }, "idSlot13.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idSlot14.slotType = _arg_1;
            }, "idSlot14.slotType");
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
                idSlot16.slotType = _arg_1;
            }, "idSlot16.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idAddPowerBtn.label = _arg_1;
            }, "idAddPowerBtn.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idSaveGameBtn.label = _arg_1;
            }, "idSaveGameBtn.label");
            result[29] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(TREASURE_ICON)));
            }, function (_arg_1:Object):void
            {
                _SmallGameMagicPowerPanel_Image1.source = _arg_1;
            }, "_SmallGameMagicPowerPanel_Image1.source");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                idReduceSlot.slotType = _arg_1;
            }, "idReduceSlot.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idReducePowerBtn.label = _arg_1;
            }, "idReducePowerBtn.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idStartGameBtn.label = _arg_1;
            }, "idStartGameBtn.label");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idGetAwardBtn.label = _arg_1;
            }, "idGetAwardBtn.label");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SMALL_GAME_P[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SmallGameMagicPowerPanel_Button6.label = _arg_1;
            }, "_SmallGameMagicPowerPanel_Button6.label");
            result[35] = binding;
            return (result);
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
        public function get idStartGameBtn():Button
        {
            return (this._985338109idStartGameBtn);
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

        public function set idSlot7(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._1641501086idSlot7;
            if (_local_2 !== _arg_1)
            {
                this._1641501086idSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSlot7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSysSlot1():ItemSlotCreature
        {
            return (this._1800403615idSysSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get idSysSlot2():ItemSlotCreature
        {
            return (this._1800403614idSysSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get idSysSlot3():ItemSlotCreature
        {
            return (this._1800403613idSysSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get idSysSlot5():ItemSlotCreature
        {
            return (this._1800403611idSysSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get idSysSlot6():ItemSlotCreature
        {
            return (this._1800403610idSysSlot6);
        }

        private function resetReduceValid(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                idReducePowerBtn.enabled = true;
                _reduceTimes = SMALL_GAME_REDUCE_TIMES;
                this["idReduceSlot"].stackNum = _reduceTimes;
            }
            else
            {
                idReducePowerBtn.enabled = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSysSlot8():ItemSlotCreature
        {
            return (this._1800403608idSysSlot8);
        }

        private function resetPlayData():void
        {
            idTodayTimes.text = (((Language.SMALL_GAME_P[4] + _playTimes) + "/") + _playTotalTimes);
            idWinTimes.text = (Language.SMALL_GAME_P[5] + _winTimes);
            idLostTimes.text = (Language.SMALL_GAME_P[6] + _lostTimes);
        }

        private function startGame():void
        {
            initProp(true);
            if (((_playTimes < _playTotalTimes) && (!(_isPlaying))))
            {
                trace("startGame");
                _isPlaying = true;
                resetReduceValid(true);
                initSlotWeight();
                resetSlotList(false);
                displaySysStone();
                resetSlotList(true);
                resetCurrStoneWeight("0");
            }
            else
            {
                _core.sysMsg(Language.SMALL_GAME_P[24]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get idSysSlot7():ItemSlotCreature
        {
            return (this._1800403609idSysSlot7);
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
            initSlotWeight();
        }

        private function getAwardAndReset():void
        {
            if (winOrLost)
            {
                _core.remote.call("getSmallGameAward", new Responder(onGetAwardAndReset), "magicPower");
            }
            else
            {
                onGetAwardAndReset(true);
            };
        }

        public function ___SmallGameMagicPowerPanel_Button6_click(_arg_1:MouseEvent):void
        {
            addPlayTime();
        }

        public function set idAddPowerBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._832944829idAddPowerBtn;
            if (_local_2 !== _arg_1)
            {
                this._832944829idAddPowerBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idAddPowerBtn", _local_2, _arg_1));
            };
        }

        public function __idSlot16_click(_arg_1:MouseEvent):void
        {
            eraseSlot(16);
        }

        public function __idSlot2_click(_arg_1:MouseEvent):void
        {
            eraseSlot(2);
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

        override public function initialize():void
        {
            var target:SmallGameMagicPowerPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SmallGameMagicPowerPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SmallGameMagicPowerPanelWatcherSetupUtil");
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
        public function get idSlot10():ItemSlotCreature
        {
            return (this._653074024idSlot10);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot11():ItemSlotCreature
        {
            return (this._653074023idSlot11);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot12():ItemSlotCreature
        {
            return (this._653074022idSlot12);
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
        public function get idSlot2():ItemSlotCreature
        {
            return (this._1641501081idSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot3():ItemSlotCreature
        {
            return (this._1641501082idSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot4():ItemSlotCreature
        {
            return (this._1641501083idSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot5():ItemSlotCreature
        {
            return (this._1641501084idSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot15():ItemSlotCreature
        {
            return (this._653074019idSlot15);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot7():ItemSlotCreature
        {
            return (this._1641501086idSlot7);
        }

        public function __idAddPowerBtn_click(_arg_1:MouseEvent):void
        {
            addPower();
        }

        [Bindable(event="propertyChange")]
        public function get idLostTimes():BasicTxtButton
        {
            return (this._463521703idLostTimes);
        }

        [Bindable(event="propertyChange")]
        public function get idSlot6():ItemSlotCreature
        {
            return (this._1641501085idSlot6);
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

        [Bindable(event="propertyChange")]
        public function get idSlot1():ItemSlotCreature
        {
            return (this._1641501080idSlot1);
        }

        public function set idSaveGameBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1443719346idSaveGameBtn;
            if (_local_2 !== _arg_1)
            {
                this._1443719346idSaveGameBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSaveGameBtn", _local_2, _arg_1));
            };
        }

        private function eraseSlot(_arg_1:Number):void
        {
            if (Number(_currSlotWeight[(_arg_1 - 1)]) > 0)
            {
                _core.sysMsg(Language.SMALL_GAME_P[42]);
            }
            else
            {
                this[("idSlot" + _arg_1)].clean();
            };
        }

        public function __idSlot7_click(_arg_1:MouseEvent):void
        {
            eraseSlot(7);
        }

        public function __idSlot13_click(_arg_1:MouseEvent):void
        {
            eraseSlot(13);
        }

        [Bindable(event="propertyChange")]
        public function get idSysSlot4():ItemSlotCreature
        {
            return (this._1800403612idSysSlot4);
        }

        private function checkGameStartBtn():void
        {
            idStartGameBtn.enabled = (((_playTimes < _playTotalTimes) && (!(_isPlaying))) ? true : false);
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
                    _core.remote.call("addSmallGameTime", new Responder(onAddPlayTime), "magicPower");
                };
            };
            var showString:String = Language.SMALL_GAME_P[16].replace("{gold}", SMALL_GAME_ADD_TIME_COST);
            Alert.show(showString, "", (Alert.YES | Alert.NO), this, func);
        }

        public function __idSaveGameBtn_click(_arg_1:MouseEvent):void
        {
            saveGame();
        }

        public function ___SmallGameMagicPowerPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set idReduceSlot(_arg_1:ItemSlotCreature):void
        {
            var _local_2:Object = this._2139993087idReduceSlot;
            if (_local_2 !== _arg_1)
            {
                this._2139993087idReduceSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idReduceSlot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idReduceSlot():ItemSlotCreature
        {
            return (this._2139993087idReduceSlot);
        }


    }
}//package com.qeedoo.ui.view.compDragable

