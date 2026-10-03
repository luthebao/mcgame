// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.ItemContainer

package com.qeedoo.ui.view.compGameStage
{
    import mx.core.UIComponent;
    import flash.display.Sprite;
    import com.qeedoo.game.object.Building;
    import flash.display.DisplayObject;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.ui.utils.AreaUtil;
    import com.qeedoo.game.object.Creature;
    import com.qeedoo.game.object.SceneItem;
    import com.qeedoo.game.object.Npc;
    import com.qeedoo.game.object.Pet;
    import com.qeedoo.ui.resource.ResManager;

    public class ItemContainer extends UIComponent implements IItemContainer 
    {

        private var lowerSkyLayer:Sprite;
        private var flyLayer:DynamicItemLayer;
        private var frontLayer:DynamicItemLayer;
        private var midLayer:DynamicItemLayer;
        private var backLayer:DynamicItemLayer;
        private var upperSkyLayer:Sprite;

        public function ItemContainer()
        {
            frontLayer = new DynamicItemLayer();
            backLayer = new DynamicItemLayer();
            midLayer = new DynamicItemLayer();
            lowerSkyLayer = new Sprite();
            flyLayer = new DynamicItemLayer();
            upperSkyLayer = new Sprite();
            frontLayer.mouseEnabled = false;
            frontLayer.mouseChildren = false;
            midLayer.mouseEnabled = false;
            backLayer.mouseEnabled = false;
            lowerSkyLayer.mouseEnabled = false;
            flyLayer.mouseEnabled = false;
            upperSkyLayer.mouseEnabled = false;
            addChild(backLayer);
            addChild(midLayer);
            addChild(frontLayer);
            addChild(lowerSkyLayer);
            addChild(flyLayer);
            addChild(upperSkyLayer);
        }

        public function addB(_arg_1:Building):DisplayObject
        {
            switch (Number(_arg_1.layer))
            {
                case 0:
                    return (backLayer.addB(_arg_1));
                case 1:
                    return (midLayer.addB(_arg_1));
                case 2:
                    return (frontLayer.addB(_arg_1));
            };
            return (null);
        }

        public function get middleLayer():DynamicItemLayer
        {
            return (midLayer);
        }

        public function sortChildren():void
        {
            frontLayer.sortChildren();
            backLayer.sortChildren();
            midLayer.sortChildren();
            flyLayer.sortChildren();
        }

        public function addC(_arg_1:Charactor):DisplayObject
        {
            var _local_2:DisplayObject;
            var _local_3:Core;
            if (_arg_1.flyingState == GamePredef.FLYING_STATE_ON_GROUND)
            {
                return (midLayer.addC(_arg_1));
            };
            _local_2 = flyLayer.addC(_arg_1);
            _local_3 = Core.getInstance();
            if (((_local_3.player) && (_local_3.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)))
            {
                _arg_1.normalView.scaleX = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
                _arg_1.normalView.scaleY = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
            };
            return (_local_2);
        }

        public function clearClouds(_arg_1:Boolean=true):void
        {
            AreaUtil.clearClouds(lowerSkyLayer, _arg_1);
            AreaUtil.clearClouds(upperSkyLayer, _arg_1);
        }

        public function removeAll():void
        {
            frontLayer.removeAll();
            backLayer.removeAll();
            midLayer.removeAll();
            flyLayer.removeAll();
            clearClouds(false);
        }

        public function switchC(_arg_1:Creature, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                if (midLayer.contains(DisplayObject(_arg_1.normalView)))
                {
                    midLayer.removeView(DisplayObject(_arg_1.normalView));
                    flyLayer.addView(DisplayObject(_arg_1.normalView));
                };
                _arg_1.normalView.container = flyLayer;
            }
            else
            {
                if (flyLayer.contains(DisplayObject(_arg_1.normalView)))
                {
                    flyLayer.removeView(DisplayObject(_arg_1.normalView));
                    midLayer.addView(DisplayObject(_arg_1.normalView));
                };
                _arg_1.normalView.container = midLayer;
                _arg_1.normalView.scaleX = 1;
                _arg_1.normalView.scaleY = 1;
            };
        }

        public function addS(_arg_1:SceneItem):DisplayObject
        {
            switch (Number(_arg_1.data.layer))
            {
                case 0:
                    return (backLayer.addS(_arg_1));
                case 1:
                    return (midLayer.addS(_arg_1));
                case 2:
                    return (frontLayer.addS(_arg_1));
            };
            return (null);
        }

        public function addN(_arg_1:Npc):DisplayObject
        {
            var _local_2:DisplayObject;
            var _local_3:Core;
            switch (Number(_arg_1.layer))
            {
                case 0:
                    return (backLayer.addN(_arg_1));
                case 1:
                    return (midLayer.addN(_arg_1));
                case 2:
                    return (frontLayer.addN(_arg_1));
                case 3:
                    _arg_1.flyingState = GamePredef.FLYING_STATE_IN_THE_AIR;
                    _local_2 = flyLayer.addN(_arg_1);
                    _local_3 = Core.getInstance();
                    if (((_local_3.player) && (_local_3.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)))
                    {
                        _local_2.scaleX = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
                        _local_2.scaleY = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
                    };
                    return (_local_2);
            };
            return (null);
        }

        public function addP(_arg_1:Pet):DisplayObject
        {
            var _local_3:DisplayObject;
            var _local_2:Core = Core.getInstance();
            if (((_local_2.getCharactor(_arg_1.cid).flyingState == GamePredef.FLYING_STATE_ON_GROUND) || (_local_2.getCharactor(_arg_1.cid).flyingState == GamePredef.FLYING_STATE_LANDING)))
            {
                _local_3 = midLayer.addP(_arg_1);
            }
            else
            {
                _arg_1.flyingState = GamePredef.FLYING_STATE_IN_THE_AIR;
                _local_3 = flyLayer.addP(_arg_1);
                if ((((_local_2.getCharactor(_arg_1.cid).flyingState == GamePredef.FLYING_STATE_IN_THE_AIR) || (_local_2.getCharactor(_arg_1.cid).flyingState == GamePredef.FLYING_STATE_PRE_LANDING)) || (_local_2.getCharactor(_arg_1.cid).flyingState == GamePredef.FLYING_STATE_TAKING_OFF)))
                {
                    if (((!(_local_2.player)) || (!(_local_2.player.flyingState == GamePredef.FLYING_STATE_ON_GROUND))))
                    {
                        _arg_1.normalView.scaleX = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
                        _arg_1.normalView.scaleY = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
                    };
                    _arg_1.normalView._body.y = -(GamePredef.FLIGHT_HEIGHT);
                    if (_arg_1.petTrendAction != GamePredef.PET_STOP_FLYING)
                    {
                        addPetCloud(_arg_1);
                    };
                };
            };
            if (_arg_1.petTrendAction == GamePredef.PET_BEGIN_FLYING)
            {
                addPetCloud(_arg_1);
            };
            return (_local_3);
        }

        public function addPetCloud(_arg_1:Pet):Pet
        {
            var _local_2:DisplayObject;
            _local_2 = new ((ResManager.VIEW_BATTLE_CLOUD as Class))();
            _local_2.x = -40;
            _local_2.y = -30;
            _arg_1.normalView._body.addChildAt(_local_2, 0);
            return (_arg_1);
        }

        public function get flyerLayer():DynamicItemLayer
        {
            return (flyLayer);
        }

        public function drawClouds(_arg_1:Boolean=true):void
        {
            AreaUtil.drawClouds(lowerSkyLayer, 300000, stage.width, stage.height, 0, 0, -300, -300, _arg_1);
            AreaUtil.drawClouds(upperSkyLayer, 300000, stage.width, stage.height, 0, 0, -300, -300, _arg_1);
        }

        public function sortNeighbour(_arg_1:int):void
        {
            throw (new Error("ItemContainer.sortNeighbour"));
        }

        public function applyZoomEffect(_arg_1:Number):void
        {
            var _local_2:Number;
            var _local_3:DisplayObject;
            if (flyLayer)
            {
                _local_2 = (1 + (((1 - _arg_1) * ((GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE) - 1)) / (1 - GamePredef.FLYING_ZOOM_RATE)));
                if (GamePredef.FLYING_ZOOM_RATE == 1)
                {
                    _local_2 = 1;
                };
                for each (_local_3 in flyLayer.getChildren())
                {
                    _local_3.scaleX = _local_2;
                    _local_3.scaleY = _local_2;
                };
            };
        }

        public function removePetCloud(_arg_1:Pet):void
        {
        }


    }
}//package com.qeedoo.ui.view.compGameStage

