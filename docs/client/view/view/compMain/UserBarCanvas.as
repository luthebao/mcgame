// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.UserBarCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.HBox;
    import mx.states.SetProperty;
    import com.qeedoo.game.system.Core;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import mx.events.DragEvent;
    import com.qeedoo.ui.view.compBattle.BattleStage;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.view.compGameStage.BattleCreatureView;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.logic.Battle;
    import mx.states.State;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.data.GameData;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.ui.event.GameEvent;
    import flash.utils.setTimeout;
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

    public class UserBarCanvas extends SimpleCanvas implements IMainUI, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _112113s20:ItemSlot;
        private var _112089s17:ItemSlot;
        private var _334507179barDown:Button;
        private var _334203872barNum3:RoundedLabel;
        private var _112084s12:ItemSlot;
        private var _112090s18:ItemSlot;
        private var _3619s6:ItemSlot;
        private var _112119s26:ItemSlot;
        private var _3622s9:ItemSlot;
        private var _3016320bar3:HBox;
        private var _112114s21:ItemSlot;
        public var _UserBarCanvas_SetProperty10:SetProperty;
        public var _UserBarCanvas_SetProperty11:SetProperty;
        public var _UserBarCanvas_SetProperty12:SetProperty;
        public var _UserBarCanvas_SetProperty13:SetProperty;
        public var _UserBarCanvas_SetProperty14:SetProperty;
        public var _UserBarCanvas_SetProperty15:SetProperty;
        public var _UserBarCanvas_SetProperty16:SetProperty;
        public var _UserBarCanvas_SetProperty17:SetProperty;
        public var _UserBarCanvas_SetProperty18:SetProperty;
        public var _UserBarCanvas_SetProperty19:SetProperty;
        private var _core:Core;
        private var _112120s27:ItemSlot;
        private var _3618s5:ItemSlot;
        public var _UserBarCanvas_SetProperty20:SetProperty;
        public var _UserBarCanvas_SetProperty21:SetProperty;
        public var _UserBarCanvas_SetProperty22:SetProperty;
        public var _UserBarCanvas_SetProperty23:SetProperty;
        public var _UserBarCanvas_SetProperty24:SetProperty;
        public var _UserBarCanvas_SetProperty25:SetProperty;
        public var _UserBarCanvas_SetProperty26:SetProperty;
        private var _quickSkillSize:int = 30;
        private var _97884btn:Button;
        private var _112091s19:ItemSlot;
        private var _112085s13:ItemSlot;
        private var _3621s8:ItemSlot;
        public var _UserBarCanvas_SetProperty1:SetProperty;
        public var _UserBarCanvas_SetProperty2:SetProperty;
        public var _UserBarCanvas_SetProperty3:SetProperty;
        public var _UserBarCanvas_SetProperty4:SetProperty;
        public var _UserBarCanvas_SetProperty5:SetProperty;
        public var _UserBarCanvas_SetProperty6:SetProperty;
        public var _UserBarCanvas_SetProperty7:SetProperty;
        public var _UserBarCanvas_SetProperty8:SetProperty;
        public var _UserBarCanvas_SetProperty9:SetProperty;
        private var _758632574numCanvas:Canvas;
        private var _3617s4:ItemSlot;
        private var _112115s22:ItemSlot;
        private var _112121s28:ItemSlot;
        private var _3620s7:ItemSlot;
        private var _1071360635btnContainer:Canvas;
        private var _112086s14:ItemSlot;
        private var _3616s3:ItemSlot;
        private var _334203873barNum2:RoundedLabel;
        private var _112144s30:ItemSlot;
        private var _112116s23:ItemSlot;
        private var _112122s29:ItemSlot;
        private var _93507086barUp:Button;
        private var _3615s2:ItemSlot;
        private var _3016319bar2:HBox;
        private var _112087s15:ItemSlot;
        private var _112082s10:ItemSlot;
        private var _3614s1:ItemSlot;
        private var _112117s24:ItemSlot;
        private var _1396254093barNum:RoundedLabel;
        private var _112088s16:ItemSlot;
        private var _96354abc:AutoBattleCanva;
        private var _3016318bar1:HBox;
        private var _112083s11:ItemSlot;
        private var _334203874barNum1:RoundedLabel;
        private var _112118s25:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":52,
                    "width":460,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"btnContainer",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":44,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "styleName":"CanvasSkillBar",
                                "width":373,
                                "x":23,
                                "y":5,
                                "clipContent":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"barNum1",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.right = "2";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"1",
                                            "y":14,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"barNum2",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.right = "2";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"2",
                                            "y":14,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"barNum3",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.right = "2";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"3",
                                            "y":14,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"bar1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":5,
                                            "width":350,
                                            "height":37,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s1",
                                                "events":{
                                                    "dragDrop":"__s1_dragDrop",
                                                    "mouseDown":"__s1_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s2",
                                                "events":{
                                                    "dragDrop":"__s2_dragDrop",
                                                    "mouseDown":"__s2_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s3",
                                                "events":{
                                                    "dragDrop":"__s3_dragDrop",
                                                    "mouseDown":"__s3_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s4",
                                                "events":{
                                                    "dragDrop":"__s4_dragDrop",
                                                    "mouseDown":"__s4_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s5",
                                                "events":{
                                                    "dragDrop":"__s5_dragDrop",
                                                    "mouseDown":"__s5_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s6",
                                                "events":{
                                                    "dragDrop":"__s6_dragDrop",
                                                    "mouseDown":"__s6_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s7",
                                                "events":{
                                                    "dragDrop":"__s7_dragDrop",
                                                    "mouseDown":"__s7_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s8",
                                                "events":{
                                                    "dragDrop":"__s8_dragDrop",
                                                    "mouseDown":"__s8_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s9",
                                                "events":{
                                                    "dragDrop":"__s9_dragDrop",
                                                    "mouseDown":"__s9_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s10",
                                                "events":{
                                                    "dragDrop":"__s10_dragDrop",
                                                    "mouseDown":"__s10_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"bar2",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":5,
                                            "visible":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s11",
                                                "events":{
                                                    "dragDrop":"__s11_dragDrop",
                                                    "mouseDown":"__s11_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s12",
                                                "events":{
                                                    "dragDrop":"__s12_dragDrop",
                                                    "mouseDown":"__s12_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s13",
                                                "events":{
                                                    "dragDrop":"__s13_dragDrop",
                                                    "mouseDown":"__s13_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s14",
                                                "events":{
                                                    "dragDrop":"__s14_dragDrop",
                                                    "mouseDown":"__s14_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s15",
                                                "events":{
                                                    "dragDrop":"__s15_dragDrop",
                                                    "mouseDown":"__s15_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s16",
                                                "events":{
                                                    "dragDrop":"__s16_dragDrop",
                                                    "mouseDown":"__s16_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s17",
                                                "events":{
                                                    "dragDrop":"__s17_dragDrop",
                                                    "mouseDown":"__s17_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s18",
                                                "events":{
                                                    "dragDrop":"__s18_dragDrop",
                                                    "mouseDown":"__s18_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s19",
                                                "events":{
                                                    "dragDrop":"__s19_dragDrop",
                                                    "mouseDown":"__s19_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s20",
                                                "events":{
                                                    "dragDrop":"__s20_dragDrop",
                                                    "mouseDown":"__s20_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"bar3",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":5,
                                            "visible":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s21",
                                                "events":{
                                                    "dragDrop":"__s21_dragDrop",
                                                    "mouseDown":"__s21_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s22",
                                                "events":{
                                                    "dragDrop":"__s22_dragDrop",
                                                    "mouseDown":"__s22_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s23",
                                                "events":{
                                                    "dragDrop":"__s23_dragDrop",
                                                    "mouseDown":"__s23_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s24",
                                                "events":{
                                                    "dragDrop":"__s24_dragDrop",
                                                    "mouseDown":"__s24_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s25",
                                                "events":{
                                                    "dragDrop":"__s25_dragDrop",
                                                    "mouseDown":"__s25_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s26",
                                                "events":{
                                                    "dragDrop":"__s26_dragDrop",
                                                    "mouseDown":"__s26_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s27",
                                                "events":{
                                                    "dragDrop":"__s27_dragDrop",
                                                    "mouseDown":"__s27_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s28",
                                                "events":{
                                                    "dragDrop":"__s28_dragDrop",
                                                    "mouseDown":"__s28_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s29",
                                                "events":{
                                                    "dragDrop":"__s29_dragDrop",
                                                    "mouseDown":"__s29_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"s30",
                                                "events":{
                                                    "dragDrop":"__s30_dragDrop",
                                                    "mouseDown":"__s30_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 25;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":6,
                                            "y":23,
                                            "mouseEnabled":false,
                                            "mouseChildren":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"1",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"2",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"3",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"4",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"5",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"6",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"7",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"8",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"9",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"0",
                                                        "width":10,
                                                        "height":15
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"numCanvas",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "-2.100006";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":22,
                                            "height":48,
                                            "y":1,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"barUp",
                                                "events":{"click":"__barUp_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"UserBarSwitchUp",
                                                        "x":2,
                                                        "y":3
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"barNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"1",
                                                        "y":14,
                                                        "x":1
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"barDown",
                                                "events":{"click":"__barDown_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"UserBarSwitchDown",
                                                        "x":2,
                                                        "y":29
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":AutoBattleCanva,
                        "id":"abc",
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":1,
                                "width":86,
                                "height":52
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn",
                        "events":{"click":"__btn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnSkillBar",
                                "x":396,
                                "y":7
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function UserBarCanvas()
        {
            mx_internal::_document = this;
            this.clipContent = false;
            this.cacheAsBitmap = true;
            this.height = 52;
            this.width = 460;
            this.states = [_UserBarCanvas_State1_c(), _UserBarCanvas_State2_c()];
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            UserBarCanvas._watcherSetupUtil = _arg_1;
        }


        public function set s23(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112116s23;
            if (_local_2 !== _arg_1)
            {
                this._112116s23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s23", _local_2, _arg_1));
            };
        }

        public function set s28(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112121s28;
            if (_local_2 !== _arg_1)
            {
                this._112121s28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s28", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s22():ItemSlot
        {
            return (this._112115s22);
        }

        public function set s29(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112122s29;
            if (_local_2 !== _arg_1)
            {
                this._112122s29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s29", _local_2, _arg_1));
            };
        }

        private function _UserBarCanvas_SetProperty23_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty23 = _local_1;
            _local_1.name = "visible";
            _local_1.value = true;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty23", _UserBarCanvas_SetProperty23);
            return (_local_1);
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            _core.view.getUI(ViewManager.MAIN_USER_BAR).changeBarVisible();
        }

        [Bindable(event="propertyChange")]
        public function get s26():ItemSlot
        {
            return (this._112119s26);
        }

        public function __s19_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function set s27(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112120s27;
            if (_local_2 !== _arg_1)
            {
                this._112120s27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s27", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s29():ItemSlot
        {
            return (this._112122s29);
        }

        public function set s26(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112119s26;
            if (_local_2 !== _arg_1)
            {
                this._112119s26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s26", _local_2, _arg_1));
            };
        }

        public function __s23_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s30():ItemSlot
        {
            return (this._112144s30);
        }

        [Bindable(event="propertyChange")]
        public function get s25():ItemSlot
        {
            return (this._112118s25);
        }

        public function set barUp(_arg_1:Button):void
        {
            var _local_2:Object = this._93507086barUp;
            if (_local_2 !== _arg_1)
            {
                this._93507086barUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barUp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get barUp():Button
        {
            return (this._93507086barUp);
        }

        public function __s7_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get barNum2():RoundedLabel
        {
            return (this._334203873barNum2);
        }

        [Bindable(event="propertyChange")]
        public function get barNum3():RoundedLabel
        {
            return (this._334203872barNum3);
        }

        public function __s17_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function _UserBarCanvas_SetProperty11_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty11 = _local_1;
            _local_1.name = "visible";
            _local_1.value = true;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty11", _UserBarCanvas_SetProperty11);
            return (_local_1);
        }

        private function useSlot(_arg_1:ItemSlot, _arg_2:Boolean=false):void
        {
            var _local_3:Object;
            var _local_4:BattleStage;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Object;
            if (_arg_1.type == GamePredef.TBL_ITEM_TEMPLATE)
            {
                _core.useItem(_arg_1.giid, _arg_1, _arg_2);
            }
            else
            {
                if (((_core.state == GamePredef.ST_CORE_BATTLE) && (BattleCreatureView.cmdMode)))
                {
                    _local_3 = _core.data.getGameData(GamePredef.TBL_SKILL, _arg_1.giid);
                    if ((((_local_3) && (_local_3.restoreSid)) && (_local_3.restoreSid > 0)))
                    {
                        _local_5 = _core.data.getSlot({"id":_core.battlePet.equ7});
                        _local_6 = _core.data.getSlot({"id":_core.battlePet.equ8});
                        _local_7 = _core.data.getGameData(18, _local_5.itemId);
                        _local_8 = _core.data.getGameData(18, _local_6.itemId);
                        _local_9 = Number(_local_7.endureLeft);
                        _local_10 = Number(_local_8.endureLeft);
                        _local_11 = (Number(_local_7.endureMax) * 0.1);
                        _local_12 = (Number(_local_8.endureMax) * 0.1);
                        if ((((_local_9 > 0) && (_local_9 < _local_11)) || ((_local_10 > 0) && (_local_10 < _local_12))))
                        {
                            _core.sysMidNote(Language.CHARSELECTCANVAS_U[35]);
                        }
                        else
                        {
                            if (((_local_9 <= 0) || (_local_10 <= 0)))
                            {
                                _core.sysMidNote(Language.CHARSELECTCANVAS_U[36]);
                                return;
                            };
                        };
                    };
                    _local_4 = BattleStage(_core.view.getUI(ViewManager.STAGE_BATTLE));
                    if (((_local_3) && (_core.checkSkillRequire(_local_3, true, Boolean(_local_4.cPetCmd.visible)))))
                    {
                        _core.cmdState = GamePredef.ST_BATTLE_SKILL;
                        _core.skill = _local_3;
                        if (_local_3.targetType == Battle.SKILL_TARGET_TYPE_SELF_PLAYER)
                        {
                            _core.battle.battleCmd(_core.player.battleId, GamePredef.BATTLE_ACTION_SKILL, _core.skill.id, _core.skillLevel);
                        }
                        else
                        {
                            if (_local_3.targetType == Battle.SKILL_TARGET_TYPE_SELF_PET)
                            {
                                _local_13 = _core.battle.battleGetPlayerPet(_core.view.getUI(ViewManager.STAGE_BATTLE).cList);
                                if (null == _local_13)
                                {
                                    _core.sysMidNote(Language.USERBARCANVAS_S[1]);
                                    return;
                                };
                                _core.battle.battleCmd(_local_13.battleId, GamePredef.BATTLE_ACTION_SKILL, _core.skill.id, _core.skillLevel);
                            }
                            else
                            {
                                _core.view.showSelect();
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get s2():ItemSlot
        {
            return (this._3615s2);
        }

        [Bindable(event="propertyChange")]
        public function get s3():ItemSlot
        {
            return (this._3616s3);
        }

        [Bindable(event="propertyChange")]
        public function get s4():ItemSlot
        {
            return (this._3617s4);
        }

        [Bindable(event="propertyChange")]
        public function get s6():ItemSlot
        {
            return (this._3619s6);
        }

        private function _UserBarCanvas_SetProperty3_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty3 = _local_1;
            _local_1.name = "visible";
            _local_1.value = true;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty3", _UserBarCanvas_SetProperty3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get s8():ItemSlot
        {
            return (this._3621s8);
        }

        public function __s12_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function set s30(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112144s30;
            if (_local_2 !== _arg_1)
            {
                this._112144s30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s30", _local_2, _arg_1));
            };
        }

        public function __s4_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s5():ItemSlot
        {
            return (this._3618s5);
        }

        private function _UserBarCanvas_SetProperty19_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty19 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty19", _UserBarCanvas_SetProperty19);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get s9():ItemSlot
        {
            return (this._3622s9);
        }

        public function __barUp_click(_arg_1:MouseEvent):void
        {
            userBarUp();
        }

        public function __s20_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set barNum1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._334203874barNum1;
            if (_local_2 !== _arg_1)
            {
                this._334203874barNum1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barNum1", _local_2, _arg_1));
            };
        }

        public function __barDown_click(_arg_1:MouseEvent):void
        {
            userBarDown();
        }

        [Bindable(event="propertyChange")]
        public function get s28():ItemSlot
        {
            return (this._112121s28);
        }

        [Bindable(event="propertyChange")]
        public function get barNum1():RoundedLabel
        {
            return (this._334203874barNum1);
        }

        public function __s28_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set s4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3617s4;
            if (_local_2 !== _arg_1)
            {
                this._3617s4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s4", _local_2, _arg_1));
            };
        }

        private function _UserBarCanvas_SetProperty22_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty22 = _local_1;
            _local_1.name = "visible";
            _local_1.value = true;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty22", _UserBarCanvas_SetProperty22);
            return (_local_1);
        }

        public function set s5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3618s5;
            if (_local_2 !== _arg_1)
            {
                this._3618s5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s5", _local_2, _arg_1));
            };
        }

        public function set barNum2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._334203873barNum2;
            if (_local_2 !== _arg_1)
            {
                this._334203873barNum2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barNum2", _local_2, _arg_1));
            };
        }

        public function set barNum3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._334203872barNum3;
            if (_local_2 !== _arg_1)
            {
                this._334203872barNum3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barNum3", _local_2, _arg_1));
            };
        }

        public function set s7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3620s7;
            if (_local_2 !== _arg_1)
            {
                this._3620s7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s1():ItemSlot
        {
            return (this._3614s1);
        }

        public function __s25_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function set s3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3616s3;
            if (_local_2 !== _arg_1)
            {
                this._3616s3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s3", _local_2, _arg_1));
            };
        }

        public function set s9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3622s9;
            if (_local_2 !== _arg_1)
            {
                this._3622s9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s9", _local_2, _arg_1));
            };
        }

        public function set s1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3614s1;
            if (_local_2 !== _arg_1)
            {
                this._3614s1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s1", _local_2, _arg_1));
            };
        }

        public function set s6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3619s6;
            if (_local_2 !== _arg_1)
            {
                this._3619s6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s6", _local_2, _arg_1));
            };
        }

        public function set s2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3615s2;
            if (_local_2 !== _arg_1)
            {
                this._3615s2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s2", _local_2, _arg_1));
            };
        }

        public function set s8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3621s8;
            if (_local_2 !== _arg_1)
            {
                this._3621s8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s8", _local_2, _arg_1));
            };
        }

        public function __s9_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s7():ItemSlot
        {
            return (this._3620s7);
        }

        private function _UserBarCanvas_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty2 = _local_1;
            _local_1.name = "y";
            _local_1.value = 81;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty2", _UserBarCanvas_SetProperty2);
            return (_local_1);
        }

        private function _UserBarCanvas_SetProperty10_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty10 = _local_1;
            _local_1.name = "visible";
            _local_1.value = true;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty10", _UserBarCanvas_SetProperty10);
            return (_local_1);
        }

        private function _UserBarCanvas_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "normal";
            _local_1.overrides = [_UserBarCanvas_SetProperty15_i(), _UserBarCanvas_SetProperty16_i(), _UserBarCanvas_SetProperty17_i(), _UserBarCanvas_SetProperty18_i(), _UserBarCanvas_SetProperty19_i(), _UserBarCanvas_SetProperty20_i(), _UserBarCanvas_SetProperty21_i(), _UserBarCanvas_SetProperty22_i(), _UserBarCanvas_SetProperty23_i(), _UserBarCanvas_SetProperty24_i(), _UserBarCanvas_SetProperty25_i(), _UserBarCanvas_SetProperty26_i()];
            return (_local_1);
        }

        public function showUsableItems(_arg_1:String):void
        {
            var _local_2:Number;
            var _local_3:Object;
            var _local_5:Object;
            switch (_arg_1)
            {
                case "pet":
                    _local_2 = 100;
                    break;
                case "char":
                    _local_2 = _core.player.classId;
                    break;
            };
            var _local_4:int = 1;
            while (_local_4 <= 30)
            {
                _local_3 = this[("s" + _local_4)];
                if (((_local_3.type == GamePredef.TBL_SKILL) && (_local_3.giid)))
                {
                    _local_5 = _core.getTemplateData(GamePredef.TBL_SKILL, _local_3.giid);
                    if (_local_5.reqClass.slice("|").indexOf(_local_2) >= 0)
                    {
                        this[("s" + _local_4)].alpha = 1;
                        _local_3.enabled = true;
                    }
                    else
                    {
                        this[("s" + _local_4)].alpha = 0.5;
                        _local_3.enabled = false;
                    };
                }
                else
                {
                    this[("s" + _local_4)].alpha = 1;
                    _local_3.enabled = true;
                };
                _local_4++;
            };
        }

        public function __s7_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s14_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s12_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function _UserBarCanvas_SetProperty18_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty18 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty18", _UserBarCanvas_SetProperty18);
            return (_local_1);
        }

        public function __s2_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get abc():AutoBattleCanva
        {
            return (this._96354abc);
        }

        private function _UserBarCanvas_SetProperty21_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty21 = _local_1;
            _local_1.name = "height";
            _local_1.value = 44;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty21", _UserBarCanvas_SetProperty21);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get bar1():HBox
        {
            return (this._3016318bar1);
        }

        [Bindable(event="propertyChange")]
        public function get bar2():HBox
        {
            return (this._3016319bar2);
        }

        [Bindable(event="propertyChange")]
        public function get bar3():HBox
        {
            return (this._3016320bar3);
        }

        public function useSlotByNum(_arg_1:Number):void
        {
            var _local_3:ItemSlot;
            var _local_4:ItemSlot;
            var _local_2:BattleStage = BattleStage(_core.view.getUI(ViewManager.STAGE_BATTLE));
            if ((((_local_2.visible) && (_local_2.enabled)) && ((_local_2.cPlayerCmd.visible) || (_local_2.cPetCmd.visible))))
            {
                _local_3 = ((GamePredef.GLOBAL_SETTING.battleStExpan) ? this[("s" + _arg_1)] : this[("s" + ((_arg_1 + (int(barNum.text) * 10)) - 10))]);
                useSlot(_local_3);
            }
            else
            {
                if (_core.state == GamePredef.ST_CORE_NORMAL)
                {
                    _local_4 = this[("s" + ((_arg_1 + (int(barNum.text) * 10)) - 10))];
                    if (_local_4.type == GamePredef.TBL_ITEM_TEMPLATE)
                    {
                        useSlot(_local_4);
                    };
                };
            };
        }

        private function _UserBarCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (bar2);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty1.target = _arg_1;
            }, "_UserBarCanvas_SetProperty1.target");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bar3);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty2.target = _arg_1;
            }, "_UserBarCanvas_SetProperty2.target");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bar1);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty3.target = _arg_1;
            }, "_UserBarCanvas_SetProperty3.target");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bar2);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty4.target = _arg_1;
            }, "_UserBarCanvas_SetProperty4.target");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bar3);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty5.target = _arg_1;
            }, "_UserBarCanvas_SetProperty5.target");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (btnContainer);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty6.target = _arg_1;
            }, "_UserBarCanvas_SetProperty6.target");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (btnContainer);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty7.target = _arg_1;
            }, "_UserBarCanvas_SetProperty7.target");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (numCanvas);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty8.target = _arg_1;
            }, "_UserBarCanvas_SetProperty8.target");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (abc);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty9.target = _arg_1;
            }, "_UserBarCanvas_SetProperty9.target");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (barNum1);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty10.target = _arg_1;
            }, "_UserBarCanvas_SetProperty10.target");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (barNum2);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty11.target = _arg_1;
            }, "_UserBarCanvas_SetProperty11.target");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (barNum2);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty12.target = _arg_1;
            }, "_UserBarCanvas_SetProperty12.target");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (barNum3);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty13.target = _arg_1;
            }, "_UserBarCanvas_SetProperty13.target");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (barNum3);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty14.target = _arg_1;
            }, "_UserBarCanvas_SetProperty14.target");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bar2);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty15.target = _arg_1;
            }, "_UserBarCanvas_SetProperty15.target");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bar3);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty16.target = _arg_1;
            }, "_UserBarCanvas_SetProperty16.target");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bar1);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty17.target = _arg_1;
            }, "_UserBarCanvas_SetProperty17.target");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bar2);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty18.target = _arg_1;
            }, "_UserBarCanvas_SetProperty18.target");
            result[17] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bar3);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty19.target = _arg_1;
            }, "_UserBarCanvas_SetProperty19.target");
            result[18] = binding;
            binding = new Binding(this, function ():Object
            {
                return (btnContainer);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty20.target = _arg_1;
            }, "_UserBarCanvas_SetProperty20.target");
            result[19] = binding;
            binding = new Binding(this, function ():Object
            {
                return (btnContainer);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty21.target = _arg_1;
            }, "_UserBarCanvas_SetProperty21.target");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (numCanvas);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty22.target = _arg_1;
            }, "_UserBarCanvas_SetProperty22.target");
            result[21] = binding;
            binding = new Binding(this, function ():Object
            {
                return (abc);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty23.target = _arg_1;
            }, "_UserBarCanvas_SetProperty23.target");
            result[22] = binding;
            binding = new Binding(this, function ():Object
            {
                return (barNum1);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty24.target = _arg_1;
            }, "_UserBarCanvas_SetProperty24.target");
            result[23] = binding;
            binding = new Binding(this, function ():Object
            {
                return (barNum2);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty25.target = _arg_1;
            }, "_UserBarCanvas_SetProperty25.target");
            result[24] = binding;
            binding = new Binding(this, function ():Object
            {
                return (barNum3);
            }, function (_arg_1:Object):void
            {
                _UserBarCanvas_SetProperty26.target = _arg_1;
            }, "_UserBarCanvas_SetProperty26.target");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s1.slotType = _arg_1;
            }, "s1.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s2.slotType = _arg_1;
            }, "s2.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s3.slotType = _arg_1;
            }, "s3.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s4.slotType = _arg_1;
            }, "s4.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s5.slotType = _arg_1;
            }, "s5.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s6.slotType = _arg_1;
            }, "s6.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s7.slotType = _arg_1;
            }, "s7.slotType");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s8.slotType = _arg_1;
            }, "s8.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s9.slotType = _arg_1;
            }, "s9.slotType");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s10.slotType = _arg_1;
            }, "s10.slotType");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s11.slotType = _arg_1;
            }, "s11.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s12.slotType = _arg_1;
            }, "s12.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s13.slotType = _arg_1;
            }, "s13.slotType");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s14.slotType = _arg_1;
            }, "s14.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s15.slotType = _arg_1;
            }, "s15.slotType");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s16.slotType = _arg_1;
            }, "s16.slotType");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s17.slotType = _arg_1;
            }, "s17.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s18.slotType = _arg_1;
            }, "s18.slotType");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s19.slotType = _arg_1;
            }, "s19.slotType");
            result[44] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s20.slotType = _arg_1;
            }, "s20.slotType");
            result[45] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s21.slotType = _arg_1;
            }, "s21.slotType");
            result[46] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s22.slotType = _arg_1;
            }, "s22.slotType");
            result[47] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s23.slotType = _arg_1;
            }, "s23.slotType");
            result[48] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s24.slotType = _arg_1;
            }, "s24.slotType");
            result[49] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s25.slotType = _arg_1;
            }, "s25.slotType");
            result[50] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s26.slotType = _arg_1;
            }, "s26.slotType");
            result[51] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s27.slotType = _arg_1;
            }, "s27.slotType");
            result[52] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s28.slotType = _arg_1;
            }, "s28.slotType");
            result[53] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s29.slotType = _arg_1;
            }, "s29.slotType");
            result[54] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                s30.slotType = _arg_1;
            }, "s30.slotType");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERBARCANVAS_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn.toolTip = _arg_1;
            }, "btn.toolTip");
            result[56] = binding;
            return (result);
        }

        public function __s23_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get barNum():RoundedLabel
        {
            return (this._1396254093barNum);
        }

        [Bindable(event="propertyChange")]
        public function get numCanvas():Canvas
        {
            return (this._758632574numCanvas);
        }

        public function __s15_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function _UserBarCanvas_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "battle";
            _local_1.overrides = [_UserBarCanvas_SetProperty1_i(), _UserBarCanvas_SetProperty2_i(), _UserBarCanvas_SetProperty3_i(), _UserBarCanvas_SetProperty4_i(), _UserBarCanvas_SetProperty5_i(), _UserBarCanvas_SetProperty6_i(), _UserBarCanvas_SetProperty7_i(), _UserBarCanvas_SetProperty8_i(), _UserBarCanvas_SetProperty9_i(), _UserBarCanvas_SetProperty10_i(), _UserBarCanvas_SetProperty11_i(), _UserBarCanvas_SetProperty12_i(), _UserBarCanvas_SetProperty13_i(), _UserBarCanvas_SetProperty14_i()];
            return (_local_1);
        }

        public function __s2_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function _UserBarCanvas_SetProperty1_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty1 = _local_1;
            _local_1.name = "y";
            _local_1.value = 43;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty1", _UserBarCanvas_SetProperty1);
            return (_local_1);
        }

        public function __s27_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        private function changeBarVisible():void
        {
            _core.updateSettingNow("au", ((btnContainer.visible) ? 0 : 1));
            btnContainer.visible = (!(btnContainer.visible));
            btn.selected = (!(btn.selected));
            barUp.visible = btnContainer.visible;
            barDown.visible = btnContainer.visible;
            barNum.visible = btnContainer.visible;
        }

        private function _UserBarCanvas_SetProperty17_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty17 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty17", _UserBarCanvas_SetProperty17);
            return (_local_1);
        }

        private function _UserBarCanvas_SetProperty20_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty20 = _local_1;
            _local_1.name = "y";
            _local_1.value = 4;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty20", _UserBarCanvas_SetProperty20);
            return (_local_1);
        }

        private function _UserBarCanvas_SetProperty9_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty9 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty9", _UserBarCanvas_SetProperty9);
            return (_local_1);
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
            var _local_2:ItemSlot;
            _arg_1.stopImmediatePropagation();
            if (_core.state == GamePredef.ST_CORE_BATTLE)
            {
                _local_2 = ItemSlot(_arg_1.currentTarget);
                useSlot(_local_2);
            }
            else
            {
                if (((_core.state == GamePredef.ST_CORE_NORMAL) && (_core.player.isLockedUB)))
                {
                    _local_2 = ItemSlot(_arg_1.currentTarget);
                    useSlot(_local_2, _arg_1.ctrlKey);
                };
            };
        }

        public function set btn(_arg_1:Button):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        public function __s4_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function set abc(_arg_1:AutoBattleCanva):void
        {
            var _local_2:Object = this._96354abc;
            if (_local_2 !== _arg_1)
            {
                this._96354abc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "abc", _local_2, _arg_1));
            };
        }

        public function __s16_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s26_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s29_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function update():void
        {
        }

        public function __s20_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s10_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set barDown(_arg_1:Button):void
        {
            var _local_2:Object = this._334507179barDown;
            if (_local_2 !== _arg_1)
            {
                this._334507179barDown = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barDown", _local_2, _arg_1));
            };
        }

        public function set barNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1396254093barNum;
            if (_local_2 !== _arg_1)
            {
                this._1396254093barNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barNum", _local_2, _arg_1));
            };
        }

        private function _UserBarCanvas_SetProperty8_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty8 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty8", _UserBarCanvas_SetProperty8);
            return (_local_1);
        }

        public function __s5_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function _UserBarCanvas_SetProperty16_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty16 = _local_1;
            _local_1.name = "y";
            _local_1.value = 5;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty16", _UserBarCanvas_SetProperty16);
            return (_local_1);
        }

        public function __s18_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s18_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s21_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function userBarUp():void
        {
            if (bar1.visible)
            {
                bar1.visible = false;
                bar3.visible = true;
                barNum.text = "3";
            }
            else
            {
                if (bar2.visible)
                {
                    bar2.visible = false;
                    bar1.visible = true;
                    barNum.text = "1";
                }
                else
                {
                    if (bar3.visible)
                    {
                        bar3.visible = false;
                        bar2.visible = true;
                        barNum.text = "2";
                    };
                };
            };
        }

        public function __s29_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function userBarDown():void
        {
            if (bar1.visible)
            {
                bar1.visible = false;
                bar2.visible = true;
                barNum.text = "2";
            }
            else
            {
                if (bar2.visible)
                {
                    bar2.visible = false;
                    bar3.visible = true;
                    barNum.text = "3";
                }
                else
                {
                    if (bar3.visible)
                    {
                        bar3.visible = false;
                        bar1.visible = true;
                        barNum.text = "1";
                    };
                };
            };
        }

        public function set bar2(_arg_1:HBox):void
        {
            var _local_2:Object = this._3016319bar2;
            if (_local_2 !== _arg_1)
            {
                this._3016319bar2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar2", _local_2, _arg_1));
            };
        }

        public function __s6_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s11_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s22_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function set bar3(_arg_1:HBox):void
        {
            var _local_2:Object = this._3016320bar3;
            if (_local_2 !== _arg_1)
            {
                this._3016320bar3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn():Button
        {
            return (this._97884btn);
        }

        public function __s13_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set bar1(_arg_1:HBox):void
        {
            var _local_2:Object = this._3016318bar1;
            if (_local_2 !== _arg_1)
            {
                this._3016318bar1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar1", _local_2, _arg_1));
            };
        }

        private function _UserBarCanvas_SetProperty15_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty15 = _local_1;
            _local_1.name = "y";
            _local_1.value = 5;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty15", _UserBarCanvas_SetProperty15);
            return (_local_1);
        }

        private function _UserBarCanvas_SetProperty7_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty7 = _local_1;
            _local_1.name = "height";
            _local_1.value = 120;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty7", _UserBarCanvas_SetProperty7);
            return (_local_1);
        }

        public function set numCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._758632574numCanvas;
            if (_local_2 !== _arg_1)
            {
                this._758632574numCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numCanvas", _local_2, _arg_1));
            };
        }

        public function __s8_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set btnContainer(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1071360635btnContainer;
            if (_local_2 !== _arg_1)
            {
                this._1071360635btnContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnContainer", _local_2, _arg_1));
            };
        }

        private function setSkillEnabled(_arg_1:ItemSlot, _arg_2:Number, _arg_3:Boolean):void
        {
            if (((!(_arg_1.type == GamePredef.TBL_SKILL)) || (!(_arg_1.giid))))
            {
                _arg_1.alpha = 1;
                _arg_1.enabled = true;
                return;
            };
            var _local_4:Object = _core.getTemplateData(_arg_1.type, _arg_1.giid, false);
            if (!_local_4)
            {
                _arg_1.alpha = 0.5;
                _arg_1.enabled = false;
                return;
            };
            if (((((_local_4.reqClass == "") || (_local_4.reqClass.indexOf((("|" + _arg_2) + "|")) >= 0)) || (_local_4.reqClass.indexOf((("|" + _arg_2) + "@|")) >= 0)) && (_core.checkSkillRequire(_local_4, false, _arg_3))))
            {
                _arg_1.alpha = 1;
                _arg_1.enabled = true;
            }
            else
            {
                _arg_1.alpha = 0.5;
                _arg_1.enabled = false;
            };
        }

        public function updateUserBar(_arg_1:int):void
        {
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:String;
            var _local_9:int;
            var _local_10:Object;
            var _local_2:ItemSlot = this[("s" + _arg_1)];
            _local_2.stackNum = 0;
            var _local_3:int = GamePredef.GLOBAL_SETTING[("st" + _arg_1)];
            var _local_4:Number = GamePredef.GLOBAL_SETTING[("sid" + _arg_1)];
            _local_2.toolTip = ((_local_4 <= 0) ? Language.USERBARCANVAS_S[2] : null);
            if (_local_3 == GamePredef.TBL_SKILL)
            {
                if (_core.player.awakenPointDict)
                {
                    _local_6 = _core.player.awakenPointDict;
                    _local_7 = GameData.d[GamePredef.TBL_SKILL][_local_4];
                    if (((_local_7) && (_local_6[_local_7.codeName])))
                    {
                        _local_8 = _local_7.codeName;
                        _local_9 = int(_local_6[_local_8]);
                        if (int(_local_7[("exSid" + _local_9)]) > 0)
                        {
                            _local_4 = _local_7[("exSid" + _local_9)];
                        };
                    };
                };
                _local_2.giid = _local_4;
                _local_5 = _core.getTemplateData(_local_3, _local_4, false);
                _local_2.alpha = (((_local_5) && (_core.checkSkillRequire(_local_5))) ? 1 : 0.5);
            }
            else
            {
                _local_2.giid = _local_4;
                _local_10 = _core.getItemNum(_local_3, _local_4);
                _local_2.stackNum = _local_10.num;
                _local_2.alpha = ((_local_10.num > 0) ? 1 : 0.5);
            };
        }

        public function __s8_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
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

        private function _UserBarCanvas_SetProperty26_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty26 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty26", _UserBarCanvas_SetProperty26);
            return (_local_1);
        }

        public function __s13_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function reset():void
        {
            if (!initialized)
            {
                return;
            };
            var _local_1:int = 1;
            while (_local_1 <= _quickSkillSize)
            {
                this[("s" + _local_1)].clean();
                this[("s" + _local_1)].toolTip = Language.USERBARCANVAS_S[2];
                _local_1++;
            };
        }

        public function __s24_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s24_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get barDown():Button
        {
            return (this._334507179barDown);
        }

        public function __s16_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s1_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        private function _UserBarCanvas_SetProperty14_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty14 = _local_1;
            _local_1.name = "y";
            _local_1.value = 93;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty14", _UserBarCanvas_SetProperty14);
            return (_local_1);
        }

        private function _UserBarCanvas_SetProperty6_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty6 = _local_1;
            _local_1.name = "y";
            _local_1.value = -38;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty6", _UserBarCanvas_SetProperty6);
            return (_local_1);
        }

        public function __s3_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s26_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        private function _UserBarCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = bar2;
            _local_1 = bar3;
            _local_1 = bar1;
            _local_1 = bar2;
            _local_1 = bar3;
            _local_1 = btnContainer;
            _local_1 = btnContainer;
            _local_1 = numCanvas;
            _local_1 = abc;
            _local_1 = barNum1;
            _local_1 = barNum2;
            _local_1 = barNum2;
            _local_1 = barNum3;
            _local_1 = barNum3;
            _local_1 = bar2;
            _local_1 = bar3;
            _local_1 = bar1;
            _local_1 = bar2;
            _local_1 = bar3;
            _local_1 = btnContainer;
            _local_1 = btnContainer;
            _local_1 = numCanvas;
            _local_1 = abc;
            _local_1 = barNum1;
            _local_1 = barNum2;
            _local_1 = barNum3;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Language.USERBARCANVAS_S[0];
        }

        public function __s30_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnContainer():Canvas
        {
            return (this._1071360635btnContainer);
        }

        private function _UserBarCanvas_SetProperty25_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty25 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty25", _UserBarCanvas_SetProperty25);
            return (_local_1);
        }

        private function setSlot(_arg_1:DragEvent):void
        {
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:String;
            var _local_8:Number;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:int;
            var _local_12:Object;
            var _local_13:String;
            var _local_14:Object;
            var _local_15:int;
            var _local_16:String;
            var _local_17:String;
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            var _local_3:Object = _arg_1.dragSource.dataForFormat("slot");
            if (_local_2 == _local_3)
            {
                return;
            };
            var _local_4:String = _local_2.id.slice(1);
            if (_local_3.type == GamePredef.TBL_ITEM_INSTANCE)
            {
                _local_5 = _core.getTemplateData(_local_3.type, _local_3.giid, false);
                if (!_local_5)
                {
                    return;
                };
                if (((_local_5.skillId <= 0) && ((!(_local_5.scriptUse)) || (_local_5.scriptUse.length <= 0))))
                {
                    return;
                };
                _local_2.toolTip = null;
                _local_2.type = GamePredef.TBL_ITEM_TEMPLATE;
                _core.updateSettingNow(("st" + _local_4), GamePredef.TBL_ITEM_TEMPLATE);
                _core.updateSettingNow(("sid" + _local_4), _local_5.id);
            }
            else
            {
                if (_local_3.type == GamePredef.TBL_ITEM_TEMPLATE)
                {
                    _local_6 = _core.getTemplateData(_local_3.type, _local_3.giid, false);
                    if (!_local_6)
                    {
                        return;
                    };
                    if (((_local_6.skillId <= 0) && ((!(_local_6.scriptUse)) || (_local_6.scriptUse.length <= 0))))
                    {
                        return;
                    };
                    _local_2.toolTip = null;
                    _local_2.type = GamePredef.TBL_ITEM_TEMPLATE;
                    _core.updateSettingNow(("st" + _local_4), GamePredef.TBL_ITEM_TEMPLATE);
                    _core.updateSettingNow(("sid" + _local_4), _local_6.id);
                    if (_local_3.slotType == Slot.SLOT_USERBAR)
                    {
                        _local_3.clean();
                        _local_7 = _local_3["id"].slice(1);
                        if (_local_3["id"].charAt(0) == "s")
                        {
                            _local_3.toolTip = Language.USERBARCANVAS_S[2];
                        };
                        _core.updateSettingNow(("sid" + _local_7), 0);
                    };
                }
                else
                {
                    if (_local_3.type == GamePredef.TBL_SKILL)
                    {
                        _local_8 = _local_3.giid;
                        _local_9 = _core.player.awakenPointDict;
                        _local_10 = GameData.d[GamePredef.TBL_SKILL][_local_3.giid];
                        if ((((_local_9) && (_local_10)) && (_local_10.reqClass == "")))
                        {
                            for each (_local_12 in _core.player.skillList)
                            {
                                if (_local_12)
                                {
                                    _local_14 = GameData.d[GamePredef.TBL_SKILL][_local_12.sid];
                                    if (_local_14)
                                    {
                                        if (_local_9[_local_14.codeName])
                                        {
                                            _local_15 = _local_9[_local_14.codeName];
                                            if (!((!(_local_14[("exSid" + _local_15)])) || (Number(_local_14[("exSid" + _local_15)]) <= 0)))
                                            {
                                                if (Number(_local_14[("exSid" + _local_15)]) == _local_8)
                                                {
                                                    _local_8 = _local_14.id;
                                                    break;
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        _local_11 = (_arg_1.dragSource.dataForFormat("level") as int);
                        _core.remote.skillSetUserBar(_local_8, _local_11, _local_4);
                        _local_2.toolTip = null;
                        _local_2.type = GamePredef.TBL_SKILL;
                        _local_12 = skillGetLevel(_local_8, _local_11);
                        _core.updateSetting(("st" + _local_4), GamePredef.TBL_SKILL);
                        _core.updateSetting(("sid" + _local_4), _local_12.id);
                        _local_13 = _local_3["id"].slice(0, 1);
                        if (_local_2.slotType == Slot.SLOT_USERBAR)
                        {
                            _local_16 = _local_3["id"].slice(1);
                            if (_local_13 == "i")
                            {
                                _core.updateSettingNow(("bs" + _local_16), 0);
                            };
                        };
                        if (((_local_3.movable) && (!(_local_13 == "i"))))
                        {
                            _local_3.clean();
                            _local_17 = _local_3["id"].slice(1);
                            _local_3.toolTip = Language.USERBARCANVAS_S[2];
                            _core.updateSettingNow(("sid" + _local_17), 0);
                        };
                    };
                };
            };
        }

        public function __s15_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s27_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        override public function initialize():void
        {
            var target:UserBarCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _UserBarCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_UserBarCanvasWatcherSetupUtil");
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

        private function useSlotByClick(_arg_1:GameEvent):void
        {
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            useSlot(_local_2, _arg_1.data.ctrlKey);
        }

        public function __s11_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s30_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s3_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s19_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set s10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112082s10;
            if (_local_2 !== _arg_1)
            {
                this._112082s10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s10", _local_2, _arg_1));
            };
        }

        private function _UserBarCanvas_SetProperty13_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty13 = _local_1;
            _local_1.name = "visible";
            _local_1.value = true;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty13", _UserBarCanvas_SetProperty13);
            return (_local_1);
        }

        private function _UserBarCanvas_SetProperty5_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty5 = _local_1;
            _local_1.name = "visible";
            _local_1.value = true;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty5", _UserBarCanvas_SetProperty5);
            return (_local_1);
        }

        public function set s12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112084s12;
            if (_local_2 !== _arg_1)
            {
                this._112084s12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s12", _local_2, _arg_1));
            };
        }

        public function __s6_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set s14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112086s14;
            if (_local_2 !== _arg_1)
            {
                this._112086s14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s14", _local_2, _arg_1));
            };
        }

        public function set s11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112083s11;
            if (_local_2 !== _arg_1)
            {
                this._112083s11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s11", _local_2, _arg_1));
            };
        }

        public function __s28_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function set s13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112085s13;
            if (_local_2 !== _arg_1)
            {
                this._112085s13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s13", _local_2, _arg_1));
            };
        }

        public function setAllSkill(_arg_1:int):void
        {
            var _local_3:ItemSlot;
            var _local_2:int = 1;
            while (_local_2 <= _quickSkillSize)
            {
                _local_3 = this[("s" + _local_2)];
                if (_local_3.type == GamePredef.TBL_SKILL)
                {
                    if (_arg_1 == 2)
                    {
                        setSkillEnabled(_local_3, _core.player.classId, false);
                    }
                    else
                    {
                        if (_arg_1 == 3)
                        {
                            setSkillEnabled(_local_3, 100, true);
                        }
                        else
                        {
                            _local_3.alpha = 0.5;
                            _local_3.enabled = true;
                        };
                    };
                };
                _local_2++;
            };
        }

        public function set s18(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112090s18;
            if (_local_2 !== _arg_1)
            {
                this._112090s18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s18", _local_2, _arg_1));
            };
        }

        public function set s15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112087s15;
            if (_local_2 !== _arg_1)
            {
                this._112087s15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s15", _local_2, _arg_1));
            };
        }

        public function set s16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112088s16;
            if (_local_2 !== _arg_1)
            {
                this._112088s16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s16", _local_2, _arg_1));
            };
        }

        public function set s17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112089s17;
            if (_local_2 !== _arg_1)
            {
                this._112089s17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s17", _local_2, _arg_1));
            };
        }

        public function set s19(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112091s19;
            if (_local_2 !== _arg_1)
            {
                this._112091s19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s19", _local_2, _arg_1));
            };
        }

        public function __s22_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function setNum():void
        {
            var _local_2:ItemSlot;
            var _local_3:Object;
            var _local_1:int = 1;
            while (_local_1 <= _quickSkillSize)
            {
                _local_2 = this[("s" + _local_1)];
                if (_local_2.type == GamePredef.TBL_ITEM_TEMPLATE)
                {
                    _local_3 = _core.getItemNum(_local_2.type, _local_2.giid);
                    _local_2.stackNum = _local_3.num;
                    _local_2.alpha = ((_local_3.num <= 0) ? 0.5 : 1);
                }
                else
                {
                    _local_2.alpha = 0.5;
                };
                _local_1++;
            };
        }

        private function _UserBarCanvas_SetProperty24_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty24 = _local_1;
            _local_1.name = "visible";
            _local_1.value = false;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty24", _UserBarCanvas_SetProperty24);
            return (_local_1);
        }

        public function __s17_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s12():ItemSlot
        {
            return (this._112084s12);
        }

        public function initView():void
        {
            var _local_3:ItemSlot;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:String;
            var _local_9:int;
            _core = Core.getInstance();
            btnContainer.visible = GamePredef.GLOBAL_SETTING.au;
            btn.selected = btnContainer.visible;
            var _local_1:int = 1;
            while (_local_1 <= _quickSkillSize)
            {
                _local_3 = this[("s" + _local_1)];
                _local_4 = GamePredef.GLOBAL_SETTING[("st" + _local_1)];
                _local_5 = GamePredef.GLOBAL_SETTING[("sid" + _local_1)];
                if (_local_4 == GamePredef.TBL_SKILL)
                {
                    if (_core.player.awakenPointDict)
                    {
                        _local_6 = _core.player.awakenPointDict;
                        _local_7 = GameData.d[GamePredef.TBL_SKILL][_local_5];
                        if (((_local_7) && (_local_6[_local_7.codeName])))
                        {
                            _local_8 = _local_7.codeName;
                            _local_9 = int(_local_6[_local_8]);
                            if (int(_local_7[("exSid" + _local_9)]) > 0)
                            {
                                _local_5 = _local_7[("exSid" + _local_9)];
                            };
                        };
                    };
                };
                _local_3.type = _local_4;
                _local_3.giid = _local_5;
                _local_3.addEventListener(Slot.EVENT_SLOT_DCLICK, useSlotByClick);
                _local_3.toolTip = ((_local_3.giid <= 0) ? Language.USERBARCANVAS_S[2] : null);
                _local_1++;
            };
            abc.initLock();
            setTimeout(setNum, 2000);
            this.currentState = "normal";
            var _local_2:int = int(barNum.text);
            this[("bar" + _local_2)].visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get s14():ItemSlot
        {
            return (this._112086s14);
        }

        [Bindable(event="propertyChange")]
        public function get s16():ItemSlot
        {
            return (this._112088s16);
        }

        [Bindable(event="propertyChange")]
        public function get s10():ItemSlot
        {
            return (this._112082s10);
        }

        public function __s14_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __s21_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __s5_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s18():ItemSlot
        {
            return (this._112090s18);
        }

        private function _UserBarCanvas_SetProperty12_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty12 = _local_1;
            _local_1.name = "y";
            _local_1.value = 54;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty12", _UserBarCanvas_SetProperty12);
            return (_local_1);
        }

        private function _UserBarCanvas_SetProperty4_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _UserBarCanvas_SetProperty4 = _local_1;
            _local_1.name = "visible";
            _local_1.value = true;
            BindingManager.executeBindings(this, "_UserBarCanvas_SetProperty4", _UserBarCanvas_SetProperty4);
            return (_local_1);
        }

        public function __s1_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s17():ItemSlot
        {
            return (this._112089s17);
        }

        [Bindable(event="propertyChange")]
        public function get s19():ItemSlot
        {
            return (this._112091s19);
        }

        [Bindable(event="propertyChange")]
        public function get s11():ItemSlot
        {
            return (this._112083s11);
        }

        public function __s9_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s15():ItemSlot
        {
            return (this._112087s15);
        }

        public function __s10_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s21():ItemSlot
        {
            return (this._112114s21);
        }

        public function set s21(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112114s21;
            if (_local_2 !== _arg_1)
            {
                this._112114s21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s21", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s23():ItemSlot
        {
            return (this._112116s23);
        }

        public function set s22(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112115s22;
            if (_local_2 !== _arg_1)
            {
                this._112115s22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s22", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s13():ItemSlot
        {
            return (this._112085s13);
        }

        [Bindable(event="propertyChange")]
        public function get s20():ItemSlot
        {
            return (this._112113s20);
        }

        public function set s24(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112117s24;
            if (_local_2 !== _arg_1)
            {
                this._112117s24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s24", _local_2, _arg_1));
            };
        }

        public function set s20(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112113s20;
            if (_local_2 !== _arg_1)
            {
                this._112113s20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s20", _local_2, _arg_1));
            };
        }

        public function set s25(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._112118s25;
            if (_local_2 !== _arg_1)
            {
                this._112118s25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s25", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s24():ItemSlot
        {
            return (this._112117s24);
        }

        public function __s25_mouseDown(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get s27():ItemSlot
        {
            return (this._112120s27);
        }


    }
}//package com.qeedoo.ui.view.compMain

