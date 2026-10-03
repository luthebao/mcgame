// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossFightPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.CrossFightResultInfo;
    import mx.controls.DataGrid;
    import mx.containers.ViewStack;
    import mx.containers.Canvas;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.ButtonTree;
    import mx.controls.dataGridClasses.DataGridColumn;
    import flash.net.URLLoader;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import flash.net.Responder;
    import com.qeedoo.game.config.Language;
    import mx.events.ListEvent;
    import mx.managers.PopUpManager;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
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

    public class CrossFightPanel extends DragableCanvas implements IBindingClient 
    {

        private static var TEAM_URL:String = "profile/pk/5v5.txt";
        private static var MEMBER_URL:String = "profile/pk/5v5charactor.txt";
        private static var VS_URL:String = "profile/pk/vs.txt";
        private static var CONFIG_URL:String = "profile/pk/pkconfig.txt";
        private static var LAST_INFO:int = 0;
        private static var HOT_TEAM:int = 1;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _CrossFightPanel_Image1:Image;
        public var _CrossFightPanel_Image2:Image;
        public var _CrossFightPanel_Image4:Image;
        public var _CrossFightPanel_Image3:Image;
        public var _CrossFightPanel_Image5:Image;
        private var _3586r4:CrossFightResultInfo;
        private var _111122r11:CrossFightResultInfo;
        public var _CrossFightPanel_DataGrid1:DataGrid;
        public var _CrossFightPanel_DataGrid2:DataGrid;
        private var _3773vs:ViewStack;
        private var _1718430789leftTree:Canvas;
        private var _3585r3:CrossFightResultInfo;
        private var areaIndex:int = 0;
        public var _CrossFightPanel_LinkButton1:LinkButton;
        public var _CrossFightPanel_LinkButton2:LinkButton;
        public var _CrossFightPanel_LinkButton3:LinkButton;
        public var _CrossFightPanel_LinkButton4:LinkButton;
        public var _CrossFightPanel_LinkButton5:LinkButton;
        public var _CrossFightPanel_LinkButton6:LinkButton;
        public var _CrossFightPanel_LinkButton7:LinkButton;
        public var _CrossFightPanel_LinkButton8:LinkButton;
        public var _CrossFightPanel_LinkButton9:LinkButton;
        private var _111123r12:CrossFightResultInfo;
        private var _3584r2:CrossFightResultInfo;
        private var _1594265562lastGroupC:BasicGlowButton;
        private var _2002832738lastTitle:Label;
        private var teamInfo:CrossFightTeamInfo;
        private var _3568542tree:ButtonTree;
        private var _1459736476lastInfo:Canvas;
        private var _3583r1:CrossFightResultInfo;
        private var _111124r13:CrossFightResultInfo;
        private var _951530617content:Canvas;
        public var _CrossFightPanel_DataGridColumn1:DataGridColumn;
        public var _CrossFightPanel_DataGridColumn2:DataGridColumn;
        public var _CrossFightPanel_DataGridColumn3:DataGridColumn;
        public var _CrossFightPanel_DataGridColumn4:DataGridColumn;
        public var _CrossFightPanel_DataGridColumn5:DataGridColumn;
        public var _CrossFightPanel_DataGridColumn6:DataGridColumn;
        public var _CrossFightPanel_DataGridColumn7:DataGridColumn;
        public var _CrossFightPanel_DataGridColumn8:DataGridColumn;
        public var _CrossFightPanel_DataGridColumn9:DataGridColumn;
        private var _3582r0:CrossFightResultInfo;
        private var load:URLLoader;
        private var _1594265560lastGroupA:BasicGlowButton;
        private var _57783177refreshScore:BasicDelayButton;
        private var _helpAlert:Alert;
        private var _1017286103lastGroupInfo:Canvas;
        private var _111125r14:CrossFightResultInfo;
        public var _CrossFightPanel_LinkButton10:LinkButton;
        public var _CrossFightPanel_LinkButton11:LinkButton;
        public var _CrossFightPanel_LinkButton12:LinkButton;
        public var _CrossFightPanel_LinkButton13:LinkButton;
        public var _CrossFightPanel_LinkButton14:LinkButton;
        public var _CrossFightPanel_LinkButton15:LinkButton;
        public var _CrossFightPanel_LinkButton16:LinkButton;
        public var _CrossFightPanel_LinkButton18:LinkButton;
        public var _CrossFightPanel_LinkButton19:LinkButton;
        private var _1098669130hotTeam:Canvas;
        public var _CrossFightPanel_LinkButton17:LinkButton;
        private var _3589r7:CrossFightResultInfo;
        public var _CrossFightPanel_LinkButton21:LinkButton;
        public var _CrossFightPanel_LinkButton22:LinkButton;
        public var _CrossFightPanel_LinkButton23:LinkButton;
        public var _CrossFightPanel_LinkButton24:LinkButton;
        public var _CrossFightPanel_LinkButton25:LinkButton;
        public var _CrossFightPanel_LinkButton26:LinkButton;
        public var _CrossFightPanel_LinkButton20:LinkButton;
        public var _CrossFightPanel_LinkButton28:LinkButton;
        public var _CrossFightPanel_LinkButton29:LinkButton;
        private var _1594265563lastGroupD:BasicGlowButton;
        public var _CrossFightPanel_LinkButton27:LinkButton;
        public var _CrossFightPanel_DataGridColumn10:DataGridColumn;
        public var _CrossFightPanel_LinkButton30:LinkButton;
        public var _CrossFightPanel_LinkButton31:LinkButton;
        public var _CrossFightPanel_LinkButton32:LinkButton;
        public var _CrossFightPanel_LinkButton33:LinkButton;
        private var _956155768crossFightTitle:BasicTitleCanvas;
        public var _CrossFightPanel_Label1:Label;
        public var _CrossFightPanel_Label3:Label;
        private var _3588r6:CrossFightResultInfo;
        private var groupIndex:int = 0;
        private var _3591r9:CrossFightResultInfo;
        private var teamData:Object;
        private var _111121r10:CrossFightResultInfo;
        private var _3587r5:CrossFightResultInfo;
        private var _1594265561lastGroupB:BasicGlowButton;
        private var showType:int = -1;
        private var _3590r8:CrossFightResultInfo;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":800,
                    "height":560,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"crossFightTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"leftTree",
                        "stylesFactory":function ():void
                        {
                            this.top = "42";
                            this.left = "12";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "height":460,
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossFightPanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.top = "3";
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ButtonTree,
                                    "id":"tree",
                                    "events":{"itemClick":"__tree_itemClick"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":105,
                                            "x":3,
                                            "height":130,
                                            "y":25
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"content",
                        "stylesFactory":function ():void
                        {
                            this.top = "42";
                            this.left = "120";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":680,
                                "height":508,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"vs",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":660,
                                            "height":0x0200,
                                            "x":10,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"lastInfo",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lastGroupA",
                                                            "events":{"click":"__lastGroupA_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":true,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lastGroupB",
                                                            "events":{"click":"__lastGroupB_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "85";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lastGroupC",
                                                            "events":{"click":"__lastGroupC_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "155";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lastGroupD",
                                                            "events":{"click":"__lastGroupD_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "225";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"lastGroupInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "30";
                                                                this.left = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":650,
                                                                    "height":435,
                                                                    "styleName":"CanvasBorder",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_CrossFightPanel_Image1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"lastTitle",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.color = 0xFFFF00;
                                                                            this.fontSize = 18;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":398,
                                                                                "height":32,
                                                                                "y":10
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":25
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":65
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":125
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":165
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":225
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":265
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":325
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":365
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":170,
                                                                                "y":48
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":170,
                                                                                "y":150
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":170,
                                                                                "y":248
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":170,
                                                                                "y":345
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":330,
                                                                                "y":101
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":330,
                                                                                "y":297
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CrossFightResultInfo,
                                                                        "id":"r14",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":490,
                                                                                "y":192
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"hotTeam",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":500,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_CrossFightPanel_Label3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 18;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":398,
                                                                    "height":32,
                                                                    "y":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":435,
                                                                    "x":10,
                                                                    "y":30,
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_CrossFightPanel_Image2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":8,
                                                                                "width":500,
                                                                                "height":100,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":DataGrid,
                                                                                    "id":"_CrossFightPanel_DataGrid1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textAlign = "center";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "selectable":false,
                                                                                            "x":10,
                                                                                            "y":0,
                                                                                            "percentWidth":100,
                                                                                            "rowHeight":24,
                                                                                            "percentHeight":100,
                                                                                            "verticalScrollPolicy":"off",
                                                                                            "columns":[_CrossFightPanel_DataGridColumn1_i(), _CrossFightPanel_DataGridColumn2_i(), _CrossFightPanel_DataGridColumn3_i(), _CrossFightPanel_DataGridColumn4_i(), _CrossFightPanel_DataGridColumn5_i()]
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
                                                                                "y":98,
                                                                                "width":500,
                                                                                "height":400,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":DataGrid,
                                                                                    "id":"_CrossFightPanel_DataGrid2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textAlign = "center";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "selectable":false,
                                                                                            "headerHeight":0,
                                                                                            "x":10,
                                                                                            "y":9,
                                                                                            "percentWidth":100,
                                                                                            "rowHeight":24,
                                                                                            "height":320,
                                                                                            "verticalScrollPolicy":"off",
                                                                                            "columns":[_CrossFightPanel_DataGridColumn6_i(), _CrossFightPanel_DataGridColumn7_i(), _CrossFightPanel_DataGridColumn8_i(), _CrossFightPanel_DataGridColumn9_i(), _CrossFightPanel_DataGridColumn10_i()]
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_CrossFightPanel_Image3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":500,
                                                                                "y":15
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_CrossFightPanel_Image4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":500,
                                                                                "y":39
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_CrossFightPanel_Image5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":500,
                                                                                "y":60
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":33,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton1",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton1_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":0,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton2",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton2_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":24,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton3",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton3_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":48,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton4",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton4_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":72,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton5",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton5_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":96,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton6",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton6_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":120,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton7",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton7_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":144,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton8",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton8_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":168,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton9",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton9_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":192,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton10",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton10_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":216,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton11",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton11_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":240,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton12",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton12_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":264,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton13",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton13_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":288,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton14",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton14_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":312,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton15",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton15_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":336,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton16",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton16_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":312,
                                                                                            "y":360,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton17",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton17_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":0,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton18",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton18_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":24,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton19",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton19_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":48,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton20",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton20_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":72,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton21",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton21_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":96,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton22",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton22_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":120,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton23",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton23_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":144,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton24",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton24_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":168,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton25",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton25_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":192,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton26",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton26_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":216,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton27",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton27_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":240,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton28",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton28_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":264,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton29",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton29_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":288,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton30",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton30_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":312,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton31",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton31_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":336,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_CrossFightPanel_LinkButton32",
                                                                                    "events":{"click":"___CrossFightPanel_LinkButton32_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 16187149;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":550,
                                                                                            "y":360,
                                                                                            "width":100,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkButton,
                                                                        "id":"_CrossFightPanel_LinkButton33",
                                                                        "events":{"click":"___CrossFightPanel_LinkButton33_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textDecoration = "underline";
                                                                            this.bottom = "3";
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                            this.right = "11";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"height":17});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"refreshScore",
                                                            "events":{"click":"__refreshScore_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "y":468
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
                    })]
                });
            }
        });
        private var _941722388hotTeamData:ArrayCollection = new ArrayCollection();
        private var _871376994hotTeamData2:ArrayCollection = new ArrayCollection();
        private var memberData:Object = {};
        private var vsData:Object = {};
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossFightPanel()
        {
            mx_internal::_document = this;
            this.width = 800;
            this.height = 560;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
            this.addEventListener("creationComplete", ___CrossFightPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossFightPanel._watcherSetupUtil = _arg_1;
        }


        public function set r1(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3583r1;
            if (_local_2 !== _arg_1)
            {
                this._3583r1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r1", _local_2, _arg_1));
            };
        }

        private function getRemoteInfo():void
        {
            load = new URLLoader();
            load.addEventListener(Event.COMPLETE, loadCompleteTeam);
            load.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            load.load(new URLRequest(TEAM_URL));
        }

        [Bindable(event="propertyChange")]
        public function get r7():CrossFightResultInfo
        {
            return (this._3589r7);
        }

        private function _CrossFightPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn3 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 30;
            _local_1.sortable = false;
            _local_1.dataField = "orderStr";
            _local_1.setStyle("textAlign", "center");
            _local_1.setStyle("color", 326404);
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn3", _CrossFightPanel_DataGridColumn3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get r2():CrossFightResultInfo
        {
            return (this._3584r2);
        }

        [Bindable(event="propertyChange")]
        public function get r11():CrossFightResultInfo
        {
            return (this._111122r11);
        }

        [Bindable(event="propertyChange")]
        public function get r13():CrossFightResultInfo
        {
            return (this._111124r13);
        }

        [Bindable(event="propertyChange")]
        public function get r14():CrossFightResultInfo
        {
            return (this._111125r14);
        }

        public function ___CrossFightPanel_LinkButton7_click(_arg_1:MouseEvent):void
        {
            toLookRep(6);
        }

        [Bindable(event="propertyChange")]
        public function get r12():CrossFightResultInfo
        {
            return (this._111123r12);
        }

        [Bindable(event="propertyChange")]
        public function get r5():CrossFightResultInfo
        {
            return (this._3587r5);
        }

        public function set r9(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3591r9;
            if (_local_2 !== _arg_1)
            {
                this._3591r9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r9", _local_2, _arg_1));
            };
        }

        public function ___CrossFightPanel_LinkButton10_click(_arg_1:MouseEvent):void
        {
            toLookRep(9);
        }

        [Bindable(event="propertyChange")]
        public function get r9():CrossFightResultInfo
        {
            return (this._3591r9);
        }

        [Bindable(event="propertyChange")]
        public function get r10():CrossFightResultInfo
        {
            return (this._111121r10);
        }

        private function errorHandler(_arg_1:IOErrorEvent):void
        {
            trace("ioError");
        }

        public function ___CrossFightPanel_LinkButton24_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(7);
        }

        public function set r11(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._111122r11;
            if (_local_2 !== _arg_1)
            {
                this._111122r11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r11", _local_2, _arg_1));
            };
        }

        public function set r10(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._111121r10;
            if (_local_2 !== _arg_1)
            {
                this._111121r10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r10", _local_2, _arg_1));
            };
        }

        public function set r14(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._111125r14;
            if (_local_2 !== _arg_1)
            {
                this._111125r14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r14", _local_2, _arg_1));
            };
        }

        public function set r7(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3589r7;
            if (_local_2 !== _arg_1)
            {
                this._3589r7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r7", _local_2, _arg_1));
            };
        }

        public function ___CrossFightPanel_LinkButton18_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(1);
        }

        public function set r13(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._111124r13;
            if (_local_2 !== _arg_1)
            {
                this._111124r13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r13", _local_2, _arg_1));
            };
        }

        public function __lastGroupD_click(_arg_1:MouseEvent):void
        {
            changeGroup(3);
        }

        private function set hotTeamData(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._941722388hotTeamData;
            if (_local_2 !== _arg_1)
            {
                this._941722388hotTeamData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hotTeamData", _local_2, _arg_1));
            };
        }

        public function set r2(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3584r2;
            if (_local_2 !== _arg_1)
            {
                this._3584r2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r3():CrossFightResultInfo
        {
            return (this._3585r3);
        }

        public function set r3(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3585r3;
            if (_local_2 !== _arg_1)
            {
                this._3585r3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r3", _local_2, _arg_1));
            };
        }

        public function set r4(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3586r4;
            if (_local_2 !== _arg_1)
            {
                this._3586r4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r4", _local_2, _arg_1));
            };
        }

        public function ___CrossFightPanel_LinkButton21_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(4);
        }

        public function __lastGroupA_click(_arg_1:MouseEvent):void
        {
            changeGroup(0);
        }

        public function ___CrossFightPanel_LinkButton29_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(12);
        }

        public function set r12(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._111123r12;
            if (_local_2 !== _arg_1)
            {
                this._111123r12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r12", _local_2, _arg_1));
            };
        }

        private function _CrossFightPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn2 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 40;
            _local_1.sortable = false;
            _local_1.dataField = "tarea";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn2", _CrossFightPanel_DataGridColumn2);
            return (_local_1);
        }

        public function ___CrossFightPanel_LinkButton4_click(_arg_1:MouseEvent):void
        {
            toLookRep(3);
        }

        [Bindable(event="propertyChange")]
        public function get hotTeam():Canvas
        {
            return (this._1098669130hotTeam);
        }

        public function set r8(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3590r8;
            if (_local_2 !== _arg_1)
            {
                this._3590r8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get leftTree():Canvas
        {
            return (this._1718430789leftTree);
        }

        [Bindable(event="propertyChange")]
        public function get r4():CrossFightResultInfo
        {
            return (this._3586r4);
        }

        [Bindable(event="propertyChange")]
        public function get r6():CrossFightResultInfo
        {
            return (this._3588r6);
        }

        public function set r5(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3587r5;
            if (_local_2 !== _arg_1)
            {
                this._3587r5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r5", _local_2, _arg_1));
            };
        }

        private function changeArea(_arg_1:int):void
        {
            areaIndex = _arg_1;
            if (areaIndex == 0)
            {
                areaIndex = 1;
            };
            refreshGroupInfo();
        }

        [Bindable(event="propertyChange")]
        public function get r8():CrossFightResultInfo
        {
            return (this._3590r8);
        }

        [Bindable(event="propertyChange")]
        public function get lastInfo():Canvas
        {
            return (this._1459736476lastInfo);
        }

        public function ___CrossFightPanel_LinkButton32_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(15);
        }

        private function changeView(_arg_1:Object):void
        {
            if (_arg_1.type == LAST_INFO)
            {
                vs.selectedIndex = 0;
                if (_arg_1.kind == 0)
                {
                    groupIndex = 0;
                    lastGroupA.selected = true;
                    lastGroupB.selected = false;
                    lastGroupC.selected = false;
                    lastGroupD.selected = false;
                    areaIndex = 0;
                    tree.expandItem(tree.selectedItem, (!(tree.isItemOpen(tree.selectedItem))));
                };
                changeArea(_arg_1.kind);
            }
            else
            {
                if (_arg_1.type == HOT_TEAM)
                {
                    vs.selectedIndex = 1;
                    refreshHotInfo();
                };
            };
        }

        private function loadCompleteConfig(_arg_1:Event):void
        {
            var _local_6:XML;
            var _local_7:ArrayCollection;
            var _local_2:String = load.data;
            var _local_3:XML = new XML(_local_2);
            var _local_4:XMLList = _local_3.children();
            var _local_5:int;
            while (_local_5 < _local_4.length())
            {
                _local_6 = _local_4[_local_5];
                showType = int(_local_6.type);
                _local_5++;
            };
            load.removeEventListener(Event.COMPLETE, loadCompleteConfig);
            load.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            if (0 != showType)
            {
                _local_7 = (tree.dataProvider as ArrayCollection);
                if (_local_7)
                {
                    _local_7.removeItemAt((_local_7.length - 1));
                };
                tree.dataProvider = _local_7;
                vs.selectedIndex = 1;
                tree.expandItem(tree.selectedItem, (!(tree.isItemOpen(tree.selectedItem))));
                changeArea(0);
            }
            else
            {
                refreshHotInfo();
                getLastScore();
            };
        }

        public function ___CrossFightPanel_LinkButton15_click(_arg_1:MouseEvent):void
        {
            toLookRep(14);
        }

        [Bindable(event="propertyChange")]
        public function get content():Canvas
        {
            return (this._951530617content);
        }

        private function toLookRep(_arg_1:int):void
        {
            var _local_2:Object;
            var _local_4:String;
            if (_arg_1 > 2)
            {
                _local_2 = hotTeamData.getItemAt((_arg_1 - 3));
            }
            else
            {
                _local_2 = hotTeamData2.getItemAt(_arg_1);
            };
            if (_local_2)
            {
                _local_4 = _local_2.treplayid;
                if (((_local_4) && (_local_4.length > 0)))
                {
                    _core.remote.call("crossPKLookReplay", new Responder(onLookRep), _local_4);
                    return;
                };
            };
            var _local_3:String = Language.CROSS_FIGHT_PANEL_U[60];
            Alert.show(_local_3, _local_3, Alert.YES, null, null);
        }

        public function ___CrossFightPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            toLookRep(0);
        }

        [Bindable(event="propertyChange")]
        public function get refreshScore():BasicDelayButton
        {
            return (this._57783177refreshScore);
        }

        public function onGetLastScore(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_2:int;
            while (_local_2 < hotTeamData.length)
            {
                _local_3 = hotTeamData.getItemAt(_local_2);
                if (((_local_3) && (!(_arg_1[_local_3.tid] == null))))
                {
                    _local_3.tpoll = _arg_1[_local_3.tid];
                    _local_3.tpollStr = (_local_3.tpoll + Language.CROSS_FIGHT_PANEL_U[51]);
                };
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < hotTeamData2.length)
            {
                _local_3 = hotTeamData2.getItemAt(_local_2);
                if (((_local_3) && (!(_arg_1[_local_3.tid] == null))))
                {
                    _local_3.tpoll = _arg_1[_local_3.tid];
                    _local_3.tpollStr = (_local_3.tpoll + Language.CROSS_FIGHT_PANEL_U[51]);
                };
                _local_2++;
            };
            refreshHotInfo();
            vs.selectedIndex = 1;
            this.visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get crossFightTitle():BasicTitleCanvas
        {
            return (this._956155768crossFightTitle);
        }

        private function _CrossFightPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn1 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 50;
            _local_1.sortable = false;
            _local_1.dataField = "tname";
            _local_1.setStyle("textAlign", "center");
            _local_1.setStyle("color", 16407301);
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn1", _CrossFightPanel_DataGridColumn1);
            return (_local_1);
        }

        public function ___CrossFightPanel_LinkButton9_click(_arg_1:MouseEvent):void
        {
            toLookRep(8);
        }

        private function treeClick(_arg_1:Event):void
        {
            var _local_2:Object = tree.selectedItem;
            if (!_local_2)
            {
                return;
            };
            changeView(_local_2);
        }

        public function ___CrossFightPanel_LinkButton26_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(9);
        }

        private function _CrossFightPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn9 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 30;
            _local_1.sortable = false;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn9", _CrossFightPanel_DataGridColumn9);
            return (_local_1);
        }

        public function set leftTree(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1718430789leftTree;
            if (_local_2 !== _arg_1)
            {
                this._1718430789leftTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftTree", _local_2, _arg_1));
            };
        }

        public function set hotTeam(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1098669130hotTeam;
            if (_local_2 !== _arg_1)
            {
                this._1098669130hotTeam = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hotTeam", _local_2, _arg_1));
            };
        }

        private function onLookRep(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[50]);
            };
        }

        public function ___CrossFightPanel_LinkButton12_click(_arg_1:MouseEvent):void
        {
            toLookRep(11);
        }

        private function changeGroup(_arg_1:int):void
        {
            lastGroupA.selected = (_arg_1 == 0);
            lastGroupB.selected = (_arg_1 == 1);
            lastGroupC.selected = (_arg_1 == 2);
            lastGroupD.selected = (_arg_1 == 3);
            groupIndex = _arg_1;
            refreshGroupInfo();
        }

        public function set r6(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3588r6;
            if (_local_2 !== _arg_1)
            {
                this._3588r6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r6", _local_2, _arg_1));
            };
        }

        public function ___CrossFightPanel_LinkButton23_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(6);
        }

        public function set lastTitle(_arg_1:Label):void
        {
            var _local_2:Object = this._2002832738lastTitle;
            if (_local_2 !== _arg_1)
            {
                this._2002832738lastTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastTitle", _local_2, _arg_1));
            };
        }

        public function __tree_itemClick(_arg_1:ListEvent):void
        {
            treeClick(_arg_1);
        }

        private function initTree():void
        {
            var _local_1:ArrayCollection = new ArrayCollection();
            var _local_2:ArrayCollection = new ArrayCollection();
            _local_2.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[6],
                "type":LAST_INFO,
                "kind":1
            });
            _local_2.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[7],
                "type":LAST_INFO,
                "kind":2
            });
            _local_2.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[8],
                "type":LAST_INFO,
                "kind":3
            });
            _local_1.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[4],
                "type":LAST_INFO,
                "kind":0,
                "children":_local_2
            });
            _local_1.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[61],
                "type":HOT_TEAM
            });
            var _local_3:ArrayCollection = new ArrayCollection();
            var _local_4:int;
            while (_local_4 < _local_1.length)
            {
                _local_3.addItem(_local_1.getItemAt(_local_4));
                _local_4++;
            };
            tree.dataProvider = _local_3;
        }

        public function set lastInfo(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1459736476lastInfo;
            if (_local_2 !== _arg_1)
            {
                this._1459736476lastInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastInfo", _local_2, _arg_1));
            };
        }

        public function ___CrossFightPanel_LinkButton6_click(_arg_1:MouseEvent):void
        {
            toLookRep(5);
        }

        public function __lastGroupC_click(_arg_1:MouseEvent):void
        {
            changeGroup(2);
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CROSS_FIGHT_PANEL_U[59].toString();
            _helpAlert = Alert.show(_local_1, Language.ASTROLOGIC_PANEL_U[38].toString(), Alert.YES, null, null);
        }

        public function set refreshScore(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._57783177refreshScore;
            if (_local_2 !== _arg_1)
            {
                this._57783177refreshScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshScore", _local_2, _arg_1));
            };
        }

        public function set content(_arg_1:Canvas):void
        {
            var _local_2:Object = this._951530617content;
            if (_local_2 !== _arg_1)
            {
                this._951530617content = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "content", _local_2, _arg_1));
            };
        }

        private function _CrossFightPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn8 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 30;
            _local_1.sortable = false;
            _local_1.dataField = "orderStr";
            _local_1.setStyle("textAlign", "center");
            _local_1.setStyle("color", 326404);
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn8", _CrossFightPanel_DataGridColumn8);
            return (_local_1);
        }

        public function ___CrossFightPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initTree();
        }

        public function ___CrossFightPanel_LinkButton17_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(0);
        }

        public function ___CrossFightPanel_LinkButton20_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(3);
        }

        public function ___CrossFightPanel_LinkButton28_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(11);
        }

        public function ___CrossFightPanel_LinkButton3_click(_arg_1:MouseEvent):void
        {
            toLookRep(2);
        }

        public function showPanel():void
        {
            if (load)
            {
                vs.selectedIndex = 1;
                if (0 != showType)
                {
                    tree.expandItem(tree.selectedItem, (!(tree.isItemOpen(tree.selectedItem))));
                    changeArea(0);
                };
                this.visible = true;
            }
            else
            {
                getRemoteInfo();
            };
        }

        private function getLastScore():void
        {
            if (teamData)
            {
                _core.remote.call("crossPKMobaiGetScore", null);
            };
        }

        public function set crossFightTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._956155768crossFightTitle;
            if (_local_2 !== _arg_1)
            {
                this._956155768crossFightTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "crossFightTitle", _local_2, _arg_1));
            };
        }

        private function openTeamInfo(_arg_1:int):void
        {
            var _local_2:Object;
            var _local_4:Object;
            if (_arg_1 > 2)
            {
                _local_2 = hotTeamData.getItemAt((_arg_1 - 3));
            }
            else
            {
                _local_2 = hotTeamData2.getItemAt(_arg_1);
            };
            if (!_local_2)
            {
                return;
            };
            if (!teamInfo)
            {
                teamInfo = (ViewManager.getInstance().getUI(ViewManager.PANEL_CROSS_FIGHT_TEAM) as CrossFightTeamInfo);
            };
            var _local_3:Object = {};
            for each (_local_4 in memberData)
            {
                if (_local_4.tid == _local_2.tid)
                {
                    _local_3[_local_4.corder] = _local_4;
                };
            };
            teamInfo.open(_local_2, _local_3);
            teamInfo.visible = true;
        }

        private function _CrossFightPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn7 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 40;
            _local_1.sortable = false;
            _local_1.dataField = "tarea";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn7", _CrossFightPanel_DataGridColumn7);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get hotTeamData():ArrayCollection
        {
            return (this._941722388hotTeamData);
        }

        public function ___CrossFightPanel_LinkButton31_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(14);
        }

        public function ___CrossFightPanel_LinkButton14_click(_arg_1:MouseEvent):void
        {
            toLookRep(13);
        }

        private function refreshGroupInfo():void
        {
            var _local_2:Object;
            var _local_3:Object;
            lastTitle.text = (((Language.CROSS_FIGHT_PANEL_U[63] + Language.CROSS_FIGHT_PANEL_U[(5 + areaIndex)]) + Language.CROSS_FIGHT_PANEL_U[(18 + groupIndex)]) + Language.CROSS_FIGHT_PANEL_U[22]);
            var _local_1:int;
            while (_local_1 < 15)
            {
                if (this[("r" + _local_1)])
                {
                    this[("r" + _local_1)].init();
                };
                _local_1++;
            };
            for each (_local_2 in vsData)
            {
                if (((((_local_2) && (!(_local_2.type == -1))) && (_local_2.group == groupIndex)) && (_local_2.match == (areaIndex - 1))))
                {
                    if (this[("r" + _local_2.bid)])
                    {
                        _local_3 = teamData[_local_2.tid];
                        this[("r" + _local_2.bid)].refresh(_local_2, _local_3);
                    };
                };
            };
        }

        private function loadCompleteVS(_arg_1:Event):void
        {
            var _local_6:XML;
            var _local_7:Object;
            var _local_2:String = load.data;
            var _local_3:XML = new XML(_local_2);
            var _local_4:XMLList = _local_3.children();
            vsData = {};
            var _local_5:int;
            while (_local_5 < _local_4.length())
            {
                _local_6 = _local_4[_local_5];
                _local_7 = {};
                _local_7.id = int(_local_6.id);
                _local_7.tid = int(_local_6.tid);
                _local_7.bid = int(_local_6.bid);
                _local_7.rid = String(_local_6.rid);
                _local_7.type = int(_local_6.type);
                _local_7.group = int(_local_6.group);
                _local_7.match = int(_local_6.match);
                vsData[_local_7.id] = _local_7;
                _local_5++;
            };
            load.removeEventListener(Event.COMPLETE, loadCompleteVS);
            load.addEventListener(Event.COMPLETE, loadCompleteConfig);
            load.load(new URLRequest(CONFIG_URL));
        }

        public function ___CrossFightPanel_LinkButton25_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(8);
        }

        private function refreshHotInfo():void
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:Object;
            hotTeamData.removeAll();
            hotTeamData2.removeAll();
            var _local_1:Array = new Array();
            for each (_local_2 in teamData)
            {
                if (((((_local_2) && (!(_local_2.tarea == "-1"))) && (_local_2.ttorder >= 1)) && (_local_2.ttorder <= 4)))
                {
                    _local_1.push(_local_2);
                };
            };
            _local_1.sort(sortByType);
            _local_3 = 0;
            while (_local_3 < _local_1.length)
            {
                _local_4 = _local_1[_local_3];
                if (hotTeamData2.length < 3)
                {
                    hotTeamData2.addItem(_local_4);
                }
                else
                {
                    hotTeamData.addItem(_local_4);
                };
                _local_3++;
            };
        }

        private function _CrossFightPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn6 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 50;
            _local_1.sortable = false;
            _local_1.dataField = "tname";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn6", _CrossFightPanel_DataGridColumn6);
            return (_local_1);
        }

        public function ___CrossFightPanel_LinkButton8_click(_arg_1:MouseEvent):void
        {
            toLookRep(7);
        }

        private function loadCompleteTeam(_arg_1:Event):void
        {
            var _local_6:XML;
            var _local_7:Object;
            var _local_2:String = load.data;
            var _local_3:XML = new XML(_local_2);
            var _local_4:XMLList = _local_3.children();
            teamData = {};
            var _local_5:int;
            while (_local_5 < _local_4.length())
            {
                _local_6 = _local_4[_local_5];
                _local_7 = {};
                _local_7.id = int(_local_6.id);
                _local_7.tid = int(_local_6.tid);
                _local_7.tname = String(_local_6.tname);
                _local_7.tarea = String(_local_6.tarea);
                _local_7.torder = int(_local_6.torder);
                _local_7.ttorder = int(_local_6.ttorder);
                _local_7.orderStr = ((Language.CROSS_FIGHT_PANEL_U[(18 + int(_local_6.tgroup))] + "-") + Language.CROSS_FIGHT_PANEL_U[(44 + _local_7.ttorder)]);
                _local_7.treplayid = String(_local_6.treplayid);
                _local_7.tgroup = Language.CROSS_FIGHT_PANEL_U[(18 + int(_local_6.tgroup))];
                _local_7.tside = int(_local_6.tside);
                _local_7.tpoll = 0;
                _local_7.tpollStr = (_local_7.tpoll + Language.CROSS_FIGHT_PANEL_U[51]);
                teamData[_local_7.tid] = _local_7;
                _local_5++;
            };
            load.removeEventListener(Event.COMPLETE, loadCompleteTeam);
            load.addEventListener(Event.COMPLETE, loadCompleteMember);
            load.load(new URLRequest(MEMBER_URL));
        }

        public function set tree(_arg_1:ButtonTree):void
        {
            var _local_2:Object = this._3568542tree;
            if (_local_2 !== _arg_1)
            {
                this._3568542tree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tree", _local_2, _arg_1));
            };
        }

        public function ___CrossFightPanel_LinkButton11_click(_arg_1:MouseEvent):void
        {
            toLookRep(10);
        }

        public function ___CrossFightPanel_LinkButton19_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(2);
        }

        [Bindable(event="propertyChange")]
        public function get lastTitle():Label
        {
            return (this._2002832738lastTitle);
        }

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        private function sortByType(_arg_1:Object, _arg_2:Object):Number
        {
            if (_arg_1.tpoll == _arg_2.tpoll)
            {
                return (0);
            };
            if (_arg_1.tpoll < _arg_2.tpoll)
            {
                return (1);
            };
            return (-1);
        }

        public function ___CrossFightPanel_LinkButton22_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(5);
        }

        public function __lastGroupB_click(_arg_1:MouseEvent):void
        {
            changeGroup(1);
        }

        public function addTeamPoll(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_3:int;
            while (_local_3 < hotTeamData.length)
            {
                _local_4 = hotTeamData.getItemAt(_local_3);
                if (((_local_4) && (_local_4.tid == _arg_1)))
                {
                    _local_4.tpoll = (_local_4.tpoll + _arg_2);
                    _local_4.tpollStr = (_local_4.tpoll + Language.CROSS_FIGHT_PANEL_U[51]);
                };
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < hotTeamData2.length)
            {
                _local_4 = hotTeamData2.getItemAt(_local_3);
                if (((_local_4) && (_local_4.tid == _arg_1)))
                {
                    _local_4.tpoll = (_local_4.tpoll + _arg_2);
                    _local_4.tpollStr = (_local_4.tpoll + Language.CROSS_FIGHT_PANEL_U[51]);
                };
                _local_3++;
            };
            refreshHotInfo();
        }

        public function ___CrossFightPanel_LinkButton5_click(_arg_1:MouseEvent):void
        {
            toLookRep(4);
        }

        private function _CrossFightPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn5 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 35;
            _local_1.sortable = false;
            _local_1.dataField = "tpollStr";
            _local_1.setStyle("textAlign", "right");
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn5", _CrossFightPanel_DataGridColumn5);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:CrossFightPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossFightPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossFightPanelWatcherSetupUtil");
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

        private function _CrossFightPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn10 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 35;
            _local_1.sortable = false;
            _local_1.dataField = "tpollStr";
            _local_1.setStyle("textAlign", "right");
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn10", _CrossFightPanel_DataGridColumn10);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get tree():ButtonTree
        {
            return (this._3568542tree);
        }

        public function ___CrossFightPanel_LinkButton33_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        public function ___CrossFightPanel_LinkButton16_click(_arg_1:MouseEvent):void
        {
            toLookRep(15);
        }

        private function _CrossFightPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                crossFightTitle.text = _arg_1;
            }, "crossFightTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[63];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_Label1.text = _arg_1;
            }, "_CrossFightPanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lastGroupA.label = _arg_1;
            }, "lastGroupA.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lastGroupB.label = _arg_1;
            }, "lastGroupB.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lastGroupC.label = _arg_1;
            }, "lastGroupC.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lastGroupD.label = _arg_1;
            }, "lastGroupD.label");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000233));
            }, function (_arg_1:Object):void
            {
                _CrossFightPanel_Image1.source = _arg_1;
            }, "_CrossFightPanel_Image1.source");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[62];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_Label3.text = _arg_1;
            }, "_CrossFightPanel_Label3.text");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000233));
            }, function (_arg_1:Object):void
            {
                _CrossFightPanel_Image2.source = _arg_1;
            }, "_CrossFightPanel_Image2.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (hotTeamData2);
            }, function (_arg_1:Object):void
            {
                _CrossFightPanel_DataGrid1.dataProvider = _arg_1;
            }, "_CrossFightPanel_DataGrid1.dataProvider");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn1.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn1.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn2.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn2.headerText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn3.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn3.headerText");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn4.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn4.headerText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn5.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn5.headerText");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (hotTeamData);
            }, function (_arg_1:Object):void
            {
                _CrossFightPanel_DataGrid2.dataProvider = _arg_1;
            }, "_CrossFightPanel_DataGrid2.dataProvider");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn6.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn6.headerText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn7.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn7.headerText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn8.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn8.headerText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn9.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn9.headerText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_DataGridColumn10.headerText = _arg_1;
            }, "_CrossFightPanel_DataGridColumn10.headerText");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000222));
            }, function (_arg_1:Object):void
            {
                _CrossFightPanel_Image3.source = _arg_1;
            }, "_CrossFightPanel_Image3.source");
            result[21] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000223));
            }, function (_arg_1:Object):void
            {
                _CrossFightPanel_Image4.source = _arg_1;
            }, "_CrossFightPanel_Image4.source");
            result[22] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000224));
            }, function (_arg_1:Object):void
            {
                _CrossFightPanel_Image5.source = _arg_1;
            }, "_CrossFightPanel_Image5.source");
            result[23] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton1.overSkin");
            result[24] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton1.upSkin");
            result[25] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton1.downSkin");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton1.label = _arg_1;
            }, "_CrossFightPanel_LinkButton1.label");
            result[27] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton2.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton2.overSkin");
            result[28] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton2.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton2.upSkin");
            result[29] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton2.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton2.downSkin");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton2.label = _arg_1;
            }, "_CrossFightPanel_LinkButton2.label");
            result[31] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton3.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton3.overSkin");
            result[32] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton3.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton3.upSkin");
            result[33] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton3.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton3.downSkin");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton3.label = _arg_1;
            }, "_CrossFightPanel_LinkButton3.label");
            result[35] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton4.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton4.overSkin");
            result[36] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton4.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton4.upSkin");
            result[37] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton4.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton4.downSkin");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton4.label = _arg_1;
            }, "_CrossFightPanel_LinkButton4.label");
            result[39] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton5.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton5.overSkin");
            result[40] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton5.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton5.upSkin");
            result[41] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton5.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton5.downSkin");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton5.label = _arg_1;
            }, "_CrossFightPanel_LinkButton5.label");
            result[43] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton6.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton6.overSkin");
            result[44] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton6.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton6.upSkin");
            result[45] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton6.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton6.downSkin");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton6.label = _arg_1;
            }, "_CrossFightPanel_LinkButton6.label");
            result[47] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton7.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton7.overSkin");
            result[48] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton7.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton7.upSkin");
            result[49] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton7.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton7.downSkin");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton7.label = _arg_1;
            }, "_CrossFightPanel_LinkButton7.label");
            result[51] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton8.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton8.overSkin");
            result[52] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton8.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton8.upSkin");
            result[53] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton8.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton8.downSkin");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton8.label = _arg_1;
            }, "_CrossFightPanel_LinkButton8.label");
            result[55] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton9.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton9.overSkin");
            result[56] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton9.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton9.upSkin");
            result[57] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton9.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton9.downSkin");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton9.label = _arg_1;
            }, "_CrossFightPanel_LinkButton9.label");
            result[59] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton10.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton10.overSkin");
            result[60] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton10.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton10.upSkin");
            result[61] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton10.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton10.downSkin");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton10.label = _arg_1;
            }, "_CrossFightPanel_LinkButton10.label");
            result[63] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton11.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton11.overSkin");
            result[64] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton11.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton11.upSkin");
            result[65] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton11.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton11.downSkin");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton11.label = _arg_1;
            }, "_CrossFightPanel_LinkButton11.label");
            result[67] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton12.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton12.overSkin");
            result[68] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton12.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton12.upSkin");
            result[69] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton12.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton12.downSkin");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton12.label = _arg_1;
            }, "_CrossFightPanel_LinkButton12.label");
            result[71] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton13.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton13.overSkin");
            result[72] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton13.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton13.upSkin");
            result[73] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton13.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton13.downSkin");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton13.label = _arg_1;
            }, "_CrossFightPanel_LinkButton13.label");
            result[75] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton14.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton14.overSkin");
            result[76] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton14.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton14.upSkin");
            result[77] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton14.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton14.downSkin");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton14.label = _arg_1;
            }, "_CrossFightPanel_LinkButton14.label");
            result[79] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton15.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton15.overSkin");
            result[80] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton15.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton15.upSkin");
            result[81] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton15.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton15.downSkin");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton15.label = _arg_1;
            }, "_CrossFightPanel_LinkButton15.label");
            result[83] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton16.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton16.overSkin");
            result[84] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton16.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton16.upSkin");
            result[85] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton16.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton16.downSkin");
            result[86] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton16.label = _arg_1;
            }, "_CrossFightPanel_LinkButton16.label");
            result[87] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton17.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton17.overSkin");
            result[88] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton17.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton17.upSkin");
            result[89] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton17.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton17.downSkin");
            result[90] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton17.label = _arg_1;
            }, "_CrossFightPanel_LinkButton17.label");
            result[91] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton18.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton18.overSkin");
            result[92] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton18.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton18.upSkin");
            result[93] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton18.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton18.downSkin");
            result[94] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton18.label = _arg_1;
            }, "_CrossFightPanel_LinkButton18.label");
            result[95] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton19.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton19.overSkin");
            result[96] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton19.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton19.upSkin");
            result[97] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton19.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton19.downSkin");
            result[98] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton19.label = _arg_1;
            }, "_CrossFightPanel_LinkButton19.label");
            result[99] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton20.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton20.overSkin");
            result[100] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton20.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton20.upSkin");
            result[101] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton20.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton20.downSkin");
            result[102] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton20.label = _arg_1;
            }, "_CrossFightPanel_LinkButton20.label");
            result[103] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton21.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton21.overSkin");
            result[104] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton21.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton21.upSkin");
            result[105] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton21.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton21.downSkin");
            result[106] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton21.label = _arg_1;
            }, "_CrossFightPanel_LinkButton21.label");
            result[107] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton22.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton22.overSkin");
            result[108] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton22.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton22.upSkin");
            result[109] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton22.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton22.downSkin");
            result[110] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton22.label = _arg_1;
            }, "_CrossFightPanel_LinkButton22.label");
            result[111] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton23.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton23.overSkin");
            result[112] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton23.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton23.upSkin");
            result[113] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton23.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton23.downSkin");
            result[114] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton23.label = _arg_1;
            }, "_CrossFightPanel_LinkButton23.label");
            result[115] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton24.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton24.overSkin");
            result[116] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton24.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton24.upSkin");
            result[117] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton24.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton24.downSkin");
            result[118] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton24.label = _arg_1;
            }, "_CrossFightPanel_LinkButton24.label");
            result[119] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton25.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton25.overSkin");
            result[120] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton25.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton25.upSkin");
            result[121] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton25.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton25.downSkin");
            result[122] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton25.label = _arg_1;
            }, "_CrossFightPanel_LinkButton25.label");
            result[123] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton26.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton26.overSkin");
            result[124] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton26.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton26.upSkin");
            result[125] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton26.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton26.downSkin");
            result[126] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton26.label = _arg_1;
            }, "_CrossFightPanel_LinkButton26.label");
            result[127] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton27.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton27.overSkin");
            result[128] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton27.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton27.upSkin");
            result[129] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton27.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton27.downSkin");
            result[130] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton27.label = _arg_1;
            }, "_CrossFightPanel_LinkButton27.label");
            result[131] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton28.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton28.overSkin");
            result[132] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton28.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton28.upSkin");
            result[133] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton28.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton28.downSkin");
            result[134] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton28.label = _arg_1;
            }, "_CrossFightPanel_LinkButton28.label");
            result[135] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton29.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton29.overSkin");
            result[136] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton29.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton29.upSkin");
            result[137] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton29.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton29.downSkin");
            result[138] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton29.label = _arg_1;
            }, "_CrossFightPanel_LinkButton29.label");
            result[139] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton30.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton30.overSkin");
            result[140] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton30.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton30.upSkin");
            result[141] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton30.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton30.downSkin");
            result[142] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton30.label = _arg_1;
            }, "_CrossFightPanel_LinkButton30.label");
            result[143] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton31.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton31.overSkin");
            result[144] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton31.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton31.upSkin");
            result[145] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton31.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton31.downSkin");
            result[146] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton31.label = _arg_1;
            }, "_CrossFightPanel_LinkButton31.label");
            result[147] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton32.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton32.overSkin");
            result[148] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton32.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton32.upSkin");
            result[149] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton32.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton32.downSkin");
            result[150] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton32.label = _arg_1;
            }, "_CrossFightPanel_LinkButton32.label");
            result[151] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton33.setStyle("overSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton33.overSkin");
            result[152] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton33.setStyle("upSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton33.upSkin");
            result[153] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossFightPanel_LinkButton33.setStyle("downSkin", _arg_1);
            }, "_CrossFightPanel_LinkButton33.downSkin");
            result[154] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossFightPanel_LinkButton33.label = _arg_1;
            }, "_CrossFightPanel_LinkButton33.label");
            result[155] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                refreshScore.label = _arg_1;
            }, "refreshScore.label");
            result[156] = binding;
            return (result);
        }

        private function closeAllNodes():void
        {
            var _local_1:*;
            for each (_local_1 in tree.openItems)
            {
                tree.expandItem(_local_1, false);
            };
        }

        [Bindable(event="propertyChange")]
        private function get hotTeamData2():ArrayCollection
        {
            return (this._871376994hotTeamData2);
        }

        public function __refreshScore_click(_arg_1:MouseEvent):void
        {
            getLastScore();
        }

        public function set lastGroupA(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1594265560lastGroupA;
            if (_local_2 !== _arg_1)
            {
                this._1594265560lastGroupA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastGroupA", _local_2, _arg_1));
            };
        }

        public function set lastGroupC(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1594265562lastGroupC;
            if (_local_2 !== _arg_1)
            {
                this._1594265562lastGroupC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastGroupC", _local_2, _arg_1));
            };
        }

        public function set lastGroupInfo(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1017286103lastGroupInfo;
            if (_local_2 !== _arg_1)
            {
                this._1017286103lastGroupInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastGroupInfo", _local_2, _arg_1));
            };
        }

        public function set lastGroupD(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1594265563lastGroupD;
            if (_local_2 !== _arg_1)
            {
                this._1594265563lastGroupD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastGroupD", _local_2, _arg_1));
            };
        }

        private function loadCompleteMember(_arg_1:Event):void
        {
            var _local_6:XML;
            var _local_7:Object;
            var _local_2:String = load.data;
            var _local_3:XML = new XML(_local_2);
            var _local_4:XMLList = _local_3.children();
            memberData = {};
            var _local_5:int;
            while (_local_5 < _local_4.length())
            {
                _local_6 = _local_4[_local_5];
                _local_7 = {};
                _local_7.id = int(_local_6.id);
                _local_7.tid = int(_local_6.tid);
                _local_7.cid = int(_local_6.cid);
                _local_7.cname = String(_local_6.cname);
                _local_7.corder = int(_local_6.corder);
                _local_7.ccode = String(_local_6.ccode);
                _local_7.level = String(_local_6.level);
                _local_7.job = String(_local_6.job);
                memberData[_local_7.cid] = _local_7;
                _local_5++;
            };
            load.removeEventListener(Event.COMPLETE, loadCompleteMember);
            load.addEventListener(Event.COMPLETE, loadCompleteVS);
            load.load(new URLRequest(VS_URL));
        }

        private function set hotTeamData2(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._871376994hotTeamData2;
            if (_local_2 !== _arg_1)
            {
                this._871376994hotTeamData2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hotTeamData2", _local_2, _arg_1));
            };
        }

        public function set lastGroupB(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1594265561lastGroupB;
            if (_local_2 !== _arg_1)
            {
                this._1594265561lastGroupB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastGroupB", _local_2, _arg_1));
            };
        }

        public function ___CrossFightPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            toLookRep(1);
        }

        public function ___CrossFightPanel_LinkButton27_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(10);
        }

        private function _CrossFightPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossFightPanel_DataGridColumn4 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 30;
            _local_1.sortable = false;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossFightPanel_DataGridColumn4", _CrossFightPanel_DataGridColumn4);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get lastGroupA():BasicGlowButton
        {
            return (this._1594265560lastGroupA);
        }

        [Bindable(event="propertyChange")]
        public function get lastGroupB():BasicGlowButton
        {
            return (this._1594265561lastGroupB);
        }

        private function _CrossFightPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[0];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[63];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[18];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[19];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[20];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[21];
            _local_1 = ResManager.getIconUrl(4130220000233);
            _local_1 = Language.CROSS_FIGHT_PANEL_U[62];
            _local_1 = ResManager.getIconUrl(4130220000233);
            _local_1 = hotTeamData2;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[11];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[12];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[13];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[14];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[15];
            _local_1 = hotTeamData;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[11];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[12];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[13];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[14];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[15];
            _local_1 = ResManager.getIconUrl(4130220000222);
            _local_1 = ResManager.getIconUrl(4130220000223);
            _local_1 = ResManager.getIconUrl(4130220000224);
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[16];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[17];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.ASTROLOGIC_PANEL_U[38];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[43];
        }

        public function ___CrossFightPanel_LinkButton30_click(_arg_1:MouseEvent):void
        {
            openTeamInfo(13);
        }

        public function ___CrossFightPanel_LinkButton13_click(_arg_1:MouseEvent):void
        {
            toLookRep(12);
        }

        [Bindable(event="propertyChange")]
        public function get lastGroupD():BasicGlowButton
        {
            return (this._1594265563lastGroupD);
        }

        [Bindable(event="propertyChange")]
        public function get lastGroupInfo():Canvas
        {
            return (this._1017286103lastGroupInfo);
        }

        [Bindable(event="propertyChange")]
        public function get lastGroupC():BasicGlowButton
        {
            return (this._1594265562lastGroupC);
        }

        public function set r0(_arg_1:CrossFightResultInfo):void
        {
            var _local_2:Object = this._3582r0;
            if (_local_2 !== _arg_1)
            {
                this._3582r0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r0():CrossFightResultInfo
        {
            return (this._3582r0);
        }

        [Bindable(event="propertyChange")]
        public function get r1():CrossFightResultInfo
        {
            return (this._3583r1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

