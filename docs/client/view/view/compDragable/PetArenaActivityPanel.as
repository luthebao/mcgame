// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetArenaActivityPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import mx.containers.HBox;
    import mx.states.SetProperty;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.TextArea;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.DataGrid;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.utils.ArrayQueue;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import mx.states.State;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.binding.BindingManager;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.RendererButton;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.utils.TextUtil;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import mx.binding.Binding;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import flash.utils.getDefinitionByName;
    import flash.net.Responder;
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

    public class PetArenaActivityPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const refreshInterval:Number = 60000;
        private const PET_ARENA_RATIO_ACT:* = 1;
        private var _95488733dgCvs:Canvas;
        internal var _1127061662leadPetId:String = "";
        private var _1405038217award4:ItemSlot;
        private var _timer:Timer;
        private var _3066321cvs1:Canvas;
        private var _1365722418cdTime:BasicTxtButton;
        public var _PetArenaActivityPanel_BasicTitleCanvas1:BasicTitleCanvas;
        internal var _677507847petType:String = "";
        public var _PetArenaActivityPanel_Label1:Label;
        public var _PetArenaActivityPanel_Label2:Label;
        public var _PetArenaActivityPanel_Label3:Label;
        public var _PetArenaActivityPanel_Label4:Label;
        public var _PetArenaActivityPanel_Label5:Label;
        private var _42975283_haveTicket:Boolean = false;
        private var _1125982860curRank:BasicTxtButton;
        private var _94490672cdSec:int = 0;
        private var _1405038219award2:ItemSlot;
        private var _3273h1:HBox;
        public var _PetArenaActivityPanel_SetProperty1:SetProperty;
        public var _PetArenaActivityPanel_SetProperty3:SetProperty;
        public var _PetArenaActivityPanel_SetProperty4:SetProperty;
        private var _firstTimeFlag:Boolean = true;
        public var _PetArenaActivityPanel_SetProperty2:SetProperty;
        private var _107332log:LinkTextArea;
        private var _1438608771autoPlay:CheckBox;
        private var _382098058maxCombo:BasicTxtButton;
        private var _874983082fightNum:BasicTxtButton;
        private var _50334755leadPet:BasicTxtButton;
        private var _1179952142applyBtn:BasicGlowButton;
        private var _3066323cvs3:Canvas;
        public var _PetArenaActivityPanel_BasicGlowButton1:BasicGlowButton;
        public var _PetArenaActivityPanel_BasicGlowButton3:BasicGlowButton;
        public var _PetArenaActivityPanel_BasicGlowButton4:BasicGlowButton;
        public var _PetArenaActivityPanel_BasicGlowButton5:BasicGlowButton;
        public var _PetArenaActivityPanel_BasicGlowButton7:BasicGlowButton;
        private var _1405038218award3:ItemSlot;
        public var _PetArenaActivityPanel_BasicGlowButton2:BasicGlowButton;
        private var _1459480606lastRank:BasicTxtButton;
        private var _1226843275weekPet:BasicTxtButton;
        private var _lastRefreshTime:Number = 0;
        private var point:Number = 0;
        private var _enemy_data:Object;
        private var _187011237arenaSysMsg:TextArea;
        private var _3066322cvs2:Canvas;
        private var _1621962092awardStr:TextArea;
        public var _PetArenaActivityPanel_DataGridColumn1:DataGridColumn;
        public var _PetArenaActivityPanel_DataGridColumn2:DataGridColumn;
        public var _PetArenaActivityPanel_DataGridColumn4:DataGridColumn;
        public var _PetArenaActivityPanel_DataGridColumn5:DataGridColumn;
        private var sysMsgObject:Object = null;
        public var _PetArenaActivityPanel_DataGridColumn3:DataGridColumn;
        public var _PetArenaActivityPanel_BasicTxtButton8:BasicTxtButton;
        private var _1403636296enemyDataGrid:DataGrid;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetArenaActivityPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cvs1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":39,
                                "width":272,
                                "height":270,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"weekPet",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 16407301;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":8,
                                            "width":167,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"leadPet",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 16407301;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":30,
                                            "width":167,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetArenaActivityPanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":87
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"fightNum",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":125,
                                            "y":87,
                                            "width":52
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PetArenaActivityPanel_BasicGlowButton1",
                                    "events":{"click":"___PetArenaActivityPanel_BasicGlowButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":185,
                                            "y":85,
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetArenaActivityPanel_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":113
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"cdTime",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":125,
                                            "y":113,
                                            "width":52
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PetArenaActivityPanel_BasicGlowButton2",
                                    "events":{"click":"___PetArenaActivityPanel_BasicGlowButton2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":185,
                                            "y":111,
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"maxCombo",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":125,
                                            "y":134,
                                            "width":58,
                                            "label":"0"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetArenaActivityPanel_Label3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":134
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetArenaActivityPanel_Label4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":158
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"lastRank",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":125,
                                            "y":158,
                                            "width":58
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PetArenaActivityPanel_BasicGlowButton3",
                                    "events":{"click":"___PetArenaActivityPanel_BasicGlowButton3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":185,
                                            "y":155,
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"curRank",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                        this.color = 16407301;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":55,
                                            "width":167,
                                            "height":30
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PetArenaActivityPanel_BasicGlowButton4",
                                    "events":{"click":"___PetArenaActivityPanel_BasicGlowButton4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":185,
                                            "y":54,
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetArenaActivityPanel_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":184,
                                            "width":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetArenaActivityPanel_BasicTxtButton8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":125,
                                            "y":184,
                                            "width":49
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PetArenaActivityPanel_BasicGlowButton5",
                                    "events":{"click":"___PetArenaActivityPanel_BasicGlowButton5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":185,
                                            "y":181,
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextArea,
                                    "id":"awardStr",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                        this.borderThickness = 1;
                                        this.borderColor = 198926;
                                        this.backgroundAlpha = 0.3;
                                        this.backgroundColor = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "editable":false,
                                            "selectable":false,
                                            "height":20,
                                            "y":207,
                                            "width":264,
                                            "x":4
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"h1",
                                    "events":{"creationComplete":"__h1_creationComplete"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 30;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":40,
                                            "y":229,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"award2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "type":29,
                                                        "giid":3257,
                                                        "toolTip":"",
                                                        "movable":false,
                                                        "acceptable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"award3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "type":29,
                                                        "giid":3258,
                                                        "toolTip":"",
                                                        "movable":false,
                                                        "acceptable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"award4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "type":29,
                                                        "giid":3259,
                                                        "toolTip":"",
                                                        "movable":false,
                                                        "acceptable":false
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
                        "id":"cvs2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":308,
                                "width":272,
                                "height":110,
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
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":6,
                                            "y":10,
                                            "width":260,
                                            "height":94,
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
                        "type":Canvas,
                        "id":"cvs3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":300,
                                "y":39,
                                "width":380,
                                "height":381,
                                "styleName":"CanvasBorder",
                                "verticalScrollPolicy":"off",
                                "clipContent":true,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"applyBtn",
                                    "events":{"click":"__applyBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CrystalYellowButton",
                                            "x":23,
                                            "y":15,
                                            "width":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PetArenaActivityPanel_BasicGlowButton7",
                                    "events":{"click":"___PetArenaActivityPanel_BasicGlowButton7_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CrystalYellowButton",
                                            "x":120,
                                            "y":15,
                                            "width":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"autoPlay",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "selected":false,
                                            "x":230,
                                            "y":16,
                                            "width":140
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextArea,
                                    "id":"arenaSysMsg",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                        this.borderThickness = 1;
                                        this.borderColor = 198926;
                                        this.backgroundAlpha = 0.3;
                                        this.backgroundColor = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "editable":false,
                                            "selectable":false,
                                            "height":20,
                                            "y":52,
                                            "width":370,
                                            "x":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"dgCvs",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "80";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "verticalScrollPolicy":"off",
                                            "clipContent":true,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"enemyDataGrid",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "sortableColumns":false,
                                                        "height":265,
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "doubleClickEnabled":false,
                                                        "columns":[_PetArenaActivityPanel_DataGridColumn1_i(), _PetArenaActivityPanel_DataGridColumn2_i(), _PetArenaActivityPanel_DataGridColumn3_i(), _PetArenaActivityPanel_DataGridColumn4_i(), _PetArenaActivityPanel_DataGridColumn5_i()]
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
        private var _722894876enemiesList:ArrayCollection = new ArrayCollection();
        private var _selfData:Object = {
            "rank":0,
            "cd":0,
            "today":0,
            "max":20,
            "pnt":0,
            "lrank":-1
        };
        private var _logStrArr:ArrayQueue = new ArrayQueue(30);
        private const rankAwardCoef:Array = [40, 60, 80, 100, 120, 140];
        private const rankGroupStr:Array = [Language.PET_ARENA_RANK_U[9], Language.PET_ARENA_RANK_U[10], Language.PET_ARENA_RANK_U[11], Language.PET_ARENA_RANK_U[12], Language.PET_ARENA_RANK_U[13], Language.PET_ARENA_RANK_U[14]];
        private var typeList:Array = ["人形系", "野兽系", "植物系", "机械系", "恶魔系", "龙系", "BOSS系"];
        private var petArenaAct:Object = {};
        public var lang:Array = [Language.AI_CONF_PANEL_U[29], Language.AI_CONF_PANEL_U[30], Language.AI_CONF_PANEL_U[31], Language.AI_CONF_PANEL_U[32], Language.AI_CONF_PANEL_U[33], Language.AI_CONF_PANEL_U[34]];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetArenaActivityPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 430;
            this.styleName = "StandardContent";
            this.states = [_PetArenaActivityPanel_State1_c(), _PetArenaActivityPanel_State2_c()];
            this.addEventListener("creationComplete", ___PetArenaActivityPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetArenaActivityPanel._watcherSetupUtil = _arg_1;
        }


        public function ___PetArenaActivityPanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_PET_ARENA_ACTIVITY_RANK);
        }

        [Bindable(event="propertyChange")]
        public function get lastRank():BasicTxtButton
        {
            return (this._1459480606lastRank);
        }

        public function initPetlrank(_arg_1:int):void
        {
            _selfData.lrank = _arg_1;
            showState("reg");
            refreshCharInfo();
        }

        public function set lastRank(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1459480606lastRank;
            if (_local_2 !== _arg_1)
            {
                this._1459480606lastRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastRank", _local_2, _arg_1));
            };
        }

        public function __h1_creationComplete(_arg_1:FlexEvent):void
        {
            awardIconInit();
        }

        private function _PetArenaActivityPanel_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "reg";
            _local_1.overrides = [_PetArenaActivityPanel_SetProperty1_i(), _PetArenaActivityPanel_SetProperty2_i(), _PetArenaActivityPanel_SetProperty3_i(), _PetArenaActivityPanel_SetProperty4_i()];
            return (_local_1);
        }

        public function set applyBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1179952142applyBtn;
            if (_local_2 !== _arg_1)
            {
                this._1179952142applyBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "applyBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get applyBtn():BasicGlowButton
        {
            return (this._1179952142applyBtn);
        }

        private function getFightAward():void
        {
            _core.remote.call("getPetRankAwardActivity", null);
        }

        public function onPetArenaFight(_arg_1:Object):void
        {
            var _local_2:String = logObjToString(_arg_1);
            addArenaLog(_local_2);
            if (!_arg_1.guest)
            {
                if (_arg_1.cd)
                {
                    _selfData.cd = _arg_1.cd;
                    cdSec = Math.floor((((_arg_1.cd - _core.timeLag) - new Date().getTime()) / 1000));
                    if (cdSec > 600)
                    {
                        cdSec = 600;
                        _selfData.cd = (_selfData.cd - (cdSec - 600));
                    };
                    resetTimer();
                };
                if (_arg_1.pnt)
                {
                    _selfData.pnt = ToolKit.add(_selfData.pnt, _arg_1.pnt);
                };
                if (_arg_1.today)
                {
                    _selfData.today = _arg_1.today;
                };
                if (_arg_1.maxCombo)
                {
                    _selfData.maxCombo = _arg_1.maxCombo;
                };
                if (autoPlay.selected)
                {
                    _core.remote.call("replayPetFight", null, _arg_1.bid);
                };
            };
            refreshCharInfo();
            if (_arg_1.enemy)
            {
                dataGridEffect();
                onGetEnemies(_arg_1.enemy);
            };
        }

        [Bindable(event="propertyChange")]
        public function get leadPet():BasicTxtButton
        {
            return (this._50334755leadPet);
        }

        [Bindable(event="propertyChange")]
        private function get cdSec():int
        {
            return (this._94490672cdSec);
        }

        [Bindable(event="propertyChange")]
        private function get _haveTicket():Boolean
        {
            return (this._42975283_haveTicket);
        }

        public function ___PetArenaActivityPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            addFightNum();
        }

        private function _PetArenaActivityPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaActivityPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "cid";
            _local_1.itemRenderer = _PetArenaActivityPanel_ClassFactory1_c();
            BindingManager.executeBindings(this, "_PetArenaActivityPanel_DataGridColumn5", _PetArenaActivityPanel_DataGridColumn5);
            return (_local_1);
        }

        public function set leadPet(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._50334755leadPet;
            if (_local_2 !== _arg_1)
            {
                this._50334755leadPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leadPet", _local_2, _arg_1));
            };
        }

        public function updatePoint():void
        {
            point = _core.player.petPK;
        }

        private function set cdSec(_arg_1:int):void
        {
            var _local_2:Object = this._94490672cdSec;
            if (_local_2 !== _arg_1)
            {
                this._94490672cdSec = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cdSec", _local_2, _arg_1));
            };
        }

        private function set _haveTicket(_arg_1:Boolean):void
        {
            var _local_2:Object = this._42975283_haveTicket;
            if (_local_2 !== _arg_1)
            {
                this._42975283_haveTicket = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_haveTicket", _local_2, _arg_1));
            };
        }

        public function onPetArenaSysMsg(_arg_1:Object, _arg_2:int):void
        {
            if (!ToolKit.isEmptyObject(_arg_1))
            {
                showSysMsg(_arg_1, _arg_2, ((sysMsgObject) || (!(visible))));
                sysMsgObject = _arg_1;
            }
            else
            {
                sysMsgObject = {};
            };
        }

        public function addArenaLog(_arg_1:String):void
        {
            _logStrArr.push((_arg_1 + "\n"));
            log.htmlText = _logStrArr.join();
        }

        private function _PetArenaActivityPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaActivityPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "rate";
            BindingManager.executeBindings(this, "_PetArenaActivityPanel_DataGridColumn4", _PetArenaActivityPanel_DataGridColumn4);
            return (_local_1);
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

        [Bindable(event="propertyChange")]
        public function get maxCombo():BasicTxtButton
        {
            return (this._382098058maxCombo);
        }

        private function _PetArenaActivityPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererButton;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get curRank():BasicTxtButton
        {
            return (this._1125982860curRank);
        }

        [Bindable(event="propertyChange")]
        public function get weekPet():BasicTxtButton
        {
            return (this._1226843275weekPet);
        }

        [Bindable(event="propertyChange")]
        internal function get leadPetId():String
        {
            return (this._1127061662leadPetId);
        }

        private function logObjToString(_arg_1:Object):String
        {
            var _local_3:Number;
            var _local_4:String;
            var _local_2:* = "";
            if (_arg_1.guest)
            {
                _local_3 = _arg_1.h_cid;
                _local_4 = _arg_1.h_name;
                if (((_arg_1.roll) || (_arg_1.roll == 0)))
                {
                    if (_arg_1.result == GamePredef.BATTLE_WIN)
                    {
                        _local_2 = Language.PET_ARENA_U[34];
                        if (_arg_1.rank)
                        {
                            _local_2 = (_local_2 + Language.PET_ARENA_U[38].replace("{rank}", ToolKit.add(_arg_1.rank, 1)));
                        };
                    }
                    else
                    {
                        _local_2 = Language.PET_ARENA_U[35];
                    };
                    _local_2 = _local_2.replace("{roll}", _arg_1.roll);
                }
                else
                {
                    if (_arg_1.result == GamePredef.BATTLE_WIN)
                    {
                        _local_2 = Language.PET_ARENA_U[32];
                        if (_arg_1.rank)
                        {
                            _local_2 = (_local_2 + Language.PET_ARENA_U[38].replace("{rank}", ToolKit.add(_arg_1.rank, 1)));
                        };
                    }
                    else
                    {
                        _local_2 = Language.PET_ARENA_U[33];
                    };
                };
            }
            else
            {
                _local_3 = _arg_1.g_cid;
                _local_4 = _arg_1.g_name;
                if (_arg_1.roll)
                {
                    if (_arg_1.result == GamePredef.BATTLE_WIN)
                    {
                        _local_2 = Language.PET_ARENA_U[26];
                    }
                    else
                    {
                        _local_2 = Language.PET_ARENA_U[28];
                    };
                    _local_2 = _local_2.replace("{roll}", _arg_1.roll);
                }
                else
                {
                    if (_arg_1.result == GamePredef.BATTLE_WIN)
                    {
                        _local_2 = Language.PET_ARENA_U[18];
                    }
                    else
                    {
                        _local_2 = Language.PET_ARENA_U[27];
                    };
                };
                if (_core.MC_BIRTH_FLAG[102])
                {
                    _local_2 = _local_2.replace("{num}", Math.ceil((_arg_1.pnt * _core.MC_BIRTH_FLAG[102])));
                }
                else
                {
                    _local_2 = _local_2.replace("{num}", _arg_1.pnt);
                };
            };
            var _local_5:String = TextUtil.decode((((("[@PID|" + _local_3) + "|") + _local_4) + "|0|0|0]"));
            _local_2 = _local_2.replace("{enemy}", _local_5);
            if (_arg_1.bid)
            {
                _local_2 = (_local_2 + Language.PETFIGHT_PANEL_U[11].replace("{bid}", _arg_1.bid));
            };
            return (_local_2);
        }

        private function showApplyPage():void
        {
            if ((((!(petArenaAct)) || (!(petArenaAct.actinfo))) || (new Date().getTime() > petArenaAct.actinfo.endTime)))
            {
                _core.sysMidNote(Language.PET_ARENA_U[57]);
                return;
            };
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_PETFIGHT_CONF_ACTIVITY);
            _local_1.show();
            _local_1.petCrossConf = {
                "f":true,
                "t":_haveTicket
            };
        }

        private function onTimer(_arg_1:TimerEvent):void
        {
            cdSec--;
            if (cdSec == 0)
            {
                resetTimer();
            };
        }

        private function onValueCommit(_arg_1:Event):void
        {
            var _local_2:LinkTextArea = (_arg_1.target as LinkTextArea);
            _local_2.verticalScrollPosition = _local_2.maxVerticalScrollPosition;
        }

        public function set fightNum(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._874983082fightNum;
            if (_local_2 !== _arg_1)
            {
                this._874983082fightNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fightNum", _local_2, _arg_1));
            };
        }

        private function awardIconInit():void
        {
            var _local_1:int = 2;
            while (_local_1 < 5)
            {
                this[("award" + _local_1)].setStyleName(_local_1);
                this[("award" + _local_1)].type = -1;
                _local_1++;
            };
        }

        public function get first():Boolean
        {
            return (_firstTimeFlag);
        }

        private function showEnemyLater(_arg_1:FlexEvent):void
        {
            this.removeEventListener(FlexEvent.CREATION_COMPLETE, showEnemyLater);
            onGetEnemies(_enemy_data);
            _enemy_data = null;
        }

        public function set arenaSysMsg(_arg_1:TextArea):void
        {
            var _local_2:Object = this._187011237arenaSysMsg;
            if (_local_2 !== _arg_1)
            {
                this._187011237arenaSysMsg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "arenaSysMsg", _local_2, _arg_1));
            };
        }

        public function addArenaNum(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.f)))
            {
                _selfData.max = _arg_1.max;
            }
            else
            {
                if (_arg_1.max)
                {
                    _selfData.max = _arg_1.max;
                };
            };
            refreshCharInfo();
        }

        [Bindable(event="propertyChange")]
        public function get h1():HBox
        {
            return (this._3273h1);
        }

        private function _PetArenaActivityPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaActivityPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 120;
            BindingManager.executeBindings(this, "_PetArenaActivityPanel_DataGridColumn3", _PetArenaActivityPanel_DataGridColumn3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get cdTime():BasicTxtButton
        {
            return (this._1365722418cdTime);
        }

        public function ___PetArenaActivityPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            getFightAward();
        }

        private function showSysMsg(_arg_1:Object, _arg_2:int, _arg_3:Boolean):void
        {
            var _local_6:String;
            var _local_7:String;
            var _local_8:String;
            var _local_9:String;
            var _local_4:int = _arg_1.id;
            var _local_5:Array = _arg_1.data;
            if (_local_5[0] == 0)
            {
                _local_7 = _local_5[2];
                if (_local_7.length > 14)
                {
                    _local_7 = (_local_7.substr(0, 11) + "...");
                };
                _local_8 = TextUtil.decode((((("[@PID|" + _local_5[1]) + "|") + _local_7) + "|0|0|0]"));
                _local_7 = _local_5[4];
                if (_local_7.length > 14)
                {
                    _local_7 = (_local_7.substr(0, 11) + "...");
                };
                _local_9 = TextUtil.decode((((("[@PID|" + _local_5[3]) + "|") + _local_7) + "|0|0|0]"));
                _local_6 = Language.PET_ARENA_U[50].replace("{att}", _local_8).replace("{def}", _local_9).replace("{num}", (_local_5[5] - -1));
            }
            else
            {
                if (_local_5[0] == 1)
                {
                    _local_7 = _local_5[2];
                    if (_local_7.length > 16)
                    {
                        _local_7 = (_local_7.substr(0, 13) + "...");
                    };
                    _local_8 = TextUtil.decode((((("[@PID|" + _local_5[1]) + "|") + _local_7) + "|0|0|0]"));
                    _local_6 = Language.PET_ARENA_U[51].replace("{name}", _local_8).replace("{num}", _local_5[3]);
                }
                else
                {
                    if (_local_5[0] == 2)
                    {
                        _local_7 = _local_5[2];
                        if (_local_7.length > 16)
                        {
                            _local_7 = (_local_7.substr(0, 13) + "...");
                        };
                        _local_8 = TextUtil.decode((((("[@PID|" + _local_5[1]) + "|") + _local_7) + "|0|0|0]"));
                        _local_6 = Language.PET_ARENA_U[54].replace("{name}", _local_8).replace("{num}", _local_5[3]);
                    };
                };
            };
            if (((initialized) && (_selfData.rid == _arg_2)))
            {
                arenaSysMsg.htmlText = _local_6;
                arenaSysMsg.visible = true;
            };
            if (_arg_3)
            {
                _core.sysMidMsg(((((Language.PET_ARENA_U[67] + " ") + rankGroupStr[_arg_2]) + Language.PET_ARENA_U[55]) + _local_6));
            };
        }

        public function onGetArenaLog(data:Object):void
        {
            var i:String;
            var func:Function;
            for (i in data)
            {
                _logStrArr.push((logObjToString(data[i]) + "\n"));
            };
            if (initialized)
            {
                log.htmlText = _logStrArr.join();
            }
            else
            {
                func = function (_arg_1:FlexEvent):void
                {
                    log.htmlText = _logStrArr.join();
                    removeEventListener(FlexEvent.CREATION_COMPLETE, func);
                };
                this.addEventListener(FlexEvent.CREATION_COMPLETE, func);
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardStr():TextArea
        {
            return (this._1621962092awardStr);
        }

        [Bindable(event="propertyChange")]
        public function get dgCvs():Canvas
        {
            return (this._95488733dgCvs);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:int;
            var _local_3:Number;
            var _local_4:Number;
            if (_arg_1)
            {
                if (_firstTimeFlag)
                {
                    _firstTimeFlag = false;
                    _lastRefreshTime = new Date().getTime();
                    if (!sysMsgObject)
                    {
                        _local_3 = _core.player.level;
                        if (_local_3 >= 155)
                        {
                            _local_2 = 5;
                        }
                        else
                        {
                            if (_local_3 >= 135)
                            {
                                _local_2 = 4;
                            }
                            else
                            {
                                if (_local_3 >= 115)
                                {
                                    _local_2 = 3;
                                }
                                else
                                {
                                    if (_local_3 >= 95)
                                    {
                                        _local_2 = 2;
                                    }
                                    else
                                    {
                                        if (_local_3 >= 75)
                                        {
                                            _local_2 = 1;
                                        }
                                        else
                                        {
                                            _local_2 = 0;
                                        };
                                    };
                                };
                            };
                        };
                        _core.remote.call("getPetArenaSysMsgActivity", null, _local_2, -1);
                    };
                }
                else
                {
                    if (enemiesList.length < 10)
                    {
                        _local_4 = new Date().getTime();
                        if (_local_4 > (_lastRefreshTime + refreshInterval))
                        {
                            _core.remote.call("getPetArenaDataActivity", null, false);
                            _lastRefreshTime = new Date().getTime();
                        };
                    };
                };
            };
            super.visible = _arg_1;
            if (_arg_1)
            {
                refreshCharInfo();
            };
        }

        private function _PetArenaActivityPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[67];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PetArenaActivityPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (maxCombo);
            }, function (_arg_1:Object):void
            {
                _PetArenaActivityPanel_SetProperty1.target = _arg_1;
            }, "_PetArenaActivityPanel_SetProperty1.target");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (cdTime);
            }, function (_arg_1:Object):void
            {
                _PetArenaActivityPanel_SetProperty2.target = _arg_1;
            }, "_PetArenaActivityPanel_SetProperty2.target");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (fightNum);
            }, function (_arg_1:Object):void
            {
                _PetArenaActivityPanel_SetProperty3.target = _arg_1;
            }, "_PetArenaActivityPanel_SetProperty3.target");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (curRank);
            }, function (_arg_1:Object):void
            {
                _PetArenaActivityPanel_SetProperty4.target = _arg_1;
            }, "_PetArenaActivityPanel_SetProperty4.target");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = petType;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                weekPet.label = _arg_1;
            }, "weekPet.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = leadPetId;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                leadPet.label = _arg_1;
            }, "leadPet.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_Label1.text = _arg_1;
            }, "_PetArenaActivityPanel_Label1.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[5].replace("{num}", _selfData.today).replace("{max}", _selfData.max);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fightNum.label = _arg_1;
            }, "fightNum.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_BasicGlowButton1.label = _arg_1;
            }, "_PetArenaActivityPanel_BasicGlowButton1.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_Label2.text = _arg_1;
            }, "_PetArenaActivityPanel_Label2.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = getTimeStr(cdSec);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cdTime.label = _arg_1;
            }, "cdTime.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_BasicGlowButton2.label = _arg_1;
            }, "_PetArenaActivityPanel_BasicGlowButton2.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_Label3.text = _arg_1;
            }, "_PetArenaActivityPanel_Label3.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_Label4.text = _arg_1;
            }, "_PetArenaActivityPanel_Label4.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_BasicGlowButton3.label = _arg_1;
            }, "_PetArenaActivityPanel_BasicGlowButton3.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[17].replace("{num}", ((ToolKit.isSmallOrEqual(_selfData.rank, 0)) ? Language.PET_ARENA_U[53] : _selfData.rank));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curRank.label = _arg_1;
            }, "curRank.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_BasicGlowButton4.label = _arg_1;
            }, "_PetArenaActivityPanel_BasicGlowButton4.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_Label5.text = _arg_1;
            }, "_PetArenaActivityPanel_Label5.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.petPK;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_BasicTxtButton8.label = _arg_1;
            }, "_PetArenaActivityPanel_BasicTxtButton8.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_BasicGlowButton5.label = _arg_1;
            }, "_PetArenaActivityPanel_BasicGlowButton5.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardStr.text = _arg_1;
            }, "awardStr.text");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((_haveTicket) ? Language.PET_ARENA_U[41] : Language.PET_ARENA_U[1]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                applyBtn.label = _arg_1;
            }, "applyBtn.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_BasicGlowButton7.label = _arg_1;
            }, "_PetArenaActivityPanel_BasicGlowButton7.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                autoPlay.label = _arg_1;
            }, "autoPlay.label");
            result[24] = binding;
            binding = new Binding(this, function ():Object
            {
                return (enemiesList);
            }, function (_arg_1:Object):void
            {
                enemyDataGrid.dataProvider = _arg_1;
            }, "enemyDataGrid.dataProvider");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_DataGridColumn1.headerText = _arg_1;
            }, "_PetArenaActivityPanel_DataGridColumn1.headerText");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_DataGridColumn2.headerText = _arg_1;
            }, "_PetArenaActivityPanel_DataGridColumn2.headerText");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_DataGridColumn3.headerText = _arg_1;
            }, "_PetArenaActivityPanel_DataGridColumn3.headerText");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_DataGridColumn4.headerText = _arg_1;
            }, "_PetArenaActivityPanel_DataGridColumn4.headerText");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaActivityPanel_DataGridColumn5.headerText = _arg_1;
            }, "_PetArenaActivityPanel_DataGridColumn5.headerText");
            result[30] = binding;
            return (result);
        }

        public function set award3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1405038218award3;
            if (_local_2 !== _arg_1)
            {
                this._1405038218award3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award3", _local_2, _arg_1));
            };
        }

        public function set award4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1405038217award4;
            if (_local_2 !== _arg_1)
            {
                this._1405038217award4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award4", _local_2, _arg_1));
            };
        }

        public function set award2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1405038219award2;
            if (_local_2 !== _arg_1)
            {
                this._1405038219award2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award2", _local_2, _arg_1));
            };
        }

        public function onPetArenaRank(_arg_1:Object):void
        {
        }

        [Bindable(event="propertyChange")]
        internal function get petType():String
        {
            return (this._677507847petType);
        }

        private function _PetArenaActivityPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaActivityPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "tName";
            _local_1.width = 120;
            BindingManager.executeBindings(this, "_PetArenaActivityPanel_DataGridColumn2", _PetArenaActivityPanel_DataGridColumn2);
            return (_local_1);
        }

        public function set autoPlay(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1438608771autoPlay;
            if (_local_2 !== _arg_1)
            {
                this._1438608771autoPlay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoPlay", _local_2, _arg_1));
            };
        }

        public function set maxCombo(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._382098058maxCombo;
            if (_local_2 !== _arg_1)
            {
                this._382098058maxCombo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxCombo", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            log.addEventListener(FlexEvent.VALUE_COMMIT, onValueCommit);
            log.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            if (!ToolKit.isEmptyObject(sysMsgObject))
            {
                showSysMsg(sysMsgObject, _selfData.rid, false);
            };
        }

        private function _PetArenaActivityPanel_SetProperty4_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetArenaActivityPanel_SetProperty4 = _local_1;
            _local_1.name = "width";
            _local_1.value = 167;
            BindingManager.executeBindings(this, "_PetArenaActivityPanel_SetProperty4", _PetArenaActivityPanel_SetProperty4);
            return (_local_1);
        }

        private function petArenaFighting(_arg_1:Object):void
        {
            if (_selfData.today >= _selfData.max)
            {
                _core.sysMidNote(Language.PET_ARENA_U[29]);
            }
            else
            {
                if (cdSec > 0)
                {
                    _core.sysMidNote(Language.PET_ARENA_U[30]);
                }
                else
                {
                    _core.remote.call("petArenaFightActivity", null, _arg_1.cid, [(_arg_1.rank - 1)]);
                };
            };
        }

        public function ___PetArenaActivityPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function initLang():void
        {
            var _local_1:* = (((petArenaAct) && (petArenaAct.actinfo)) ? typeList[(petArenaAct.actinfo.petType - 1)] : Language.PET_ARENA_U[68]);
            petType = (Language.PET_ARENA_U[58] + _local_1);
            var _local_2:* = (((petArenaAct) && (petArenaAct.actinfo)) ? GameData.d[GamePredef.TBL_CREATURE][petArenaAct.actinfo.leadPetId[0]].name : Language.PET_ARENA_U[68]);
            leadPetId = (Language.PET_ARENA_U[59] + _local_2);
        }

        private function refreshCharInfo():void
        {
            var _local_1:int;
            var _local_6:Number;
            var _local_7:*;
            fightNum.label = Language.PET_ARENA_U[5].replace("{num}", _selfData.today).replace("{max}", _selfData.max);
            curRank.label = Language.PET_ARENA_U[17].replace("{num}", ((_selfData.rank <= 0) ? Language.PET_ARENA_U[53] : _selfData.rank));
            maxCombo.text = _selfData.maxCombo;
            if (((_selfData) && (_selfData.lrank >= 0)))
            {
                lastRank.text = String((_selfData.lrank - -1));
            }
            else
            {
                lastRank.text = Language.PET_ARENA_U[71];
            };
            _local_1 = (rankAwardCoef[_selfData.rid] * PET_ARENA_RATIO_ACT);
            if (!_local_1)
            {
                _local_1 = (rankAwardCoef[0] * PET_ARENA_RATIO_ACT);
            };
            var _local_2:String = Language.AI_CONF_PANEL_U[28];
            var _local_3:String = Language.AI_CONF_PANEL_U[27];
            var _local_4:String = Language.AI_CONF_PANEL_U[26];
            var _local_5:* = 0;
            while (_local_5 <= 5)
            {
                _local_1 = rankAwardCoef[_local_5];
                _local_6 = _local_1;
                _local_6 = Math.round((_local_1 * Math.pow(1.02, 100)));
                _local_7 = Math.round((_local_1 * Math.pow(1.02, 149)));
                _local_2 = (_local_2 + lang[_local_5].replace("{min}", _local_6).replace("{max}", _local_7));
                _local_6 = Math.round((_local_1 * Math.pow(1.02, 150)));
                _local_7 = Math.round((_local_1 * Math.pow(1.02, 189)));
                _local_3 = (_local_3 + lang[_local_5].replace("{min}", _local_6).replace("{max}", _local_7));
                _local_6 = Math.round((_local_1 * Math.pow(1.02, 190)));
                _local_7 = Math.round((_local_1 * Math.pow(1.02, 199)));
                _local_4 = (_local_4 + lang[_local_5].replace("{min}", _local_6).replace("{max}", _local_7));
                _local_5++;
            };
            award2.toolTip = _local_2;
            award3.toolTip = _local_3;
            award4.toolTip = _local_4;
        }

        public function set weekPet(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1226843275weekPet;
            if (_local_2 !== _arg_1)
            {
                this._1226843275weekPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "weekPet", _local_2, _arg_1));
            };
        }

        public function set awardStr(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1621962092awardStr;
            if (_local_2 !== _arg_1)
            {
                this._1621962092awardStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardStr", _local_2, _arg_1));
            };
        }

        private function addFightNum():void
        {
            var num:Number;
            var alertFunc:Function;
            if ((((!(petArenaAct)) || (!(petArenaAct.actinfo))) || (new Date().getTime() > petArenaAct.actinfo.endTime)))
            {
                addArenaLog(Language.PET_ARENA_U[57]);
                return;
            };
            if (!_haveTicket)
            {
                addArenaLog(Language.PET_ARENA_U[40]);
                return;
            };
            if (_selfData.max < 30)
            {
                num = ((_selfData.max - 19) * 5);
                alertFunc = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("addPetFightNumActivity", null, _selfData.max);
                    };
                };
                Alert.show(Language.PET_ARENA_U[37].replace("{num}", num), "", (Alert.YES | Alert.NO), null, alertFunc);
            }
            else
            {
                addArenaLog(Language.PET_ARENA_U[43]);
            };
        }

        public function set curRank(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1125982860curRank;
            if (_local_2 !== _arg_1)
            {
                this._1125982860curRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curRank", _local_2, _arg_1));
            };
        }

        private function resetTimer():void
        {
            if (_timer)
            {
                _timer.stop();
                _timer.removeEventListener(TimerEvent.TIMER, onTimer);
                _timer = null;
            };
            if (cdSec > 0)
            {
                _timer = new Timer(1000, cdSec);
                _timer.addEventListener(TimerEvent.TIMER, onTimer);
                _timer.start();
            };
        }

        internal function set leadPetId(_arg_1:String):void
        {
            var _local_2:Object = this._1127061662leadPetId;
            if (_local_2 !== _arg_1)
            {
                this._1127061662leadPetId = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leadPetId", _local_2, _arg_1));
            };
        }

        private function _PetArenaActivityPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaActivityPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "rank";
            _local_1.width = 40;
            BindingManager.executeBindings(this, "_PetArenaActivityPanel_DataGridColumn1", _PetArenaActivityPanel_DataGridColumn1);
            return (_local_1);
        }

        public function onGetEnemies(_arg_1:Object):void
        {
            var _local_3:String;
            var _local_4:Sort;
            var _local_5:String;
            var _local_6:Object;
            if (currentState != "nor")
            {
                currentState = "nor";
            };
            if (!initialized)
            {
                _enemy_data = _arg_1;
                for (_local_5 in _arg_1)
                {
                    if (((_arg_1[_local_5]) && (_arg_1[_local_5].cid == _core.player.id)))
                    {
                        _selfData = _arg_1[_local_5];
                        break;
                    };
                };
                this.addEventListener(FlexEvent.CREATION_COMPLETE, showEnemyLater);
                this.show();
                return;
            };
            if (_firstTimeFlag)
            {
                this.show();
            };
            if (!_haveTicket)
            {
                _haveTicket = true;
                applyBtn.label = Language.PET_ARENA_U[41];
            };
            var _local_2:ArrayCollection = new ArrayCollection();
            for (_local_3 in _arg_1)
            {
                _local_6 = _arg_1[_local_3];
                _local_6.rank = ToolKit.add(_local_6.rank, 1);
                if (Number(_local_6.cid) == _core.player.id)
                {
                    _selfData = _local_6;
                    _local_6.rate = ((Number(_local_6.total) == 0) ? "0" : (Math.ceil(((100 * _local_6.win) / _local_6.total)).toString() + "%"));
                    _local_2.addItem(_local_6);
                    if (_local_6.hasOwnProperty("cd"))
                    {
                        cdSec = Math.floor((((_local_6.cd - new Date().getTime()) - _core.timeLag) / 1000));
                        if (cdSec < 0)
                        {
                            cdSec = 0;
                            _selfData.cd = 0;
                        }
                        else
                        {
                            if (cdSec > 600)
                            {
                                _selfData.cd = (_selfData.cd - (cdSec - 600));
                                cdSec = 600;
                            };
                        };
                        resetTimer();
                    };
                    refreshCharInfo();
                }
                else
                {
                    _local_6.label = Language.PET_ARENA_U[25];
                    _local_6.onClick = petArenaFighting;
                    _local_6.rate = ((Number(_local_6.total) == 0) ? "0" : (Math.ceil(((100 * _local_6.win) / _local_6.total)).toString() + "%"));
                    _local_2.addItem(_local_6);
                };
            };
            _local_4 = new Sort();
            _local_4.fields = [new SortField("rank", false, false, true)];
            _local_2.sort = _local_4;
            _local_2.refresh();
            enemiesList = _local_2;
        }

        public function ___PetArenaActivityPanel_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            _core.remote.call("openShopDirect", null, 115);
        }

        public function reset():void
        {
            _firstTimeFlag = true;
            if (log)
            {
                log.htmlText = "";
            };
            if (arenaSysMsg)
            {
                arenaSysMsg.htmlText = "";
            };
            _logStrArr.clear();
            _selfData = {
                "rank":0,
                "cd":0,
                "today":0,
                "max":20,
                "pnt":0
            };
            if (initialized)
            {
                refreshCharInfo();
            };
            cdSec = 0;
            resetTimer();
            enemiesList = new ArrayCollection();
            _haveTicket = false;
            sysMsgObject = null;
        }

        [Bindable(event="propertyChange")]
        public function get log():LinkTextArea
        {
            return (this._107332log);
        }

        private function _PetArenaActivityPanel_SetProperty3_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetArenaActivityPanel_SetProperty3 = _local_1;
            _local_1.name = "width";
            _local_1.value = 52;
            BindingManager.executeBindings(this, "_PetArenaActivityPanel_SetProperty3", _PetArenaActivityPanel_SetProperty3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get arenaSysMsg():TextArea
        {
            return (this._187011237arenaSysMsg);
        }

        private function _PetArenaActivityPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_ARENA_U[67];
            _local_1 = maxCombo;
            _local_1 = cdTime;
            _local_1 = fightNum;
            _local_1 = curRank;
            _local_1 = petType;
            _local_1 = leadPetId;
            _local_1 = Language.PET_ARENA_U[4];
            _local_1 = Language.PET_ARENA_U[5].replace("{num}", _selfData.today).replace("{max}", _selfData.max);
            _local_1 = Language.PET_ARENA_U[6];
            _local_1 = Language.PET_ARENA_U[7];
            _local_1 = getTimeStr(cdSec);
            _local_1 = Language.PET_ARENA_U[8];
            _local_1 = Language.PET_ARENA_U[45];
            _local_1 = Language.PET_ARENA_U[46];
            _local_1 = Language.PET_ARENA_U[16];
            _local_1 = Language.PET_ARENA_U[17].replace("{num}", ((ToolKit.isSmallOrEqual(_selfData.rank, 0)) ? Language.PET_ARENA_U[53] : _selfData.rank));
            _local_1 = Language.PET_ARENA_U[47];
            _local_1 = Language.PET_ARENA_U[31];
            _local_1 = _core.player.petPK;
            _local_1 = Language.PET_ARENA_U[52];
            _local_1 = Language.PET_ARENA_U[48];
            _local_1 = ((_haveTicket) ? Language.PET_ARENA_U[41] : Language.PET_ARENA_U[1]);
            _local_1 = Language.PET_ARENA_U[3];
            _local_1 = Language.PETFIGHT_PANEL_U[30];
            _local_1 = enemiesList;
            _local_1 = Language.PET_ARENA_U[20];
            _local_1 = Language.PET_ARENA_U[21];
            _local_1 = Language.PET_ARENA_U[22];
            _local_1 = Language.PET_ARENA_U[24];
            _local_1 = Language.PET_ARENA_U[25];
        }

        public function set enemyDataGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1403636296enemyDataGrid;
            if (_local_2 !== _arg_1)
            {
                this._1403636296enemyDataGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enemyDataGrid", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get award2():ItemSlot
        {
            return (this._1405038219award2);
        }

        [Bindable(event="propertyChange")]
        public function get award3():ItemSlot
        {
            return (this._1405038218award3);
        }

        [Bindable(event="propertyChange")]
        public function get award4():ItemSlot
        {
            return (this._1405038217award4);
        }

        [Bindable(event="propertyChange")]
        public function get fightNum():BasicTxtButton
        {
            return (this._874983082fightNum);
        }

        public function ___PetArenaActivityPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            resetCD();
        }

        [Bindable(event="propertyChange")]
        public function get autoPlay():CheckBox
        {
            return (this._1438608771autoPlay);
        }

        override public function initialize():void
        {
            var target:PetArenaActivityPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetArenaActivityPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetArenaActivityPanelWatcherSetupUtil");
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

        public function showState(_arg_1:String):void
        {
            currentState = _arg_1;
            super.show();
        }

        public function set h1(_arg_1:HBox):void
        {
            var _local_2:Object = this._3273h1;
            if (_local_2 !== _arg_1)
            {
                this._3273h1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "h1", _local_2, _arg_1));
            };
        }

        public function set cdTime(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1365722418cdTime;
            if (_local_2 !== _arg_1)
            {
                this._1365722418cdTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cdTime", _local_2, _arg_1));
            };
        }

        private function _PetArenaActivityPanel_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetArenaActivityPanel_SetProperty2 = _local_1;
            _local_1.name = "width";
            _local_1.value = 52;
            BindingManager.executeBindings(this, "_PetArenaActivityPanel_SetProperty2", _PetArenaActivityPanel_SetProperty2);
            return (_local_1);
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

        private function openArenaHelp():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_HELP);
            if (_local_1)
            {
                _local_1.selectPetArena();
            };
            _local_1.show();
        }

        private function dataGridEffect():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get enemyDataGrid():DataGrid
        {
            return (this._1403636296enemyDataGrid);
        }

        private function set enemiesList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._722894876enemiesList;
            if (_local_2 !== _arg_1)
            {
                this._722894876enemiesList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enemiesList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cvs1():Canvas
        {
            return (this._3066321cvs1);
        }

        [Bindable(event="propertyChange")]
        public function get cvs2():Canvas
        {
            return (this._3066322cvs2);
        }

        private function _PetArenaActivityPanel_SetProperty1_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _PetArenaActivityPanel_SetProperty1 = _local_1;
            _local_1.name = "width";
            _local_1.value = 58;
            BindingManager.executeBindings(this, "_PetArenaActivityPanel_SetProperty1", _PetArenaActivityPanel_SetProperty1);
            return (_local_1);
        }

        private function _PetArenaActivityPanel_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "nor";
            return (_local_1);
        }

        public function openPanel(_arg_1:Object):void
        {
            _core.player.petArenaAct = _arg_1;
            point = _core.player.petPK;
            petArenaAct = _core.player.petArenaAct;
            initLang();
        }

        [Bindable(event="propertyChange")]
        private function get enemiesList():ArrayCollection
        {
            return (this._722894876enemiesList);
        }

        public function set dgCvs(_arg_1:Canvas):void
        {
            var _local_2:Object = this._95488733dgCvs;
            if (_local_2 !== _arg_1)
            {
                this._95488733dgCvs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dgCvs", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cvs3():Canvas
        {
            return (this._3066323cvs3);
        }

        private function getTimeStr(_arg_1:int):String
        {
            var _local_2:int = int(Math.floor((_arg_1 / 60)));
            var _local_3:int = (_arg_1 % 60);
            var _local_4:* = (_local_2.toString() + ":");
            if (_local_2 < 10)
            {
                _local_4 = ("0" + _local_4);
            };
            if (_local_3 < 10)
            {
                _local_4 = (_local_4 + "0");
            };
            _local_4 = (_local_4 + _local_3.toString());
            return (_local_4);
        }

        public function ___PetArenaActivityPanel_BasicGlowButton7_click(_arg_1:MouseEvent):void
        {
            openArenaHelp();
        }

        internal function set petType(_arg_1:String):void
        {
            var _local_2:Object = this._677507847petType;
            if (_local_2 !== _arg_1)
            {
                this._677507847petType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petType", _local_2, _arg_1));
            };
        }

        public function __applyBtn_click(_arg_1:MouseEvent):void
        {
            showApplyPage();
        }

        private function resetCD():void
        {
            var num:Number;
            if ((((!(petArenaAct)) || (!(petArenaAct.actinfo))) || (new Date().getTime() > petArenaAct.actinfo.endTime)))
            {
                addArenaLog(Language.PET_ARENA_U[57]);
                return;
            };
            if (!_haveTicket)
            {
                addArenaLog(Language.PET_ARENA_U[40]);
                return;
            };
            var alertFunc:Function = function (e:CloseEvent):void
            {
                var func:Function;
                if (e.detail == Alert.YES)
                {
                    func = function (_arg_1:Boolean):void
                    {
                        if (_arg_1)
                        {
                            _selfData.cd = 0;
                            cdSec = 0;
                            resetTimer();
                        };
                    };
                    _core.remote.call("clearArenaCDActivity", new Responder(func));
                };
            };
            if (cdSec > 0)
            {
                num = Math.ceil((cdSec / 30));
                Alert.show(Language.PET_ARENA_U[36].replace("{num}", num), "", (Alert.YES | Alert.NO), null, alertFunc);
            }
            else
            {
                addArenaLog(Language.PET_ARENA_U[39]);
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

