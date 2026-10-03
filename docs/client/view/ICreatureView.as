// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.view.ICreatureView

package com.qeedoo.game.view
{
    import flash.display.DisplayObject;
    import flash.events.Event;

    public interface ICreatureView extends ISceneItem 
    {

        function set colorCode(_arg_1:int):void;
        function set gameObject(_arg_1:Object):void;
        function get centerX():int;
        function get posX():int;
        function get posY():int;
        function set posX(_arg_1:int):void;
        function set state(_arg_1:int):void;
        function set posY(_arg_1:int):void;
        function get centerY():int;
        function get hitTestLayer():DisplayObject;
        function get isWalking():Boolean;
        function walk(_arg_1:Event):void;
        function get gameObject():Object;
        function behavior(_arg_1:int, _arg_2:int=0):void;
        function onSay(_arg_1:String):void;
        function get state():int;
        function stop():void;
        function emotion(_arg_1:Number):void;
        function walkTo(_arg_1:int, _arg_2:int):void;
        function faceTo(_arg_1:int, _arg_2:int=0):void;

    }
}//package com.qeedoo.game.view

