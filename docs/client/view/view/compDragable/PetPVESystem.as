// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetPVESystem

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.PetPVEKPIcon;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.controls.DataGrid;
    import mx.controls.LinkButton;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.utils.ArrayQueue;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import com.qeedoo.game.data.GameData;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class PetPVESystem extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _PetPVESystem_RoundedLabel8:RoundedLabel;
        public var _PetPVESystem_RoundedLabel6:RoundedLabel;
        private var _102262670kpp58:RoundedLabel;
        private var _2085624763exchangeTimesFreeLabel:Label;
        private var _1693151239ppPetEquipSlot6:BasicGlowButton;
        private var _300242725kpItemAward:ItemSlot;
        private var _104715229nextp:RoundedLabel;
        private var _760122925towerlb2:Label;
        private var _867829174tower3:Canvas;
        private var _1693151238ppPetEquipSlot5:BasicGlowButton;
        private var _3298796kpp7:RoundedLabel;
        private var _695802503exchangeTimesGoldBtn:BasicDelayButton;
        private var _102262602kpp32:RoundedLabel;
        private var _3355489mmp1:RoundedLabel;
        private var _ppveData:Object;
        private var _kpIconSelectIndex:int = 0;
        private var _1693151237ppPetEquipSlot4:BasicGlowButton;
        private var _ppConf:Object;
        private var _3355492mmp4:RoundedLabel;
        private var _1352309777challengeTimesLabel:Label;
        private var _945137357passedImg:Image;
        private var _1693151236ppPetEquipSlot3:BasicGlowButton;
        private var _kpSelectIndex:int = 0;
        private var _1693151235ppPetEquipSlot2:BasicGlowButton;
        private var _805379701ppkpIcon3:PetPVEKPIcon;
        private var _852883602myRanklb:RoundedLabel;
        private var _107332log:LinkTextArea;
        private var _867829176tower1:Canvas;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _1693151234ppPetEquipSlot1:BasicGlowButton;
        private var _3298795kpp6:RoundedLabel;
        private var _283911032masterLb:RoundedLabel;
        public var _PetPVESystem_DataGrid1:DataGrid;
        public var _PetPVESystem_LinkButton1:LinkButton;
        public var _PetPVESystem_LinkButton2:LinkButton;
        public var _PetPVESystem_DataGridColumn1:DataGridColumn;
        public var _PetPVESystem_DataGridColumn2:DataGridColumn;
        public var _PetPVESystem_DataGridColumn3:DataGridColumn;
        public var _PetPVESystem_DataGridColumn4:DataGridColumn;
        public var _PetPVESystem_DataGridColumn5:DataGridColumn;
        private var _511012591challengeTimesGoldLabel:Label;
        private var _805379703ppkpIcon5:PetPVEKPIcon;
        private var _1693151233ppPetEquipSlot0:BasicGlowButton;
        private var _1357353681exchangeTimesGoldLabel:Label;
        private var _805379699ppkpIcon1:PetPVEKPIcon;
        private var _3355495mmp7:RoundedLabel;
        private var _2131248155ppMasterIcon:BasicGlowButton;
        private var _760122926towerlb1:Label;
        private var _118332119kpConsume:RoundedLabel;
        public var _PetPVESystem_BasicDelayButton1:BasicDelayButton;
        public var _PetPVESystem_BasicDelayButton2:BasicDelayButton;
        public var _PetPVESystem_BasicDelayButton3:BasicDelayButton;
        public var _PetPVESystem_BasicDelayButton5:BasicDelayButton;
        private var _3298790kpp1:RoundedLabel;
        private var _3298794kpp5:RoundedLabel;
        private var _336650556loading:Canvas;
        private var _3298798kpp9:RoundedLabel;
        private var _760122924towerlb3:Label;
        private var _1693151240ppPetEquipSlot7:BasicGlowButton;
        private var _102262539kpp11:RoundedLabel;
        public var _PetPVESystem_RoundedLabel10:RoundedLabel;
        public var _PetPVESystem_RoundedLabel13:RoundedLabel;
        public var _PetPVESystem_RoundedLabel14:RoundedLabel;
        public var _PetPVESystem_BasicTitleCanvas1:BasicTitleCanvas;
        private var _551218184kpAward:RoundedLabel;
        private var _867829175tower2:Canvas;
        private var _805379700ppkpIcon2:PetPVEKPIcon;
        public var _PetPVESystem_Label8:Label;
        private var _3355494mmp6:RoundedLabel;
        private var _381337386awardbraLb:RoundedLabel;
        private var _102262541kpp13:RoundedLabel;
        private var _3387482nowp:RoundedLabel;
        private var _102262601kpp31:RoundedLabel;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _805379702ppkpIcon4:PetPVEKPIcon;
        private var _3298793kpp4:RoundedLabel;
        private var _962200965ppAwardList:Canvas;
        private var _770453339kpItemAwardlb:RoundedLabel;
        private var _3552076tabA:ViewStack;
        private var _3298797kpp8:RoundedLabel;
        private var _102262785kpnum:RoundedLabel;
        private var _kpData:Object;
        private var _805379698ppkpIcon0:PetPVEKPIcon;
        private var _3355493mmp5:RoundedLabel;
        public var _PetPVESystem_RoundedLabel4:RoundedLabel;
        private var _cid:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":680,
                    "height":460,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetPVESystem_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tabA",
                        "stylesFactory":function ():void
                        {
                            this.top = "63";
                            this.left = "10";
                            this.bottom = "10";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "styleName":"ppBgImg",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                        this.left = "0";
                                        this.bottom = "0";
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "-30";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":601,
                                                        "height":288,
                                                        "x":54,
                                                        "styleName":"ppBgImg2",
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":205,
                                                        "height":293,
                                                        "x":10,
                                                        "y":10,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"_PetPVESystem_DataGrid1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "31";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "sortableColumns":false,
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "doubleClickEnabled":false,
                                                                    "columns":[_PetPVESystem_DataGridColumn1_i(), _PetPVESystem_DataGridColumn2_i(), _PetPVESystem_DataGridColumn3_i(), _PetPVESystem_DataGridColumn4_i(), _PetPVESystem_DataGridColumn5_i()]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "5";
                                                                this.left = "5";
                                                                this.right = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":26,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"myRanklb",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.textAlign = "left";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"percentWidth":100});
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
                                                        "width":299,
                                                        "height":222,
                                                        "x":212,
                                                        "y":10,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"tower3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":261,
                                                                    "height":58,
                                                                    "x":10,
                                                                    "y":12,
                                                                    "styleName":"pptower4",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"towerlb3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.bottom = "3";
                                                                            this.left = "15";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"tower2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":261,
                                                                    "height":58,
                                                                    "x":10,
                                                                    "y":78,
                                                                    "styleName":"pptower2selected",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"towerlb2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.bottom = "3";
                                                                            this.left = "15";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"tower1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":261,
                                                                    "height":58,
                                                                    "x":10,
                                                                    "y":148,
                                                                    "styleName":"pptower1",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"towerlb1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.bottom = "3";
                                                                            this.left = "15";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"passedImg",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "3";
                                                                            this.right = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":81,
                                                                                "height":56,
                                                                                "visible":false
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
                                                        "width":159,
                                                        "height":278,
                                                        "x":491,
                                                        "y":10,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"log",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0.3;
                                                                this.backgroundColor = 0;
                                                                this.borderStyle = "none";
                                                                this.color = 16774324;
                                                                this.top = "5";
                                                                this.bottom = "5";
                                                                this.left = "5";
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "mouseEnabled":false,
                                                                    "editable":false,
                                                                    "enabled":true,
                                                                    "selectable":false
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"awardbraLb",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "20";
                                                    this.color = 16187149;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":231});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"ppAwardList",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":274,
                                                        "y":248,
                                                        "width":188,
                                                        "height":73,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"kpItemAward",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":10,
                                                                    "acceptable":false,
                                                                    "enabled":false,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpItemAwardlb",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":45
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetPVESystem_RoundedLabel4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":10,
                                                                    "x":61
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpAward",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":10,
                                                                    "x":116
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_PetPVESystem_BasicDelayButton1",
                                                "events":{"click":"___PetPVESystem_BasicDelayButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "374";
                                                    this.bottom = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":120000,
                                                        "styleName":"BtnStdGreen",
                                                        "height":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_PetPVESystem_BasicDelayButton2",
                                                "events":{"click":"___PetPVESystem_BasicDelayButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.left = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":1000,
                                                        "styleName":"BtnStdGreen",
                                                        "width":100,
                                                        "height":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_PetPVESystem_BasicDelayButton3",
                                                "events":{"click":"___PetPVESystem_BasicDelayButton3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":1000,
                                                        "styleName":"BtnStdGreen",
                                                        "y":295,
                                                        "width":100,
                                                        "height":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"exchangeTimesGoldBtn",
                                                "events":{"click":"__exchangeTimesGoldBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.left = "164";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":1000,
                                                        "styleName":"BtnStdGreen",
                                                        "width":100,
                                                        "height":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"challengeTimesLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "left";
                                                    this.left = "374";
                                                    this.bottom = "38";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":130});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"exchangeTimesFreeLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "left";
                                                    this.left = "33";
                                                    this.bottom = "38";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"exchangeTimesGoldLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "left";
                                                    this.left = "164";
                                                    this.bottom = "38";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_PetPVESystem_LinkButton1",
                                                "events":{"click":"___PetPVESystem_LinkButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-1";
                                                    this.bottom = "13";
                                                    this.color = 0xFFFFFF;
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"challengeTimesGoldLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "left";
                                                    this.left = "374";
                                                    this.bottom = "63";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_PetPVESystem_BasicDelayButton5",
                                                "events":{"click":"___PetPVESystem_BasicDelayButton5_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                    this.bottom = "38";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":500,
                                                        "styleName":"BtnStdGreen",
                                                        "width":64,
                                                        "height":22
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                        this.left = "0";
                                        this.bottom = "0";
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":362,
                                                        "height":265,
                                                        "x":213,
                                                        "y":-23,
                                                        "styleName":"ppBgImg3",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":PetPVEKPIcon,
                                                            "id":"ppkpIcon0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "31";
                                                                this.left = "213";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetPVEKPIcon,
                                                            "id":"ppkpIcon5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "31";
                                                                this.left = "104";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetPVEKPIcon,
                                                            "id":"ppkpIcon1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "265";
                                                                this.bottom = "95";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetPVEKPIcon,
                                                            "id":"ppkpIcon4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "95";
                                                                this.left = "53";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetPVEKPIcon,
                                                            "id":"ppkpIcon2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "14";
                                                                this.left = "213";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetPVEKPIcon,
                                                            "id":"ppkpIcon3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "14";
                                                                this.left = "104";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetPVESystem_RoundedLabel6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "12";
                                                                this.color = 16187149;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":96});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"nowp",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "12";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":113});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetPVESystem_RoundedLabel8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "12";
                                                                this.color = 16187149;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":131});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"nextp",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "12";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":148});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetPVESystem_RoundedLabel10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "10";
                                                                this.color = 16187149;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":164});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpConsume",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "12";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":187});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.top = "10";
                                                    this.left = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":181,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"ppPetEquipSlot0",
                                                            "events":{"click":"__ppPetEquipSlot0_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8.5,
                                                                    "y":10,
                                                                    "width":78,
                                                                    "height":78,
                                                                    "styleName":"ppe0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"ppPetEquipSlot1",
                                                            "events":{"click":"__ppPetEquipSlot1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8.5,
                                                                    "y":96,
                                                                    "width":78,
                                                                    "height":78,
                                                                    "styleName":"ppe1"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"ppPetEquipSlot2",
                                                            "events":{"click":"__ppPetEquipSlot2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8.5,
                                                                    "y":182,
                                                                    "width":78,
                                                                    "height":78,
                                                                    "styleName":"ppe2"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"ppPetEquipSlot3",
                                                            "events":{"click":"__ppPetEquipSlot3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8.5,
                                                                    "y":268,
                                                                    "width":78,
                                                                    "height":78,
                                                                    "styleName":"ppe3"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"ppPetEquipSlot4",
                                                            "events":{"click":"__ppPetEquipSlot4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":94.5,
                                                                    "y":10,
                                                                    "width":78,
                                                                    "height":78,
                                                                    "styleName":"ppe4"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"ppPetEquipSlot5",
                                                            "events":{"click":"__ppPetEquipSlot5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":94.5,
                                                                    "y":96,
                                                                    "width":78,
                                                                    "height":78,
                                                                    "styleName":"ppe5"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"ppPetEquipSlot6",
                                                            "events":{"click":"__ppPetEquipSlot6_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":94.5,
                                                                    "y":182,
                                                                    "width":78,
                                                                    "height":78,
                                                                    "styleName":"ppe6"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"ppPetEquipSlot7",
                                                            "events":{"click":"__ppPetEquipSlot7_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":94.5,
                                                                    "y":268,
                                                                    "width":78,
                                                                    "height":78,
                                                                    "styleName":"ppe7"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"kpnum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "right";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":35});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_PetPVESystem_LinkButton2",
                                                "events":{"click":"___PetPVESystem_LinkButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                    this.right = "10";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":10});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "8";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":451,
                                                        "height":146,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetPVESystem_RoundedLabel13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 16187149;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":3});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_PetPVESystem_RoundedLabel14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 16187149;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":83});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":22,
                                                                    "x":10,
                                                                    "width":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":22,
                                                                    "x":118,
                                                                    "width":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":22,
                                                                    "x":220,
                                                                    "width":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":22,
                                                                    "x":326
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":43,
                                                                    "x":10,
                                                                    "width":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":43,
                                                                    "x":118,
                                                                    "width":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":43,
                                                                    "x":220,
                                                                    "width":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":43,
                                                                    "x":326
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":64,
                                                                    "x":10,
                                                                    "width":89
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp31",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":64,
                                                                    "x":100,
                                                                    "width":103
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp32",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":64,
                                                                    "x":205,
                                                                    "width":115
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"kpp58",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":64,
                                                                    "x":326
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"mmp1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":101,
                                                                    "x":10,
                                                                    "width":119
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"mmp4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":101,
                                                                    "x":137,
                                                                    "width":141
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"mmp5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":100,
                                                                    "x":289,
                                                                    "width":152
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"mmp6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":124,
                                                                    "x":10,
                                                                    "width":203
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"mmp7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":124,
                                                                    "x":202,
                                                                    "width":219
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"ppMasterIcon",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":199,
                                                        "y":8,
                                                        "width":72,
                                                        "height":84,
                                                        "styleName":"masterMedal0"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"masterLb",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                    this.horizontalCenter = "-97";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":31,
                                                        "width":47
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
                        "id":"loading",
                        "stylesFactory":function ():void
                        {
                            this.top = "63";
                            this.left = "10";
                            this.bottom = "10";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundColor = 0x333333;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "alpha":0.3
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetPVESystem_Label8",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.verticalCenter = "-20";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                            this.top = "43";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":13,
                                "percentWidth":100,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn0",
                                    "events":{"click":"__bangBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "labelPlacement":"bottom",
                                            "width":77
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn1",
                                    "events":{"click":"__bangBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "labelPlacement":"bottom",
                                            "width":77
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
        private var _KPLEVELLIST:Array = [0, 20, 40, 60, 80, 100];
        private var _PET_PVE_ADDTION_COST:* = [10, 20, 50];
        private var _logStrArr:ArrayQueue = new ArrayQueue(30);
        private var _1967088853pprankObj:ArrayCollection = new ArrayCollection();
        private var passImg:Class = PetPVESystem_passImg;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetPVESystem()
        {
            mx_internal::_document = this;
            this.width = 680;
            this.height = 460;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___PetPVESystem_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetPVESystem._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get kpnum():RoundedLabel
        {
            return (this._102262785kpnum);
        }

        public function set kpnum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._102262785kpnum;
            if (_local_2 !== _arg_1)
            {
                this._102262785kpnum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpnum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get kpp7():RoundedLabel
        {
            return (this._3298796kpp7);
        }

        [Bindable(event="propertyChange")]
        public function get ppPetEquipSlot0():BasicGlowButton
        {
            return (this._1693151233ppPetEquipSlot0);
        }

        public function set ppPetEquipSlot0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1693151233ppPetEquipSlot0;
            if (_local_2 !== _arg_1)
            {
                this._1693151233ppPetEquipSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppPetEquipSlot0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextp():RoundedLabel
        {
            return (this._104715229nextp);
        }

        public function set ppPetEquipSlot1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1693151234ppPetEquipSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1693151234ppPetEquipSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppPetEquipSlot1", _local_2, _arg_1));
            };
        }

        private function _PetPVESystem_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetPVESystem_DataGridColumn2 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 230;
            BindingManager.executeBindings(this, "_PetPVESystem_DataGridColumn2", _PetPVESystem_DataGridColumn2);
            return (_local_1);
        }

        public function set ppPetEquipSlot2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1693151235ppPetEquipSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1693151235ppPetEquipSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppPetEquipSlot2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ppPetEquipSlot6():BasicGlowButton
        {
            return (this._1693151239ppPetEquipSlot6);
        }

        [Bindable(event="propertyChange")]
        public function get kpp8():RoundedLabel
        {
            return (this._3298797kpp8);
        }

        [Bindable(event="propertyChange")]
        public function get kpAward():RoundedLabel
        {
            return (this._551218184kpAward);
        }

        [Bindable(event="propertyChange")]
        public function get challengeTimesLabel():Label
        {
            return (this._1352309777challengeTimesLabel);
        }

        [Bindable(event="propertyChange")]
        public function get ppPetEquipSlot2():BasicGlowButton
        {
            return (this._1693151235ppPetEquipSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get ppPetEquipSlot3():BasicGlowButton
        {
            return (this._1693151236ppPetEquipSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get ppPetEquipSlot4():BasicGlowButton
        {
            return (this._1693151237ppPetEquipSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get ppPetEquipSlot5():BasicGlowButton
        {
            return (this._1693151238ppPetEquipSlot5);
        }

        public function set ppPetEquipSlot3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1693151236ppPetEquipSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1693151236ppPetEquipSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppPetEquipSlot3", _local_2, _arg_1));
            };
        }

        public function set kpp13(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._102262541kpp13;
            if (_local_2 !== _arg_1)
            {
                this._102262541kpp13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp13", _local_2, _arg_1));
            };
        }

        public function set kpp11(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._102262539kpp11;
            if (_local_2 !== _arg_1)
            {
                this._102262539kpp11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp11", _local_2, _arg_1));
            };
        }

        public function set ppPetEquipSlot7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1693151240ppPetEquipSlot7;
            if (_local_2 !== _arg_1)
            {
                this._1693151240ppPetEquipSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppPetEquipSlot7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ppPetEquipSlot7():BasicGlowButton
        {
            return (this._1693151240ppPetEquipSlot7);
        }

        public function set challengeTimesGoldLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._511012591challengeTimesGoldLabel;
            if (_local_2 !== _arg_1)
            {
                this._511012591challengeTimesGoldLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "challengeTimesGoldLabel", _local_2, _arg_1));
            };
        }

        private function resetUI():void
        {
            nowp.text = "";
            nextp.text = "";
            kpConsume.text = "";
            tower3.visible = (tower2.visible = (tower1.visible = true));
            var _local_1:int;
            while (_local_1 < 8)
            {
                this[("ppPetEquipSlot" + _local_1)].enabled = true;
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get ppPetEquipSlot1():BasicGlowButton
        {
            return (this._1693151234ppPetEquipSlot1);
        }

        public function ___PetPVESystem_BasicDelayButton5_click(_arg_1:MouseEvent):void
        {
            oneMoreChallengeBtnClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get towerlb3():Label
        {
            return (this._760122924towerlb3);
        }

        [Bindable(event="propertyChange")]
        public function get ppMasterIcon():BasicGlowButton
        {
            return (this._2131248155ppMasterIcon);
        }

        public function setGoldLock(_arg_1:Boolean):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var _local_3:Boolean = _local_2.goldLockFlag;
            if (((!(_local_3 == _arg_1)) && (_local_2)))
            {
                _local_2.goldLockFlag = _arg_1;
            };
        }

        public function set ppPetEquipSlot5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1693151238ppPetEquipSlot5;
            if (_local_2 !== _arg_1)
            {
                this._1693151238ppPetEquipSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppPetEquipSlot5", _local_2, _arg_1));
            };
        }

        public function __ppPetEquipSlot5_click(_arg_1:MouseEvent):void
        {
            pppeClick(5);
        }

        public function set challengeTimesLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1352309777challengeTimesLabel;
            if (_local_2 !== _arg_1)
            {
                this._1352309777challengeTimesLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "challengeTimesLabel", _local_2, _arg_1));
            };
        }

        public function set ppPetEquipSlot4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1693151237ppPetEquipSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1693151237ppPetEquipSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppPetEquipSlot4", _local_2, _arg_1));
            };
        }

        protected function challengeBtnClickHandler(_arg_1:MouseEvent):void
        {
            if (!ToolKit.isEmptyObject(_ppveData.ppveConfig))
            {
                loading.visible = true;
                _core.remote.call("challengeNextFloor", null, null);
            }
            else
            {
                Alert.show(Language.PET_PVE_PANEL[33]);
            };
        }

        protected function oneMoreChallengeBtnClickHandler(event:MouseEvent):void
        {
            var goldTime:* = undefined;
            var cost:* = undefined;
            var func:Function;
            if (_kpData)
            {
                goldTime = _kpData.goldTime;
                cost = _PET_PVE_ADDTION_COST[0];
                if (goldTime > 2)
                {
                    cost = _PET_PVE_ADDTION_COST[2];
                }
                else
                {
                    if (goldTime >= 0)
                    {
                        cost = _PET_PVE_ADDTION_COST[goldTime];
                    }
                    else
                    {
                        return;
                    };
                };
                func = function (event:CloseEvent):void
                {
                    var bagPanel:BagPanel;
                    var goldLockFlag:Boolean;
                    var gfunc:Function;
                    if (event.detail == Alert.YES)
                    {
                        bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                        goldLockFlag = bagPanel.goldLockFlag;
                        if (((goldLockFlag) || (!(bagPanel))))
                        {
                            _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                            gfunc = function (_arg_1:String):void
                            {
                                _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                            };
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                            return;
                        };
                        _core.remote.call("increaseChallengeTimeByGold", null, null);
                    };
                };
                Alert.show(Language.PET_PVE_PANEL[31].toString().replace("{num}", cost), "", (Alert.YES | Alert.NO), null, func);
            };
        }

        protected function linkbutton2_clickHandler(_arg_1:MouseEvent):void
        {
            Alert.show(Language.PET_PVE_PANEL[47]);
        }

        private function _PetPVESystem_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetPVESystem_DataGridColumn1 = _local_1;
            _local_1.dataField = "rank";
            _local_1.width = 40;
            BindingManager.executeBindings(this, "_PetPVESystem_DataGridColumn1", _PetPVESystem_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get exchangeTimesFreeLabel():Label
        {
            return (this._2085624763exchangeTimesFreeLabel);
        }

        public function set ppPetEquipSlot6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1693151239ppPetEquipSlot6;
            if (_local_2 !== _arg_1)
            {
                this._1693151239ppPetEquipSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppPetEquipSlot6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tower1():Canvas
        {
            return (this._867829176tower1);
        }

        [Bindable(event="propertyChange")]
        public function get tower2():Canvas
        {
            return (this._867829175tower2);
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function set awardbraLb(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._381337386awardbraLb;
            if (_local_2 !== _arg_1)
            {
                this._381337386awardbraLb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardbraLb", _local_2, _arg_1));
            };
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            ppChangeTab(1);
        }

        [Bindable(event="propertyChange")]
        public function get nowp():RoundedLabel
        {
            return (this._3387482nowp);
        }

        private function set pprankObj(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1967088853pprankObj;
            if (_local_2 !== _arg_1)
            {
                this._1967088853pprankObj = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pprankObj", _local_2, _arg_1));
            };
        }

        public function ___PetPVESystem_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            exchangeKPBtnClickHandler(_arg_1);
        }

        public function __ppPetEquipSlot2_click(_arg_1:MouseEvent):void
        {
            pppeClick(2);
        }

        public function set passedImg(_arg_1:Image):void
        {
            var _local_2:Object = this._945137357passedImg;
            if (_local_2 !== _arg_1)
            {
                this._945137357passedImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "passedImg", _local_2, _arg_1));
            };
        }

        private function _PetPVESystem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_PVE_PANEL[0];
            _local_1 = pprankObj;
            _local_1 = Language.PET_PVE_PANEL[38];
            _local_1 = Language.PET_PVE_PANEL[39];
            _local_1 = Language.PET_PVE_PANEL[40];
            _local_1 = Language.PET_PVE_PANEL[41];
            _local_1 = Language.PET_PVE_PANEL[42];
            _local_1 = Language.PET_PVE_PANEL[14];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_PVE_PANEL[14];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_PVE_PANEL[14];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = passImg;
            _local_1 = Language.PET_PVE_PANEL[24];
            _local_1 = Language.PET_PVE_PANEL[3];
            _local_1 = Language.PET_PVE_PANEL[4];
            _local_1 = Language.PET_PVE_PANEL[5];
            _local_1 = Language.PET_PVE_PANEL[12];
            _local_1 = Language.PET_PVE_PANEL[9];
            _local_1 = Language.PET_PVE_PANEL[11];
            _local_1 = Language.PET_PVE_PANEL[15];
            _local_1 = Language.PET_PVE_PANEL[46];
            _local_1 = Language.PET_PVE_PANEL[51];
            _local_1 = Language.PET_PVE_PANEL[10];
            _local_1 = Language.PET_PVE_PANEL[18];
            _local_1 = Language.PET_PVE_PANEL[19];
            _local_1 = Language.PET_PVE_PANEL[20];
            _local_1 = Language.PET_PVE_PANEL[27];
            _local_1 = Language.PET_PVE_PANEL[16];
            _local_1 = Language.PET_PVE_PANEL[17];
            _local_1 = Language.PET_PVE_PANEL[48];
            _local_1 = Language.PET_PVE_PANEL[1];
            _local_1 = Language.PET_PVE_PANEL[2];
        }

        [Bindable(event="propertyChange")]
        public function get ppkpIcon1():PetPVEKPIcon
        {
            return (this._805379699ppkpIcon1);
        }

        public function set kpItemAward(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._300242725kpItemAward;
            if (_local_2 !== _arg_1)
            {
                this._300242725kpItemAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpItemAward", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ppAwardList():Canvas
        {
            return (this._962200965ppAwardList);
        }

        public function ___PetPVESystem_LinkButton1_click(_arg_1:MouseEvent):void
        {
            linkbutton2_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get ppkpIcon0():PetPVEKPIcon
        {
            return (this._805379698ppkpIcon0);
        }

        [Bindable(event="propertyChange")]
        public function get ppkpIcon2():PetPVEKPIcon
        {
            return (this._805379700ppkpIcon2);
        }

        [Bindable(event="propertyChange")]
        public function get ppkpIcon3():PetPVEKPIcon
        {
            return (this._805379701ppkpIcon3);
        }

        public function changePPLoadingState():void
        {
            if (loading.visible)
            {
                loading.visible = false;
            };
        }

        public function set loading(_arg_1:Canvas):void
        {
            var _local_2:Object = this._336650556loading;
            if (_local_2 !== _arg_1)
            {
                this._336650556loading = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loading", _local_2, _arg_1));
            };
        }

        public function set log(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._107332log;
            if (_local_2 !== _arg_1)
            {
                this._107332log = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "log", _local_2, _arg_1));
            };
        }

        public function set exchangeTimesFreeLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._2085624763exchangeTimesFreeLabel;
            if (_local_2 !== _arg_1)
            {
                this._2085624763exchangeTimesFreeLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "exchangeTimesFreeLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ppkpIcon5():PetPVEKPIcon
        {
            return (this._805379703ppkpIcon5);
        }

        public function set tower1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._867829176tower1;
            if (_local_2 !== _arg_1)
            {
                this._867829176tower1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tower1", _local_2, _arg_1));
            };
        }

        protected function pppeClick(_arg_1:int):void
        {
            if (((_arg_1 < 0) || (_arg_1 > 7)))
            {
                return;
            };
            var _local_2:int;
            while (_local_2 < 8)
            {
                this[("ppPetEquipSlot" + _local_2)].enabled = true;
                if (_arg_1 == _local_2)
                {
                    this[("ppPetEquipSlot" + _local_2)].enabled = false;
                };
                _local_2++;
            };
            if (!_ppveData)
            {
                return;
            };
            _kpSelectIndex = _arg_1;
            if (_ppveData.p[("s" + _arg_1)])
            {
                nowp.text = "";
                nextp.text = "";
                kpConsume.text = "";
                updateKPPart(_ppveData.p[("s" + _arg_1)]);
            }
            else
            {
                Alert.show(Language.PET_PVE_PANEL[13]);
            };
        }

        private function fixValueOfPP(_arg_1:*):String
        {
            var _local_2:String = String(_arg_1);
            var _local_3:* = _local_2.indexOf(".");
            if (_local_3 < 0)
            {
                return (_local_2);
            };
            return (_local_2.slice(0, (_local_3 + 5)));
        }

        protected function linkbutton1_clickHandler(_arg_1:MouseEvent):void
        {
            Alert.show(Language.PET_PVE_PANEL[45]);
        }

        public function set tabA(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3552076tabA;
            if (_local_2 !== _arg_1)
            {
                this._3552076tabA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabA", _local_2, _arg_1));
            };
        }

        public function updatePPRankView(_arg_1:*, _arg_2:*):void
        {
            var _local_3:Object;
            var _local_4:ArrayCollection;
            var _local_5:*;
            var _local_6:*;
            if (_arg_1)
            {
                _local_3 = _core.data.getGameDataList(GamePredef.TBL_CLASS);
                _local_4 = new ArrayCollection();
                for (_local_5 in _arg_1)
                {
                    _local_6 = _arg_1[_local_5];
                    _local_6.rank = (_local_5 + 1);
                    _local_6.classId = _local_3[_local_6.classId].name;
                    _local_4.addItem(_local_6);
                };
                pprankObj = _local_4;
            };
            if (_arg_2 >= 0)
            {
                myRanklb.text = Language.PET_PVE_PANEL[43].toString().replace("{num}", (int(_arg_2) + 1));
            }
            else
            {
                myRanklb.text = Language.PET_PVE_PANEL[43].toString().replace("{num}", "Mở");
            };
        }

        [Bindable(event="propertyChange")]
        public function get tower3():Canvas
        {
            return (this._867829174tower3);
        }

        [Bindable(event="propertyChange")]
        public function get ppkpIcon4():PetPVEKPIcon
        {
            return (this._805379702ppkpIcon4);
        }

        public function __ppPetEquipSlot7_click(_arg_1:MouseEvent):void
        {
            pppeClick(7);
        }

        private function onValueCommit(_arg_1:Event):void
        {
            var _local_2:LinkTextArea = (_arg_1.target as LinkTextArea);
            _local_2.verticalScrollPosition = _local_2.maxVerticalScrollPosition;
        }

        public function set ppMasterIcon(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2131248155ppMasterIcon;
            if (_local_2 !== _arg_1)
            {
                this._2131248155ppMasterIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppMasterIcon", _local_2, _arg_1));
            };
        }

        public function set nowp(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3387482nowp;
            if (_local_2 !== _arg_1)
            {
                this._3387482nowp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nowp", _local_2, _arg_1));
            };
        }

        public function set kpItemAwardlb(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._770453339kpItemAwardlb;
            if (_local_2 !== _arg_1)
            {
                this._770453339kpItemAwardlb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpItemAwardlb", _local_2, _arg_1));
            };
        }

        private function setPropertyLis(_arg_1:*):void
        {
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            resetPropertyArea();
            if (!_arg_1)
            {
                return;
            };
            var _local_2:* = _arg_1.p;
            var _local_3:* = _arg_1.mlv;
            var _local_4:* = [];
            for (_local_5 in _local_2)
            {
                _local_7 = _local_2[_local_5];
                for (_local_8 in _local_7)
                {
                    if (_local_7[_local_8] > 0)
                    {
                        _local_9 = GameData.d[GamePredef.TBL_CARVE][_local_7[_local_8]];
                        if (_local_9)
                        {
                            if (!_local_4[int(_local_9.p)])
                            {
                                _local_4[int(_local_9.p)] = 0;
                                _local_4[int(_local_9.p)] = (_local_4[int(_local_9.p)] + Number(_local_9.pv));
                            }
                            else
                            {
                                _local_4[int(_local_9.p)] = (_local_4[int(_local_9.p)] + Number(_local_9.pv));
                            };
                        };
                    };
                };
            };
            for (_local_6 in _local_4)
            {
                this[("kpp" + _local_6)].text = ((Language.PROP_NAME_U[_local_6] + ": ") + fixValueOfPP(_local_4[_local_6]));
            };
            if (((_local_3 > 0) && (_local_3 <= 48)))
            {
                _local_9 = GameData.d[GamePredef.TBL_CARVE_MASTER][_local_3];
                mmp1.text = ((Language.PROP_NAME_U[_local_9.p1] + ": ") + Number(_local_9.pv1));
                mmp4.text = ((Language.PROP_NAME_U[_local_9.p2] + ": ") + Number(_local_9.pv2));
                mmp5.text = ((Language.PROP_NAME_U[_local_9.p3] + ": ") + Number(_local_9.pv3));
                mmp6.text = ((Language.PROP_NAME_U[_local_9.p4] + ": ") + Number(_local_9.pv4));
                mmp7.text = ((Language.PROP_NAME_U[_local_9.p5] + ": ") + Number(_local_9.pv5));
            };
        }

        public function set mmp1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3355489mmp1;
            if (_local_2 !== _arg_1)
            {
                this._3355489mmp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mmp1", _local_2, _arg_1));
            };
        }

        public function set mmp4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3355492mmp4;
            if (_local_2 !== _arg_1)
            {
                this._3355492mmp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mmp4", _local_2, _arg_1));
            };
        }

        public function set mmp5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3355493mmp5;
            if (_local_2 !== _arg_1)
            {
                this._3355493mmp5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mmp5", _local_2, _arg_1));
            };
        }

        public function set mmp6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3355494mmp6;
            if (_local_2 !== _arg_1)
            {
                this._3355494mmp6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mmp6", _local_2, _arg_1));
            };
        }

        public function set kpp32(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._102262602kpp32;
            if (_local_2 !== _arg_1)
            {
                this._102262602kpp32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp32", _local_2, _arg_1));
            };
        }

        public function set mmp7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3355495mmp7;
            if (_local_2 !== _arg_1)
            {
                this._3355495mmp7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mmp7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get exchangeTimesGoldLabel():Label
        {
            return (this._1357353681exchangeTimesGoldLabel);
        }

        [Bindable(event="propertyChange")]
        public function get kpConsume():RoundedLabel
        {
            return (this._118332119kpConsume);
        }

        public function set kpp31(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._102262601kpp31;
            if (_local_2 !== _arg_1)
            {
                this._102262601kpp31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp31", _local_2, _arg_1));
            };
        }

        private function pptowerClicked(_arg_1:*):void
        {
            var _local_2:int = 1;
            while (_local_2 < 4)
            {
                if (_arg_1 == _local_2)
                {
                    this[("tower" + _local_2)].styleName = (("pptower" + _local_2) + "selected");
                }
                else
                {
                    this[("tower" + _local_2)].styleName = ("pptower" + _local_2);
                };
                _local_2++;
            };
        }

        public function __ppPetEquipSlot4_click(_arg_1:MouseEvent):void
        {
            pppeClick(4);
        }

        public function set ppkpIcon2(_arg_1:PetPVEKPIcon):void
        {
            var _local_2:Object = this._805379700ppkpIcon2;
            if (_local_2 !== _arg_1)
            {
                this._805379700ppkpIcon2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppkpIcon2", _local_2, _arg_1));
            };
        }

        private function resetPropertyArea():void
        {
            kpp1.text = (kpp4.text = (kpp5.text = (kpp6.text = (kpp7.text = (kpp8.text = (kpp9.text = (kpp11.text = (kpp13.text = (kpp31.text = (kpp32.text = (kpp58.text = (mmp1.text = (mmp4.text = (mmp5.text = (mmp6.text = (mmp7.text = ""))))))))))))))));
        }

        public function set ppkpIcon0(_arg_1:PetPVEKPIcon):void
        {
            var _local_2:Object = this._805379698ppkpIcon0;
            if (_local_2 !== _arg_1)
            {
                this._805379698ppkpIcon0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppkpIcon0", _local_2, _arg_1));
            };
        }

        public function set ppkpIcon1(_arg_1:PetPVEKPIcon):void
        {
            var _local_2:Object = this._805379699ppkpIcon1;
            if (_local_2 !== _arg_1)
            {
                this._805379699ppkpIcon1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppkpIcon1", _local_2, _arg_1));
            };
        }

        public function set ppAwardList(_arg_1:Canvas):void
        {
            var _local_2:Object = this._962200965ppAwardList;
            if (_local_2 !== _arg_1)
            {
                this._962200965ppAwardList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppAwardList", _local_2, _arg_1));
            };
        }

        public function set ppkpIcon4(_arg_1:PetPVEKPIcon):void
        {
            var _local_2:Object = this._805379702ppkpIcon4;
            if (_local_2 !== _arg_1)
            {
                this._805379702ppkpIcon4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppkpIcon4", _local_2, _arg_1));
            };
        }

        public function set ppkpIcon5(_arg_1:PetPVEKPIcon):void
        {
            var _local_2:Object = this._805379703ppkpIcon5;
            if (_local_2 !== _arg_1)
            {
                this._805379703ppkpIcon5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppkpIcon5", _local_2, _arg_1));
            };
        }

        public function set myRanklb(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._852883602myRanklb;
            if (_local_2 !== _arg_1)
            {
                this._852883602myRanklb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myRanklb", _local_2, _arg_1));
            };
        }

        public function set masterLb(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._283911032masterLb;
            if (_local_2 !== _arg_1)
            {
                this._283911032masterLb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "masterLb", _local_2, _arg_1));
            };
        }

        private function updateKPPart(_arg_1:*):void
        {
            var _local_4:*;
            var _local_5:int;
            var _local_6:Object;
            var _local_7:*;
            if (!_ppveData)
            {
                return;
            };
            var _local_2:* = _kpData.ppvefloor;
            if (_local_2 < 0)
            {
                _local_2 = 0;
            };
            var _local_3:* = -1;
            for (_local_4 in _KPLEVELLIST)
            {
                if (_local_2 >= _KPLEVELLIST[_local_4])
                {
                    _local_3 = _local_4;
                };
            };
            _local_5 = 0;
            while (_local_5 < 6)
            {
                _local_6 = {};
                _local_6.isLocked = true;
                if (_local_5 <= _local_3)
                {
                    _local_6.isLocked = false;
                };
                _local_6.level = 0;
                _local_6.partIndex = _kpSelectIndex;
                _local_6.iconIndex = _local_5;
                if (_arg_1[_local_5])
                {
                    _local_6.level = _arg_1[_local_5];
                };
                this[("ppkpIcon" + _local_5)].setPPKPData(_local_6);
                _local_5++;
            };
            if (((_kpIconSelectIndex >= 0) && (_kpIconSelectIndex < 6)))
            {
                _local_7 = 0;
                if (!this[("ppkpIcon" + _kpIconSelectIndex)].iconData.isLocked)
                {
                    _local_7 = _kpIconSelectIndex;
                };
                ppIconClickHandler(this[("ppkpIcon" + _local_7)].iconData);
            };
        }

        public function set ppkpIcon3(_arg_1:PetPVEKPIcon):void
        {
            var _local_2:Object = this._805379701ppkpIcon3;
            if (_local_2 !== _arg_1)
            {
                this._805379701ppkpIcon3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ppkpIcon3", _local_2, _arg_1));
            };
        }

        public function set tower2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._867829175tower2;
            if (_local_2 !== _arg_1)
            {
                this._867829175tower2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tower2", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            this.show();
            if (!initialized)
            {
                callLater(showPanel);
                return;
            };
            if (!ToolKit.isEqual(_cid, _core.cid))
            {
                resetPP();
                _cid = _core.cid;
                _core.remote.call("initPPVEPanel", null, null);
                _core.remote.call("getPPVERank", null, null);
            }
            else
            {
                if (((_ppveData) && (_kpData)))
                {
                    updatePPVEPanel(_kpData, _ppveData, _ppConf, false);
                };
            };
        }

        public function set exchangeTimesGoldBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._695802503exchangeTimesGoldBtn;
            if (_local_2 !== _arg_1)
            {
                this._695802503exchangeTimesGoldBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "exchangeTimesGoldBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get kpp13():RoundedLabel
        {
            return (this._102262541kpp13);
        }

        private function init():void
        {
            log.addEventListener(FlexEvent.VALUE_COMMIT, onValueCommit);
            log.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }

        [Bindable(event="propertyChange")]
        public function get challengeTimesGoldLabel():Label
        {
            return (this._511012591challengeTimesGoldLabel);
        }

        [Bindable(event="propertyChange")]
        public function get kpp11():RoundedLabel
        {
            return (this._102262539kpp11);
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            ppChangeTab(0);
        }

        public function set tower3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._867829174tower3;
            if (_local_2 !== _arg_1)
            {
                this._867829174tower3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tower3", _local_2, _arg_1));
            };
        }

        public function set kpp58(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._102262670kpp58;
            if (_local_2 !== _arg_1)
            {
                this._102262670kpp58 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp58", _local_2, _arg_1));
            };
        }

        private function addPPLog(_arg_1:*, _arg_2:*, _arg_3:*):void
        {
            var _local_4:* = "";
            if (_arg_1 == GamePredef.BATTLE_WIN)
            {
                _local_4 = (_local_4 + Language.PET_PVE_PANEL[35].toString().replace("{num}", _arg_2));
            }
            else
            {
                if (_arg_1 == GamePredef.BATTLE_LOSE)
                {
                    _local_4 = (_local_4 + Language.PET_PVE_PANEL[36]);
                }
                else
                {
                    _local_4 = (_local_4 + Language.PET_PVE_PANEL[44]);
                };
            };
            _local_4 = (_local_4 + Language.PET_PVE_PANEL[37].toString().replace("{bid}", _arg_3));
            _logStrArr.push((_local_4 + "\n"));
            log.htmlText = _logStrArr.join();
        }

        [Bindable(event="propertyChange")]
        public function get kpItemAward():ItemSlot
        {
            return (this._300242725kpItemAward);
        }

        public function ___PetPVESystem_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            challengeBtnClickHandler(_arg_1);
        }

        public function __ppPetEquipSlot1_click(_arg_1:MouseEvent):void
        {
            pppeClick(1);
        }

        public function __exchangeTimesGoldBtn_click(_arg_1:MouseEvent):void
        {
            goldExchangeBtnClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        private function get pprankObj():ArrayCollection
        {
            return (this._1967088853pprankObj);
        }

        private function setPPFloorAward(_arg_1:*, _arg_2:*):void
        {
            if (_arg_1 < 1)
            {
                kpItemAward.clean();
                kpAward.text = Language.PET_PVE_PANEL[49];
                kpItemAwardlb.text = "";
                kpItemAward.enabled = false;
                return;
            };
            if (_arg_1 > 150)
            {
                _arg_1 = 150;
            };
            var _local_3:* = GameData.d[GamePredef.TBL_CARVE_AWARD][_arg_1];
            if (!_local_3)
            {
                return;
            };
            var _local_4:* = _local_3.itemId;
            var _local_5:Object = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_4];
            kpItemAwardlb.text = _local_5.name;
            kpItemAward.type = GamePredef.TBL_ITEM_TEMPLATE;
            kpItemAward.giid = _local_4;
            kpItemAward.slotData = _local_5;
            kpAward.text = _local_3.award;
            awardbraLb.text = Language.PET_PVE_PANEL[21].toString().replace("{num}", _arg_1);
            if (!_arg_2)
            {
                _arg_2 = 0;
            };
            if (_arg_1 > _arg_2)
            {
                kpItemAward.enabled = true;
            }
            else
            {
                kpItemAward.enabled = false;
            };
        }

        protected function exchangeKPBtnClickHandler(event:MouseEvent):void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("exchangeKP", null, null);
                };
            };
            Alert.show(Language.PET_PVE_PANEL[50], "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get awardbraLb():RoundedLabel
        {
            return (this._381337386awardbraLb);
        }

        [Bindable(event="propertyChange")]
        public function get loading():Canvas
        {
            return (this._336650556loading);
        }

        [Bindable(event="propertyChange")]
        public function get log():LinkTextArea
        {
            return (this._107332log);
        }

        [Bindable(event="propertyChange")]
        public function get passedImg():Image
        {
            return (this._945137357passedImg);
        }

        [Bindable(event="propertyChange")]
        public function get tabA():ViewStack
        {
            return (this._3552076tabA);
        }

        private function _PetPVESystem_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetPVESystem_DataGridColumn5 = _local_1;
            _local_1.dataField = "floorNum";
            BindingManager.executeBindings(this, "_PetPVESystem_DataGridColumn5", _PetPVESystem_DataGridColumn5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get kpp31():RoundedLabel
        {
            return (this._102262601kpp31);
        }

        private function setPPFloor(_arg_1:int):void
        {
            passedImg.visible = true;
            if (((_arg_1 > 0) && (_arg_1 < 149)))
            {
                towerlb3.text = Language.PET_PVE_PANEL[14].toString().replace("{num}", (_arg_1 + 2));
                towerlb2.text = Language.PET_PVE_PANEL[14].toString().replace("{num}", (_arg_1 + 1));
                towerlb1.text = Language.PET_PVE_PANEL[14].toString().replace("{num}", _arg_1);
                towerlb3.data = (_arg_1 + 2);
                towerlb2.data = (_arg_1 + 1);
                towerlb1.data = _arg_1;
            }
            else
            {
                if (_arg_1 == 0)
                {
                    passedImg.visible = false;
                    towerlb3.text = Language.PET_PVE_PANEL[14].toString().replace("{num}", (_arg_1 + 3));
                    towerlb2.text = Language.PET_PVE_PANEL[14].toString().replace("{num}", (_arg_1 + 2));
                    towerlb1.text = Language.PET_PVE_PANEL[14].toString().replace("{num}", (_arg_1 + 1));
                    towerlb3.data = (_arg_1 + 3);
                    towerlb2.data = (_arg_1 + 2);
                    towerlb1.data = (_arg_1 + 1);
                }
                else
                {
                    if (_arg_1 == 149)
                    {
                        towerlb3.text = "";
                        tower3.visible = false;
                        towerlb2.text = Language.PET_PVE_PANEL[14].toString().replace("{num}", (_arg_1 + 1));
                        towerlb1.text = Language.PET_PVE_PANEL[14].toString().replace("{num}", _arg_1);
                        towerlb3.data = -1;
                        towerlb2.data = (_arg_1 + 1);
                        towerlb1.data = _arg_1;
                    }
                    else
                    {
                        if (_arg_1 == 150)
                        {
                            towerlb3.text = "";
                            tower3.visible = false;
                            towerlb2.text = "";
                            tower2.visible = false;
                            towerlb1.text = Language.PET_PVE_PANEL[14].toString().replace("{num}", _arg_1);
                            towerlb3.data = -1;
                            towerlb2.data = -1;
                            towerlb1.data = _arg_1;
                        };
                    };
                };
            };
            setPPFloorAward((_arg_1 + 1), _arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get kpp32():RoundedLabel
        {
            return (this._102262602kpp32);
        }

        public function set bangBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324756bangBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1863324756bangBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn0", _local_2, _arg_1));
            };
        }

        public function set bangBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324755bangBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1863324755bangBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get kpItemAwardlb():RoundedLabel
        {
            return (this._770453339kpItemAwardlb);
        }

        [Bindable(event="propertyChange")]
        public function get mmp5():RoundedLabel
        {
            return (this._3355493mmp5);
        }

        [Bindable(event="propertyChange")]
        public function get mmp7():RoundedLabel
        {
            return (this._3355495mmp7);
        }

        [Bindable(event="propertyChange")]
        public function get mmp6():RoundedLabel
        {
            return (this._3355494mmp6);
        }

        [Bindable(event="propertyChange")]
        public function get myRanklb():RoundedLabel
        {
            return (this._852883602myRanklb);
        }

        public function __ppPetEquipSlot6_click(_arg_1:MouseEvent):void
        {
            pppeClick(6);
        }

        [Bindable(event="propertyChange")]
        public function get exchangeTimesGoldBtn():BasicDelayButton
        {
            return (this._695802503exchangeTimesGoldBtn);
        }

        [Bindable(event="propertyChange")]
        public function get masterLb():RoundedLabel
        {
            return (this._283911032masterLb);
        }

        [Bindable(event="propertyChange")]
        public function get mmp1():RoundedLabel
        {
            return (this._3355489mmp1);
        }

        public function onSendReplayPPVEPanel(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*, _arg_5:*):void
        {
            addPPLog(_arg_1, _arg_2, _arg_3);
            if (((!(_arg_4 == null)) && (!(_arg_5 == null))))
            {
                updatePPRankView(_arg_4, _arg_5);
            };
        }

        public function resetPP():void
        {
            if (log)
            {
                log.htmlText = "";
            };
            _logStrArr.clear();
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_PET_PVE_CONFIG);
            if (_local_1.initialized)
            {
                _local_1.resetPPconfig();
            };
            resetUI();
            resetPropertyArea();
        }

        override public function initialize():void
        {
            var target:PetPVESystem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetPVESystem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetPVESystemWatcherSetupUtil");
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

        private function _PetPVESystem_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetPVESystem_DataGridColumn4 = _local_1;
            _local_1.dataField = "classId";
            BindingManager.executeBindings(this, "_PetPVESystem_DataGridColumn4", _PetPVESystem_DataGridColumn4);
            return (_local_1);
        }

        public function set exchangeTimesGoldLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1357353681exchangeTimesGoldLabel;
            if (_local_2 !== _arg_1)
            {
                this._1357353681exchangeTimesGoldLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "exchangeTimesGoldLabel", _local_2, _arg_1));
            };
        }

        public function ___PetPVESystem_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            configPetGroupClickHandler(_arg_1);
        }

        private function ppChangeTab(_arg_1:*):void
        {
            if (tabA.selectedIndex != _arg_1)
            {
                this[("bangBtn" + tabA.selectedIndex)].selected = false;
                tabA.selectedIndex = _arg_1;
                this[("bangBtn" + _arg_1)].selected = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get kpp58():RoundedLabel
        {
            return (this._102262670kpp58);
        }

        public function set towerlb1(_arg_1:Label):void
        {
            var _local_2:Object = this._760122926towerlb1;
            if (_local_2 !== _arg_1)
            {
                this._760122926towerlb1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerlb1", _local_2, _arg_1));
            };
        }

        public function __ppPetEquipSlot3_click(_arg_1:MouseEvent):void
        {
            pppeClick(3);
        }

        public function set kpConsume(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._118332119kpConsume;
            if (_local_2 !== _arg_1)
            {
                this._118332119kpConsume = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpConsume", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn0():BasicGlowButton
        {
            return (this._1863324756bangBtn0);
        }

        public function set towerlb2(_arg_1:Label):void
        {
            var _local_2:Object = this._760122925towerlb2;
            if (_local_2 !== _arg_1)
            {
                this._760122925towerlb2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerlb2", _local_2, _arg_1));
            };
        }

        public function set towerlb3(_arg_1:Label):void
        {
            var _local_2:Object = this._760122924towerlb3;
            if (_local_2 !== _arg_1)
            {
                this._760122924towerlb3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "towerlb3", _local_2, _arg_1));
            };
        }

        public function set nextp(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._104715229nextp;
            if (_local_2 !== _arg_1)
            {
                this._104715229nextp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextp", _local_2, _arg_1));
            };
        }

        private function _PetPVESystem_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetPVESystem_DataGridColumn3 = _local_1;
            _local_1.dataField = "level";
            _local_1.width = 80;
            BindingManager.executeBindings(this, "_PetPVESystem_DataGridColumn3", _PetPVESystem_DataGridColumn3);
            return (_local_1);
        }

        public function ___PetPVESystem_LinkButton2_click(_arg_1:MouseEvent):void
        {
            linkbutton1_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn1():BasicGlowButton
        {
            return (this._1863324755bangBtn1);
        }

        public function set kpp4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3298793kpp4;
            if (_local_2 !== _arg_1)
            {
                this._3298793kpp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp4", _local_2, _arg_1));
            };
        }

        protected function configPetGroupClickHandler(_arg_1:MouseEvent):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_PET_PVE_CONFIG);
            _local_2.show();
            _local_2.setPPVEConfig(_ppveData.ppveConfig);
        }

        public function set kpp6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3298795kpp6;
            if (_local_2 !== _arg_1)
            {
                this._3298795kpp6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mmp4():RoundedLabel
        {
            return (this._3355492mmp4);
        }

        public function set kpp7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3298796kpp7;
            if (_local_2 !== _arg_1)
            {
                this._3298796kpp7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get towerlb1():Label
        {
            return (this._760122926towerlb1);
        }

        public function ppIconClickHandler(_arg_1:*):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:* = int(_arg_1.level);
            if (_local_4 > 0)
            {
                _local_2 = GameData.d[GamePredef.TBL_CARVE][_local_4];
                nowp.text = ((Language.PROP_NAME_U[_local_2.p] + ": ") + Number(_local_2.pv));
                _local_3 = GameData.d[GamePredef.TBL_CARVE][(_local_4 + 1)];
                if (_local_3)
                {
                    nextp.text = ((Language.PROP_NAME_U[_local_3.p] + ": ") + Number(_local_3.pv));
                    kpConsume.text = _local_3.costkp;
                }
                else
                {
                    nextp.text = "MAX";
                    kpConsume.text = Language.PET_PVE_PANEL[49];
                };
            }
            else
            {
                _local_3 = GameData.d[GamePredef.TBL_CARVE][((((int(_arg_1.partIndex) + 1) * 1000) + ((int(_arg_1.iconIndex) + 1) * 100)) + 1)];
                nowp.text = Language.PET_PVE_PANEL[49];
                nextp.text = ((Language.PROP_NAME_U[_local_3.p] + ": ") + Number(_local_3.pv));
                kpConsume.text = _local_3.costkp;
            };
            var _local_5:int;
            while (_local_5 < 6)
            {
                if (int(_arg_1.iconIndex) == _local_5)
                {
                    this[("ppkpIcon" + _local_5)].filters = [GamePredef.FILTER_SOUL_SLOT_SELECTED];
                }
                else
                {
                    this[("ppkpIcon" + _local_5)].filters = [];
                };
                _local_5++;
            };
            _kpIconSelectIndex = int(_arg_1.iconIndex);
        }

        public function set kpp9(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3298798kpp9;
            if (_local_2 !== _arg_1)
            {
                this._3298798kpp9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp9", _local_2, _arg_1));
            };
        }

        public function ___PetPVESystem_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _PetPVESystem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_BasicTitleCanvas1.text = _arg_1;
            }, "_PetPVESystem_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pprankObj);
            }, function (_arg_1:Object):void
            {
                _PetPVESystem_DataGrid1.dataProvider = _arg_1;
            }, "_PetPVESystem_DataGrid1.dataProvider");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_DataGridColumn1.headerText = _arg_1;
            }, "_PetPVESystem_DataGridColumn1.headerText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_DataGridColumn2.headerText = _arg_1;
            }, "_PetPVESystem_DataGridColumn2.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_DataGridColumn3.headerText = _arg_1;
            }, "_PetPVESystem_DataGridColumn3.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_DataGridColumn4.headerText = _arg_1;
            }, "_PetPVESystem_DataGridColumn4.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_DataGridColumn5.headerText = _arg_1;
            }, "_PetPVESystem_DataGridColumn5.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                towerlb3.text = _arg_1;
            }, "towerlb3.text");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                towerlb3.filters = _arg_1;
            }, "towerlb3.filters");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                towerlb2.text = _arg_1;
            }, "towerlb2.text");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                towerlb2.filters = _arg_1;
            }, "towerlb2.filters");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                towerlb1.text = _arg_1;
            }, "towerlb1.text");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                towerlb1.filters = _arg_1;
            }, "towerlb1.filters");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (passImg);
            }, function (_arg_1:Object):void
            {
                passedImg.source = _arg_1;
            }, "passedImg.source");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_RoundedLabel4.text = _arg_1;
            }, "_PetPVESystem_RoundedLabel4.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_BasicDelayButton1.label = _arg_1;
            }, "_PetPVESystem_BasicDelayButton1.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_BasicDelayButton2.label = _arg_1;
            }, "_PetPVESystem_BasicDelayButton2.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_BasicDelayButton3.label = _arg_1;
            }, "_PetPVESystem_BasicDelayButton3.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                exchangeTimesGoldBtn.label = _arg_1;
            }, "exchangeTimesGoldBtn.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                challengeTimesLabel.text = _arg_1;
            }, "challengeTimesLabel.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                exchangeTimesFreeLabel.text = _arg_1;
            }, "exchangeTimesFreeLabel.text");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                exchangeTimesGoldLabel.text = _arg_1;
            }, "exchangeTimesGoldLabel.text");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_LinkButton1.label = _arg_1;
            }, "_PetPVESystem_LinkButton1.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                challengeTimesGoldLabel.text = _arg_1;
            }, "challengeTimesGoldLabel.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_BasicDelayButton5.label = _arg_1;
            }, "_PetPVESystem_BasicDelayButton5.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_RoundedLabel6.text = _arg_1;
            }, "_PetPVESystem_RoundedLabel6.text");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_RoundedLabel8.text = _arg_1;
            }, "_PetPVESystem_RoundedLabel8.text");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_RoundedLabel10.text = _arg_1;
            }, "_PetPVESystem_RoundedLabel10.text");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_LinkButton2.label = _arg_1;
            }, "_PetPVESystem_LinkButton2.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_RoundedLabel13.text = _arg_1;
            }, "_PetPVESystem_RoundedLabel13.text");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_RoundedLabel14.text = _arg_1;
            }, "_PetPVESystem_RoundedLabel14.text");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVESystem_Label8.text = _arg_1;
            }, "_PetPVESystem_Label8.text");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[33] = binding;
            return (result);
        }

        public function set kpp8(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3298797kpp8;
            if (_local_2 !== _arg_1)
            {
                this._3298797kpp8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get towerlb2():Label
        {
            return (this._760122925towerlb2);
        }

        public function set kpp5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3298794kpp5;
            if (_local_2 !== _arg_1)
            {
                this._3298794kpp5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get kpp1():RoundedLabel
        {
            return (this._3298790kpp1);
        }

        [Bindable(event="propertyChange")]
        public function get kpp4():RoundedLabel
        {
            return (this._3298793kpp4);
        }

        public function __ppPetEquipSlot0_click(_arg_1:MouseEvent):void
        {
            pppeClick(0);
        }

        public function set kpp1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3298790kpp1;
            if (_local_2 !== _arg_1)
            {
                this._3298790kpp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpp1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get kpp5():RoundedLabel
        {
            return (this._3298794kpp5);
        }

        public function updatePPVEPanel(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*):void
        {
            var _local_7:Object;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            if (!initialized)
            {
                return;
            };
            if (((!(_arg_1)) || (!(_arg_2))))
            {
                return;
            };
            if (loading.visible)
            {
                loading.visible = false;
            };
            if (_arg_3)
            {
                _arg_2.ppveConfig = _arg_3;
                _ppConf = _arg_3;
                _local_7 = _core.view.getUI(ViewManager.PANEL_PET_PVE_CONFIG);
                if (((_local_7.initialized) && (_local_7.visible)))
                {
                    _local_7.hide();
                    Alert.show(Language.PET_PVE_PANEL[34]);
                };
            }
            else
            {
                if (((this._ppveData) && (!(ToolKit.isEmptyObject(this._ppveData.ppveConfig)))))
                {
                    _arg_2.ppveConfig = this._ppveData.ppveConfig;
                };
            };
            if (((_arg_4) && ((!(_arg_3)) || (ToolKit.isEmptyObject(_arg_3)))))
            {
                _arg_2.ppveConfig = {};
                _ppConf = {};
            };
            this._ppveData = _arg_2;
            this._kpData = _arg_1;
            exchangeTimesFreeLabel.text = Language.PET_PVE_PANEL[11].toString().replace("{num}", _kpData.awardTime);
            exchangeTimesGoldLabel.text = Language.PET_PVE_PANEL[15].toString().replace("{num}", _kpData.gold4awardTimeDaily);
            challengeTimesLabel.text = Language.PET_PVE_PANEL[9].toString().replace("{num}", _kpData.freeTime);
            challengeTimesGoldLabel.text = Language.PET_PVE_PANEL[51].toString().replace("{num}", _kpData.goldClgTime);
            setPPFloor(int(_kpData.ppvefloor));
            if (_ppveData.p[("s" + _kpSelectIndex)])
            {
                pppeClick(_kpSelectIndex);
            }
            else
            {
                Alert.show(Language.PET_PVE_PANEL[13]);
            };
            var _local_5:* = _ppveData.mlv;
            if (((_local_5 > 0) && (_local_5 <= 20)))
            {
                ppMasterIcon.styleName = "masterMedal1";
            }
            else
            {
                if (((_local_5 >= 21) && (_local_5 <= 40)))
                {
                    ppMasterIcon.styleName = "masterMedal2";
                }
                else
                {
                    if (((_local_5 >= 41) && (_local_5 <= 48)))
                    {
                        ppMasterIcon.styleName = "masterMedal3";
                    }
                    else
                    {
                        ppMasterIcon.styleName = "masterMedal0";
                    };
                };
            };
            var _local_6:* = (int(_ppveData.mlv) + 1);
            if (((_local_6 > 0) && (_local_6 <= 48)))
            {
                _local_8 = 0;
                for (_local_9 in _ppveData.p)
                {
                    _local_11 = _ppveData.p[_local_9];
                    for (_local_12 in _local_11)
                    {
                        _local_13 = int(_local_11[_local_12]);
                        if (_local_13 > 0)
                        {
                            _local_8 = (_local_8 + ((_local_13 % 1000) % 100));
                        };
                    };
                };
                _local_10 = GameData.d[GamePredef.TBL_CARVE_MASTER][_local_6];
                if (_local_10)
                {
                    _local_14 = Language.PET_PVE_PANEL[29].toString().replace("{num}", (_local_6 * 20)).replace("{nowlv}", _local_8).replace("{totlelv}", (_local_6 * 20)).replace("{p1}", Language.PROP_NAME_U[_local_10.p1]).replace("{p2}", Language.PROP_NAME_U[_local_10.p2]).replace("{p3}", Language.PROP_NAME_U[_local_10.p3]).replace("{p4}", Language.PROP_NAME_U[_local_10.p4]).replace("{p5}", Language.PROP_NAME_U[_local_10.p5]).replace("{pv1}", _local_10.pv1).replace("{pv2}", _local_10.pv2).replace("{pv3}", _local_10.pv3).replace("{pv4}", _local_10.pv4).replace("{pv5}", _local_10.pv5);
                    ppMasterIcon.toolTip = (masterLb.toolTip = _local_14);
                }
                else
                {
                    ppMasterIcon.toolTip = (masterLb.toolTip = Language.PET_PVE_PANEL[30]);
                };
            }
            else
            {
                ppMasterIcon.toolTip = (masterLb.toolTip = Language.PET_PVE_PANEL[30]);
            };
            masterLb.text = Language.PET_PVE_PANEL[28].toString().replace("{num}", _ppveData.mlv);
            kpnum.text = Language.PET_PVE_PANEL[26].toString().replace("{num}", _kpData.kp);
            setPropertyLis(_ppveData);
        }

        [Bindable(event="propertyChange")]
        public function get kpp9():RoundedLabel
        {
            return (this._3298798kpp9);
        }

        public function set kpAward(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._551218184kpAward;
            if (_local_2 !== _arg_1)
            {
                this._551218184kpAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kpAward", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get kpp6():RoundedLabel
        {
            return (this._3298795kpp6);
        }

        protected function goldExchangeBtnClickHandler(event:MouseEvent):void
        {
            var func:Function = function (event:CloseEvent):void
            {
                var bagPanel:BagPanel;
                var goldLockFlag:Boolean;
                var gfunc:Function;
                if (event.detail == Alert.YES)
                {
                    bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                    goldLockFlag = bagPanel.goldLockFlag;
                    if (((goldLockFlag) || (!(bagPanel))))
                    {
                        _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                        gfunc = function (_arg_1:String):void
                        {
                            _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                        };
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                        return;
                    };
                    _core.remote.call("exchangeKPByGold", null, null);
                };
            };
            var level:int = int(this._kpData.ppvefloor);
            if ((level < 0))
            {
                level = 0;
            };
            Alert.show(Language.PET_PVE_PANEL[32], "", (Alert.YES | Alert.NO), null, func);
        }


    }
}//package com.qeedoo.ui.view.compDragable

