// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.object.SceneItem

package com.qeedoo.game.object
{
    import flash.display.DisplayObject;
    import com.qeedoo.game.config.Debug;

    public class SceneItem 
    {

        public var templateData:Object;
        public var data:Object;
        public var yBase:int;
        public var view:DisplayObject;

        public function SceneItem()
        {
            Debug.refObj(this);
        }

        public function get posY():int
        {
            return (data.posY);
        }

        public function get brightCode():int
        {
            return (data.brightCode);
        }

        public function get usedFlag():Boolean
        {
            return (Boolean(data.ownerId));
        }

        public function get name():String
        {
            return (data.name);
        }

        public function get resCode():Number
        {
            return (templateData.resCode);
        }

        public function get tid():int
        {
            return (data.tid);
        }

        public function get colorCode():int
        {
            return (data.colorCode);
        }

        public function get posX():int
        {
            return (data.posX);
        }

        public function get kind():int
        {
            return (templateData.kind);
        }

        public function get mapId():int
        {
            return (data.posMapId);
        }

        public function get posDir():int
        {
            return (data.posDir);
        }

        public function get type():int
        {
            return (templateData.type);
        }

        public function get id():int
        {
            return (data.id);
        }


    }
}//package com.qeedoo.game.object

