// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TalentSlot

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.DragEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class TalentSlot extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var csid:Number = 0;
        public var sid:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":ItemSlot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":35,
                    "height":35
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TalentSlot()
        {
            mx_internal::_document = this;
            this.width = 35;
            this.height = 35;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TalentSlot._watcherSetupUtil = _arg_1;
        }


        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:TalentSlot;
            var _local_3:*;
            var _local_4:*;
            if (!acceptObj)
            {
                trace("普通拖放");
                super.dragDropHandler(_arg_1);
            };
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as TalentSlot);
                if (_local_2 == this)
                {
                    return;
                };
                if (((!(_local_2.sid)) || (!(_local_2.slotData))))
                {
                    return;
                };
                if (((((ToolKit.isSmallOrEqual(_local_2.sid, 10000)) && (ToolKit.isBigThan(this.sid, 10000))) && (ToolKit.isSmallOrEqual(this.sid, 60000))) && ((ToolKit.isEqual(Math.floor((this.sid % 10000)), 11)) || (ToolKit.isEqual(Math.floor((this.sid % 10000)), 10)))))
                {
                    if (((((_core.player) && (_core.player.petTalentData)) && (_core.player.petTalentData.inTal)) && (_core.player.petTalentData.inTal[this.sid])))
                    {
                        _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[19]);
                        return;
                    };
                    if (((_core.player) && (_core.player.petTalentData)))
                    {
                        if (((!(_core.player.petTalentData.tal)) || (!(_core.player.petTalentData.tal[this.sid]))))
                        {
                            _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[20]);
                            return;
                        };
                        _local_3 = _core.data.gameData[GamePredef.TBL_PET_TALENT][this.giid];
                        _local_4 = _core.data.gameData[GamePredef.TBL_PET_TALENT][_local_2.giid];
                        if ((((_local_3) && (_local_4)) && (ToolKit.isSmallThan(_local_3.lv, _local_4.lv))))
                        {
                            _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[21]);
                            return;
                        };
                        if ((((_local_3) && (_local_4)) && (ToolKit.isSmallThan(ToolKit.add(_local_3.sid, 10), _local_4.sid))))
                        {
                            _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[22]);
                            return;
                        };
                    };
                    _core.remote.call("fillTalentStone", null, _local_2.sid, this.sid, _local_2.giid);
                    return;
                };
                if ((((ToolKit.isSmallOrEqual(this.sid, 10000)) && (ToolKit.isBigThan(_local_2.sid, 10000))) && (ToolKit.isSmallOrEqual(_local_2.sid, 60000))))
                {
                    _core.remote.call("takeOffTalentStone", null, _local_2.sid, this.sid, _local_2.giid);
                    return;
                };
                if ((((ToolKit.isSmallOrEqual(this.sid, 10000)) && (ToolKit.isSmallOrEqual(_local_2.sid, 10000))) && (_local_2.slotData)))
                {
                    _core.remote.call("moveStoneBagToBag", null, _local_2.sid, this.sid);
                    return;
                };
                if (((ToolKit.isSmallOrEqual(_local_2.sid, 10000)) && (ToolKit.isBigThan(this.sid, 60000))))
                {
                    slotData = _local_2.slotData;
                    type = _local_2.type;
                    giid = _local_2.giid;
                    csid = _local_2.sid;
                    if (this.showStackNum)
                    {
                        stackNum = _local_2.stackNum;
                    };
                };
                return;
            };
        }

        private function _TalentSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SLOT_TALENT;
        }

        override public function initialize():void
        {
            var target:TalentSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TalentSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TalentSlotWatcherSetupUtil");
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

        private function _TalentSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

