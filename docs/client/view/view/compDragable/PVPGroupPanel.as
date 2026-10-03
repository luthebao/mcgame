// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PVPGroupPanel

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.Label;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import flash.display.MovieClip;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Button;
    import mx.core.UIComponent;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import mx.core.IUITextField;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.net.Responder;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.data.GameData;
    import mx.formatters.DateFormatter;
    import flash.utils.getDefinitionByName;
    import flash.events.Event;
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

    public class PVPGroupPanel extends Canvas implements IBindingClient 
    {

        public static const PVP_GROUP_LEADER:Class = PVPGroupPanel_PVP_GROUP_LEADER;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _memberId2:Number = -1;
        private var _isStart:Boolean = false;
        private var _110256292text1:BasicTxtButton;
        private var _966299094nameLabel3:BasicTxtButton;
        public var _PVPGroupPanel_Label11:Label;
        public var _PVPGroupPanel_Label13:Label;
        public var _PVPGroupPanel_Label15:Label;
        public var _PVPGroupPanel_Label16:Label;
        public var _PVPGroupPanel_Label17:Label;
        public var _PVPGroupPanel_Label19:Label;
        public var _PVPGroupPanel_Label18:Label;
        private var _1215933662passText:TextInput;
        private var _1052640327mianCan:Canvas;
        private var _1660738733leaveBtn2:BasicGlowButton;
        private var _alert:Alert;
        private var _3560141time:Label;
        private var _1563243619levelLabel3:BasicTxtButton;
        private var _1495073604myPoint:Label;
        private var _1468352367_point:Number = 0;
        private var _110256293text2:BasicTxtButton;
        private var _1164631201limitBtn:DelayButton;
        private var _339356173showBtn2:BasicGlowButton;
        private var _2096007741targetShow1:CharactorShowCanvas;
        private var pvpLeader:MovieClip;
        private var _966299095nameLabel2:BasicTxtButton;
        private var _state1:Boolean = true;
        private var _1779038604ns_minLevel:NumericStepper;
        private var _state3:Boolean = false;
        private var _2053377414battleInfo:IntroText;
        private var _state2:Boolean = false;
        private var _91052262_left:String = "00:00";
        private var _pass:String = "";
        private var _934978833ready2:Label;
        private var _91227403_rank:Number = 0;
        private var _1563243618levelLabel2:BasicTxtButton;
        private var _1482970924myClass:Label;
        private var _1060223401myName:Label;
        private var _2096007739targetShow3:CharactorShowCanvas;
        public var _PVPGroupPanel_Button2:Button;
        private var _110256294text3:BasicTxtButton;
        private var _leaderId:Number = -1;
        private var _2096007740targetShow2:CharactorShowCanvas;
        private var _1660738734leaveBtn3:BasicGlowButton;
        private var _1783151733_roomId:Number = -1;
        public var _PVPGroupPanel_Label4:Label;
        public var _PVPGroupPanel_Label7:Label;
        public var _PVPGroupPanel_Label9:Label;
        public var _PVPGroupPanel_Label5:Label;
        private var _1191054357leaderFlag:UIComponent;
        private var _966299096nameLabel1:BasicTxtButton;
        private var _934534946reqBtn:DelayButton;
        private var _986490709_resultStr:String = "";
        private var _minLevel:Number = 0;
        private var _timeGo:Number = 0;
        private var _1563243617levelLabel1:BasicTxtButton;
        private var _339356172showBtn3:BasicGlowButton;
        private var _347234980backImg:Image;
        private var _934978832ready3:Label;
        private var _1060104200myRank:Label;
        private var _339356174showBtn1:BasicGlowButton;
        private var _maxLevel:Number = 0;
        private var _1491093816myLevel:Label;
        private var _1396206073batBtn:DelayButton;
        private var _739732038ns_maxLevel:NumericStepper;
        private var _memberId3:Number = -1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"backImg",
                        "events":{"creationComplete":"__backImg_creationComplete"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":1050,
                                "height":665
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"mianCan",
                        "events":{"creationComplete":"__mianCan_creationComplete"},
                        "stylesFactory":function ():void
                        {
                            this.borderColor = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":900,
                                "height":570,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":273,
                                            "y":341,
                                            "width":130,
                                            "height":145,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"targetShow1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":115,
                                                        "height":20,
                                                        "width":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":UIComponent,
                                                "id":"leaderFlag",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":-10,
                                                        "width":30,
                                                        "height":30,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"text1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":3,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"levelLabel1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":100,
                                                        "y":3,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"nameLabel1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":-15,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"showBtn1",
                                                "events":{"click":"__showBtn1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32,
                                                        "y":130,
                                                        "styleName":"HorizontalTab",
                                                        "width":66,
                                                        "visible":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":108,
                                            "y":247,
                                            "width":130,
                                            "height":145,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"targetShow2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":115,
                                                        "height":20,
                                                        "width":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"text2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":3,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"levelLabel2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":100,
                                                        "y":3,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"nameLabel2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":-15,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"showBtn2",
                                                "events":{"click":"__showBtn2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32,
                                                        "y":130,
                                                        "styleName":"HorizontalTab",
                                                        "width":66,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"leaveBtn2",
                                                "events":{"click":"__leaveBtn2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32,
                                                        "y":-42,
                                                        "styleName":"HorizontalTab",
                                                        "width":66,
                                                        "visible":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":423,
                                            "y":247,
                                            "width":130,
                                            "height":145,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"targetShow3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":115,
                                                        "height":20,
                                                        "width":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"text3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":3,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"levelLabel3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":100,
                                                        "y":3,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"nameLabel3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":-15,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"showBtn3",
                                                "events":{"click":"__showBtn3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32,
                                                        "y":130,
                                                        "styleName":"HorizontalTab",
                                                        "width":66,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"leaveBtn3",
                                                "events":{"click":"__leaveBtn3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32,
                                                        "y":-42,
                                                        "styleName":"HorizontalTab",
                                                        "width":66,
                                                        "visible":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"ready3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":456,
                                            "y":165,
                                            "width":60,
                                            "height":24
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"ready2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":195,
                                            "y":165,
                                            "width":60,
                                            "height":24
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"time",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontFamily = "Arial";
                                        this.fontSize = 60;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "x":250.5,
                                            "y":62,
                                            "width":187.5,
                                            "height":68
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___PVPGroupPanel_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "52";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":480,
                                "styleName":"BtnWbQuit",
                                "height":50,
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":85,
                                "width":200,
                                "height":200,
                                "styleName":"txtArea",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":8,
                                            "styleName":"LabelTitle"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HRule,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "3";
                                        this.right = "3";
                                        this.top = "32";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":5});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"myName",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":78,
                                            "y":45,
                                            "text":"Label",
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label7",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"myLevel",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":78,
                                            "y":70,
                                            "text":"Label",
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label9",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":95
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"myClass",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":78,
                                            "y":95,
                                            "text":"Label",
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label11",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":120
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"myRank",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":88,
                                            "y":120,
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label13",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":145
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"myPoint",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":78,
                                            "y":145,
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"reqBtn",
                                    "events":{"click":"__reqBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":35,
                                            "y":168,
                                            "styleName":"BtnStdRed",
                                            "visible":false,
                                            "clickDelay":10000
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"batBtn",
                                    "events":{"click":"__batBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":118,
                                            "y":168,
                                            "styleName":"BtnStdRed",
                                            "visible":false,
                                            "clickDelay":1500,
                                            "width":60
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":10,
                                "width":200,
                                "height":67,
                                "styleName":"txtArea",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label15",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10,
                                            "width":59,
                                            "height":23
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label16",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":39,
                                            "y":10,
                                            "width":59,
                                            "height":23
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label17",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":39,
                                            "width":72
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_maxLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":137.5,
                                            "y":35,
                                            "stepSize":1,
                                            "width":58,
                                            "enabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"ns_minLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70.5,
                                            "y":35,
                                            "stepSize":1,
                                            "value":0,
                                            "width":59,
                                            "enabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"limitBtn",
                                    "events":{"click":"__limitBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":159.5,
                                            "y":9,
                                            "styleName":"BtnStdRed",
                                            "clickDelay":3000,
                                            "width":36
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextInput,
                                    "id":"passText",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":106,
                                            "y":10,
                                            "width":57.5,
                                            "maxChars":6,
                                            "restrict":"0-9"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label18",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70.5,
                                            "y":10,
                                            "width":38,
                                            "height":23
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":292,
                                "width":200,
                                "height":180,
                                "styleName":"txtArea",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PVPGroupPanel_Label19",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":8,
                                            "styleName":"LabelTitle"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HRule,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "3";
                                        this.right = "3";
                                        this.top = "32";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":5});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"battleInfo",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "45";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":125});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_PVPGroupPanel_Button2",
                        "events":{"click":"___PVPGroupPanel_Button2_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "180";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":494,
                                "styleName":"BtnStdRed",
                                "visible":true,
                                "width":72
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___PVPGroupPanel_Button3_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "110";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":482,
                                "width":40,
                                "height":45,
                                "styleName":"BtnBarBag"
                            });
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        private var _timer:Timer = new Timer(1000);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PVPGroupPanel()
        {
            mx_internal::_document = this;
            this.x = 0;
            this.y = 0;
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___PVPGroupPanel_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PVPGroupPanel._watcherSetupUtil = _arg_1;
        }


        private function _PVPGroupPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                text1.text = _arg_1;
            }, "text1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TARGETCANVAS_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showBtn1.label = _arg_1;
            }, "showBtn1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                text2.text = _arg_1;
            }, "text2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TARGETCANVAS_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showBtn2.label = _arg_1;
            }, "showBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                leaveBtn2.label = _arg_1;
            }, "leaveBtn2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                text3.text = _arg_1;
            }, "text3.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TARGETCANVAS_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showBtn3.label = _arg_1;
            }, "showBtn3.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                leaveBtn3.label = _arg_1;
            }, "leaveBtn3.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                ready3.text = _arg_1;
            }, "ready3.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                ready2.text = _arg_1;
            }, "ready2.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _left;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                time.text = _arg_1;
            }, "time.text");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                _PVPGroupPanel_Label4.filters = _arg_1;
            }, "_PVPGroupPanel_Label4.filters");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label4.text = _arg_1;
            }, "_PVPGroupPanel_Label4.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label5.text = _arg_1;
            }, "_PVPGroupPanel_Label5.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label7.text = _arg_1;
            }, "_PVPGroupPanel_Label7.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label9.text = _arg_1;
            }, "_PVPGroupPanel_Label9.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label11.text = _arg_1;
            }, "_PVPGroupPanel_Label11.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _rank;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myRank.text = _arg_1;
            }, "myRank.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label13.text = _arg_1;
            }, "_PVPGroupPanel_Label13.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _point;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myPoint.text = _arg_1;
            }, "myPoint.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reqBtn.label = _arg_1;
            }, "reqBtn.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                batBtn.label = _arg_1;
            }, "batBtn.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label15.text = _arg_1;
            }, "_PVPGroupPanel_Label15.text");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _roomId;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label16.text = _arg_1;
            }, "_PVPGroupPanel_Label16.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label17.text = _arg_1;
            }, "_PVPGroupPanel_Label17.text");
            result[24] = binding;
            binding = new Binding(this, function ():Number
            {
                return (GamePredef.MAX_LEVEL);
            }, function (_arg_1:Number):void
            {
                ns_maxLevel.maximum = _arg_1;
            }, "ns_maxLevel.maximum");
            result[25] = binding;
            binding = new Binding(this, function ():Number
            {
                return (GamePredef.MAX_LEVEL);
            }, function (_arg_1:Number):void
            {
                ns_maxLevel.value = _arg_1;
            }, "ns_maxLevel.value");
            result[26] = binding;
            binding = new Binding(this, function ():Number
            {
                return (GamePredef.MAX_LEVEL);
            }, function (_arg_1:Number):void
            {
                ns_minLevel.maximum = _arg_1;
            }, "ns_minLevel.maximum");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                limitBtn.label = _arg_1;
            }, "limitBtn.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label18.text = _arg_1;
            }, "_PVPGroupPanel_Label18.text");
            result[29] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                _PVPGroupPanel_Label19.filters = _arg_1;
            }, "_PVPGroupPanel_Label19.filters");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PVP_GROUP_P[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Label19.text = _arg_1;
            }, "_PVPGroupPanel_Label19.text");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _resultStr;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                battleInfo.htmlText = _arg_1;
            }, "battleInfo.htmlText");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PVPGroupPanel_Button2.label = _arg_1;
            }, "_PVPGroupPanel_Button2.label");
            result[33] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get showBtn1():BasicGlowButton
        {
            return (this._339356174showBtn1);
        }

        public function showResultAlert(obj:Object):void
        {
            var handler:Function;
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("leavePVPRoom", null);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.PVP_GROUP_P[21].toString().replace("{rank}", obj.rank).replace("{point}", obj.point);
            if (((!(obj.pvpPoint)) || (Number(obj.pvpPoint) == 0)))
            {
                str = Language.PVP_GROUP_P[24].toString().replace("{rank}", obj.rank);
            };
            _alert = Alert.show(str, null, Alert.YES, null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        [Bindable(event="propertyChange")]
        public function get batBtn():DelayButton
        {
            return (this._1396206073batBtn);
        }

        private function _PVPGroupPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHANGECOLORPANEL_S[7];
            _local_1 = Language.TARGETCANVAS_S[0];
            _local_1 = Language.CHANGECOLORPANEL_S[7];
            _local_1 = Language.TARGETCANVAS_S[0];
            _local_1 = Language.PVP_GROUP_P[16];
            _local_1 = Language.CHANGECOLORPANEL_S[7];
            _local_1 = Language.TARGETCANVAS_S[0];
            _local_1 = Language.PVP_GROUP_P[16];
            _local_1 = Language.PVP_GROUP_P[2];
            _local_1 = Language.PVP_GROUP_P[2];
            _local_1 = _left;
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.PVP_GROUP_P[15];
            _local_1 = Language.PVP_GROUP_P[3];
            _local_1 = Language.PVP_GROUP_P[4];
            _local_1 = Language.PVP_GROUP_P[5];
            _local_1 = Language.PVP_GROUP_P[6];
            _local_1 = _rank;
            _local_1 = Language.PVP_GROUP_P[7];
            _local_1 = _point;
            _local_1 = Language.PVP_GROUP_P[8];
            _local_1 = Language.PVP_GROUP_P[9];
            _local_1 = Language.PVP_GROUP_P[10];
            _local_1 = _roomId;
            _local_1 = Language.PVP_GROUP_P[11];
            _local_1 = GamePredef.MAX_LEVEL;
            _local_1 = GamePredef.MAX_LEVEL;
            _local_1 = GamePredef.MAX_LEVEL;
            _local_1 = Language.PVP_GROUP_P[12];
            _local_1 = Language.PVP_GROUP_P[13];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.PVP_GROUP_P[14];
            _local_1 = _resultStr;
            _local_1 = Language.MINIMAPCANVAS_U[18];
        }

        public function set batBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1396206073batBtn;
            if (_local_2 !== _arg_1)
            {
                this._1396206073batBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "batBtn", _local_2, _arg_1));
            };
        }

        private function showBattle():void
        {
            _core.view.changeVisible(ViewManager.PANEL_BATTLESET);
            _core.view.getUI(ViewManager.PANEL_BATTLESET).updateView();
        }

        private function set _rank(_arg_1:Number):void
        {
            var _local_2:Object = this._91227403_rank;
            if (_local_2 !== _arg_1)
            {
                this._91227403_rank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_rank", _local_2, _arg_1));
            };
        }

        public function __mianCan_creationComplete(_arg_1:FlexEvent):void
        {
            setCanvasPosition();
        }

        private function _secToTime(_arg_1:Number):void
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
                        _left = "00:00";
                    }
                    else
                    {
                        _left = ((_local_6 + ":") + _local_7);
                    };
                }
                else
                {
                    _left = ((((_local_5 + ":") + _local_6) + ":") + _local_7);
                };
            }
            else
            {
                _left = "00:00";
            };
        }

        public function __showBtn2_click(_arg_1:MouseEvent):void
        {
            showInfo(2);
        }

        public function onLeftPVPGroup(_arg_1:Object):*
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_PVP_ROOM_LIST);
            if (_local_2)
            {
                _local_2.returnPVPRoom(_arg_1);
            };
            this.visible = false;
        }

        public function onUpdateGroupLimit(_arg_1:Number, _arg_2:Object):void
        {
            if (((!(_arg_1)) || (!(ToolKit.isEqual(_arg_1, _roomId)))))
            {
                return;
            };
            if (_arg_2.min)
            {
                _minLevel = Number(_arg_2.min);
                ns_minLevel.value = _minLevel;
            };
            if (_arg_2.max)
            {
                _maxLevel = Number(_arg_2.max);
                ns_maxLevel.value = _maxLevel;
            };
        }

        private function setImgaePosition():void
        {
            backImg.x = Math.floor((((this.x + this.width) / 2) + -(backImg.width / 2)));
            backImg.y = Math.floor((((this.y + this.height) / 2) + -(backImg.height / 2)));
        }

        [Bindable(event="propertyChange")]
        public function get nameLabel1():BasicTxtButton
        {
            return (this._966299096nameLabel1);
        }

        public function onRefershMember(_arg_1:Object):void
        {
            var _local_2:*;
            if (((_arg_1) && (_arg_1.memberList)))
            {
                for each (_local_2 in _arg_1.memberList)
                {
                    if (_local_2)
                    {
                        if (ToolKit.isEqual(_local_2.cid, _core.player.id))
                        {
                            showPVPGroupPanel(_arg_1);
                        };
                    };
                };
            };
        }

        public function set leaderFlag(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._1191054357leaderFlag;
            if (_local_2 !== _arg_1)
            {
                this._1191054357leaderFlag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leaderFlag", _local_2, _arg_1));
            };
        }

        private function updateGroupLimit():void
        {
            if (!ToolKit.isEqual(_leaderId, _core.player.id))
            {
                return;
            };
            if (((ToolKit.isEqual(ns_maxLevel.value, _maxLevel)) && (ToolKit.isEqual(ns_minLevel.value, _minLevel))))
            {
                ns_minLevel.value = _minLevel;
                ns_maxLevel.value = _maxLevel;
                return;
            };
            if (ToolKit.isBigThan(ns_minLevel.value, ns_maxLevel.value))
            {
                ns_minLevel.value = _minLevel;
                ns_maxLevel.value = _maxLevel;
                return;
            };
            _core.remote.call("updatePVPGroupLimit", null, ns_minLevel.value, ns_maxLevel.value);
        }

        [Bindable(event="propertyChange")]
        public function get leaderFlag():UIComponent
        {
            return (this._1191054357leaderFlag);
        }

        [Bindable(event="propertyChange")]
        public function get nameLabel2():BasicTxtButton
        {
            return (this._966299095nameLabel2);
        }

        [Bindable(event="propertyChange")]
        public function get nameLabel3():BasicTxtButton
        {
            return (this._966299094nameLabel3);
        }

        [Bindable(event="propertyChange")]
        public function get mianCan():Canvas
        {
            return (this._1052640327mianCan);
        }

        public function set nameLabel1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._966299096nameLabel1;
            if (_local_2 !== _arg_1)
            {
                this._966299096nameLabel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLabel1", _local_2, _arg_1));
            };
        }

        public function __limitBtn_click(_arg_1:MouseEvent):void
        {
            updatePVPGroupPass();
        }

        public function ___PVPGroupPanel_Button3_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_BAG);
        }

        [Bindable(event="propertyChange")]
        public function get myName():Label
        {
            return (this._1060223401myName);
        }

        public function set myClass(_arg_1:Label):void
        {
            var _local_2:Object = this._1482970924myClass;
            if (_local_2 !== _arg_1)
            {
                this._1482970924myClass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myClass", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levelLabel1():BasicTxtButton
        {
            return (this._1563243617levelLabel1);
        }

        [Bindable(event="propertyChange")]
        public function get levelLabel3():BasicTxtButton
        {
            return (this._1563243619levelLabel3);
        }

        public function setPoint(_arg_1:Object):*
        {
            _point = _arg_1.point;
            _rank = _arg_1.rank;
        }

        private function leaveGroupByLeader(index:int):void
        {
            var id:int;
            switch (index)
            {
                case 2:
                    id = _memberId2;
                    break;
                case 3:
                    id = _memberId3;
                    break;
            };
            if (((!(id)) || (id <= 0)))
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (Alert.YES == _arg_1.detail)
                {
                    _core.remote.call("PVPKickByLeader", null, id);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            _alert = Alert.show(((Language.PVP_GROUP_P[20] + this[("nameLabel" + index)].text) + "?"), "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get levelLabel2():BasicTxtButton
        {
            return (this._1563243618levelLabel2);
        }

        public function set nameLabel2(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._966299095nameLabel2;
            if (_local_2 !== _arg_1)
            {
                this._966299095nameLabel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLabel2", _local_2, _arg_1));
            };
        }

        public function set nameLabel3(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._966299094nameLabel3;
            if (_local_2 !== _arg_1)
            {
                this._966299094nameLabel3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLabel3", _local_2, _arg_1));
            };
        }

        public function set myLevel(_arg_1:Label):void
        {
            var _local_2:Object = this._1491093816myLevel;
            if (_local_2 !== _arg_1)
            {
                this._1491093816myLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _roomId():Number
        {
            return (this._1783151733_roomId);
        }

        private function readyPVP():void
        {
            if (ToolKit.isEqual(_core.player.id, _leaderId))
            {
                if (((_state2) && (_state3)))
                {
                    _core.remote.call("readyOrStartPVP", null);
                }
                else
                {
                    _core.sysMidNote(Language.PVP_GROUP_P[18]);
                };
            }
            else
            {
                if (_isStart)
                {
                    _core.sysMidNote(Language.PVP_GROUP_P[19]);
                }
                else
                {
                    _core.remote.call("readyOrStartPVP", null);
                };
            };
        }

        public function set myPoint(_arg_1:Label):void
        {
            var _local_2:Object = this._1495073604myPoint;
            if (_local_2 !== _arg_1)
            {
                this._1495073604myPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myPoint", _local_2, _arg_1));
            };
        }

        public function set mianCan(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1052640327mianCan;
            if (_local_2 !== _arg_1)
            {
                this._1052640327mianCan = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mianCan", _local_2, _arg_1));
            };
        }

        private function updatePVPGroupPass():void
        {
            updateGroupLimit();
            if (!ToolKit.isEqual(_leaderId, _core.player.id))
            {
                return;
            };
            if (_pass != passText.text)
            {
                _core.remote.call("updatePVPGroupPass", null, passText.text);
            };
        }

        [Bindable(event="propertyChange")]
        private function get _point():Number
        {
            return (this._1468352367_point);
        }

        private function leftPVPGroup():void
        {
            var handler:Function;
            var str:String;
            var tf:IUITextField;
            if (_isStart)
            {
                _core.sysMidNote("匹配中不能退出房间，等匹配结束后再操作！");
            }
            else
            {
                handler = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("leftPVPGroup", new Responder(onLeftPVPGroup));
                    };
                };
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                str = "Xác nhận rời phòng?";
                _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = str;
                tf.filters = GamePredef.FILTER_TEXT1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get limitBtn():DelayButton
        {
            return (this._1164631201limitBtn);
        }

        [Bindable(event="propertyChange")]
        public function get text1():BasicTxtButton
        {
            return (this._110256292text1);
        }

        [Bindable(event="propertyChange")]
        public function get text2():BasicTxtButton
        {
            return (this._110256293text2);
        }

        [Bindable(event="propertyChange")]
        public function get text3():BasicTxtButton
        {
            return (this._110256294text3);
        }

        public function onRefreshPVPPoint(_arg_1:Object):void
        {
            var _local_2:* = ToolKit.minus(_arg_1.score, _arg_1.oldScore);
            var _local_3:* = "";
            if (_arg_1.isWinner)
            {
                _local_3 = Language.PVP_GROUP_P[22].toString().replace("{point}", _local_2).replace("{time}", getNowDate());
            }
            else
            {
                _local_3 = Language.PVP_GROUP_P[23].toString().replace("{point}", _local_2).replace("{time}", getNowDate());
            };
            _point = _arg_1.score;
            _resultStr = (_local_3 + _resultStr);
            onPushPVPQueue(2);
        }

        private function set _resultStr(_arg_1:String):void
        {
            var _local_2:Object = this._986490709_resultStr;
            if (_local_2 !== _arg_1)
            {
                this._986490709_resultStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_resultStr", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get leaveBtn2():BasicGlowButton
        {
            return (this._1660738733leaveBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get leaveBtn3():BasicGlowButton
        {
            return (this._1660738734leaveBtn3);
        }

        public function set myName(_arg_1:Label):void
        {
            var _local_2:Object = this._1060223401myName;
            if (_local_2 !== _arg_1)
            {
                this._1060223401myName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myName", _local_2, _arg_1));
            };
        }

        public function set backImg(_arg_1:Image):void
        {
            var _local_2:Object = this._347234980backImg;
            if (_local_2 !== _arg_1)
            {
                this._347234980backImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backImg", _local_2, _arg_1));
            };
        }

        public function set levelLabel1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1563243617levelLabel1;
            if (_local_2 !== _arg_1)
            {
                this._1563243617levelLabel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelLabel1", _local_2, _arg_1));
            };
        }

        public function set levelLabel2(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1563243618levelLabel2;
            if (_local_2 !== _arg_1)
            {
                this._1563243618levelLabel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelLabel2", _local_2, _arg_1));
            };
        }

        public function onPushPVPQueue(_arg_1:Number):void
        {
            if (ToolKit.isEqual(_arg_1, 2))
            {
                if (_timer.running)
                {
                    _timer.removeEventListener(TimerEvent.TIMER, addWaitTime);
                    _timer.stop();
                };
                _left = "00:00";
                _isStart = true;
                time.visible = true;
                _timeGo = 0;
                _timer.addEventListener(TimerEvent.TIMER, addWaitTime);
                _timer.start();
                if (ToolKit.isEqual(_leaderId, _core.player.id))
                {
                    if (_arg_1)
                    {
                        batBtn.label = Language.PVP_GROUP_P[17];
                    };
                };
            }
            else
            {
                _isStart = false;
                time.visible = false;
                _timeGo = 0;
                if (_timer.running)
                {
                    _timer.removeEventListener(TimerEvent.TIMER, addWaitTime);
                    _timer.stop();
                };
                if (ToolKit.isEqual(_leaderId, _core.player.id))
                {
                    batBtn.label = Language.PVP_GROUP_P[9];
                };
            };
        }

        public function onUpdatePVPGroupPass(_arg_1:Number, _arg_2:String):void
        {
            if (((!(_arg_1)) || (!(ToolKit.isEqual(_arg_1, _roomId)))))
            {
                return;
            };
            if (((!(_arg_2)) || (_arg_2 == "")))
            {
                passText.text = "";
            }
            else
            {
                passText.text = _arg_2;
            };
            _pass = passText.text;
        }

        [Bindable(event="propertyChange")]
        public function get time():Label
        {
            return (this._3560141time);
        }

        public function set levelLabel3(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1563243619levelLabel3;
            if (_local_2 !== _arg_1)
            {
                this._1563243619levelLabel3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelLabel3", _local_2, _arg_1));
            };
        }

        public function __reqBtn_click(_arg_1:MouseEvent):void
        {
            quickInvite();
        }

        public function __leaveBtn3_click(_arg_1:MouseEvent):void
        {
            leaveGroupByLeader(3);
        }

        public function __showBtn1_click(_arg_1:MouseEvent):void
        {
            showInfo(1);
        }

        [Bindable(event="propertyChange")]
        public function get passText():TextInput
        {
            return (this._1215933662passText);
        }

        [Bindable(event="propertyChange")]
        private function get _left():String
        {
            return (this._91052262_left);
        }

        private function set _roomId(_arg_1:Number):void
        {
            var _local_2:Object = this._1783151733_roomId;
            if (_local_2 !== _arg_1)
            {
                this._1783151733_roomId = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_roomId", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get reqBtn():DelayButton
        {
            return (this._934534946reqBtn);
        }

        [Bindable(event="propertyChange")]
        public function get ready2():Label
        {
            return (this._934978833ready2);
        }

        [Bindable(event="propertyChange")]
        public function get ready3():Label
        {
            return (this._934978832ready3);
        }

        public function ___PVPGroupPanel_Button2_click(_arg_1:MouseEvent):void
        {
            showBattle();
        }

        [Bindable(event="propertyChange")]
        private function get _rank():Number
        {
            return (this._91227403_rank);
        }

        public function set battleInfo(_arg_1:IntroText):void
        {
            var _local_2:Object = this._2053377414battleInfo;
            if (_local_2 !== _arg_1)
            {
                this._2053377414battleInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleInfo", _local_2, _arg_1));
            };
        }

        public function ___PVPGroupPanel_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function updateView(_arg_1:Number, _arg_2:Number):void
        {
            var _local_4:String;
            var _local_5:Object;
            var _local_3:Object = _core.getCharactor(_arg_1);
            if (_local_3)
            {
                _local_4 = ResManager.getResUrl(_local_3.resCode);
                this[("targetShow" + _arg_2)].url = _local_4;
                _local_5 = GameData.d[GamePredef.TBL_CLASS][_local_3.classId];
                if (_local_5)
                {
                    if (_local_3.gender == 0)
                    {
                        this[("targetShow" + _arg_2)].charResCode = Number(_local_5.resCodeMale);
                    }
                    else
                    {
                        this[("targetShow" + _arg_2)].charResCode = Number(_local_5.resCodeFemale);
                    };
                }
                else
                {
                    this[("targetShow" + _arg_2)].charResCode = _local_3.resCode;
                };
                this[("targetShow" + _arg_2)].color = ((_local_3.colorCode) ? _local_3.colorCode : 0);
                if (_local_3.wingResCode)
                {
                    this[("targetShow" + _arg_2)].wingResCode = _local_3.wingResCode;
                };
                if (_local_3.wp)
                {
                    this[("targetShow" + _arg_2)].weaponResCode = _local_3.wp;
                };
                if (((_local_3.fairy) && (_local_3.fairy.resCode)))
                {
                    this[("targetShow" + _arg_2)].fairyResCode = _local_3.fairy.resCode;
                };
            };
        }

        private function init():void
        {
            backImg.source = ResManager.hash(ResManager.getIconUrlNoHash(3130090000057));
            pvpLeader = new ((PVP_GROUP_LEADER as Class))();
            leaderFlag.addChild(pvpLeader);
            if (this.mianCan)
            {
                setCanvasPosition();
            };
        }

        public function set ns_minLevel(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1779038604ns_minLevel;
            if (_local_2 !== _arg_1)
            {
                this._1779038604ns_minLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns_minLevel", _local_2, _arg_1));
            };
        }

        private function set _point(_arg_1:Number):void
        {
            var _local_2:Object = this._1468352367_point;
            if (_local_2 !== _arg_1)
            {
                this._1468352367_point = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_point", _local_2, _arg_1));
            };
        }

        public function __batBtn_click(_arg_1:MouseEvent):void
        {
            readyPVP();
        }

        [Bindable(event="propertyChange")]
        public function get myClass():Label
        {
            return (this._1482970924myClass);
        }

        [Bindable(event="propertyChange")]
        public function get myLevel():Label
        {
            return (this._1491093816myLevel);
        }

        public function set limitBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1164631201limitBtn;
            if (_local_2 !== _arg_1)
            {
                this._1164631201limitBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitBtn", _local_2, _arg_1));
            };
        }

        public function set text1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._110256292text1;
            if (_local_2 !== _arg_1)
            {
                this._110256292text1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text1", _local_2, _arg_1));
            };
        }

        public function set text2(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._110256293text2;
            if (_local_2 !== _arg_1)
            {
                this._110256293text2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text2", _local_2, _arg_1));
            };
        }

        private function showInfo(_arg_1:int):void
        {
            var _local_2:int;
            switch (_arg_1)
            {
                case 1:
                    _local_2 = _leaderId;
                    break;
                case 2:
                    _local_2 = _memberId2;
                    break;
                case 3:
                    _local_2 = _memberId3;
                    break;
            };
            if (((_local_2) && (_local_2 > 0)))
            {
                _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(_local_2);
            };
        }

        public function set text3(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._110256294text3;
            if (_local_2 !== _arg_1)
            {
                this._110256294text3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myPoint():Label
        {
            return (this._1495073604myPoint);
        }

        [Bindable(event="propertyChange")]
        private function get _resultStr():String
        {
            return (this._986490709_resultStr);
        }

        private function quickInvite():void
        {
            _core.remote.quickInvite();
        }

        public function set leaveBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1660738733leaveBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1660738733leaveBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leaveBtn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get backImg():Image
        {
            return (this._347234980backImg);
        }

        public function __showBtn3_click(_arg_1:MouseEvent):void
        {
            showInfo(3);
        }

        public function onReadyOrCancel(_arg_1:Object):void
        {
            if (_arg_1.state)
            {
                this[("ready" + _arg_1.index)].visible = true;
                this[("_state" + _arg_1.index)] = true;
            }
            else
            {
                this[("ready" + _arg_1.index)].visible = false;
                this[("_state" + _arg_1.index)] = false;
            };
            if (ToolKit.isEqual(_arg_1.cid, _core.player.id))
            {
                if (_arg_1.state)
                {
                    batBtn.label = Language.PVP_GROUP_P[1];
                }
                else
                {
                    batBtn.label = Language.PVP_GROUP_P[0];
                };
            };
        }

        public function set leaveBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1660738734leaveBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1660738734leaveBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leaveBtn3", _local_2, _arg_1));
            };
        }

        private function getNowDate():String
        {
            var _local_1:DateFormatter = new DateFormatter();
            _local_1.formatString = "HH:NN:SS";
            return (_local_1.format(new Date()));
        }

        public function set ns_maxLevel(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._739732038ns_maxLevel;
            if (_local_2 !== _arg_1)
            {
                this._739732038ns_maxLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns_maxLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battleInfo():IntroText
        {
            return (this._2053377414battleInfo);
        }

        public function set targetShow2(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._2096007740targetShow2;
            if (_local_2 !== _arg_1)
            {
                this._2096007740targetShow2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetShow2", _local_2, _arg_1));
            };
        }

        public function set targetShow3(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._2096007739targetShow3;
            if (_local_2 !== _arg_1)
            {
                this._2096007739targetShow3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetShow3", _local_2, _arg_1));
            };
        }

        public function set targetShow1(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._2096007741targetShow1;
            if (_local_2 !== _arg_1)
            {
                this._2096007741targetShow1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetShow1", _local_2, _arg_1));
            };
        }

        public function __leaveBtn2_click(_arg_1:MouseEvent):void
        {
            leaveGroupByLeader(2);
        }

        public function showPVPGroupPanel(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:int;
            var _local_4:*;
            if (_arg_1)
            {
                _isStart = false;
                time.visible = false;
                _timeGo = 0;
                onPushPVPQueue(1);
                reqBtn.visible = false;
                batBtn.visible = false;
                batBtn.label = Language.PVP_GROUP_P[0];
                limitBtn.visible = false;
                _local_2 = 1;
                while (_local_2 <= 3)
                {
                    this[("targetShow" + _local_2)].url = null;
                    this[("targetShow" + _local_2)].charResCode = null;
                    this[("targetShow" + _local_2)].color = null;
                    this[("targetShow" + _local_2)].wingResCode = null;
                    this[("targetShow" + _local_2)].weaponResCode = null;
                    this[("targetShow" + _local_2)].fairyResCode = null;
                    this[("nameLabel" + _local_2)].visible = false;
                    this[("levelLabel" + _local_2)].visible = false;
                    this[("text" + _local_2)].visible = false;
                    if (ToolKit.isBigThan(_local_2, 1))
                    {
                        this[("ready" + _local_2)].visible = false;
                    };
                    _local_2++;
                };
                _roomId = _arg_1.id;
                _memberId2 = -1;
                _memberId3 = -1;
                _leaderId = _arg_1.leaderId;
                passText.text = ((_arg_1.pass) ? _arg_1.pass : "");
                _pass = passText.text;
                _local_3 = 1;
                while (_local_3 <= 3)
                {
                    if (((_arg_1.memberList[_local_3]) && (_arg_1.memberList[_local_3].cid)))
                    {
                        if (_local_3 != 1)
                        {
                            this[("_memberId" + _local_3)] = _arg_1.memberList[_local_3].cid;
                        };
                        if (_core.player.id != _arg_1.memberList[_local_3].cid)
                        {
                            this[("showBtn" + _local_3)].visible = true;
                        }
                        else
                        {
                            this[("showBtn" + _local_3)].visible = false;
                        };
                        if (((_core.player.id == _leaderId) && (!(_local_3 == 1))))
                        {
                            this[("leaveBtn" + _local_3)].visible = true;
                        }
                        else
                        {
                            if (_local_3 != 1)
                            {
                                this[("leaveBtn" + _local_3)].visible = false;
                            };
                        };
                        updateView(_arg_1.memberList[_local_3].cid, Number(_local_3));
                        this[("nameLabel" + _local_3)].text = _arg_1.memberList[_local_3].name;
                        this[("levelLabel" + _local_3)].text = _arg_1.memberList[_local_3].level;
                        this[("_state" + _local_3)] = _arg_1.memberList[_local_3].state;
                        if (((ToolKit.isBigThan(_local_3, 1)) && (_arg_1.memberList[_local_3].state)))
                        {
                            this[("ready" + _local_3)].visible = true;
                            if (ToolKit.isEqual(_arg_1.memberList[_local_3].cid, _core.player.id))
                            {
                                batBtn.label = Language.PVP_GROUP_P[1];
                            };
                        };
                        if (ToolKit.isEqual(_arg_1.memberList[_local_3].cid, _core.player.id))
                        {
                            myName.text = String(_core.player.name);
                            myLevel.text = String(_core.player.level);
                            myClass.text = String(GameData.d[GamePredef.TBL_CLASS][_core.player.classId]["name"]);
                            ns_maxLevel.value = Number(_arg_1["limit"]["lev"]["max"]);
                            _maxLevel = ns_maxLevel.value;
                            ns_minLevel.value = Number(_arg_1["limit"]["lev"]["min"]);
                            _minLevel = ns_minLevel.value;
                            if (ToolKit.isEqual(_leaderId, _core.player.id))
                            {
                                ns_maxLevel.enabled = true;
                                ns_minLevel.enabled = true;
                                limitBtn.visible = true;
                                reqBtn.visible = true;
                                reqBtn.enabled = true;
                                batBtn.visible = true;
                                batBtn.enabled = true;
                                batBtn.label = Language.PVP_GROUP_P[9];
                            }
                            else
                            {
                                ns_maxLevel.enabled = false;
                                ns_minLevel.enabled = false;
                                batBtn.visible = true;
                                batBtn.enabled = true;
                            };
                        };
                        this[("nameLabel" + _local_3)].visible = true;
                        this[("levelLabel" + _local_3)].visible = true;
                        this[("text" + _local_3)].visible = true;
                    }
                    else
                    {
                        if (this[("showBtn" + _local_3)])
                        {
                            this[("showBtn" + _local_3)].visible = false;
                        };
                        if (this[("leaveBtn" + _local_3)])
                        {
                            this[("leaveBtn" + _local_3)].visible = false;
                        };
                    };
                    _local_3++;
                };
                _local_4 = _core.view.getUI(ViewManager.PANEL_PVP_ROOM_LIST);
                if (((_local_4) && (_local_4.visible)))
                {
                    _local_4.visible = false;
                };
                _local_4 = _core.view.getUI(ViewManager.MAIN_GROUP);
                if (_local_4)
                {
                    _local_4.visible = false;
                };
                _local_4 = _core.view.getUI(ViewManager.SHADE_PVP);
                if (((_local_4) && (!(_local_4.visible))))
                {
                    _local_4.visible = true;
                };
                this.visible = true;
            }
            else
            {
                this.visible = false;
            };
        }

        private function setCanvasPosition():void
        {
            mianCan.x = Math.floor((((this.x + this.width) / 2) + -(mianCan.width / 2)));
            mianCan.y = Math.floor((((this.y + this.height) / 2) + -(mianCan.height / 2)));
        }

        [Bindable(event="propertyChange")]
        public function get ns_minLevel():NumericStepper
        {
            return (this._1779038604ns_minLevel);
        }

        public function onRefreshPVPListRank(_arg_1:Number):void
        {
            _rank = ToolKit.add(_arg_1, 1);
        }

        override public function initialize():void
        {
            var target:PVPGroupPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PVPGroupPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PVPGroupPanelWatcherSetupUtil");
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

        public function set time(_arg_1:Label):void
        {
            var _local_2:Object = this._3560141time;
            if (_local_2 !== _arg_1)
            {
                this._3560141time = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "time", _local_2, _arg_1));
            };
        }

        private function addWaitTime(_arg_1:Event):void
        {
            _timeGo++;
            _secToTime(_timeGo);
        }

        public function __backImg_creationComplete(_arg_1:FlexEvent):void
        {
            setImgaePosition();
        }

        public function ___PVPGroupPanel_Button1_click(_arg_1:MouseEvent):void
        {
            leftPVPGroup();
        }

        public function set passText(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1215933662passText;
            if (_local_2 !== _arg_1)
            {
                this._1215933662passText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "passText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ns_maxLevel():NumericStepper
        {
            return (this._739732038ns_maxLevel);
        }

        public function set reqBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._934534946reqBtn;
            if (_local_2 !== _arg_1)
            {
                this._934534946reqBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get targetShow2():CharactorShowCanvas
        {
            return (this._2096007740targetShow2);
        }

        [Bindable(event="propertyChange")]
        public function get targetShow1():CharactorShowCanvas
        {
            return (this._2096007741targetShow1);
        }

        private function set _left(_arg_1:String):void
        {
            var _local_2:Object = this._91052262_left;
            if (_local_2 !== _arg_1)
            {
                this._91052262_left = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_left", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get targetShow3():CharactorShowCanvas
        {
            return (this._2096007739targetShow3);
        }

        public function set ready2(_arg_1:Label):void
        {
            var _local_2:Object = this._934978833ready2;
            if (_local_2 !== _arg_1)
            {
                this._934978833ready2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ready2", _local_2, _arg_1));
            };
        }

        public function set showBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._339356174showBtn1;
            if (_local_2 !== _arg_1)
            {
                this._339356174showBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showBtn1", _local_2, _arg_1));
            };
        }

        public function set showBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._339356173showBtn2;
            if (_local_2 !== _arg_1)
            {
                this._339356173showBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showBtn2", _local_2, _arg_1));
            };
        }

        public function set ready3(_arg_1:Label):void
        {
            var _local_2:Object = this._934978832ready3;
            if (_local_2 !== _arg_1)
            {
                this._934978832ready3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ready3", _local_2, _arg_1));
            };
        }

        public function set showBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._339356172showBtn3;
            if (_local_2 !== _arg_1)
            {
                this._339356172showBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showBtn3", _local_2, _arg_1));
            };
        }

        public function set myRank(_arg_1:Label):void
        {
            var _local_2:Object = this._1060104200myRank;
            if (_local_2 !== _arg_1)
            {
                this._1060104200myRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myRank", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showBtn2():BasicGlowButton
        {
            return (this._339356173showBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get showBtn3():BasicGlowButton
        {
            return (this._339356172showBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get myRank():Label
        {
            return (this._1060104200myRank);
        }


    }
}//package com.qeedoo.ui.view.compDragable

