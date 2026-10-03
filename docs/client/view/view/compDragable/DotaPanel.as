// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DotaPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import flash.display.Loader;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.PropertyBar;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.compGameStage.NPCView;
    import com.qeedoo.game.object.Npc;
    import mx.core.ClassFactory;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import flash.display.BitmapData;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import mx.binding.BindingManager;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.view.comp.Slot;
    import flash.net.URLRequest;
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

    public class DotaPanel extends DragableCanvas implements IBindingClient 
    {

        public static const DOTA_GAME_INIT_NPC_NUM:int = 5;
        public static const DOTA_GAME_INIT_TOWER_NUM:int = 2;
        public static const DOTA_GAME_INIT_CENTER_NUM:int = 1;
        public static const DOTA_GAME_CENTER_HP:Number = 100000000;
        public static var bombArr:Array = null;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _367456655towerHPB11:Label;
        private var _367456625towerHPB20:Label;
        private var _655265852centerHPA:Label;
        public var _DotaPanel_DataGridColumn1:DataGridColumn;
        public var _DotaPanel_DataGridColumn2:DataGridColumn;
        public var _DotaPanel_DataGridColumn3:DataGridColumn;
        public var _DotaPanel_DataGridColumn4:DataGridColumn;
        public var _DotaPanel_DataGridColumn5:DataGridColumn;
        private var _109532659slot1:ItemSlot;
        private var _49290079NPCLevelB:Label;
        private var _1188124521lineBtn1:BasicGlowButton;
        private var _1188124523lineBtn3:BasicGlowButton;
        private var _109532661slot3:ItemSlot;
        private var _367457586towerHPA20:Label;
        private var _367456594towerHPB30:Label;
        private var _782850297NPCAttackB:Label;
        private var _606510598awardVs:ViewStack;
        private var _659816920rankLabel:Label;
        private var _367456656towerHPB10:Label;
        private var timeNow:Number = 0;
        public var _DotaPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _367457554towerHPA31:Label;
        public var _DotaPanel_Label26:Label;
        private var _655265851centerHPB:Label;
        private var load:Loader;
        private var res_load_state:int = 0;
        public var _DotaPanel_BasicGlowButton9:BasicGlowButton;
        private var _1392427054NPCDefenceA:Label;
        private var _49290078NPCLevelA:Label;
        private var _367457616towerHPA11:Label;
        private var _115312txt:IntroText;
        private var _1945385678infoBtn:BasicGlowButton;
        private var _2112767838battleScroeB:Label;
        private var _1188124522lineBtn2:BasicGlowButton;
        private var _1188124524lineBtn4:BasicGlowButton;
        private var _367456624towerHPB21:Label;
        private var totalRankData:Object;
        private var selectRankLine:int = -1;
        private var _1497492550myScore:Label;
        private var _978074256rankBtn:BasicGlowButton;
        private var _255572470rankData:DataGrid;
        private var _398540274centerHPBBar:PropertyBar;
        private var _367457585towerHPA21:Label;
        private var _367457555towerHPA30:Label;
        private var _398570065centerHPABar:PropertyBar;
        private var _1392427053NPCDefenceB:Label;
        private var isPlaying:Boolean = false;
        private var _211936761gotoBtn:BasicGlowButton;
        private var _109532660slot2:ItemSlot;
        private var _367456593towerHPB31:Label;
        private var _782850296NPCAttackA:Label;
        public var _DotaPanel_Image1:Image;
        public var _DotaPanel_Image2:Image;
        public var _DotaPanel_Image3:Image;
        private var _2112767839battleScroeA:Label;
        private var _2061590094myScoreLabel:Label;
        private var _367457617towerHPA10:Label;
        private var _1548631488ruleBtn:BasicGlowButton;
        public var _DotaPanel_BasicGlowButton10:BasicGlowButton;
        public var _DotaPanel_BasicGlowButton11:BasicGlowButton;
        private var _1621978433awardBtn:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":587,
                    "height":465,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_DotaPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"infoBtn",
                        "events":{"click":"__infoBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "25";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "width":68,
                                "y":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"rankBtn",
                        "events":{"click":"__rankBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "95";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "enabled":false,
                                "styleName":"HorizontalTab",
                                "width":68,
                                "y":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"awardBtn",
                        "events":{"click":"__awardBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "165";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "styleName":"HorizontalTab",
                                "width":88,
                                "y":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"ruleBtn",
                        "events":{"click":"__ruleBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "255";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "styleName":"HorizontalTab",
                                "width":68,
                                "y":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"awardVs",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":400,
                                "x":0,
                                "y":55,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "5";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":572,
                                                        "height":370,
                                                        "styleName":"RoundedGradientBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_DotaPanel_Image1"
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myScoreLabel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "57";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":150,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myScore",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "70";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":150,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"battleScroeA",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "110";
                                                                this.top = "60";
                                                                this.textAlign = "center";
                                                                this.color = 0xFF0000;
                                                                this.fontSize = 26;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":60,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PropertyBar,
                                                            "id":"centerHPABar",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.cornerRadius = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":95,
                                                                    "y":150,
                                                                    "width":115,
                                                                    "height":12,
                                                                    "barCornerRadius":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"centerHPA",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "87";
                                                                this.top = "147";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":130,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPA11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "182";
                                                                this.top = "194";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPA10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "100";
                                                                this.top = "194";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPA21",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "182";
                                                                this.top = "211";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPA20",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "100";
                                                                this.top = "211";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPA31",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "182";
                                                                this.top = "228";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPA30",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "100";
                                                                this.top = "228";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"NPCLevelA",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "78";
                                                                this.top = "328";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":30,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"NPCAttackA",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "117";
                                                                this.top = "328";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"NPCDefenceA",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "163";
                                                                this.top = "328";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"battleScroeB",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "405";
                                                                this.top = "60";
                                                                this.textAlign = "center";
                                                                this.color = 0xFF0000;
                                                                this.fontSize = 26;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":60,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PropertyBar,
                                                            "id":"centerHPBBar",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.cornerRadius = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":390,
                                                                    "y":150,
                                                                    "width":115,
                                                                    "height":12,
                                                                    "barCornerRadius":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"centerHPB",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "382";
                                                                this.top = "147";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":130,
                                                                    "height":110,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPB10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "395";
                                                                this.top = "194";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPB11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "477";
                                                                this.top = "194";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPB20",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "395";
                                                                this.top = "211";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPB21",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "477";
                                                                this.top = "211";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPB30",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "395";
                                                                this.top = "228";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"towerHPB31",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "477";
                                                                this.top = "228";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"NPCLevelB",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "378";
                                                                this.top = "328";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":30,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"NPCAttackB",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "417";
                                                                this.top = "328";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"NPCDefenceB",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "463";
                                                                this.top = "328";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":45,
                                                                    "height":30,
                                                                    "mouseEnabled":false
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
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "5";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":572,
                                                        "height":370,
                                                        "styleName":"RoundedGradientBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_DotaPanel_Image2"
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"rankLabel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "377";
                                                                this.top = "12";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 30;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":20,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lineBtn1",
                                                            "events":{"click":"__lineBtn1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-200";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":true,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":40,
                                                                    "y":15
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lineBtn2",
                                                            "events":{"click":"__lineBtn2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-150";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":40,
                                                                    "y":15
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lineBtn3",
                                                            "events":{"click":"__lineBtn3_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "150";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "visible":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":40,
                                                                    "y":15
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lineBtn4",
                                                            "events":{"click":"__lineBtn4_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "200";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "visible":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":40,
                                                                    "y":15
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"rankData",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 5;
                                                                this.horizontalCenter = "0";
                                                                this.top = "54";
                                                                this.textAlign = "center";
                                                                this.fontSize = 16;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "sortableColumns":false,
                                                                    "selectable":false,
                                                                    "height":250,
                                                                    "rowHeight":26,
                                                                    "width":510,
                                                                    "headerHeight":34,
                                                                    "columns":[_DotaPanel_DataGridColumn1_i(), _DotaPanel_DataGridColumn2_i(), _DotaPanel_DataGridColumn3_i(), _DotaPanel_DataGridColumn4_i(), _DotaPanel_DataGridColumn5_i()]
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
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "5";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":572,
                                                        "height":370,
                                                        "styleName":"RoundedGradientBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_DotaPanel_Image3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "2";
                                                                this.top = "3";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DotaPanel_Label26",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "15";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 26;
                                                                this.fontWeight = "bold";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "3";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":122,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_DotaPanel_BasicGlowButton9",
                                                            "events":{"click":"___DotaPanel_BasicGlowButton9_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "3";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":162,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "157";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":271,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_DotaPanel_BasicGlowButton10",
                                                            "events":{"click":"___DotaPanel_BasicGlowButton10_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "157";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":312,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "142";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":271,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_DotaPanel_BasicGlowButton11",
                                                            "events":{"click":"___DotaPanel_BasicGlowButton11_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "142";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":312,
                                                                    "styleName":"BtnStdRed"
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
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "50";
                                        this.left = "5";
                                        this.right = "5";
                                        this.bottom = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"txt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "5";
                                                    this.top = "5";
                                                    this.right = "5";
                                                    this.backgroundAlpha = 0;
                                                    this.fontStyle = "normal";
                                                    this.fontWeight = "bold";
                                                    this.textAlign = "left";
                                                    this.fontSize = 12;
                                                    this.borderThickness = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":310,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"gotoBtn",
                                                "events":{"click":"__gotoBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "3";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":70,
                                                        "styleName":"BtnStdRed"
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
        private var _core:Core = Core.getInstance();
        private var rankList:ArrayCollection = new ArrayCollection();
        private var dData:Object = {};
        private var npcListA:Object = {};
        private var npcListB:Object = {};
        private var towerListA:Object = {};
        private var towerListB:Object = {};
        private var centerListA:Object = {};
        private var centerListB:Object = {};
        private var npcAttackInfo:Array = ["100%", "130%", "160%"];
        private var npcDefenceInfo:Array = ["100%", "150%", "250%"];
        private var pointsB:Array = [[490, 38], [490, 40], [490, 42], [495, 39], [495, 41], [490, 148], [490, 150], [490, 152], [495, 149], [495, 151], [490, 263], [490, 265], [490, 267], [495, 264], [495, 266]];
        private var pointsA:Array = [[130, 38], [130, 40], [130, 42], [125, 39], [125, 41], [130, 148], [130, 150], [130, 152], [125, 149], [125, 151], [130, 263], [130, 265], [130, 267], [125, 264], [125, 266]];
        private var pointsB_tower:Array = [[355, 40], [445, 40], [355, 150], [445, 150], [355, 265], [445, 265]];
        private var pointsA_tower:Array = [[0xFF, 40], [165, 40], [0xFF, 150], [165, 150], [0xFF, 265], [165, 265]];
        private var pointsB_center:Array = [[525, 40], [525, 150], [525, 265]];
        private var pointsA_center:Array = [[85, 40], [85, 150], [85, 265]];
        private var pointsB_recover:Array = [[595, 100], [595, 210]];
        private var pointsA_recover:Array = [[30, 100], [30, 210]];
        private var resCodeConfig:Object = {
            "2146":[2060100001191, 2060100001192],
            "2147":[2060100001200, 2060100001201],
            "2149":[2060100001206, 2060100001207],
            "2150":[2060100001215, 2060100001216],
            "2157":[2060100001194, 2060100001195],
            "2158":[2060100001197, 2060100001198],
            "2159":[2060100001203, 2060100001204],
            "2160":[2060100001209, 2060100001210],
            "2161":[2060100001212, 2060100001213],
            "2162":[2060100001218, 2060100001219]
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DotaPanel()
        {
            mx_internal::_document = this;
            this.width = 587;
            this.height = 465;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___DotaPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DotaPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get gotoBtn():BasicGlowButton
        {
            return (this._211936761gotoBtn);
        }

        public function set NPCAttackB(_arg_1:Label):void
        {
            var _local_2:Object = this._782850297NPCAttackB;
            if (_local_2 !== _arg_1)
            {
                this._782850297NPCAttackB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "NPCAttackB", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1():ItemSlot
        {
            return (this._109532659slot1);
        }

        private function npcSetPosition(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:NPCView = (_core.view.getN(_arg_1.index) as NPCView);
            if (_local_2)
            {
                _local_2.setSpeed(15);
                _local_2.walkTo((_arg_1.nx * 10), (_arg_1.ny * 10));
            };
        }

        public function set awardVs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._606510598awardVs;
            if (_local_2 !== _arg_1)
            {
                this._606510598awardVs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardVs", _local_2, _arg_1));
            };
        }

        private function centerHurt(_arg_1:int, _arg_2:Number):void
        {
            var _local_5:Object;
            var _local_6:Npc;
            var _local_7:NPCView;
            if (!dData)
            {
                return;
            };
            if (_arg_1 == 1)
            {
                dData.HPA = _arg_2;
            }
            else
            {
                if (_arg_1 == 2)
                {
                    dData.HPB = _arg_2;
                }
                else
                {
                    return;
                };
            };
            var _local_3:Object;
            var _local_4:Number = 0;
            if (_arg_1 == 1)
            {
                _local_3 = centerListA;
                _local_4 = dData.HPA;
            }
            else
            {
                _local_3 = centerListB;
                _local_4 = dData.HPB;
            };
            for (_local_5 in _local_3)
            {
                _local_6 = _local_3[_local_5];
                _local_7 = (_core.view.getN(_local_6.id) as NPCView);
                if (_local_7)
                {
                    _local_7.refreshHpBar(_local_4, DOTA_GAME_CENTER_HP, _arg_1);
                };
            };
        }

        private function _DotaPanel_ClassFactory4_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = DotaPanel_inlineComponent4;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot2():ItemSlot
        {
            return (this._109532660slot2);
        }

        [Bindable(event="propertyChange")]
        public function get rankData():DataGrid
        {
            return (this._255572470rankData);
        }

        public function set gotoBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._211936761gotoBtn;
            if (_local_2 !== _arg_1)
            {
                this._211936761gotoBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gotoBtn", _local_2, _arg_1));
            };
        }

        public function onGetDotaData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Charactor;
            if (((!(_arg_1)) || (!(_arg_1.tData))))
            {
                return;
            };
            dData = _arg_1.tData;
            timeNow = _arg_1.nt;
            isPlaying = ((dData.state == 1) ? true : false);
            cleanNpc();
            initNpcs(dData["npcsA"], pointsA, npcListA);
            initNpcs(dData["npcsB"], pointsB, npcListB);
            cleanTower();
            initTowers(dData["towersA"], pointsA_tower, towerListA);
            initTowers(dData["towersB"], pointsB_tower, towerListB);
            cleanCenter();
            initCenters(dData["centersA"], pointsA_center, centerListA);
            initCenters(dData["centersB"], pointsB_center, centerListB);
            initRecover(dData["recoverA"], pointsA_recover);
            initRecover(dData["recoverB"], pointsB_recover);
            if (_arg_1.grouping)
            {
                _local_2 = _arg_1["cs"];
                for (_local_3 in _local_2)
                {
                    if (_local_3 != _core.player.id)
                    {
                        _local_4 = _core.getCharactor(Number(_local_3));
                        if (_local_4)
                        {
                            _local_4.view.posX = -500;
                            _local_4.view.posY = -500;
                        };
                    };
                };
            };
        }

        public function onNpcBattleWithPlayerStart(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Object;
            if (_arg_1.npcData.group == 1)
            {
                _local_2 = npcListA;
            }
            else
            {
                _local_2 = npcListB;
            };
            var _local_3:Npc = _local_2[_arg_1.npcData.index];
            _local_3.dotaData.inBattle = true;
            _local_3.dotaData.busy = true;
            var _local_4:NPCView = (_core.view.getN(_local_3.id) as NPCView);
            if (_local_4)
            {
                if (resCodeConfig[_local_3.dotaData.npcId])
                {
                    _local_4.reloadDota(resCodeConfig[_local_3.dotaData.npcId][1]);
                };
                _local_4.stop();
            };
        }

        public function set towerHPA31(_arg_1:Label):void
        {
            var _local_2:Object = this._367457554towerHPA31;
            if (_local_2 !== _arg_1)
            {
                this._367457554towerHPA31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPA31", _local_2, _arg_1));
            };
        }

        public function set rankData(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._255572470rankData;
            if (_local_2 !== _arg_1)
            {
                this._255572470rankData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankData", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get centerHPBBar():PropertyBar
        {
            return (this._398540274centerHPBBar);
        }

        [Bindable(event="propertyChange")]
        public function get awardVs():ViewStack
        {
            return (this._606510598awardVs);
        }

        [Bindable(event="propertyChange")]
        public function get rankLabel():Label
        {
            return (this._659816920rankLabel);
        }

        private function refreshInfo(_arg_1:Object, _arg_2:Object):void
        {
            var _local_4:int;
            var _local_5:Object;
            var _local_6:Object;
            battleScroeA.text = dData["totalScoreA"];
            battleScroeB.text = dData["totalScoreB"];
            var _local_3:int = 1;
            while (_local_3 <= 3)
            {
                _local_4 = 0;
                while (_local_4 <= 1)
                {
                    this[(("towerHPA" + _local_3) + _local_4)].text = "0%";
                    this[(("towerHPB" + _local_3) + _local_4)].text = "0%";
                    _local_4++;
                };
                _local_3++;
            };
            if (_arg_1)
            {
                _local_3 = 1;
                while (_local_3 <= 3)
                {
                    _local_4 = 0;
                    while (_local_4 <= 1)
                    {
                        _local_5 = _arg_1[(("A" + _local_3) + _local_4)];
                        _local_6 = _arg_1[(("B" + _local_3) + _local_4)];
                        if (_local_5)
                        {
                            this[(("towerHPA" + _local_3) + _local_4)].text = (Math.floor(((_local_5.now * 100) / _local_5.max)) + "%");
                        };
                        if (_local_6)
                        {
                            this[(("towerHPB" + _local_3) + _local_4)].text = (Math.floor(((_local_6.now * 100) / _local_6.max)) + "%");
                        };
                        _local_4++;
                    };
                    _local_3++;
                };
            };
            NPCLevelA.text = _arg_2["lvlA"];
            NPCLevelB.text = _arg_2["lvlB"];
            NPCAttackA.text = npcAttackInfo[int(_arg_2["lvlA"])];
            NPCAttackB.text = npcAttackInfo[int(_arg_2["lvlB"])];
            NPCDefenceA.text = npcDefenceInfo[int(_arg_2["lvlA"])];
            NPCDefenceB.text = npcDefenceInfo[int(_arg_2["lvlB"])];
        }

        private function initRecover(_arg_1:Object, _arg_2:Array):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            if (!_arg_1)
            {
                return;
            };
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                for (_local_5 in _local_4)
                {
                    _local_6 = _local_4[_local_5];
                    _local_7 = _core.data.gameData[GamePredef.TBL_NPC][_local_6.npcId];
                    if (!((!(_local_7)) || (_local_6.isDead)))
                    {
                        _local_7.id = _local_6.index;
                        _local_7.posX = (_arg_2[(((_local_6.lineId - 1) * DOTA_GAME_INIT_CENTER_NUM) + _local_6.pIndex)][0] * 10);
                        _local_7.posY = (_arg_2[(((_local_6.lineId - 1) * DOTA_GAME_INIT_CENTER_NUM) + _local_6.pIndex)][1] * 10);
                        _local_7.nid = _local_6.npcId;
                        _core.createNpc(_local_7);
                    };
                };
            };
        }

        public function ___DotaPanel_BasicGlowButton11_click(_arg_1:MouseEvent):void
        {
            getLossAward();
        }

        public function set towerHPA30(_arg_1:Label):void
        {
            var _local_2:Object = this._367457555towerHPA30;
            if (_local_2 !== _arg_1)
            {
                this._367457555towerHPA30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPA30", _local_2, _arg_1));
            };
        }

        public function set centerHPBBar(_arg_1:PropertyBar):void
        {
            var _local_2:Object = this._398540274centerHPBBar;
            if (_local_2 !== _arg_1)
            {
                this._398540274centerHPBBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "centerHPBBar", _local_2, _arg_1));
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_5:BitmapData;
            var _local_2:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("bomb") as Class);
            var _local_3:MovieClip = new (_local_2)();
            bombArr = [];
            var _local_4:int = 1;
            while (_local_4 <= _local_3.totalFrames)
            {
                _local_3.gotoAndStop(_local_4);
                _local_5 = new BitmapData(160, 160, true, 0xFFFFFF);
                _local_5.draw(_local_3);
                bombArr.push(_local_5);
                _local_4++;
            };
            res_load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
        }

        private function cleanTower():void
        {
            var _local_1:Object;
            var _local_2:Npc;
            var _local_3:Object;
            var _local_4:Npc;
            if (towerListA)
            {
                for (_local_1 in towerListA)
                {
                    _local_2 = towerListA[_local_1];
                    _core.view.removeN(_local_2.id);
                };
                towerListA = {};
            };
            if (towerListB)
            {
                for (_local_3 in towerListB)
                {
                    _local_4 = towerListB[_local_3];
                    _core.view.removeN(_local_4.id);
                };
                towerListB = {};
            };
        }

        public function onGroupHurtByNpc(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            onNpcBattleWithPlayerEnd({"npcData":_arg_1.npcData});
            centerHurt(_arg_1.npcData.group, _arg_1.lefthp);
        }

        private function getLossAward():void
        {
            _core.remote.call("dotaGetLossAward", null);
        }

        public function set towerHPA20(_arg_1:Label):void
        {
            var _local_2:Object = this._367457586towerHPA20;
            if (_local_2 !== _arg_1)
            {
                this._367457586towerHPA20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPA20", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myScore():Label
        {
            return (this._1497492550myScore);
        }

        [Bindable(event="propertyChange")]
        public function get myScoreLabel():Label
        {
            return (this._2061590094myScoreLabel);
        }

        public function set rankLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._659816920rankLabel;
            if (_local_2 !== _arg_1)
            {
                this._659816920rankLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankLabel", _local_2, _arg_1));
            };
        }

        private function npcMove(_arg_1:Npc):void
        {
            var _local_7:Number;
            if ((((((!(isPlaying)) || (!(_arg_1))) || (!(_arg_1.dotaData))) || (_arg_1.dotaData.isDead)) || (_arg_1.dotaData.inBattle)))
            {
                return;
            };
            var _local_2:int = _arg_1.dotaData.group;
            var _local_3:Array;
            if (_local_2 == 1)
            {
                _local_3 = pointsB_center;
            }
            else
            {
                _local_3 = pointsA_center;
            };
            var _local_4:int = _arg_1.dotaData.lineId;
            var _local_5:Array = _local_3[(_local_4 - 1)];
            var _local_6:NPCView = (_core.view.getN(_arg_1.id) as NPCView);
            if (_local_6)
            {
                _local_7 = _arg_1.dotaData.speed;
                _local_7 = ((_local_7 / GamePredef.GLOBAL_FRAME_RATE) * 10);
                _local_6.setSpeed(1.7);
                if (resCodeConfig[_arg_1.dotaData.npcId])
                {
                    _local_6.reloadDota(resCodeConfig[_arg_1.dotaData.npcId][0]);
                };
                _local_6.walkTo((_local_5[0] * 10), (_local_5[1] * 10));
            };
        }

        public function __lineBtn2_click(_arg_1:MouseEvent):void
        {
            lineChange(4);
        }

        private function centerDead(_arg_1:Object):void
        {
            var _local_4:NPCView;
            var _local_5:int;
            var _local_6:Object;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Npc = getDotaNpc(_arg_1, centerListA, centerListB);
            if (_local_2)
            {
                _arg_1.isDead = true;
                _local_4 = (_core.view.getN(_local_2.id) as NPCView);
                _core.view.removeN(_local_2.id);
                if (_local_4)
                {
                    _local_4.dotaDead();
                };
                _local_4 = (_core.view.getN(_local_2.id) as NPCView);
                if (_local_4)
                {
                    _local_4.refreshHpBar(0, _arg_1.maxhp, _arg_1.group);
                };
            };
            var _local_3:Object;
            if (_arg_1.group == 1)
            {
                _local_3 = dData["towersA"];
            }
            else
            {
                _local_3 = dData["towersB"];
            };
            if (_local_3)
            {
                _local_5 = 0;
                while (_local_5 < _local_3.length)
                {
                    _local_6 = _local_3[_local_5];
                    if (((_local_6) && (_local_6.index == _arg_1.index)))
                    {
                        _local_6.isDead = true;
                        return;
                    };
                    _local_5++;
                };
            };
        }

        public function onNpcBattleWithPlayerEnd(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:Npc;
            var _local_5:NPCView;
            if (((!(_arg_1)) || (!(_arg_1.npcData))))
            {
                return;
            };
            var _local_2:Object = _arg_1.npcData;
            if (_local_2.isDead)
            {
                npcDead(_local_2);
            }
            else
            {
                _local_3 = null;
                if (_local_2.group == 1)
                {
                    _local_3 = npcListA;
                }
                else
                {
                    _local_3 = npcListB;
                };
                _local_4 = _local_3[_local_2.index];
                _local_4.dotaData.inBattle = false;
                _local_4.dotaData.busy = false;
                _local_4.dotaData.hp = _local_2.hp;
                _local_5 = (_core.view.getN(_local_4.id) as NPCView);
                if (_local_5)
                {
                    _local_5.refreshHpBar(_local_2.hp, _local_2.maxhp, _local_2.group);
                };
                npcMove(_local_4);
            };
        }

        private function _DotaPanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = DotaPanel_inlineComponent3;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function __ruleBtn_click(_arg_1:MouseEvent):void
        {
            tabClick(3);
        }

        public function onGetRefreshNpc(_arg_1:Object):void
        {
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Npc;
            var _local_8:NPCView;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Npc;
            if (!_arg_1)
            {
                return;
            };
            _core.sysMidMsg(Language.DOTA_PANEL[1]);
            var _local_2:Array = _arg_1.npcA;
            var _local_3:Array = _arg_1.npcB;
            var _local_4:int;
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                _local_5 = _local_2[_local_4];
                _local_6 = _core.data.gameData[GamePredef.TBL_NPC][_local_5.npcId];
                if (!((!(_local_6)) || (_local_5.isDead)))
                {
                    _local_6.id = _local_5.index;
                    _local_6.posX = (pointsA[(((_local_5.lineId - 1) * DOTA_GAME_INIT_NPC_NUM) + _local_5.pIndex)][0] * 10);
                    _local_6.posY = (pointsA[(((_local_5.lineId - 1) * DOTA_GAME_INIT_NPC_NUM) + _local_5.pIndex)][1] * 10);
                    _local_6.nid = _local_5.npcId;
                    _local_6.busy = false;
                    _core.createNpc(_local_6);
                    _local_7 = _core.getNpc(_local_6.id);
                    if (_local_7)
                    {
                        _local_7.dotaData = _local_5;
                        _local_7.state = 101;
                        npcListA[_local_5.index] = _local_7;
                        npcMove(_local_7);
                        _local_8 = (_core.view.getN(_local_7.id) as NPCView);
                        if (_local_8)
                        {
                            _local_8.refreshHpBar(_local_5.hp, _local_5.maxhp, _local_5.group);
                            _local_8.dotaFaceTo(2);
                        };
                    };
                    dData["npcsA"][_local_5.index] = _local_5;
                };
                _local_4++;
            };
            _local_4 = 0;
            while (_local_4 < _local_3.length)
            {
                _local_9 = _local_3[_local_4];
                _local_10 = _core.data.gameData[GamePredef.TBL_NPC][_local_9.npcId];
                if (!((!(_local_10)) || (_local_9.isDead)))
                {
                    _local_10.id = _local_9.index;
                    _local_10.posX = (pointsB[(((_local_9.lineId - 1) * DOTA_GAME_INIT_NPC_NUM) + _local_9.pIndex)][0] * 10);
                    _local_10.posY = (pointsB[(((_local_9.lineId - 1) * DOTA_GAME_INIT_NPC_NUM) + _local_9.pIndex)][1] * 10);
                    _local_10.nid = _local_9.npcId;
                    _local_10.busy = false;
                    _core.createNpc(_local_10);
                    _local_11 = _core.getNpc(_local_10.id);
                    if (_local_11)
                    {
                        _local_11.dotaData = _local_9;
                        _local_11.state = 101;
                        npcListB[_local_9.index] = _local_11;
                        npcMove(_local_11);
                        _local_8 = (_core.view.getN(_local_11.id) as NPCView);
                        if (_local_8)
                        {
                            _local_8.refreshHpBar(_local_9.hp, _local_9.maxhp, _local_9.group);
                            _local_8.dotaFaceTo(6);
                        };
                    };
                    dData["npcsB"][_local_9.index] = _local_9;
                };
                _local_4++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get towerHPB10():Label
        {
            return (this._367456656towerHPB10);
        }

        [Bindable(event="propertyChange")]
        public function get towerHPB11():Label
        {
            return (this._367456655towerHPB11);
        }

        [Bindable(event="propertyChange")]
        public function get txt():IntroText
        {
            return (this._115312txt);
        }

        public function onCenterBattleWithPlayerEnd(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            centerHurt(_arg_1.group, _arg_1.lefthp);
        }

        public function set myScore(_arg_1:Label):void
        {
            var _local_2:Object = this._1497492550myScore;
            if (_local_2 !== _arg_1)
            {
                this._1497492550myScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myScore", _local_2, _arg_1));
            };
        }

        public function onGetPanelData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Object = _arg_1.battle;
            dData["totalScoreA"] = _local_2["scoreA"];
            dData["totalScoreB"] = _local_2["scoreB"];
            totalRankData = _arg_1.rank;
            var _local_3:Object = _arg_1.state;
            var _local_4:Object = _arg_1.score;
            myScore.text = _local_4.toString();
            rankBtn.enabled = (!(totalRankData == null));
            awardBtn.enabled = rankBtn.enabled;
            selectRankLine = 3;
            refreshRank();
            if (int(_arg_1.battle.HPA) < 0)
            {
                _arg_1.battle.HPA = 0;
            };
            if (int(_arg_1.battle.HPB) < 0)
            {
                _arg_1.battle.HPB = 0;
            };
            centerHPABar.value = Math.floor(_arg_1.battle.HPA);
            centerHPBBar.value = Math.floor(_arg_1.battle.HPB);
            centerHPA.text = ((Math.floor(_arg_1.battle.HPA) + "/") + DOTA_GAME_CENTER_HP);
            centerHPB.text = ((Math.floor(_arg_1.battle.HPB) + "/") + DOTA_GAME_CENTER_HP);
            refreshInfo(_arg_1["tower"], _arg_1["npc"]);
        }

        public function cleanAll():void
        {
            cleanNpc();
            cleanTower();
            cleanCenter();
        }

        private function _DotaPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = DotaPanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function set myScoreLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._2061590094myScoreLabel;
            if (_local_2 !== _arg_1)
            {
                this._2061590094myScoreLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myScoreLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battleScroeA():Label
        {
            return (this._2112767839battleScroeA);
        }

        [Bindable(event="propertyChange")]
        public function get battleScroeB():Label
        {
            return (this._2112767838battleScroeB);
        }

        [Bindable(event="propertyChange")]
        public function get towerHPB20():Label
        {
            return (this._367456625towerHPB20);
        }

        [Bindable(event="propertyChange")]
        public function get rankBtn():BasicGlowButton
        {
            return (this._978074256rankBtn);
        }

        [Bindable(event="propertyChange")]
        public function get towerHPB30():Label
        {
            return (this._367456594towerHPB30);
        }

        [Bindable(event="propertyChange")]
        public function get towerHPA10():Label
        {
            return (this._367457617towerHPA10);
        }

        [Bindable(event="propertyChange")]
        public function get towerHPA11():Label
        {
            return (this._367457616towerHPA11);
        }

        private function refreshNpcConfigData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Npc;
            var _local_6:NPCView;
            if (!_arg_1)
            {
                return;
            };
            for (_local_2 in _arg_1)
            {
                _local_3 = _arg_1[_local_2];
                if (_local_3.isDead)
                {
                    npcDead(_local_3);
                }
                else
                {
                    _local_4 = null;
                    if (_local_3.group == 1)
                    {
                        _local_4 = npcListA;
                    }
                    else
                    {
                        _local_4 = npcListB;
                    };
                    _local_5 = _local_4[_local_3.index];
                    _local_5.inBattle = _local_3.inBattle;
                    _local_5.inAttack = _local_3.inAttack;
                    _local_5.busy = ((_local_5.inBattle) || (_local_5.inAttack));
                    _local_5.hp = _local_3.hp;
                    _local_6 = (_core.view.getN(_local_5.id) as NPCView);
                    if (_local_6)
                    {
                        _local_6.refreshHpBar(_local_3.hp, _local_3.maxhp, _local_3.group);
                        if (_local_5.busy)
                        {
                            if (resCodeConfig[_local_3.npcId])
                            {
                                _local_6.reloadDota(resCodeConfig[_local_3.npcId][1]);
                            };
                            _local_6.stop();
                            npcSetPosition(_local_3);
                        }
                        else
                        {
                            npcMove(_local_5);
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get towerHPB31():Label
        {
            return (this._367456593towerHPB31);
        }

        public function set NPCLevelA(_arg_1:Label):void
        {
            var _local_2:Object = this._49290078NPCLevelA;
            if (_local_2 !== _arg_1)
            {
                this._49290078NPCLevelA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "NPCLevelA", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get towerHPB21():Label
        {
            return (this._367456624towerHPB21);
        }

        public function ___DotaPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn():BasicGlowButton
        {
            return (this._1621978433awardBtn);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" dota load res Error ");
        }

        private function lineChange(_arg_1:int):void
        {
            lineBtn1.selected = (_arg_1 == 3);
            lineBtn2.selected = (_arg_1 == 4);
            lineBtn3.selected = (_arg_1 == 5);
            lineBtn4.selected = (_arg_1 == 6);
            selectRankLine = _arg_1;
            refreshRank();
        }

        public function set NPCLevelB(_arg_1:Label):void
        {
            var _local_2:Object = this._49290079NPCLevelB;
            if (_local_2 !== _arg_1)
            {
                this._49290079NPCLevelB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "NPCLevelB", _local_2, _arg_1));
            };
        }

        private function _DotaPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _DotaPanel_DataGridColumn5 = _local_1;
            _local_1.width = 50;
            _local_1.dataField = "pvpWin";
            _local_1.itemRenderer = _DotaPanel_ClassFactory5_c();
            _local_1.setStyle("color", 0xFFFF);
            BindingManager.executeBindings(this, "_DotaPanel_DataGridColumn5", _DotaPanel_DataGridColumn5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get towerHPA21():Label
        {
            return (this._367457585towerHPA21);
        }

        private function _DotaPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = DotaPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function onDotaGameEnd(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(isPlaying))))
            {
                return;
            };
            dData.state = _arg_1.state;
            dData.HPA = _arg_1.HPA;
            dData.HPB = _arg_1.HPB;
            isPlaying = false;
            if (((dData.HPA == 0) && (dData.HPB == 0)))
            {
                _core.sysMidMsg(Language.DOTA_PANEL[5]);
            }
            else
            {
                if (dData.HPA == 0)
                {
                    _core.sysMidMsg(Language.DOTA_PANEL[3]);
                }
                else
                {
                    if (dData.HPB == 0)
                    {
                        _core.sysMidMsg(Language.DOTA_PANEL[4]);
                    };
                };
            };
        }

        public function set lineBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1188124522lineBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1188124522lineBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lineBtn2", _local_2, _arg_1));
            };
        }

        public function set lineBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1188124523lineBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1188124523lineBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lineBtn3", _local_2, _arg_1));
            };
        }

        public function set lineBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1188124524lineBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1188124524lineBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lineBtn4", _local_2, _arg_1));
            };
        }

        public function set lineBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1188124521lineBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1188124521lineBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lineBtn1", _local_2, _arg_1));
            };
        }

        private function getRankAward():void
        {
            _core.remote.call("dotaGetRankAward", null);
        }

        public function __lineBtn4_click(_arg_1:MouseEvent):void
        {
            lineChange(6);
        }

        public function set towerHPB10(_arg_1:Label):void
        {
            var _local_2:Object = this._367456656towerHPB10;
            if (_local_2 !== _arg_1)
            {
                this._367456656towerHPB10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPB10", _local_2, _arg_1));
            };
        }

        private function initNpcs(_arg_1:Object, _arg_2:Array, _arg_3:Object):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Boolean;
            var _local_8:Number;
            var _local_9:Boolean;
            var _local_10:Npc;
            var _local_11:NPCView;
            if (!_arg_1)
            {
                return;
            };
            for (_local_4 in _arg_1)
            {
                _local_5 = _arg_1[_local_4];
                _local_6 = _core.data.gameData[GamePredef.TBL_NPC][_local_5.npcId];
                if (!((!(_local_6)) || (_local_5.isDead)))
                {
                    _local_6.id = _local_5.index;
                    _local_7 = ((_local_5.inAttack) || (_local_5.inBattle));
                    _local_8 = _local_5.moveTime;
                    if (!_local_7)
                    {
                        _local_8 = (_local_5.moveTime + (timeNow - _local_5.startMoveTime));
                    };
                    _local_9 = false;
                    if (_local_5.group == 2)
                    {
                        _local_6.posX = ((_arg_2[(((_local_5.lineId - 1) * DOTA_GAME_INIT_NPC_NUM) + _local_5.pIndex)][0] * 10) + (((_local_8 / 1000) * _local_5.speed) * 10));
                        if (_local_6.posX < (pointsA_center[0][0] * 10))
                        {
                            _local_6.posX = (pointsA_center[0][0] * 10);
                            _local_9 = true;
                        };
                    }
                    else
                    {
                        _local_6.posX = ((_arg_2[(((_local_5.lineId - 1) * DOTA_GAME_INIT_NPC_NUM) + _local_5.pIndex)][0] * 10) - (((_local_8 / 1000) * _local_5.speed) * 10));
                        if (_local_6.posX > (pointsB_center[0][0] * 10))
                        {
                            _local_6.posX = (pointsB_center[0][0] * 10);
                            _local_9 = true;
                        };
                    };
                    _local_6.posY = (_arg_2[(((_local_5.lineId - 1) * DOTA_GAME_INIT_NPC_NUM) + _local_5.pIndex)][1] * 10);
                    _local_6.nid = _local_5.npcId;
                    _local_6.busy = false;
                    _core.createNpc(_local_6);
                    _local_10 = _core.getNpc(_local_6.id);
                    if (_local_10)
                    {
                        _local_10.dotaData = _local_5;
                        _local_10.state = 101;
                        _arg_3[_local_4] = _local_10;
                        if (!_local_9)
                        {
                            npcMove(_local_10);
                        };
                        _local_11 = (_core.view.getN(_local_10.id) as NPCView);
                        if (_local_11)
                        {
                            _local_11.refreshHpBar(_local_5.hp, _local_5.maxhp, _local_5.group);
                            if (_local_9)
                            {
                                if (resCodeConfig[_local_10.dotaData.npcId])
                                {
                                    _local_11.reloadDota(resCodeConfig[_local_10.dotaData.npcId][1]);
                                };
                            }
                            else
                            {
                                if (resCodeConfig[_local_10.dotaData.npcId])
                                {
                                    _local_11.reloadDota(resCodeConfig[_local_10.dotaData.npcId][0]);
                                };
                            };
                            if (_local_5.group == 1)
                            {
                                _local_11.dotaFaceTo(2);
                            }
                            else
                            {
                                _local_11.dotaFaceTo(6);
                            };
                        };
                    };
                };
            };
        }

        public function ___DotaPanel_BasicGlowButton10_click(_arg_1:MouseEvent):void
        {
            getWinAward();
        }

        private function npcDead(_arg_1:Object):void
        {
            var _local_4:NPCView;
            var _local_5:int;
            var _local_6:Object;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Npc = getDotaNpc(_arg_1, npcListA, npcListB);
            if (_local_2)
            {
                _arg_1.isDead = true;
                _local_4 = (_core.view.getN(_local_2.id) as NPCView);
                _core.view.removeN(_local_2.id);
                if (_local_4)
                {
                    _local_4.dotaDead();
                };
            };
            var _local_3:Object;
            if (_arg_1.group == 1)
            {
                _local_3 = dData["npcsA"];
            }
            else
            {
                _local_3 = dData["npcsB"];
            };
            if (_local_3)
            {
                _local_5 = 0;
                while (_local_5 < _local_3.length)
                {
                    _local_6 = _local_3[_local_5];
                    if (((_local_6) && (_local_6.index == _arg_1.index)))
                    {
                        _local_6.isDead = true;
                        return;
                    };
                    _local_5++;
                };
            };
        }

        public function set txt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._115312txt;
            if (_local_2 !== _arg_1)
            {
                this._115312txt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt", _local_2, _arg_1));
            };
        }

        public function set towerHPB11(_arg_1:Label):void
        {
            var _local_2:Object = this._367456655towerHPB11;
            if (_local_2 !== _arg_1)
            {
                this._367456655towerHPB11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPB11", _local_2, _arg_1));
            };
        }

        private function _DotaPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_DotaPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                infoBtn.label = _arg_1;
            }, "infoBtn.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rankBtn.label = _arg_1;
            }, "rankBtn.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn.label = _arg_1;
            }, "awardBtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                ruleBtn.label = _arg_1;
            }, "ruleBtn.label");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000394));
            }, function (_arg_1:Object):void
            {
                _DotaPanel_Image1.source = _arg_1;
            }, "_DotaPanel_Image1.source");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myScoreLabel.text = _arg_1;
            }, "myScoreLabel.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                battleScroeA.filters = _arg_1;
            }, "battleScroeA.filters");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (DOTA_GAME_CENTER_HP);
            }, function (_arg_1:int):void
            {
                centerHPABar.valueMax = _arg_1;
            }, "centerHPABar.valueMax");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                battleScroeB.filters = _arg_1;
            }, "battleScroeB.filters");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (DOTA_GAME_CENTER_HP);
            }, function (_arg_1:int):void
            {
                centerHPBBar.valueMax = _arg_1;
            }, "centerHPBBar.valueMax");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000396));
            }, function (_arg_1:Object):void
            {
                _DotaPanel_Image2.source = _arg_1;
            }, "_DotaPanel_Image2.source");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                rankLabel.filters = _arg_1;
            }, "rankLabel.filters");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lineBtn1.label = _arg_1;
            }, "lineBtn1.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lineBtn2.label = _arg_1;
            }, "lineBtn2.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lineBtn3.label = _arg_1;
            }, "lineBtn3.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lineBtn4.label = _arg_1;
            }, "lineBtn4.label");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (rankList);
            }, function (_arg_1:Object):void
            {
                rankData.dataProvider = _arg_1;
            }, "rankData.dataProvider");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_DataGridColumn1.headerText = _arg_1;
            }, "_DotaPanel_DataGridColumn1.headerText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_DataGridColumn2.headerText = _arg_1;
            }, "_DotaPanel_DataGridColumn2.headerText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_DataGridColumn3.headerText = _arg_1;
            }, "_DotaPanel_DataGridColumn3.headerText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_DataGridColumn4.headerText = _arg_1;
            }, "_DotaPanel_DataGridColumn4.headerText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_DataGridColumn5.headerText = _arg_1;
            }, "_DotaPanel_DataGridColumn5.headerText");
            result[22] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000395));
            }, function (_arg_1:Object):void
            {
                _DotaPanel_Image3.source = _arg_1;
            }, "_DotaPanel_Image3.source");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_Label26.text = _arg_1;
            }, "_DotaPanel_Label26.text");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_BasicGlowButton9.label = _arg_1;
            }, "_DotaPanel_BasicGlowButton9.label");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_BasicGlowButton10.label = _arg_1;
            }, "_DotaPanel_BasicGlowButton10.label");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot3.slotType = _arg_1;
            }, "slot3.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DotaPanel_BasicGlowButton11.label = _arg_1;
            }, "_DotaPanel_BasicGlowButton11.label");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOTA_PANEL[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gotoBtn.label = _arg_1;
            }, "gotoBtn.label");
            result[31] = binding;
            return (result);
        }

        private function refreshTower(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Npc;
            var _local_4:NPCView;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.isDead)
            {
                towerDead(_arg_1);
            }
            else
            {
                _local_2 = null;
                if (_arg_1.group == 1)
                {
                    _local_2 = towerListA;
                }
                else
                {
                    _local_2 = towerListB;
                };
                _local_3 = _local_2[_arg_1.index];
                if (_local_3)
                {
                    _local_3.hp = _arg_1.hp;
                    _local_4 = (_core.view.getN(_local_3.id) as NPCView);
                    if (_local_4)
                    {
                        _local_4.refreshHpBar(_arg_1.hp, _arg_1.maxhp, _arg_1.group);
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoBtn():BasicGlowButton
        {
            return (this._1945385678infoBtn);
        }

        private function tabClick(_arg_1:int):void
        {
            awardVs.selectedIndex = _arg_1;
            infoBtn.selected = (_arg_1 == 0);
            rankBtn.selected = (_arg_1 == 1);
            awardBtn.selected = (_arg_1 == 2);
            ruleBtn.selected = (_arg_1 == 3);
        }

        [Bindable(event="propertyChange")]
        public function get towerHPA30():Label
        {
            return (this._367457555towerHPA30);
        }

        [Bindable(event="propertyChange")]
        public function get towerHPA31():Label
        {
            return (this._367457554towerHPA31);
        }

        [Bindable(event="propertyChange")]
        public function get NPCAttackA():Label
        {
            return (this._782850296NPCAttackA);
        }

        private function gotoMap():void
        {
            _core.remote.call("dotaGotoMap", null);
        }

        [Bindable(event="propertyChange")]
        public function get towerHPA20():Label
        {
            return (this._367457586towerHPA20);
        }

        [Bindable(event="propertyChange")]
        public function get NPCAttackB():Label
        {
            return (this._782850297NPCAttackB);
        }

        public function __infoBtn_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        private function towerDead(_arg_1:Object):void
        {
            var _local_4:NPCView;
            var _local_5:int;
            var _local_6:Object;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Npc = getDotaNpc(_arg_1, towerListA, towerListB);
            if (_local_2)
            {
                _arg_1.isDead = true;
                _local_4 = (_core.view.getN(_local_2.id) as NPCView);
                _core.view.removeN(_local_2.id);
                if (_local_4)
                {
                    _local_4.dotaDead();
                    if (_arg_1.group == 1)
                    {
                        _core.sysMidMsg(Language.DOTA_PANEL[2]);
                    }
                    else
                    {
                        _core.sysMidMsg(Language.DOTA_PANEL[6]);
                    };
                    _local_4.refreshHpBar(0, _arg_1.maxhp, _arg_1.group);
                };
            };
            var _local_3:Object;
            if (_arg_1.group == 1)
            {
                _local_3 = dData["towersA"];
            }
            else
            {
                _local_3 = dData["towersB"];
            };
            if (_local_3)
            {
                _local_5 = 0;
                while (_local_5 < _local_3.length)
                {
                    _local_6 = _local_3[_local_5];
                    if (((_local_6) && (_local_6.index == _arg_1.index)))
                    {
                        _local_6.isDead = true;
                        return;
                    };
                    _local_5++;
                };
            };
        }

        private function _DotaPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _DotaPanel_DataGridColumn4 = _local_1;
            _local_1.width = 50;
            _local_1.dataField = "score";
            _local_1.itemRenderer = _DotaPanel_ClassFactory4_c();
            _local_1.setStyle("color", 0xFFFF);
            BindingManager.executeBindings(this, "_DotaPanel_DataGridColumn4", _DotaPanel_DataGridColumn4);
            return (_local_1);
        }

        private function init():void
        {
            txt.htmlText = Language.DOTA_PANEL[36];
            slot1.type = GamePredef.TBL_ITEM_TEMPLATE;
            slot1.giid = 4753;
            slot1.enabled = true;
            slot1.acceptable = false;
            slot2.type = GamePredef.TBL_ITEM_TEMPLATE;
            slot2.giid = 4751;
            slot2.enabled = true;
            slot2.acceptable = false;
            slot3.type = GamePredef.TBL_ITEM_TEMPLATE;
            slot3.giid = 4752;
            slot3.enabled = true;
            slot3.acceptable = false;
        }

        public function set towerHPB20(_arg_1:Label):void
        {
            var _local_2:Object = this._367456625towerHPB20;
            if (_local_2 !== _arg_1)
            {
                this._367456625towerHPB20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPB20", _local_2, _arg_1));
            };
        }

        public function set rankBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._978074256rankBtn;
            if (_local_2 !== _arg_1)
            {
                this._978074256rankBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankBtn", _local_2, _arg_1));
            };
        }

        public function __lineBtn1_click(_arg_1:MouseEvent):void
        {
            lineChange(3);
        }

        public function ___DotaPanel_BasicGlowButton9_click(_arg_1:MouseEvent):void
        {
            getRankAward();
        }

        public function set towerHPB21(_arg_1:Label):void
        {
            var _local_2:Object = this._367456624towerHPB21;
            if (_local_2 !== _arg_1)
            {
                this._367456624towerHPB21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPB21", _local_2, _arg_1));
            };
        }

        public function __rankBtn_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        private function refreshCenterConfigData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Number;
            var _local_8:Npc;
            var _local_9:NPCView;
            if (!_arg_1)
            {
                return;
            };
            for (_local_2 in _arg_1)
            {
                _local_3 = _arg_1[_local_2];
                for (_local_4 in _local_3)
                {
                    _local_5 = _local_3[_local_4];
                    if (_local_5.isDead)
                    {
                        centerDead(_local_5);
                    }
                    else
                    {
                        _local_6 = null;
                        _local_7 = 0;
                        if (_local_5.group == 1)
                        {
                            _local_6 = centerListA;
                            _local_7 = dData.HPA;
                        }
                        else
                        {
                            _local_6 = centerListB;
                            _local_7 = dData.HPB;
                        };
                        _local_8 = _local_6[_local_5.index];
                        _local_9 = (_core.view.getN(_local_8.id) as NPCView);
                        if (_local_9)
                        {
                            _local_9.refreshHpBar(_local_7, DOTA_GAME_CENTER_HP, _local_5.group);
                        };
                    };
                };
            };
        }

        public function set battleScroeB(_arg_1:Label):void
        {
            var _local_2:Object = this._2112767838battleScroeB;
            if (_local_2 !== _arg_1)
            {
                this._2112767838battleScroeB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleScroeB", _local_2, _arg_1));
            };
        }

        private function _DotaPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _DotaPanel_DataGridColumn3 = _local_1;
            _local_1.width = 50;
            _local_1.dataField = "group";
            _local_1.itemRenderer = _DotaPanel_ClassFactory3_c();
            _local_1.setStyle("color", 0xFFFF);
            BindingManager.executeBindings(this, "_DotaPanel_DataGridColumn3", _DotaPanel_DataGridColumn3);
            return (_local_1);
        }

        public function set battleScroeA(_arg_1:Label):void
        {
            var _local_2:Object = this._2112767839battleScroeA;
            if (_local_2 !== _arg_1)
            {
                this._2112767839battleScroeA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleScroeA", _local_2, _arg_1));
            };
        }

        private function getDotaNpc(_arg_1:Object, _arg_2:Object, _arg_3:Object):Npc
        {
            if (!_arg_1)
            {
                return (null);
            };
            var _local_4:Object;
            if (_arg_1.group == 1)
            {
                _local_4 = _arg_2;
            }
            else
            {
                _local_4 = _arg_3;
            };
            var _local_5:Npc = _local_4[_arg_1.index];
            return (_local_5);
        }

        private function getWinAward():void
        {
            _core.remote.call("dotaGetWinAward", null);
        }

        [Bindable(event="propertyChange")]
        public function get NPCLevelB():Label
        {
            return (this._49290079NPCLevelB);
        }

        [Bindable(event="propertyChange")]
        public function get NPCLevelA():Label
        {
            return (this._49290078NPCLevelA);
        }

        public function set towerHPA11(_arg_1:Label):void
        {
            var _local_2:Object = this._367457616towerHPA11;
            if (_local_2 !== _arg_1)
            {
                this._367457616towerHPA11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPA11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lineBtn1():BasicGlowButton
        {
            return (this._1188124521lineBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get lineBtn3():BasicGlowButton
        {
            return (this._1188124523lineBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get lineBtn4():BasicGlowButton
        {
            return (this._1188124524lineBtn4);
        }

        public function set centerHPABar(_arg_1:PropertyBar):void
        {
            var _local_2:Object = this._398570065centerHPABar;
            if (_local_2 !== _arg_1)
            {
                this._398570065centerHPABar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "centerHPABar", _local_2, _arg_1));
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
                load.load(new URLRequest(ResManager.getResUrl(2080130101005)));
                res_load_state = 1;
            };
        }

        public function onTowerBattleWithPlayerEnd(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Npc;
            var _local_7:NPCView;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:Object;
            if (((!(_arg_1)) || (!(_arg_1.towerData))))
            {
                return;
            };
            var _local_2:Object = _arg_1.towerData;
            if (_local_2.isDead)
            {
                towerDead(_local_2);
            }
            else
            {
                _local_5 = null;
                if (_local_2.group == 1)
                {
                    _local_5 = towerListA;
                }
                else
                {
                    _local_5 = towerListB;
                };
                _local_6 = _local_5[_local_2.index];
                _local_6.hp = _local_2.hp;
                _local_7 = (_core.view.getN(_local_6.id) as NPCView);
                if (_local_7)
                {
                    _local_7.refreshHpBar(_local_2.hp, _local_2.maxhp, _local_2.group);
                };
            };
            if (_local_2.group == 1)
            {
                _local_3 = dData["towersA"];
            }
            else
            {
                _local_3 = dData["towersB"];
            };
            for (_local_4 in _local_3)
            {
                _local_8 = _local_3[_local_4];
                for (_local_9 in _local_8)
                {
                    _local_10 = _local_8[_local_9];
                    if (((_local_10) && (_local_10.index == _local_2.index)))
                    {
                        _local_10.hp = _local_2.hp;
                        _local_10.isDead = _local_2.isDead;
                    };
                };
            };
        }

        public function set towerHPB30(_arg_1:Label):void
        {
            var _local_2:Object = this._367456594towerHPB30;
            if (_local_2 !== _arg_1)
            {
                this._367456594towerHPB30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPB30", _local_2, _arg_1));
            };
        }

        public function set towerHPA10(_arg_1:Label):void
        {
            var _local_2:Object = this._367457617towerHPA10;
            if (_local_2 !== _arg_1)
            {
                this._367457617towerHPA10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPA10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lineBtn2():BasicGlowButton
        {
            return (this._1188124522lineBtn2);
        }

        public function set ruleBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1548631488ruleBtn;
            if (_local_2 !== _arg_1)
            {
                this._1548631488ruleBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ruleBtn", _local_2, _arg_1));
            };
        }

        private function _DotaPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _DotaPanel_DataGridColumn2 = _local_1;
            _local_1.width = 100;
            _local_1.dataField = "playerName";
            _local_1.itemRenderer = _DotaPanel_ClassFactory2_c();
            _local_1.setStyle("color", 0xFFFF);
            BindingManager.executeBindings(this, "_DotaPanel_DataGridColumn2", _DotaPanel_DataGridColumn2);
            return (_local_1);
        }

        public function set awardBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1621978433awardBtn;
            if (_local_2 !== _arg_1)
            {
                this._1621978433awardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn", _local_2, _arg_1));
            };
        }

        public function set centerHPA(_arg_1:Label):void
        {
            var _local_2:Object = this._655265852centerHPA;
            if (_local_2 !== _arg_1)
            {
                this._655265852centerHPA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "centerHPA", _local_2, _arg_1));
            };
        }

        public function set centerHPB(_arg_1:Label):void
        {
            var _local_2:Object = this._655265851centerHPB;
            if (_local_2 !== _arg_1)
            {
                this._655265851centerHPB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "centerHPB", _local_2, _arg_1));
            };
        }

        private function _DotaPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DOTA_PANEL[0];
            _local_1 = Language.DOTA_PANEL[7];
            _local_1 = Language.DOTA_PANEL[8];
            _local_1 = Language.DOTA_PANEL[9];
            _local_1 = Language.DOTA_PANEL[10];
            _local_1 = ResManager.getIconUrl(4130220000394);
            _local_1 = Language.DOTA_PANEL[34];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = DOTA_GAME_CENTER_HP;
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = DOTA_GAME_CENTER_HP;
            _local_1 = ResManager.getIconUrl(4130220000396);
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.DOTA_PANEL[24];
            _local_1 = Language.DOTA_PANEL[25];
            _local_1 = Language.DOTA_PANEL[26];
            _local_1 = Language.DOTA_PANEL[27];
            _local_1 = rankList;
            _local_1 = Language.DOTA_PANEL[19];
            _local_1 = Language.DOTA_PANEL[20];
            _local_1 = Language.DOTA_PANEL[21];
            _local_1 = Language.DOTA_PANEL[22];
            _local_1 = Language.DOTA_PANEL[23];
            _local_1 = ResManager.getIconUrl(4130220000395);
            _local_1 = Language.DOTA_PANEL[13];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.DOTA_PANEL[18];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.DOTA_PANEL[18];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.DOTA_PANEL[18];
            _local_1 = Language.DOTA_PANEL[35];
        }

        private function initCenters(_arg_1:Object, _arg_2:Array, _arg_3:Object):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Npc;
            var _local_10:NPCView;
            if (!_arg_1)
            {
                return;
            };
            for (_local_4 in _arg_1)
            {
                _local_5 = _arg_1[_local_4];
                for (_local_6 in _local_5)
                {
                    _local_7 = _local_5[_local_6];
                    _local_8 = _core.data.gameData[GamePredef.TBL_NPC][_local_7.npcId];
                    if (!((!(_local_8)) || (_local_7.isDead)))
                    {
                        _local_8.id = _local_7.index;
                        _local_8.posX = (_arg_2[(((_local_7.lineId - 1) * DOTA_GAME_INIT_CENTER_NUM) + _local_7.pIndex)][0] * 10);
                        _local_8.posY = (_arg_2[(((_local_7.lineId - 1) * DOTA_GAME_INIT_CENTER_NUM) + _local_7.pIndex)][1] * 10);
                        _local_8.nid = _local_7.npcId;
                        _local_8.busy = false;
                        _core.createNpc(_local_8);
                        _local_9 = _core.getNpc(_local_8.id);
                        if (_local_9)
                        {
                            _local_9.dotaData = _local_7;
                            _local_9.state = 101;
                            _arg_3[_local_7.index] = _local_9;
                            _local_10 = (_core.view.getN(_local_9.id) as NPCView);
                            if (_local_10)
                            {
                                if (_local_7.group == 1)
                                {
                                    _local_10.refreshHpBar(dData.HPA, DOTA_GAME_CENTER_HP, _local_7.group);
                                }
                                else
                                {
                                    _local_10.refreshHpBar(dData.HPB, DOTA_GAME_CENTER_HP, _local_7.group);
                                };
                            };
                        };
                    };
                };
            };
        }

        override public function initialize():void
        {
            var target:DotaPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DotaPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DotaPanelWatcherSetupUtil");
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

        private function refreshTowerConfigData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Npc;
            var _local_8:NPCView;
            if (!_arg_1)
            {
                return;
            };
            for (_local_2 in _arg_1)
            {
                _local_3 = _arg_1[_local_2];
                for (_local_4 in _local_3)
                {
                    _local_5 = _local_3[_local_4];
                    if (_local_5.isDead)
                    {
                        towerDead(_local_5);
                    }
                    else
                    {
                        _local_6 = null;
                        if (_local_5.group == 1)
                        {
                            _local_6 = towerListA;
                        }
                        else
                        {
                            _local_6 = towerListB;
                        };
                        _local_7 = _local_6[_local_5.index];
                        _local_7.hp = _local_5.hp;
                        _local_8 = (_core.view.getN(_local_7.id) as NPCView);
                        if (_local_8)
                        {
                            _local_8.refreshHpBar(_local_5.hp, _local_5.maxhp, _local_5.group);
                        };
                    };
                };
            };
        }

        public function __lineBtn3_click(_arg_1:MouseEvent):void
        {
            lineChange(5);
        }

        public function onSynchroData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            refreshNpcConfigData(_arg_1["npcsA"]);
            refreshNpcConfigData(_arg_1["npcsB"]);
            refreshTowerConfigData(_arg_1["towersA"]);
            refreshTowerConfigData(_arg_1["towersB"]);
            dData.HPA = _arg_1.HPA;
            dData.HPB = _arg_1.HPB;
            refreshCenterConfigData(_arg_1["centersA"]);
            refreshCenterConfigData(_arg_1["centersB"]);
        }

        public function set towerHPA21(_arg_1:Label):void
        {
            var _local_2:Object = this._367457585towerHPA21;
            if (_local_2 !== _arg_1)
            {
                this._367457585towerHPA21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPA21", _local_2, _arg_1));
            };
        }

        public function set NPCDefenceB(_arg_1:Label):void
        {
            var _local_2:Object = this._1392427053NPCDefenceB;
            if (_local_2 !== _arg_1)
            {
                this._1392427053NPCDefenceB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "NPCDefenceB", _local_2, _arg_1));
            };
        }

        private function refreshRank():void
        {
            var _local_3:Object;
            rankList.removeAll();
            rankLabel.text = Language.DOTA_PANEL[(21 + selectRankLine)];
            if (!totalRankData)
            {
                rankBtn.enabled = false;
                awardBtn.enabled = rankBtn.enabled;
                return;
            };
            var _local_1:Array = totalRankData[selectRankLine];
            if (!_local_1)
            {
                return;
            };
            var _local_2:int;
            while (_local_2 < _local_1.length)
            {
                _local_3 = _local_1[_local_2];
                if (_local_3)
                {
                    rankList.addItem({
                        "index":(_local_2 + 1),
                        "rank":(_local_3.rank + 1),
                        "playerName":_local_3.name,
                        "group":_local_3.group,
                        "score":_local_3.score,
                        "pvpWin":_local_3.pvp
                    });
                };
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get centerHPABar():PropertyBar
        {
            return (this._398570065centerHPABar);
        }

        public function set towerHPB31(_arg_1:Label):void
        {
            var _local_2:Object = this._367456593towerHPB31;
            if (_local_2 !== _arg_1)
            {
                this._367456593towerHPB31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerHPB31", _local_2, _arg_1));
            };
        }

        public function set NPCDefenceA(_arg_1:Label):void
        {
            var _local_2:Object = this._1392427054NPCDefenceA;
            if (_local_2 !== _arg_1)
            {
                this._1392427054NPCDefenceA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "NPCDefenceA", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ruleBtn():BasicGlowButton
        {
            return (this._1548631488ruleBtn);
        }

        private function initTowers(_arg_1:Object, _arg_2:Array, _arg_3:Object):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Npc;
            var _local_10:NPCView;
            if (!_arg_1)
            {
                return;
            };
            for (_local_4 in _arg_1)
            {
                _local_5 = _arg_1[_local_4];
                for (_local_6 in _local_5)
                {
                    _local_7 = _local_5[_local_6];
                    _local_8 = _core.data.gameData[GamePredef.TBL_NPC][_local_7.npcId];
                    if (!((!(_local_8)) || (_local_7.isDead)))
                    {
                        _local_8.id = _local_7.index;
                        _local_8.posX = (_arg_2[(((_local_7.lineId - 1) * DOTA_GAME_INIT_TOWER_NUM) + _local_7.pIndex)][0] * 10);
                        _local_8.posY = (_arg_2[(((_local_7.lineId - 1) * DOTA_GAME_INIT_TOWER_NUM) + _local_7.pIndex)][1] * 10);
                        _local_8.nid = _local_7.npcId;
                        _local_8.busy = false;
                        _core.createNpc(_local_8);
                        _local_9 = _core.getNpc(_local_8.id);
                        if (_local_9)
                        {
                            _local_9.dotaData = _local_7;
                            _local_9.state = 101;
                            _arg_3[_local_7.index] = _local_9;
                            _local_10 = (_core.view.getN(_local_9.id) as NPCView);
                            if (_local_10)
                            {
                                _local_10.refreshHpBar(_local_7.hp, _local_7.maxhp, _local_7.group);
                            };
                        };
                    };
                };
            };
        }

        private function _DotaPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _DotaPanel_DataGridColumn1 = _local_1;
            _local_1.width = 30;
            _local_1.dataField = "rank";
            _local_1.itemRenderer = _DotaPanel_ClassFactory1_c();
            _local_1.setStyle("color", 0xFFFF);
            BindingManager.executeBindings(this, "_DotaPanel_DataGridColumn1", _DotaPanel_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get centerHPA():Label
        {
            return (this._655265852centerHPA);
        }

        [Bindable(event="propertyChange")]
        public function get NPCDefenceA():Label
        {
            return (this._1392427054NPCDefenceA);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                getRes();
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (int(_core.player.mapData.id) == 78)
            {
                infoBtn.enabled = true;
                tabClick(0);
            }
            else
            {
                tabClick(3);
                infoBtn.enabled = false;
            };
            _core.remote.call("dotaGetPanelData", null);
        }

        private function cleanNpc():void
        {
            var _local_1:Object;
            var _local_2:Npc;
            var _local_3:Object;
            var _local_4:Npc;
            if (npcListA)
            {
                for (_local_1 in npcListA)
                {
                    _local_2 = npcListA[_local_1];
                    _core.view.removeN(_local_2.id);
                };
                npcListA = {};
            };
            if (npcListB)
            {
                for (_local_3 in npcListB)
                {
                    _local_4 = npcListB[_local_3];
                    _core.view.removeN(_local_4.id);
                };
                npcListB = {};
            };
        }

        private function _DotaPanel_ClassFactory5_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = DotaPanel_inlineComponent5;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get centerHPB():Label
        {
            return (this._655265851centerHPB);
        }

        public function set slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function __awardBtn_click(_arg_1:MouseEvent):void
        {
            tabClick(2);
        }

        public function __gotoBtn_click(_arg_1:MouseEvent):void
        {
            gotoMap();
        }

        [Bindable(event="propertyChange")]
        public function get NPCDefenceB():Label
        {
            return (this._1392427053NPCDefenceB);
        }

        public function set slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set NPCAttackA(_arg_1:Label):void
        {
            var _local_2:Object = this._782850296NPCAttackA;
            if (_local_2 !== _arg_1)
            {
                this._782850296NPCAttackA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "NPCAttackA", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot3():ItemSlot
        {
            return (this._109532661slot3);
        }

        private function cleanCenter():void
        {
            var _local_1:Object;
            var _local_2:Npc;
            var _local_3:Object;
            var _local_4:Npc;
            if (centerListA)
            {
                for (_local_1 in centerListA)
                {
                    _local_2 = centerListA[_local_1];
                    _core.view.removeN(_local_2.id);
                };
                centerListA = {};
            };
            if (centerListB)
            {
                for (_local_3 in centerListB)
                {
                    _local_4 = centerListB[_local_3];
                    _core.view.removeN(_local_4.id);
                };
                centerListB = {};
            };
        }

        public function set infoBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1945385678infoBtn;
            if (_local_2 !== _arg_1)
            {
                this._1945385678infoBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoBtn", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

