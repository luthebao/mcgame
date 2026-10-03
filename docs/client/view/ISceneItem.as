// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.view.ISceneItem

package com.qeedoo.game.view
{
    import flash.events.IEventDispatcher;

    public interface ISceneItem extends IEventDispatcher 
    {

        function set x(_arg_1:Number):void;
        function set y(_arg_1:Number):void;
        function get x():Number;
        function get y():Number;
        function get yBase():int;

    }
}//package com.qeedoo.game.view

