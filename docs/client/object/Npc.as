// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.object.Npc

package com.qeedoo.game.object
{
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;

    public dynamic class Npc extends Charactor 
    {

        public var dotaData:Object;
        public var miniMap:int = 1;
        public var nid:Number;
        public var hulaData:Object;
        public var layer:int;
        public var funcInfo:String;
        private var _busy:Boolean = false;
        public var lv:int;
        public var subType:String;
        public var onServiceText:String;
        public var tripleNpc:Object;
        public var shopId:int;
        public var rf:Number;
        public var npcType:int;
        public var v:int = 1;
        public var fd:int = -1;
        public var mirror:int;

        public function Npc()
        {
            type = GamePredef.TBL_NPC;
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            npcType = _arg_1.type;
            type = GamePredef.TBL_NPC;
        }

        override public function get state():int
        {
            if (view)
            {
                return (view.state);
            };
            return (0);
        }

        public function set busy(_arg_1:Boolean):void
        {
            this._busy = _arg_1;
            if (_arg_1)
            {
                if (this.npcType == GamePredef.NPC_TYPE_WALK)
                {
                    this.state = GamePredef.ST_BATTLE;
                };
            }
            else
            {
                if (this.npcType == GamePredef.NPC_TYPE_WALK)
                {
                    this.state = GamePredef.ST_NORMAL;
                };
            };
        }

        public function get busy():Boolean
        {
            return (_busy);
        }

        override public function set state(_arg_1:int):void
        {
            var _local_2:Core;
            if (view)
            {
                view.state = _arg_1;
                _local_2 = Core.getInstance();
                _local_2.view.getUI(ViewManager.PANEL_MAP).refreshNpc(id);
            };
        }


    }
}//package com.qeedoo.game.object

