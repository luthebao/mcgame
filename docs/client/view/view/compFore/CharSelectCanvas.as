// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compFore.CharSelectCanvas

package com.qeedoo.ui.view.compFore
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.TextInput;
    import mx.states.AddChild;
    import com.qeedoo.game.vo.ClassVO;
    import com.qeedoo.ui.view.comp.BasicFilteredLabel;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Button;
    import mx.controls.Text;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.CharactorSelectCanvas;
    import mx.core.UIComponent;
    import mx.effects.Fade;
    import mx.controls.TextArea;
    import mx.states.SetProperty;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.collections.ArrayCollection;
    import mx.containers.ViewStack;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import mx.core.DeferredInstanceFromFunction;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import flash.utils.setTimeout;
    import mx.core.Application;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.Event;
    import com.adobe.crypto.MD5;
    import mx.states.State;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.Binding;
    import flash.filters.ColorMatrixFilter;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
    import mx.utils.StringUtil;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.MMOGame;
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

    public class CharSelectCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _93647166bgImg:Image;
        private var _1818849004textinput1:TextInput;
        private var _1016998297canvas100:Canvas;
        public var _CharSelectCanvas_AddChild1:AddChild;
        public var _CharSelectCanvas_AddChild2:AddChild;
        public var _CharSelectCanvas_AddChild3:AddChild;
        private var _3056711cls1:ClassVO;
        private var _3056715cls5:ClassVO;
        private var _553969783career5:BasicFilteredLabel;
        private var _739034253charImg:Image;
        private var _105740680canvas99:Canvas;
        private var _1110417475label1:Label;
        private var _553969779career1:BasicFilteredLabel;
        private var _3052371chc1:ClassHeadCanvas;
        private var _241352517button7:BasicGlowButton;
        private var _553969781career3:BasicFilteredLabel;
        private var _3052375chc5:ClassHeadCanvas;
        public var _CharSelectCanvas_Label1:Label;
        private var _1361218077choos1:Button;
        private var _1395491115cClass:String;
        private var _878521912txtTips:Text;
        private var _1314878258tileBtn:Tile;
        private var _550778335canvas7:Canvas;
        private var selectedChar:CharactorSelectCanvas;
        private var _3056714cls4:ClassVO;
        private var _241352515button5:BasicGlowButton;
        private var _394199998footRing:UIComponent;
        private var gender:String;
        private var _1982979738bgFadeIn:Fade;
        private var drawFlag:Boolean = false;
        private var _1035784137textarea1:TextArea;
        private var _1444626525aLevel:int;
        private var _1586673493inputNameCvs:Canvas;
        private var _241352513button3:BasicGlowButton;
        private var _3052374chc4:ClassHeadCanvas;
        public var _CharSelectCanvas_SetProperty1:SetProperty;
        public var _CharSelectCanvas_SetProperty2:SetProperty;
        public var _CharSelectCanvas_SetProperty3:SetProperty;
        public var charName:String = "";
        private var _847803630enterGameBtn:Button;
        private var _553969784career6:BasicFilteredLabel;
        private var _1706774901inputName:TextInput;
        private var _3056713cls3:ClassVO;
        private var _249405520randName:Button;
        private var guildtimer:Timer;
        private var _1361218076choos2:Button;
        private var _1016998298canvas101:Canvas;
        private var _553969782career4:BasicFilteredLabel;
        public var _CharSelectCanvas_RoundedLabel1:RoundedLabel;
        public var _CharSelectCanvas_RoundedLabel2:RoundedLabel;
        public var _CharSelectCanvas_RoundedLabel3:RoundedLabel;
        public var _CharSelectCanvas_RoundedLabel4:RoundedLabel;
        public var _CharSelectCanvas_RoundedLabel5:RoundedLabel;
        private var guildStep:int;
        private var _3052373chc3:ClassHeadCanvas;
        private var _550778336canvas8:Canvas;
        private var _1108006699button14:BasicGlowButton;
        private var _1387368223cLevel:String;
        private var charactorArr:ArrayCollection;
        private var _241352516button6:BasicGlowButton;
        private var _553969780career2:BasicFilteredLabel;
        private var _3056712cls2:ClassVO;
        private var currentPage:int = 0;
        private var _3056716cls6:ClassVO;
        private var _550778334canvas6:Canvas;
        private var _1988451153NMLBtn:Image;
        private var _241352514button4:BasicGlowButton;
        private var _1361218025choose:ViewStack;
        private var _newChar:Object;
        private var _93848974cName:String;
        private var _1435069191charDesc:BasicGlowButton;
        private var _3052372chc2:ClassHeadCanvas;
        private var _3052376chc6:ClassHeadCanvas;
        private var _1462490097selectCharImg:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":900,
                    "height":570,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"bgImg",
                        "events":{"complete":"__bgImg_complete"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":true,
                                "x":0,
                                "y":0,
                                "width":900,
                                "height":570
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"choose",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "percentWidth":100,
                                "percentHeight":100,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"canvas7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"View 1",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Tile,
                                                "id":"tileBtn",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalGap = 7.5;
                                                    this.paddingTop = 32;
                                                    this.paddingLeft = 12;
                                                    this.paddingRight = 0;
                                                    this.paddingBottom = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasLogined",
                                                        "width":425,
                                                        "x":239,
                                                        "height":105,
                                                        "y":345
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"textinput1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":260,
                                                        "y":354,
                                                        "styleName":"CharSelectTitle",
                                                        "editable":false,
                                                        "enabled":false,
                                                        "width":114
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":237,
                                                        "y":467,
                                                        "width":430,
                                                        "height":50,
                                                        "styleName":"ButtonWrapper",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"button5",
                                                            "events":{"click":"__button5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":35,
                                                                    "y":11,
                                                                    "width":84,
                                                                    "styleName":"LoginButton"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"button7",
                                                            "events":{"click":"__button7_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":135,
                                                                    "y":11,
                                                                    "styleName":"LoginButton",
                                                                    "enabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"button4",
                                                            "events":{"click":"__button4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":135,
                                                                    "y":11,
                                                                    "width":84,
                                                                    "styleName":"LoginButton",
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"button6",
                                                            "events":{"click":"__button6_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":235,
                                                                    "y":11,
                                                                    "width":84,
                                                                    "styleName":"LoginButton",
                                                                    "enabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"button3",
                                                            "events":{"click":"__button3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":335,
                                                                    "y":11,
                                                                    "styleName":"LoginButton"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"selectCharImg",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":300,
                                                        "y":0,
                                                        "scaleContent":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"button14",
                                                "events":{"click":"__button14_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":560,
                                                        "y":315,
                                                        "styleName":"LoginButton",
                                                        "width":107
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"canvas8",
                                    "events":{
                                        "creationComplete":"__canvas8_creationComplete",
                                        "show":"__canvas8_show"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"create",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":UIComponent,
                                                "id":"footRing",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":135,
                                                        "y":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"charImg",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":190,
                                                        "y":30,
                                                        "width":383,
                                                        "height":494,
                                                        "scaleContent":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"NMLBtn",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":85,
                                                        "y":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"canvas6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":630,
                                                        "y":102,
                                                        "width":165,
                                                        "styleName":"CharCreBorder",
                                                        "height":380,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ClassHeadCanvas,
                                                            "id":"chc1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":30});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ClassHeadCanvas,
                                                            "id":"chc3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":85});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ClassHeadCanvas,
                                                            "id":"chc5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":140});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ClassHeadCanvas,
                                                            "id":"chc2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":195});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ClassHeadCanvas,
                                                            "id":"chc4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":250});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ClassHeadCanvas,
                                                            "id":"chc6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":305});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicFilteredLabel,
                                                            "id":"career1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "y":36,
                                                                    "width":25,
                                                                    "height":38,
                                                                    "styleName":"CharCreCareerText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicFilteredLabel,
                                                            "id":"career2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "y":91,
                                                                    "width":25,
                                                                    "height":38,
                                                                    "styleName":"CharCreCareerText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicFilteredLabel,
                                                            "id":"career3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "y":146,
                                                                    "width":25,
                                                                    "height":38,
                                                                    "styleName":"CharCreCareerText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicFilteredLabel,
                                                            "id":"career4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "y":201,
                                                                    "width":25,
                                                                    "height":38,
                                                                    "styleName":"CharCreCareerText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicFilteredLabel,
                                                            "id":"career5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "y":0x0100,
                                                                    "width":25,
                                                                    "height":38,
                                                                    "styleName":"CharCreCareerText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicFilteredLabel,
                                                            "id":"career6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "y":311,
                                                                    "width":25,
                                                                    "height":38,
                                                                    "styleName":"CharCreCareerText"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"canvas101",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CharCreTitle",
                                                        "x":661,
                                                        "y":90,
                                                        "width":113,
                                                        "height":30,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_CharSelectCanvas_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"LabelCharCreTitle",
                                                                    "x":0,
                                                                    "width":113,
                                                                    "height":25,
                                                                    "y":5
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"label1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16768881;
                                                    this.fontSize = 16;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":305,
                                                        "y":423
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"inputNameCvs",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":280,
                                                        "y":450,
                                                        "width":165,
                                                        "height":28,
                                                        "styleName":"CharCreNameInput",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":TextInput,
                                                            "id":"inputName",
                                                            "events":{"keyDown":"__inputName_keyDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.fontSize = 14;
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":4,
                                                                    "width":165,
                                                                    "height":22,
                                                                    "maxChars":12
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"randName",
                                                            "events":{"click":"__randName_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":145,
                                                                    "y":2,
                                                                    "styleName":"Dice",
                                                                    "toolTip":"Nhấp chọn nhận tên ngẫu nhiên"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"enterGameBtn",
                                                "events":{"click":"__enterGameBtn_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CharCreEnter",
                                                        "x":305,
                                                        "y":495
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"charDesc",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":400,
                                            "y":31,
                                            "selected":true,
                                            "visible":true,
                                            "styleName":"BtnHorTabBlue",
                                            "labelPlacement":"bottom",
                                            "width":63.3,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CharSelectCanvas_RoundedLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15361583;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":802,
                                            "y":383,
                                            "width":15,
                                            "height":15,
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CharSelectCanvas_RoundedLabel2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 14689269;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":848,
                                            "y":418,
                                            "width":15,
                                            "height":15,
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CharSelectCanvas_RoundedLabel3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16081443;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":832,
                                            "y":470,
                                            "width":15,
                                            "height":15,
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CharSelectCanvas_RoundedLabel4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 2329845;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":774,
                                            "y":470,
                                            "width":15,
                                            "height":15,
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_CharSelectCanvas_RoundedLabel5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 9301547;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":758,
                                            "y":418,
                                            "width":15,
                                            "height":15,
                                            "visible":true
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"textarea1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "x":155,
                                "y":170,
                                "width":356,
                                "height":73,
                                "editable":false,
                                "selectable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvas100",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":65,
                                "width":125,
                                "x":300,
                                "y":10,
                                "styleName":"RoundedGradientBorder",
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvas99",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":65,
                                "width":125,
                                "x":203,
                                "y":10,
                                "styleName":"RoundedGradientBorder",
                                "visible":false
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _853620273classVO:ClassVO = new ClassVO();
        private var _drawToolTipManager:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CharSelectCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.verticalCenter = "0";
                this.horizontalCenter = "0";
            };
            this.width = 900;
            this.height = 570;
            this.currentState = "choose";
            this.states = [_CharSelectCanvas_State1_c(), _CharSelectCanvas_State2_c()];
            _CharSelectCanvas_Fade1_i();
            this.addEventListener("creationComplete", ___CharSelectCanvas_Canvas1_creationComplete);
            this.addEventListener("show", ___CharSelectCanvas_Canvas1_show);
            this.addEventListener("hide", ___CharSelectCanvas_Canvas1_hide);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CharSelectCanvas._watcherSetupUtil = _arg_1;
        }


        private function showProp(_arg_1:ClassVO):void
        {
        }

        public function set selectCharImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1462490097selectCharImg;
            if (_local_2 !== _arg_1)
            {
                this._1462490097selectCharImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectCharImg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get aLevel():int
        {
            return (this._1444626525aLevel);
        }

        [Bindable(event="propertyChange")]
        public function get selectCharImg():Image
        {
            return (this._1462490097selectCharImg);
        }

        private function _CharSelectCanvas_AddChild1_i():AddChild
        {
            var _local_1:AddChild = new AddChild();
            _CharSelectCanvas_AddChild1 = _local_1;
            _local_1.position = "lastChild";
            _local_1.targetFactory = new DeferredInstanceFromFunction(_CharSelectCanvas_Button1_i);
            BindingManager.executeBindings(this, "_CharSelectCanvas_AddChild1", _CharSelectCanvas_AddChild1);
            return (_local_1);
        }

        public function set charDesc(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1435069191charDesc;
            if (_local_2 !== _arg_1)
            {
                this._1435069191charDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charDesc", _local_2, _arg_1));
            };
        }

        public function __choos1_click(_arg_1:MouseEvent):void
        {
            onChoosOne();
        }

        [Bindable(event="propertyChange")]
        public function get choose():ViewStack
        {
            return (this._1361218025choose);
        }

        private function set cClass(_arg_1:String):void
        {
            var _local_2:Object = this._1395491115cClass;
            if (_local_2 !== _arg_1)
            {
                this._1395491115cClass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cClass", _local_2, _arg_1));
            };
        }

        public function set enterGameBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._847803630enterGameBtn;
            if (_local_2 !== _arg_1)
            {
                this._847803630enterGameBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enterGameBtn", _local_2, _arg_1));
            };
        }

        public function __button7_click(_arg_1:MouseEvent):void
        {
            onDelete();
        }

        public function set textinput1(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1818849004textinput1;
            if (_local_2 !== _arg_1)
            {
                this._1818849004textinput1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textinput1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get classVO():ClassVO
        {
            return (this._853620273classVO);
        }

        private function inPutNameHandler(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.ENTER)
            {
                createNewCharactor();
            };
        }

        private function reChar():void
        {
            var func:Function;
            if (((selectedChar) && (selectedChar.deleted)))
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == 1)
                    {
                        _core.remote.restoreChar(_core.guid, selectedChar.cid);
                    };
                };
            };
            var delStr:String = Language.CHARSELECTCANVAS_U[29].replace("{cname}", selectedChar.cName);
            Alert.show(delStr, "", (Alert.YES | Alert.NO), null, func);
        }

        public function set choose(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1361218025choose;
            if (_local_2 !== _arg_1)
            {
                this._1361218025choose = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "choose", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get textarea1():TextArea
        {
            return (this._1035784137textarea1);
        }

        private function onInputNameFocused(_arg_1:MouseEvent):void
        {
            destroyToolTip(enterGameBtn);
            drawToolTip(inputNameCvs, 4, Language.CHARSELECTCANVAS_S[18]);
        }

        [Bindable(event="propertyChange")]
        private function get cls6():ClassVO
        {
            return (this._3056716cls6);
        }

        [Bindable(event="propertyChange")]
        private function get cls1():ClassVO
        {
            return (this._3056711cls1);
        }

        [Bindable(event="propertyChange")]
        private function get cls2():ClassVO
        {
            return (this._3056712cls2);
        }

        [Bindable(event="propertyChange")]
        public function get randName():Button
        {
            return (this._249405520randName);
        }

        [Bindable(event="propertyChange")]
        private function get cls3():ClassVO
        {
            return (this._3056713cls3);
        }

        private function _CharSelectCanvas_SetProperty3_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _CharSelectCanvas_SetProperty3 = _local_1;
            _local_1.name = "filters";
            BindingManager.executeBindings(this, "_CharSelectCanvas_SetProperty3", _CharSelectCanvas_SetProperty3);
            return (_local_1);
        }

        private function onChoosTwo():void
        {
            var _local_3:int;
            var _local_4:CharactorSelectCanvas;
            var _local_5:int;
            var _local_6:CharactorSelectCanvas;
            if (charactorArr.length <= (currentPage * 3))
            {
                return;
            };
            var _local_1:int = (currentPage * 3);
            var _local_2:int = ((currentPage * 3) + 3);
            tileBtn.removeAllChildren();
            if (charactorArr.length >= _local_2)
            {
                _local_3 = _local_1;
                while (_local_3 < _local_2)
                {
                    _local_4 = new CharactorSelectCanvas();
                    _local_4.cData = charactorArr[_local_3];
                    _local_4.doubleClickEnabled = true;
                    _local_4.addEventListener(MouseEvent.CLICK, clickHandler);
                    tileBtn.addChild(_local_4);
                    _local_3++;
                };
                selectedChar = CharactorSelectCanvas(tileBtn.getChildAt(0));
                setTimeout(select, 100, selectedChar);
            }
            else
            {
                _local_5 = _local_1;
                while (_local_5 < charactorArr.length)
                {
                    _local_6 = new CharactorSelectCanvas();
                    _local_6.cData = charactorArr[_local_5];
                    _local_6.doubleClickEnabled = true;
                    _local_6.addEventListener(MouseEvent.CLICK, clickHandler);
                    tileBtn.addChild(_local_6);
                    _local_5++;
                };
                selectedChar = CharactorSelectCanvas(tileBtn.getChildAt(0));
                setTimeout(select, 100, selectedChar);
            };
            if (charactorArr.length <= _local_2)
            {
                choos2.visible = false;
            };
            choos1.visible = true;
            currentPage++;
            if (tileBtn.numChildren == 2)
            {
                canvas100.visible = true;
                tileBtn.addChild(canvas100);
            };
            if (tileBtn.numChildren == 1)
            {
                canvas100.visible = true;
                canvas99.visible = true;
                tileBtn.addChild(canvas100);
                tileBtn.addChild(canvas99);
            };
        }

        [Bindable(event="propertyChange")]
        private function get cls5():ClassVO
        {
            return (this._3056715cls5);
        }

        private function autoSetFocus():void
        {
            Application.application.focusManager.setFocus(inputName);
        }

        private function set classVO(_arg_1:ClassVO):void
        {
            var _local_2:Object = this._853620273classVO;
            if (_local_2 !== _arg_1)
            {
                this._853620273classVO = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classVO", _local_2, _arg_1));
            };
        }

        public function __button4_click(_arg_1:MouseEvent):void
        {
            reChar();
        }

        public function set textarea1(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1035784137textarea1;
            if (_local_2 !== _arg_1)
            {
                this._1035784137textarea1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textarea1", _local_2, _arg_1));
            };
        }

        private function onDelete():void
        {
            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.CHARSELECTCANVAS_S[16], delCharactor);
        }

        [Bindable(event="propertyChange")]
        public function get career2():BasicFilteredLabel
        {
            return (this._553969780career2);
        }

        [Bindable(event="propertyChange")]
        public function get career3():BasicFilteredLabel
        {
            return (this._553969781career3);
        }

        private function onChoosOne():void
        {
            var _local_1:int;
            var _local_2:CharactorSelectCanvas;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:CharactorSelectCanvas;
            tileBtn.removeAllChildren();
            if (currentPage <= 2)
            {
                _local_1 = 0;
                while (_local_1 < 3)
                {
                    _local_2 = new CharactorSelectCanvas();
                    _local_2.cData = charactorArr[_local_1];
                    _local_2.doubleClickEnabled = true;
                    _local_2.addEventListener(MouseEvent.CLICK, clickHandler);
                    tileBtn.addChild(_local_2);
                    _local_1++;
                };
                selectedChar = CharactorSelectCanvas(tileBtn.getChildAt(0));
                setTimeout(select, 100, selectedChar);
                choos2.visible = true;
                choos1.visible = false;
            }
            else
            {
                _local_3 = ((currentPage - 2) * 3);
                _local_4 = ((currentPage - 1) * 3);
                _local_5 = _local_3;
                while (_local_5 < _local_4)
                {
                    _local_6 = new CharactorSelectCanvas();
                    _local_6.cData = charactorArr[_local_5];
                    _local_6.doubleClickEnabled = true;
                    _local_6.addEventListener(MouseEvent.CLICK, clickHandler);
                    tileBtn.addChild(_local_6);
                    _local_5++;
                };
                selectedChar = CharactorSelectCanvas(tileBtn.getChildAt(0));
                setTimeout(select, 100, selectedChar);
                choos2.visible = true;
                choos1.visible = true;
            };
            currentPage--;
            if (tileBtn.numChildren == 2)
            {
                canvas100.visible = true;
                tileBtn.addChild(canvas100);
            };
            if (tileBtn.numChildren == 1)
            {
                canvas100.visible = true;
                canvas99.visible = true;
                tileBtn.addChild(canvas100);
                tileBtn.addChild(canvas99);
            };
        }

        [Bindable(event="propertyChange")]
        public function get canvas99():Canvas
        {
            return (this._105740680canvas99);
        }

        [Bindable(event="propertyChange")]
        public function get career1():BasicFilteredLabel
        {
            return (this._553969779career1);
        }

        [Bindable(event="propertyChange")]
        public function get career4():BasicFilteredLabel
        {
            return (this._553969782career4);
        }

        [Bindable(event="propertyChange")]
        public function get career6():BasicFilteredLabel
        {
            return (this._553969784career6);
        }

        public function set button3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._241352513button3;
            if (_local_2 !== _arg_1)
            {
                this._241352513button3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button3", _local_2, _arg_1));
            };
        }

        public function set bgImg(_arg_1:Image):void
        {
            var _local_2:Object = this._93647166bgImg;
            if (_local_2 !== _arg_1)
            {
                this._93647166bgImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgImg", _local_2, _arg_1));
            };
        }

        public function set button4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._241352514button4;
            if (_local_2 !== _arg_1)
            {
                this._241352514button4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button4", _local_2, _arg_1));
            };
        }

        public function set button5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._241352515button5;
            if (_local_2 !== _arg_1)
            {
                this._241352515button5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button5", _local_2, _arg_1));
            };
        }

        private function destroyToolTip(_arg_1:UIComponent=null):void
        {
            var _local_2:Canvas;
            var _local_3:String;
            if (_arg_1)
            {
                if (_drawToolTipManager[_arg_1.id])
                {
                    _local_2 = _drawToolTipManager[_arg_1.id];
                    if (contains(_local_2))
                    {
                        removeChild(_local_2);
                        _local_2.graphics.clear();
                        _local_2.removeAllChildren();
                        _local_2 = null;
                        delete _drawToolTipManager[_arg_1.id];
                    };
                };
            }
            else
            {
                for (_local_3 in _drawToolTipManager)
                {
                    _local_2 = _drawToolTipManager[_local_3];
                    if (contains(_local_2))
                    {
                        removeChild(_local_2);
                        _local_2.graphics.clear();
                        _local_2.removeAllChildren();
                        _local_2 = null;
                        delete _drawToolTipManager[_local_3];
                    };
                };
            };
        }

        public function set button7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._241352517button7;
            if (_local_2 !== _arg_1)
            {
                this._241352517button7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get charImg():Image
        {
            return (this._739034253charImg);
        }

        public function set button6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._241352516button6;
            if (_local_2 !== _arg_1)
            {
                this._241352516button6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button6", _local_2, _arg_1));
            };
        }

        private function set cls2(_arg_1:ClassVO):void
        {
            var _local_2:Object = this._3056712cls2;
            if (_local_2 !== _arg_1)
            {
                this._3056712cls2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cls2", _local_2, _arg_1));
            };
        }

        private function set cls3(_arg_1:ClassVO):void
        {
            var _local_2:Object = this._3056713cls3;
            if (_local_2 !== _arg_1)
            {
                this._3056713cls3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cls3", _local_2, _arg_1));
            };
        }

        private function setEffect():void
        {
            var _local_1:* = new ResManager.ANI_CHAR_CRE();
            _local_1.x = -30;
            _local_1.y = -640;
            _local_1.height = 50;
            _local_1.width = 300;
            footRing.addChild(_local_1);
        }

        private function delCharactor(_arg_1:String):void
        {
            button5.enabled = false;
            startDelete(_arg_1);
        }

        private function set cls1(_arg_1:ClassVO):void
        {
            var _local_2:Object = this._3056711cls1;
            if (_local_2 !== _arg_1)
            {
                this._3056711cls1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cls1", _local_2, _arg_1));
            };
        }

        private function set cls5(_arg_1:ClassVO):void
        {
            var _local_2:Object = this._3056715cls5;
            if (_local_2 !== _arg_1)
            {
                this._3056715cls5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cls5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get career5():BasicFilteredLabel
        {
            return (this._553969783career5);
        }

        [Bindable(event="propertyChange")]
        private function get cls4():ClassVO
        {
            return (this._3056714cls4);
        }

        private function set cls6(_arg_1:ClassVO):void
        {
            var _local_2:Object = this._3056716cls6;
            if (_local_2 !== _arg_1)
            {
                this._3056716cls6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cls6", _local_2, _arg_1));
            };
        }

        public function set randName(_arg_1:Button):void
        {
            var _local_2:Object = this._249405520randName;
            if (_local_2 !== _arg_1)
            {
                this._249405520randName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "randName", _local_2, _arg_1));
            };
        }

        private function clickHandler(_arg_1:Event):void
        {
            var _local_2:CharactorSelectCanvas = CharactorSelectCanvas(_arg_1.currentTarget);
            select(_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get inputNameCvs():Canvas
        {
            return (this._1586673493inputNameCvs);
        }

        private function startDelete(_arg_1:String):void
        {
            _core.view.getUI(ViewManager.POPU_WAIT).showText(Language.CHARSELECTCANVAS_S[10]);
            _core.view.getUI(ViewManager.POPU_WAIT).showTime(3);
            var _local_2:String = MD5.hash(_arg_1);
            _core.remote.startDeleteChar(int(selectedChar.cid), _local_2);
            aLevel = 0;
            _core.acountLv = 0;
        }

        private function rand3(_arg_1:Object):Object
        {
            var _local_3:String;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_2.push(_arg_1[_local_3]);
            };
            return (_local_2[Math.floor((Math.random() * _local_2.length))]);
        }

        [Bindable(event="propertyChange")]
        public function get NMLBtn():Image
        {
            return (this._1988451153NMLBtn);
        }

        private function _CharSelectCanvas_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "create";
            _local_1.overrides = [_CharSelectCanvas_SetProperty2_i(), _CharSelectCanvas_SetProperty3_i()];
            return (_local_1);
        }

        private function set cls4(_arg_1:ClassVO):void
        {
            var _local_2:Object = this._3056714cls4;
            if (_local_2 !== _arg_1)
            {
                this._3056714cls4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cls4", _local_2, _arg_1));
            };
        }

        public function set chc2(_arg_1:ClassHeadCanvas):void
        {
            var _local_2:Object = this._3052372chc2;
            if (_local_2 !== _arg_1)
            {
                this._3052372chc2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chc2", _local_2, _arg_1));
            };
        }

        public function __randName_click(_arg_1:MouseEvent):void
        {
            setRandName();
        }

        private function _CharSelectCanvas_Button2_i():Button
        {
            var _local_1:Button = new Button();
            choos1 = _local_1;
            _local_1.x = 200;
            _local_1.y = 395;
            _local_1.styleName = "BtnLoginTurnLeft";
            _local_1.visible = false;
            _local_1.addEventListener("click", __choos1_click);
            _local_1.id = "choos1";
            if (!_local_1.document)
            {
                _local_1.document = this;
            };
            return (_local_1);
        }

        private function _CharSelectCanvas_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _CharSelectCanvas_SetProperty2 = _local_1;
            _local_1.name = "selectedIndex";
            _local_1.value = 1;
            BindingManager.executeBindings(this, "_CharSelectCanvas_SetProperty2", _CharSelectCanvas_SetProperty2);
            return (_local_1);
        }

        public function set chc6(_arg_1:ClassHeadCanvas):void
        {
            var _local_2:Object = this._3052376chc6;
            if (_local_2 !== _arg_1)
            {
                this._3052376chc6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chc6", _local_2, _arg_1));
            };
        }

        public function set chc3(_arg_1:ClassHeadCanvas):void
        {
            var _local_2:Object = this._3052373chc3;
            if (_local_2 !== _arg_1)
            {
                this._3052373chc3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chc3", _local_2, _arg_1));
            };
        }

        public function set chc5(_arg_1:ClassHeadCanvas):void
        {
            var _local_2:Object = this._3052375chc5;
            if (_local_2 !== _arg_1)
            {
                this._3052375chc5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chc5", _local_2, _arg_1));
            };
        }

        private function onLogin():void
        {
            if (selectedChar)
            {
                if (selectedChar.deleted)
                {
                    return;
                };
                _core.remote.chooseCharactor(int(selectedChar.cid));
                _core.view.getUI(ViewManager.POPU_WAIT).showText(Language.CHARSELECTCANVAS_S[9]);
                button5.enabled = false;
            };
        }

        private function getAcountGold(_arg_1:int):int
        {
            if (_arg_1 == 1)
            {
                return (500);
            };
            if (_arg_1 == 2)
            {
                return (1000);
            };
            if (_arg_1 == 3)
            {
                return (1500);
            };
            return (0);
        }

        public function set bgFadeIn(_arg_1:Fade):void
        {
            var _local_2:Object = this._1982979738bgFadeIn;
            if (_local_2 !== _arg_1)
            {
                this._1982979738bgFadeIn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgFadeIn", _local_2, _arg_1));
            };
        }

        private function setRandName():void
        {
            var _local_3:String;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
            randName.setFocus();
            destroyToolTip(inputNameCvs);
            drawToolTip(enterGameBtn, 2, Language.CHARSELECTCANVAS_S[17]);
            var _local_1:Object = _core.data.gameDataIndex[80];
            var _local_2:Array = [];
            for (_local_3 in _local_1)
            {
                if (_local_3 != "0")
                {
                    _local_2.push(_local_1[_local_3]);
                };
            };
            _local_1 = _local_2[Math.floor((Math.random() * _local_2.length))];
            _local_4 = rand3(_local_1);
            if (((!(_local_4)) || (((!(ToolKit.isEqual(_local_4.type, 32))) && (String(_local_4.name).length < 6)) && (Math.random() > 0.3))))
            {
                _local_5 = rand3(_local_1);
                while (((_local_4.id == _local_5.id) || (String((_local_4.name + _local_5.name)).length > 12)))
                {
                    _local_5 = rand3(_local_1);
                };
            };
            if (((_local_5) && (Math.floor((_local_4.type / 10)) == 2)))
            {
                inputName.text = ((_local_4.name + "·") + _local_5.name);
            }
            else
            {
                inputName.text = (_local_4.name + ((_local_5) ? _local_5.name : ""));
            };
            if (Math.random() > 0.7)
            {
                _local_6 = rand3(_core.data.gameDataIndex[80][0]).name;
                if (_local_6)
                {
                    inputName.text = ((_local_6 + inputName.text) + _local_6);
                };
            };
            if (String(Language.GAMEPREDEF_S[338]).indexOf(inputName.text) > 0)
            {
                inputName.text = "";
                setRandName();
            };
        }

        public function set chc1(_arg_1:ClassHeadCanvas):void
        {
            var _local_2:Object = this._3052371chc1;
            if (_local_2 !== _arg_1)
            {
                this._3052371chc1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chc1", _local_2, _arg_1));
            };
        }

        public function set chc4(_arg_1:ClassHeadCanvas):void
        {
            var _local_2:Object = this._3052374chc4;
            if (_local_2 !== _arg_1)
            {
                this._3052374chc4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chc4", _local_2, _arg_1));
            };
        }

        private function _CharSelectCanvas_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "choose";
            _local_1.overrides = [_CharSelectCanvas_AddChild1_i(), _CharSelectCanvas_AddChild2_i(), _CharSelectCanvas_SetProperty1_i(), _CharSelectCanvas_AddChild3_i()];
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get button14():BasicGlowButton
        {
            return (this._1108006699button14);
        }

        [Bindable(event="propertyChange")]
        public function get tileBtn():Tile
        {
            return (this._1314878258tileBtn);
        }

        private function _CharSelectCanvas_SetProperty1_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _CharSelectCanvas_SetProperty1 = _local_1;
            _local_1.name = "y";
            _local_1.value = 349;
            BindingManager.executeBindings(this, "_CharSelectCanvas_SetProperty1", _CharSelectCanvas_SetProperty1);
            return (_local_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
        }

        public function set career5(_arg_1:BasicFilteredLabel):void
        {
            var _local_2:Object = this._553969783career5;
            if (_local_2 !== _arg_1)
            {
                this._553969783career5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "career5", _local_2, _arg_1));
            };
        }

        private function getAcountName(_arg_1:int):String
        {
            if (_arg_1 == 1)
            {
                return (Language.CHARSELECTCANVAS_S[0]);
            };
            if (_arg_1 == 2)
            {
                return (Language.CHARSELECTCANVAS_S[1]);
            };
            if (_arg_1 == 3)
            {
                return (Language.CHARSELECTCANVAS_S[2]);
            };
            return (Language.CHARSELECTCANVAS_S[3]);
        }

        private function _CharSelectCanvas_Button1_i():Button
        {
            var _local_1:Button = new Button();
            choos2 = _local_1;
            _local_1.styleName = "BtnLoginTurnRight";
            _local_1.x = 673;
            _local_1.y = 395;
            _local_1.visible = false;
            _local_1.addEventListener("click", __choos2_click);
            _local_1.id = "choos2";
            if (!_local_1.document)
            {
                _local_1.document = this;
            };
            return (_local_1);
        }

        public function __button6_click(_arg_1:MouseEvent):void
        {
            onCreate();
        }

        public function set career1(_arg_1:BasicFilteredLabel):void
        {
            var _local_2:Object = this._553969779career1;
            if (_local_2 !== _arg_1)
            {
                this._553969779career1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "career1", _local_2, _arg_1));
            };
        }

        public function __inputName_keyDown(_arg_1:KeyboardEvent):void
        {
            inPutNameHandler(_arg_1);
        }

        public function set career3(_arg_1:BasicFilteredLabel):void
        {
            var _local_2:Object = this._553969781career3;
            if (_local_2 !== _arg_1)
            {
                this._553969781career3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "career3", _local_2, _arg_1));
            };
        }

        public function __bgImg_complete(_arg_1:Event):void
        {
            bgFadeIn.stop();
            bgFadeIn.play();
        }

        public function set career4(_arg_1:BasicFilteredLabel):void
        {
            var _local_2:Object = this._553969782career4;
            if (_local_2 !== _arg_1)
            {
                this._553969782career4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "career4", _local_2, _arg_1));
            };
        }

        private function select(_arg_1:CharactorSelectCanvas):void
        {
            if (!_arg_1)
            {
                return;
            };
            selectedChar.selected = false;
            _arg_1.selected = true;
            selectedChar = _arg_1;
            selectCharImg.source = _arg_1.cImgUrl;
            cName = _arg_1.cName;
            cLevel = _arg_1.cLevel;
            cClass = _arg_1.cClass;
            button5.enabled = true;
            if (_arg_1.deleted)
            {
                button5.enabled = false;
                button7.visible = false;
                button4.visible = true;
                txtTips.htmlText = _arg_1.tips;
            }
            else
            {
                button5.enabled = true;
                button7.visible = true;
                button4.visible = false;
                txtTips.htmlText = "";
            };
        }

        public function set canvas99(_arg_1:Canvas):void
        {
            var _local_2:Object = this._105740680canvas99;
            if (_local_2 !== _arg_1)
            {
                this._105740680canvas99 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas99", _local_2, _arg_1));
            };
        }

        private function setClassData():void
        {
            var _local_4:Object;
            var _local_5:ClassVO;
            var _local_6:Object;
            var _local_1:Array = _core.data.getGameDataList(GamePredef.TBL_CLASS);
            if (!_local_1)
            {
                callLater(setClassData);
                return;
            };
            _newChar = {};
            var _local_2:Number = Math.floor((Math.random() * 12));
            var _local_3:Number = (Math.floor((_local_2 / 2)) + 1);
            if (this[("cls" + _local_3)] == null)
            {
                for each (_local_4 in _local_1)
                {
                    if (_local_4)
                    {
                        _local_5 = new ClassVO();
                        _local_5.data = _local_4;
                        this[("cls" + _local_4.id)] = _local_5;
                    };
                };
            };
            if (this[("cls" + _local_3)])
            {
                if ((_local_2 % 2) == 0)
                {
                    gender = "maleIconImage";
                }
                else
                {
                    gender = "femaleIconImage";
                };
                _local_6 = {};
                _local_6.gender = gender;
                _local_6.classData = this[("cls" + _local_3)];
                callLater(focusClassHead, [_local_3]);
                changeResAndDes(_local_6);
            };
            inputName.addEventListener(MouseEvent.CLICK, onInputNameFocused);
            setRandName();
            enterGameBtn.setFocus();
            drawToolTip(enterGameBtn, 2, Language.CHARSELECTCANVAS_S[17]);
        }

        public function set inputName(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1706774901inputName;
            if (_local_2 !== _arg_1)
            {
                this._1706774901inputName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inputName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get charDesc():BasicGlowButton
        {
            return (this._1435069191charDesc);
        }

        public function set career6(_arg_1:BasicFilteredLabel):void
        {
            var _local_2:Object = this._553969784career6;
            if (_local_2 !== _arg_1)
            {
                this._553969784career6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "career6", _local_2, _arg_1));
            };
        }

        public function set career2(_arg_1:BasicFilteredLabel):void
        {
            var _local_2:Object = this._553969780career2;
            if (_local_2 !== _arg_1)
            {
                this._553969780career2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "career2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get cLevel():String
        {
            return (this._1387368223cLevel);
        }

        [Bindable(event="propertyChange")]
        public function get enterGameBtn():Button
        {
            return (this._847803630enterGameBtn);
        }

        [Bindable(event="propertyChange")]
        public function get textinput1():TextInput
        {
            return (this._1818849004textinput1);
        }

        public function set charImg(_arg_1:Image):void
        {
            var _local_2:Object = this._739034253charImg;
            if (_local_2 !== _arg_1)
            {
                this._739034253charImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charImg", _local_2, _arg_1));
            };
        }

        private function set cName(_arg_1:String):void
        {
            var _local_2:Object = this._93848974cName;
            if (_local_2 !== _arg_1)
            {
                this._93848974cName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cName", _local_2, _arg_1));
            };
        }

        private function dClickHandler(_arg_1:Event):void
        {
        }

        public function __button3_click(_arg_1:MouseEvent):void
        {
            onReturn();
        }

        public function set canvas101(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1016998298canvas101;
            if (_local_2 !== _arg_1)
            {
                this._1016998298canvas101 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas101", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get cClass():String
        {
            return (this._1395491115cClass);
        }

        private function onCancel():void
        {
            currentState = "choose";
        }

        private function _CharSelectCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():UIComponent
            {
                return (canvas7);
            }, function (_arg_1:UIComponent):void
            {
                _CharSelectCanvas_AddChild1.relativeTo = _arg_1;
            }, "_CharSelectCanvas_AddChild1.relativeTo");
            result[0] = binding;
            binding = new Binding(this, function ():UIComponent
            {
                return (canvas7);
            }, function (_arg_1:UIComponent):void
            {
                _CharSelectCanvas_AddChild2.relativeTo = _arg_1;
            }, "_CharSelectCanvas_AddChild2.relativeTo");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (textinput1);
            }, function (_arg_1:Object):void
            {
                _CharSelectCanvas_SetProperty1.target = _arg_1;
            }, "_CharSelectCanvas_SetProperty1.target");
            result[2] = binding;
            binding = new Binding(this, function ():UIComponent
            {
                return (canvas7);
            }, function (_arg_1:UIComponent):void
            {
                _CharSelectCanvas_AddChild3.relativeTo = _arg_1;
            }, "_CharSelectCanvas_AddChild3.relativeTo");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (choose);
            }, function (_arg_1:Object):void
            {
                _CharSelectCanvas_SetProperty2.target = _arg_1;
            }, "_CharSelectCanvas_SetProperty2.target");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bgImg);
            }, function (_arg_1:Object):void
            {
                _CharSelectCanvas_SetProperty3.target = _arg_1;
            }, "_CharSelectCanvas_SetProperty3.target");
            result[5] = binding;
            binding = new Binding(this, function ():*
            {
                return ([new ColorMatrixFilter([0])]);
            }, function (_arg_1:*):void
            {
                _CharSelectCanvas_SetProperty3.value = _arg_1;
            }, "_CharSelectCanvas_SetProperty3.value");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bgImg);
            }, function (_arg_1:Object):void
            {
                bgFadeIn.target = _arg_1;
            }, "bgFadeIn.target");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button5.label = _arg_1;
            }, "button5.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button7.label = _arg_1;
            }, "button7.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button4.label = _arg_1;
            }, "button4.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button6.label = _arg_1;
            }, "button6.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button3.label = _arg_1;
            }, "button3.label");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_BLACK_ROUND]);
            }, function (_arg_1:Array):void
            {
                selectCharImg.filters = _arg_1;
            }, "selectCharImg.filters");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button14.label = _arg_1;
            }, "button14.label");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.LABEL_CHAR_CRE_1);
            }, function (_arg_1:Object):void
            {
                NMLBtn.source = _arg_1;
            }, "NMLBtn.source");
            result[15] = binding;
            binding = new Binding(this, function ():ClassVO
            {
                return (cls1);
            }, function (_arg_1:ClassVO):void
            {
                chc1.classData = _arg_1;
            }, "chc1.classData");
            result[16] = binding;
            binding = new Binding(this, function ():ClassVO
            {
                return (cls3);
            }, function (_arg_1:ClassVO):void
            {
                chc3.classData = _arg_1;
            }, "chc3.classData");
            result[17] = binding;
            binding = new Binding(this, function ():ClassVO
            {
                return (cls5);
            }, function (_arg_1:ClassVO):void
            {
                chc5.classData = _arg_1;
            }, "chc5.classData");
            result[18] = binding;
            binding = new Binding(this, function ():ClassVO
            {
                return (cls2);
            }, function (_arg_1:ClassVO):void
            {
                chc2.classData = _arg_1;
            }, "chc2.classData");
            result[19] = binding;
            binding = new Binding(this, function ():ClassVO
            {
                return (cls4);
            }, function (_arg_1:ClassVO):void
            {
                chc4.classData = _arg_1;
            }, "chc4.classData");
            result[20] = binding;
            binding = new Binding(this, function ():ClassVO
            {
                return (cls6);
            }, function (_arg_1:ClassVO):void
            {
                chc6.classData = _arg_1;
            }, "chc6.classData");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                career1.text = _arg_1;
            }, "career1.text");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                career2.text = _arg_1;
            }, "career2.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                career3.text = _arg_1;
            }, "career3.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                career4.text = _arg_1;
            }, "career4.text");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                career5.text = _arg_1;
            }, "career5.text");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                career6.text = _arg_1;
            }, "career6.text");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharSelectCanvas_Label1.text = _arg_1;
            }, "_CharSelectCanvas_Label1.text");
            result[28] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                _CharSelectCanvas_Label1.filters = _arg_1;
            }, "_CharSelectCanvas_Label1.filters");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label1.text = _arg_1;
            }, "label1.text");
            result[30] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                inputName.setStyle("borderSkin", _arg_1);
            }, "inputName.borderSkin");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                charDesc.label = _arg_1;
            }, "charDesc.label");
            result[32] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                _CharSelectCanvas_RoundedLabel1.filters = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel1.filters");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharSelectCanvas_RoundedLabel1.text = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel1.text");
            result[34] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                _CharSelectCanvas_RoundedLabel2.filters = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel2.filters");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharSelectCanvas_RoundedLabel2.text = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel2.text");
            result[36] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                _CharSelectCanvas_RoundedLabel3.filters = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel3.filters");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharSelectCanvas_RoundedLabel3.text = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel3.text");
            result[38] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                _CharSelectCanvas_RoundedLabel4.filters = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel4.filters");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharSelectCanvas_RoundedLabel4.text = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel4.text");
            result[40] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                _CharSelectCanvas_RoundedLabel5.filters = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel5.filters");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharSelectCanvas_RoundedLabel5.text = _arg_1;
            }, "_CharSelectCanvas_RoundedLabel5.text");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((((((((Language.CHARSELECTCANVAS_S[11] + int((aLevel * 20))) + Language.CHARSELECTCANVAS_S[12]) + getAcountName(aLevel)) + Language.CHARSELECTCANVAS_S[13]) + getAcountGold(aLevel)) + Language.CHARSELECTCANVAS_S[14]) + getAcountName(aLevel)) + Language.CHARSELECTCANVAS_S[15]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                textarea1.text = _arg_1;
            }, "textarea1.text");
            result[43] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get button3():BasicGlowButton
        {
            return (this._241352513button3);
        }

        [Bindable(event="propertyChange")]
        public function get button4():BasicGlowButton
        {
            return (this._241352514button4);
        }

        [Bindable(event="propertyChange")]
        public function get button5():BasicGlowButton
        {
            return (this._241352515button5);
        }

        [Bindable(event="propertyChange")]
        public function get button6():BasicGlowButton
        {
            return (this._241352516button6);
        }

        [Bindable(event="propertyChange")]
        public function get bgImg():Image
        {
            return (this._93647166bgImg);
        }

        public function set canvas100(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1016998297canvas100;
            if (_local_2 !== _arg_1)
            {
                this._1016998297canvas100 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas100", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get button7():BasicGlowButton
        {
            return (this._241352517button7);
        }

        [Bindable(event="propertyChange")]
        public function get chc1():ClassHeadCanvas
        {
            return (this._3052371chc1);
        }

        public function enableUI():void
        {
            this.button6.enabled = true;
            this.button14.enabled = true;
        }

        [Bindable(event="propertyChange")]
        public function get chc2():ClassHeadCanvas
        {
            return (this._3052372chc2);
        }

        [Bindable(event="propertyChange")]
        public function get chc3():ClassHeadCanvas
        {
            return (this._3052373chc3);
        }

        public function __choos2_click(_arg_1:MouseEvent):void
        {
            onChoosTwo();
        }

        [Bindable(event="propertyChange")]
        public function get bgFadeIn():Fade
        {
            return (this._1982979738bgFadeIn);
        }

        [Bindable(event="propertyChange")]
        public function get chc6():ClassHeadCanvas
        {
            return (this._3052376chc6);
        }

        public function set NMLBtn(_arg_1:Image):void
        {
            var _local_2:Object = this._1988451153NMLBtn;
            if (_local_2 !== _arg_1)
            {
                this._1988451153NMLBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "NMLBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get chc4():ClassHeadCanvas
        {
            return (this._3052374chc4);
        }

        [Bindable(event="propertyChange")]
        public function get chc5():ClassHeadCanvas
        {
            return (this._3052375chc5);
        }

        private function set aLevel(_arg_1:int):void
        {
            var _local_2:Object = this._1444626525aLevel;
            if (_local_2 !== _arg_1)
            {
                this._1444626525aLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get inputName():TextInput
        {
            return (this._1706774901inputName);
        }

        public function set inputNameCvs(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1586673493inputNameCvs;
            if (_local_2 !== _arg_1)
            {
                this._1586673493inputNameCvs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inputNameCvs", _local_2, _arg_1));
            };
        }

        public function set label1(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417475label1;
            if (_local_2 !== _arg_1)
            {
                this._1110417475label1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label1", _local_2, _arg_1));
            };
        }

        public function __button14_click(_arg_1:MouseEvent):void
        {
            showDPass();
        }

        private function focusClassHead(_arg_1:int):void
        {
            if (this[("chc" + _arg_1)])
            {
                this[("chc" + _arg_1)][gender].filters = [GamePredef.FILTER_CHAR_SELECTED_2];
            };
        }

        private function onShow():void
        {
            bgImg.source = ResManager.hash(GamePredef.DEFAULT_IMG_LOGIN);
        }

        public function disableUI():void
        {
            this.button6.enabled = false;
            this.button14.enabled = false;
        }

        private function _CharSelectCanvas_AddChild3_i():AddChild
        {
            var _local_1:AddChild = new AddChild();
            _CharSelectCanvas_AddChild3 = _local_1;
            _local_1.position = "lastChild";
            _local_1.targetFactory = new DeferredInstanceFromFunction(_CharSelectCanvas_Text1_i);
            BindingManager.executeBindings(this, "_CharSelectCanvas_AddChild3", _CharSelectCanvas_AddChild3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get cName():String
        {
            return (this._93848974cName);
        }

        override public function initialize():void
        {
            var target:CharSelectCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CharSelectCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compFore_CharSelectCanvasWatcherSetupUtil");
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

        private function showDPass():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.D_PASS_PANEL);
            if (_local_1.visible)
            {
                return;
            };
            _local_1.showPwdAgainCanvas();
        }

        [Bindable(event="propertyChange")]
        public function get canvas100():Canvas
        {
            return (this._1016998297canvas100);
        }

        public function set tileBtn(_arg_1:Tile):void
        {
            var _local_2:Object = this._1314878258tileBtn;
            if (_local_2 !== _arg_1)
            {
                this._1314878258tileBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileBtn", _local_2, _arg_1));
            };
        }

        public function __canvas8_creationComplete(_arg_1:FlexEvent):void
        {
            setEffect();
        }

        [Bindable(event="propertyChange")]
        public function get canvas101():Canvas
        {
            return (this._1016998298canvas101);
        }

        private function _CharSelectCanvas_Text1_i():Text
        {
            var _local_1:Text = new Text();
            txtTips = _local_1;
            _local_1.y = 0;
            _local_1.text = "";
            _local_1.width = 550;
            _local_1.setStyle("fontThickness", 0);
            _local_1.setStyle("right", "0");
            _local_1.setStyle("fontSize", 12);
            _local_1.setStyle("fontFamily", "Arial");
            _local_1.setStyle("textAlign", "right");
            _local_1.id = "txtTips";
            if (!_local_1.document)
            {
                _local_1.document = this;
            };
            return (_local_1);
        }

        public function set footRing(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._394199998footRing;
            if (_local_2 !== _arg_1)
            {
                this._394199998footRing = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "footRing", _local_2, _arg_1));
            };
        }

        public function __button5_click(_arg_1:MouseEvent):void
        {
            onLogin();
        }

        private function _CharSelectCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = canvas7;
            _local_1 = canvas7;
            _local_1 = textinput1;
            _local_1 = canvas7;
            _local_1 = choose;
            _local_1 = bgImg;
            _local_1 = [new ColorMatrixFilter([0])];
            _local_1 = bgImg;
            _local_1 = Language.CHARSELECTCANVAS_U[24];
            _local_1 = Language.CHARSELECTCANVAS_U[25];
            _local_1 = Language.CHARSELECTCANVAS_U[28];
            _local_1 = Language.CHARSELECTCANVAS_U[22];
            _local_1 = Language.CHARSELECTCANVAS_U[26];
            _local_1 = [GamePredef.FILTER_BLACK_ROUND];
            _local_1 = Language.CHARSELECTCANVAS_U[0];
            _local_1 = ResManager.LABEL_CHAR_CRE_1;
            _local_1 = cls1;
            _local_1 = cls3;
            _local_1 = cls5;
            _local_1 = cls2;
            _local_1 = cls4;
            _local_1 = cls6;
            _local_1 = Language.CHARSELECTCANVAS_U[37];
            _local_1 = Language.CHARSELECTCANVAS_U[38];
            _local_1 = Language.CHARSELECTCANVAS_U[39];
            _local_1 = Language.CHARSELECTCANVAS_U[40];
            _local_1 = Language.CHARSELECTCANVAS_U[41];
            _local_1 = Language.CHARSELECTCANVAS_U[42];
            _local_1 = Language.CHARSELECTCANVAS_U[8];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.CHARSELECTCANVAS_U[31];
            _local_1 = null;
            _local_1 = Language.CHARSELECTCANVAS_U[1];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[17];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[18];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[19];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[20];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[21];
            _local_1 = ((((((((Language.CHARSELECTCANVAS_S[11] + int((aLevel * 20))) + Language.CHARSELECTCANVAS_S[12]) + getAcountName(aLevel)) + Language.CHARSELECTCANVAS_S[13]) + getAcountGold(aLevel)) + Language.CHARSELECTCANVAS_S[14]) + getAcountName(aLevel)) + Language.CHARSELECTCANVAS_S[15]);
        }

        public function changeResAndDes(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:String;
            var _local_4:int;
            var _local_5:Number;
            classVO = ClassVO(_arg_1.classData);
            if (_arg_1.gender == "maleIconImage")
            {
                _local_2 = classVO.resCodeMale;
                _local_4 = classVO.colorCodeMale1;
                _local_5 = classVO.largeImgMale;
            }
            else
            {
                _local_2 = classVO.resCodeFemale;
                _local_4 = classVO.colorCodeFemale1;
                _local_5 = classVO.largeImgFemale;
            };
            var _local_6:Array = classVO.classDescription.split("|");
            _local_3 = ((((("<font color='" + GamePredef.MSG_EVENTTEXT_COLOR[0]) + "'>") + _local_6[2]) + "</font>") + _local_6[3]);
            charImg.source = ResManager.getIconUrl(_local_5);
            showProp(classVO);
            gender = _arg_1.gender;
            _newChar.gender = ((_arg_1.gender == "maleIconImage") ? 0 : 1);
            _newChar.classId = _arg_1.classData.id;
            _newChar.color = 1;
            NMLBtn.source = ResManager[("LABEL_CHAR_CRE_" + _newChar.classId)];
        }

        public function ___CharSelectCanvas_Canvas1_show(_arg_1:FlexEvent):void
        {
            onShow();
        }

        private function createNewCharactor():void
        {
            if (_newChar)
            {
                destroyToolTip();
                inputName.removeEventListener(MouseEvent.CLICK, onInputNameFocused);
                if (inputName.text.length < 0)
                {
                    return;
                };
                if (_core.haveSpecialStr(inputName.text))
                {
                    Alert.show(Language.CHARSELECTCANVAS_S[4], "");
                    return;
                };
                if (_core.haveSpecialStr2(inputName.text))
                {
                    Alert.show(Language.CHARSELECTCANVAS_S[19], "");
                    return;
                };
                if (inputName.text.length > 12)
                {
                    Alert.show(Language.CHARSELECTCANVAS_S[5], "");
                    return;
                };
                if (_core.haveBadWord(inputName.text))
                {
                    return;
                };
                if (inputName.text.length == 0)
                {
                    Alert.show(Language.CHARSELECTCANVAS_S[6], "");
                    return;
                };
                _newChar.name = StringUtil.trim(inputName.text);
                _core.remote.newChar(_newChar);
                charName = _newChar.name;
            }
            else
            {
                _newChar = {};
                Alert.show(Language.CHARSELECTCANVAS_S[7]);
            };
        }

        public function set canvas6(_arg_1:Canvas):void
        {
            var _local_2:Object = this._550778334canvas6;
            if (_local_2 !== _arg_1)
            {
                this._550778334canvas6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get label1():Label
        {
            return (this._1110417475label1);
        }

        public function set canvas7(_arg_1:Canvas):void
        {
            var _local_2:Object = this._550778335canvas7;
            if (_local_2 !== _arg_1)
            {
                this._550778335canvas7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas7", _local_2, _arg_1));
            };
        }

        public function set canvas8(_arg_1:Canvas):void
        {
            var _local_2:Object = this._550778336canvas8;
            if (_local_2 !== _arg_1)
            {
                this._550778336canvas8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas8", _local_2, _arg_1));
            };
        }

        private function onHide():void
        {
            bgImg.source = null;
        }

        [Bindable(event="propertyChange")]
        public function get footRing():UIComponent
        {
            return (this._394199998footRing);
        }

        public function set choos2(_arg_1:Button):void
        {
            var _local_2:Object = this._1361218076choos2;
            if (_local_2 !== _arg_1)
            {
                this._1361218076choos2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "choos2", _local_2, _arg_1));
            };
        }

        public function set txtTips(_arg_1:Text):void
        {
            var _local_2:Object = this._878521912txtTips;
            if (_local_2 !== _arg_1)
            {
                this._878521912txtTips = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtTips", _local_2, _arg_1));
            };
        }

        private function _CharSelectCanvas_AddChild2_i():AddChild
        {
            var _local_1:AddChild = new AddChild();
            _CharSelectCanvas_AddChild2 = _local_1;
            _local_1.position = "lastChild";
            _local_1.targetFactory = new DeferredInstanceFromFunction(_CharSelectCanvas_Button2_i);
            BindingManager.executeBindings(this, "_CharSelectCanvas_AddChild2", _CharSelectCanvas_AddChild2);
            return (_local_1);
        }

        public function set charactorDataList(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_5:int;
            var _local_6:CharactorSelectCanvas;
            var _local_7:int;
            var _local_8:CharactorSelectCanvas;
            tileBtn.removeAllChildren();
            aLevel = _core.acountLv;
            charactorArr = new ArrayCollection();
            for each (_local_2 in _arg_1)
            {
                charactorArr.addItem(_local_2);
            };
            if (charactorArr.length == 0)
            {
                onCreate();
                _core.view.hide(ViewManager.D_PASS_PANEL);
                choos1.visible = false;
                choos2.visible = false;
            }
            else
            {
                if (((4 > charactorArr.length) && (charactorArr.length > 0)))
                {
                    while (_local_5 < charactorArr.length)
                    {
                        _local_6 = new CharactorSelectCanvas();
                        _local_6.cData = charactorArr[_local_5];
                        _local_6.doubleClickEnabled = true;
                        _local_6.addEventListener(MouseEvent.CLICK, clickHandler);
                        tileBtn.addChild(_local_6);
                        _local_5++;
                    };
                    choos1.visible = false;
                    choos2.visible = false;
                }
                else
                {
                    if (charactorArr.length > 3)
                    {
                        while (_local_7 < 3)
                        {
                            _local_8 = new CharactorSelectCanvas();
                            _local_8.cData = charactorArr[_local_7];
                            _local_8.doubleClickEnabled = true;
                            _local_8.addEventListener(MouseEvent.CLICK, clickHandler);
                            tileBtn.addChild(_local_8);
                            _local_7++;
                        };
                        choos2.visible = true;
                        choos1.visible = false;
                    };
                };
            };
            button6.enabled = Boolean((charactorArr.length < 3));
            if (((4 > tileBtn.numChildren) && (tileBtn.numChildren > 0)))
            {
                selectedChar = CharactorSelectCanvas(tileBtn.getChildAt(0));
                setTimeout(select, 100, selectedChar);
            };
            currentPage = 1;
            if (tileBtn.numChildren == 2)
            {
                canvas100.visible = true;
                tileBtn.addChild(canvas100);
            };
            if (tileBtn.numChildren == 1)
            {
                canvas100.visible = true;
                canvas99.visible = true;
                tileBtn.addChild(canvas100);
                tileBtn.addChild(canvas99);
            };
            var _local_3:GameEvent = new GameEvent("ON_CHAR_SELECT_PAGE");
            var _local_4:Object = MMOGame.app.parent;
            _local_4.dispatchEvent(_local_3);
        }

        [Bindable(event="propertyChange")]
        public function get txtTips():Text
        {
            return (this._878521912txtTips);
        }

        private function set cLevel(_arg_1:String):void
        {
            var _local_2:Object = this._1387368223cLevel;
            if (_local_2 !== _arg_1)
            {
                this._1387368223cLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cLevel", _local_2, _arg_1));
            };
        }

        private function onCreate():void
        {
            var _local_2:String;
            var _local_3:Object;
            currentState = "create";
            setTimeout(autoSetFocus, 200);
            var _local_1:Object = _core.data.gameData[GamePredef.TBL_MAP][1];
            if (_local_1)
            {
                _local_2 = ResManager.getResUrlNoHash(_local_1.resCode);
                _local_3 = _core.view.getUI(ViewManager.STAGE_MAIN);
                if (((_local_3) && (_local_3.mapContainer)))
                {
                    _local_3.loadHitTestLayer(_local_2);
                    _local_3.mapContainer.init(_local_3, _local_2, _local_1.width, _local_1.height, _local_1.type, null, false);
                };
            };
        }

        public function set choos1(_arg_1:Button):void
        {
            var _local_2:Object = this._1361218077choos1;
            if (_local_2 !== _arg_1)
            {
                this._1361218077choos1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "choos1", _local_2, _arg_1));
            };
        }

        public function __canvas8_show(_arg_1:FlexEvent):void
        {
            setClassData();
        }

        [Bindable(event="propertyChange")]
        public function get canvas6():Canvas
        {
            return (this._550778334canvas6);
        }

        [Bindable(event="propertyChange")]
        public function get canvas7():Canvas
        {
            return (this._550778335canvas7);
        }

        public function set button14(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1108006699button14;
            if (_local_2 !== _arg_1)
            {
                this._1108006699button14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button14", _local_2, _arg_1));
            };
        }

        private function _CharSelectCanvas_Fade1_i():Fade
        {
            var _local_1:Fade = new Fade();
            bgFadeIn = _local_1;
            _local_1.alphaFrom = 0;
            _local_1.alphaTo = 1;
            BindingManager.executeBindings(this, "bgFadeIn", bgFadeIn);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get choos1():Button
        {
            return (this._1361218077choos1);
        }

        [Bindable(event="propertyChange")]
        public function get choos2():Button
        {
            return (this._1361218076choos2);
        }

        private function onReturn():void
        {
            charName = "";
            tileBtn.removeAllChildren();
            _core.logout();
            _core.view.getUI(ViewManager.FORE_L_R).visible = true;
            _core.view.getUI(ViewManager.FORE_C_C).visible = false;
            _core.view.getUI(ViewManager.D_PASS_PANEL).hide();
            _core.remote.close();
        }

        public function ___CharSelectCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            onShow();
        }

        [Bindable(event="propertyChange")]
        public function get canvas8():Canvas
        {
            return (this._550778336canvas8);
        }

        public function __enterGameBtn_click(_arg_1:MouseEvent):void
        {
            createNewCharactor();
        }

        public function ___CharSelectCanvas_Canvas1_hide(_arg_1:FlexEvent):void
        {
            onHide();
        }

        private function drawToolTip(_arg_1:UIComponent, _arg_2:int, _arg_3:String="", _arg_4:int=12, _arg_5:int=12):void
        {
            var _local_10:Number;
            var _local_11:Number;
            var _local_16:Array;
            var _local_17:Array;
            var _local_6:Number = _arg_1.x;
            var _local_7:Number = _arg_1.y;
            var _local_8:Number = _arg_1.width;
            var _local_9:Number = _arg_1.height;
            if (!_drawToolTipManager)
            {
                _drawToolTipManager = {};
            };
            destroyToolTip(_arg_1);
            if (_arg_3.length > 12)
            {
                _local_10 = ((12 * _arg_4) + 5);
                _local_11 = (((Math.floor((_arg_3.length / _arg_5)) * _arg_4) + _arg_4) + 10);
            }
            else
            {
                _local_10 = ((_arg_3.length * _arg_4) + 5);
                _local_11 = (_arg_4 + 5);
            };
            var _local_12:Canvas = new Canvas();
            var _local_13:TextArea = new TextArea();
            _local_13.editable = false;
            _local_13.selectable = false;
            _local_13.setStyle("borderStyle", "none");
            _local_13.setStyle("backgroundAlpha", 0);
            _local_13.text = _arg_3;
            _local_13.width = _local_10;
            _local_13.height = _local_11;
            _local_13.setStyle("color", 0xFFFFFF);
            _local_13.x = 3;
            _local_12.width = ((_local_10 + 10) + 15);
            _local_12.height = ((_local_11 + 15) + 15);
            var _local_14:Number = 0;
            var _local_15:Number = 0;
            switch (_arg_2)
            {
                case 1:
                    _local_12.x = (_local_6 + _local_8);
                    _local_12.y = (_local_7 + (_local_9 / 2));
                    _local_13.x = 20;
                    _local_13.y = 20;
                    _local_14 = 15;
                    _local_15 = 15;
                    _local_16 = [15, 0, 25];
                    _local_17 = [15, 0, 15];
                    break;
                case 2:
                    _local_12.x = (_local_6 - _local_12.width);
                    _local_12.y = (_local_7 + (_local_9 / 2));
                    _local_13.x = 0;
                    _local_13.y = 20;
                    _local_14 = 0;
                    _local_15 = 15;
                    _local_16 = [(_local_12.width - 15), _local_12.width, (_local_12.width - 25)];
                    _local_17 = [15, 0, 15];
                    break;
                case 3:
                    _local_12.x = (_local_6 + _local_8);
                    _local_12.y = ((_local_7 + (_local_9 / 2)) - _local_12.height);
                    _local_13.x = 20;
                    _local_13.y = 5;
                    _local_14 = 15;
                    _local_15 = 0;
                    _local_16 = [15, 0, 25];
                    _local_17 = [(_local_12.height - 15), _local_12.height, (_local_12.height - 15)];
                    break;
                case 4:
                    _local_12.x = (_local_6 - _local_12.width);
                    _local_12.y = ((_local_7 + (_local_9 / 2)) - _local_12.height);
                    _local_13.x = 5;
                    _local_13.y = 5;
                    _local_14 = 0;
                    _local_15 = 0;
                    _local_16 = [(_local_12.width - 15), _local_12.width, (_local_12.width - 25)];
                    _local_17 = [(_local_12.height - 15), _local_12.height, (_local_12.height - 15)];
                    break;
            };
            _local_12.graphics.lineStyle(4, 16762435);
            _local_12.graphics.drawRoundRect(_local_14, _local_15, (_local_12.width - 15), (_local_12.height - 15), 7);
            _local_12.graphics.moveTo(_local_16[0], _local_17[0]);
            _local_12.graphics.beginFill(16762435);
            _local_12.graphics.lineTo(_local_16[1], _local_17[1]);
            _local_12.graphics.lineTo(_local_16[2], _local_17[2]);
            _local_12.graphics.endFill();
            _local_12.addChild(_local_13);
            addChild(_local_12);
            _drawToolTipManager[_arg_1.id] = _local_12;
        }


    }
}//package com.qeedoo.ui.view.compFore

