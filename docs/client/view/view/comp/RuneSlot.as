// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RuneSlot

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.ui.view.compDragable.DecorateLogic;
    import flash.net.Responder;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import mx.events.DragEvent;
    import mx.events.FlexEvent;

    public class RuneSlot extends Slot 
    {

        public static const CHA_RUNE_SET:uint = 0;
        public static const PET_RUNE_SET:uint = 1;

        public var conBagSlot:Boolean = false;
        public var runeChaBagPos:int = -1;
        public var runePetHolePos:int = -1;
        public var runePetBagPos:int = -1;
        public var runeChaHolePos:int = -1;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Slot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":40,
                    "height":40
                });
            }
        });
        public var decoPosition:int = 0;

        public function RuneSlot()
        {
            mx_internal::_document = this;
            this.width = 40;
            this.height = 40;
            this.addEventListener("creationComplete", ___RuneSlot_Slot1_creationComplete);
        }

        private function updateDecoInfo(_arg_1:Object):void
        {
            DecorateLogic.updateDecoInfo(_arg_1);
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:RuneSlot;
            var _local_3:int;
            var _local_4:int;
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as RuneSlot);
                if (_local_2 == this)
                {
                    trace("移动到原位置");
                    return;
                };
                if (_local_2.slotType == this.slotType)
                {
                    trace("同种背包移动");
                    return;
                };
                if (((_local_2.slotType == SLOT_RUNE_CHA) && (this.slotType == SLOT_RUNE_CHA_HOLE)))
                {
                    _core.remote.call("runeSet", new Responder(updateDecoInfo), _local_2.runeChaBagPos, this.runeChaHolePos, CHA_RUNE_SET, this.decoPosition);
                }
                else
                {
                    if (((_local_2.slotType == SLOT_RUNE_PET) && (this.slotType == SLOT_RUNE_PET_HOLE)))
                    {
                        _core.remote.call("runeSet", new Responder(updateDecoInfo), _local_2.runePetBagPos, this.runePetHolePos, PET_RUNE_SET, this.decoPosition);
                    }
                    else
                    {
                        if (((_local_2.slotType == SLOT_RUNE_CHA_HOLE) && (this.slotType == SLOT_RUNE_CHA)))
                        {
                            _core.remote.call("runeRemove", new Responder(updateDecoInfo), _local_2.runeChaHolePos, this.runeChaBagPos, CHA_RUNE_SET, _local_2.decoPosition);
                        }
                        else
                        {
                            if (((_local_2.slotType == SLOT_RUNE_PET_HOLE) && (this.slotType == SLOT_RUNE_PET)))
                            {
                                _core.remote.call("runeRemove", new Responder(updateDecoInfo), _local_2.runePetHolePos, this.runePetBagPos, PET_RUNE_SET, _local_2.decoPosition);
                            }
                            else
                            {
                                if (((_local_2.slotType == SLOT_RUNE_CHA) && (this.slotType == SLOT_RUNE_UP)))
                                {
                                    _core.remote.call("runeMove", null, _local_2.runeChaBagPos, -1, CHA_RUNE_SET);
                                }
                                else
                                {
                                    if (((_local_2.slotType == SLOT_RUNE_PET) && (this.slotType == SLOT_RUNE_UP)))
                                    {
                                        _core.remote.call("runeMove", null, _local_2.runePetBagPos, -1, PET_RUNE_SET);
                                    }
                                    else
                                    {
                                        if (((_local_2.slotType == SLOT_RUNE_UP) && (this.slotType == SLOT_RUNE_CHA)))
                                        {
                                            _local_3 = _local_2.giid;
                                            _local_4 = GameData.d[GamePredef.TBL_DECO_RUNE][_local_3]["kind"];
                                            if (_local_4 == 1)
                                            {
                                                _core.remote.call("runeMove", null, -1, this.runeChaBagPos, CHA_RUNE_SET);
                                            }
                                            else
                                            {
                                                Alert.show(Language.DECORATE_PANEL[49]);
                                            };
                                        }
                                        else
                                        {
                                            if (((_local_2.slotType == SLOT_RUNE_UP) && (this.slotType == SLOT_RUNE_PET)))
                                            {
                                                _local_3 = _local_2.giid;
                                                _local_4 = GameData.d[GamePredef.TBL_DECO_RUNE][_local_3]["kind"];
                                                if (_local_4 == 2)
                                                {
                                                    _core.remote.call("runeMove", null, -1, this.runePetBagPos, PET_RUNE_SET);
                                                }
                                                else
                                                {
                                                    Alert.show(Language.DECORATE_PANEL[49]);
                                                };
                                            }
                                            else
                                            {
                                                Alert.show(Language.DECORATE_PANEL[49]);
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

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function ___RuneSlot_Slot1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function init():void
        {
            if (((this.slotType == SLOT_RUNE_CHA_HOLE) || (this.slotType == SLOT_RUNE_PET_HOLE)))
            {
                this.resetRuneSlotSetIconSize();
                this.setRuneSetNumText();
            }
            else
            {
                this.resetRuneSlotIconSize();
                this.setRuneNumText();
            };
            if (conBagSlot)
            {
                this.resetBagSlotIconSize();
                this.setBagNumText();
            };
        }


    }
}//package com.qeedoo.ui.view.comp

