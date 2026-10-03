// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.IItemContainer

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.game.object.SceneItem;
    import flash.display.DisplayObject;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.game.object.Npc;

    public interface IItemContainer 
    {

        function addS(_arg_1:SceneItem):DisplayObject;
        function sortChildren():void;
        function addC(_arg_1:Charactor):DisplayObject;
        function removeAll():void;
        function addN(_arg_1:Npc):DisplayObject;
        function sortNeighbour(_arg_1:int):void;

    }
}//package com.qeedoo.ui.view.compGameStage

