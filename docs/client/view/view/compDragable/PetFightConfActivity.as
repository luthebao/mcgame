// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetFightConfActivity

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.PetConfigCanvasActivity;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Tile;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.events.FlexEvent;
    import flash.utils.setTimeout;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.utils.ObjectUtil;
    import com.qeedoo.game.logic.PetLogic;
    import com.qeedoo.game.view.ViewManager;
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

    public class PetFightConfActivity extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3437300pet3:ItemSlot;
        private var _3437302pet5:ItemSlot;
        private var _petList:Object;
        private var _106940444psPet:PageSelector;
        private var _3523916tCvs:Canvas;
        private var _2106582911_petArenaHasTicket:Boolean = false;
        public var _PetFightConfActivity_BasicTxtButton1:BasicTxtButton;
        private var _1845684364loadWarn:Label;
        public var _PetFightConfActivity_IntroText1:IntroText;
        private var _110848pf6:PetConfigCanvasActivity;
        private var _3437298pet1:ItemSlot;
        public var _PetFightConfActivity_Label1:Label;
        public var _PetFightConfActivity_Label2:Label;
        public var _PetFightConfActivity_Label3:Label;
        private var _3437301pet4:ItemSlot;
        private var _105765600okBtn:BasicDelayButton;
        private var _3437303pet6:ItemSlot;
        private var _farmPetData:*;
        private var _109548831tName:TextInput;
        private var firstTimeFlag:Boolean = true;
        private var _1007683640pTitle:BasicTitleCanvas;
        private var _110849pf7:PetConfigCanvasActivity;
        private var _339934535_randNmae:String = "";
        private var _petArenaData:*;
        private var _3437299pet2:ItemSlot;
        private var _dataForServer:Object;
        private var _110847pf5:PetConfigCanvasActivity;
        private var _757338791_setForPetCross:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":530,
                    "height":350,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"pTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":40,
                                "width":160,
                                "height":144,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetFightConfActivity_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":5});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":35,
                                            "width":125,
                                            "height":80,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"psPet",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":120
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
                                "x":4,
                                "y":192,
                                "width":161,
                                "height":148,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetFightConfActivity_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":5});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetFightConfActivity_BasicTxtButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":62,
                                            "width":146,
                                            "height":73,
                                            "enabled":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"_PetFightConfActivity_IntroText1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":170,
                                "y":40,
                                "width":350,
                                "height":120
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":170,
                                "y":170,
                                "width":350,
                                "height":170,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"tCvs",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":20,
                                            "width":350,
                                            "height":25,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetFightConfActivity_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":40,
                                                        "y":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"tName",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":125,
                                                        "y":0,
                                                        "width":175,
                                                        "maxChars":50,
                                                        "enabled":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":50,
                                            "width":198,
                                            "height":65,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":PetConfigCanvasActivity,
                                                "id":"pf6"
                                            }), new UIComponentDescriptor({
                                                "type":PetConfigCanvasActivity,
                                                "id":"pf5"
                                            }), new UIComponentDescriptor({
                                                "type":PetConfigCanvasActivity,
                                                "id":"pf7"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"okBtn",
                                    "events":{"click":"__okBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":145,
                                            "clickDelay":5000,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"loadWarn",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "x":5,
                                            "y":50,
                                            "width":340,
                                            "height":160
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
        private var _confDataList:Object = {};
        private var _defaultCmd:Object = {
            "action":GamePredef.BATTLE_ACTION_ATTACK,
            "level":-1,
            "id":-1
        };
        private var tempFightRecord:Array = [];
        private var maxPet:Object = {
            "lev":0,
            "id":0
        };
        private var kvList:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetFightConfActivity()
        {
            mx_internal::_document = this;
            this.width = 530;
            this.height = 350;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___PetFightConfActivity_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetFightConfActivity._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get pf6():PetConfigCanvasActivity
        {
            return (this._110848pf6);
        }

        [Bindable(event="propertyChange")]
        public function get pf7():PetConfigCanvasActivity
        {
            return (this._110849pf7);
        }

        public function set pf7(_arg_1:PetConfigCanvasActivity):void
        {
            var _local_2:Object = this._110849pf7;
            if (_local_2 !== _arg_1)
            {
                this._110849pf7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet4():ItemSlot
        {
            return (this._3437301pet4);
        }

        [Bindable(event="propertyChange")]
        public function get pet3():ItemSlot
        {
            return (this._3437300pet3);
        }

        public function set pf6(_arg_1:PetConfigCanvasActivity):void
        {
            var _local_2:Object = this._110848pf6;
            if (_local_2 !== _arg_1)
            {
                this._110848pf6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf6", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            initPetView();
            this.petCrossConf = {
                "f":_setForPetCross,
                "t":_petArenaHasTicket
            };
        }

        public function set pet1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437298pet1;
            if (_local_2 !== _arg_1)
            {
                this._3437298pet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet1", _local_2, _arg_1));
            };
        }

        public function set loadWarn(_arg_1:Label):void
        {
            var _local_2:Object = this._1845684364loadWarn;
            if (_local_2 !== _arg_1)
            {
                this._1845684364loadWarn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loadWarn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get psPet():PageSelector
        {
            return (this._106940444psPet);
        }

        [Bindable(event="propertyChange")]
        public function get tName():TextInput
        {
            return (this._109548831tName);
        }

        public function addFightRecord(_arg_1:Object):void
        {
        }

        [Bindable(event="propertyChange")]
        public function get pet5():ItemSlot
        {
            return (this._3437302pet5);
        }

        private function set _petArenaHasTicket(_arg_1:Boolean):void
        {
            var _local_2:Object = this._2106582911_petArenaHasTicket;
            if (_local_2 !== _arg_1)
            {
                this._2106582911_petArenaHasTicket = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_petArenaHasTicket", _local_2, _arg_1));
            };
        }

        public function set pet5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437302pet5;
            if (_local_2 !== _arg_1)
            {
                this._3437302pet5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet5", _local_2, _arg_1));
            };
        }

        private function initPetView():void
        {
            var _local_3:*;
            var _local_4:Object;
            _petList = _core.player.petList;
            var _local_1:* = _core.player.petArenaAct;
            var _local_2:Array = [];
            if (_petList)
            {
                for each (_local_3 in _petList)
                {
                    if (_local_3)
                    {
                        _local_4 = _core.data.gameData[GamePredef.TBL_CREATURE][_local_3.tid];
                        if ((((_local_4) && (_local_3.binded == 1)) && (_local_4.classId == _local_1.actinfo.petType)))
                        {
                            _local_2.push(_local_3);
                            kvList[_local_3.id] = _local_3;
                        };
                    };
                };
            };
            _local_2.sortOn(["exp", "growRate"], [(Array.DESCENDING | Array.NUMERIC), (Array.DESCENDING | Array.NUMERIC)]);
            _petList = _local_2;
            psPet.onPageChanged = onPsPageChanged;
            psPet.onPageCleared = onPsPageClear;
            psPet.initPageSeletor(_petList.length, 6);
        }

        private function _PetFightConfActivity_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PETFIGHT_PANEL_U[0];
            _local_1 = Language.PETFIGHT_PANEL_U[29];
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Language.PETFIGHT_PANEL_U[28];
            _local_1 = Language.PETFIGHT_PANEL_U[27];
            _local_1 = Language.PET_ARENA_U[69];
            _local_1 = ((_setForPetCross) ? (!(_petArenaHasTicket)) : false);
            _local_1 = Language.PETFIGHT_PANEL_U[25];
            _local_1 = _randNmae;
            _local_1 = Language.PETFIGHT_PANEL_U[2];
            _local_1 = Language.PETFIGHT_PANEL_U[14];
        }

        public function ___PetFightConfActivity_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set psPet(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._106940444psPet;
            if (_local_2 !== _arg_1)
            {
                this._106940444psPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "psPet", _local_2, _arg_1));
            };
        }

        public function set tName(_arg_1:TextInput):void
        {
            var _local_2:Object = this._109548831tName;
            if (_local_2 !== _arg_1)
            {
                this._109548831tName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tName", _local_2, _arg_1));
            };
        }

        public function clearCacheConfData(_arg_1:Number):void
        {
            if (_confDataList[_arg_1])
            {
                delete _confDataList[_arg_1];
            };
        }

        [Bindable(event="propertyChange")]
        private function get _randNmae():String
        {
            return (this._339934535_randNmae);
        }

        [Bindable(event="propertyChange")]
        public function get tCvs():Canvas
        {
            return (this._3523916tCvs);
        }

        public function reset():void
        {
            firstTimeFlag = true;
            _petArenaData = undefined;
            _farmPetData = undefined;
            var _local_1:int = 5;
            while (_local_1 < 8)
            {
                this[("pf" + _local_1)].cleanView();
                _local_1++;
            };
        }

        public function set petCrossConf(_arg_1:Object):void
        {
            var _local_2:int;
            _setForPetCross = _arg_1.f;
            _petArenaHasTicket = _arg_1.t;
            if (!initialized)
            {
                return;
            };
            if (_setForPetCross)
            {
                pTitle.text = Language.PETFIGHT_PANEL_U[24];
                if (_petArenaHasTicket)
                {
                    okBtn.label = Language.PET_ARENA_U[41];
                }
                else
                {
                    okBtn.label = Language.PETFIGHT_PANEL_U[22];
                };
            }
            else
            {
                _local_2 = 5;
                while (_local_2 <= 7)
                {
                    this[("pf" + _local_2)].visible = true;
                    _local_2++;
                };
                pTitle.text = Language.PETFIGHT_PANEL_U[0];
                okBtn.label = Language.PETFIGHT_PANEL_U[2];
            };
            if (((_setForPetCross) ? (_petArenaData == undefined) : (_farmPetData == undefined)))
            {
                loadWarn.visible = true;
                if (_setForPetCross)
                {
                    _core.remote.call("getPetArenaConfActivity", null);
                }
                else
                {
                    _core.remote.call("getPetConf", null);
                };
                setTimeout(removeLoadWarnLabel, 3000);
                firstTimeFlag = false;
            }
            else
            {
                if (_setForPetCross)
                {
                    onGetPetConf(_petArenaData);
                }
                else
                {
                    onGetPetConf(_farmPetData);
                };
            };
            setRandName();
        }

        private function set _setForPetCross(_arg_1:Boolean):void
        {
            var _local_2:Object = this._757338791_setForPetCross;
            if (_local_2 !== _arg_1)
            {
                this._757338791_setForPetCross = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_setForPetCross", _local_2, _arg_1));
            };
        }

        private function _PetFightConfActivity_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pTitle.text = _arg_1;
            }, "pTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFightConfActivity_Label1.text = _arg_1;
            }, "_PetFightConfActivity_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet1.slotType = _arg_1;
            }, "pet1.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet2.slotType = _arg_1;
            }, "pet2.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet3.slotType = _arg_1;
            }, "pet3.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet4.slotType = _arg_1;
            }, "pet4.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet5.slotType = _arg_1;
            }, "pet5.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet6.slotType = _arg_1;
            }, "pet6.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFightConfActivity_Label2.text = _arg_1;
            }, "_PetFightConfActivity_Label2.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFightConfActivity_BasicTxtButton1.text = _arg_1;
            }, "_PetFightConfActivity_BasicTxtButton1.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_U[69];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFightConfActivity_IntroText1.htmlText = _arg_1;
            }, "_PetFightConfActivity_IntroText1.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_setForPetCross) ? (!(_petArenaHasTicket)) : false);
            }, function (_arg_1:Boolean):void
            {
                tCvs.visible = _arg_1;
            }, "tCvs.visible");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFightConfActivity_Label3.text = _arg_1;
            }, "_PetFightConfActivity_Label3.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _randNmae;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tName.text = _arg_1;
            }, "tName.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                okBtn.label = _arg_1;
            }, "okBtn.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                loadWarn.text = _arg_1;
            }, "loadWarn.text");
            result[15] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        private function get _petArenaHasTicket():Boolean
        {
            return (this._2106582911_petArenaHasTicket);
        }

        private function onPsPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int = 1;
            while (_local_4 <= _arg_2)
            {
                _local_3 = ((_local_4 - 1) + _arg_1);
                this[("pet" + _local_4)].type = GamePredef.TBL_PET;
                this[("pet" + _local_4)].slotData = _petList[_local_3];
                this[("pet" + _local_4)].stackNum = 1;
                this[("pet" + _local_4)].giid = _petList[_local_3].id;
                _local_4++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get loadWarn():Label
        {
            return (this._1845684364loadWarn);
        }

        private function set _randNmae(_arg_1:String):void
        {
            var _local_2:Object = this._339934535_randNmae;
            if (_local_2 !== _arg_1)
            {
                this._339934535_randNmae = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_randNmae", _local_2, _arg_1));
            };
        }

        public function saveConfData(_arg_1:Object):void
        {
            var _local_2:Number = _arg_1.pid;
            if (((_local_2) && (_local_2 > 0)))
            {
                _confDataList[_local_2] = _arg_1;
            };
        }

        override public function initialize():void
        {
            var target:PetFightConfActivity;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetFightConfActivity_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetFightConfActivityWatcherSetupUtil");
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

        public function __okBtn_click(_arg_1:MouseEvent):void
        {
            subPetConfigure();
        }

        private function getMaxPetLeve():*
        {
            var _local_2:PetConfigCanvasActivity;
            var _local_3:*;
            maxPet = {
                "lev":0,
                "id":0
            };
            var _local_1:int = 5;
            while (_local_1 < 8)
            {
                _local_2 = this[("pf" + _local_1)];
                if (((_local_2.visible) && (_local_2.hasSetted())))
                {
                    _local_3 = _confDataList[_local_2.pid].creatureData;
                    if ((((_local_3) && (_local_3.level)) && (_local_3.level > maxPet.lev)))
                    {
                        maxPet = {
                            "lev":_local_3.level,
                            "id":_local_3.id
                        };
                    };
                };
                _local_1++;
            };
        }

        public function duplicatedPet(_arg_1:Object, _arg_2:Number):Boolean
        {
            var _local_3:int = 5;
            while (_local_3 < 8)
            {
                if ((((this[("pf" + _local_3)].visible) && (!(_local_3 == _arg_2))) && ((this[("pf" + _local_3)].pid == _arg_1.pid) || (this[("pf" + _local_3)].tid == _arg_1.tid))))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        private function removeLoadWarnLabel():void
        {
            loadWarn.visible = false;
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

        [Bindable(event="propertyChange")]
        private function get _setForPetCross():Boolean
        {
            return (this._757338791_setForPetCross);
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

        public function set okBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._105765600okBtn;
            if (_local_2 !== _arg_1)
            {
                this._105765600okBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "okBtn", _local_2, _arg_1));
            };
        }

        public function set tCvs(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3523916tCvs;
            if (_local_2 !== _arg_1)
            {
                this._3523916tCvs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tCvs", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pTitle():BasicTitleCanvas
        {
            return (this._1007683640pTitle);
        }

        private function setRandName():void
        {
            var _local_3:String;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
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
                _randNmae = ((_local_4.name + "·") + _local_5.name);
            }
            else
            {
                _randNmae = (_local_4.name + ((_local_5) ? _local_5.name : ""));
            };
            if (Math.random() > 0.7)
            {
                _local_6 = rand3(_core.data.gameDataIndex[80][0]).name;
                if (_local_6)
                {
                    _randNmae = ((_local_6 + _randNmae) + _local_6);
                };
            };
            if (String(Language.GAMEPREDEF_S[338]).indexOf(_randNmae) > 0)
            {
                _randNmae = "";
                setRandName();
            };
        }

        private function onPsPageClear():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 6)
            {
                this[("pet" + _local_1)].clean();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get okBtn():BasicDelayButton
        {
            return (this._105765600okBtn);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (((_arg_1) && (initialized)))
            {
                initPetView();
            };
            super.visible = _arg_1;
        }

        public function set pet2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437299pet2;
            if (_local_2 !== _arg_1)
            {
                this._3437299pet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet2", _local_2, _arg_1));
            };
        }

        private function subPetConfigure():void
        {
            var _local_6:PetConfigCanvasActivity;
            var _local_7:Number;
            var _local_8:*;
            _dataForServer = {};
            var _local_1:* = _core.player.petArenaAct.actinfo;
            var _local_2:* = false;
            var _local_3:* = false;
            var _local_4:* = "";
            getMaxPetLeve();
            var _local_5:int = 5;
            while (_local_5 < 8)
            {
                _local_6 = this[("pf" + _local_5)];
                if (((_local_6.visible) && (_local_6.hasSetted())))
                {
                    _local_7 = _local_6.pid;
                    if (((_local_7) && (_confDataList[_local_7])))
                    {
                        if (!_confDataList[_local_7].creatureData)
                        {
                            if (((kvList[_local_7]) && (kvList[_local_7].creatureData)))
                            {
                                _confDataList[_local_7].creatureData = ObjectUtil.copy(kvList[_local_7].creatureData);
                                _confDataList[_local_7].creatureData.growRate = kvList[_local_7].growRate;
                                _confDataList[_local_7].creatureData.level = PetLogic.expToLv(kvList[_local_7].exp);
                            }
                            else
                            {
                                _core.sysMidNote("数据未同步，请刷新后再试。");
                                return;
                            };
                        };
                        _local_8 = _confDataList[_local_7].creatureData;
                        if (_local_1.leadPetId.indexOf(Number(_local_8.id)) >= 0)
                        {
                            if ((((Number(_local_8.level) >= 50) && (Number(_local_8.level) >= (Number(maxPet.lev) * 0.4))) && (Number(_local_8.growRate) >= 1.9)))
                            {
                                _local_3 = true;
                            };
                            _local_4 = ((Number(_local_8.level) < 50) ? "参战宠物等级必须大于50级" : _local_4);
                            _local_4 = ((Number(_local_8.level) < (Number(maxPet.lev) * 0.4)) ? "参战宠物等级不低于整队中最高宠物等级的40%" : _local_4);
                            _local_4 = ((Number(_local_8.growRate) < 1.9) ? "参战宠物基础品质必须大于等于1.9" : _local_4);
                            _local_2 = true;
                        };
                        _confDataList[_local_7].pos = _local_5;
                        _dataForServer[_local_5] = _confDataList[_local_7];
                    };
                };
                _local_5++;
            };
            if (!_local_2)
            {
                _core.sysMidNote(Language.PETFIGHT_PANEL_U[31]);
                return;
            };
            if (!_local_3)
            {
                _core.sysMidNote(_local_4);
                return;
            };
            if (!ToolKit.isEmptyObject(_dataForServer))
            {
                if (_setForPetCross)
                {
                    if (((tCvs.visible) && (tName.text == "")))
                    {
                        _core.sysMidNote(Language.PETFIGHT_PANEL_U[23]);
                    }
                    else
                    {
                        if (_core.haveSpecialStr(tName.text))
                        {
                            _core.sysMidNote(Language.CHARSELECTCANVAS_S[4]);
                        }
                        else
                        {
                            if (_core.haveBadWord(tName.text))
                            {
                                _core.sysMidNote(Language.CALLBACK_S[6]);
                            }
                            else
                            {
                                _core.remote.call("petArenaTicketActivity", null, ((tCvs.visible) ? tName.text : "nl"), _dataForServer);
                                if (!_petArenaData)
                                {
                                    _petArenaData = {};
                                };
                                _petArenaData.conf1 = _dataForServer;
                            };
                        };
                    };
                }
                else
                {
                    _core.remote.call("petFightResultActivity", null, _dataForServer);
                    if (!_farmPetData)
                    {
                        _farmPetData = {};
                    };
                    _farmPetData.conf1 = _dataForServer;
                };
            }
            else
            {
                _core.sysMidNote(Language.PETFIGHT_PANEL_U[26]);
            };
            _core.checkFinishGuides(ViewManager.POP_AI_CONFIGURE, "", -1, -1, GamePredef.GUIDE_TYPE_PET_FIGHT_AI);
        }

        public function set pet3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437300pet3;
            if (_local_2 !== _arg_1)
            {
                this._3437300pet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet3", _local_2, _arg_1));
            };
        }

        public function getCacheConfData(_arg_1:Number):Object
        {
            if (_confDataList[_arg_1])
            {
                return (_confDataList[_arg_1]);
            };
            return (null);
        }

        public function onGetPetConf(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Array;
            var _local_7:Object;
            loadWarn.visible = false;
            if (_setForPetCross)
            {
                _petArenaData = _arg_1;
            }
            else
            {
                _farmPetData = _arg_1;
            };
            var _local_2:int = 5;
            while (_local_2 < 8)
            {
                this[("pf" + _local_2)].cleanView();
                _local_2++;
            };
            if (_arg_1)
            {
                _local_3 = _arg_1.conf1;
                _local_4 = 5;
                while (_local_4 < 8)
                {
                    if (_local_3[_local_4])
                    {
                        _local_5 = Number(_local_3[_local_4].pid);
                        this[("pf" + _local_4)].setPet(_local_5);
                        this[("pf" + _local_4)].conf = _local_3[_local_4];
                        _confDataList[_local_5] = _local_3[_local_4];
                        _local_6 = new Array();
                        if (((_confDataList[_local_5].cmdList) && (!(_confDataList[_local_5].cmdList == null))))
                        {
                            for each (_local_7 in _confDataList[_local_5].cmdList)
                            {
                                _local_6.push(_local_7);
                            };
                            _confDataList[_local_5].cmdList = _local_6;
                        };
                    };
                    _local_4++;
                };
            };
        }

        public function set pet6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437303pet6;
            if (_local_2 !== _arg_1)
            {
                this._3437303pet6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet6", _local_2, _arg_1));
            };
        }

        public function set pet4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437301pet4;
            if (_local_2 !== _arg_1)
            {
                this._3437301pet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet6():ItemSlot
        {
            return (this._3437303pet6);
        }

        [Bindable(event="propertyChange")]
        public function get pet1():ItemSlot
        {
            return (this._3437298pet1);
        }

        [Bindable(event="propertyChange")]
        public function get pet2():ItemSlot
        {
            return (this._3437299pet2);
        }

        public function set pf5(_arg_1:PetConfigCanvasActivity):void
        {
            var _local_2:Object = this._110847pf5;
            if (_local_2 !== _arg_1)
            {
                this._110847pf5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pf5():PetConfigCanvasActivity
        {
            return (this._110847pf5);
        }


    }
}//package com.qeedoo.ui.view.compDragable

