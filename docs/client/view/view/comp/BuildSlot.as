// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BuildSlot

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.event.GameEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.CloseEvent;
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

    public class BuildSlot extends Slot 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Slot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":105,
                    "height":80
                });
            }
        });

        public function BuildSlot()
        {
            mx_internal::_document = this;
            this.width = 105;
            this.height = 80;
            this.movable = false;
            this.styleName = "CanvasBorder";
            this.addEventListener("creationComplete", ___BuildSlot_Slot1_creationComplete);
        }

        private function dClick(_arg_1:GameEvent):void
        {
            Alert.show(Language.BUILDSLOT_U[0], "", (Alert.YES | Alert.NO), null, handler);
        }

        public function ___BuildSlot_Slot1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function handler(_arg_1:CloseEvent):void
        {
            if (((!(_arg_1 == null)) && (!(_arg_1.detail == Alert.YES))))
            {
                return;
            };
            var _local_2:Object = slotData;
            var _local_3:Object = _core.view.getUI(ViewManager.PANEL_CONSTRUCTIONMANAGER).currentBuild;
            if (_local_3 == null)
            {
                Alert.show(Language.BUILDSLOT_U[1], "");
            };
            var _local_4:Object = GameData.d[GamePredef.TBL_BUILDING][_local_3.tid];
            if (_local_4 == null)
            {
                Alert.show(Language.BUILDSLOT_U[2], "");
            };
            if (ToolKit.isEqual(_local_4.type, GamePredef.TYPE_EXTEND_BUILD))
            {
                _core.remote.constructBuild(_local_3.id, _local_2.id, GamePredef.CREATE_BUILD, _core.player.posMapId);
            }
            else
            {
                if (ToolKit.isEqual(_local_4.type, GamePredef.TYPE_GUILD_BUILD))
                {
                    _core.remote.constructBuild(_local_3.id, _local_2.id, GamePredef.UPGRADE_BUILD, _core.player.posMapId);
                };
            };
            _core.view.getUI(ViewManager.PANEL_CONSTRUCTIONMANAGER).hide();
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function init():void
        {
            addEventListener(Slot.EVENT_SLOT_DCLICK, dClick);
        }

        override protected function rollOutHandler(_arg_1:Event):void
        {
            var _local_2:Array = filters;
            super.rollOutHandler(_arg_1);
            filters = _local_2;
        }

        override public function get selected():Boolean
        {
            return ((filters) && (filters.length > 0));
        }

        override public function set selected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
            }
            else
            {
                filters = [];
            };
        }

        override public function setStackMax():void
        {
        }


    }
}//package com.qeedoo.ui.view.comp

