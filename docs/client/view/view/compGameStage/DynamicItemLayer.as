// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.DynamicItemLayer

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.game.object.Building;
    import flash.display.DisplayObject;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.object.Npc;
    import com.qeedoo.game.object.SceneItem;

    public class DynamicItemLayer extends DynamicItemContainer implements IItemContainer 
    {


        public function addB(_arg_1:Building):DisplayObject
        {
            var _local_2:BuildingView = new BuildingView();
            _local_2.gameObject = _arg_1;
            _local_2.container = this;
            return (_local_2);
        }

        public function addView(_arg_1:DisplayObject):void
        {
            addChild(_arg_1);
        }

        public function removeView(_arg_1:DisplayObject):void
        {
            removeChild(_arg_1);
        }

        public function addN(_arg_1:Npc):DisplayObject
        {
            var _local_2:Core = Core.getInstance();
            var _local_3:NPCView = (_local_2.view.getN(_arg_1.id) as NPCView);
            var _local_4:NPCView;
            if (_local_3 == null)
            {
                _local_4 = new NPCView();
            }
            else
            {
                _local_4 = _local_3;
            };
            _local_4.gameObject = _arg_1;
            _local_4.container = this;
            return (_local_4);
        }

        public function addS(_arg_1:SceneItem):DisplayObject
        {
            var _local_2:SceneItemView = new SceneItemView();
            _local_2.gameObject = _arg_1;
            _local_2.container = this;
            return (_local_2);
        }

        public function removeAll():void
        {
            var _local_1:Object;
            for each (_local_1 in getChildren())
            {
                _local_1.destroy();
            };
            removeAllChildren();
        }


    }
}//package com.qeedoo.ui.view.compGameStage

