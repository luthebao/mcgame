// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.ui.view.comp.SkillUseSlot;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.containers.HBox;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicMultiLineButton;
    import com.qeedoo.ui.view.comp.PentagonCanvas;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import mx.states.SetProperty;
    import mx.controls.Image;
    import mx.states.RemoveChild;
    import mx.core.Repeater;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.ItemConfig;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.game.logic.Battle;
    import com.qeedoo.game.event.GameDataEvent;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.Event;
    import mx.core.DragSource;
    import mx.controls.Button;
    import mx.managers.DragManager;
    import com.qeedoo.ui.view.compBattle.PetCmdCanvas;
    import mx.binding.Binding;
    import flash.display.DisplayObject;
    import mx.binding.RepeatableBinding;
    import mx.states.State;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.game.data.GameData;
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

    public class PetPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _112005436vbox1:VBox;
        private var _169699452petFuncBtn5:BasicGlowButton;
        private var _1002706921simplecanvas3:SimpleCanvas;
        private var _900562943skill2:SkillUseSlot;
        private var _1091882814factor1:RoundedLabel;
        private var _550778330canvas2:Canvas;
        private var _861878256basichortxtbutton5:BasicTxtButton;
        private var _1137294803_PetPanel_HBox1:HBox;
        private var _237239562aptAgilityFinal:RoundedLabel;
        private var _1549420544delBtn1:BasicGlowButton;
        private var _839841133upBtn4:BasicGlowButton;
        private var _1315489237starHbox:HBox;
        private var _677962293petEqu5:ItemSlot;
        private var _505171262openBtn4:BasicGlowButton;
        private var _1554141557tabBtn2:BasicMultiLineButton;
        private var _112005437vbox2:VBox;
        private var _805962357propertyPentagon:PentagonCanvas;
        private var _861878254basichortxtbutton3:BasicTxtButton;
        private var _1751782644aptStaminaFinal:RoundedLabel;
        private var petDataTemp:Object;
        private var _900562942skill3:SkillUseSlot;
        private var _702954884aptIntelligence:BoxLabel;
        private var _1618724969aptEnergyFinal:RoundedLabel;
        private var _1091882815factor0:RoundedLabel;
        private var _550778331canvas3:Canvas;
        private var _507317139growRate:BoxLabel;
        private var _1549420545delBtn2:BasicGlowButton;
        private var _861878252basichortxtbutton1:BasicTxtButton;
        public var _PetPanel_SetProperty10:SetProperty;
        public var _PetPanel_SetProperty11:SetProperty;
        public var _PetPanel_SetProperty12:SetProperty;
        public var _PetPanel_SetProperty13:SetProperty;
        public var _PetPanel_SetProperty14:SetProperty;
        public var _PetPanel_SetProperty15:SetProperty;
        public var _PetPanel_SetProperty16:SetProperty;
        public var _PetPanel_SetProperty17:SetProperty;
        public var _PetPanel_SetProperty18:SetProperty;
        public var _PetPanel_SetProperty19:SetProperty;
        private var _169699450petFuncBtn3:BasicGlowButton;
        private var _839841132upBtn5:BasicGlowButton;
        public var _PetPanel_Image1:Image;
        public var _PetPanel_Image2:Array;
        private var _112005438vbox3:VBox;
        public var _PetPanel_SetProperty20:SetProperty;
        public var _PetPanel_SetProperty21:SetProperty;
        public var _PetPanel_SetProperty22:SetProperty;
        private var _348170509aptEnergy:BoxLabel;
        private var _677962294petEqu4:ItemSlot;
        private var _169699453petFuncBtn6:BasicGlowButton;
        public var petData:Object;
        private var _1554141558tabBtn1:BasicMultiLineButton;
        private var _505171265openBtn1:BasicGlowButton;
        private var _505171261openBtn5:BasicGlowButton;
        private var _1091882811factor4:RoundedLabel;
        public var _PetPanel_SetProperty1:SetProperty;
        public var _PetPanel_SetProperty2:SetProperty;
        public var _PetPanel_SetProperty3:SetProperty;
        public var _PetPanel_SetProperty5:SetProperty;
        public var _PetPanel_SetProperty8:SetProperty;
        public var _PetPanel_SetProperty9:SetProperty;
        private var _900562941skill4:SkillUseSlot;
        private var _2055403737aptStrengthEx:RoundedLabel;
        private var _169699448petFuncBtn1:BasicGlowButton;
        private var _1588184269aptAgilityEx:RoundedLabel;
        private var _677962290petEqu8:ItemSlot;
        private var _112005439vbox4:VBox;
        private var selectedTabIndex:int = 0;
        private var _861878257basichortxtbutton6:BasicTxtButton;
        private var _1549420546delBtn3:BasicGlowButton;
        private var _314795602aptIntelligenceFinal:RoundedLabel;
        private var _677962295petEqu3:ItemSlot;
        private var _839841136upBtn1:BasicGlowButton;
        private var _1002706920simplecanvas2:SimpleCanvas;
        private var _900562940skill5:SkillUseSlot;
        private var _1554141559tabBtn0:BasicMultiLineButton;
        private var _1091882812factor3:RoundedLabel;
        private var _861878255basichortxtbutton4:BasicTxtButton;
        private var _505171264openBtn2:BasicGlowButton;
        private var _1002706919simplecanvas1:SimpleCanvas;
        private var _169699451petFuncBtn4:BasicGlowButton;
        private var _677962291petEqu7:ItemSlot;
        private var _395626106aptStrength:BoxLabel;
        private var _btnEnabled:Boolean = true;
        private var _839841135upBtn2:BasicGlowButton;
        private var _1549420547delBtn4:BasicGlowButton;
        private var _861878253basichortxtbutton2:BasicTxtButton;
        public var _PetPanel_RemoveChild1:RemoveChild;
        public var _PetPanel_RemoveChild2:RemoveChild;
        public var _PetPanel_RemoveChild3:RemoveChild;
        public var _PetPanel_RemoveChild4:RemoveChild;
        public var _PetPanel_RemoveChild5:RemoveChild;
        public var _PetPanel_RemoveChild6:RemoveChild;
        public var _PetPanel_RemoveChild7:RemoveChild;
        public var _PetPanel_RemoveChild8:RemoveChild;
        public var _PetPanel_RemoveChild9:RemoveChild;
        private var _677962296petEqu2:ItemSlot;
        private var _169699449petFuncBtn2:BasicGlowButton;
        private var _504961010growRateAdd:RoundedLabel;
        private var _815424624aptStrengthFinal:RoundedLabel;
        private var _1229780311aptIntelligenceEx:RoundedLabel;
        private var _1091882813factor2:RoundedLabel;
        private var _1543550368aptAgility:BoxLabel;
        private var _900562944skill1:SkillUseSlot;
        private var _505171263openBtn3:BasicGlowButton;
        private var _112005440vbox5:VBox;
        private var _1911434378aptStamina:BoxLabel;
        private var _1357563171aptStaminaEx:RoundedLabel;
        public var _PetPanel_RemoveChild10:RemoveChild;
        public var _PetPanel_RemoveChild11:RemoveChild;
        public var _PetPanel_RemoveChild12:RemoveChild;
        private var _677962292petEqu6:ItemSlot;
        private var _3540562star:Repeater;
        private var _415587680aptEnergyEx:RoundedLabel;
        private var _839841134upBtn3:BasicGlowButton;
        private var _1549420548delBtn5:BasicGlowButton;
        private var _501173401pettitle:BasicTitleCanvas;
        private var _677962297petEqu1:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":370,
                    "height":447,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"pettitle"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"simplecanvas1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":10,
                                "percentWidth":100,
                                "percentHeight":100,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_PetPanel_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":238,
                                            "y":52
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"factor0",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15361583;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":284,
                                            "y":53
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"factor1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 14689269;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":329,
                                            "y":89
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"factor2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16081443;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":313,
                                            "y":140
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"factor3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 2329845;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0xFF,
                                            "y":140
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"factor4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 9301547;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":239,
                                            "y":88
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"simplecanvas2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":380,
                                "height":138.5,
                                "y":40,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":PentagonCanvas,
                                    "id":"propertyPentagon",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":111,
                                            "height":111,
                                            "x":240,
                                            "y":20,
                                            "lineShow":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"starHbox",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":130,
                                            "y":3,
                                            "x":230,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Repeater,
                                                "id":"star",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_PetPanel_Image2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":9,
                                                                    "height":9
                                                                });
                                                            }
                                                        })]});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"growRate",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":89,
                                            "y":4,
                                            "width":134
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"growRateAdd",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":164,
                                            "y":4,
                                            "width":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"aptStrength",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":89,
                                            "y":26,
                                            "width":134
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"aptAgility",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":89,
                                            "y":47,
                                            "width":134
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"aptStamina",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":89,
                                            "y":69,
                                            "width":134
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"aptIntelligence",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":89,
                                            "y":91,
                                            "width":134
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"aptEnergy",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":89,
                                            "y":113,
                                            "width":134
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptStrengthEx",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":128,
                                            "y":26,
                                            "width":35
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptAgilityEx",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":128,
                                            "y":47,
                                            "width":35
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptStaminaEx",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":128,
                                            "y":69,
                                            "width":35
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptIntelligenceEx",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":128,
                                            "y":91,
                                            "width":35
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptEnergyEx",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":128,
                                            "y":113,
                                            "width":35
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptStrengthFinal",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":164,
                                            "y":26,
                                            "width":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptAgilityFinal",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":164,
                                            "y":48,
                                            "width":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptStaminaFinal",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":164,
                                            "y":69,
                                            "width":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptIntelligenceFinal",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":164,
                                            "y":91,
                                            "width":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"aptEnergyFinal",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":164,
                                            "y":113,
                                            "width":59
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"basichortxtbutton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.paddingTop = 1;
                                        this.paddingBottom = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":17,
                                            "y":4,
                                            "width":66,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"basichortxtbutton2",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.paddingTop = 1;
                                        this.paddingBottom = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":17,
                                            "y":26,
                                            "width":66,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"basichortxtbutton3",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.paddingTop = 1;
                                        this.paddingBottom = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":17,
                                            "y":47,
                                            "width":66,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"basichortxtbutton4",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.paddingTop = 1;
                                        this.paddingBottom = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":17,
                                            "y":69,
                                            "width":66,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"basichortxtbutton5",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.paddingTop = 1;
                                        this.paddingBottom = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":17,
                                            "y":92,
                                            "width":66,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"basichortxtbutton6",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.paddingTop = 1;
                                        this.paddingBottom = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":17,
                                            "y":113,
                                            "width":66,
                                            "height":19
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvas2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":13,
                                "y":176,
                                "width":290,
                                "height":213,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":4,
                                            "y":3,
                                            "styleName":"VerticalTab",
                                            "selected":true,
                                            "height":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":4,
                                            "y":69,
                                            "styleName":"VerticalTab",
                                            "height":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":4,
                                            "y":135,
                                            "styleName":"VerticalTab",
                                            "height":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"simplecanvas3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23,
                                            "y":0,
                                            "width":265,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":SkillUseSlot,
                                                "id":"skill1",
                                                "events":{
                                                    "click":"__skill1_click",
                                                    "creationComplete":"__skill1_creationComplete"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.5,
                                                        "y":2,
                                                        "height":41,
                                                        "currentState":"pet",
                                                        "skillType":"pet",
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SkillUseSlot,
                                                "id":"skill2",
                                                "events":{
                                                    "click":"__skill2_click",
                                                    "creationComplete":"__skill2_creationComplete"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.5,
                                                        "y":44,
                                                        "height":41,
                                                        "currentState":"pet",
                                                        "skillType":"pet",
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SkillUseSlot,
                                                "id":"skill3",
                                                "events":{
                                                    "click":"__skill3_click",
                                                    "creationComplete":"__skill3_creationComplete"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.5,
                                                        "y":86,
                                                        "height":41,
                                                        "currentState":"pet",
                                                        "skillType":"pet",
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SkillUseSlot,
                                                "id":"skill4",
                                                "events":{
                                                    "click":"__skill4_click",
                                                    "creationComplete":"__skill4_creationComplete"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.5,
                                                        "y":128,
                                                        "height":41,
                                                        "currentState":"pet",
                                                        "skillType":"pet",
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SkillUseSlot,
                                                "id":"skill5",
                                                "events":{
                                                    "click":"__skill5_click",
                                                    "creationComplete":"__skill5_creationComplete"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.5,
                                                        "y":170,
                                                        "height":41,
                                                        "currentState":"pet",
                                                        "skillType":"pet",
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vbox1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalAlign = "center";
                                                    this.verticalGap = 1;
                                                    this.verticalAlign = "middle";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":3,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"delBtn1",
                                                            "events":{"click":"__delBtn1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"upBtn1",
                                                            "events":{"click":"__upBtn1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"openBtn1",
                                                            "events":{"click":"__openBtn1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalGreen",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vbox2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalAlign = "center";
                                                    this.verticalGap = 1;
                                                    this.verticalAlign = "middle";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":45,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"delBtn2",
                                                            "events":{"click":"__delBtn2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"upBtn2",
                                                            "events":{"click":"__upBtn2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"openBtn2",
                                                            "events":{"click":"__openBtn2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalGreen",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vbox3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalAlign = "center";
                                                    this.verticalGap = 1;
                                                    this.verticalAlign = "middle";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":87,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"delBtn3",
                                                            "events":{"click":"__delBtn3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"upBtn3",
                                                            "events":{"click":"__upBtn3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"openBtn3",
                                                            "events":{"click":"__openBtn3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalGreen",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vbox4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalAlign = "center";
                                                    this.verticalGap = 1;
                                                    this.verticalAlign = "middle";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":129,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"delBtn4",
                                                            "events":{"click":"__delBtn4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"upBtn4",
                                                            "events":{"click":"__upBtn4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"openBtn4",
                                                            "events":{"click":"__openBtn4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalGreen",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vbox5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalAlign = "center";
                                                    this.verticalGap = 1;
                                                    this.verticalAlign = "middle";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":171,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"delBtn5",
                                                            "events":{"click":"__delBtn5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"upBtn5",
                                                            "events":{"click":"__upBtn5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "width":40.6,
                                                                    "height":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"openBtn5",
                                                            "events":{"click":"__openBtn5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalGreen",
                                                                    "width":40.6,
                                                                    "height":19
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
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"petFuncBtn1",
                        "events":{"click":"__petFuncBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":306,
                                "y":180,
                                "styleName":"BtnStdRed",
                                "width":50.9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"petFuncBtn2",
                        "events":{"click":"__petFuncBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":306,
                                "y":212,
                                "styleName":"BtnStdRed",
                                "width":50.9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"petFuncBtn3",
                        "events":{"click":"__petFuncBtn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":306,
                                "y":244,
                                "styleName":"BtnStdRed",
                                "width":50.9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"petFuncBtn4",
                        "events":{"click":"__petFuncBtn4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":306,
                                "y":276,
                                "styleName":"BtnStdRed",
                                "width":50.9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"petFuncBtn5",
                        "events":{"click":"__petFuncBtn5_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":306,
                                "y":308,
                                "styleName":"BtnStdRed",
                                "width":50.9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"petFuncBtn6",
                        "events":{"click":"__petFuncBtn6_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":306,
                                "y":340,
                                "styleName":"BtnStdRed",
                                "width":50.9
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvas3",
                        "events":{"creationComplete":"__canvas3_creationComplete"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":390,
                                "width":380,
                                "height":59,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"petEqu1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":600,
                                            "y":9,
                                            "x":27,
                                            "slotType":4
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"petEqu2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":601,
                                            "y":9,
                                            "x":68,
                                            "slotType":4,
                                            "styleName":"TransparentSlot"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"petEqu3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":602,
                                            "y":9,
                                            "x":109,
                                            "slotType":4,
                                            "styleName":"TransparentSlot"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"petEqu4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":603,
                                            "y":9,
                                            "x":150,
                                            "slotType":4,
                                            "styleName":"TransparentSlot"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"petEqu5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":604,
                                            "y":9,
                                            "x":191,
                                            "slotType":4,
                                            "styleName":"TransparentSlot"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"petEqu6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":605,
                                            "y":9,
                                            "x":232,
                                            "slotType":4,
                                            "styleName":"TransparentSlot"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"petEqu7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":606,
                                            "y":9,
                                            "x":272,
                                            "slotType":4,
                                            "styleName":"TransparentSlot"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"petEqu8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "index":607,
                                            "y":9,
                                            "x":313,
                                            "slotType":4,
                                            "styleName":"TransparentSlot"
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetPanel()
        {
            mx_internal::_document = this;
            this.width = 370;
            this.height = 447;
            this.styleName = "StandardContent";
            this.currentState = "skill";
            this.cacheAsBitmap = true;
            this.states = [_PetPanel_State1_c(), _PetPanel_State2_c()];
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get delBtn2():BasicGlowButton
        {
            return (this._1549420545delBtn2);
        }

        public function set delBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420545delBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1549420545delBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get delBtn4():BasicGlowButton
        {
            return (this._1549420547delBtn4);
        }

        public function set delBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420546delBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1549420546delBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn3", _local_2, _arg_1));
            };
        }

        private function _PetPanel_RemoveChild9_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild9 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild9", _PetPanel_RemoveChild9);
            return (_local_1);
        }

        private function _PetPanel_RemoveChild12_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild12 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild12", _PetPanel_RemoveChild12);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get delBtn3():BasicGlowButton
        {
            return (this._1549420546delBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get simplecanvas2():SimpleCanvas
        {
            return (this._1002706920simplecanvas2);
        }

        [Bindable(event="propertyChange")]
        public function get delBtn5():BasicGlowButton
        {
            return (this._1549420548delBtn5);
        }

        public function set delBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420547delBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1549420547delBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn4", _local_2, _arg_1));
            };
        }

        private function _PetPanel_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty2 = _local_1;
            _local_1.name = "x";
            _local_1.value = 1;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty2", _PetPanel_SetProperty2);
            return (_local_1);
        }

        public function set skill2(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562943skill2;
            if (_local_2 !== _arg_1)
            {
                this._900562943skill2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill4():SkillUseSlot
        {
            return (this._900562941skill4);
        }

        public function set skill3(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562942skill3;
            if (_local_2 !== _arg_1)
            {
                this._900562942skill3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get growRateAdd():RoundedLabel
        {
            return (this._504961010growRateAdd);
        }

        public function set delBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420548delBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1549420548delBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill2():SkillUseSlot
        {
            return (this._900562943skill2);
        }

        [Bindable(event="propertyChange")]
        public function get skill3():SkillUseSlot
        {
            return (this._900562942skill3);
        }

        public function set growRateAdd(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._504961010growRateAdd;
            if (_local_2 !== _arg_1)
            {
                this._504961010growRateAdd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "growRateAdd", _local_2, _arg_1));
            };
        }

        public function set skill4(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562941skill4;
            if (_local_2 !== _arg_1)
            {
                this._900562941skill4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill4", _local_2, _arg_1));
            };
        }

        public function set skill5(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562940skill5;
            if (_local_2 !== _arg_1)
            {
                this._900562940skill5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill5", _local_2, _arg_1));
            };
        }

        public function __petFuncBtn5_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(6);
        }

        [Bindable(event="propertyChange")]
        public function get skill5():SkillUseSlot
        {
            return (this._900562940skill5);
        }

        [Bindable(event="propertyChange")]
        public function get delBtn1():BasicGlowButton
        {
            return (this._1549420544delBtn1);
        }

        private function _PetPanel_SetProperty19_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty19 = _local_1;
            _local_1.name = "width";
            _local_1.value = 170;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty19", _PetPanel_SetProperty19);
            return (_local_1);
        }

        private function skillTabBtnClick(_arg_1:int):void
        {
            drawSkillSlots(_arg_1);
            selectedTabIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= 2)
            {
                if (_local_2 == _arg_1)
                {
                    this[("tabBtn" + _local_2)].selected = true;
                }
                else
                {
                    this[("tabBtn" + _local_2)].selected = false;
                };
                _local_2++;
            };
        }

        public function set delBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420544delBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1549420544delBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn1", _local_2, _arg_1));
            };
        }

        public function __skill5_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        private function _PetPanel_SetProperty1_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty1 = _local_1;
            _local_1.name = "text";
            BindingManager.executeBindings(this, "_PetPanel_SetProperty1", _PetPanel_SetProperty1);
            return (_local_1);
        }

        private function _PetPanel_RemoveChild8_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild8 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild8", _PetPanel_RemoveChild8);
            return (_local_1);
        }

        private function _PetPanel_RemoveChild11_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild11 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild11", _PetPanel_RemoveChild11);
            return (_local_1);
        }

        private function _PetPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = pettitle;
            _local_1 = Language.PETPANEL_U[10];
            _local_1 = pettitle;
            _local_1 = pettitle;
            _local_1 = pettitle;
            _local_1 = Language.PETPANEL_U[17];
            _local_1 = simplecanvas2;
            _local_1 = simplecanvas1;
            _local_1 = canvas2;
            _local_1 = canvas2;
            _local_1 = canvas2;
            _local_1 = petFuncBtn1;
            _local_1 = petFuncBtn2;
            _local_1 = petFuncBtn3;
            _local_1 = petFuncBtn4;
            _local_1 = canvas3;
            _local_1 = vbox1;
            _local_1 = vbox2;
            _local_1 = vbox3;
            _local_1 = vbox4;
            _local_1 = vbox5;
            _local_1 = simplecanvas3;
            _local_1 = skill1;
            _local_1 = skill2;
            _local_1 = skill3;
            _local_1 = skill4;
            _local_1 = skill5;
            _local_1 = skill1;
            _local_1 = skill2;
            _local_1 = skill3;
            _local_1 = skill4;
            _local_1 = skill5;
            _local_1 = pettitle;
            _local_1 = ResManager.PET_PENTAGON;
            _local_1 = Language.CHARSELECTCANVAS_U[17];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[18];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[19];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[20];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[21];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.PETPANEL_U[18];
            _local_1 = star.currentItem;
            _local_1 = Language.PETPANEL_S[12];
            _local_1 = Language.PETPANEL_S[13];
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStrength) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)));
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptAgility) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)));
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStamina) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)));
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptIntelligence) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)));
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptEnergy) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStrengthEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptAgilityEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStaminaEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptIntelligenceEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptEnergyEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptStrength) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0))))))));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptAgility) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0))))))));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptStamina) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0))))))));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptIntelligence) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0))))))));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptEnergy) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0))))))));
            _local_1 = Language.PETPANEL_U[11];
            _local_1 = Language.GAMEPREDEF_S[511];
            _local_1 = Language.PETPANEL_U[12];
            _local_1 = Language.GAMEPREDEF_S[0x0200];
            _local_1 = Language.PETPANEL_U[13];
            _local_1 = Language.GAMEPREDEF_S[513];
            _local_1 = Language.PETPANEL_U[14];
            _local_1 = Language.GAMEPREDEF_S[0x0202];
            _local_1 = Language.PETPANEL_U[15];
            _local_1 = Language.GAMEPREDEF_S[515];
            _local_1 = Language.PETPANEL_U[16];
            _local_1 = Language.GAMEPREDEF_S[516];
            _local_1 = Language.PETPANEL_U[7];
            _local_1 = Language.PETPANEL_U[8];
            _local_1 = Language.PETPANEL_U[9];
            _local_1 = Language.PETPANEL_U[19];
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[0];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[1];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[2];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[3];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[22];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[24];
            _local_1 = this._btnEnabled;
            _local_1 = GamePredef.EQUIP_POSITION[50];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [50];
            _local_1 = GamePredef.EQUIP_POSITION[51];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [51];
            _local_1 = GamePredef.EQUIP_POSITION[52];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [52];
            _local_1 = GamePredef.EQUIP_POSITION[53];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [53];
            _local_1 = GamePredef.EQUIP_POSITION[54];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [54];
            _local_1 = GamePredef.EQUIP_POSITION[55];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [55];
            _local_1 = GamePredef.EQUIP_POSITION[56];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [56];
            _local_1 = GamePredef.EQUIP_POSITION[57];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [57];
        }

        public function __skill1_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        private function _PetPanel_SetProperty18_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty18 = _local_1;
            _local_1.name = "width";
            _local_1.value = 170;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty18", _PetPanel_SetProperty18);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get aptEnergyFinal():RoundedLabel
        {
            return (this._1618724969aptEnergyFinal);
        }

        [Bindable(event="propertyChange")]
        public function get skill1():SkillUseSlot
        {
            return (this._900562944skill1);
        }

        private function upSkill(index:int):void
        {
            var skillData:Object;
            var func:Function;
            var func2:Function;
            index = ((selectedTabIndex * 5) + index);
            var str:String = "";
            if (((petData) && (ToolKit.isBigThan(petData[("skill" + index)], 0))))
            {
                skillData = _core.data.getGameData(GamePredef.TBL_SKILL, petData[("skill" + index)]);
                if (skillData)
                {
                    if (ToolKit.isBigOrEqual(skillData.level, 3))
                    {
                        _core.sysMsg(Language.PETPANEL_S[3]);
                    }
                    else
                    {
                        if (ToolKit.isEqual(skillData.level, 1))
                        {
                            if (_core.haveItem(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_UP[petDataTemp.qLevel], 1))
                            {
                                func = function (_arg_1:CloseEvent):void
                                {
                                    if (_arg_1.detail == Alert.YES)
                                    {
                                        _core.remote.petUpSkill(petData.id, index);
                                    };
                                };
                                str = Language.PETPANEL_S[4];
                                str = str.replace("{skillData.name}", skillData.name);
                                Alert.show(str, "", 3, this, func);
                            }
                            else
                            {
                                str = Language.PETPANEL_S[5];
                                str = str.replace("{petSkillUpItem}", TextUtil.getCodeByTypeId(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_UP[petDataTemp.qLevel]));
                                _core.sysMsg(str);
                            };
                        }
                        else
                        {
                            if (ToolKit.isEqual(skillData.level, 2))
                            {
                                if (_core.haveItem(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_UP[petDataTemp.qLevel], 3))
                                {
                                    func2 = function (_arg_1:CloseEvent):void
                                    {
                                        if (_arg_1.detail == Alert.YES)
                                        {
                                            _core.remote.petUpSkill(petData.id, index);
                                        };
                                    };
                                    str = Language.PETPANEL_S[6];
                                    str = str.replace("{skillData.name}", skillData.name);
                                    Alert.show(str, "", 3, this, func2);
                                }
                                else
                                {
                                    str = Language.PETPANEL_S[7];
                                    str = str.replace("{petSkillUpItem}", TextUtil.getCodeByTypeId(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_UP[petDataTemp.qLevel]));
                                    _core.sysMsg(str);
                                };
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn1():BasicGlowButton
        {
            return (this._169699448petFuncBtn1);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn3():BasicGlowButton
        {
            return (this._169699450petFuncBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn4():BasicGlowButton
        {
            return (this._169699451petFuncBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn5():BasicGlowButton
        {
            return (this._169699452petFuncBtn5);
        }

        private function _PetPanel_RemoveChild10_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild10 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild10", _PetPanel_RemoveChild10);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn2():BasicGlowButton
        {
            return (this._169699449petFuncBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get aptStamina():BoxLabel
        {
            return (this._1911434378aptStamina);
        }

        private function _PetPanel_RemoveChild7_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild7 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild7", _PetPanel_RemoveChild7);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn6():BasicGlowButton
        {
            return (this._169699453petFuncBtn6);
        }

        public function set skill1(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562944skill1;
            if (_local_2 !== _arg_1)
            {
                this._900562944skill1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pettitle():BasicTitleCanvas
        {
            return (this._501173401pettitle);
        }

        public function set aptIntelligenceFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._314795602aptIntelligenceFinal;
            if (_local_2 !== _arg_1)
            {
                this._314795602aptIntelligenceFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptIntelligenceFinal", _local_2, _arg_1));
            };
        }

        public function __delBtn1_click(_arg_1:MouseEvent):void
        {
            delSkill(1);
        }

        public function set star(_arg_1:Repeater):void
        {
            var _local_2:Object;
            _local_2 = this._3540562star;
            if (_local_2 !== _arg_1)
            {
                this._3540562star = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star", _local_2, _arg_1));
            };
        }

        private function _PetPanel_SetProperty17_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty17 = _local_1;
            _local_1.name = "width";
            _local_1.value = 170;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty17", _PetPanel_SetProperty17);
            return (_local_1);
        }

        public function __upBtn4_click(_arg_1:MouseEvent):void
        {
            upSkill(4);
        }

        public function set aptAgility(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1543550368aptAgility;
            if (_local_2 !== _arg_1)
            {
                this._1543550368aptAgility = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptAgility", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get factor0():RoundedLabel
        {
            return (this._1091882815factor0);
        }

        [Bindable(event="propertyChange")]
        public function get factor1():RoundedLabel
        {
            return (this._1091882814factor1);
        }

        private function _PetPanel_RemoveChild6_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild6 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild6", _PetPanel_RemoveChild6);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get factor4():RoundedLabel
        {
            return (this._1091882811factor4);
        }

        [Bindable(event="propertyChange")]
        public function get factor2():RoundedLabel
        {
            return (this._1091882813factor2);
        }

        public function changeSelectPet(_arg_1:Object):void
        {
            this.petData = _arg_1;
        }

        public function set aptEnergyFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1618724969aptEnergyFinal;
            if (_local_2 !== _arg_1)
            {
                this._1618724969aptEnergyFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptEnergyFinal", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get factor3():RoundedLabel
        {
            return (this._1091882812factor3);
        }

        [Bindable(event="propertyChange")]
        public function get aptStrengthEx():RoundedLabel
        {
            return (this._2055403737aptStrengthEx);
        }

        public function __petFuncBtn4_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(5);
        }

        public function showPet(_arg_1:Object):void
        {
            this.petData = _arg_1;
            reformBattlePetData();
            initView();
        }

        public function set propertyPentagon(_arg_1:PentagonCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._805962357propertyPentagon;
            if (_local_2 !== _arg_1)
            {
                this._805962357propertyPentagon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propertyPentagon", _local_2, _arg_1));
            };
        }

        private function _PetPanel_SetProperty16_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty16 = _local_1;
            _local_1.name = "x";
            _local_1.value = 0;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty16", _PetPanel_SetProperty16);
            return (_local_1);
        }

        public function __openBtn5_click(_arg_1:MouseEvent):void
        {
            openSkill(5);
        }

        public function set petFuncBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699448petFuncBtn1;
            if (_local_2 !== _arg_1)
            {
                this._169699448petFuncBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn1", _local_2, _arg_1));
            };
        }

        public function set petFuncBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699449petFuncBtn2;
            if (_local_2 !== _arg_1)
            {
                this._169699449petFuncBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn2", _local_2, _arg_1));
            };
        }

        private function skillLevelClicked(_arg_1:GameDataEvent):void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_2:Core = Core.getInstance();
            if (((_local_2.state == GamePredef.ST_CORE_BATTLE) && (_local_2.cmdState == GamePredef.ST_BATTLE_SKILL)))
            {
                _local_3 = _arg_1.data.level;
                _local_4 = _arg_1.data.skill;
                if (_local_2.checkSkillRequire(_local_4, true, true))
                {
                    _local_2.skill = _local_4;
                    _local_2.skillLevel = _local_3;
                    if (((!(ToolKit.isEqual(_local_4.targetType, Battle.SKILL_TARGET_TYPE_SELF_PLAYER))) && (!(ToolKit.isEqual(_local_4.targetType, Battle.SKILL_TARGET_TYPE_SELF_PET)))))
                    {
                        _local_2.view.showSelect();
                    };
                    visible = false;
                };
            }
            else
            {
                drag(_arg_1.data.slot, _arg_1.data.event, _arg_1.data.level);
            };
        }

        public function set petFuncBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699450petFuncBtn3;
            if (_local_2 !== _arg_1)
            {
                this._169699450petFuncBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn3", _local_2, _arg_1));
            };
        }

        public function set petFuncBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699451petFuncBtn4;
            if (_local_2 !== _arg_1)
            {
                this._169699451petFuncBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn4", _local_2, _arg_1));
            };
        }

        public function set petFuncBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699452petFuncBtn5;
            if (_local_2 !== _arg_1)
            {
                this._169699452petFuncBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn5", _local_2, _arg_1));
            };
        }

        private function _PetPanel_RemoveChild5_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild5 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild5", _PetPanel_RemoveChild5);
            return (_local_1);
        }

        private function delSkill(index:int):void
        {
            var skillData:Object;
            var _delSkill:Function;
            var func:Function;
            index = ((selectedTabIndex * 5) + index);
            if (((petData) && (ToolKit.isBigThan(petData[("skill" + index)], 0))))
            {
                if (_core.haveItem(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_DEL, 1))
                {
                    skillData = _core.data.getGameData(GamePredef.TBL_SKILL, petData[("skill" + index)]);
                    if (skillData)
                    {
                        _delSkill = function (_arg_1:String):void
                        {
                            var _local_2:String;
                            if (_arg_1)
                            {
                                _local_2 = MD5.hash(_arg_1);
                                _core.remote.petDelSkill(petData.id, index, _local_2);
                            };
                        };
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                if (_core.delPass)
                                {
                                    _core.remote.petDelSkill(petData.id, index, _core.delPass);
                                }
                                else
                                {
                                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.PETPANEL_U[23], _delSkill);
                                };
                            };
                        };
                        Alert.show(((Language.PETPANEL_S[1] + skillData.name) + "?"), "", 3, this, func);
                    };
                }
                else
                {
                    _core.sysMsg(((Language.PETPANEL_S[2] + TextUtil.getCodeByTypeId(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_DEL)) + "x1!"));
                };
            };
        }

        private function addEL(_arg_1:Event):void
        {
            var _local_2:SkillUseSlot = SkillUseSlot(_arg_1.currentTarget);
            _local_2.addEventListener(GameDataEvent.SKILL_LEVEL_CLICKED, skillLevelClicked);
        }

        public function set petFuncBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699453petFuncBtn6;
            if (_local_2 !== _arg_1)
            {
                this._169699453petFuncBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn6", _local_2, _arg_1));
            };
        }

        private function useSkill(_arg_1:MouseEvent):void
        {
            var _local_4:Object;
            var _local_5:String;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Object;
            var _local_2:SkillUseSlot = SkillUseSlot(_arg_1.currentTarget);
            var _local_3:Core = Core.getInstance();
            if (currentState == "skill")
            {
                _local_4 = _local_2.slotData;
                if (!_local_4)
                {
                    return;
                };
                if (_arg_1.target.hasOwnProperty("id"))
                {
                    _local_5 = _arg_1.target.id;
                    _local_6 = int(_local_5.substr(3));
                    _local_7 = int(_local_4["restoreStoneSid"]);
                    if (((_local_7 > 0) && (_local_6 <= 2)))
                    {
                        _local_4 = skillGetLevel(_local_7, _local_6);
                    }
                    else
                    {
                        _local_4 = skillGetLevel(_local_4.id, _local_6);
                    };
                };
                if ((((_local_3.state == GamePredef.ST_CORE_BATTLE) && (_local_3.cmdState == GamePredef.ST_BATTLE_SKILL)) && (_local_3.checkSkillRequire(_local_4, true, true))))
                {
                    if (_local_4.restoreSid > 0)
                    {
                        _local_8 = _core.data.getSlot({"id":_core.battlePet.equ7});
                        _local_9 = _core.data.getSlot({"id":_core.battlePet.equ8});
                        _local_10 = _core.data.getGameData(18, _local_8.itemId);
                        _local_11 = _core.data.getGameData(18, _local_9.itemId);
                        _local_12 = Number(_local_10.endureLeft);
                        _local_13 = Number(_local_11.endureLeft);
                        _local_14 = (Number(_local_10.endureMax) * 0.1);
                        _local_15 = (Number(_local_11.endureMax) * 0.1);
                        if ((((_local_12 > 0) && (_local_12 < _local_14)) || ((_local_13 > 0) && (_local_13 < _local_15))))
                        {
                            _core.sysMidNote(Language.CHARSELECTCANVAS_U[35]);
                        }
                        else
                        {
                            if (((_local_12 <= 0) || (_local_13 <= 0)))
                            {
                                _core.sysMidNote(Language.CHARSELECTCANVAS_U[36]);
                                return;
                            };
                        };
                    };
                    _core.skill = _local_4;
                    _core.skillLevel = _local_4.level;
                    visible = false;
                    if (_local_4.targetType == Battle.SKILL_TARGET_TYPE_SELF_PLAYER)
                    {
                        _core.battle.battleCmd(_core.player.battleId, GamePredef.BATTLE_ACTION_SKILL, _core.skill.id, _core.skillLevel);
                        _core.skill = null;
                        _core.skillLevel = -1;
                    }
                    else
                    {
                        if (_local_4.targetType == Battle.SKILL_TARGET_TYPE_SELF_PET)
                        {
                            _local_16 = _core.battle.battleGetPlayerPet(_core.view.getUI(ViewManager.STAGE_BATTLE).cList);
                            _core.battle.battleCmd(_local_16.battleId, GamePredef.BATTLE_ACTION_SKILL, _core.skill.id, _core.skillLevel);
                            _core.skill = null;
                            _core.skillLevel = -1;
                        }
                        else
                        {
                            _core.view.showSelect();
                        };
                    };
                };
            }
            else
            {
                drag(_local_2, _arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptEnergy():BoxLabel
        {
            return (this._348170509aptEnergy);
        }

        public function set tabBtn0(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set aptStamina(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1911434378aptStamina;
            if (_local_2 !== _arg_1)
            {
                this._1911434378aptStamina = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStamina", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set upBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841136upBtn1;
            if (_local_2 !== _arg_1)
            {
                this._839841136upBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn1", _local_2, _arg_1));
            };
        }

        public function set upBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841135upBtn2;
            if (_local_2 !== _arg_1)
            {
                this._839841135upBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn2", _local_2, _arg_1));
            };
        }

        public function set upBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841134upBtn3;
            if (_local_2 !== _arg_1)
            {
                this._839841134upBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn3", _local_2, _arg_1));
            };
        }

        public function set upBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841133upBtn4;
            if (_local_2 !== _arg_1)
            {
                this._839841133upBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn4", _local_2, _arg_1));
            };
        }

        public function set upBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841132upBtn5;
            if (_local_2 !== _arg_1)
            {
                this._839841132upBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn5", _local_2, _arg_1));
            };
        }

        private function _PetPanel_SetProperty15_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty15 = _local_1;
            _local_1.name = "x";
            _local_1.value = 0;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty15", _PetPanel_SetProperty15);
            return (_local_1);
        }

        public function set pettitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._501173401pettitle;
            if (_local_2 !== _arg_1)
            {
                this._501173401pettitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pettitle", _local_2, _arg_1));
            };
        }

        private function drag(_arg_1:SkillUseSlot, _arg_2:MouseEvent, _arg_3:int=0):void
        {
            var _local_4:Image;
            var _local_8:Number;
            var _local_9:Object;
            var _local_10:*;
            _local_4 = Image(_arg_1.skillSlot.itemIcon);
            var _local_5:DragSource = new DragSource();
            _local_5.addData(_local_4, "image");
            if (_arg_1.skillSlot.type == GamePredef.TBL_SKILL)
            {
                if ((_arg_2.target is Button))
                {
                    _local_8 = Number(Button(_arg_2.target).id.substr(3, Button(_arg_2.target).id.length));
                    if (((_local_8 > 0) && (_local_8 < 10)))
                    {
                        _local_9 = _core.data.gameDataIndex[GamePredef.TBL_SKILL][_core.data.gameData[GamePredef.TBL_SKILL][_arg_1.skillSlot.slotData.id].codeName];
                        for each (_local_10 in _local_9)
                        {
                            if (_local_10.level == _local_8)
                            {
                                _arg_1.skillSlot.giid = _local_10.id;
                                break;
                            };
                        };
                    };
                };
            };
            _local_5.addData(_arg_1.skillSlot, "slot");
            _local_5.addData(_arg_3, "level");
            var _local_6:Image = new Image();
            _local_6.source = _local_4.source;
            _local_6.height = _local_4.height;
            _local_6.width = _local_4.width;
            _local_6.x = _local_4.x;
            _local_6.y = _local_4.y;
            var _local_7:int;
            if (_arg_3 > 0)
            {
                _local_7 = (-78 - (_arg_3 * 16));
            };
            DragManager.doDrag(_local_4, _local_5, _arg_2, _local_6, _local_7, 0, 0.5);
        }

        [Bindable(event="propertyChange")]
        public function get vbox3():VBox
        {
            return (this._112005438vbox3);
        }

        private function _PetPanel_RemoveChild4_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild4 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild4", _PetPanel_RemoveChild4);
            return (_local_1);
        }

        override public function hide():void
        {
            var _local_2:PetCmdCanvas;
            super.hide();
            var _local_1:Core = Core.getInstance();
            if (_local_1.state == GamePredef.ST_CORE_BATTLE)
            {
                _local_2 = PetCmdCanvas(_local_1.view.getUI(ViewManager.MAIN_BATTLE_PET));
                _local_2.doCmd("btnAttack");
            };
        }

        [Bindable(event="propertyChange")]
        public function get vbox1():VBox
        {
            return (this._112005436vbox1);
        }

        public function set aptEnergyEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._415587680aptEnergyEx;
            if (_local_2 !== _arg_1)
            {
                this._415587680aptEnergyEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptEnergyEx", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vbox2():VBox
        {
            return (this._112005437vbox2);
        }

        [Bindable(event="propertyChange")]
        public function get aptIntelligenceEx():RoundedLabel
        {
            return (this._1229780311aptIntelligenceEx);
        }

        private function reformBattlePetData():void
        {
            if (currentState == "normal")
            {
                return;
            };
            var _local_1:Array = new Array();
            var _local_2:int = 1;
            var _local_3:int = 2;
            var _local_4:int = 1;
            var _local_5:int = 1;
            var _local_6:int = 1;
            var _local_7:int = 15;
            while (_local_4 <= _local_7)
            {
                if (((ToolKit.isBigThan(petData[("skill" + _local_4)], 0)) && (_core.data.getGameData(GamePredef.TBL_SKILL, petData[("skill" + _local_4)]).kind == _local_2)))
                {
                    _local_1[("skill" + _local_6)] = petData[("skill" + _local_4)];
                    _local_6++;
                };
                _local_4++;
            };
            while (_local_5 <= _local_7)
            {
                if (((ToolKit.isBigThan(petData[("skill" + _local_5)], 0)) && (_core.data.getGameData(GamePredef.TBL_SKILL, petData[("skill" + _local_5)]).kind == _local_3)))
                {
                    _local_1[("skill" + _local_6)] = petData[("skill" + _local_5)];
                    _local_6++;
                };
                _local_5++;
            };
            while (_local_6 <= _local_7)
            {
                _local_1[("skill" + _local_6)] = -1;
                _local_6++;
            };
            petData = _local_1;
            _local_1 = null;
        }

        public function __skill5_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        private function _PetPanel_SetProperty14_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty14 = _local_1;
            _local_1.name = "x";
            _local_1.value = 0;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty14", _PetPanel_SetProperty14);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get vbox5():VBox
        {
            return (this._112005440vbox5);
        }

        private function _PetPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (pettitle);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty1.target = _arg_1;
            }, "_PetPanel_SetProperty1.target");
            result[0] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.PETPANEL_U[10]);
            }, function (_arg_1:*):void
            {
                _PetPanel_SetProperty1.value = _arg_1;
            }, "_PetPanel_SetProperty1.value");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pettitle);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty2.target = _arg_1;
            }, "_PetPanel_SetProperty2.target");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pettitle);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty3.target = _arg_1;
            }, "_PetPanel_SetProperty3.target");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pettitle);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty5.target = _arg_1;
            }, "_PetPanel_SetProperty5.target");
            result[4] = binding;
            binding = new Binding(this, function ():*
            {
                return (Language.PETPANEL_U[17]);
            }, function (_arg_1:*):void
            {
                _PetPanel_SetProperty5.value = _arg_1;
            }, "_PetPanel_SetProperty5.value");
            result[5] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (simplecanvas2);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild1.target = _arg_1;
            }, "_PetPanel_RemoveChild1.target");
            result[6] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (simplecanvas1);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild2.target = _arg_1;
            }, "_PetPanel_RemoveChild2.target");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (canvas2);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty8.target = _arg_1;
            }, "_PetPanel_SetProperty8.target");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (canvas2);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty9.target = _arg_1;
            }, "_PetPanel_SetProperty9.target");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (canvas2);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty10.target = _arg_1;
            }, "_PetPanel_SetProperty10.target");
            result[10] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (petFuncBtn1);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild3.target = _arg_1;
            }, "_PetPanel_RemoveChild3.target");
            result[11] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (petFuncBtn2);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild4.target = _arg_1;
            }, "_PetPanel_RemoveChild4.target");
            result[12] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (petFuncBtn3);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild5.target = _arg_1;
            }, "_PetPanel_RemoveChild5.target");
            result[13] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (petFuncBtn4);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild6.target = _arg_1;
            }, "_PetPanel_RemoveChild6.target");
            result[14] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (canvas3);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild7.target = _arg_1;
            }, "_PetPanel_RemoveChild7.target");
            result[15] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (vbox1);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild8.target = _arg_1;
            }, "_PetPanel_RemoveChild8.target");
            result[16] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (vbox2);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild9.target = _arg_1;
            }, "_PetPanel_RemoveChild9.target");
            result[17] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (vbox3);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild10.target = _arg_1;
            }, "_PetPanel_RemoveChild10.target");
            result[18] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (vbox4);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild11.target = _arg_1;
            }, "_PetPanel_RemoveChild11.target");
            result[19] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (vbox5);
            }, function (_arg_1:DisplayObject):void
            {
                _PetPanel_RemoveChild12.target = _arg_1;
            }, "_PetPanel_RemoveChild12.target");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (simplecanvas3);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty11.target = _arg_1;
            }, "_PetPanel_SetProperty11.target");
            result[21] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill1);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty12.target = _arg_1;
            }, "_PetPanel_SetProperty12.target");
            result[22] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill2);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty13.target = _arg_1;
            }, "_PetPanel_SetProperty13.target");
            result[23] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill3);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty14.target = _arg_1;
            }, "_PetPanel_SetProperty14.target");
            result[24] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill4);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty15.target = _arg_1;
            }, "_PetPanel_SetProperty15.target");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill5);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty16.target = _arg_1;
            }, "_PetPanel_SetProperty16.target");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill1);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty17.target = _arg_1;
            }, "_PetPanel_SetProperty17.target");
            result[27] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill2);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty18.target = _arg_1;
            }, "_PetPanel_SetProperty18.target");
            result[28] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill3);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty19.target = _arg_1;
            }, "_PetPanel_SetProperty19.target");
            result[29] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill4);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty20.target = _arg_1;
            }, "_PetPanel_SetProperty20.target");
            result[30] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skill5);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty21.target = _arg_1;
            }, "_PetPanel_SetProperty21.target");
            result[31] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pettitle);
            }, function (_arg_1:Object):void
            {
                _PetPanel_SetProperty22.target = _arg_1;
            }, "_PetPanel_SetProperty22.target");
            result[32] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PET_PENTAGON);
            }, function (_arg_1:Object):void
            {
                _PetPanel_Image1.source = _arg_1;
            }, "_PetPanel_Image1.source");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor0.text = _arg_1;
            }, "factor0.text");
            result[34] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor0.filters = _arg_1;
            }, "factor0.filters");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor1.text = _arg_1;
            }, "factor1.text");
            result[36] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor1.filters = _arg_1;
            }, "factor1.filters");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor2.text = _arg_1;
            }, "factor2.text");
            result[38] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor2.filters = _arg_1;
            }, "factor2.filters");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor3.text = _arg_1;
            }, "factor3.text");
            result[40] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor3.filters = _arg_1;
            }, "factor3.filters");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor4.text = _arg_1;
            }, "factor4.text");
            result[42] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor4.filters = _arg_1;
            }, "factor4.filters");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                simplecanvas2.label = _arg_1;
            }, "simplecanvas2.label");
            result[44] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (star.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _PetPanel_Image2[_arg_2[0]].source = _arg_1;
            }, "_PetPanel_Image2.source");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                growRate.toolTip = _arg_1;
            }, "growRate.toolTip");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                growRateAdd.toolTip = _arg_1;
            }, "growRateAdd.toolTip");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStrength) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStrength.toolTip = _arg_1;
            }, "aptStrength.toolTip");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((((((Language.PETPANEL_S[14] + ":") + petData.aptAgility) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptAgility.toolTip = _arg_1;
            }, "aptAgility.toolTip");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStamina) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStamina.toolTip = _arg_1;
            }, "aptStamina.toolTip");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((((((Language.PETPANEL_S[14] + ":") + petData.aptIntelligence) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptIntelligence.toolTip = _arg_1;
            }, "aptIntelligence.toolTip");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((((((Language.PETPANEL_S[14] + ":") + petData.aptEnergy) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptEnergy.toolTip = _arg_1;
            }, "aptEnergy.toolTip");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStrengthEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStrengthEx.toolTip = _arg_1;
            }, "aptStrengthEx.toolTip");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[16] + ":") + ((petData.aptAgilityEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptAgilityEx.toolTip = _arg_1;
            }, "aptAgilityEx.toolTip");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStaminaEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStaminaEx.toolTip = _arg_1;
            }, "aptStaminaEx.toolTip");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[16] + ":") + ((petData.aptIntelligenceEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptIntelligenceEx.toolTip = _arg_1;
            }, "aptIntelligenceEx.toolTip");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[16] + ":") + ((petData.aptEnergyEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptEnergyEx.toolTip = _arg_1;
            }, "aptEnergyEx.toolTip");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptStrength) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStrengthFinal.toolTip = _arg_1;
            }, "aptStrengthFinal.toolTip");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptAgility) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptAgilityFinal.toolTip = _arg_1;
            }, "aptAgilityFinal.toolTip");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptStamina) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStaminaFinal.toolTip = _arg_1;
            }, "aptStaminaFinal.toolTip");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptIntelligence) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptIntelligenceFinal.toolTip = _arg_1;
            }, "aptIntelligenceFinal.toolTip");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptEnergy) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptEnergyFinal.toolTip = _arg_1;
            }, "aptEnergyFinal.toolTip");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton1.label = _arg_1;
            }, "basichortxtbutton1.label");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[511];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton1.toolTip = _arg_1;
            }, "basichortxtbutton1.toolTip");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton2.label = _arg_1;
            }, "basichortxtbutton2.label");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[0x0200];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton2.toolTip = _arg_1;
            }, "basichortxtbutton2.toolTip");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton3.label = _arg_1;
            }, "basichortxtbutton3.label");
            result[67] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[513];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton3.toolTip = _arg_1;
            }, "basichortxtbutton3.toolTip");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton4.label = _arg_1;
            }, "basichortxtbutton4.label");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[0x0202];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton4.toolTip = _arg_1;
            }, "basichortxtbutton4.toolTip");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton5.label = _arg_1;
            }, "basichortxtbutton5.label");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[515];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton5.toolTip = _arg_1;
            }, "basichortxtbutton5.toolTip");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton6.label = _arg_1;
            }, "basichortxtbutton6.label");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[516];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton6.toolTip = _arg_1;
            }, "basichortxtbutton6.toolTip");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[76] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[77] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                simplecanvas3.label = _arg_1;
            }, "simplecanvas3.label");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn1.label = _arg_1;
            }, "delBtn1.label");
            result[79] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn1.enabled = _arg_1;
            }, "delBtn1.enabled");
            result[80] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn1.label = _arg_1;
            }, "upBtn1.label");
            result[81] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn1.enabled = _arg_1;
            }, "upBtn1.enabled");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn1.label = _arg_1;
            }, "openBtn1.label");
            result[83] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn1.enabled = _arg_1;
            }, "openBtn1.enabled");
            result[84] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn2.label = _arg_1;
            }, "delBtn2.label");
            result[85] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn2.enabled = _arg_1;
            }, "delBtn2.enabled");
            result[86] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn2.label = _arg_1;
            }, "upBtn2.label");
            result[87] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn2.enabled = _arg_1;
            }, "upBtn2.enabled");
            result[88] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn2.label = _arg_1;
            }, "openBtn2.label");
            result[89] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn2.enabled = _arg_1;
            }, "openBtn2.enabled");
            result[90] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn3.label = _arg_1;
            }, "delBtn3.label");
            result[91] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn3.enabled = _arg_1;
            }, "delBtn3.enabled");
            result[92] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn3.label = _arg_1;
            }, "upBtn3.label");
            result[93] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn3.enabled = _arg_1;
            }, "upBtn3.enabled");
            result[94] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn3.label = _arg_1;
            }, "openBtn3.label");
            result[95] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn3.enabled = _arg_1;
            }, "openBtn3.enabled");
            result[96] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn4.label = _arg_1;
            }, "delBtn4.label");
            result[97] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn4.enabled = _arg_1;
            }, "delBtn4.enabled");
            result[98] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn4.label = _arg_1;
            }, "upBtn4.label");
            result[99] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn4.enabled = _arg_1;
            }, "upBtn4.enabled");
            result[100] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn4.label = _arg_1;
            }, "openBtn4.label");
            result[101] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn4.enabled = _arg_1;
            }, "openBtn4.enabled");
            result[102] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn5.label = _arg_1;
            }, "delBtn5.label");
            result[103] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn5.enabled = _arg_1;
            }, "delBtn5.enabled");
            result[104] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn5.label = _arg_1;
            }, "upBtn5.label");
            result[105] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn5.enabled = _arg_1;
            }, "upBtn5.enabled");
            result[106] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn5.label = _arg_1;
            }, "openBtn5.label");
            result[107] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn5.enabled = _arg_1;
            }, "openBtn5.enabled");
            result[108] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn1.label = _arg_1;
            }, "petFuncBtn1.label");
            result[109] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn1.enabled = _arg_1;
            }, "petFuncBtn1.enabled");
            result[110] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn2.label = _arg_1;
            }, "petFuncBtn2.label");
            result[111] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn2.enabled = _arg_1;
            }, "petFuncBtn2.enabled");
            result[112] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn3.label = _arg_1;
            }, "petFuncBtn3.label");
            result[113] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn3.enabled = _arg_1;
            }, "petFuncBtn3.enabled");
            result[114] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn4.label = _arg_1;
            }, "petFuncBtn4.label");
            result[115] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn4.enabled = _arg_1;
            }, "petFuncBtn4.enabled");
            result[116] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn5.label = _arg_1;
            }, "petFuncBtn5.label");
            result[117] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn5.enabled = _arg_1;
            }, "petFuncBtn5.enabled");
            result[118] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn6.label = _arg_1;
            }, "petFuncBtn6.label");
            result[119] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn6.enabled = _arg_1;
            }, "petFuncBtn6.enabled");
            result[120] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = GamePredef.EQUIP_POSITION[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu1.text = _arg_1;
            }, "petEqu1.text");
            result[121] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu1.type = _arg_1;
            }, "petEqu1.type");
            result[122] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu1.acceptType = _arg_1;
            }, "petEqu1.acceptType");
            result[123] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([50]);
            }, function (_arg_1:Array):void
            {
                petEqu1.acceptPos = _arg_1;
            }, "petEqu1.acceptPos");
            result[124] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = GamePredef.EQUIP_POSITION[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu2.text = _arg_1;
            }, "petEqu2.text");
            result[125] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu2.type = _arg_1;
            }, "petEqu2.type");
            result[126] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu2.acceptType = _arg_1;
            }, "petEqu2.acceptType");
            result[127] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([51]);
            }, function (_arg_1:Array):void
            {
                petEqu2.acceptPos = _arg_1;
            }, "petEqu2.acceptPos");
            result[128] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = GamePredef.EQUIP_POSITION[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu3.text = _arg_1;
            }, "petEqu3.text");
            result[129] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu3.type = _arg_1;
            }, "petEqu3.type");
            result[130] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu3.acceptType = _arg_1;
            }, "petEqu3.acceptType");
            result[131] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([52]);
            }, function (_arg_1:Array):void
            {
                petEqu3.acceptPos = _arg_1;
            }, "petEqu3.acceptPos");
            result[132] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = GamePredef.EQUIP_POSITION[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu4.text = _arg_1;
            }, "petEqu4.text");
            result[133] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu4.type = _arg_1;
            }, "petEqu4.type");
            result[134] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu4.acceptType = _arg_1;
            }, "petEqu4.acceptType");
            result[135] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([53]);
            }, function (_arg_1:Array):void
            {
                petEqu4.acceptPos = _arg_1;
            }, "petEqu4.acceptPos");
            result[136] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = GamePredef.EQUIP_POSITION[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu5.text = _arg_1;
            }, "petEqu5.text");
            result[137] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu5.type = _arg_1;
            }, "petEqu5.type");
            result[138] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu5.acceptType = _arg_1;
            }, "petEqu5.acceptType");
            result[139] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([54]);
            }, function (_arg_1:Array):void
            {
                petEqu5.acceptPos = _arg_1;
            }, "petEqu5.acceptPos");
            result[140] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = GamePredef.EQUIP_POSITION[55];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu6.text = _arg_1;
            }, "petEqu6.text");
            result[141] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu6.type = _arg_1;
            }, "petEqu6.type");
            result[142] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu6.acceptType = _arg_1;
            }, "petEqu6.acceptType");
            result[143] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([55]);
            }, function (_arg_1:Array):void
            {
                petEqu6.acceptPos = _arg_1;
            }, "petEqu6.acceptPos");
            result[144] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = GamePredef.EQUIP_POSITION[56];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu7.text = _arg_1;
            }, "petEqu7.text");
            result[145] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu7.type = _arg_1;
            }, "petEqu7.type");
            result[146] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu7.acceptType = _arg_1;
            }, "petEqu7.acceptType");
            result[147] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([56]);
            }, function (_arg_1:Array):void
            {
                petEqu7.acceptPos = _arg_1;
            }, "petEqu7.acceptPos");
            result[148] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = GamePredef.EQUIP_POSITION[57];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu8.text = _arg_1;
            }, "petEqu8.text");
            result[149] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu8.type = _arg_1;
            }, "petEqu8.type");
            result[150] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu8.acceptType = _arg_1;
            }, "petEqu8.acceptType");
            result[151] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([57]);
            }, function (_arg_1:Array):void
            {
                petEqu8.acceptPos = _arg_1;
            }, "petEqu8.acceptPos");
            result[152] = binding;
            return (result);
        }

        public function __upBtn3_click(_arg_1:MouseEvent):void
        {
            upSkill(3);
        }

        [Bindable(event="propertyChange")]
        public function get aptIntelligence():BoxLabel
        {
            return (this._702954884aptIntelligence);
        }

        public function getSpecPetEquSuitNum(_arg_1:int):Object
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:Number;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            if (petData != null)
            {
                _local_2 = null;
                _local_3 = (GamePredef.PETEQU_NUM - 1);
                while (_local_3 <= GamePredef.PETEQU_NUM)
                {
                    _local_4 = Number(petData[("equ" + _local_3)]);
                    if (_local_4 > 0)
                    {
                        _local_5 = _core.data.getSlot({"id":_local_4});
                        _local_6 = _core.data.getData(_local_5.type, _local_5.itemId);
                        if (_local_6)
                        {
                            _local_7 = _core.getTemplateData(GamePredef.TBL_EQUIPT_TEMPLATE, _local_6.tid);
                            if (_local_7.suitId == _arg_1)
                            {
                                if (_local_6.color >= 2)
                                {
                                    if (_local_2 == null)
                                    {
                                        _local_2 = {};
                                    };
                                    if (_local_2[_local_6.color] == null)
                                    {
                                        _local_2[_local_6.color] = 0;
                                    };
                                    _local_2[_local_6.color] = (_local_2[_local_6.color] + 1);
                                };
                            };
                        };
                    };
                    _local_3++;
                };
                return (_local_2);
            };
            return (null);
        }

        [Bindable(event="propertyChange")]
        public function get aptStrength():BoxLabel
        {
            return (this._395626106aptStrength);
        }

        public function set factor3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882812factor3;
            if (_local_2 !== _arg_1)
            {
                this._1091882812factor3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor3", _local_2, _arg_1));
            };
        }

        public function set factor4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882811factor4;
            if (_local_2 !== _arg_1)
            {
                this._1091882811factor4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor4", _local_2, _arg_1));
            };
        }

        public function set factor1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882814factor1;
            if (_local_2 !== _arg_1)
            {
                this._1091882814factor1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor1", _local_2, _arg_1));
            };
        }

        public function set factor2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882813factor2;
            if (_local_2 !== _arg_1)
            {
                this._1091882813factor2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor2", _local_2, _arg_1));
            };
        }

        private function _PetPanel_RemoveChild3_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild3 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild3", _PetPanel_RemoveChild3);
            return (_local_1);
        }

        public function set factor0(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882815factor0;
            if (_local_2 !== _arg_1)
            {
                this._1091882815factor0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor0", _local_2, _arg_1));
            };
        }

        public function set openBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171262openBtn4;
            if (_local_2 !== _arg_1)
            {
                this._505171262openBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn4", _local_2, _arg_1));
            };
        }

        public function set openBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171264openBtn2;
            if (_local_2 !== _arg_1)
            {
                this._505171264openBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn2", _local_2, _arg_1));
            };
        }

        public function set openBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171263openBtn3;
            if (_local_2 !== _arg_1)
            {
                this._505171263openBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn3", _local_2, _arg_1));
            };
        }

        public function set openBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171261openBtn5;
            if (_local_2 !== _arg_1)
            {
                this._505171261openBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn5", _local_2, _arg_1));
            };
        }

        public function set openBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171265openBtn1;
            if (_local_2 !== _arg_1)
            {
                this._505171265openBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn1", _local_2, _arg_1));
            };
        }

        public function __petFuncBtn3_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(2);
        }

        private function _PetPanel_SetProperty13_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty13 = _local_1;
            _local_1.name = "x";
            _local_1.value = 0;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty13", _PetPanel_SetProperty13);
            return (_local_1);
        }

        public function __openBtn4_click(_arg_1:MouseEvent):void
        {
            openSkill(4);
        }

        public function __delBtn5_click(_arg_1:MouseEvent):void
        {
            delSkill(5);
        }

        public function set aptStrengthEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._2055403737aptStrengthEx;
            if (_local_2 !== _arg_1)
            {
                this._2055403737aptStrengthEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStrengthEx", _local_2, _arg_1));
            };
        }

        private function _PetPanel_RemoveChild2_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild2 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild2", _PetPanel_RemoveChild2);
            return (_local_1);
        }

        private function _PetPanel_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "skill";
            _local_1.overrides = [_PetPanel_SetProperty5_i(), _PetPanel_RemoveChild1_i(), _PetPanel_RemoveChild2_i(), _PetPanel_SetProperty6_c(), _PetPanel_SetProperty7_c(), _PetPanel_SetProperty8_i(), _PetPanel_SetProperty9_i(), _PetPanel_SetProperty10_i(), _PetPanel_RemoveChild3_i(), _PetPanel_RemoveChild4_i(), _PetPanel_RemoveChild5_i(), _PetPanel_RemoveChild6_i(), _PetPanel_RemoveChild7_i(), _PetPanel_RemoveChild8_i(), _PetPanel_RemoveChild9_i(), _PetPanel_RemoveChild10_i(), _PetPanel_RemoveChild11_i(), _PetPanel_RemoveChild12_i(), _PetPanel_SetProperty11_i(), _PetPanel_SetProperty12_i(), _PetPanel_SetProperty13_i(), _PetPanel_SetProperty14_i(), _PetPanel_SetProperty15_i(), _PetPanel_SetProperty16_i(), _PetPanel_SetProperty17_i(), _PetPanel_SetProperty18_i(), _PetPanel_SetProperty19_i(), _PetPanel_SetProperty20_i(), _PetPanel_SetProperty21_i(), _PetPanel_SetProperty22_i()];
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get vbox4():VBox
        {
            return (this._112005439vbox4);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu1():ItemSlot
        {
            return (this._677962297petEqu1);
        }

        public function set aptStaminaEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1357563171aptStaminaEx;
            if (_local_2 !== _arg_1)
            {
                this._1357563171aptStaminaEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStaminaEx", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEqu4():ItemSlot
        {
            return (this._677962294petEqu4);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu5():ItemSlot
        {
            return (this._677962293petEqu5);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu7():ItemSlot
        {
            return (this._677962291petEqu7);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu8():ItemSlot
        {
            return (this._677962290petEqu8);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu2():ItemSlot
        {
            return (this._677962296petEqu2);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu3():ItemSlot
        {
            return (this._677962295petEqu3);
        }

        [Bindable(event="propertyChange")]
        public function get _PetPanel_HBox1():HBox
        {
            return (this._1137294803_PetPanel_HBox1);
        }

        [Bindable(event="propertyChange")]
        public function get starHbox():HBox
        {
            return (this._1315489237starHbox);
        }

        public function __skill2_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get canvas2():Canvas
        {
            return (this._550778330canvas2);
        }

        [Bindable(event="propertyChange")]
        public function get canvas3():Canvas
        {
            return (this._550778331canvas3);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu6():ItemSlot
        {
            return (this._677962292petEqu6);
        }

        private function _PetPanel_SetProperty12_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty12 = _local_1;
            _local_1.name = "x";
            _local_1.value = 0;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty12", _PetPanel_SetProperty12);
            return (_local_1);
        }

        public function set aptAgilityFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._237239562aptAgilityFinal;
            if (_local_2 !== _arg_1)
            {
                this._237239562aptAgilityFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptAgilityFinal", _local_2, _arg_1));
            };
        }

        private function _PetPanel_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetPanel_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_PetPanel_RemoveChild1", _PetPanel_RemoveChild1);
            return (_local_1);
        }

        private function _PetPanel_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "normal";
            _local_1.overrides = [_PetPanel_SetProperty1_i(), _PetPanel_SetProperty2_i(), _PetPanel_SetProperty3_i(), _PetPanel_SetProperty4_c()];
            return (_local_1);
        }

        public function onPetEquipOff(_arg_1:Number, _arg_2:int, _arg_3:Number):void
        {
            var _local_4:*;
            var _local_5:ItemSlot;
            _local_4 = _core.data.getSlot({"id":_arg_3});
            if ((((_local_4) && (_local_4.type == GamePredef.TBL_EQUIPT_INSTANCE)) && (_local_4.stackNum == 0)))
            {
                _local_4.stackNum = 1;
                this[("petEqu" + _arg_2)].giid = -1;
                this[("petEqu" + _arg_2)].restore();
                _local_5 = _core.view.getUI(ViewManager.PANEL_BAG).getBagSlot(_local_4.sid);
                if (_local_5)
                {
                    _local_5.stackNum = 1;
                    _local_5.enabled = true;
                    _local_5.acceptable = true;
                };
            };
        }

        public function __skill4_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        public function set aptStaminaFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1751782644aptStaminaFinal;
            if (_local_2 !== _arg_1)
            {
                this._1751782644aptStaminaFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStaminaFinal", _local_2, _arg_1));
            };
        }

        public function set aptEnergy(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._348170509aptEnergy;
            if (_local_2 !== _arg_1)
            {
                this._348170509aptEnergy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptEnergy", _local_2, _arg_1));
            };
        }

        private function _PetPanel_SetProperty11_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty11 = _local_1;
            _local_1.name = "width";
            _local_1.value = 187;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty11", _PetPanel_SetProperty11);
            return (_local_1);
        }

        private function openSkill(index:int):void
        {
            var num:int;
            var func:Function;
            index = ((selectedTabIndex * 5) + index);
            var str:String = "";
            if (((petData) && (ToolKit.isEqual(petData[("skill" + index)], -1))))
            {
                if (ToolKit.isBigThan(index, 5))
                {
                    num = (GamePredef.GOLD_PET_SKILLOPEN[index] * GamePredef.GOLD_PET_SKILLOPEN_Q[petDataTemp.qLevel]);
                    if (((_core.player.enoughMoneyAuto(2, num)) || (_core.player.enoughMoneyAuto(2, num))))
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.petOpenSkill(petData.id, index);
                            };
                        };
                        str = Language.PETPANEL_S[8];
                        str = str.replace("{num}", num);
                        Alert.show(str, "", 3, this, func);
                    }
                    else
                    {
                        str = Language.PETPANEL_S[10];
                        str = str.replace("{num}", num);
                        _core.sysMsg(str);
                    };
                };
            };
        }

        public function __skill4_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function __upBtn2_click(_arg_1:MouseEvent):void
        {
            upSkill(2);
        }

        private function _PetPanel_SetProperty9_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty9 = _local_1;
            _local_1.name = "y";
            _local_1.value = 40;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty9", _PetPanel_SetProperty9);
            return (_local_1);
        }

        private function _PetPanel_SetProperty22_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty22 = _local_1;
            _local_1.name = "horizontalScrollPolicy";
            _local_1.value = "off";
            BindingManager.executeBindings(this, "_PetPanel_SetProperty22", _PetPanel_SetProperty22);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get aptIntelligenceFinal():RoundedLabel
        {
            return (this._314795602aptIntelligenceFinal);
        }

        [Bindable(event="propertyChange")]
        public function get star():Repeater
        {
            return (this._3540562star);
        }

        [Bindable(event="propertyChange")]
        public function get aptAgility():BoxLabel
        {
            return (this._1543550368aptAgility);
        }

        private function _PetPanel_SetProperty10_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty10 = _local_1;
            _local_1.name = "width";
            _local_1.value = 203;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty10", _PetPanel_SetProperty10);
            return (_local_1);
        }

        public function set aptAgilityEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1588184269aptAgilityEx;
            if (_local_2 !== _arg_1)
            {
                this._1588184269aptAgilityEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptAgilityEx", _local_2, _arg_1));
            };
        }

        public function __petFuncBtn2_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(1);
        }

        public function __openBtn3_click(_arg_1:MouseEvent):void
        {
            openSkill(3);
        }

        public function __delBtn4_click(_arg_1:MouseEvent):void
        {
            delSkill(4);
        }

        [Bindable(event="propertyChange")]
        public function get propertyPentagon():PentagonCanvas
        {
            return (this._805962357propertyPentagon);
        }

        public function getPetEquSuitNum(_arg_1:Number):Object
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:Number;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:int;
            if (petData != null)
            {
                _local_2 = {};
                _local_3 = 1;
                while (_local_3 <= (GamePredef.PETEQU_NUM - 2))
                {
                    _local_4 = Number(petData[("equ" + _local_3)]);
                    if (_local_4 > 0)
                    {
                        _local_5 = _core.data.getSlot({"id":_local_4});
                        _local_6 = _core.data.getData(_local_5.type, _local_5.itemId);
                        if (_local_6.color >= 2)
                        {
                            _local_7 = _core.getTemplateData(_local_5.type, _local_5.itemId);
                            if (_local_7)
                            {
                                _local_8 = _local_7.suitId;
                                if (_local_2[_local_8] == null)
                                {
                                    _local_2[_local_8] = [];
                                };
                                if (_local_2[_local_8][_local_6.color] == null)
                                {
                                    _local_2[_local_8][_local_6.color] = 0;
                                };
                                _local_2[_local_8][_local_6.color] = (_local_2[_local_8][_local_6.color] + 1);
                            };
                        };
                    };
                    _local_3++;
                };
                if (_local_2[_arg_1])
                {
                    return (_local_2[_arg_1]);
                };
            };
            return (null);
        }

        public function set vbox1(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005436vbox1;
            if (_local_2 !== _arg_1)
            {
                this._112005436vbox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox1", _local_2, _arg_1));
            };
        }

        public function set vbox2(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005437vbox2;
            if (_local_2 !== _arg_1)
            {
                this._112005437vbox2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox2", _local_2, _arg_1));
            };
        }

        private function _PetPanel_SetProperty21_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty21 = _local_1;
            _local_1.name = "width";
            _local_1.value = 170;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty21", _PetPanel_SetProperty21);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicMultiLineButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicMultiLineButton
        {
            return (this._1554141557tabBtn2);
        }

        private function _PetPanel_SetProperty8_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty8 = _local_1;
            _local_1.name = "x";
            _local_1.value = 15;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty8", _PetPanel_SetProperty8);
            return (_local_1);
        }

        public function set vbox5(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005440vbox5;
            if (_local_2 !== _arg_1)
            {
                this._112005440vbox5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upBtn1():BasicGlowButton
        {
            return (this._839841136upBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicMultiLineButton
        {
            return (this._1554141558tabBtn1);
        }

        private function clearView():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 5)
            {
                this[("skill" + _local_1)].clean();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get upBtn4():BasicGlowButton
        {
            return (this._839841133upBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get upBtn5():BasicGlowButton
        {
            return (this._839841132upBtn5);
        }

        public function set vbox4(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005439vbox4;
            if (_local_2 !== _arg_1)
            {
                this._112005439vbox4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upBtn3():BasicGlowButton
        {
            return (this._839841134upBtn3);
        }

        public function set vbox3(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005438vbox3;
            if (_local_2 !== _arg_1)
            {
                this._112005438vbox3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptEnergyEx():RoundedLabel
        {
            return (this._415587680aptEnergyEx);
        }

        [Bindable(event="propertyChange")]
        public function get upBtn2():BasicGlowButton
        {
            return (this._839841135upBtn2);
        }

        private function openPetFuncPanel(_arg_1:int):void
        {
            var _local_2:Number;
            var _local_3:Object;
            var _local_4:ItemSlot;
            if (_arg_1 == 7)
            {
                if (_core.player.level < 120)
                {
                    _core.sysMsg(Language.PET_HANDBOOK_PANEL_U[112]);
                    return;
                };
                _local_2 = petData.tid;
                _local_3 = _core.view.getUI(ViewManager.PANEL_PET_EVOLUTION);
                if (_local_3)
                {
                    _local_3.open(_local_2);
                };
            }
            else
            {
                _local_4 = new ItemSlot();
                _local_4.type = GamePredef.TBL_PET;
                _local_4.slotType = Slot.SLOT_PET;
                _local_4.giid = petData.id;
                _local_4.stackNum = 1;
                _local_4.slotData = petData;
                _core.view.getUI(ViewManager.PANEL_PETFUNC).putPet(_local_4, _arg_1);
            };
        }

        public function set aptIntelligenceEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1229780311aptIntelligenceEx;
            if (_local_2 !== _arg_1)
            {
                this._1229780311aptIntelligenceEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptIntelligenceEx", _local_2, _arg_1));
            };
        }

        private function _PetPanel_SetProperty7_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "height";
            _local_1.value = 270;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get openBtn2():BasicGlowButton
        {
            return (this._505171264openBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get openBtn5():BasicGlowButton
        {
            return (this._505171261openBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get openBtn1():BasicGlowButton
        {
            return (this._505171265openBtn1);
        }

        private function drawSkillSlots(_arg_1:int):*
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_2:int = 1;
            while (_local_2 <= 5)
            {
                this[("skill" + _local_2)].clean();
                _local_3 = ((_arg_1 * 5) + _local_2);
                if (ToolKit.isBigThan(petData[("skill" + _local_3)], 0))
                {
                    _local_4 = _core.data.getGameData(GamePredef.TBL_SKILL, petData[("skill" + _local_3)]);
                    this[("skill" + _local_2)].giid = petData[("skill" + _local_3)];
                    this[("skill" + _local_2)].enabled = (((currentState == "skill") && (_local_4.kind == 2)) ? false : true);
                    this[("delBtn" + _local_2)].visible = true;
                    this[("upBtn" + _local_2)].visible = true;
                    if (ToolKit.isBigOrEqual(_local_4.level, 3))
                    {
                        this[("upBtn" + _local_2)].enabled = false;
                    }
                    else
                    {
                        this[("upBtn" + _local_2)].enabled = true;
                    };
                    this[("openBtn" + _local_2)].visible = false;
                    this[("delBtn" + _local_2)].includeInLayout = true;
                    this[("upBtn" + _local_2)].includeInLayout = true;
                    this[("openBtn" + _local_2)].includeInLayout = false;
                }
                else
                {
                    if (ToolKit.isEqual(petData[("skill" + _local_3)], 0))
                    {
                        this[("skill" + _local_2)].enabled = true;
                        this[("delBtn" + _local_2)].visible = false;
                        this[("upBtn" + _local_2)].visible = false;
                        this[("openBtn" + _local_2)].visible = false;
                        this[("delBtn" + _local_2)].includeInLayout = false;
                        this[("upBtn" + _local_2)].includeInLayout = false;
                        this[("openBtn" + _local_2)].includeInLayout = false;
                    }
                    else
                    {
                        if (ToolKit.isEqual(petData[("skill" + _local_3)], -1))
                        {
                            if (((_local_3 >= 6) || (currentState == "skill")))
                            {
                                this[("skill" + _local_2)].enabled = false;
                                this[("openBtn" + _local_2)].visible = true;
                                this[("openBtn" + _local_2)].includeInLayout = true;
                            }
                            else
                            {
                                this[("skill" + _local_2)].enabled = true;
                                this[("openBtn" + _local_2)].visible = false;
                                this[("openBtn" + _local_2)].includeInLayout = false;
                            };
                            this[("delBtn" + _local_2)].visible = false;
                            this[("upBtn" + _local_2)].visible = false;
                            this[("delBtn" + _local_2)].includeInLayout = false;
                            this[("upBtn" + _local_2)].includeInLayout = false;
                        };
                    };
                };
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get openBtn4():BasicGlowButton
        {
            return (this._505171262openBtn4);
        }

        private function _PetPanel_SetProperty20_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty20 = _local_1;
            _local_1.name = "width";
            _local_1.value = 170;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty20", _PetPanel_SetProperty20);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get openBtn3():BasicGlowButton
        {
            return (this._505171263openBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get aptStaminaEx():RoundedLabel
        {
            return (this._1357563171aptStaminaEx);
        }

        public function __skill3_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(2);
        }

        [Bindable(event="propertyChange")]
        public function get aptAgilityFinal():RoundedLabel
        {
            return (this._237239562aptAgilityFinal);
        }

        public function __upBtn1_click(_arg_1:MouseEvent):void
        {
            upSkill(1);
        }

        private function _PetPanel_SetProperty6_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "width";
            _local_1.value = 235;
            return (_local_1);
        }

        public function __canvas3_creationComplete(_arg_1:FlexEvent):void
        {
            initPetEquListen();
        }

        public function set aptIntelligence(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._702954884aptIntelligence;
            if (_local_2 !== _arg_1)
            {
                this._702954884aptIntelligence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptIntelligence", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptStaminaFinal():RoundedLabel
        {
            return (this._1751782644aptStaminaFinal);
        }

        private function updateView():void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:*;
            var _local_7:Number;
            var _local_1:* = "";
            if (petData)
            {
                clearView();
                petDataTemp = petData.creatureData;
                if (currentState != "skill")
                {
                    propertyPentagon.setName = ["　", "　", "　", "　", "　"];
                    propertyPentagon.showProperty(10000, [(Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)), (Number(petData.aptAgility) + ((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)), (Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)), (Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)), (Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0))], [Number(Math.round((((Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)) + Number(((petData.aptStrengthEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))), Number(Math.round((((Number(petData.aptAgility) + ((petData.property.aptAgilityhEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)) + Number(((petData.aptAgilityEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))), Number(Math.round((((Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)) + Number(((petData.aptStaminaEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))), Number(Math.round((((Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)) + Number(((petData.aptIntelligenceEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))), Number(Math.round((((Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)) + Number(((petData.aptEnergyEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd)))))]);
                    aptStrength.text = String((Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)));
                    aptAgility.text = String((Number(petData.aptAgility) + ((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)));
                    aptStamina.text = String((Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)));
                    aptIntelligence.text = String((Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)));
                    aptEnergy.text = String((Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)));
                    aptStrengthEx.text = ("+" + ((petData.aptStrengthEx) || (0)));
                    aptAgilityEx.text = ("+" + ((petData.aptAgilityEx) || (0)));
                    aptStaminaEx.text = ("+" + ((petData.aptStaminaEx) || (0)));
                    aptIntelligenceEx.text = ("+" + ((petData.aptIntelligenceEx) || (0)));
                    aptEnergyEx.text = ("+" + ((petData.aptEnergyEx) || (0)));
                    growRate.text = (Math.round((petData.property.growRate * 100)) / 100).toString();
                    aptStrengthFinal.text = ("=> " + String(Math.round((((Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)) + Number(((petData.aptStrengthEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    aptAgilityFinal.text = ("=> " + String(Math.round((((Number(petData.aptAgility) + ((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)) + Number(((petData.aptAgilityEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    aptStaminaFinal.text = ("=> " + String(Math.round((((Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)) + Number(((petData.aptStaminaEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    aptIntelligenceFinal.text = ("=> " + String(Math.round((((Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)) + Number(((petData.aptIntelligenceEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    aptEnergyFinal.text = ("=> " + String(Math.round((((Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)) + Number(((petData.aptEnergyEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    growRateAdd.text = ("+  " + (Math.round((petData.property.growRateAdd * 100)) / 100).toString());
                    aptStrength.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStrength) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)));
                    aptAgility.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptAgility) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)));
                    aptStamina.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStamina) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)));
                    aptIntelligence.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptIntelligence) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)));
                    aptEnergy.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptEnergy) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)));
                    aptStrengthEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStrengthEx) || (0)));
                    aptAgilityEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptAgilityEx) || (0)));
                    aptStaminaEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStaminaEx) || (0)));
                    aptIntelligenceEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptIntelligenceEx) || (0)));
                    aptEnergyEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptEnergyEx) || (0)));
                    aptStrengthFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)) + Number(((petData.aptStrengthEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    aptAgilityFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptAgility) + ((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)) + Number(((petData.aptAgilityEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    aptStaminaFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)) + Number(((petData.aptStaminaEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    aptIntelligenceFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)) + Number(((petData.aptIntelligenceEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    aptEnergyFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)) + Number(((petData.aptEnergyEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                    _local_2 = [];
                    _local_3 = 0;
                    while (_local_3 <= 11)
                    {
                        _local_2[_local_3] = ResManager.ICON_PET_STAR_DARK;
                        if (ToolKit.isSmallOrEqual((_local_3 + 1), petData.upgradeNum))
                        {
                            _local_2[_local_3] = ResManager.ICON_PET_STAR_LIGHT;
                        };
                        _local_3++;
                    };
                    star.dataProvider = _local_2;
                    _local_1 = Language.PETPANEL_S[0];
                    _local_1 = _local_1.replace("{upgradeNum}", petData.upgradeNum);
                    starHbox.toolTip = _local_1;
                    _local_4 = 1;
                    while (_local_4 <= GamePredef.PETEQU_NUM)
                    {
                        if (ToolKit.isBigThan(petData[("equ" + _local_4)], 0))
                        {
                            _local_5 = petData[("equ" + _local_4)];
                            _local_6 = _core.data.getSlot({"id":_local_5});
                            _local_7 = petData[("equ" + _local_4)];
                            if (_local_7 < 0)
                            {
                                this[("petEqu" + _local_4)].giid = -1;
                                this[("petEqu" + _local_4)].restore();
                            }
                            else
                            {
                                if (_local_6)
                                {
                                    this[("petEqu" + _local_4)].type = _local_6.type;
                                    this[("petEqu" + _local_4)].giid = _local_6.itemId;
                                };
                            };
                        }
                        else
                        {
                            this[("petEqu" + _local_4)].giid = -1;
                            this[("petEqu" + _local_4)].restore();
                        };
                        _local_4++;
                    };
                };
                drawSkillSlots(selectedTabIndex);
            };
        }

        private function doubleClickHandler(_arg_1:GameEvent):void
        {
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.giid < 0)
            {
                return;
            };
            _core.remote.petEquipOff(petData.id, _local_2.giid);
        }

        public function set growRate(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._507317139growRate;
            if (_local_2 !== _arg_1)
            {
                this._507317139growRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "growRate", _local_2, _arg_1));
            };
        }

        public function set aptStrengthFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._815424624aptStrengthFinal;
            if (_local_2 !== _arg_1)
            {
                this._815424624aptStrengthFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStrengthFinal", _local_2, _arg_1));
            };
        }

        public function __openBtn2_click(_arg_1:MouseEvent):void
        {
            openSkill(2);
        }

        public function __delBtn3_click(_arg_1:MouseEvent):void
        {
            delSkill(3);
        }

        public function __petFuncBtn1_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(0);
        }

        private function initPetEquListen():void
        {
            var _local_1:int = 1;
            while (_local_1 <= GamePredef.PETEQU_NUM)
            {
                this[("petEqu" + _local_1)].addEventListener(Slot.EVENT_SLOT_DCLICK, doubleClickHandler);
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptAgilityEx():RoundedLabel
        {
            return (this._1588184269aptAgilityEx);
        }

        private function _PetPanel_SetProperty5_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty5 = _local_1;
            _local_1.name = "text";
            BindingManager.executeBindings(this, "_PetPanel_SetProperty5", _PetPanel_SetProperty5);
            return (_local_1);
        }

        private function skillGetLevel(_arg_1:Number, _arg_2:int):Object
        {
            var _local_4:*;
            var _local_5:Object;
            var _local_3:Object = GameData.d[GamePredef.TBL_SKILL][_arg_1];
            if (_arg_2 > 0)
            {
                _local_4 = _core.data.gameDataIndex[GamePredef.TBL_SKILL][_local_3.codeName];
                for each (_local_5 in _local_4)
                {
                    if (Number(_local_5.level) == Number(_arg_2))
                    {
                        _local_3 = _local_5;
                        break;
                    };
                };
            };
            return (_local_3);
        }

        public function onPetEquipOn(_arg_1:Number, _arg_2:int, _arg_3:Number, _arg_4:Number):void
        {
            var _local_5:*;
            var _local_6:ItemSlot;
            var _local_7:*;
            if (_arg_3 > 0)
            {
                _local_5 = _core.data.getSlot({"id":_arg_3});
                if ((((_local_5) && (_local_5.type == GamePredef.TBL_EQUIPT_INSTANCE)) && (_local_5.stackNum == 0)))
                {
                    _local_5.stackNum = 1;
                    _local_6 = _core.view.getUI(ViewManager.PANEL_BAG).getBagSlot(_local_5.sid);
                    if (_local_6)
                    {
                        _local_6.stackNum = 1;
                        _local_6.enabled = true;
                        _local_6.acceptable = true;
                    };
                };
            };
            _local_5 = _core.data.getSlot({"id":_arg_4});
            if ((((_local_5) && (_local_5.type == GamePredef.TBL_EQUIPT_INSTANCE)) && (_local_5.stackNum == 1)))
            {
                this[("petEqu" + _arg_2)].type = _local_5.type;
                this[("petEqu" + _arg_2)].giid = _local_5.itemId;
                _core.data.updateSlot(_local_5);
                _local_7 = _core.view.getSlot(_local_5.sid);
                ((_local_7) && (_local_7.clean()));
            };
        }

        public function set aptStrength(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._395626106aptStrength;
            if (_local_2 !== _arg_1)
            {
                this._395626106aptStrength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStrength", _local_2, _arg_1));
            };
        }

        public function enableUI():void
        {
            this._btnEnabled = true;
        }

        public function __petFuncBtn6_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(7);
        }

        public function disableUI():void
        {
            this._btnEnabled = false;
        }

        private function _PetPanel_SetProperty4_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "height";
            _local_1.value = 450;
            return (_local_1);
        }

        public function set petEqu1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962297petEqu1;
            if (_local_2 !== _arg_1)
            {
                this._677962297petEqu1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptStrengthFinal():RoundedLabel
        {
            return (this._815424624aptStrengthFinal);
        }

        [Bindable(event="propertyChange")]
        public function get growRate():BoxLabel
        {
            return (this._507317139growRate);
        }

        public function set petEqu4(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962294petEqu4;
            if (_local_2 !== _arg_1)
            {
                this._677962294petEqu4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu4", _local_2, _arg_1));
            };
        }

        public function set petEqu7(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962291petEqu7;
            if (_local_2 !== _arg_1)
            {
                this._677962291petEqu7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu7", _local_2, _arg_1));
            };
        }

        public function set petEqu3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962295petEqu3;
            if (_local_2 !== _arg_1)
            {
                this._677962295petEqu3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu3", _local_2, _arg_1));
            };
        }

        public function set petEqu8(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962290petEqu8;
            if (_local_2 !== _arg_1)
            {
                this._677962290petEqu8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu8", _local_2, _arg_1));
            };
        }

        public function set petEqu5(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962293petEqu5;
            if (_local_2 !== _arg_1)
            {
                this._677962293petEqu5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu5", _local_2, _arg_1));
            };
        }

        public function set petEqu6(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962292petEqu6;
            if (_local_2 !== _arg_1)
            {
                this._677962292petEqu6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu6", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:PetPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetPanelWatcherSetupUtil");
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

        public function __skill2_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(1);
        }

        public function set canvas2(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._550778330canvas2;
            if (_local_2 !== _arg_1)
            {
                this._550778330canvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas2", _local_2, _arg_1));
            };
        }

        public function set _PetPanel_HBox1(_arg_1:HBox):void
        {
            var _local_2:Object = this._1137294803_PetPanel_HBox1;
            if (_local_2 !== _arg_1)
            {
                this._1137294803_PetPanel_HBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PetPanel_HBox1", _local_2, _arg_1));
            };
        }

        public function set canvas3(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._550778331canvas3;
            if (_local_2 !== _arg_1)
            {
                this._550778331canvas3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas3", _local_2, _arg_1));
            };
        }

        public function __skill1_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        public function set starHbox(_arg_1:HBox):void
        {
            var _local_2:Object;
            _local_2 = this._1315489237starHbox;
            if (_local_2 !== _arg_1)
            {
                this._1315489237starHbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starHbox", _local_2, _arg_1));
            };
        }

        public function set petEqu2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962296petEqu2;
            if (_local_2 !== _arg_1)
            {
                this._677962296petEqu2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu2", _local_2, _arg_1));
            };
        }

        private function _PetPanel_SetProperty3_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetPanel_SetProperty3 = _local_1;
            _local_1.name = "y";
            _local_1.value = 0;
            BindingManager.executeBindings(this, "_PetPanel_SetProperty3", _PetPanel_SetProperty3);
            return (_local_1);
        }

        public function set simplecanvas2(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1002706920simplecanvas2;
            if (_local_2 !== _arg_1)
            {
                this._1002706920simplecanvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simplecanvas2", _local_2, _arg_1));
            };
        }

        public function set simplecanvas3(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1002706921simplecanvas3;
            if (_local_2 !== _arg_1)
            {
                this._1002706921simplecanvas3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simplecanvas3", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton3(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878254basichortxtbutton3;
            if (_local_2 !== _arg_1)
            {
                this._861878254basichortxtbutton3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton3", _local_2, _arg_1));
            };
        }

        public function set simplecanvas1(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1002706919simplecanvas1;
            if (_local_2 !== _arg_1)
            {
                this._1002706919simplecanvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simplecanvas1", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton4(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878255basichortxtbutton4;
            if (_local_2 !== _arg_1)
            {
                this._861878255basichortxtbutton4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton4", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878252basichortxtbutton1;
            if (_local_2 !== _arg_1)
            {
                this._861878252basichortxtbutton1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton1", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton5(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878256basichortxtbutton5;
            if (_local_2 !== _arg_1)
            {
                this._861878256basichortxtbutton5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton5", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton2(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878253basichortxtbutton2;
            if (_local_2 !== _arg_1)
            {
                this._861878253basichortxtbutton2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton2", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton6(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878257basichortxtbutton6;
            if (_local_2 !== _arg_1)
            {
                this._861878257basichortxtbutton6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton6", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            updateView();
        }

        [Bindable(event="propertyChange")]
        public function get simplecanvas1():SimpleCanvas
        {
            return (this._1002706919simplecanvas1);
        }

        public function __openBtn1_click(_arg_1:MouseEvent):void
        {
            openSkill(1);
        }

        [Bindable(event="propertyChange")]
        public function get simplecanvas3():SimpleCanvas
        {
            return (this._1002706921simplecanvas3);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton2():BasicTxtButton
        {
            return (this._861878253basichortxtbutton2);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton3():BasicTxtButton
        {
            return (this._861878254basichortxtbutton3);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton4():BasicTxtButton
        {
            return (this._861878255basichortxtbutton4);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton5():BasicTxtButton
        {
            return (this._861878256basichortxtbutton5);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton6():BasicTxtButton
        {
            return (this._861878257basichortxtbutton6);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton1():BasicTxtButton
        {
            return (this._861878252basichortxtbutton1);
        }

        public function __delBtn2_click(_arg_1:MouseEvent):void
        {
            delSkill(2);
        }

        public function __skill3_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        public function __upBtn5_click(_arg_1:MouseEvent):void
        {
            upSkill(5);
        }


    }
}//package com.qeedoo.ui.view.compDragable

