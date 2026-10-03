// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlot

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
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

    public class ItemSlot extends Slot 
    {

        public var acceptObj:Object;
        private var _showStackNum:Boolean = true;
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

        public function ItemSlot()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
            this.styleName = "TransparentSlot";
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:Object;
            var _local_3:ItemSlot;
            var _local_4:Object;
            var _local_5:Boolean;
            if (!acceptObj)
            {
                trace("普通拖放");
                super.dragDropHandler(_arg_1);
                if ((((_arg_1.target.dropSlot) && (_arg_1.target.dropSlot.slotData)) && (_arg_1.target.dropSlot.slotData.tid == GamePredef.HP_ADD_BAG_ON_TRIAL)))
                {
                    _local_2 = _core.view.getUI(ViewManager.POP_NEW_PLAER_GUIDE);
                    if ((((_local_2) && (_local_2.visible)) && (_local_2._lastReference.className == "BagPanel")))
                    {
                        _local_2.hide();
                    };
                };
            }
            else
            {
                if (_arg_1.dragSource.hasFormat("slot"))
                {
                    _local_3 = (_arg_1.dragSource.dataForFormat("slot") as ItemSlot);
                    if (_local_3 == this)
                    {
                        return;
                    };
                    if (_local_3.slotType == SLOT_BAG)
                    {
                        _local_4 = _core.getTemplateData(_local_3.type, _local_3.giid);
                        _local_5 = checkAcceptObj(_local_4);
                        if (_local_5)
                        {
                            slotData = _local_3.slotData;
                            tempBagFlag = false;
                            type = _local_3.type;
                            giid = _local_3.giid;
                            if (_showStackNum)
                            {
                                stackNum = _local_3.stackNum;
                            };
                        };
                    }
                    else
                    {
                        if (_local_3.slotType == SLOT_TEMP_SLOT)
                        {
                            _local_4 = _core.getTemplateData(_local_3.type, _local_3.giid);
                            _local_5 = checkAcceptObj(_local_4);
                            if (_local_5)
                            {
                                _local_3.slotData.id = _local_3.posId;
                                slotData = _local_3.slotData;
                                tempBagFlag = true;
                                type = _local_3.type;
                                giid = _local_3.giid;
                                if (_showStackNum)
                                {
                                    stackNum = _local_3.stackNum;
                                };
                            };
                        };
                    };
                };
            };
        }

        protected function checkAcceptObj(_arg_1:Object):Boolean
        {
            var _local_3:Boolean;
            var _local_2:Boolean;
            if (_arg_1)
            {
                if (acceptObj)
                {
                    if (((acceptObj.kinds) && (acceptObj.kinds[_arg_1.kind])))
                    {
                        _local_2 = true;
                    };
                    if (acceptObj.types)
                    {
                        _local_3 = acceptObj.types[_arg_1.type];
                        _local_2 = ((acceptObj.kinds) ? ((_local_2) && (_local_3)) : _local_3);
                    };
                    if (acceptObj.ids)
                    {
                        _local_2 = ((_local_2) && (acceptObj.ids[_arg_1.id]));
                    };
                }
                else
                {
                    _local_2 = true;
                };
            };
            return (_local_2);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set showStackNum(_arg_1:Boolean):void
        {
            _showStackNum = _arg_1;
        }

        public function get showStackNum():Boolean
        {
            return (_showStackNum);
        }


    }
}//package com.qeedoo.ui.view.comp

