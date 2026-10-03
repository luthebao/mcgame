// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.AIConfPanel

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import flash.utils.Timer;
    import mx.controls.RadioButton;
    import mx.containers.Tile;
    import mx.controls.ComboBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compDragable.PetFightConf;
    import com.qeedoo.ui.view.compDragable.HelpPanel;
    import mx.binding.Binding;
    import mx.events.DropdownEvent;
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

    public class AIConfPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _207100162confSlot22:AISkillSlot;
        private var _207100135confSlot16:AISkillSlot;
        private var _824603340confSlot6:AISkillSlot;
        private var _3066321cvs1:Canvas;
        private var _timer:Timer;
        private var _114718tg1:RadioButton;
        private var _207100130confSlot11:AISkillSlot;
        private var _pet:Object;
        private var _207100138confSlot19:AISkillSlot;
        private var _selectedSkill:ItemSlot;
        private var _824603338confSlot8:AISkillSlot;
        private var _824603342confSlot4:AISkillSlot;
        private var _3645t1:Tile;
        private var _3618s5:AISkillComp;
        public var confPos:int = 0;
        public var petId:Number = 0;
        private var _207100160confSlot20:AISkillSlot;
        private var _3557102tgId:ComboBox;
        private var _207100133confSlot14:AISkillSlot;
        private var _114719tg2:RadioButton;
        private var _824603344confSlot2:AISkillSlot;
        private var _3617s4:AISkillComp;
        private var _207100163confSlot23:AISkillSlot;
        private var _114720tg3:RadioButton;
        private var _207100136confSlot17:AISkillSlot;
        private var _824603346confSlot0:AISkillSlot;
        private var _3616s3:AISkillComp;
        public var _AIConfPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _selectedSlot:AISkillComp;
        private var _207100131confSlot12:AISkillSlot;
        private var _114721tg4:RadioButton;
        private var _3615s2:AISkillComp;
        public var _AIConfPanel_BasicGlowButton1:BasicGlowButton;
        public var _AIConfPanel_BasicGlowButton2:BasicGlowButton;
        private var _3066323cvs3:Canvas;
        private var _207100161confSlot21:AISkillSlot;
        public var _AIConfPanel_BasicTxtButton1:BasicTxtButton;
        public var _AIConfPanel_BasicTxtButton2:BasicTxtButton;
        public var _AIConfPanel_BasicTxtButton3:BasicTxtButton;
        public var _AIConfPanel_BasicTxtButton4:BasicTxtButton;
        private var _824603337confSlot9:AISkillSlot;
        private var _207100134confSlot15:AISkillSlot;
        private var _824603341confSlot5:AISkillSlot;
        private var _3614s1:AISkillComp;
        private var _824603339confSlot7:AISkillSlot;
        private var _824603343confSlot3:AISkillSlot;
        private var _114722tg5:RadioButton;
        private var _207100137confSlot18:AISkillSlot;
        private var _encapsulatedConfData:Object;
        private var _3613s0:AISkillComp;
        private var _207100129confSlot10:AISkillSlot;
        private var _3587ps:PageSelector;
        private var _3066322cvs2:Canvas;
        private var _parent:PetConfigCanvas;
        private var _824603345confSlot1:AISkillSlot;
        private var _207100132confSlot13:AISkillSlot;
        private var _clearFlag:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":420,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AIConfPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cvs1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":40,
                                "width":160,
                                "height":350,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AIConfPanel_BasicTxtButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":3});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":AISkillComp,
                                    "id":"s0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":27
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":AISkillComp,
                                    "id":"s1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":74
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":AISkillComp,
                                    "id":"s2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":121
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":AISkillComp,
                                    "id":"s3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":168
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":AISkillComp,
                                    "id":"s4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":215
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":AISkillComp,
                                    "id":"s5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":262
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"ps",
                                    "events":{"creationComplete":"__ps_creationComplete"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":315});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cvs2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "x":170,
                                "y":39,
                                "width":240,
                                "height":140,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AIConfPanel_BasicTxtButton2",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":5});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"tg1",
                                    "events":{"change":"__tg1_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "left";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":30
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"tg2",
                                    "events":{"change":"__tg2_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "left";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"tg3",
                                    "events":{"change":"__tg3_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "left";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"tg4",
                                    "events":{"change":"__tg4_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "left";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"tg5",
                                    "events":{"change":"__tg5_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "left";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":110,
                                            "width":220
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"tgId",
                                    "events":{"close":"__tgId_close"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":98,
                                            "y":110,
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cvs3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "x":170,
                                "y":185,
                                "width":240,
                                "height":205,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AIConfPanel_BasicTxtButton3",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":5});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "id":"t1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 3;
                                        this.verticalGap = 3;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":28,
                                            "width":225,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot0",
                                                "events":{"click":"__confSlot0_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"1"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot1",
                                                "events":{"click":"__confSlot1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"2"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot2",
                                                "events":{"click":"__confSlot2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"3"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot3",
                                                "events":{"click":"__confSlot3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"4"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot4",
                                                "events":{"click":"__confSlot4_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"5"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot5",
                                                "events":{"click":"__confSlot5_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"6"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot6",
                                                "events":{"click":"__confSlot6_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"7"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot7",
                                                "events":{"click":"__confSlot7_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"8"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot8",
                                                "events":{"click":"__confSlot8_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"9"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot9",
                                                "events":{"click":"__confSlot9_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"10"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot10",
                                                "events":{"click":"__confSlot10_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"11"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot11",
                                                "events":{"click":"__confSlot11_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"12"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot12",
                                                "events":{"click":"__confSlot12_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"13"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot13",
                                                "events":{"click":"__confSlot13_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"14"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot14",
                                                "events":{"click":"__confSlot14_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"15"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot15",
                                                "events":{"click":"__confSlot15_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"16"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot16",
                                                "events":{"click":"__confSlot16_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"17"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot17",
                                                "events":{"click":"__confSlot17_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"18"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot18",
                                                "events":{"click":"__confSlot18_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"19"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot19",
                                                "events":{"click":"__confSlot19_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"20"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot20",
                                                "events":{"click":"__confSlot20_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"21"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot21",
                                                "events":{"click":"__confSlot21_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"22"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot22",
                                                "events":{"click":"__confSlot22_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"23"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":AISkillSlot,
                                                "id":"confSlot23",
                                                "events":{"click":"__confSlot23_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "frontLabel":"24"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_AIConfPanel_BasicTxtButton4",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "3";
                                        this.left = "5";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_AIConfPanel_BasicGlowButton1",
                                    "events":{"click":"___AIConfPanel_BasicGlowButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "20";
                                        this.bottom = "3";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":40
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_AIConfPanel_BasicGlowButton2",
                                    "events":{"click":"___AIConfPanel_BasicGlowButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "60";
                                        this.bottom = "3";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":40
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
        private const defaultSkills:Array = [1000, 1001];
        private var _confSlotList:Array = [];
        private var _skillList:Array = defaultSkills.concat();
        private var _skCompList:Object = {};
        private var _skillTargetTemp:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AIConfPanel()
        {
            mx_internal::_document = this;
            this.width = 420;
            this.height = 400;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___AIConfPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AIConfPanel._watcherSetupUtil = _arg_1;
        }


        public function set confSlot20(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100160confSlot20;
            if (_local_2 !== _arg_1)
            {
                this._207100160confSlot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot20", _local_2, _arg_1));
            };
        }

        private function onSkillListRollOut(_arg_1:MouseEvent):void
        {
            var _local_2:AISkillComp = AISkillComp(_arg_1.currentTarget);
            if (_local_2 == _selectedSlot)
            {
                _local_2.filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
            };
        }

        public function set confSlot21(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100161confSlot21;
            if (_local_2 !== _arg_1)
            {
                this._207100161confSlot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot21", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ps():PageSelector
        {
            return (this._3587ps);
        }

        public function set confSlot22(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100162confSlot22;
            if (_local_2 !== _arg_1)
            {
                this._207100162confSlot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot22", _local_2, _arg_1));
            };
        }

        public function set confSlot23(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100163confSlot23;
            if (_local_2 !== _arg_1)
            {
                this._207100163confSlot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot23", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cvs3():Canvas
        {
            return (this._3066323cvs3);
        }

        public function set ps(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._3587ps;
            if (_local_2 !== _arg_1)
            {
                this._3587ps = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ps", _local_2, _arg_1));
            };
        }

        public function __confSlot16_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function __ps_creationComplete(_arg_1:FlexEvent):void
        {
            initPs();
        }

        [Bindable(event="propertyChange")]
        public function get s0():AISkillComp
        {
            return (this._3613s0);
        }

        public function __confSlot7_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s2():AISkillComp
        {
            return (this._3615s2);
        }

        [Bindable(event="propertyChange")]
        public function get s4():AISkillComp
        {
            return (this._3617s4);
        }

        [Bindable(event="propertyChange")]
        public function get s5():AISkillComp
        {
            return (this._3618s5);
        }

        [Bindable(event="propertyChange")]
        public function get s1():AISkillComp
        {
            return (this._3614s1);
        }

        [Bindable(event="propertyChange")]
        public function get tg2():RadioButton
        {
            return (this._114719tg2);
        }

        [Bindable(event="propertyChange")]
        public function get s3():AISkillComp
        {
            return (this._3616s3);
        }

        [Bindable(event="propertyChange")]
        public function get tg4():RadioButton
        {
            return (this._114721tg4);
        }

        [Bindable(event="propertyChange")]
        public function get tg5():RadioButton
        {
            return (this._114722tg5);
        }

        [Bindable(event="propertyChange")]
        public function get tg1():RadioButton
        {
            return (this._114718tg1);
        }

        [Bindable(event="propertyChange")]
        public function get tg3():RadioButton
        {
            return (this._114720tg3);
        }

        private function drawGuideFrame():void
        {
            if (((_timer) && (_timer.running)))
            {
                _timer.stop();
                _timer = null;
            };
            _timer = new Timer(500, 0);
            _timer.addEventListener(TimerEvent.TIMER, handleDrawTimer);
            _timer.start();
        }

        public function set s0(_arg_1:AISkillComp):void
        {
            var _local_2:Object = this._3613s0;
            if (_local_2 !== _arg_1)
            {
                this._3613s0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s0", _local_2, _arg_1));
            };
        }

        public function set s1(_arg_1:AISkillComp):void
        {
            var _local_2:Object = this._3614s1;
            if (_local_2 !== _arg_1)
            {
                this._3614s1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t1():Tile
        {
            return (this._3645t1);
        }

        public function set s2(_arg_1:AISkillComp):void
        {
            var _local_2:Object = this._3615s2;
            if (_local_2 !== _arg_1)
            {
                this._3615s2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s2", _local_2, _arg_1));
            };
        }

        public function set s3(_arg_1:AISkillComp):void
        {
            var _local_2:Object = this._3616s3;
            if (_local_2 !== _arg_1)
            {
                this._3616s3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s3", _local_2, _arg_1));
            };
        }

        public function set s4(_arg_1:AISkillComp):void
        {
            var _local_2:Object = this._3617s4;
            if (_local_2 !== _arg_1)
            {
                this._3617s4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s4", _local_2, _arg_1));
            };
        }

        public function set s5(_arg_1:AISkillComp):void
        {
            var _local_2:Object = this._3618s5;
            if (_local_2 !== _arg_1)
            {
                this._3618s5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s5", _local_2, _arg_1));
            };
        }

        public function set tg2(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._114719tg2;
            if (_local_2 !== _arg_1)
            {
                this._114719tg2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tg2", _local_2, _arg_1));
            };
        }

        public function set tg4(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._114721tg4;
            if (_local_2 !== _arg_1)
            {
                this._114721tg4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tg4", _local_2, _arg_1));
            };
        }

        public function set tg1(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._114718tg1;
            if (_local_2 !== _arg_1)
            {
                this._114718tg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tg1", _local_2, _arg_1));
            };
        }

        public function set tg3(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._114720tg3;
            if (_local_2 !== _arg_1)
            {
                this._114720tg3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tg3", _local_2, _arg_1));
            };
        }

        public function set tg5(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._114722tg5;
            if (_local_2 !== _arg_1)
            {
                this._114722tg5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tg5", _local_2, _arg_1));
            };
        }

        public function __tg5_change(_arg_1:Event):void
        {
            setTarget(_arg_1);
        }

        public function __confSlot4_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function __confSlot13_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function set confSlot1(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603345confSlot1;
            if (_local_2 !== _arg_1)
            {
                this._824603345confSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot1", _local_2, _arg_1));
            };
        }

        public function set confSlot3(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603343confSlot3;
            if (_local_2 !== _arg_1)
            {
                this._824603343confSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot3", _local_2, _arg_1));
            };
        }

        public function set confSlot0(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603346confSlot0;
            if (_local_2 !== _arg_1)
            {
                this._824603346confSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot0", _local_2, _arg_1));
            };
        }

        public function set confSlot5(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603341confSlot5;
            if (_local_2 !== _arg_1)
            {
                this._824603341confSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot5", _local_2, _arg_1));
            };
        }

        public function set confSlot2(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603344confSlot2;
            if (_local_2 !== _arg_1)
            {
                this._824603344confSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot2", _local_2, _arg_1));
            };
        }

        public function set confSlot6(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603340confSlot6;
            if (_local_2 !== _arg_1)
            {
                this._824603340confSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot6", _local_2, _arg_1));
            };
        }

        public function set confSlot7(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603339confSlot7;
            if (_local_2 !== _arg_1)
            {
                this._824603339confSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot7", _local_2, _arg_1));
            };
        }

        public function set confSlot4(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603342confSlot4;
            if (_local_2 !== _arg_1)
            {
                this._824603342confSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot4", _local_2, _arg_1));
            };
        }

        public function set confSlot8(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603338confSlot8;
            if (_local_2 !== _arg_1)
            {
                this._824603338confSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot8", _local_2, _arg_1));
            };
        }

        public function set confSlot9(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._824603337confSlot9;
            if (_local_2 !== _arg_1)
            {
                this._824603337confSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot9", _local_2, _arg_1));
            };
        }

        public function ___AIConfPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            savePetConf();
        }

        public function set t1(_arg_1:Tile):void
        {
            var _local_2:Object = this._3645t1;
            if (_local_2 !== _arg_1)
            {
                this._3645t1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t1", _local_2, _arg_1));
            };
        }

        private function clearPage():void
        {
            var _local_1:int;
            while (_local_1 < 6)
            {
                this[("s" + _local_1)].clean();
                _local_1++;
            };
        }

        public function __tg3_change(_arg_1:Event):void
        {
            setTarget(_arg_1);
        }

        public function __confSlot10_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        private function clearView():void
        {
            if (!initialized)
            {
                return;
            };
            var _local_1:int;
            while (_local_1 < 24)
            {
                this[("confSlot" + _local_1)].clean();
                _local_1++;
            };
            var _local_2:int;
            while (_local_2 < 6)
            {
                this[("s" + _local_2)].clean();
                _local_2++;
            };
            _skillTargetTemp = [];
            if (_selectedSlot)
            {
                _selectedSlot.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            };
        }

        private function setTarget(_arg_1:Event):void
        {
            var _local_3:Number;
            var _local_2:String = _arg_1.currentTarget.id.slice(2);
            if (((_selectedSlot) && (_selectedSlot.giid > 0)))
            {
                if (_local_2 == "Id")
                {
                    _skillTargetTemp[_selectedSlot.giid] = ("5" + tgId.selectedIndex.toString());
                }
                else
                {
                    _skillTargetTemp[_selectedSlot.giid] = _local_2;
                    if (Number(_local_2) == 5)
                    {
                        _local_3 = tgId.selectedIndex;
                        _skillTargetTemp[_selectedSlot.giid] = (_skillTargetTemp[_selectedSlot.giid] + _local_3.toString());
                    };
                    _selectedSlot.tarType = (Language.AI_CONF_PANEL_U[20] + Language.AI_CONF_PANEL_U[_local_2]);
                };
                clearDraw();
                _core.nextGuide(ViewManager.POP_AI_CONFIGURE, "", -1, -1, 3);
            };
        }

        public function __confSlot1_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function __confSlot18_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function __confSlot9_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        private function savePetConf():void
        {
            var _local_5:ItemSlot;
            var _local_6:Object;
            var _local_7:Object;
            var _local_1:PetFightConf = PetFightConf(_core.view.getUI(ViewManager.PANEL_PETFIGHT_CONF));
            _encapsulatedConfData = {
                "pid":-1,
                "pos":-1,
                "cmdList":[]
            };
            _encapsulatedConfData.pid = petId;
            _encapsulatedConfData.pos = confPos;
            var _local_2:Number = 24;
            var _local_3:Array = [];
            var _local_4:int = (_local_2 - 1);
            while (_local_4 >= 0)
            {
                _local_5 = this[("confSlot" + _local_4)];
                if (_local_5)
                {
                    if (_local_5.giid >= 0)
                    {
                        _local_6 = {
                            "action":GamePredef.BATTLE_ACTION_ATTACK,
                            "level":-1,
                            "id":1000,
                            "t":1
                        };
                        if (_local_5.type == GamePredef.TBL_SKILL)
                        {
                            _local_7 = _core.data.gameData[GamePredef.TBL_SKILL][_local_5.giid];
                            if (_local_7)
                            {
                                _local_6.action = GamePredef.BATTLE_ACTION_SKILL;
                                _local_6.level = _local_7.level;
                                _local_6.id = _local_7.id;
                                if (_skillTargetTemp[_local_7.id])
                                {
                                    _local_6.t = _skillTargetTemp[_local_7.id];
                                };
                            };
                        };
                        _local_3[_local_4] = _local_6;
                    };
                };
                _local_4--;
            };
            _encapsulatedConfData.cmdList = _local_3;
            _local_1.saveConfData(_encapsulatedConfData);
            _parent.conf = _encapsulatedConfData;
            this.hide();
            _core.nextGuide(ViewManager.POP_AI_CONFIGURE, "", -1, -1, 4);
        }

        public function __confSlot21_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        private function showAIHelp():void
        {
            var _local_1:HelpPanel = HelpPanel(_core.view.getUI(ViewManager.PANEL_HELP));
            if (_local_1)
            {
                _local_1.show();
                _local_1.selectAIConf();
            };
        }

        public function __confSlot15_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function __tg1_change(_arg_1:Event):void
        {
            setTarget(_arg_1);
        }

        public function __confSlot6_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot10():AISkillSlot
        {
            return (this._207100129confSlot10);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot11():AISkillSlot
        {
            return (this._207100130confSlot11);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot12():AISkillSlot
        {
            return (this._207100131confSlot12);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot13():AISkillSlot
        {
            return (this._207100132confSlot13);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot15():AISkillSlot
        {
            return (this._207100134confSlot15);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot16():AISkillSlot
        {
            return (this._207100135confSlot16);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot17():AISkillSlot
        {
            return (this._207100136confSlot17);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot18():AISkillSlot
        {
            return (this._207100137confSlot18);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot19():AISkillSlot
        {
            return (this._207100138confSlot19);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot14():AISkillSlot
        {
            return (this._207100133confSlot14);
        }

        [Bindable(event="propertyChange")]
        public function get tgId():ComboBox
        {
            return (this._3557102tgId);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot21():AISkillSlot
        {
            return (this._207100161confSlot21);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot22():AISkillSlot
        {
            return (this._207100162confSlot22);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot23():AISkillSlot
        {
            return (this._207100163confSlot23);
        }

        public function __confSlot12_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function showPanel(_arg_1:int, _arg_2:Number, _arg_3:PetConfigCanvas, _arg_4:Object=null):void
        {
            var _local_5:Object;
            var _local_6:int;
            var _local_7:Object;
            var _local_8:Array;
            var _local_9:Object;
            var _local_10:Array;
            var _local_11:int;
            var _local_12:Object;
            var _local_13:ItemSlot;
            if (petId != _arg_2)
            {
                clearView();
            };
            confPos = _arg_1;
            petId = _arg_2;
            _parent = _arg_3;
            _skillList = defaultSkills.concat();
            if (!((_pet) && (_pet.id == _arg_2)))
            {
                for each (_local_5 in _core.player.petList)
                {
                    if (_local_5.id == _arg_2)
                    {
                        _pet = _local_5;
                        break;
                    };
                };
            };
            if (_pet)
            {
                _local_6 = 1;
                while (_local_6 <= 15)
                {
                    if (_pet[("skill" + _local_6)] > 0)
                    {
                        _local_7 = _core.data.gameData[GamePredef.TBL_SKILL][_pet[("skill" + _local_6)]];
                        if (((_local_7) && (_local_7.kind == 1)))
                        {
                            _skillList.push(_local_7.id);
                        };
                    };
                    _local_6++;
                };
            };
            if (_arg_4)
            {
                _local_8 = new Array();
                for each (_local_9 in _arg_4.cmdList)
                {
                    _local_8.push(_local_9);
                };
                _local_10 = _local_8;
                _local_11 = 0;
                while (_local_11 < _local_10.length)
                {
                    _local_12 = _local_10[_local_11];
                    _local_13 = this[("confSlot" + _local_11)];
                    if (_local_12)
                    {
                        if (_local_12.action == GamePredef.BATTLE_ACTION_SKILL)
                        {
                            _local_13.type = GamePredef.TBL_SKILL;
                            _local_13.giid = _local_12.id;
                        }
                        else
                        {
                            if (_local_12.action == GamePredef.BATTLE_ACTION_ATTACK)
                            {
                                _local_13.type = GamePredef.TBL_SKILL;
                                _local_13.giid = 1000;
                            }
                            else
                            {
                                if (_local_12.action == GamePredef.BATTLE_ACTION_DEFENCE)
                                {
                                    _local_13.type = GamePredef.TBL_SKILL;
                                    _local_13.giid = 1001;
                                };
                            };
                        };
                        _skillTargetTemp[_local_12.id] = _local_12.t;
                    };
                    _local_11++;
                };
            };
            ps.onPageChanged = onPageChanged;
            ps.onPageCleared = clearPage;
            ps.initPageSeletor(_skillList.length, 6);
            super.show();
            if (_selectedSlot != s0)
            {
                s0.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            };
        }

        [Bindable(event="propertyChange")]
        public function get confSlot20():AISkillSlot
        {
            return (this._207100160confSlot20);
        }

        public function ___AIConfPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function init():void
        {
            var _local_1:int;
            while (_local_1 < 6)
            {
                this[("s" + _local_1)].addEventListener(MouseEvent.CLICK, onSkillListClick, false, 0, true);
                this[("s" + _local_1)].addEventListener(MouseEvent.ROLL_OUT, onSkillListRollOut, false, 0, true);
                _local_1++;
            };
        }

        private function handleDrawTimer(_arg_1:TimerEvent):void
        {
            if (!_clearFlag)
            {
                cvs2.graphics.lineStyle(2, 0xFF0000);
                cvs2.graphics.drawRoundRect(10, 32, 200, 100, 5);
            }
            else
            {
                cvs2.graphics.clear();
            };
            _clearFlag = (!(_clearFlag));
        }

        public function __confSlot3_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        private function _AIConfPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AIConfPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AIConfPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AIConfPanel_BasicTxtButton1.label = _arg_1;
            }, "_AIConfPanel_BasicTxtButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AIConfPanel_BasicTxtButton2.text = _arg_1;
            }, "_AIConfPanel_BasicTxtButton2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg1.label = _arg_1;
            }, "tg1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg1.toolTip = _arg_1;
            }, "tg1.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg2.label = _arg_1;
            }, "tg2.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg2.toolTip = _arg_1;
            }, "tg2.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg3.label = _arg_1;
            }, "tg3.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg3.toolTip = _arg_1;
            }, "tg3.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg4.label = _arg_1;
            }, "tg4.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg4.toolTip = _arg_1;
            }, "tg4.toolTip");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg5.label = _arg_1;
            }, "tg5.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[15].replace("{num}", (tgId.selectedIndex + 1).toString());
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tg5.toolTip = _arg_1;
            }, "tg5.toolTip");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return ([1, 2, 3, 4, 5]);
            }, function (_arg_1:Object):void
            {
                tgId.dataProvider = _arg_1;
            }, "tgId.dataProvider");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (tg5.selected);
            }, function (_arg_1:Boolean):void
            {
                tgId.enabled = _arg_1;
            }, "tgId.enabled");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AIConfPanel_BasicTxtButton3.text = _arg_1;
            }, "_AIConfPanel_BasicTxtButton3.text");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot0.slotType = _arg_1;
            }, "confSlot0.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot1.slotType = _arg_1;
            }, "confSlot1.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot2.slotType = _arg_1;
            }, "confSlot2.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot3.slotType = _arg_1;
            }, "confSlot3.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot4.slotType = _arg_1;
            }, "confSlot4.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot5.slotType = _arg_1;
            }, "confSlot5.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot6.slotType = _arg_1;
            }, "confSlot6.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot7.slotType = _arg_1;
            }, "confSlot7.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot8.slotType = _arg_1;
            }, "confSlot8.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot9.slotType = _arg_1;
            }, "confSlot9.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot10.slotType = _arg_1;
            }, "confSlot10.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot11.slotType = _arg_1;
            }, "confSlot11.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot12.slotType = _arg_1;
            }, "confSlot12.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot13.slotType = _arg_1;
            }, "confSlot13.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot14.slotType = _arg_1;
            }, "confSlot14.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot15.slotType = _arg_1;
            }, "confSlot15.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot16.slotType = _arg_1;
            }, "confSlot16.slotType");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot17.slotType = _arg_1;
            }, "confSlot17.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot18.slotType = _arg_1;
            }, "confSlot18.slotType");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot19.slotType = _arg_1;
            }, "confSlot19.slotType");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot20.slotType = _arg_1;
            }, "confSlot20.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot21.slotType = _arg_1;
            }, "confSlot21.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot22.slotType = _arg_1;
            }, "confSlot22.slotType");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_AI);
            }, function (_arg_1:int):void
            {
                confSlot23.slotType = _arg_1;
            }, "confSlot23.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AIConfPanel_BasicTxtButton4.text = _arg_1;
            }, "_AIConfPanel_BasicTxtButton4.text");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AIConfPanel_BasicGlowButton1.label = _arg_1;
            }, "_AIConfPanel_BasicGlowButton1.label");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AI_CONF_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AIConfPanel_BasicGlowButton2.label = _arg_1;
            }, "_AIConfPanel_BasicGlowButton2.label");
            result[42] = binding;
            return (result);
        }

        public function __confSlot23_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot0():AISkillSlot
        {
            return (this._824603346confSlot0);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot1():AISkillSlot
        {
            return (this._824603345confSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot2():AISkillSlot
        {
            return (this._824603344confSlot2);
        }

        private function clearDraw():void
        {
            cvs2.graphics.clear();
            if (((_timer) && (_timer.running)))
            {
                _timer.stop();
                _timer.removeEventListener(TimerEvent.TIMER, handleDrawTimer);
                _timer = null;
            };
        }

        [Bindable(event="propertyChange")]
        public function get confSlot4():AISkillSlot
        {
            return (this._824603342confSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot7():AISkillSlot
        {
            return (this._824603339confSlot7);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot8():AISkillSlot
        {
            return (this._824603338confSlot8);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot9():AISkillSlot
        {
            return (this._824603337confSlot9);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot3():AISkillSlot
        {
            return (this._824603343confSlot3);
        }

        override public function hide():void
        {
            visible = false;
            var _local_1:Event = new Event(DragableCanvas.EVENT_CLOSE);
            dispatchEvent(_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot6():AISkillSlot
        {
            return (this._824603340confSlot6);
        }

        public function __confSlot17_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        private function initPs():void
        {
            ps.lastBtnLabel = "";
            ps.nextBtnLabel = "";
            ps.btnLastPage.width = 13;
            ps.btnNextPage.width = 13;
            ps.setLastBtnStyle("fazendaPageLast");
            ps.setNextBtnStyle("fazendaPageNext");
        }

        public function __tgId_close(_arg_1:DropdownEvent):void
        {
            setTarget(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get confSlot5():AISkillSlot
        {
            return (this._824603341confSlot5);
        }

        public function __confSlot0_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function __confSlot20_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function __tg4_change(_arg_1:Event):void
        {
            setTarget(_arg_1);
        }

        public function __confSlot8_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function __confSlot14_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        override public function initialize():void
        {
            var target:AIConfPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AIConfPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_AIConfPanelWatcherSetupUtil");
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

        public function __confSlot5_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function set cvs1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3066321cvs1;
            if (_local_2 !== _arg_1)
            {
                this._3066321cvs1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cvs1", _local_2, _arg_1));
            };
        }

        public function set cvs2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3066322cvs2;
            if (_local_2 !== _arg_1)
            {
                this._3066322cvs2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cvs2", _local_2, _arg_1));
            };
        }

        public function set cvs3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3066323cvs3;
            if (_local_2 !== _arg_1)
            {
                this._3066323cvs3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cvs3", _local_2, _arg_1));
            };
        }

        private function putSlot(_arg_1:Event):void
        {
            var _local_3:Object;
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.giid > 0)
            {
                _local_2.clean();
                return;
            };
            if (_selectedSlot)
            {
                _core.nextGuide(ViewManager.POP_AI_CONFIGURE, "", -1, -1, 2);
                _local_3 = _core.view.getUI(ViewManager.POP_NEW_PLAER_GUIDE);
                if (_local_3.visible)
                {
                    drawGuideFrame();
                };
                if (((_local_2) && (_local_2.giid < 0)))
                {
                    _local_2.type = GamePredef.TBL_SKILL;
                    _local_2.giid = _selectedSlot.giid;
                };
            };
        }

        public function __tg2_change(_arg_1:Event):void
        {
            setTarget(_arg_1);
        }

        public function set confSlot11(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100130confSlot11;
            if (_local_2 !== _arg_1)
            {
                this._207100130confSlot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot11", _local_2, _arg_1));
            };
        }

        public function set confSlot13(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100132confSlot13;
            if (_local_2 !== _arg_1)
            {
                this._207100132confSlot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot13", _local_2, _arg_1));
            };
        }

        public function __confSlot11_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_5:Object;
            var _local_6:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                _local_5 = _core.data.getData(GamePredef.TBL_SKILL, _skillList[_local_3]);
                _local_6 = _skillTargetTemp[_local_5.id];
                if (!_local_6)
                {
                    _local_6 = 1;
                };
                if (_local_6 > 50)
                {
                    _local_6 = 5;
                };
                this[("s" + _local_4)].sk = _skillList[_local_3];
                this[("s" + _local_4)].nm = _local_5.name;
                this[("s" + _local_4)].tarType = (Language.AI_CONF_PANEL_U[20] + Language.AI_CONF_PANEL_U[_local_6]);
                _local_4++;
            };
        }

        public function set confSlot16(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100135confSlot16;
            if (_local_2 !== _arg_1)
            {
                this._207100135confSlot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot16", _local_2, _arg_1));
            };
        }

        public function set confSlot10(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100129confSlot10;
            if (_local_2 !== _arg_1)
            {
                this._207100129confSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot10", _local_2, _arg_1));
            };
        }

        public function set confSlot18(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100137confSlot18;
            if (_local_2 !== _arg_1)
            {
                this._207100137confSlot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot18", _local_2, _arg_1));
            };
        }

        public function __confSlot19_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function set confSlot19(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100138confSlot19;
            if (_local_2 !== _arg_1)
            {
                this._207100138confSlot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot19", _local_2, _arg_1));
            };
        }

        public function set confSlot12(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100131confSlot12;
            if (_local_2 !== _arg_1)
            {
                this._207100131confSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot12", _local_2, _arg_1));
            };
        }

        public function ___AIConfPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            showAIHelp();
        }

        public function set confSlot17(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100136confSlot17;
            if (_local_2 !== _arg_1)
            {
                this._207100136confSlot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot17", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cvs1():Canvas
        {
            return (this._3066321cvs1);
        }

        public function set confSlot15(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100134confSlot15;
            if (_local_2 !== _arg_1)
            {
                this._207100134confSlot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot15", _local_2, _arg_1));
            };
        }

        public function set tgId(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._3557102tgId;
            if (_local_2 !== _arg_1)
            {
                this._3557102tgId = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tgId", _local_2, _arg_1));
            };
        }

        private function _AIConfPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PETFIGHT_PANEL_U[1];
            _local_1 = Language.AI_CONF_PANEL_U[0];
            _local_1 = Language.AI_CONF_PANEL_U[10];
            _local_1 = Language.AI_CONF_PANEL_U[1];
            _local_1 = Language.AI_CONF_PANEL_U[11];
            _local_1 = Language.AI_CONF_PANEL_U[22];
            _local_1 = Language.AI_CONF_PANEL_U[12];
            _local_1 = Language.AI_CONF_PANEL_U[23];
            _local_1 = Language.AI_CONF_PANEL_U[13];
            _local_1 = Language.AI_CONF_PANEL_U[24];
            _local_1 = Language.AI_CONF_PANEL_U[14];
            _local_1 = Language.AI_CONF_PANEL_U[25];
            _local_1 = Language.AI_CONF_PANEL_U[15].replace("{num}", (tgId.selectedIndex + 1).toString());
            _local_1 = [1, 2, 3, 4, 5];
            _local_1 = tg5.selected;
            _local_1 = Language.AI_CONF_PANEL_U[6];
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Slot.SLOT_PET_AI;
            _local_1 = Language.AI_CONF_PANEL_U[21];
            _local_1 = Language.AI_CONF_PANEL_U[9];
            _local_1 = Language.AI_CONF_PANEL_U[8];
        }

        public function __confSlot2_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        public function set confSlot14(_arg_1:AISkillSlot):void
        {
            var _local_2:Object = this._207100133confSlot14;
            if (_local_2 !== _arg_1)
            {
                this._207100133confSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confSlot14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cvs2():Canvas
        {
            return (this._3066322cvs2);
        }

        private function clearSlot(_arg_1:Event):void
        {
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (((_local_2) && (_local_2.giid > 0)))
            {
                _local_2.clean();
            };
        }

        public function __confSlot22_click(_arg_1:MouseEvent):void
        {
            putSlot(_arg_1);
        }

        private function onSkillListClick(_arg_1:MouseEvent):void
        {
            var _local_2:AISkillComp = AISkillComp(_arg_1.currentTarget);
            if (_local_2)
            {
                _core.nextGuide(ViewManager.POP_AI_CONFIGURE, "", -1, -1, 1);
                if (_selectedSlot == _local_2)
                {
                    return;
                };
                if (_selectedSlot)
                {
                    _selectedSlot.filters = [];
                };
                _selectedSlot = _local_2;
                _selectedSlot.filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
                if (_selectedSlot == s1)
                {
                    tg1.enabled = false;
                    tg2.enabled = false;
                    tg3.enabled = false;
                    tg4.enabled = false;
                    tg5.enabled = false;
                    tgId.enabled = false;
                }
                else
                {
                    tg1.enabled = true;
                    tg2.enabled = true;
                    tg3.enabled = true;
                    tg4.enabled = true;
                    tg5.enabled = true;
                    tgId.enabled = true;
                };
                if (_skillTargetTemp[_local_2.giid])
                {
                    if (_skillTargetTemp[_local_2.giid] >= 50)
                    {
                        tgId.selectedIndex = (_skillTargetTemp[_local_2.giid] - 50);
                        tg5.selected = true;
                    }
                    else
                    {
                        this[("tg" + _skillTargetTemp[_local_2.giid])].selected = true;
                    };
                }
                else
                {
                    this.tg1.selected = true;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

