// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PetSoulSlot

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.events.DragEvent;
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

    public class PetSoulSlot extends SoulSlot 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SoulSlot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":65,
                    "height":65
                });
            }
        });
        private var _stype:int;
        public var acceptObj:Object;

        public function PetSoulSlot()
        {
            mx_internal::_document = this;
            this.width = 65;
            this.height = 65;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function setData(_arg_1:Object):void
        {
            acceptObj = _arg_1;
            if ((((acceptObj.state) && (acceptObj.soulId)) && (!(acceptObj.soulId == -1))))
            {
                this.movable = true;
            }
            else
            {
                this.movable = false;
            };
            if (((GameData.d[GamePredef.TBL_PET_SOUL][acceptObj.soulId]) && (GameData.d[GamePredef.TBL_PET_SOUL][acceptObj.soulId]["iconCode"])))
            {
                _iconCode = GameData.d[GamePredef.TBL_PET_SOUL][acceptObj.soulId]["iconCode"];
            }
            else
            {
                _iconCode = -1;
            };
            this.type = GamePredef.TBL_PET_SOUL;
            this.slotData = acceptObj;
            this.giid = Number(acceptObj.soulId);
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:PetSoulSlot;
            if (((!(acceptObj)) || (acceptObj.soulId < 0)))
            {
                trace("普通拖放");
                super.dragDropHandler(_arg_1);
            }
            else
            {
                if (this.state == 0)
                {
                    return;
                };
                if (_arg_1.dragSource.hasFormat("petSoulSlot"))
                {
                    _local_2 = (_arg_1.dragSource.dataForFormat("petSoulSlot") as PetSoulSlot);
                    if (_local_2 == this)
                    {
                        return;
                    };
                    switch (_local_2.slotType)
                    {
                        case SLOT_PET_SOUL:
                            if (_local_2.slotData.petId)
                            {
                                _core.remote.moveSoul(_local_2.index, index, _local_2.slotData.petId);
                            }
                            else
                            {
                                _core.remote.moveSoul(_local_2.index, index, -1);
                            };
                            return;
                        case SLOT_BAG_SOUL:
                            if (acceptObj.petId)
                            {
                                _core.remote.moveSoul(_local_2.index, index, acceptObj.petId);
                            }
                            else
                            {
                                _core.remote.moveSoul(_local_2.index, index, -1);
                            };
                            return;
                    };
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

