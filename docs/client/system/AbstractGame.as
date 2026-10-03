// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.system.AbstractGame

package com.qeedoo.game.system
{
    public class AbstractGame 
    {


        protected function createUI():void
        {
            throw (new Error("Abstract Function"));
        }

        protected function createStage():void
        {
            throw (new Error("Abstract Function"));
        }

        final public function initGame():void
        {
            createCore();
            createStage();
            createUI();
            loadConfig();
        }

        protected function createCore():void
        {
            throw (new Error("Abstract Function"));
        }

        protected function loadConfig():void
        {
            throw (new Error("Abstract Function"));
        }


    }
}//package com.qeedoo.game.system

