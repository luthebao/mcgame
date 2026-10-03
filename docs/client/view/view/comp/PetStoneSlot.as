// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PetStoneSlot

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.DragEvent;
    import mx.utils.ObjectUtil;
    import com.qeedoo.game.event.GameDataEvent;
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

    public class PetStoneSlot extends Slot 
    {

        private var _skillId:int = -1;
        private var _sid:int = -1;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Slot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":34,
                    "height":34
                });
            }
        });

        public function PetStoneSlot()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
            this.styleName = "TransparentSlot";
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:PetStoneSlot;
            var _local_3:Object;
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as PetStoneSlot);
                if (_local_2 == this)
                {
                    return;
                };
                if (_local_2.slotType == this.slotType)
                {
                    return;
                };
                if (this.slotType == Slot.SLOT_PET_STONE_COMPO)
                {
                    _local_3 = _core.view.getUI(ViewManager.PANEL_PET_STONE);
                    if (_local_2.type != GamePredef.TBL_PET_STONE)
                    {
                        return;
                    };
                    if (_local_3)
                    {
                        _local_3.updatePetStoneCompoSlot(_local_2);
                    };
                };
                if (this.slotType == Slot.SLOT_PET_STONE_NORMAL)
                {
                    _local_3 = _core.view.getUI(ViewManager.PANEL_PET_STONE);
                    if (_local_2.type != GamePredef.TBL_PET_STONE)
                    {
                        return;
                    };
                    if (_local_3)
                    {
                        _local_3.updatePetStoneEnergySlot(_local_2, this);
                    };
                };
                if (this.slotType == Slot.SLOT_PET_STONE_RESOLVE)
                {
                    _local_3 = _core.view.getUI(ViewManager.PANEL_PET_STONE);
                    if (_local_2.type != GamePredef.TBL_PET_STONE)
                    {
                        return;
                    };
                    if (_local_3)
                    {
                        _local_3.updatePetStoneResolveSlot(_local_2);
                    };
                };
                if (((this.slotType == Slot.SLOT_PET_STONE_EQUIPT) && (_local_2.slotType == Slot.SLOT_PET_STONE_EQUIP_BAG)))
                {
                    _local_3 = _core.view.getUI(ViewManager.PANEL_PET_STONE);
                    if (_local_3)
                    {
                        _local_3.updatePetStoneSetEquipSlot(_local_2);
                    };
                };
                if (this.slotType == Slot.SLOT_PET_STONE_SET)
                {
                    _local_3 = _core.view.getUI(ViewManager.PANEL_PET_STONE);
                    if (_local_2.type != GamePredef.TBL_PET_STONE)
                    {
                        return;
                    };
                    if (_local_3)
                    {
                        _local_3.setPetStone(_local_2, this);
                    };
                };
                if (this.slotType == Slot.SLOT_PET_STONE_CHANGE_SKILL)
                {
                    _local_3 = _core.view.getUI(ViewManager.PANEL_PET_STONE);
                    if (_local_2.type != GamePredef.TBL_PET_STONE)
                    {
                        return;
                    };
                    if (_local_3)
                    {
                        _local_3.updateChangeSkill(_local_2);
                    };
                };
            };
        }

        override public function clean():void
        {
            super.clean();
            _sid = -1;
            _skillId = -1;
        }

        public function get sid():int
        {
            return (_sid);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        override protected function showTempToolTip(_arg_1:int, _arg_2:Boolean=false):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            if (_core.data.hasData(_type, _itemId))
            {
                _local_6 = _core.data.getGameData(_type, _itemId);
                _local_4 = ObjectUtil.copy(_local_6);
                _local_5 = {};
                _local_5.slotType = _slotType;
                _local_5.type = BasicToolTip.TYPE_TEMP;
                _local_5.btnVisible = false;
                _local_5.soulActived = false;
                _local_5.inst = null;
                _local_5.temp = _local_4;
                _local_5.skillId = _skillId;
                _toolTip = getToolTip();
                _toolTip.object = _local_5;
                _toolTip.show();
            }
            else
            {
                if (_arg_2)
                {
                    return;
                };
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _type) + "_") + _itemId), dataLoaded);
                _core.data.getGameData(_type, _itemId);
            };
        }

        public function set skillId(_arg_1:int):void
        {
            _skillId = _arg_1;
        }

        public function get skillId():int
        {
            return (_skillId);
        }

        public function set sid(_arg_1:int):void
        {
            _sid = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.comp

