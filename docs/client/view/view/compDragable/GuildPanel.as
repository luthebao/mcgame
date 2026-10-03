// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GuildPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ColoredBackgroundDataGrid;
    import mx.containers.HBox;
    import mx.containers.Canvas;
    import mx.controls.CheckBox;
    import mx.controls.TextInput;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.TextArea;
    import mx.controls.ComboBox;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.RoundedButton;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.events.ListEvent;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.binding.Binding;
    import mx.core.IUITextField;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import mx.events.DataGridEvent;
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

    public class GuildPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const PAGE_MAX_ITEM_NUM:int = 11;
        private var _1341543168memberGrid:ColoredBackgroundDataGrid;
        private var _881418178tabBar:HBox;
        public var _GuildPanel_Canvas1:Canvas;
        private var _549292407canDel2:CheckBox;
        public var _GuildPanel_Canvas4:Canvas;
        public var _GuildPanel_Canvas5:Canvas;
        public var _GuildPanel_Canvas6:Canvas;
        public var _GuildPanel_Canvas7:Canvas;
        private var _104584971name6:TextInput;
        private var _710472971searchText:TextInput;
        private var applyAc:ArrayCollection;
        private var guildListUpdated:* = false;
        private var _24161407canQuest3:CheckBox;
        private var _1563800885guildSlotNum:RoundedLabel;
        private var _104584967name2:TextInput;
        private var _2076042284applyGrid:DataGrid;
        public var _GuildPanel_DataGridColumn1:DataGridColumn;
        public var _GuildPanel_DataGridColumn2:DataGridColumn;
        public var _GuildPanel_DataGridColumn3:DataGridColumn;
        public var _GuildPanel_DataGridColumn4:DataGridColumn;
        public var _GuildPanel_DataGridColumn5:DataGridColumn;
        public var _GuildPanel_DataGridColumn6:DataGridColumn;
        public var _GuildPanel_DataGridColumn7:DataGridColumn;
        public var _GuildPanel_DataGridColumn8:DataGridColumn;
        public var _GuildPanel_DataGridColumn9:DataGridColumn;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _146922665canInfo5:CheckBox;
        private var _549201826canAdd3:CheckBox;
        public var selfGuildMemberData:Object;
        private var _137738233canSlot5:CheckBox;
        public var _GuildPanel_BasicGlowButton4:BasicGlowButton;
        public var _GuildPanel_BasicGlowButton5:BasicGlowButton;
        public var _GuildPanel_BasicGlowButton1:BasicGlowButton;
        private var addMemberData:Object;
        private var lastUpdateMemberTime:Number = 0;
        private var _549292408canDel3:CheckBox;
        private var _637124376canDeleteGuild:Boolean = false;
        private var _41312720titleCanvas:BasicTitleCanvas;
        private var _549292410canDel5:CheckBox;
        private var _24161404canQuest6:CheckBox;
        private var _151317969canDuty5:CheckBox;
        private var _151317972canDuty2:CheckBox;
        private var _104584968name3:TextInput;
        private var applyList:Array;
        private var _447179019myGuildInfo:TextArea;
        private var _1654542610monthCombo:ComboBox;
        public var _GuildPanel_RoundedLabel10:RoundedLabel;
        public var _GuildPanel_RoundedLabel11:RoundedLabel;
        public var _GuildPanel_RoundedLabel12:RoundedLabel;
        private var UPDATE_GUILD_MEMBER_INTERVAL:int = 30000;
        private var _24161408canQuest2:CheckBox;
        private var desc_memberNumber:Boolean = true;
        public var _GuildPanel_RoundedLabel22:RoundedLabel;
        public var _GuildPanel_RoundedLabel23:RoundedLabel;
        public var _GuildPanel_RoundedLabel24:RoundedLabel;
        public var _GuildPanel_RoundedLabel26:RoundedLabel;
        public var _GuildPanel_RoundedLabel27:RoundedLabel;
        public var _GuildPanel_RoundedLabel28:RoundedLabel;
        public var _GuildPanel_RoundedLabel29:RoundedLabel;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var desc_id:Boolean = true;
        public var _GuildPanel_RoundedLabel30:RoundedLabel;
        public var _GuildPanel_RoundedLabel31:RoundedLabel;
        public var _GuildPanel_RoundedLabel32:RoundedLabel;
        public var _GuildPanel_RoundedLabel33:RoundedLabel;
        public var _GuildPanel_RoundedLabel34:RoundedLabel;
        public var _GuildPanel_RoundedLabel35:RoundedLabel;
        public var _GuildPanel_RoundedLabel36:RoundedLabel;
        public var _GuildPanel_RoundedLabel37:RoundedLabel;
        public var _GuildPanel_RoundedLabel38:RoundedLabel;
        public var _GuildPanel_RoundedLabel39:RoundedLabel;
        private var _549201827canAdd4:CheckBox;
        private var desc_leaderName:Boolean = true;
        private var _146922668canInfo2:CheckBox;
        private var _840150678settingRankInfo:RoundedLabel;
        public var _GuildPanel_RoundedLabel40:RoundedLabel;
        private var _146922664canInfo6:CheckBox;
        public var myGuild:Object;
        private var newLeaderId:String;
        private var _104584969name4:TextInput;
        public var skillDevData:Object = null;
        private var _1848702503guildGrid:DataGrid;
        private var _549292409canDel4:CheckBox;
        private var _549292411canDel6:CheckBox;
        private var _137738232canSlot6:CheckBox;
        private var _137738236canSlot2:CheckBox;
        private var _151317968canDuty6:CheckBox;
        private var _164888176myGuildLeader:RoundedLabel;
        public var _GuildPanel_TextArea2:TextArea;
        private var _151317971canDuty3:CheckBox;
        private var _24161405canQuest5:CheckBox;
        private var _447042350myGuildName:RoundedLabel;
        public var _GuildPanel_RoundedLabel4:RoundedLabel;
        public var _GuildPanel_RoundedLabel5:RoundedLabel;
        public var _GuildPanel_RoundedLabel6:RoundedLabel;
        public var _GuildPanel_RoundedLabel7:RoundedLabel;
        public var _GuildPanel_RoundedLabel8:RoundedLabel;
        public var _GuildPanel_RoundedLabel9:RoundedLabel;
        private var memberList:Object;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _2088152754noGuild:Canvas;
        private var _1068679758normalContrib:RoundedLabel;
        private var _549201828canAdd5:CheckBox;
        private var _146922667canInfo3:CheckBox;
        private var firstTimeFlag:int = 0;
        private var _118704505hasGuild:Canvas;
        private var _1550462972deleteG:BasicGlowButton;
        private var guildRank:Object;
        private var _137738235canSlot3:CheckBox;
        private var _1554141555tabBtn4:BasicGlowButton;
        private var _124463890settingRankButton:BasicGlowButton;
        private var myGuildMemberAC:ArrayCollection;
        public var _GuildPanel_DataGridColumn10:DataGridColumn;
        public var _GuildPanel_DataGridColumn11:DataGridColumn;
        public var _GuildPanel_DataGridColumn12:DataGridColumn;
        public var _GuildPanel_DataGridColumn13:DataGridColumn;
        public var _GuildPanel_DataGridColumn14:DataGridColumn;
        public var _GuildPanel_DataGridColumn15:DataGridColumn;
        private var _151317970canDuty4:CheckBox;
        private var newMemberData:Object;
        private var _770250966donateContrib:RoundedLabel;
        private var _1306563286guildExp:RoundedLabel;
        public var guildList:Object;
        private var _24161406canQuest4:CheckBox;
        private var _1306549598guildTab:ViewStack;
        private var _742881793changeNameBtn:RoundedButton;
        private var guildAC:ArrayCollection;
        private var _1469746035guildMoney:RoundedLabel;
        private var _549201829canAdd6:CheckBox;
        public var guildAR:Array;
        private var _104584970name5:TextInput;
        private var desc_name:Boolean = true;
        private var _1023362504canEditInfo:Boolean = false;
        private var _146922666canInfo4:CheckBox;
        private var guildMemberListUpdated:* = false;
        private var _107947992quitG:BasicGlowButton;
        private var _607339634pageSelector:PageSelector;
        private var _669642010memLimit:RoundedLabel;
        private var _1470959791guildLevel:RoundedLabel;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var _137738234canSlot4:CheckBox;
        private var _1126216770txtGuildID:RoundedLabel;
        private var _549201825canAdd2:CheckBox;
        private var _104584966name1:TextInput;
        private var _1077788303memNum:RoundedLabel;
        private var _1778179988searchBtn:BasicDelayButton;
        public var joinGuildFlag:int;
        private var myRank:Object;
        private var _1060501854myDuty:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":480,
                    "height":354,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"titleCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({"helpFunc":openGuildHelp});
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"guildTab",
                        "events":{"mouseMove":"__guildTab_mouseMove"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "60";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_GuildPanel_Canvas1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "autoLayout":true,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"hasGuild",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":267,
                                                                    "x":373
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"myGuildInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "solid";
                                                                this.backgroundAlpha = 0;
                                                                this.left = "37";
                                                                this.right = "57";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "height":59,
                                                                    "y":173
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"myGuildName",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":206,
                                                                    "y":19,
                                                                    "x":33.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"myGuildLeader",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":206,
                                                                    "y":43,
                                                                    "x":33.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"myDuty",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":197,
                                                                    "y":121,
                                                                    "x":33.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedButton,
                                                            "id":"changeNameBtn",
                                                            "events":{"click":"__changeNameBtn_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "x":420,
                                                                    "y":265,
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33.5,
                                                                    "y":69,
                                                                    "width":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":244,
                                                                    "y":19,
                                                                    "width":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":244,
                                                                    "y":69,
                                                                    "width":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":244,
                                                                    "y":95,
                                                                    "width":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33.5,
                                                                    "y":95,
                                                                    "width":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":244,
                                                                    "y":44,
                                                                    "width":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":244,
                                                                    "y":121,
                                                                    "width":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":244,
                                                                    "y":147,
                                                                    "width":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33.5,
                                                                    "y":147,
                                                                    "width":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"guildMoney",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":107,
                                                                    "y":72,
                                                                    "width":121.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"guildExp",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":310,
                                                                    "y":69,
                                                                    "width":121.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"guildSlotNum",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":107,
                                                                    "y":95,
                                                                    "width":121.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"memLimit",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":310,
                                                                    "y":95,
                                                                    "width":121.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"normalContrib",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":310,
                                                                    "y":121,
                                                                    "width":121.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"donateContrib",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":310,
                                                                    "y":147,
                                                                    "width":121.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"memNum",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":310,
                                                                    "y":44,
                                                                    "width":121.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"guildLevel",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":310,
                                                                    "y":19,
                                                                    "width":121.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"txtGuildID",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":107,
                                                                    "y":147,
                                                                    "width":121.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_GuildPanel_BasicGlowButton1",
                                                            "events":{"click":"___GuildPanel_BasicGlowButton1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33.5,
                                                                    "y":235,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"deleteG",
                                                            "events":{"click":"__deleteG_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":310,
                                                                    "y":235,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"quitG",
                                                            "events":{
                                                                "click":"__quitG_click",
                                                                "creationComplete":"__quitG_creationComplete"
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":310,
                                                                    "y":235,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"noGuild",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "visible":false,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_GuildPanel_BasicGlowButton4",
                                                            "events":{"click":"___GuildPanel_BasicGlowButton4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33.5,
                                                                    "y":50,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_GuildPanel_BasicGlowButton5",
                                                            "events":{"click":"___GuildPanel_BasicGlowButton5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33.5,
                                                                    "y":100,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel22",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":140,
                                                                    "y":53
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GuildPanel_RoundedLabel23",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":140,
                                                                    "y":103
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"_GuildPanel_TextArea2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "37";
                                                                this.right = "57";
                                                                this.borderStyle = "none";
                                                                this.color = 0xFFFFFF;
                                                                this.backgroundAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":150,
                                                                    "editable":false
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
                                    "id":"_GuildPanel_Canvas4",
                                    "events":{"show":"___GuildPanel_Canvas4_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ColoredBackgroundDataGrid,
                                                "id":"memberGrid",
                                                "events":{"itemDoubleClick":"__memberGrid_itemDoubleClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "doubleClickEnabled":true,
                                                        "rowColorFunction":rowColors,
                                                        "columns":[_GuildPanel_DataGridColumn1_i(), _GuildPanel_DataGridColumn2_i(), _GuildPanel_DataGridColumn3_i(), _GuildPanel_DataGridColumn4_i(), _GuildPanel_DataGridColumn5_i(), _GuildPanel_DataGridColumn6_i(), _GuildPanel_DataGridColumn7_i()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel24",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":408.5,
                                                        "height":18,
                                                        "x":20
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_GuildPanel_Canvas5",
                                    "events":{"show":"___GuildPanel_Canvas5_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"guildGrid",
                                                "events":{"itemDoubleClick":"__guildGrid_itemDoubleClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "doubleClickEnabled":true,
                                                        "columns":[_GuildPanel_DataGridColumn8_i(), _GuildPanel_DataGridColumn9_i(), _GuildPanel_DataGridColumn10_i(), _GuildPanel_DataGridColumn11_i()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "7";
                                                    this.horizontalCenter = "0";
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_GuildPanel_Canvas6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"settingRankInfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "13.45";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":30,
                                                        "width":387.33334
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"settingRankButton",
                                                "events":{"click":"__settingRankButton_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":266.7,
                                                        "x":421.35,
                                                        "styleName":"BtnNormalRed",
                                                        "width":40,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel26",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26.7,
                                                        "y":27
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel27",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":130,
                                                        "y":27
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel28",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":264,
                                                        "y":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel29",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":294,
                                                        "y":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel30",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":324,
                                                        "y":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel31",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":354,
                                                        "y":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel32",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":384,
                                                        "y":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel33",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":414,
                                                        "y":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel34",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26.7,
                                                        "y":66.8
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel35",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26.7,
                                                        "y":96.8
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel36",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26.7,
                                                        "y":126.8
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel37",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26.7,
                                                        "y":156.8
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel38",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26.7,
                                                        "y":186.8
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel39",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26.7,
                                                        "y":216.8
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "selected":true,
                                                        "enabled":false,
                                                        "x":270,
                                                        "y":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "selected":true,
                                                        "enabled":false,
                                                        "x":300,
                                                        "y":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "selected":true,
                                                        "enabled":false,
                                                        "x":330,
                                                        "y":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "selected":true,
                                                        "enabled":false,
                                                        "x":360,
                                                        "y":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "selected":true,
                                                        "enabled":false,
                                                        "x":390,
                                                        "y":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "selected":true,
                                                        "enabled":false,
                                                        "x":420,
                                                        "y":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"name1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":98.05,
                                                        "y":65.8,
                                                        "width":130,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"name2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":98.05,
                                                        "y":95.8,
                                                        "width":130,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"name3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":98,
                                                        "y":125.8,
                                                        "width":130,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"name4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":98.05,
                                                        "y":155.8,
                                                        "width":130,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"name5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":98.05,
                                                        "y":185.8,
                                                        "width":130,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"name6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":98.05,
                                                        "y":215.8,
                                                        "width":130,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canAdd2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":270,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canQuest2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":300,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canSlot2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":330,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canInfo2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":360,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDel2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":390,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDuty2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":420,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canAdd3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":270,
                                                        "y":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canQuest3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":300,
                                                        "y":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canSlot3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":330,
                                                        "y":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canInfo3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":360,
                                                        "y":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDel3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":390,
                                                        "y":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDuty3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":420,
                                                        "y":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canAdd4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":270,
                                                        "y":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canQuest4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":300,
                                                        "y":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canSlot4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":330,
                                                        "y":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canInfo4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":360,
                                                        "y":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDel4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":390,
                                                        "y":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDuty4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":420,
                                                        "y":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canAdd5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":270,
                                                        "y":190
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canQuest5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":300,
                                                        "y":190
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canSlot5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":330,
                                                        "y":190
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canInfo5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":360,
                                                        "y":190
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDel5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":390,
                                                        "y":190
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDuty5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":420,
                                                        "y":190
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canAdd6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "enabled":false,
                                                        "x":270,
                                                        "y":220
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canQuest6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "enabled":false,
                                                        "x":300,
                                                        "y":220
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canSlot6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "enabled":false,
                                                        "x":330,
                                                        "y":220
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canInfo6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "enabled":false,
                                                        "x":360,
                                                        "y":220
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDel6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "enabled":false,
                                                        "x":390,
                                                        "y":220
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"canDuty6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "enabled":false,
                                                        "x":420,
                                                        "y":220
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_GuildPanel_Canvas7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"applyGrid",
                                                "events":{"itemDoubleClick":"__applyGrid_itemDoubleClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "doubleClickEnabled":true,
                                                        "columns":[_GuildPanel_DataGridColumn12_i(), _GuildPanel_DataGridColumn13_i(), _GuildPanel_DataGridColumn14_i(), _GuildPanel_DataGridColumn15_i()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GuildPanel_RoundedLabel40",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":408.5,
                                                        "height":18,
                                                        "x":20
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"tabBar",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":40,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":42.6,
                                            "height":20.5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":42.6,
                                            "height":20.5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":42.6,
                                            "height":20.5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn4",
                                    "events":{"click":"__tabBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":60,
                                            "height":20.5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":42.6,
                                            "height":20.5
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ComboBox,
                        "id":"monthCombo",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.fontWeight = "normal";
                            this.color = 16515000;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "labelField":"label",
                                "x":260,
                                "y":38,
                                "width":65,
                                "height":22
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"searchText",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "true";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "x":327,
                                "y":38,
                                "width":100,
                                "height":21.5,
                                "text":""
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"searchBtn",
                        "events":{"click":"__searchBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":5000,
                                "visible":false,
                                "width":30,
                                "styleName":"BtnStdRed",
                                "x":429,
                                "y":37.5
                            });
                        }
                    })]
                });
            }
        });
        private var _792913466pageGuildAC:ArrayCollection = new ArrayCollection();
        private var skillDataProvider:ArrayCollection = new ArrayCollection();
        private var _1848510178guildName:String = GamePredef.GUILD_GUILDNAME;
        private var _1644260060guildLeader:String = GamePredef.GUILD_LEADERNAME;
        private var _1848788631guildDuty:String = GamePredef.GUILD_MYDUTY;
        private var _dm:DataManager = DataManager.getInstance();
        private var _core:Core = Core.getInstance();
        private var monthsList:Array = [{
            "label":"Sổ bang",
            "data":0
        }, {
            "label":"Tên bang",
            "data":1
        }];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GuildPanel()
        {
            mx_internal::_document = this;
            this.width = 480;
            this.height = 354;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuildPanel._watcherSetupUtil = _arg_1;
        }


        public function set changeNameBtn(_arg_1:RoundedButton):void
        {
            var _local_2:Object = this._742881793changeNameBtn;
            if (_local_2 !== _arg_1)
            {
                this._742881793changeNameBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeNameBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canSlot4():CheckBox
        {
            return (this._137738234canSlot4);
        }

        public function set canSlot2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._137738236canSlot2;
            if (_local_2 !== _arg_1)
            {
                this._137738236canSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canSlot2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canSlot2():CheckBox
        {
            return (this._137738236canSlot2);
        }

        public function set canSlot3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._137738235canSlot3;
            if (_local_2 !== _arg_1)
            {
                this._137738235canSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canSlot3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canSlot5():CheckBox
        {
            return (this._137738233canSlot5);
        }

        private function _GuildPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "normalContrib";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn7", _GuildPanel_DataGridColumn7);
            return (_local_1);
        }

        private function setNormalGuildInfoView():void
        {
            var _local_2:*;
            hasGuild.visible = true;
            noGuild.visible = false;
            if (ToolKit.isEqual(selfGuildMemberData.rank, 1))
            {
                canDeleteGuild = true;
            }
            else
            {
                canDeleteGuild = false;
            };
            if (ToolKit.isEqual(myRank.canInfo, 1))
            {
                canEditInfo = true;
            }
            else
            {
                canEditInfo = false;
            };
            guildName = ((GamePredef.GUILD_GUILDNAME + "   ") + myGuild.name);
            guildLeader = ((GamePredef.GUILD_LEADERNAME + "   ") + myGuild.ln);
            myGuildInfo.htmlText = (Language.GUILDPANEL_S[0] + myGuild.guildInfo);
            guildDuty = ((GamePredef.GUILD_MYDUTY + "   ") + myRank.name);
            guildMoney.text = myGuild.money;
            guildExp.text = myGuild.exp;
            guildSlotNum.text = myGuild.bagSlotNum;
            memLimit.text = myGuild.memLimit;
            normalContrib.text = selfGuildMemberData.normalContrib;
            donateContrib.text = selfGuildMemberData.donateContrib;
            if (normalContrib.text == "NaN")
            {
                normalContrib.text = "0";
            };
            if (donateContrib.text == "NaN")
            {
                donateContrib.text = "0";
            };
            guildLevel.text = myGuild.level;
            var _local_1:Number = 0;
            for (_local_2 in this.memberList)
            {
                if (memberList[_local_2] != null)
                {
                    _local_1++;
                };
            };
            if (guildList != null)
            {
                this.guildList[selfGuildMemberData.gid]["memberNumber"] = _local_1;
                guildListUpdated = true;
            };
            memNum.text = _local_1.toString();
            txtGuildID.text = myGuild.id;
        }

        public function set canSlot6(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._137738232canSlot6;
            if (_local_2 !== _arg_1)
            {
                this._137738232canSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canSlot6", _local_2, _arg_1));
            };
        }

        public function ___GuildPanel_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            tabClick(2);
        }

        public function set canSlot4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._137738234canSlot4;
            if (_local_2 !== _arg_1)
            {
                this._137738234canSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canSlot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canSlot3():CheckBox
        {
            return (this._137738235canSlot3);
        }

        public function onUpdateGuildRank(_arg_1:int, _arg_2:Object):void
        {
            var _local_3:Object;
            if (selfGuildMemberData)
            {
                if (selfGuildMemberData.gid == _arg_1)
                {
                    for each (_local_3 in guildRank)
                    {
                        if (_local_3.rank > 1)
                        {
                            _local_3.canAdd = _arg_2[("canAdd" + _local_3.rank)];
                            _local_3.canQuest = _arg_2[("canQuest" + _local_3.rank)];
                            _local_3.canSlot = _arg_2[("canSlot" + _local_3.rank)];
                            _local_3.canInfo = _arg_2[("canInfo" + _local_3.rank)];
                            _local_3.canDel = _arg_2[("canDel" + _local_3.rank)];
                            _local_3.canDuty = _arg_2[("canDuty" + _local_3.rank)];
                        };
                        _local_3.name = _arg_2[("name" + _local_3.rank)];
                        if (ToolKit.isEqual(_local_3.rank, myRank.rank))
                        {
                            myRank = _local_3;
                        };
                    };
                    updateView();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get canSlot6():CheckBox
        {
            return (this._137738232canSlot6);
        }

        public function set canSlot5(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._137738233canSlot5;
            if (_local_2 !== _arg_1)
            {
                this._137738233canSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canSlot5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBar():HBox
        {
            return (this._881418178tabBar);
        }

        public function onUpdateGuildProperty(_arg_1:Object):*
        {
            var _local_2:*;
            if (myGuild == null)
            {
                return;
            };
            for (_local_2 in _arg_1)
            {
                myGuild[_local_2] = _arg_1[_local_2];
            };
            updateGuildInfoView();
        }

        private function _GuildPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "donateContrib";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn6", _GuildPanel_DataGridColumn6);
            return (_local_1);
        }

        public function set canDuty2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._151317972canDuty2;
            if (_local_2 !== _arg_1)
            {
                this._151317972canDuty2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDuty2", _local_2, _arg_1));
            };
        }

        public function set canDuty3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._151317971canDuty3;
            if (_local_2 !== _arg_1)
            {
                this._151317971canDuty3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDuty3", _local_2, _arg_1));
            };
        }

        public function set canDuty4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._151317970canDuty4;
            if (_local_2 !== _arg_1)
            {
                this._151317970canDuty4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDuty4", _local_2, _arg_1));
            };
        }

        public function set canDuty5(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._151317969canDuty5;
            if (_local_2 !== _arg_1)
            {
                this._151317969canDuty5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDuty5", _local_2, _arg_1));
            };
        }

        public function onInitGuildList(_arg_1:Object):*
        {
            if (_arg_1)
            {
                this.guildList = _arg_1;
                updateGuildListView();
            };
        }

        private function memberGridClick():void
        {
            var _local_3:Object;
            var _local_1:Number = memberGrid.selectedItem.rank;
            var _local_2:Array = new Array();
            if (_core.player.id != memberGrid.selectedItem.id)
            {
                _local_2.push({"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}, {"label":GamePredef.MENU_ADDF});
                if ((((myRank.canDuty == 1) && (!(memberGrid.selectedItem.rank == -1))) && (!(memberGrid.selectedItem.rank == 1))))
                {
                    _local_2.push({"type":"separator"});
                    for each (_local_3 in guildRank)
                    {
                        if (_local_3.rank > 1)
                        {
                            _local_2.push({
                                "label":(GamePredef.GUILD_DUTY + _local_3.name),
                                "rank":_local_3.rank
                            });
                        };
                    };
                };
                if ((((!(memberGrid.selectedItem.rank == -1)) && (!(memberGrid.selectedItem.rank == 1))) && (myRank.canDel == 1)))
                {
                    _local_2.push({"type":"separator"}, {"label":GamePredef.GUILD_KICK});
                };
                if ((((!(memberGrid.selectedItem.rank == -1)) && (selfGuildMemberData.rank == 1)) && (_core.player.id == myGuild.cid)))
                {
                    _local_2.push({"type":"separator"}, {"label":GamePredef.GUILD_DEMISE});
                };
                menuPop(_local_2, menuClickHandler);
            };
        }

        public function ___GuildPanel_Canvas5_show(_arg_1:FlexEvent):void
        {
            showGuildList();
        }

        public function set canDuty6(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._151317968canDuty6;
            if (_local_2 !== _arg_1)
            {
                this._151317968canDuty6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDuty6", _local_2, _arg_1));
            };
        }

        private function menuPop(_arg_1:Array, _arg_2:Function):void
        {
            var _local_3:Menu = CustomMenu.createMenu(null, _arg_1);
            _local_3.show(stage.mouseX, stage.mouseY);
            _local_3.addEventListener(MenuEvent.ITEM_CLICK, _arg_2);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        private function setNoGuildInfoView():void
        {
            hasGuild.visible = false;
            noGuild.visible = true;
        }

        private function _GuildPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "status";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn5", _GuildPanel_DataGridColumn5);
            return (_local_1);
        }

        public function set tabBar(_arg_1:HBox):void
        {
            var _local_2:Object = this._881418178tabBar;
            if (_local_2 !== _arg_1)
            {
                this._881418178tabBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBar", _local_2, _arg_1));
            };
        }

        public function showContribPanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_GUILDCONTRIB);
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_BAG);
            if (!_local_1.visible)
            {
                _local_1.show();
                _local_2.show();
                _local_2.startFollow(_local_1);
            }
            else
            {
                if (!_local_2.visible)
                {
                    _local_2.show();
                };
                _local_2.startFollow(_local_1);
            };
        }

        public function onUpdateGuildInfo(_arg_1:Object):void
        {
            myGuild = _arg_1;
            _core.player.guild = _arg_1;
            updateGuildInfoView();
            if (ToolKit.isEqual(_arg_1.updateType, 2))
            {
                _core.view.getUI(ViewManager.PANEL_GUILDWAREHOUSE).updateView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get guildMoney():RoundedLabel
        {
            return (this._1469746035guildMoney);
        }

        public function __guildTab_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        private function showGuildList():*
        {
            if (guildList == null)
            {
                _core.remote.initGuildList();
            }
            else
            {
                if (guildListUpdated)
                {
                    updateGuildListView();
                };
            };
        }

        private function guildBagSlotUp():void
        {
            if (checkIfLeader() == false)
            {
                Alert.show(Language.GUILDPANEL_U[14], "");
                return;
            };
            _core.remote.call("addGuildBankSlotNum", null, myGuild.id);
        }

        public function updateButtonBar():void
        {
        }

        public function updateGuildMemberView():void
        {
            var _local_1:*;
            var _local_2:Sort;
            var _local_3:String;
            var _local_4:String;
            var _local_5:int;
            var _local_6:Array;
            var _local_7:String;
            var _local_8:Object;
            myGuildMemberAC = new ArrayCollection();
            myGuildMemberAC.removeAll();
            if (((!(selfGuildMemberData == null)) && (!(selfGuildMemberData.rank == -1))))
            {
                if (myGuild == null)
                {
                    return;
                };
                for each (_local_1 in memberList)
                {
                    if (((!(_local_1 == undefined)) && (!(_local_1 == null))))
                    {
                        _local_3 = new String();
                        _local_4 = new String();
                        _local_5 = 6;
                        if (_local_1.rank != -1)
                        {
                            for each (_local_8 in guildRank)
                            {
                                if (_local_8.rank == _local_1.rank)
                                {
                                    _local_4 = _local_8.name;
                                    _local_5 = _local_1.rank;
                                    break;
                                };
                            };
                            if (_local_1.status)
                            {
                                _local_3 = GamePredef.GUILD_ONLINE;
                            }
                            else
                            {
                                _local_3 = GamePredef.GUILD_OFFLINE;
                            };
                            _local_6 = String(_local_1.note).split("|");
                            _local_7 = "";
                            if (_local_6[1])
                            {
                                _local_7 = _core.data.getGameDataList(GamePredef.TBL_CLASS)[_local_6[1]].name;
                            };
                            if (!_local_1.normalContrib)
                            {
                                _local_1.normalContrib = 0;
                            };
                            if (!_local_1.donateContrib)
                            {
                                _local_1.donateContrib = 0;
                            };
                            myGuildMemberAC.addItem({
                                "tableId":_local_1.id,
                                "id":_local_1.cid,
                                "sort1":_local_5,
                                "name":_local_6[0],
                                "rank":_local_1.rank,
                                "duty":_local_4,
                                "memberClass":_local_7,
                                "level":_core.basic.expToLevel(_local_6[2]),
                                "status":_local_3,
                                "normalContrib":Number(_local_1.normalContrib),
                                "donateContrib":Number(_local_1.donateContrib)
                            });
                        };
                    };
                };
                _local_2 = new Sort();
                _local_2.fields = [new SortField("sort1", true, false), new SortField("level", true, true, true)];
                myGuildMemberAC.sort = _local_2;
                myGuildMemberAC.refresh();
            }
            else
            {
                if (((selfGuildMemberData == (!(null))) && (selfGuildMemberData.rank == -1)))
                {
                    myGuildMemberAC.refresh();
                };
            };
            memberGrid.dataProvider = myGuildMemberAC;
            memberGrid.validateNow();
            guildMemberListUpdated = false;
        }

        private function _GuildPanel_DataGridColumn15_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn15 = _local_1;
            _local_1.dataField = "status";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn15", _GuildPanel_DataGridColumn15);
            return (_local_1);
        }

        private function initPageSelector():void
        {
            var _local_1:int;
            if (guildAC.length >= PAGE_MAX_ITEM_NUM)
            {
                _local_1 = PAGE_MAX_ITEM_NUM;
            }
            else
            {
                _local_1 = guildAC.length;
            };
            var _local_2:int;
            while (_local_2 < _local_1)
            {
                pageGuildAC.addItem(guildAC.getItemAt(_local_2));
                _local_2++;
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(guildAC.length, PAGE_MAX_ITEM_NUM);
        }

        public function ___GuildPanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            _core.view.getUI(ViewManager.PANEL_ADDGUILD).visible = true;
        }

        private function _GuildPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "level";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn4", _GuildPanel_DataGridColumn4);
            return (_local_1);
        }

        private function getGuildSkillList():ArrayCollection
        {
            var _local_3:*;
            var _local_1:Object = DataManager.getInstance().gameDataIndex3[GamePredef.TBL_SKILL][4];
            var _local_2:ArrayCollection = new ArrayCollection();
            for (_local_3 in _local_1)
            {
                if (ToolKit.isEqual(_local_1[_local_3].level, 1))
                {
                    _local_2.addItem(_local_1[_local_3]);
                };
            };
            return (_local_2);
        }

        public function __applyGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            applyGridClick();
        }

        public function __guildGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            guildGridClick();
        }

        public function onAddGuildMember(_arg_1:Object):void
        {
            if (_arg_1.cid == _core.player.id)
            {
                joinGuildFlag = 0;
                initView();
            }
            else
            {
                if (selfGuildMemberData)
                {
                    if (_arg_1.gid == selfGuildMemberData.gid)
                    {
                        memberList[_arg_1.id] = _arg_1;
                        applyList.push(_arg_1);
                        updateView();
                        guildMemberListUpdated = true;
                    };
                };
            };
        }

        private function joinGuild(_arg_1:Number):void
        {
            var _local_2:* = "";
            if (joinGuildFlag == 1)
            {
                Alert.show(Language.GUILDPANEL_S[8], "", Alert.OK);
                return;
            };
            if (selfGuildMemberData == null)
            {
                addMemberData = {"gid":_arg_1};
                _local_2 = Language.GUILDPANEL_S[9];
                _local_2 = _local_2.replace("{name}", guildGrid.selectedItem.name);
                Alert.show(_local_2, "", 3, this, addGuildMember);
            }
            else
            {
                Alert.show(GamePredef.GUILD_ONLYONE, "", Alert.OK);
            };
        }

        [Bindable(event="propertyChange")]
        public function get myGuildName():RoundedLabel
        {
            return (this._447042350myGuildName);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:Number;
            super.visible = _arg_1;
            if (((_arg_1) && (!(firstTimeFlag == 0))))
            {
                _local_2 = (new Date().getTime() - lastUpdateMemberTime);
                if (_local_2 > UPDATE_GUILD_MEMBER_INTERVAL)
                {
                    _core.remote.call("getGuildMemberList", new Responder(onGetGuildMember));
                    lastUpdateMemberTime = new Date().getTime();
                };
            };
            if (((_arg_1) && (firstTimeFlag == 0)))
            {
                initView();
                firstTimeFlag = 1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get settingRankButton():BasicGlowButton
        {
            return (this._124463890settingRankButton);
        }

        private function _GuildPanel_DataGridColumn14_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn14 = _local_1;
            _local_1.dataField = "level";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn14", _GuildPanel_DataGridColumn14);
            return (_local_1);
        }

        public function updateRankView():void
        {
            guildSetting();
        }

        private function _GuildPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "memberClass";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn3", _GuildPanel_DataGridColumn3);
            return (_local_1);
        }

        private function addGuildMember(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                if (ToolKit.isBigOrEqual(Number(_core.player.level), 30))
                {
                    joinGuildFlag = 1;
                };
                _core.remote.addGuildMember(addMemberData);
            };
        }

        [Bindable(event="propertyChange")]
        public function get memberGrid():ColoredBackgroundDataGrid
        {
            return (this._1341543168memberGrid);
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function set tabBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        public function set guildMoney(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1469746035guildMoney;
            if (_local_2 !== _arg_1)
            {
                this._1469746035guildMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildMoney", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get guildName():String
        {
            return (this._1848510178guildName);
        }

        public function set tabBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141555tabBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1554141555tabBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn4", _local_2, _arg_1));
            };
        }

        public function guildFull():void
        {
            _core.sysMsg(Language.GUILDPANEL_S[10]);
            joinGuildFlag = 0;
        }

        [Bindable(event="propertyChange")]
        public function get guildExp():RoundedLabel
        {
            return (this._1306563286guildExp);
        }

        [Bindable(event="propertyChange")]
        public function get guildSlotNum():RoundedLabel
        {
            return (this._1563800885guildSlotNum);
        }

        public function __searchBtn_click(_arg_1:MouseEvent):void
        {
            searchGuild();
        }

        private function _GuildPanel_DataGridColumn13_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn13 = _local_1;
            _local_1.dataField = "memberClass";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn13", _GuildPanel_DataGridColumn13);
            return (_local_1);
        }

        public function onUpdateGuild(_arg_1:int, _arg_2:String, _arg_3:String):void
        {
            var _local_4:*;
            if (guildList != null)
            {
                for each (_local_4 in guildList)
                {
                    if (((_local_4) && (_local_4.id == _arg_1)))
                    {
                        _local_4[_arg_2] = _arg_3;
                    };
                };
                guildListUpdated = true;
            };
            if (_arg_2 == "name")
            {
                myGuild.name = _arg_3;
                changeNameBtn.visible = false;
            };
            updateView();
        }

        public function reset():void
        {
            var _local_1:int;
            if (initialized)
            {
                selfGuildMemberData = null;
                guildAC = null;
                myGuildMemberAC = null;
                myGuild = null;
                myRank = null;
                guildRank = null;
                memberList = null;
                firstTimeFlag = 0;
                guildListUpdated = false;
                guildMemberListUpdated = false;
                joinGuildFlag = 0;
                memberGrid.dataProvider = null;
                guildList = null;
                _local_1 = 2;
                while (_local_1 < 6)
                {
                    this[("canAdd" + _local_1)].selected = false;
                    this[("canQuest" + _local_1)].selected = false;
                    this[("canSlot" + _local_1)].selected = false;
                    this[("canInfo" + _local_1)].selected = false;
                    this[("canDel" + _local_1)].selected = false;
                    this[("canDuty" + _local_1)].selected = false;
                    _local_1++;
                };
            };
        }

        public function set guildTab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1306549598guildTab;
            if (_local_2 !== _arg_1)
            {
                this._1306549598guildTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildTab", _local_2, _arg_1));
            };
        }

        private function _GuildPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "duty";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn2", _GuildPanel_DataGridColumn2);
            return (_local_1);
        }

        public function set noGuild(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2088152754noGuild;
            if (_local_2 !== _arg_1)
            {
                this._2088152754noGuild = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noGuild", _local_2, _arg_1));
            };
        }

        public function set myDuty(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1060501854myDuty;
            if (_local_2 !== _arg_1)
            {
                this._1060501854myDuty = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myDuty", _local_2, _arg_1));
            };
        }

        public function updateGuildApplyListView():void
        {
            var _local_1:*;
            var _local_2:Object;
            var _local_3:Array;
            var _local_4:*;
            var _local_5:String;
            if (((myRank == null) || (!(myRank.canAdd == 1))))
            {
                return;
            };
            if (applyAc == null)
            {
                applyAc = new ArrayCollection();
            }
            else
            {
                applyAc.removeAll();
            };
            for (_local_1 in applyList)
            {
                _local_2 = applyList[_local_1];
                _local_3 = _local_2.note.split("|");
                _local_4 = _core.data.getGameDataList(GamePredef.TBL_CLASS)[_local_3[1]].name;
                _local_5 = null;
                if (_local_2.status)
                {
                    _local_5 = GamePredef.GUILD_ONLINE;
                }
                else
                {
                    _local_5 = GamePredef.GUILD_OFFLINE;
                };
                applyAc.addItem({
                    "tableId":_local_2.id,
                    "id":_local_2.cid,
                    "name":_local_3[0],
                    "memberClass":_local_4,
                    "level":_core.basic.expToLevel(_local_3[2]),
                    "status":_local_5
                });
            };
            applyGrid.dataProvider = applyAc;
        }

        [Bindable(event="propertyChange")]
        private function get guildDuty():String
        {
            return (this._1848788631guildDuty);
        }

        [Bindable(event="propertyChange")]
        public function get settingRankInfo():RoundedLabel
        {
            return (this._840150678settingRankInfo);
        }

        [Bindable(event="propertyChange")]
        public function get canDel4():CheckBox
        {
            return (this._549292409canDel4);
        }

        [Bindable(event="propertyChange")]
        public function get canDel3():CheckBox
        {
            return (this._549292408canDel3);
        }

        private function _GuildPanel_DataGridColumn12_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn12 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn12", _GuildPanel_DataGridColumn12);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get canDel5():CheckBox
        {
            return (this._549292410canDel5);
        }

        [Bindable(event="propertyChange")]
        public function get canDel6():CheckBox
        {
            return (this._549292411canDel6);
        }

        private function _GuildPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn1", _GuildPanel_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get hasGuild():Canvas
        {
            return (this._118704505hasGuild);
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabClick(4);
        }

        [Bindable(event="propertyChange")]
        public function get canDel2():CheckBox
        {
            return (this._549292407canDel2);
        }

        [Bindable(event="propertyChange")]
        public function get myGuildLeader():RoundedLabel
        {
            return (this._164888176myGuildLeader);
        }

        private function btnEditInfoClick():void
        {
            var _local_1:InputPanel = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
            _local_1.showInput(Language.GUILDPANEL_S[12], Language.GUILDPANEL_S[13], editInfo);
        }

        public function set myGuildName(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._447042350myGuildName;
            if (_local_2 !== _arg_1)
            {
                this._447042350myGuildName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myGuildName", _local_2, _arg_1));
            };
        }

        private function checkIfLeader():Boolean
        {
            if (((selfGuildMemberData == null) || (myGuild == null)))
            {
                return (false);
            };
            return (ToolKit.isEqual(selfGuildMemberData.rank, 1));
        }

        public function showGuildWarehousePanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_GUILDWAREHOUSE);
            if (!_local_1.visible)
            {
                _local_1.show();
            };
        }

        [Bindable(event="propertyChange")]
        public function get memNum():RoundedLabel
        {
            return (this._1077788303memNum);
        }

        private function set guildLeader(_arg_1:String):void
        {
            var _local_2:Object = this._1644260060guildLeader;
            if (_local_2 !== _arg_1)
            {
                this._1644260060guildLeader = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildLeader", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get normalContrib():RoundedLabel
        {
            return (this._1068679758normalContrib);
        }

        public function __memberGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            memberGridClick();
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                pageGuildAC.addItem(guildAC.getItemAt(_local_3));
                _local_4++;
            };
        }

        public function onDelGuild(_arg_1:int):void
        {
            var _local_2:*;
            if (guildList != null)
            {
                for (_local_2 in guildList)
                {
                    if (guildList[_local_2].id == _arg_1)
                    {
                        delete guildList[_local_2];
                        break;
                    };
                };
                guildListUpdated = true;
            };
            if (((!(selfGuildMemberData == null)) && (ToolKit.isEqual(selfGuildMemberData.gid, _arg_1))))
            {
                Alert.show(Language.GUILDPANEL_U[24], "", Alert.OK);
                memberList = null;
                applyList = null;
                myRank = null;
                myGuild = null;
                _core.player.guild = null;
                selfGuildMemberData = null;
                _core.view.getUI(ViewManager.PANEL_GUILDWAREHOUSE).reset();
                guildMemberListUpdated = true;
            };
            updateView();
        }

        private function guildLevelUp():void
        {
            if (checkIfLeader() == false)
            {
                Alert.show(Language.GUILDPANEL_U[14], "");
                return;
            };
            _core.remote.call("guildLevelUp", null, myGuild.id);
        }

        [Bindable(event="propertyChange")]
        private function get pageGuildAC():ArrayCollection
        {
            return (this._792913466pageGuildAC);
        }

        private function setWaitGuildInfoView():void
        {
            guildName = (GamePredef.GUILD_GUILDNAME + myGuild.name);
            guildLeader = GamePredef.GUILD_ONCHECK;
            guildDuty = "";
            myGuildInfo.text = "";
            guildMoney.text = "";
            guildExp.text = "";
            guildSlotNum.text = "";
            memLimit.text = "";
            normalContrib.text = "";
            donateContrib.text = "";
            guildLevel.text = "";
            memNum.text = "";
            txtGuildID.text = "";
            hasGuild.visible = true;
            noGuild.visible = false;
            if (ToolKit.isEqual(selfGuildMemberData.rank, 1))
            {
                canDeleteGuild = true;
            }
            else
            {
                canDeleteGuild = false;
            };
            if (((myRank) && (ToolKit.isEqual(myRank.canInfo, 1))))
            {
                canEditInfo = true;
            }
            else
            {
                canEditInfo = false;
            };
        }

        private function editInfo(_arg_1:String):void
        {
            if (selfGuildMemberData)
            {
                _core.remote.updateGuildNotice(selfGuildMemberData.gid, _arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get guildGrid():DataGrid
        {
            return (this._1848702503guildGrid);
        }

        public function set monthCombo(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._1654542610monthCombo;
            if (_local_2 !== _arg_1)
            {
                this._1654542610monthCombo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monthCombo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get canEditInfo():Boolean
        {
            return (this._1023362504canEditInfo);
        }

        private function _GuildPanel_DataGridColumn11_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn11 = _local_1;
            _local_1.dataField = "memberNumber";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn11", _GuildPanel_DataGridColumn11);
            return (_local_1);
        }

        public function set settingRankButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._124463890settingRankButton;
            if (_local_2 !== _arg_1)
            {
                this._124463890settingRankButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "settingRankButton", _local_2, _arg_1));
            };
        }

        private function _GuildPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GUILDPANEL_U[9];
            _local_1 = Language.GUILDPANEL_U[5];
            _local_1 = guildName;
            _local_1 = guildLeader;
            _local_1 = guildDuty;
            _local_1 = Language.GUILDPANEL_S[23];
            _local_1 = Language.GUILDPANEL_U[27];
            _local_1 = Language.GUILDPANEL_U[28];
            _local_1 = Language.GUILDPANEL_U[29];
            _local_1 = Language.GUILDPANEL_U[30];
            _local_1 = Language.GUILDPANEL_U[31];
            _local_1 = Language.GUILDPANEL_U[32];
            _local_1 = Language.GUILDPANEL_U[33];
            _local_1 = Language.GUILDPANEL_U[34];
            _local_1 = Language.GUILDPANEL_U[35];
            _local_1 = Language.GUILDPANEL_U[37];
            _local_1 = canEditInfo;
            _local_1 = Language.GUILDPANEL_U[38];
            _local_1 = canDeleteGuild;
            _local_1 = Language.GUILDPANEL_U[39];
            _local_1 = (!(canDeleteGuild));
            _local_1 = Language.GUILDPANEL_U[40];
            _local_1 = Language.GUILDPANEL_U[41];
            _local_1 = Language.GUILDPANEL_S[106];
            _local_1 = Language.GUILDPANEL_S[107];
            _local_1 = Language.GUILDPANEL_S[108];
            _local_1 = Language.GUILDPANEL_U[6];
            _local_1 = Language.GUILDPANEL_S[24];
            _local_1 = Language.GUILDPANEL_S[25];
            _local_1 = Language.GUILDPANEL_S[26];
            _local_1 = Language.GUILDPANEL_S[27];
            _local_1 = Language.GUILDPANEL_S[28];
            _local_1 = Language.GUILDPANEL_S[63];
            _local_1 = Language.GUILDPANEL_S[64];
            _local_1 = Language.GUILDPANEL_S[29];
            _local_1 = Language.GUILDPANEL_U[7];
            _local_1 = pageGuildAC;
            _local_1 = Language.GUILDPANEL_S[101];
            _local_1 = Language.GUILDPANEL_S[30];
            _local_1 = Language.GUILDPANEL_S[31];
            _local_1 = Language.GUILDPANEL_S[32];
            _local_1 = Language.GUILDPANEL_U[8];
            _local_1 = Language.INPUTPANEL_U[0];
            _local_1 = Language.GUILDPANEL_S[35];
            _local_1 = Language.GUILDPANEL_S[36];
            _local_1 = Language.GUILDPANEL_S[38];
            _local_1 = Language.GUILDPANEL_S[39];
            _local_1 = Language.GUILDPANEL_S[40];
            _local_1 = Language.GUILDPANEL_S[41];
            _local_1 = Language.GUILDPANEL_S[42];
            _local_1 = Language.GUILDPANEL_S[43];
            _local_1 = Language.GUILDPANEL_S[44];
            _local_1 = Language.GUILDPANEL_S[45];
            _local_1 = Language.GUILDPANEL_S[46];
            _local_1 = Language.GUILDPANEL_S[47];
            _local_1 = Language.GUILDPANEL_S[48];
            _local_1 = Language.GUILDPANEL_S[49];
            _local_1 = Language.GUILDPANEL_S[50];
            _local_1 = Language.GUILDPANEL_S[51];
            _local_1 = Language.GUILDPANEL_S[51];
            _local_1 = Language.GUILDPANEL_S[51];
            _local_1 = Language.GUILDPANEL_S[51];
            _local_1 = Language.GUILDPANEL_S[52];
            _local_1 = Language.GUILDPANEL_U[10];
            _local_1 = Language.GUILDPANEL_S[24];
            _local_1 = Language.GUILDPANEL_S[26];
            _local_1 = Language.GUILDPANEL_S[27];
            _local_1 = Language.GUILDPANEL_S[28];
            _local_1 = Language.GUILDPANEL_S[33];
            _local_1 = Language.GUILDPANEL_U[5];
            _local_1 = Language.GUILDPANEL_U[6];
            _local_1 = Language.GUILDPANEL_U[8];
            _local_1 = Language.GUILDPANEL_U[10];
            _local_1 = Language.GUILDPANEL_U[7];
            _local_1 = monthsList;
            _local_1 = Language.GUILDPANEL_U[43];
        }

        public function __changeNameBtn_click(_arg_1:MouseEvent):void
        {
            changeGuildName();
        }

        public function set myGuildInfo(_arg_1:TextArea):void
        {
            var _local_2:Object = this._447179019myGuildInfo;
            if (_local_2 !== _arg_1)
            {
                this._447179019myGuildInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myGuildInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get titleCanvas():BasicTitleCanvas
        {
            return (this._41312720titleCanvas);
        }

        private function showGuildMemberList():*
        {
            if (guildMemberListUpdated)
            {
                updateGuildMemberView();
            };
        }

        public function onConfirmGuildApply(member:Object):void
        {
            var mem:* = undefined;
            var i:* = undefined;
            if (member == null)
            {
                return;
            };
            try
            {
                if (guildList != null)
                {
                    guildList[member.gid]["memberNumber"] = (Number(guildList[member.gid]["memberNumber"]) + 1);
                    guildListUpdated = true;
                };
                if (((!(selfGuildMemberData == null)) && (selfGuildMemberData.gid == member.gid)))
                {
                    if (selfGuildMemberData.id == member.tableId)
                    {
                        initView();
                        return;
                    };
                    for each (mem in memberList)
                    {
                        if (mem.id == member.tableId)
                        {
                            mem.rank = 6;
                        };
                    };
                    guildMemberListUpdated = true;
                    if (myRank.canAdd == 1)
                    {
                        for (i in applyList)
                        {
                            if (applyList[i].id == member.tableId)
                            {
                                delete applyList[i];
                            };
                        };
                    };
                };
            }
            catch(e:Error)
            {
            };
            updateView();
        }

        private function _GuildPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn10 = _local_1;
            _local_1.dataField = "leaderName";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn10", _GuildPanel_DataGridColumn10);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get changeNameBtn():RoundedButton
        {
            return (this._742881793changeNameBtn);
        }

        public function set searchText(_arg_1:TextInput):void
        {
            var _local_2:Object = this._710472971searchText;
            if (_local_2 !== _arg_1)
            {
                this._710472971searchText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchText", _local_2, _arg_1));
            };
        }

        public function set memLimit(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._669642010memLimit;
            if (_local_2 !== _arg_1)
            {
                this._669642010memLimit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "memLimit", _local_2, _arg_1));
            };
        }

        public function set name1(_arg_1:TextInput):void
        {
            var _local_2:Object = this._104584966name1;
            if (_local_2 !== _arg_1)
            {
                this._104584966name1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name1", _local_2, _arg_1));
            };
        }

        public function set name2(_arg_1:TextInput):void
        {
            var _local_2:Object = this._104584967name2;
            if (_local_2 !== _arg_1)
            {
                this._104584967name2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name2", _local_2, _arg_1));
            };
        }

        public function set memberGrid(_arg_1:ColoredBackgroundDataGrid):void
        {
            var _local_2:Object = this._1341543168memberGrid;
            if (_local_2 !== _arg_1)
            {
                this._1341543168memberGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "memberGrid", _local_2, _arg_1));
            };
        }

        public function set name3(_arg_1:TextInput):void
        {
            var _local_2:Object = this._104584968name3;
            if (_local_2 !== _arg_1)
            {
                this._104584968name3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name3", _local_2, _arg_1));
            };
        }

        public function set name4(_arg_1:TextInput):void
        {
            var _local_2:Object = this._104584969name4;
            if (_local_2 !== _arg_1)
            {
                this._104584969name4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name4", _local_2, _arg_1));
            };
        }

        private function applyGridClick():void
        {
            var _local_1:Array = new Array();
            _local_1.push({"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}, {"label":GamePredef.MENU_ADDF}, {"label":GamePredef.GUILD_ALLOW}, {"label":GamePredef.GUILD_REFUSE});
            menuPop(_local_1, applyClickHandler);
        }

        public function set name6(_arg_1:TextInput):void
        {
            var _local_2:Object = this._104584971name6;
            if (_local_2 !== _arg_1)
            {
                this._104584971name6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name6", _local_2, _arg_1));
            };
        }

        private function confirmGuildApply(_arg_1:CloseEvent):void
        {
            if (((!(_arg_1 == null)) && (_arg_1.detail == Alert.YES)))
            {
                _core.remote.confirmGuildApply(newMemberData);
            };
        }

        private function _GuildPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                titleCanvas.text = _arg_1;
            }, "titleCanvas.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_Canvas1.label = _arg_1;
            }, "_GuildPanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = guildName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myGuildName.text = _arg_1;
            }, "myGuildName.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = guildLeader;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myGuildLeader.text = _arg_1;
            }, "myGuildLeader.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = guildDuty;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myDuty.text = _arg_1;
            }, "myDuty.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changeNameBtn.label = _arg_1;
            }, "changeNameBtn.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel4.text = _arg_1;
            }, "_GuildPanel_RoundedLabel4.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel5.text = _arg_1;
            }, "_GuildPanel_RoundedLabel5.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel6.text = _arg_1;
            }, "_GuildPanel_RoundedLabel6.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel7.text = _arg_1;
            }, "_GuildPanel_RoundedLabel7.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel8.text = _arg_1;
            }, "_GuildPanel_RoundedLabel8.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel9.text = _arg_1;
            }, "_GuildPanel_RoundedLabel9.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel10.text = _arg_1;
            }, "_GuildPanel_RoundedLabel10.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel11.text = _arg_1;
            }, "_GuildPanel_RoundedLabel11.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel12.text = _arg_1;
            }, "_GuildPanel_RoundedLabel12.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_BasicGlowButton1.label = _arg_1;
            }, "_GuildPanel_BasicGlowButton1.label");
            result[15] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (canEditInfo);
            }, function (_arg_1:Boolean):void
            {
                _GuildPanel_BasicGlowButton1.enabled = _arg_1;
            }, "_GuildPanel_BasicGlowButton1.enabled");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                deleteG.label = _arg_1;
            }, "deleteG.label");
            result[17] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (canDeleteGuild);
            }, function (_arg_1:Boolean):void
            {
                deleteG.visible = _arg_1;
            }, "deleteG.visible");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                quitG.label = _arg_1;
            }, "quitG.label");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(canDeleteGuild));
            }, function (_arg_1:Boolean):void
            {
                quitG.visible = _arg_1;
            }, "quitG.visible");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_BasicGlowButton4.label = _arg_1;
            }, "_GuildPanel_BasicGlowButton4.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_BasicGlowButton5.label = _arg_1;
            }, "_GuildPanel_BasicGlowButton5.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[106];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel22.text = _arg_1;
            }, "_GuildPanel_RoundedLabel22.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[107];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel23.text = _arg_1;
            }, "_GuildPanel_RoundedLabel23.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[108];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_TextArea2.text = _arg_1;
            }, "_GuildPanel_TextArea2.text");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_Canvas4.label = _arg_1;
            }, "_GuildPanel_Canvas4.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn1.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn1.headerText");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn2.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn2.headerText");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn3.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn3.headerText");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn4.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn4.headerText");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn5.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn5.headerText");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[63];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn6.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn6.headerText");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[64];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn7.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn7.headerText");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel24.text = _arg_1;
            }, "_GuildPanel_RoundedLabel24.text");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_Canvas5.label = _arg_1;
            }, "_GuildPanel_Canvas5.label");
            result[35] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pageGuildAC);
            }, function (_arg_1:Object):void
            {
                guildGrid.dataProvider = _arg_1;
            }, "guildGrid.dataProvider");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[101];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn8.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn8.headerText");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn9.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn9.headerText");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn10.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn10.headerText");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn11.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn11.headerText");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_Canvas6.label = _arg_1;
            }, "_GuildPanel_Canvas6.label");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                settingRankButton.label = _arg_1;
            }, "settingRankButton.label");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel26.text = _arg_1;
            }, "_GuildPanel_RoundedLabel26.text");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel27.text = _arg_1;
            }, "_GuildPanel_RoundedLabel27.text");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel28.text = _arg_1;
            }, "_GuildPanel_RoundedLabel28.text");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel28.toolTip = _arg_1;
            }, "_GuildPanel_RoundedLabel28.toolTip");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel29.text = _arg_1;
            }, "_GuildPanel_RoundedLabel29.text");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel29.toolTip = _arg_1;
            }, "_GuildPanel_RoundedLabel29.toolTip");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel30.text = _arg_1;
            }, "_GuildPanel_RoundedLabel30.text");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel30.toolTip = _arg_1;
            }, "_GuildPanel_RoundedLabel30.toolTip");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel31.text = _arg_1;
            }, "_GuildPanel_RoundedLabel31.text");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel31.toolTip = _arg_1;
            }, "_GuildPanel_RoundedLabel31.toolTip");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel32.text = _arg_1;
            }, "_GuildPanel_RoundedLabel32.text");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel32.toolTip = _arg_1;
            }, "_GuildPanel_RoundedLabel32.toolTip");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel33.text = _arg_1;
            }, "_GuildPanel_RoundedLabel33.text");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel33.toolTip = _arg_1;
            }, "_GuildPanel_RoundedLabel33.toolTip");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel34.text = _arg_1;
            }, "_GuildPanel_RoundedLabel34.text");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel35.text = _arg_1;
            }, "_GuildPanel_RoundedLabel35.text");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel36.text = _arg_1;
            }, "_GuildPanel_RoundedLabel36.text");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel37.text = _arg_1;
            }, "_GuildPanel_RoundedLabel37.text");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel38.text = _arg_1;
            }, "_GuildPanel_RoundedLabel38.text");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel39.text = _arg_1;
            }, "_GuildPanel_RoundedLabel39.text");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_Canvas7.label = _arg_1;
            }, "_GuildPanel_Canvas7.label");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn12.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn12.headerText");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn13.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn13.headerText");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn14.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn14.headerText");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_DataGridColumn15.headerText = _arg_1;
            }, "_GuildPanel_DataGridColumn15.headerText");
            result[67] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_S[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildPanel_RoundedLabel40.text = _arg_1;
            }, "_GuildPanel_RoundedLabel40.text");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[73] = binding;
            binding = new Binding(this, function ():Object
            {
                return (monthsList);
            }, function (_arg_1:Object):void
            {
                monthCombo.dataProvider = _arg_1;
            }, "monthCombo.dataProvider");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                searchBtn.label = _arg_1;
            }, "searchBtn.label");
            result[75] = binding;
            return (result);
        }

        public function set name5(_arg_1:TextInput):void
        {
            var _local_2:Object = this._104584970name5;
            if (_local_2 !== _arg_1)
            {
                this._104584970name5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canDuty3():CheckBox
        {
            return (this._151317971canDuty3);
        }

        [Bindable(event="propertyChange")]
        public function get canDuty5():CheckBox
        {
            return (this._151317969canDuty5);
        }

        [Bindable(event="propertyChange")]
        public function get canDuty2():CheckBox
        {
            return (this._151317972canDuty2);
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabClick(3);
        }

        [Bindable(event="propertyChange")]
        public function get canDuty6():CheckBox
        {
            return (this._151317968canDuty6);
        }

        private function set guildName(_arg_1:String):void
        {
            var _local_2:Object = this._1848510178guildName;
            if (_local_2 !== _arg_1)
            {
                this._1848510178guildName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canDuty4():CheckBox
        {
            return (this._151317970canDuty4);
        }

        private function kickGuildMember(id:int):void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.kickGuildMember(id);
                };
            };
            Alert.show(Language.GUILDPANEL_S[104], "", (Alert.YES | Alert.NO), null, func);
        }

        private function set canDeleteGuild(_arg_1:Boolean):void
        {
            var _local_2:Object = this._637124376canDeleteGuild;
            if (_local_2 !== _arg_1)
            {
                this._637124376canDeleteGuild = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDeleteGuild", _local_2, _arg_1));
            };
        }

        private function updateGuildLeader(_arg_1:CloseEvent):void
        {
            if (((_arg_1.detail == Alert.YES) && (selfGuildMemberData)))
            {
                _core.remote.demiseTo(newLeaderId);
            };
        }

        public function set donateContrib(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._770250966donateContrib;
            if (_local_2 !== _arg_1)
            {
                this._770250966donateContrib = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "donateContrib", _local_2, _arg_1));
            };
        }

        public function set guildExp(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1306563286guildExp;
            if (_local_2 !== _arg_1)
            {
                this._1306563286guildExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildExp", _local_2, _arg_1));
            };
        }

        private function setQuitStyle():void
        {
            quitG.setStyle("upSkin", quitG.getStyle("disabledSkin"));
        }

        public function set guildSlotNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1563800885guildSlotNum;
            if (_local_2 !== _arg_1)
            {
                this._1563800885guildSlotNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildSlotNum", _local_2, _arg_1));
            };
        }

        private function clearPage():void
        {
            pageGuildAC.removeAll();
        }

        public function __quitG_click(_arg_1:MouseEvent):void
        {
            quitGuild();
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicGlowButton
        {
            return (this._1554141555tabBtn4);
        }

        public function __quitG_creationComplete(_arg_1:FlexEvent):void
        {
            setQuitStyle();
        }

        public function set guildLevel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1470959791guildLevel;
            if (_local_2 !== _arg_1)
            {
                this._1470959791guildLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildLevel", _local_2, _arg_1));
            };
        }

        public function onAddGuildRank(_arg_1:Object):void
        {
            _dm.addNewData(GamePredef.TBL_GUILD_RANK, _arg_1);
        }

        private function delGuild():void
        {
            var _alert:Alert;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.delGuild();
                };
            };
            var htmlMsg:String = Language.GUILDPANEL_S[103];
            var msg:String = htmlMsg.replace(/<font(.*?)>/g, "");
            msg = msg.replace(/<\/font>/g, "");
            msg = msg.replace(/<b>/g, "");
            msg = msg.replace(/<\/b>/g, "");
            _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = htmlMsg;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        public function set canInfo2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._146922668canInfo2;
            if (_local_2 !== _arg_1)
            {
                this._146922668canInfo2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canInfo2", _local_2, _arg_1));
            };
        }

        public function set canInfo6(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._146922664canInfo6;
            if (_local_2 !== _arg_1)
            {
                this._146922664canInfo6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canInfo6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get noGuild():Canvas
        {
            return (this._2088152754noGuild);
        }

        public function set canInfo4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._146922666canInfo4;
            if (_local_2 !== _arg_1)
            {
                this._146922666canInfo4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canInfo4", _local_2, _arg_1));
            };
        }

        public function set canInfo5(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._146922665canInfo5;
            if (_local_2 !== _arg_1)
            {
                this._146922665canInfo5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canInfo5", _local_2, _arg_1));
            };
        }

        public function onInitViewGuildP(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:Object;
            this.selfGuildMemberData = null;
            this.myGuild = null;
            this.memberList = null;
            this.guildRank = null;
            this.myRank = null;
            for each (_local_2 in _arg_1.memberList)
            {
                if (_local_2.cid == _core.player.id)
                {
                    selfGuildMemberData = _local_2;
                    break;
                };
            };
            if (selfGuildMemberData != null)
            {
                this.myGuild = _arg_1.myGuild;
                _core.player.guild = this.myGuild;
                _core.player.gData = this.selfGuildMemberData;
                this.memberList = _arg_1.memberList;
                this.guildRank = _arg_1.guildRank;
                this.applyList = _arg_1.applyList;
                this.skillDevData = _arg_1.skillDevData;
                if (selfGuildMemberData.rank == -1)
                {
                    quitG.label = Language.GUILDPANEL_U[42];
                }
                else
                {
                    quitG.label = Language.GUILDPANEL_U[39];
                };
            };
            guildMemberListUpdated = true;
            for each (_local_3 in guildRank)
            {
                if (_local_3.rank == selfGuildMemberData.rank)
                {
                    myRank = _local_3;
                };
            };
            updateView();
        }

        private function openGuildHelp():void
        {
            var _local_1:HelpPanel = HelpPanel(_core.view.getUI(ViewManager.PANEL_HELP));
            if (!_local_1.visible)
            {
                _local_1.show();
                _local_1.selectGuildHelp();
            }
            else
            {
                _local_1.hide();
            };
        }

        [Bindable(event="propertyChange")]
        public function get guildTab():ViewStack
        {
            return (this._1306549598guildTab);
        }

        public function set canInfo3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._146922667canInfo3;
            if (_local_2 !== _arg_1)
            {
                this._146922667canInfo3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canInfo3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myDuty():RoundedLabel
        {
            return (this._1060501854myDuty);
        }

        public function onAddGuild(_arg_1:Object):void
        {
            if (guildList != null)
            {
                guildList[_arg_1.id] = _arg_1;
                guildListUpdated = true;
            };
        }

        private function set guildDuty(_arg_1:String):void
        {
            var _local_2:Object = this._1848788631guildDuty;
            if (_local_2 !== _arg_1)
            {
                this._1848788631guildDuty = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildDuty", _local_2, _arg_1));
            };
        }

        public function set settingRankInfo(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._840150678settingRankInfo;
            if (_local_2 !== _arg_1)
            {
                this._840150678settingRankInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "settingRankInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get guildLeader():String
        {
            return (this._1644260060guildLeader);
        }

        private function guildSetting():void
        {
            var _local_1:Object;
            if (myRank)
            {
            };
            for each (_local_1 in guildRank)
            {
                if (((_local_1.rank > 1) && (_local_1.rank < 6)))
                {
                    this[("canAdd" + _local_1.rank)].selected = ((_local_1.canAdd == 1) ? true : false);
                    this[("canQuest" + _local_1.rank)].selected = ((_local_1.canQuest == 1) ? true : false);
                    this[("canSlot" + _local_1.rank)].selected = ((_local_1.canSlot == 1) ? true : false);
                    this[("canInfo" + _local_1.rank)].selected = ((_local_1.canInfo == 1) ? true : false);
                    this[("canDel" + _local_1.rank)].selected = ((_local_1.canDel == 1) ? true : false);
                    this[("canDuty" + _local_1.rank)].selected = ((_local_1.canDuty == 1) ? true : false);
                };
                this[("name" + _local_1.rank)].text = _local_1.name;
            };
            if (((selfGuildMemberData) && (selfGuildMemberData.rank == 1)))
            {
                settingRankInfo.htmlText = GamePredef.GUILD_ISLEADER;
                settingRankButton.visible = true;
            }
            else
            {
                settingRankInfo.htmlText = GamePredef.GUILD_ISNOTLEADER;
                settingRankButton.visible = false;
            };
        }

        public function set memNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1077788303memNum;
            if (_local_2 !== _arg_1)
            {
                this._1077788303memNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "memNum", _local_2, _arg_1));
            };
        }

        private function quitGuild():void
        {
            var func:Function;
            var htmlMsg:String;
            var msg:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (selfGuildMemberData)
            {
                if (((myRank) && (ToolKit.isEqual(myRank.rank, 1))))
                {
                    _core.sysMsg(Language.GUILDPANEL_S[11]);
                    return;
                };
                func = function (_arg_1:CloseEvent):void
                {
                    if (((!(_arg_1)) || (_arg_1.detail == Alert.YES)))
                    {
                        _core.remote.quitGuild(selfGuildMemberData.id);
                    };
                };
                if (selfGuildMemberData.rank == -1)
                {
                    (func(null));
                }
                else
                {
                    htmlMsg = Language.GUILDPANEL_S[105];
                    msg = htmlMsg.replace(/<font(.*?)>/g, "");
                    msg = msg.replace(/<\/font>/g, "");
                    msg = msg.replace(/<b>/g, "");
                    msg = msg.replace(/<\/b>/g, "");
                    _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
                    tf = _alert.mx_internal::alertForm.mx_internal::textField;
                    tf.htmlText = htmlMsg;
                    tf.filters = GamePredef.FILTER_TEXT1;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get memLimit():RoundedLabel
        {
            return (this._669642010memLimit);
        }

        private function tabClick(_arg_1:uint):void
        {
            tabBtn0.selected = false;
            tabBtn1.selected = false;
            tabBtn2.selected = false;
            tabBtn3.selected = false;
            tabBtn4.selected = false;
            this[("tabBtn" + _arg_1)].selected = true;
            guildTab.selectedIndex = _arg_1;
            if (_arg_1 == 2)
            {
                searchText.visible = true;
                monthCombo.visible = true;
                searchBtn.visible = true;
            }
            else
            {
                searchText.visible = false;
                monthCombo.visible = false;
                searchBtn.visible = false;
            };
        }

        public function set canDel2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549292407canDel2;
            if (_local_2 !== _arg_1)
            {
                this._549292407canDel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDel2", _local_2, _arg_1));
            };
        }

        public function set canDel3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549292408canDel3;
            if (_local_2 !== _arg_1)
            {
                this._549292408canDel3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDel3", _local_2, _arg_1));
            };
        }

        public function set canDel4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549292409canDel4;
            if (_local_2 !== _arg_1)
            {
                this._549292409canDel4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDel4", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabClick(2);
        }

        public function onGetGuildMember(_arg_1:Object):void
        {
            guildMemberListUpdated = true;
            this.memberList = _arg_1;
            if (tabBtn1.selected)
            {
                updateGuildMemberView();
            };
        }

        public function set canQuest2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._24161408canQuest2;
            if (_local_2 !== _arg_1)
            {
                this._24161408canQuest2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canQuest2", _local_2, _arg_1));
            };
        }

        public function set hasGuild(_arg_1:Canvas):void
        {
            var _local_2:Object = this._118704505hasGuild;
            if (_local_2 !== _arg_1)
            {
                this._118704505hasGuild = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hasGuild", _local_2, _arg_1));
            };
        }

        public function set canQuest3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._24161407canQuest3;
            if (_local_2 !== _arg_1)
            {
                this._24161407canQuest3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canQuest3", _local_2, _arg_1));
            };
        }

        public function set canQuest4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._24161406canQuest4;
            if (_local_2 !== _arg_1)
            {
                this._24161406canQuest4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canQuest4", _local_2, _arg_1));
            };
        }

        public function set canDel6(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549292411canDel6;
            if (_local_2 !== _arg_1)
            {
                this._549292411canDel6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDel6", _local_2, _arg_1));
            };
        }

        public function set canQuest5(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._24161405canQuest5;
            if (_local_2 !== _arg_1)
            {
                this._24161405canQuest5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canQuest5", _local_2, _arg_1));
            };
        }

        private function guildMenuHandler(_arg_1:MenuEvent):*
        {
            if (_arg_1.label == Language.GUILDPANEL_U[1])
            {
                initView();
            }
            else
            {
                if (_arg_1.label == Language.GUILDPANEL_U[0])
                {
                    btnEditInfoClick();
                }
                else
                {
                    if (_arg_1.label == Language.GUILDPANEL_U[2])
                    {
                        _core.view.getUI(ViewManager.PANEL_ADDGUILD).visible = true;
                    }
                    else
                    {
                        if (_arg_1.label == Language.GUILDPANEL_U[3])
                        {
                            quitGuild();
                        }
                        else
                        {
                            if (_arg_1.label == Language.GUILDPANEL_U[4])
                            {
                                delGuild();
                            }
                            else
                            {
                                if (_arg_1.label == Language.GUILDPANEL_U[16])
                                {
                                    if (!ToolKit.isEqual(_core.lineInfo.guild, 1))
                                    {
                                        Alert.show(Language.GUILDPANEL_U[25], "");
                                    }
                                    else
                                    {
                                        showContribPanel();
                                    };
                                }
                                else
                                {
                                    if (_arg_1.label == Language.GUILDPANEL_U[17])
                                    {
                                        if (!ToolKit.isEqual(_core.lineInfo.guild, 1))
                                        {
                                            Alert.show(Language.GUILDPANEL_U[25], "");
                                        }
                                        else
                                        {
                                            showGuildWarehousePanel();
                                        };
                                    }
                                    else
                                    {
                                        if (_arg_1.label == Language.GUILDPANEL_U[18])
                                        {
                                            guildMMLimitUp();
                                        }
                                        else
                                        {
                                            if (_arg_1.label == Language.GUILDPANEL_U[19])
                                            {
                                                guildBagSlotUp();
                                            }
                                            else
                                            {
                                                if (_arg_1.label == Language.GUILDPANEL_U[20])
                                                {
                                                    guildLevelUp();
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function set canQuest6(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._24161404canQuest6;
            if (_local_2 !== _arg_1)
            {
                this._24161404canQuest6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canQuest6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get name4():TextInput
        {
            return (this._104584969name4);
        }

        [Bindable(event="propertyChange")]
        public function get name5():TextInput
        {
            return (this._104584970name5);
        }

        public function set canDel5(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549292410canDel5;
            if (_local_2 !== _arg_1)
            {
                this._549292410canDel5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canDel5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myGuildInfo():TextArea
        {
            return (this._447179019myGuildInfo);
        }

        public function updateView():void
        {
            var _local_1:String;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (((this.visible) && (guildTab.selectedIndex == 2)))
            {
                showGuildList();
            };
            if (((this.visible) && (guildTab.selectedIndex == 1)))
            {
                showGuildMemberList();
            };
            updateButtonBar();
            updateGuildInfoView();
            organizeTabVisibility();
            updateGuildApplyListView();
            updateRankView();
            if (myGuild)
            {
                _local_1 = myGuild.name;
                if ((((_local_1.indexOf(Language.GUILDPANEL_S[1]) >= 0) || (_local_1.indexOf("☆") > 0)) && (selfGuildMemberData.rank == 1)))
                {
                    changeNameBtn.visible = true;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get name3():TextInput
        {
            return (this._104584968name3);
        }

        [Bindable(event="propertyChange")]
        public function get monthCombo():ComboBox
        {
            return (this._1654542610monthCombo);
        }

        [Bindable(event="propertyChange")]
        public function get name6():TextInput
        {
            return (this._104584971name6);
        }

        private function getExpToLevelUp():Number
        {
            return (1000);
        }

        public function ___GuildPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            btnEditInfoClick();
        }

        [Bindable(event="propertyChange")]
        public function get name2():TextInput
        {
            return (this._104584967name2);
        }

        public function onDelGuildMember(_arg_1:Object):void
        {
            var _local_2:*;
            if (selfGuildMemberData)
            {
                if (((!(ToolKit.isEqual(_arg_1.type, GamePredef.TYPE_REFUSE))) && (!(ToolKit.isEqual(_arg_1.type, GamePredef.TYPE_GIVEUP)))))
                {
                    if (guildList != null)
                    {
                        guildList[_arg_1.gid]["memberNumber"] = (Number(guildList[_arg_1.gid]["memberNumber"]) - 1);
                        guildListUpdated = true;
                    };
                };
                if (ToolKit.isEqual(selfGuildMemberData.id, _arg_1.id))
                {
                    _core.player.guild = null;
                    _core.view.getUI(ViewManager.PANEL_GUILDWAREHOUSE).reset();
                    initView();
                    return;
                };
                delete memberList[_arg_1.id];
                for (_local_2 in applyList)
                {
                    if (ToolKit.isEqual(applyList[_local_2].id, _arg_1.id))
                    {
                        delete applyList[_local_2];
                    };
                };
                guildMemberListUpdated = true;
            };
            updateView();
        }

        [Bindable(event="propertyChange")]
        public function get searchText():TextInput
        {
            return (this._710472971searchText);
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        public function set myGuildLeader(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._164888176myGuildLeader;
            if (_local_2 !== _arg_1)
            {
                this._164888176myGuildLeader = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myGuildLeader", _local_2, _arg_1));
            };
        }

        public function searchGuild():void
        {
            var _local_1:Object;
            var _local_2:Boolean;
            if (searchText.text == "")
            {
                this.updateGuildListView();
            }
            else
            {
                guildAC = new ArrayCollection();
                for each (_local_1 in guildList)
                {
                    if (_local_1)
                    {
                        _local_2 = false;
                        if (monthCombo.selectedItem.data == 1)
                        {
                            if (((_local_1.name.indexOf(searchText.text) >= 0) || (searchText.text == "")))
                            {
                                _local_2 = true;
                            };
                        }
                        else
                        {
                            if (monthCombo.selectedItem.data == 0)
                            {
                                if (((_local_1.id == searchText.text) || (searchText.text == "")))
                                {
                                    _local_2 = true;
                                };
                            };
                        };
                        if (_local_2)
                        {
                            guildAC.addItem({
                                "id":Number(_local_1.id),
                                "name":_local_1.name,
                                "leaderName":_local_1.ln,
                                "leaderId":_local_1.cid,
                                "memberNumber":_local_1.memberNumber
                            });
                        };
                    };
                };
                initPageSelector();
                guildListUpdated = false;
            };
        }

        private function applyClickHandler(_arg_1:MenuEvent):void
        {
            var _local_2:* = "";
            if (guildTab.selectedIndex != 4)
            {
                return;
            };
            if (_arg_1.index == 0)
            {
                _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(applyGrid.selectedItem.name);
            }
            else
            {
                if (_arg_1.index == 1)
                {
                    ChatPanelUtil.createChatPanel(applyGrid.selectedItem.id);
                }
                else
                {
                    if (_arg_1.index == 2)
                    {
                        _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(applyGrid.selectedItem.id);
                    }
                    else
                    {
                        if (_arg_1.index == 3)
                        {
                            _core.addFriend(applyGrid.selectedItem.name);
                        }
                        else
                        {
                            if (_arg_1.label == GamePredef.GUILD_ALLOW)
                            {
                                newMemberData = new Object();
                                newMemberData.tableId = applyGrid.selectedItem.tableId;
                                newMemberData.newData = 6;
                                newMemberData.updateType = "rank";
                                _local_2 = Language.GUILDPANEL_S[2];
                                _local_2 = _local_2.replace("{name}", applyGrid.selectedItem.name);
                                Alert.show(_local_2, "", (Alert.YES | Alert.NO), this, confirmGuildApply);
                            }
                            else
                            {
                                if (_arg_1.label == GamePredef.GUILD_REFUSE)
                                {
                                    refuseGuildMember(applyGrid.selectedItem.tableId);
                                };
                            };
                        };
                    };
                };
            };
        }

        public function __settingRankButton_click(_arg_1:MouseEvent):void
        {
            Alert.show(Language.GUILDPANEL_S[34], "", 3, this, updateGuildRank);
        }

        [Bindable(event="propertyChange")]
        private function get canDeleteGuild():Boolean
        {
            return (this._637124376canDeleteGuild);
        }

        public function updateGuildListView():void
        {
            var _local_1:Object;
            guildAC = new ArrayCollection();
            for each (_local_1 in guildList)
            {
                guildAC.addItem({
                    "id":Number(_local_1.id),
                    "name":_local_1.name,
                    "leaderName":_local_1.ln,
                    "leaderId":_local_1.cid,
                    "memberNumber":_local_1.memberNumber
                });
            };
            initPageSelector();
            guildListUpdated = false;
        }

        public function updateGuildInfoView():void
        {
            if (((!(selfGuildMemberData == null)) && (!(selfGuildMemberData.rank == -1))))
            {
                if (myGuild == null)
                {
                    return;
                };
                setNormalGuildInfoView();
            }
            else
            {
                if (((!(selfGuildMemberData == null)) && (selfGuildMemberData.rank == -1)))
                {
                    setWaitGuildInfoView();
                }
                else
                {
                    if (selfGuildMemberData == null)
                    {
                        setNoGuildInfoView();
                    };
                };
            };
        }

        private function guildGridClick():void
        {
            menuPop([{"label":GamePredef.GUILD_JOIN}, {"label":GamePredef.GUILD_LEADERINFO}], menuClickHandler);
        }

        [Bindable(event="propertyChange")]
        public function get name1():TextInput
        {
            return (this._104584966name1);
        }

        public function set searchBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._1778179988searchBtn;
            if (_local_2 !== _arg_1)
            {
                this._1778179988searchBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchBtn", _local_2, _arg_1));
            };
        }

        public function set canAdd2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549201825canAdd2;
            if (_local_2 !== _arg_1)
            {
                this._549201825canAdd2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canAdd2", _local_2, _arg_1));
            };
        }

        public function set canAdd4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549201827canAdd4;
            if (_local_2 !== _arg_1)
            {
                this._549201827canAdd4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canAdd4", _local_2, _arg_1));
            };
        }

        public function set canAdd5(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549201828canAdd5;
            if (_local_2 !== _arg_1)
            {
                this._549201828canAdd5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canAdd5", _local_2, _arg_1));
            };
        }

        public function set canAdd6(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549201829canAdd6;
            if (_local_2 !== _arg_1)
            {
                this._549201829canAdd6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canAdd6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get donateContrib():RoundedLabel
        {
            return (this._770250966donateContrib);
        }

        [Bindable(event="propertyChange")]
        public function get guildLevel():RoundedLabel
        {
            return (this._1470959791guildLevel);
        }

        public function set canAdd3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._549201826canAdd3;
            if (_local_2 !== _arg_1)
            {
                this._549201826canAdd3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canAdd3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canInfo4():CheckBox
        {
            return (this._146922666canInfo4);
        }

        [Bindable(event="propertyChange")]
        public function get canInfo5():CheckBox
        {
            return (this._146922665canInfo5);
        }

        [Bindable(event="propertyChange")]
        public function get canInfo6():CheckBox
        {
            return (this._146922664canInfo6);
        }

        [Bindable(event="propertyChange")]
        public function get canInfo3():CheckBox
        {
            return (this._146922667canInfo3);
        }

        private function guildMMLimitUp():void
        {
            if (checkIfLeader() == false)
            {
                Alert.show(Language.GUILDPANEL_U[14], "");
                return;
            };
            _core.remote.call("addMaxGuildMemberNum", null, myGuild.id);
        }

        public function onUpdateNumProp(_arg_1:Object):void
        {
            if (((selfGuildMemberData == null) || (myGuild == null)))
            {
                return;
            };
            var _local_2:Number = Number(_arg_1.type);
            switch (_local_2)
            {
                case GamePredef.GUILD_EXP:
                    myGuild.exp = (Number(myGuild.exp) + Number(_arg_1.num));
                    updateGuildInfoView();
                    return;
                case GamePredef.GUILD_MONEY:
                    myGuild.money = (Number(myGuild.money) + Number(_arg_1.num));
                    updateGuildInfoView();
                    return;
                case GamePredef.DONATE_CONTRIB:
                    if (Number(_arg_1.cid) == Number(_core.player.id))
                    {
                        selfGuildMemberData.donateContrib = (Number(selfGuildMemberData.donateContrib) + Number(_arg_1.num));
                        _core.player.gData.donateContrib = selfGuildMemberData.donateContrib;
                        updateGuildInfoView();
                    };
                    return;
                case GamePredef.NORMAL_CONTRIB:
                    if (Number(_arg_1.cid) == Number(_core.player.id))
                    {
                        selfGuildMemberData.normalContrib = (Number(selfGuildMemberData.normalContrib) + Number(_arg_1.num));
                        _core.player.gData.normalContrib = selfGuildMemberData.normalContrib;
                        updateGuildInfoView();
                    };
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get canInfo2():CheckBox
        {
            return (this._146922668canInfo2);
        }

        public function onChangeGuildName(_arg_1:String):void
        {
            var _local_2:*;
            changeNameBtn.visible = false;
            if (this.myGuild != null)
            {
                this.myGuild.name = _arg_1;
                updateGuildInfoView();
            };
            if (_core.player.guild != null)
            {
                _core.player.guild.name = _arg_1;
            };
            if (guildList != null)
            {
                for each (_local_2 in guildList)
                {
                    if (_local_2 != undefined)
                    {
                        if (_local_2.id == this.myGuild.id)
                        {
                            _local_2.name = _arg_1;
                        };
                    };
                };
                guildListUpdated = true;
            };
            _core.sysMsg(String(Language.GUILDPANEL_S[102]).replace("{name}", _arg_1));
        }

        private function handleHeaderRelease(_arg_1:DataGridEvent):void
        {
            var _local_5:int;
            _arg_1.preventDefault();
            if (!guildAC)
            {
                return;
            };
            var _local_2:SortField = new SortField();
            _local_2.name = _arg_1.dataField;
            _local_2.numeric = true;
            if (this[("desc_" + _arg_1.dataField)])
            {
                _local_2.descending = false;
                this[("desc_" + _arg_1.dataField)] = false;
            }
            else
            {
                _local_2.descending = true;
                this[("desc_" + _arg_1.dataField)] = true;
            };
            var _local_3:Sort = new Sort();
            _local_3.fields = [_local_2];
            guildAC.sort = _local_3;
            guildAC.refresh();
            var _local_4:int = (pageSelector.pageNo * PAGE_MAX_ITEM_NUM);
            if (pageSelector.pageNo == (pageSelector.pageCount - 1))
            {
                _local_5 = (guildAC.length - 1);
            }
            else
            {
                _local_5 = ((_local_4 + PAGE_MAX_ITEM_NUM) - 1);
            };
            pageGuildAC.removeAll();
            var _local_6:int = _local_4;
            while (_local_6 <= _local_5)
            {
                pageGuildAC.addItem(guildAC.getItemAt(_local_6));
                _local_6++;
            };
        }

        private function changeGuildName():void
        {
            var gName:String = myGuild.name;
            if (((gName.indexOf(Language.GUILDPANEL_S[14]) < 0) && (!(selfGuildMemberData.rank == 1))))
            {
                trace("不能免费改名或者没权限");
                return;
            };
            var func:Function = function (_arg_1:String):void
            {
                var _local_2:Number;
                var _local_3:*;
                if (((_core.haveSpecialStr(_arg_1)) || (_core.haveBadWord(_arg_1))))
                {
                    Alert.show(Language.GUILDPANEL_S[15], "", Alert.OK);
                }
                else
                {
                    if (_arg_1.length < 2)
                    {
                        Alert.show(Language.GUILDPANEL_S[16], "", Alert.OK);
                    }
                    else
                    {
                        if (_arg_1.length > 10)
                        {
                            Alert.show(Language.GUILDPANEL_S[17], "", Alert.OK);
                        }
                        else
                        {
                            _local_2 = 0;
                            if (guildList != null)
                            {
                                for each (_local_3 in guildList)
                                {
                                    if (_local_3 != undefined)
                                    {
                                        if (_local_3.name == _arg_1)
                                        {
                                            _local_2 = 1;
                                        };
                                    };
                                };
                            };
                            if (_local_2 == 1)
                            {
                                Alert.show(GamePredef.GUILD_EXISTGUILD, "", Alert.OK);
                            }
                            else
                            {
                                _core.remote.changeGuildName(_arg_1);
                            };
                        };
                    };
                };
            };
            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.GUILDPANEL_S[18], "", func);
        }

        [Bindable(event="propertyChange")]
        public function get canQuest2():CheckBox
        {
            return (this._24161408canQuest2);
        }

        [Bindable(event="propertyChange")]
        public function get canQuest3():CheckBox
        {
            return (this._24161407canQuest3);
        }

        [Bindable(event="propertyChange")]
        public function get canQuest4():CheckBox
        {
            return (this._24161406canQuest4);
        }

        public function set normalContrib(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1068679758normalContrib;
            if (_local_2 !== _arg_1)
            {
                this._1068679758normalContrib = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "normalContrib", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canQuest5():CheckBox
        {
            return (this._24161405canQuest5);
        }

        [Bindable(event="propertyChange")]
        public function get canQuest6():CheckBox
        {
            return (this._24161404canQuest6);
        }

        private function set pageGuildAC(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._792913466pageGuildAC;
            if (_local_2 !== _arg_1)
            {
                this._792913466pageGuildAC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageGuildAC", _local_2, _arg_1));
            };
        }

        private function _GuildPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn9 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn9", _GuildPanel_DataGridColumn9);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get searchBtn():BasicDelayButton
        {
            return (this._1778179988searchBtn);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:GuildPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuildPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GuildPanelWatcherSetupUtil");
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

        public function set txtGuildID(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1126216770txtGuildID;
            if (_local_2 !== _arg_1)
            {
                this._1126216770txtGuildID = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtGuildID", _local_2, _arg_1));
            };
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            var _local_2:Number;
            if (guildTab.selectedIndex == 1)
            {
                if (!memberGrid.selectedItem)
                {
                    return;
                };
                if (_arg_1.index == 0)
                {
                    _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(memberGrid.selectedItem.name);
                }
                else
                {
                    if (_arg_1.index == 1)
                    {
                        ChatPanelUtil.createChatPanel(memberGrid.selectedItem.id);
                    }
                    else
                    {
                        if (_arg_1.index == 2)
                        {
                            _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(memberGrid.selectedItem.id);
                        }
                        else
                        {
                            if (_arg_1.index == 3)
                            {
                                _core.addFriend(memberGrid.selectedItem.name);
                            }
                            else
                            {
                                if (((((_arg_1.label == GamePredef.GUILD_KICK) && (!(memberGrid.selectedItem.rank == -1))) && (!(memberGrid.selectedItem.rank == 1))) && (myRank.canDel == 1)))
                                {
                                    kickGuildMember(memberGrid.selectedItem.tableId);
                                }
                                else
                                {
                                    if (((((_arg_1.label == GamePredef.GUILD_DEMISE) && (!(memberGrid.selectedItem.rank == -1))) && (selfGuildMemberData.rank == 1)) && (_core.player.id == myGuild.cid)))
                                    {
                                        Alert.show(Language.GUILDPANEL_S[4].replace("{item}", _arg_1.item.label).replace("{name}", memberGrid.selectedItem.name), "", 3, this, updateGuildLeader);
                                        newLeaderId = memberGrid.selectedItem.id;
                                    }
                                    else
                                    {
                                        newMemberData = new Object();
                                        _local_2 = 2;
                                        while (_local_2 <= 6)
                                        {
                                            if (_arg_1.item.rank == _local_2)
                                            {
                                                newMemberData.tableId = memberGrid.selectedItem.tableId;
                                                newMemberData.newData = _local_2;
                                                newMemberData.updateType = "rank";
                                                Alert.show(Language.GUILDPANEL_S[6].replace("{item}", _arg_1.item.label).replace("{name}", memberGrid.selectedItem.name), "", 3, this, updateGuildMember);
                                            };
                                            _local_2++;
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            }
            else
            {
                if (guildTab.selectedIndex == 2)
                {
                    if (!guildGrid.selectedItem)
                    {
                        return;
                    };
                    if (_arg_1.index == 0)
                    {
                        joinGuild(guildGrid.selectedItem.id);
                    }
                    else
                    {
                        if (_arg_1.index == 1)
                        {
                            _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(guildGrid.selectedItem.leaderId);
                        };
                    };
                };
            };
            Menu(_arg_1.target).removeEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        [Bindable(event="propertyChange")]
        public function get canAdd3():CheckBox
        {
            return (this._549201826canAdd3);
        }

        [Bindable(event="propertyChange")]
        public function get canAdd4():CheckBox
        {
            return (this._549201827canAdd4);
        }

        private function organizeTabVisibility():void
        {
            if (((myRank == null) || (!(myRank.canAdd == 1))))
            {
                if (tabBar.contains(tabBtn4))
                {
                    tabBar.removeChild(tabBtn4);
                };
            }
            else
            {
                if (((!(myRank == null)) && (myRank.canAdd == 1)))
                {
                    if (!tabBar.contains(tabBtn4))
                    {
                        tabBar.addChild(tabBtn4);
                        tabBar.setChildIndex(tabBtn4, 4);
                    };
                };
            };
        }

        public function __deleteG_click(_arg_1:MouseEvent):void
        {
            delGuild();
        }

        [Bindable(event="propertyChange")]
        public function get canAdd5():CheckBox
        {
            return (this._549201828canAdd5);
        }

        [Bindable(event="propertyChange")]
        public function get canAdd6():CheckBox
        {
            return (this._549201829canAdd6);
        }

        public function set applyGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._2076042284applyGrid;
            if (_local_2 !== _arg_1)
            {
                this._2076042284applyGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "applyGrid", _local_2, _arg_1));
            };
        }

        public function set guildGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1848702503guildGrid;
            if (_local_2 !== _arg_1)
            {
                this._1848702503guildGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildGrid", _local_2, _arg_1));
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        public function getGuildPrivateSkillData(_arg_1:Function):void
        {
            _core.remote.call("getGuildPrivateSkillData", new Responder(_arg_1));
        }

        public function set quitG(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._107947992quitG;
            if (_local_2 !== _arg_1)
            {
                this._107947992quitG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "quitG", _local_2, _arg_1));
            };
        }

        public function set titleCanvas(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._41312720titleCanvas;
            if (_local_2 !== _arg_1)
            {
                this._41312720titleCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleCanvas", _local_2, _arg_1));
            };
        }

        private function refuseGuildMember(_arg_1:int):void
        {
            _core.remote.refuseGuildMember(_arg_1);
        }

        public function onDemise(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (((!(myGuild == null)) && (myGuild.id == _arg_1.gid)))
            {
                if (selfGuildMemberData.cid == _arg_1.newCid)
                {
                    selfGuildMemberData.rank = 1;
                    for each (_local_3 in guildRank)
                    {
                        if (_local_3.rank == 1)
                        {
                            myRank = _local_3;
                            break;
                        };
                    };
                }
                else
                {
                    if (selfGuildMemberData.cid == _arg_1.oldCid)
                    {
                        selfGuildMemberData.rank = 6;
                        for each (_local_3 in guildRank)
                        {
                            if (_local_3.rank == 6)
                            {
                                myRank = _local_3;
                                break;
                            };
                        };
                    };
                };
                myGuild.cid = _arg_1.newCid;
                myGuild.ln = _arg_1.ln;
                for each (_local_2 in memberList)
                {
                    if (_local_2.cid == _arg_1.newCid)
                    {
                        _local_2.rank = 1;
                    }
                    else
                    {
                        if (_local_2.cid == _arg_1.oldCid)
                        {
                            _local_2.rank = 6;
                        };
                    };
                };
                guildMemberListUpdated = true;
            };
            if (guildList != null)
            {
                for each (_local_4 in guildList)
                {
                    if (_local_4.id == _arg_1.gid)
                    {
                        _local_4.cid = _arg_1.newCid;
                        _local_4.ln = _arg_1.ln;
                        break;
                    };
                };
                guildListUpdated = true;
            };
            updateView();
        }

        [Bindable(event="propertyChange")]
        public function get canAdd2():CheckBox
        {
            return (this._549201825canAdd2);
        }

        public function onUpdateGuildMember(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (selfGuildMemberData != null)
            {
                for each (_local_2 in memberList)
                {
                    if (_local_2.id == _arg_1.tableId)
                    {
                        _local_2[_arg_1.updateType] = _arg_1.newData;
                    };
                };
                guildMemberListUpdated = true;
                if (_arg_1.updateType == "rank")
                {
                    if (ToolKit.isEqual(_arg_1.tableId, selfGuildMemberData.id))
                    {
                        selfGuildMemberData.rank = _arg_1.newData;
                        for each (_local_3 in guildRank)
                        {
                            if (ToolKit.isEqual(_local_3.rank, selfGuildMemberData.rank))
                            {
                                myRank = _local_3;
                            };
                        };
                    };
                };
                updateView();
            };
        }

        private function set canEditInfo(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1023362504canEditInfo;
            if (_local_2 !== _arg_1)
            {
                this._1023362504canEditInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canEditInfo", _local_2, _arg_1));
            };
        }

        private function _GuildPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _GuildPanel_DataGridColumn8 = _local_1;
            _local_1.dataField = "id";
            BindingManager.executeBindings(this, "_GuildPanel_DataGridColumn8", _GuildPanel_DataGridColumn8);
            return (_local_1);
        }

        public function ___GuildPanel_Canvas4_show(_arg_1:FlexEvent):void
        {
            showGuildMemberList();
        }

        [Bindable(event="propertyChange")]
        public function get applyGrid():DataGrid
        {
            return (this._2076042284applyGrid);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.initViewGuildP();
            guildGrid.addEventListener(DataGridEvent.HEADER_RELEASE, handleHeaderRelease);
            searchText.visible = false;
            monthCombo.visible = false;
            searchBtn.visible = false;
            if (guildTab.selectedIndex == 2)
            {
                showGuildList();
                searchText.visible = true;
                monthCombo.visible = true;
                searchBtn.visible = true;
            }
            else
            {
                if (guildTab.selectedIndex == 1)
                {
                    showGuildMemberList();
                };
            };
            titleCanvas.btnHelp.visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get txtGuildID():RoundedLabel
        {
            return (this._1126216770txtGuildID);
        }

        [Bindable(event="propertyChange")]
        public function get quitG():BasicGlowButton
        {
            return (this._107947992quitG);
        }

        private function updateGuildMember(_arg_1:CloseEvent=null):void
        {
            if (((_arg_1) && (_arg_1.detail == Alert.YES)))
            {
                _core.remote.updateGuildMember(newMemberData);
            };
            if (_arg_1 == null)
            {
                _core.remote.updateGuildMember(newMemberData);
            };
        }

        private function rowColors(_arg_1:Object, _arg_2:Number, _arg_3:Number, _arg_4:uint):uint
        {
            var _local_5:uint = _arg_4;
            if (((!(_arg_1 == null)) && (_arg_1.status == GamePredef.GUILD_ONLINE)))
            {
                _local_5 = GamePredef.GUILD_ONLINE_COLOR;
            };
            if (((!(_arg_1 == null)) && (_arg_1.status == GamePredef.GUILD_OFFLINE)))
            {
                _local_5 = GamePredef.GUILD_OFFLINE_COLOR;
            };
            if (((!(_arg_1 == null)) && (_arg_1.duty == GamePredef.GUILD_UNVERIFIED)))
            {
                _local_5 = GamePredef.GUILD_ONCHECK_COLOR;
            };
            return (_local_5);
        }

        [Bindable(event="propertyChange")]
        public function get deleteG():BasicGlowButton
        {
            return (this._1550462972deleteG);
        }

        private function updateGuildRank(_arg_1:CloseEvent):void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:Object;
            if (((myRank) && (ToolKit.isEqual(myRank.rank, 1))))
            {
                _local_2 = 1;
                while (_local_2 <= 6)
                {
                    if (((this[("name" + _local_2)]) && (_core.haveBadWord(this[("name" + _local_2)].text))))
                    {
                        return;
                    };
                    _local_2++;
                };
                if (_arg_1.detail == Alert.YES)
                {
                    _local_3 = new Object();
                    for each (_local_4 in guildRank)
                    {
                        if (((_local_4.rank > 1) && (_local_4.rank < 6)))
                        {
                            _local_3[("canAdd" + _local_4.rank)] = ((this[("canAdd" + _local_4.rank)].selected) ? 1 : 0);
                            _local_3[("canQuest" + _local_4.rank)] = ((this[("canQuest" + _local_4.rank)].selected) ? 1 : 0);
                            _local_3[("canSlot" + _local_4.rank)] = ((this[("canSlot" + _local_4.rank)].selected) ? 1 : 0);
                            _local_3[("canInfo" + _local_4.rank)] = ((this[("canInfo" + _local_4.rank)].selected) ? 1 : 0);
                            _local_3[("canDel" + _local_4.rank)] = ((this[("canDel" + _local_4.rank)].selected) ? 1 : 0);
                            _local_3[("canDuty" + _local_4.rank)] = ((this[("canDuty" + _local_4.rank)].selected) ? 1 : 0);
                        };
                        _local_3[("rankId" + _local_4.rank)] = _local_4.id;
                        _local_3[("name" + _local_4.rank)] = this[("name" + _local_4.rank)].text;
                    };
                    _core.remote.updateGuildRank(_local_3);
                }
                else
                {
                    updateView();
                };
            }
            else
            {
                _core.sysMidNote(Language.GUILDPANEL_S[7]);
            };
        }

        public function set deleteG(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1550462972deleteG;
            if (_local_2 !== _arg_1)
            {
                this._1550462972deleteG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deleteG", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

