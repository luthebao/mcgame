// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotChaInfo

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.event.GameDataEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
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

    public class ItemSlotChaInfo extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":ItemSlot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":34,
                    "height":34
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ItemSlotChaInfo()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
            this.movable = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotChaInfo._watcherSetupUtil = _arg_1;
        }


        override public function showTooltip(_arg_1:Boolean=false):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            _local_3 = _core.getTemplateData(type, giid, false);
            var _local_5:Number = int(Number(id.slice(5)));
            if (_local_3)
            {
                if (_core.data.hasData(type, giid))
                {
                    _local_2 = _core.data.getGameData(type, giid);
                    _local_4 = {};
                    _local_4.type = BasicToolTip.TYPE_INST;
                    _local_4.btnVisible = false;
                    _local_4.soulActived = _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).equipActiveList[_local_5];
                    _local_4.inst = _local_2;
                    _local_4.temp = _local_3;
                    _toolTip = getToolTip();
                    _toolTip.object = _local_4;
                    if (((type == GamePredef.TBL_ITEM_INSTANCE) || (type == GamePredef.TBL_EQUIPT_INSTANCE)))
                    {
                        if (this.isInAuction)
                        {
                            _toolTip.currencyHide("temp");
                        }
                        else
                        {
                            _toolTip.currencyHide("inst");
                        };
                    };
                    _toolTip.show();
                }
                else
                {
                    _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + type) + "_") + giid), dataLoaded);
                    _core.data.getGameData(type, giid);
                };
            }
            else
            {
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + type) + "_") + giid), dataLoaded);
                _core.data.getGameData(type, giid);
            };
        }

        private function _ItemSlotChaInfo_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUIP);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:ItemSlotChaInfo;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotChaInfo_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotChaInfoWatcherSetupUtil");
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

        private function _ItemSlotChaInfo_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Slot.SLOT_EQUIP;
        }


    }
}//package com.qeedoo.ui.view.comp

