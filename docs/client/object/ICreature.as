// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.object.ICreature

package com.qeedoo.game.object
{
    public interface ICreature 
    {

        function set inBattle(_arg_1:Boolean):void;
        function closeTo(_arg_1:int, _arg_2:int):void;
        function walkTo(_arg_1:int, _arg_2:int):void;
        function set data(_arg_1:Object):void;
        function walk():void;
        function p2pWisper(_arg_1:String, _arg_2:Number, _arg_3:Number):void;
        function say(_arg_1:String, _arg_2:int):void;
        function wisper(_arg_1:String, _arg_2:String):void;
        function get inBattle():Boolean;
        function battleRouteTo(_arg_1:int, _arg_2:int):void;

    }
}//package com.qeedoo.game.object

