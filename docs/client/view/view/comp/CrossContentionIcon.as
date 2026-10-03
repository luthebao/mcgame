// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CrossContentionIcon

package com.qeedoo.ui.view.comp
{
    import mx.controls.Image;
    import com.qeedoo.game.system.Core;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compDragable.CrossContentionSinglePanel;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
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

    public class CrossContentionIcon extends Image 
    {

        public static var iconUrls:Array = [4130220000303, 4130220000304, 4130220000305, 4130220000306, 4130220000307, 4130220000308];

        public var index:int = 0;
        public var iconUrl:Number = 0;
        public var isBoss:Boolean = false;
        private var _core:Core = Core.getInstance();
        private var _showTip:Boolean;

        public function CrossContentionIcon()
        {
            this.width = 120;
            this.height = 120;
            this.scaleContent = false;
            this.addEventListener("rollOver", ___CrossContentionIcon_Image1_rollOver);
            this.addEventListener("rollOut", ___CrossContentionIcon_Image1_rollOut);
            this.addEventListener("click", ___CrossContentionIcon_Image1_click);
        }

        private function showTip(_arg_1:int):void
        {
        }

        public function ___CrossContentionIcon_Image1_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
            beUnSelected();
        }

        public function ___CrossContentionIcon_Image1_click(_arg_1:MouseEvent):void
        {
            showAlert();
        }

        public function showAlert(_arg_1:Boolean=true):void
        {
            var _local_2:Object;
            if (isBoss)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_BOSS_AREA);
                if (_local_2)
                {
                    _local_2.showPanel(index, CrossContentionSinglePanel.mData, iconUrl);
                    if (_arg_1)
                    {
                        _core.remote.call("crossContentionOpenPointPanel", null, index);
                    };
                };
                return;
            };
            if (!index)
            {
                return;
            };
            _local_2 = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_AREA);
            if (_local_2)
            {
                _local_2.areaId = index;
                _local_2.mapId = CrossContentionSinglePanel.mData.mid;
                _local_2.mapData = CrossContentionSinglePanel.mData;
                if (isBoss)
                {
                    _local_2.isBoss = true;
                }
                else
                {
                    _local_2.isBoss = false;
                };
                _local_2.showPanel(CrossContentionSinglePanel.mData, iconUrl);
                if (_arg_1)
                {
                    _core.remote.call("crossContentionOpenPointPanel", null, index);
                };
            };
        }

        private function showInfo():void
        {
            var _local_1:Number;
            if (!isBoss)
            {
                if (((CrossContentionSinglePanel.mData) && (CrossContentionSinglePanel.mData.mid)))
                {
                    _local_1 = Number(CrossContentionSinglePanel.mData.mid);
                    toolTip = ((Language.CROSS_CONTENTION_PANEL_U[56].toString().replace("{name}", GamePredef.CROSS_CONTENTION_MAP[_local_1].name) + " ") + Language.CROSS_CONTENTION_PANEL_U[57].toString().replace("{id}", index));
                };
            }
            else
            {
                if (((CrossContentionSinglePanel.mData) && (CrossContentionSinglePanel.mData.mid)))
                {
                    _local_1 = Number(CrossContentionSinglePanel.mData.mid);
                    toolTip = ((Language.CROSS_CONTENTION_PANEL_U[56].toString().replace("{name}", GamePredef.CROSS_CONTENTION_MAP[_local_1].name) + " ") + Language.CROSS_CONTENTION_PANEL_U[57].toString().replace("{id}", index));
                };
            };
        }

        public function beSelected():void
        {
            var _local_1:Array = filters;
            _local_1.push(GamePredef.FILTER_ALLOW_SELECTED);
            filters = _local_1;
        }

        public function beUnSelected():void
        {
            refersh();
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function ___CrossContentionIcon_Image1_rollOver(_arg_1:MouseEvent):void
        {
            showInfo();
            beSelected();
        }

        public function refersh():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:Object;
            if (isBoss)
            {
                iconUrl = iconUrls[0];
                source = ResManager.getIconUrl(iconUrl);
            }
            else
            {
                _local_1 = GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[CrossContentionSinglePanel.MAP_ID]][index];
                iconUrl = iconUrls[_local_1.p];
                source = ResManager.getIconUrl(iconUrl);
            };
            if (isBoss)
            {
                _local_2 = CrossContentionSinglePanel.bossData;
                if (((((_local_2) && (_local_2.data)) && (_local_2.data[index])) && (_local_2.data[index].state == 2)))
                {
                    this.filters = [];
                }
                else
                {
                    ResManager.applyGray(this);
                };
            }
            else
            {
                _local_3 = CrossContentionSinglePanel.mData.mData[index];
                if (((!(_local_3)) || (!(_local_3.osid))))
                {
                    ResManager.applyGray(this);
                    return;
                };
                if (_local_3.osid)
                {
                    this.filters = [];
                };
            };
        }

        private function hideTip():void
        {
        }

        private function init():void
        {
        }


    }
}//package com.qeedoo.ui.view.comp

