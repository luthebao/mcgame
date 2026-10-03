// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.Treasure

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponent;
    import mx.controls.CheckBox;
    import flash.utils.Timer;
    import mx.controls.Image;
    import flash.display.MovieClip;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.setTimeout;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.comp.Slot;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
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

    public class Treasure extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _109532659slot1:ItemSlot;
        private var _109532667slot9:ItemSlot;
        private var _899454813slot16:ItemSlot;
        private var _912591290hideBtn:BasicGlowButton;
        private var _899454817slot12:ItemSlot;
        private var _109532664slot6:ItemSlot;
        private var tData:Object;
        private var uic:UIComponent;
        private var currentNum:int = 17;
        private var _109532661slot3:ItemSlot;
        private var _958086113fastCheckBox:CheckBox;
        private var totalTimes:int = 1;
        private var _899454818slot11:ItemSlot;
        private var _899454814slot15:ItemSlot;
        private var n:int = 17;
        private var t:Timer;
        private var _1298695779runButton:BasicGlowButton;
        private var _109532666slot8:ItemSlot;
        public var _Treasure_Image1:Image;
        private var _1603303783takeButton:BasicGlowButton;
        private var _109532663slot5:ItemSlot;
        private var runFlag:Boolean = false;
        private var _899454815slot14:ItemSlot;
        private var _899454819slot10:ItemSlot;
        private var slotId:Number = -1;
        private var _109532660slot2:ItemSlot;
        private var _1363002994autoCheckBox:CheckBox;
        private var mvc:MovieClip;
        private var _109532665slot7:ItemSlot;
        private var _1947931397autoNextCheckBox:CheckBox;
        private var _899454816slot13:ItemSlot;
        private var _899454812slot17:ItemSlot;
        private var _109532662slot4:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":271,
                    "height":350,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"_Treasure_Image1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":15,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot1",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":60,
                                "y":15,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot2",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":110,
                                "y":15,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot3",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":160,
                                "y":15,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot4",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":210,
                                "y":15,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot5",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":210,
                                "y":65,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot6",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":210,
                                "y":115,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot7",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":210,
                                "y":165,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot8",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":210,
                                "y":215,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot9",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":160,
                                "y":215,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot10",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":110,
                                "y":215,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot11",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":60,
                                "y":215,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot12",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":10,
                                "y":215,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot13",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":10,
                                "y":165,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot14",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":10,
                                "y":115,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot15",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":10,
                                "y":65,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot16",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "x":8,
                                            "y":8
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
                                "x":110,
                                "y":115,
                                "width":50,
                                "height":50,
                                "styleName":"TreasureSlotBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot17",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "movable":false,
                                            "y":8,
                                            "x":8
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"runButton",
                        "events":{"click":"__runButton_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "50";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":208,
                                "y":275,
                                "styleName":"BtnStdGreen",
                                "width":52.2
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"takeButton",
                        "events":{"click":"__takeButton_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "50";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":140,
                                "styleName":"BtnStdRed",
                                "width":52.2
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"hideBtn",
                        "events":{"click":"__hideBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":208,
                                "styleName":"BtnStdRed",
                                "width":52.2
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"autoNextCheckBox",
                        "stylesFactory":function ():void
                        {
                            this.color = 16366965;
                            this.fontSize = 12;
                            this.bottom = "55";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "width":109
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"autoCheckBox",
                        "stylesFactory":function ():void
                        {
                            this.color = 16366965;
                            this.fontSize = 12;
                            this.bottom = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "width":109
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"fastCheckBox",
                        "stylesFactory":function ():void
                        {
                            this.color = 16366965;
                            this.fontSize = 12;
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "width":109
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var treasureSelectEff:Class = Treasure_treasureSelectEff;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function Treasure()
        {
            mx_internal::_document = this;
            this.width = 271;
            this.height = 350;
            this.styleName = "PanelTreasure";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            Treasure._watcherSetupUtil = _arg_1;
        }


        private function stop(_arg_1:TimerEvent):void
        {
            var _local_2:Number;
            var _local_3:String;
            if (((currentNum >= 1) && (currentNum <= 17)))
            {
                this[("slot" + currentNum)].filters = [];
                this[("slot" + currentNum)].setStyle("borderColor", 0);
            };
            if (currentNum >= 16)
            {
                currentNum = 1;
            }
            else
            {
                currentNum++;
            };
            this[("slot" + currentNum)].filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
            this[("slot" + currentNum)].setStyle("borderColor", 0xFF0000);
            totalTimes++;
            t.stop();
            t.removeEventListener(TimerEvent.TIMER_COMPLETE, stop);
            if (totalTimes <= (16 + n))
            {
                t = new Timer((totalTimes * 10), 1);
                t.addEventListener(TimerEvent.TIMER_COMPLETE, stop);
                t.start();
            }
            else
            {
                this[("slot" + n)].filters = [GamePredef.FILTER_SLOT_SELECTED];
                mvc = new treasureSelectEff();
                uic = new UIComponent();
                uic.addChild(mvc);
                this[("slot" + n)].addChild(uic);
                slot17.clean();
                if (ToolKit.isEqual(this[("slot" + n)].type, 10000))
                {
                    _local_2 = this[("slot" + n)].slotData;
                    _local_3 = ((Language.GAMEPREDEF_S[53] + ": ") + _local_2);
                    this.slot17.type = this[("slot" + n)].type;
                    this.slot17.slotData = this[("slot" + n)].slotData;
                    this.slot17.setIconToolTip(ResManager.ICON_EXP, _local_3);
                }
                else
                {
                    this.slot17.type = this[("slot" + n)].type;
                    this.slot17.giid = this[("slot" + n)].giid;
                    this.slot17.stackNum = this[("slot" + n)].stackNum;
                    this.slot17.slotData = this[("slot" + n)].slotData;
                    this.slot17.slotData.b = this[("slot" + n)].slotData.b;
                };
                if (autoCheckBox.selected)
                {
                    setTimeout(take, 1500);
                }
                else
                {
                    takeButton.enabled = true;
                };
                hideBtn.enabled = true;
            };
        }

        public function set slot8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get autoNextCheckBox():CheckBox
        {
            return (this._1947931397autoNextCheckBox);
        }

        private function onTake(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                viewClear();
                if ((((autoNextCheckBox.selected) || (autoCheckBox.selected)) || (fastCheckBox.selected)))
                {
                    if (((((this.visible) && (_core.data.sList)) && (_core.data.sList[slotId])) && (ToolKit.isBigThan(_core.data.sList[slotId].stackNum, 0))))
                    {
                        _core.player.useItem(GamePredef.MOUSE_TARGET_CHA, -1, slotId);
                    }
                    else
                    {
                        takeButton.enabled = true;
                        runButton.enabled = true;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot8():ItemSlot
        {
            return (this._109532666slot8);
        }

        private function _Treasure_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.TOTEM_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = Language.TREASURE_U[0];
            _local_1 = Language.TREASURE_U[1];
            _local_1 = Language.TREASURE_U[3];
            _local_1 = Language.TREASURE_S[0];
            _local_1 = Language.TREASURE_S[1];
            _local_1 = Language.TREASURE_S[2];
        }

        [Bindable(event="propertyChange")]
        public function get slot1():ItemSlot
        {
            return (this._109532659slot1);
        }

        public function set slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        public function set autoNextCheckBox(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1947931397autoNextCheckBox;
            if (_local_2 !== _arg_1)
            {
                this._1947931397autoNextCheckBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoNextCheckBox", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot9():ItemSlot
        {
            return (this._109532667slot9);
        }

        public function set slot7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
        }

        private function updateView():void
        {
            var _local_1:int;
            var _local_2:Number;
            var _local_3:String;
            if (((tData) && (tData.l)))
            {
                n = tData.n;
                slotId = tData.si;
                _local_1 = 1;
                while (_local_1 <= 17)
                {
                    if (((tData.l[_local_1]) && (this[("slot" + _local_1)])))
                    {
                        if (ToolKit.isEqual(tData.l[_local_1].ti, 10000))
                        {
                            _local_2 = tData.l[_local_1].n;
                            if (ToolKit.isEqual(tData.l[_local_1].ii, 1))
                            {
                                _local_2 = Math.round((GamePredef.BASIC_GET_EXP[_core.player.level] * _local_2));
                            };
                            _local_3 = ((Language.GAMEPREDEF_S[53] + ": ") + _local_2);
                            this[("slot" + _local_1)].type = tData.l[_local_1].ti;
                            this[("slot" + _local_1)].slotData = _local_2;
                            this[("slot" + _local_1)].setIconToolTip(ResManager.ICON_EXP, _local_3);
                        }
                        else
                        {
                            this[("slot" + _local_1)].type = tData.l[_local_1].ti;
                            this[("slot" + _local_1)].giid = tData.l[_local_1].ii;
                            this[("slot" + _local_1)].stackNum = tData.l[_local_1].n;
                            this[("slot" + _local_1)].slotData = tData.l[_local_1];
                            if (ToolKit.isBigThan(tData.b, 0))
                            {
                                this[("slot" + _local_1)].slotData.b = 1;
                            };
                        };
                    };
                    _local_1++;
                };
                slot17.setStyle("borderColor", 0xFF0000);
                if (fastCheckBox.selected)
                {
                    slot17.setStyle("borderColor", 0);
                    this[("slot" + n)].setStyle("borderColor", 0xFF0000);
                    runFlag = true;
                    takeButton.enabled = false;
                    setTimeout(take, 3000);
                }
                else
                {
                    if (autoCheckBox.selected)
                    {
                        run();
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot4():ItemSlot
        {
            return (this._109532662slot4);
        }

        [Bindable(event="propertyChange")]
        public function get fastCheckBox():CheckBox
        {
            return (this._958086113fastCheckBox);
        }

        public function set slot9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
        }

        public function set takeButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1603303783takeButton;
            if (_local_2 !== _arg_1)
            {
                this._1603303783takeButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "takeButton", _local_2, _arg_1));
            };
        }

        public function set slot11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        public function set slot13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function __takeButton_click(_arg_1:MouseEvent):void
        {
            take();
        }

        public function set slot15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        private function _Treasure_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_TREASURE);
            }, function (_arg_1:Object):void
            {
                _Treasure_Image1.source = _arg_1;
            }, "_Treasure_Image1.source");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot3.slotType = _arg_1;
            }, "slot3.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot4.slotType = _arg_1;
            }, "slot4.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot5.slotType = _arg_1;
            }, "slot5.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot6.slotType = _arg_1;
            }, "slot6.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot7.slotType = _arg_1;
            }, "slot7.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot8.slotType = _arg_1;
            }, "slot8.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot9.slotType = _arg_1;
            }, "slot9.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot10.slotType = _arg_1;
            }, "slot10.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot11.slotType = _arg_1;
            }, "slot11.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot12.slotType = _arg_1;
            }, "slot12.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot13.slotType = _arg_1;
            }, "slot13.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot14.slotType = _arg_1;
            }, "slot14.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot15.slotType = _arg_1;
            }, "slot15.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot16.slotType = _arg_1;
            }, "slot16.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                slot17.slotType = _arg_1;
            }, "slot17.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                runButton.label = _arg_1;
            }, "runButton.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                takeButton.label = _arg_1;
            }, "takeButton.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                hideBtn.label = _arg_1;
            }, "hideBtn.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                autoNextCheckBox.label = _arg_1;
            }, "autoNextCheckBox.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                autoCheckBox.label = _arg_1;
            }, "autoCheckBox.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fastCheckBox.label = _arg_1;
            }, "fastCheckBox.label");
            result[23] = binding;
            return (result);
        }

        public function set slot17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        override public function hide():void
        {
            if (!visible)
            {
                return;
            };
            autoNextCheckBox.selected = false;
            autoCheckBox.selected = false;
            fastCheckBox.selected = false;
            take();
            super.hide();
        }

        public function set slot14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
        }

        public function set runButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1298695779runButton;
            if (_local_2 !== _arg_1)
            {
                this._1298695779runButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runButton", _local_2, _arg_1));
            };
        }

        public function set fastCheckBox(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._958086113fastCheckBox;
            if (_local_2 !== _arg_1)
            {
                this._958086113fastCheckBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fastCheckBox", _local_2, _arg_1));
            };
        }

        public function set slot10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        public function set slot12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get autoCheckBox():CheckBox
        {
            return (this._1363002994autoCheckBox);
        }

        public function set slot16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        public function set hideBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._912591290hideBtn;
            if (_local_2 !== _arg_1)
            {
                this._912591290hideBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hideBtn", _local_2, _arg_1));
            };
        }

        public function __runButton_click(_arg_1:MouseEvent):void
        {
            run();
        }

        private function run():void
        {
            if (((slot1) && (slot1.slotData)))
            {
                t = new Timer(10, 1);
                t.addEventListener(TimerEvent.TIMER_COMPLETE, stop);
                t.start();
                runFlag = true;
                runButton.enabled = false;
                takeButton.enabled = false;
                hideBtn.enabled = false;
            };
        }

        private function take():void
        {
            if (((this[("slot" + n)]) && (this[("slot" + n)].slotData)))
            {
                if ((((uic) && (mvc)) && (uic.getChildIndex(mvc) >= 0)))
                {
                    uic.removeChild(mvc);
                    mvc = null;
                };
                if (((uic) && (this[("slot" + n)].getChildIndex(uic) >= 0)))
                {
                    this[("slot" + n)].removeChild(uic);
                    uic = null;
                };
                _core.remote.call("treasureTake", new Responder(onTake), runFlag);
                takeButton.enabled = false;
            };
        }

        override public function initialize():void
        {
            var target:Treasure;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _Treasure_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TreasureWatcherSetupUtil");
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

        public function useFlag():Boolean
        {
            if ((((visible) && (tData)) && (tData.l)))
            {
                return (true);
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get takeButton():BasicGlowButton
        {
            return (this._1603303783takeButton);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():ItemSlot
        {
            return (this._899454817slot12);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():ItemSlot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get slot14():ItemSlot
        {
            return (this._899454815slot14);
        }

        [Bindable(event="propertyChange")]
        public function get slot15():ItemSlot
        {
            return (this._899454814slot15);
        }

        private function viewClear():void
        {
            tData = null;
            currentNum = 17;
            n = 17;
            runFlag = false;
            totalTimes = 1;
            var _local_1:int = 1;
            while (_local_1 <= 17)
            {
                this[("slot" + _local_1)].clean();
                this[("slot" + _local_1)].filters = [];
                this[("slot" + _local_1)].setStyle("borderColor", 0);
                _local_1++;
            };
            if (((!(autoCheckBox.selected)) && (!(fastCheckBox.selected))))
            {
                takeButton.enabled = true;
                runButton.enabled = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot17():ItemSlot
        {
            return (this._899454812slot17);
        }

        [Bindable(event="propertyChange")]
        public function get runButton():BasicGlowButton
        {
            return (this._1298695779runButton);
        }

        [Bindable(event="propertyChange")]
        public function get slot11():ItemSlot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get slot16():ItemSlot
        {
            return (this._899454813slot16);
        }

        [Bindable(event="propertyChange")]
        public function get slot10():ItemSlot
        {
            return (this._899454819slot10);
        }

        public function onTs(_arg_1:Object):void
        {
            tData = _arg_1;
            visible = true;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            updateView();
        }

        [Bindable(event="propertyChange")]
        public function get hideBtn():BasicGlowButton
        {
            return (this._912591290hideBtn);
        }

        override public function initView():void
        {
            updateView();
        }

        public function __hideBtn_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (!_arg_1)
            {
                viewClear();
            };
            super.visible = _arg_1;
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

        public function set slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set slot6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
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

        public function set autoCheckBox(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1363002994autoCheckBox;
            if (_local_2 !== _arg_1)
            {
                this._1363002994autoCheckBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoCheckBox", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2():ItemSlot
        {
            return (this._109532660slot2);
        }

        [Bindable(event="propertyChange")]
        public function get slot3():ItemSlot
        {
            return (this._109532661slot3);
        }

        [Bindable(event="propertyChange")]
        public function get slot5():ItemSlot
        {
            return (this._109532663slot5);
        }

        [Bindable(event="propertyChange")]
        public function get slot6():ItemSlot
        {
            return (this._109532664slot6);
        }

        [Bindable(event="propertyChange")]
        public function get slot7():ItemSlot
        {
            return (this._109532665slot7);
        }

        public function set slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

