// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.BuildingView

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Menu;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.events.MenuEvent;
    import mx.core.Application;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.utils.ObjectUtil;
    import com.qeedoo.game.object.Building;

    public class BuildingView extends CreatureView 
    {

        public var online:Boolean = true;
        private var _core:Core = Core.getInstance();

        public function BuildingView()
        {
            _textName.textColor = 13434828;
        }

        public function showNewBuildManager():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_CONSTRUCTIONMANAGER);
            _local_1.showNewBuild(this.gameObject);
        }

        private function showMenu(_arg_1:Object):void
        {
            var _local_4:*;
            var _local_5:Menu;
            var _local_2:Array = new Array();
            var _local_3:Object;
            for (_local_4 in _arg_1)
            {
                if (!isNaN(Number(_local_4)))
                {
                    if (_arg_1[_local_4] != null)
                    {
                        _local_3 = _arg_1[_local_4];
                        _local_2.push({
                            "label":_local_3.name,
                            "func":_local_3.func,
                            "bid":_local_3.bid
                        });
                    };
                };
            };
            _local_5 = CustomMenu.createMenu(null, _local_2);
            _local_5.addEventListener(MenuEvent.ITEM_CLICK, menuClickListener);
            _local_5.show(Application.application.stage.mouseX, Application.application.stage.mouseY);
        }

        public function showBuildProgress():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_BUILDPROCESS);
            _local_1.showBuild(this.gameObject);
        }

        public function onClick(_arg_1:Object):void
        {
            showMenu(_arg_1);
        }

        override protected function checkVisible(_arg_1:TimerEvent):void
        {
            if (((!(_deleted)) && (online)))
            {
                visible = true;
                if (_sprite)
                {
                    _sprite.play();
                };
            }
            else
            {
                visible = false;
                if (_sprite)
                {
                    _sprite.stop();
                };
            };
        }

        override protected function resLoadCompleteHandler(_arg_1:Event):void
        {
            super.resLoadCompleteHandler(_arg_1);
        }

        public function showUpgradeManager():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_CONSTRUCTIONMANAGER);
            _local_1.showUpgradeBuild(this.gameObject);
        }

        override protected function mouseOverHandler(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        override protected function mouseDownHandler(_arg_1:MouseEvent):void
        {
        }

        public function reloadBuild(_arg_1:Object):void
        {
            var _local_2:int = _arg_1.tid;
            var _local_3:* = GameData.d[GamePredef.TBL_BUILDING][_local_2];
            var _local_4:* = ObjectUtil.copy(_local_3);
            _local_4.posX = _arg_1.posX;
            _local_4.posY = _arg_1.posY;
            _local_4.posDir = _arg_1.posDir;
            _local_4.tid = _arg_1.tid;
            _local_4.id = _arg_1.id;
            _local_4.layer = _arg_1.layer;
            _local_4.buildState = _arg_1.buildState;
            var _local_5:Building = new Building();
            _local_5.data = _local_4;
            this.gameObject = _local_5;
        }

        public function clickBuilding():void
        {
            _core.remote.clickBuild(gameObject.id, gameObject.type);
        }

        private function menuClickListener(_arg_1:MenuEvent):void
        {
            if (_arg_1.item != null)
            {
                _core.remote.execBuildFunc(_arg_1.item.func, _arg_1.item.bid, gameObject.type);
            };
        }

        public function showBuildInfo():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_BUILDINFO);
            _local_1.showBuild(this.gameObject);
        }


    }
}//package com.qeedoo.ui.view.compGameStage

