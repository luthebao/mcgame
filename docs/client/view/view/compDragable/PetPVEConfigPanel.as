// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetPVEConfigPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.PetPVEConfigCanvas;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Tile;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.FlexEvent;
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

    public class PetPVEConfigPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3437300pet3:ItemSlot;
        private var _3437302pet5:ItemSlot;
        private var _3437304pet7:ItemSlot;
        private var _106556289pet13:ItemSlot;
        private var _3437306pet9:ItemSlot;
        private var _ppConfigData:Object;
        private var _106940444psPet:PageSelector;
        private var _106556286pet10:ItemSlot;
        private var _petList:Object;
        private var _110845pf3:PetPVEConfigCanvas;
        private var _3066321cvs1:Canvas;
        private var _106556291pet15:ItemSlot;
        private var _3437298pet1:ItemSlot;
        private var _106556288pet12:ItemSlot;
        private var _110843pf1:PetPVEConfigCanvas;
        private var _3437301pet4:ItemSlot;
        private var _105765600okBtn:BasicDelayButton;
        private var _3437305pet8:ItemSlot;
        private var _3437303pet6:ItemSlot;
        private var _110846pf4:PetPVEConfigCanvas;
        private var _106556290pet14:ItemSlot;
        private var _106556287pet11:ItemSlot;
        public var _PetPVEConfigPanel_IntroText1:IntroText;
        private var _110844pf2:PetPVEConfigCanvas;
        private var _3437299pet2:ItemSlot;
        private var _dataForServer:Object;
        private var _110847pf5:PetPVEConfigCanvas;
        public var _PetPVEConfigPanel_Label1:Label;
        public var _PetPVEConfigPanel_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":530,
                    "height":346,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetPVEConfigPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cvs1",
                        "stylesFactory":function ():void
                        {
                            this.top = "35";
                            this.left = "5";
                            this.bottom = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":165,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetPVEConfigPanel_Label1",
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
                                            "y":35,
                                            "width":125,
                                            "height":200,
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
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet9",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet11",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet12",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet13",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet14",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"pet15",
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
                                        return ({"y":262});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"_PetPVEConfigPanel_IntroText1",
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.top = "35";
                            this.bottom = "132";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":350});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.bottom = "5";
                            this.top = "222";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":350,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":20,
                                            "width":340,
                                            "height":65,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":PetPVEConfigCanvas,
                                                "id":"pf1"
                                            }), new UIComponentDescriptor({
                                                "type":PetPVEConfigCanvas,
                                                "id":"pf2"
                                            }), new UIComponentDescriptor({
                                                "type":PetPVEConfigCanvas,
                                                "id":"pf3"
                                            }), new UIComponentDescriptor({
                                                "type":PetPVEConfigCanvas,
                                                "id":"pf4"
                                            }), new UIComponentDescriptor({
                                                "type":PetPVEConfigCanvas,
                                                "id":"pf5"
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
                                            "y":87,
                                            "clickDelay":5000,
                                            "styleName":"BtnStdRed"
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetPVEConfigPanel()
        {
            mx_internal::_document = this;
            this.width = 530;
            this.height = 346;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___PetPVEConfigPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetPVEConfigPanel._watcherSetupUtil = _arg_1;
        }


        public function set pet12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556288pet12;
            if (_local_2 !== _arg_1)
            {
                this._106556288pet12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet12", _local_2, _arg_1));
            };
        }

        private function _PetPVEConfigPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVEConfigPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PetPVEConfigPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFIGHT_PANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVEConfigPanel_Label1.text = _arg_1;
            }, "_PetPVEConfigPanel_Label1.text");
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
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet7.slotType = _arg_1;
            }, "pet7.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet8.slotType = _arg_1;
            }, "pet8.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet9.slotType = _arg_1;
            }, "pet9.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet10.slotType = _arg_1;
            }, "pet10.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet11.slotType = _arg_1;
            }, "pet11.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet12.slotType = _arg_1;
            }, "pet12.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet13.slotType = _arg_1;
            }, "pet13.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet14.slotType = _arg_1;
            }, "pet14.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET);
            }, function (_arg_1:int):void
            {
                pet15.slotType = _arg_1;
            }, "pet15.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetPVEConfigPanel_IntroText1.htmlText = _arg_1;
            }, "_PetPVEConfigPanel_IntroText1.htmlText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_PVE_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                okBtn.label = _arg_1;
            }, "okBtn.label");
            result[18] = binding;
            return (result);
        }

        public function set pet14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556290pet14;
            if (_local_2 !== _arg_1)
            {
                this._106556290pet14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet14", _local_2, _arg_1));
            };
        }

        public function set pf1(_arg_1:PetPVEConfigCanvas):void
        {
            var _local_2:Object = this._110843pf1;
            if (_local_2 !== _arg_1)
            {
                this._110843pf1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf1", _local_2, _arg_1));
            };
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

        public function set pet13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556289pet13;
            if (_local_2 !== _arg_1)
            {
                this._106556289pet13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet13", _local_2, _arg_1));
            };
        }

        public function set pet15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556291pet15;
            if (_local_2 !== _arg_1)
            {
                this._106556291pet15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet15", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            initPetView();
        }

        [Bindable(event="propertyChange")]
        public function get pet8():ItemSlot
        {
            return (this._3437305pet8);
        }

        [Bindable(event="propertyChange")]
        public function get pf1():PetPVEConfigCanvas
        {
            return (this._110843pf1);
        }

        public function set pet10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556286pet10;
            if (_local_2 !== _arg_1)
            {
                this._106556286pet10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet2():ItemSlot
        {
            return (this._3437299pet2);
        }

        [Bindable(event="propertyChange")]
        public function get pet4():ItemSlot
        {
            return (this._3437301pet4);
        }

        [Bindable(event="propertyChange")]
        public function get pet9():ItemSlot
        {
            return (this._3437306pet9);
        }

        public function set pet8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437305pet8;
            if (_local_2 !== _arg_1)
            {
                this._3437305pet8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pf4():PetPVEConfigCanvas
        {
            return (this._110846pf4);
        }

        public function set pet9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437306pet9;
            if (_local_2 !== _arg_1)
            {
                this._3437306pet9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet9", _local_2, _arg_1));
            };
        }

        public function set pf3(_arg_1:PetPVEConfigCanvas):void
        {
            var _local_2:Object = this._110845pf3;
            if (_local_2 !== _arg_1)
            {
                this._110845pf3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pf2():PetPVEConfigCanvas
        {
            return (this._110844pf2);
        }

        public function set pf5(_arg_1:PetPVEConfigCanvas):void
        {
            var _local_2:Object = this._110847pf5;
            if (_local_2 !== _arg_1)
            {
                this._110847pf5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf5", _local_2, _arg_1));
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

        private function initPetView():void
        {
            var _local_2:*;
            var _local_3:Object;
            _petList = _core.player.petList;
            var _local_1:Array = [];
            if (_petList)
            {
                for each (_local_2 in _petList)
                {
                    if (_local_2)
                    {
                        _local_3 = _core.data.gameData[GamePredef.TBL_CREATURE][_local_2.tid];
                        if ((((_local_3) && (_local_2.binded == 1)) && (_core.player.level >= _local_3.useLv)))
                        {
                            _local_1.push(_local_2);
                        };
                    };
                };
            };
            _local_1.sortOn(["exp", "growRate"], [(Array.DESCENDING | Array.NUMERIC), (Array.DESCENDING | Array.NUMERIC)]);
            _petList = _local_1;
            psPet.onPageChanged = onPsPageChanged;
            psPet.onPageCleared = onPsPageClear;
            psPet.initPageSeletor(_petList.length, 15);
        }

        [Bindable(event="propertyChange")]
        public function get pf3():PetPVEConfigCanvas
        {
            return (this._110845pf3);
        }

        [Bindable(event="propertyChange")]
        public function get pf5():PetPVEConfigCanvas
        {
            return (this._110847pf5);
        }

        [Bindable(event="propertyChange")]
        public function get psPet():PageSelector
        {
            return (this._106940444psPet);
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

        public function set pf4(_arg_1:PetPVEConfigCanvas):void
        {
            var _local_2:Object = this._110846pf4;
            if (_local_2 !== _arg_1)
            {
                this._110846pf4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf4", _local_2, _arg_1));
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
        public function get pet10():ItemSlot
        {
            return (this._106556286pet10);
        }

        [Bindable(event="propertyChange")]
        public function get pet11():ItemSlot
        {
            return (this._106556287pet11);
        }

        [Bindable(event="propertyChange")]
        public function get pet12():ItemSlot
        {
            return (this._106556288pet12);
        }

        [Bindable(event="propertyChange")]
        public function get pet13():ItemSlot
        {
            return (this._106556289pet13);
        }

        [Bindable(event="propertyChange")]
        public function get pet14():ItemSlot
        {
            return (this._106556290pet14);
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
        public function get pet15():ItemSlot
        {
            return (this._106556291pet15);
        }

        public function resetPPconfig():void
        {
            _ppConfigData = undefined;
            var _local_1:int = 1;
            while (_local_1 < 6)
            {
                this[("pf" + _local_1)].cleanView();
                _local_1++;
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
            var target:PetPVEConfigPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetPVEConfigPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetPVEConfigPanelWatcherSetupUtil");
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

        public function set cvs1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3066321cvs1;
            if (_local_2 !== _arg_1)
            {
                this._3066321cvs1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cvs1", _local_2, _arg_1));
            };
        }

        public function duplicatedPet(_arg_1:Object, _arg_2:Number):Boolean
        {
            var _local_3:int = 1;
            while (_local_3 < 6)
            {
                if ((((this[("pf" + _local_3)].visible) && (!(_local_3 == _arg_2))) && ((this[("pf" + _local_3)].pid == _arg_1.pid) || (this[("pf" + _local_3)].tid == _arg_1.tid))))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function setPPVEConfig(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Array;
            var _local_7:Object;
            if (!initialized)
            {
                callLater(setPPVEConfig, [_arg_1]);
                return;
            };
            _ppConfigData = _arg_1;
            var _local_2:int = 1;
            while (_local_2 < 6)
            {
                this[("pf" + _local_2)].cleanView();
                _local_2++;
            };
            if (_ppConfigData)
            {
                _local_3 = _ppConfigData;
                _local_4 = 1;
                while (_local_4 < 6)
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

        private function _PetPVEConfigPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_PVE_PANEL[6];
            _local_1 = Language.PETFIGHT_PANEL_U[29];
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Slot.SLOT_PET;
            _local_1 = Language.PET_PVE_PANEL[7];
            _local_1 = Language.PET_PVE_PANEL[8];
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

        [Bindable(event="propertyChange")]
        public function get cvs1():Canvas
        {
            return (this._3066321cvs1);
        }

        public function getCacheConfData(_arg_1:Number):Object
        {
            if (_confDataList[_arg_1])
            {
                return (_confDataList[_arg_1]);
            };
            return (null);
        }

        private function onPsPageClear():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 15)
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

        public function set pet1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437298pet1;
            if (_local_2 !== _arg_1)
            {
                this._3437298pet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet1", _local_2, _arg_1));
            };
        }

        private function subPetConfigure():void
        {
            var _local_2:PetPVEConfigCanvas;
            var _local_3:Number;
            _dataForServer = {};
            var _local_1:int = 1;
            while (_local_1 < 6)
            {
                _local_2 = this[("pf" + _local_1)];
                if (((_local_2.visible) && (_local_2.hasSetted())))
                {
                    _local_3 = _local_2.pid;
                    if (((_local_3) && (_confDataList[_local_3])))
                    {
                        _confDataList[_local_3].pos = _local_1;
                        _dataForServer[_local_1] = _confDataList[_local_3];
                    };
                };
                _local_1++;
            };
            if (!ToolKit.isEmptyObject(_dataForServer))
            {
                _core.remote.call("savePPVEConf", null, _dataForServer);
            }
            else
            {
                _core.sysMidNote(Language.PETFIGHT_PANEL_U[26]);
            };
        }

        public function ___PetPVEConfigPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (((_arg_1) && (initialized)))
            {
                initPetView();
            };
            super.visible = _arg_1;
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

        public function set pet3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437300pet3;
            if (_local_2 !== _arg_1)
            {
                this._3437300pet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet3", _local_2, _arg_1));
            };
        }

        public function set pet7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3437304pet7;
            if (_local_2 !== _arg_1)
            {
                this._3437304pet7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet1():ItemSlot
        {
            return (this._3437298pet1);
        }

        [Bindable(event="propertyChange")]
        public function get pet3():ItemSlot
        {
            return (this._3437300pet3);
        }

        [Bindable(event="propertyChange")]
        public function get pet6():ItemSlot
        {
            return (this._3437303pet6);
        }

        [Bindable(event="propertyChange")]
        public function get pet7():ItemSlot
        {
            return (this._3437304pet7);
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

        [Bindable(event="propertyChange")]
        public function get pet5():ItemSlot
        {
            return (this._3437302pet5);
        }

        public function set pet11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._106556287pet11;
            if (_local_2 !== _arg_1)
            {
                this._106556287pet11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet11", _local_2, _arg_1));
            };
        }

        public function set pf2(_arg_1:PetPVEConfigCanvas):void
        {
            var _local_2:Object = this._110844pf2;
            if (_local_2 !== _arg_1)
            {
                this._110844pf2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pf2", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

