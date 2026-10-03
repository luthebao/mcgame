// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetAdvancedPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.IWatcherSetupUtil;
    import mx.collections.ArrayCollection;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.ItemSlotPet;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.PageableDataGrid;
    import com.qeedoo.ui.view.comp.ItemSlotPetFunc;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.game.event.GameDataEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.view.comp.RendererItemSlot;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.binding.BindingManager;
    import com.qeedoo.ui.event.GameEvent;
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

    public class PetAdvancedPanel extends DragableCanvas implements IBindingClient 
    {

        private static const MAX_ADVANCED_JOIN:Object = GamePredef.MAX_ADVANCED_JOIN;
        public static const MIN_ADVANCED_JOIN:int = GamePredef.MIN_ADVANCED_JOIN;//4
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public const FILTER_SHADOW_TEXT2:*;
        private const NUM_PER_PAGE:int = 8;
        public const FILTER_SHADOW_TEXT:*;
        private var pageOffset:int = -1;
        private var _petList:ArrayCollection;
        private var _900864954allChkBox:CheckBox;
        private var mainColor:int = -1;
        private var probability:Number = 0;
        private var _1034217724joinButton:BasicGlowButton;
        public var _PetAdvancedPanel_IntroText1:IntroText;
        private var itemNeedNum:uint = 0;
        private var _831007910mainPet:ItemSlotPet;
        private var _1053257947countLabel:Label;
        private var _1080482137petItemNumTip:Label;
        private var _1007683640pTitle:BasicTitleCanvas;
        public var _PetAdvancedPanel_DataGridColumn2:DataGridColumn;
        public var _PetAdvancedPanel_DataGridColumn3:DataGridColumn;
        private var _607339634pageSelector:PageSelector;
        private var maxPets:int = 0;
        public var _PetAdvancedPanel_BasicTxtButton1:BasicTxtButton;
        public var _PetAdvancedPanel_BasicTxtButton2:BasicTxtButton;
        public var _PetAdvancedPanel_BasicTxtButton3:BasicTxtButton;
        public var _PetAdvancedPanel_BasicTxtButton4:BasicTxtButton;
        public var _PetAdvancedPanel_BasicTxtButton5:BasicTxtButton;
        private var _3723199probabilityLabel:Label;
        private var _2022235378assistantDataGrid:PageableDataGrid;
        private var _677840686petItem:ItemSlotPetFunc;
        private var selectedNum:int = 0;
        private var probabilityArr:Object = null;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":353,
                    "creationPolicy":"all",
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"pTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "14";
                            this.top = "40";
                            this.bottom = "15";
                            this.right = "14";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetAdvancedPanel_BasicTxtButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "25";
                                        this.top = "20";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetAdvancedPanel_BasicTxtButton2",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "85";
                                        this.top = "20";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotPet,
                                    "id":"mainPet",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "25";
                                        this.top = "41";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"movable":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlotPetFunc,
                                    "id":"petItem",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "95";
                                        this.top = "41";
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"movable":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"petItemNumTip",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "63";
                                        this.top = "77";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":18,
                                            "styleName":"DescriptionText"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"joinButton",
                                    "events":{"click":"__joinButton_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "53";
                                        this.top = "100";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetAdvancedPanel_BasicTxtButton3",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "175";
                                        this.top = "43";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetAdvancedPanel_BasicTxtButton4",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "175";
                                        this.top = "73";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetAdvancedPanel_BasicTxtButton5",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "175";
                                        this.top = "103";
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"probabilityLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "245";
                                        this.top = "43";
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"countLabel",
                                    "events":{"click":"__countLabel_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "245";
                                        this.top = "73";
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"allChkBox",
                                    "events":{"click":"__allChkBox_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "245";
                                        this.top = "103";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"_PetAdvancedPanel_IntroText1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":280,
                                            "height":140
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "295";
                                        this.right = "10";
                                        this.top = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":PageableDataGrid,
                                                "id":"assistantDataGrid",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalAlign = "middle";
                                                    this.alternatingItemColors = [0xFFFFFF, 0xFFFFFF];
                                                    this.useRollOver = false;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "sortableColumns":false,
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "columns":[_PetAdvancedPanel_DataGridColumn1_c(), _PetAdvancedPanel_DataGridColumn2_i(), _PetAdvancedPanel_DataGridColumn3_i()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "5";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"onPageChanged":onPageChanged});
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetAdvancedPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 353;
            this.styleName = "StandardContent";
            this.creationPolicy = "all";
            this.addEventListener("creationComplete", ___PetAdvancedPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetAdvancedPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get joinButton():BasicGlowButton
        {
            return (this._1034217724joinButton);
        }

        [Bindable(event="propertyChange")]
        public function get assistantDataGrid():PageableDataGrid
        {
            return (this._2022235378assistantDataGrid);
        }

        private function _PetAdvancedPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "";
            _local_1.width = 26;
            _local_1.itemRenderer = _PetAdvancedPanel_ClassFactory1_c();
            return (_local_1);
        }

        private function _PetAdvancedPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PETADVANCEDPANEL_U[0];
            _local_1 = Language.PETADVANCEDPANEL_U[1];
            _local_1 = Language.PETADVANCEDPANEL_U[8];
            _local_1 = [GamePredef.ITEM_TYPE_PETFUNC_TYPE[8]];
            _local_1 = Language.PETADVANCEDPANEL_U[2];
            _local_1 = Language.PETADVANCEDPANEL_U[3];
            _local_1 = Language.PETADVANCEDPANEL_U[4];
            _local_1 = Language.PETADVANCEDPANEL_U[5];
            _local_1 = Language.PETADVANCEDPANEL_S[0];
            _local_1 = pageSelector;
            _local_1 = Language.PETADVANCEDPANEL_U[6];
            _local_1 = Language.PETADVANCEDPANEL_U[7];
        }

        public function set assistantDataGrid(_arg_1:PageableDataGrid):void
        {
            var _local_2:Object = this._2022235378assistantDataGrid;
            if (_local_2 !== _arg_1)
            {
                this._2022235378assistantDataGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "assistantDataGrid", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get countLabel():Label
        {
            return (this._1053257947countLabel);
        }

        private function _PetAdvancedPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = PetAdvancedPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
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

        [Bindable(event="propertyChange")]
        public function get allChkBox():CheckBox
        {
            return (this._900864954allChkBox);
        }

        private function updateState():void
        {
            if (selectedNum < MIN_ADVANCED_JOIN)
            {
                probabilityLabel.visible = false;
            }
            else
            {
                probability = probabilityArr[selectedNum];
                if (isNaN(probability))
                {
                    probability = 100;
                };
                probabilityLabel.visible = true;
                probabilityLabel.text = (probability.toString() + "%");
            };
            countLabel.text = ((("" + selectedNum) + "/") + maxPets);
            if (selectedNum > maxPets)
            {
                countLabel.setStyle("color", "red");
            }
            else
            {
                countLabel.setStyle("color", "white");
            };
            var _local_1:String = Language.PETADVANCEDPANEL_S[8];
            if (mainColor == 3)
            {
                itemNeedNum = (GamePredef.NUMBER_ITEM_ADVANCED_JOIN[mainColor] * Math.min(selectedNum, maxPets));
            }
            else
            {
                itemNeedNum = GamePredef.NUMBER_ITEM_ADVANCED_JOIN[mainColor];
            };
            _local_1 = _local_1.replace("{num}", itemNeedNum);
            petItemNumTip.text = _local_1;
            if (selectedNum == 0)
            {
                petItemNumTip.text = "";
            };
        }

        public function set mainPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._831007910mainPet;
            if (_local_2 !== _arg_1)
            {
                this._831007910mainPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainPet", _local_2, _arg_1));
            };
        }

        public function set petItemNumTip(_arg_1:Label):void
        {
            var _local_2:Object = this._1080482137petItemNumTip;
            if (_local_2 !== _arg_1)
            {
                this._1080482137petItemNumTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petItemNumTip", _local_2, _arg_1));
            };
        }

        private function dataLoaded(_arg_1:GameDataEvent):void
        {
            _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.index), dataLoaded);
            _core.view.getUI(ViewManager.PANEL_PETMANAGER).updateView(_arg_1.data.index);
            _core.view.getUI(ViewManager.PANEL_BAG).petInit();
        }

        private function allowAdvancedJoin():Boolean
        {
            var _local_1:int = _core.basic.colorByGrowRate(mainPet.slotData.growRate);
            var _local_2:Array = GamePredef.ALLOWED_ADVANCED_JOIN;
            var _local_3:Boolean;
            var _local_4:int;
            while (_local_4 < _local_2.length)
            {
                if (_local_1 == _local_2[_local_4])
                {
                    _local_3 = true;
                    break;
                };
                _local_4++;
            };
            return (_local_3);
        }

        public function petFresh():void
        {
            var _local_4:*;
            var _local_5:int;
            if (!mainPet.slotData)
            {
                return;
            };
            var _local_1:Object = _core.player.petList;
            mainColor = _core.basic.colorByGrowRate(mainPet.slotData.growRate);
            var _local_2:int = mainPet.slotData.tid;
            maxPets = MAX_ADVANCED_JOIN[mainColor];
            probabilityArr = GamePredef.ADVANCED_JOIN_PROBABILITY[mainColor];
            if (_core.MC_BIRTH_FLAG[ToolKit.minus(mainColor, 1)])
            {
                probabilityArr = ((GamePredef.MC_BIRTH_CONFIG[ToolKit.minus(mainColor, 1)]) ? GamePredef.MC_BIRTH_CONFIG[ToolKit.minus(mainColor, 1)] : GamePredef.ADVANCED_JOIN_PROBABILITY[mainColor]);
            };
            var _local_3:ArrayCollection = new ArrayCollection();
            if (_local_1)
            {
                for each (_local_4 in _local_1)
                {
                    if (_local_4)
                    {
                        _local_5 = _core.basic.colorByGrowRate(_local_4.growRate);
                        if (_local_5 == mainColor)
                        {
                            if (_local_2 == _local_4.tid)
                            {
                                if (mainPet.giid != _local_4.id)
                                {
                                    _local_3.addItem({
                                        "id":_local_4.id,
                                        "type":GamePredef.TBL_PET,
                                        "itemId":_local_4.id,
                                        "stackNum":1,
                                        "name":_local_4.petName,
                                        "colorValue":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_4.growRate)],
                                        "color":_core.basic.colorByGrowRate(_local_4.growRate),
                                        "petData":_local_4,
                                        "selected":false
                                    });
                                };
                            };
                        };
                    };
                };
            };
            _petList = _local_3;
            pageSelector.initPageSeletor(_petList.length, NUM_PER_PAGE);
            allChkBox.enabled = true;
        }

        public function set countLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1053257947countLabel;
            if (_local_2 !== _arg_1)
            {
                this._1053257947countLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "countLabel", _local_2, _arg_1));
            };
        }

        public function __joinButton_click(_arg_1:MouseEvent):void
        {
            advancedJoin();
        }

        private function _PetAdvancedPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemSlot;
            return (_local_1);
        }

        private function reset():void
        {
            selectedNum = 0;
            maxPets = 0;
            probability = 0;
            allChkBox.selected = false;
            allChkBox.enabled = false;
            probabilityLabel.text = "";
            countLabel.text = "";
            petItemNumTip.text = "";
            mainColor = -1;
        }

        private function onAllClick():void
        {
            var _local_1:*;
            for each (_local_1 in _petList)
            {
                if (_local_1)
                {
                    if (allChkBox.selected)
                    {
                        _local_1.selected = true;
                    }
                    else
                    {
                        _local_1.selected = false;
                    };
                };
            };
            if (allChkBox.selected)
            {
                selectedNum = _petList.length;
            }
            else
            {
                selectedNum = 0;
            };
            updateState();
            pageSelector.refreshPage();
        }

        public function __allChkBox_click(_arg_1:MouseEvent):void
        {
            onAllClick();
        }

        private function advancedJoin():void
        {
            var obj:Array;
            var pet:* = undefined;
            var str:String;
            var p:int;
            var j:* = undefined;
            var func:Function;
            if (!mainPet.slotData)
            {
                _core.sysMidNote(Language.PETADVANCEDPANEL_S[7]);
                return;
            };
            if (selectedNum < MIN_ADVANCED_JOIN)
            {
                _core.sysMidNote(Language.PETADVANCEDPANEL_S[4]);
                return;
            };
            if (selectedNum > maxPets)
            {
                _core.sysMidNote(Language.PETADVANCEDPANEL_S[5]);
                return;
            };
            var mainColor:int = _core.basic.colorByGrowRate(mainPet.slotData.growRate);
            if ((((!(petItem.slotData)) || (!(petItem.slotData.tid == 3014))) || (petItem.stackNum < itemNeedNum)))
            {
                str = Language.PETADVANCEDPANEL_S[8];
                str = str.replace("{num}", itemNeedNum);
                _core.sysMidNote(str);
                return;
            };
            var hasBinded:Boolean;
            if (mainPet.slotData.binded == 1)
            {
                hasBinded = true;
            };
            obj = [];
            obj.push(mainPet.slotData.id);
            for each (pet in _petList)
            {
                if (((pet) && (pet.selected)))
                {
                    p = 1;
                    while (p <= 8)
                    {
                        if (ToolKit.isBigThan(pet.petData[("equ" + p)], 0))
                        {
                            Alert.show(Language.PETFUNCPANEL_S[56], "", Alert.YES, null, null);
                            return;
                        };
                        p = (p + 1);
                    };
                    if (pet.petData["soulInfo"]["data"])
                    {
                        for (j in pet.petData["soulInfo"]["data"])
                        {
                            if (pet.petData["soulInfo"]["data"][j])
                            {
                                Alert.show(Language.PET_SOUL_S[51], "", Alert.YES, null, null);
                                return;
                            };
                        };
                    };
                    obj.push(pet.id);
                    if (pet.petData.binded == 1)
                    {
                        hasBinded = true;
                    };
                };
            };
            if (hasBinded)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("seniorPetJoin", new Responder(onJoin), obj);
                        reset();
                        joinViewClear();
                    };
                };
                Alert.show(Language.PETADVANCEDPANEL_S[6], "", (Alert.YES | Alert.NO), this, func);
            }
            else
            {
                _core.remote.call("seniorPetJoin", new Responder(onJoin), obj);
                reset();
                joinViewClear();
            };
        }

        public function set probabilityLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._3723199probabilityLabel;
            if (_local_2 !== _arg_1)
            {
                this._3723199probabilityLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "probabilityLabel", _local_2, _arg_1));
            };
        }

        public function ___PetAdvancedPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function set allChkBox(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._900864954allChkBox;
            if (_local_2 !== _arg_1)
            {
                this._900864954allChkBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allChkBox", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:PetAdvancedPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetAdvancedPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetAdvancedPanelWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        private function updatePet(_arg_1:int, _arg_2:String, _arg_3:String):void
        {
            var _local_4:Object = _core.player.petList;
            if (((_local_4) && (_local_4[_arg_1])))
            {
                _local_4[_arg_1][_arg_2] = _arg_3;
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + GamePredef.TBL_PET) + "_") + _arg_1), dataLoaded);
                _core.data.delData(GamePredef.TBL_PET, _arg_1);
                _core.data.getGameData(GamePredef.TBL_PET, _arg_1);
            };
        }

        private function _PetAdvancedPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetAdvancedPanel_DataGridColumn3 = _local_1;
            _local_1.width = 50;
            _local_1.itemRenderer = _PetAdvancedPanel_ClassFactory3_c();
            BindingManager.executeBindings(this, "_PetAdvancedPanel_DataGridColumn3", _PetAdvancedPanel_DataGridColumn3);
            return (_local_1);
        }

        private function joinViewClear():void
        {
            mainPet.clean();
            petItem.clean();
            _petList = new ArrayCollection();
            pageSelector.initPageSeletor(_petList.length, NUM_PER_PAGE);
        }

        public function onCheckClick(_arg_1:Object):void
        {
            var _local_3:int;
            var _local_4:*;
            if (!_arg_1.selected)
            {
                if (_arg_1.petData["soulInfo"]["data"])
                {
                    for (_local_4 in _arg_1.petData["soulInfo"]["data"])
                    {
                        if (_arg_1.petData["soulInfo"]["data"][_local_4])
                        {
                            Alert.show(Language.PET_SOUL_S[51], "", Alert.YES, null, null);
                            _arg_1.selected = true;
                            if (_arg_1.selected)
                            {
                                selectedNum++;
                            }
                            else
                            {
                                selectedNum--;
                            };
                            return;
                        };
                    };
                };
                _local_3 = 1;
                while (_local_3 <= 8)
                {
                    if (ToolKit.isBigThan(_arg_1.petData[("equ" + _local_3)], 0))
                    {
                        Alert.show(Language.PETFUNCPANEL_S[56], "", Alert.YES, null, null);
                        _arg_1.selected = true;
                        if (_arg_1.selected)
                        {
                            selectedNum++;
                        }
                        else
                        {
                            selectedNum--;
                        };
                        return;
                    };
                    _local_3++;
                };
            };
            var _local_2:Boolean = _arg_1.selected;
            _arg_1.selected = (!(_local_2));
            if (_arg_1.selected)
            {
                selectedNum++;
            }
            else
            {
                selectedNum--;
            };
            updateState();
        }

        public function set petItem(_arg_1:ItemSlotPetFunc):void
        {
            var _local_2:Object = this._677840686petItem;
            if (_local_2 !== _arg_1)
            {
                this._677840686petItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mainPet():ItemSlotPet
        {
            return (this._831007910mainPet);
        }

        public function set pTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1007683640pTitle;
            if (_local_2 !== _arg_1)
            {
                this._1007683640pTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pTitle", _local_2, _arg_1));
            };
        }

        private function _PetAdvancedPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pTitle.text = _arg_1;
            }, "pTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetAdvancedPanel_BasicTxtButton1.label = _arg_1;
            }, "_PetAdvancedPanel_BasicTxtButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetAdvancedPanel_BasicTxtButton2.label = _arg_1;
            }, "_PetAdvancedPanel_BasicTxtButton2.label");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.ITEM_TYPE_PETFUNC_TYPE[8]]);
            }, function (_arg_1:Array):void
            {
                petItem.petFuncType = _arg_1;
            }, "petItem.petFuncType");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                joinButton.label = _arg_1;
            }, "joinButton.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetAdvancedPanel_BasicTxtButton3.label = _arg_1;
            }, "_PetAdvancedPanel_BasicTxtButton3.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetAdvancedPanel_BasicTxtButton4.label = _arg_1;
            }, "_PetAdvancedPanel_BasicTxtButton4.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetAdvancedPanel_BasicTxtButton5.label = _arg_1;
            }, "_PetAdvancedPanel_BasicTxtButton5.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetAdvancedPanel_IntroText1.htmlText = _arg_1;
            }, "_PetAdvancedPanel_IntroText1.htmlText");
            result[8] = binding;
            binding = new Binding(this, function ():PageSelector
            {
                return (pageSelector);
            }, function (_arg_1:PageSelector):void
            {
                assistantDataGrid.pageSelector = _arg_1;
            }, "assistantDataGrid.pageSelector");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetAdvancedPanel_DataGridColumn2.headerText = _arg_1;
            }, "_PetAdvancedPanel_DataGridColumn2.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETADVANCEDPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetAdvancedPanel_DataGridColumn3.headerText = _arg_1;
            }, "_PetAdvancedPanel_DataGridColumn3.headerText");
            result[11] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get petItemNumTip():Label
        {
            return (this._1080482137petItemNumTip);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            pageOffset = _arg_1;
            if (_petList)
            {
                pageOffset = _arg_1;
                assistantDataGrid.dataProvider = ToolKit.getPageCollection(_petList, _arg_1, _arg_2);
            };
        }

        [Bindable(event="propertyChange")]
        public function get pTitle():BasicTitleCanvas
        {
            return (this._1007683640pTitle);
        }

        override public function update():void
        {
            if (visible)
            {
                mainPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, mainPetChange);
                petItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, petItemPut);
            }
            else
            {
                mainPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, mainPetChange);
                petItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, petItemPut);
                reset();
                joinViewClear();
            };
        }

        private function onJoin(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (_arg_1.flag)
                {
                    updatePet(_arg_1.pid, "growRate", _arg_1.grow);
                    _core.sysMidNote(Language.PETADVANCEDPANEL_S[1]);
                }
                else
                {
                    _core.sysMidNote(Language.PETADVANCEDPANEL_S[2]);
                };
            };
        }

        public function __countLabel_click(_arg_1:MouseEvent):void
        {
            onAllClick();
        }

        [Bindable(event="propertyChange")]
        public function get petItem():ItemSlotPetFunc
        {
            return (this._677840686petItem);
        }

        override public function initView():void
        {
            reset();
            joinViewClear();
        }

        [Bindable(event="propertyChange")]
        public function get probabilityLabel():Label
        {
            return (this._3723199probabilityLabel);
        }

        private function _PetAdvancedPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetAdvancedPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 80;
            _local_1.itemRenderer = _PetAdvancedPanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_PetAdvancedPanel_DataGridColumn2", _PetAdvancedPanel_DataGridColumn2);
            return (_local_1);
        }

        private function petItemPut(_arg_1:Event):void
        {
            if (_arg_1)
            {
                if (((_arg_1.currentTarget.slotData) && (!(_arg_1.currentTarget.slotData.tid == 3014))))
                {
                    _core.sysMidNote(Language.PETADVANCEDPANEL_S[9]);
                    petItem.clean();
                };
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            update();
        }

        private function _PetAdvancedPanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = PetAdvancedPanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function mainPetChange(_arg_1:Event):void
        {
            if (((_arg_1) && (allowAdvancedJoin())))
            {
                reset();
                petFresh();
                updateState();
            }
            else
            {
                reset();
                joinViewClear();
                _core.sysMidNote(Language.PETADVANCEDPANEL_S[3]);
            };
        }

        public function set joinButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1034217724joinButton;
            if (_local_2 !== _arg_1)
            {
                this._1034217724joinButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinButton", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

