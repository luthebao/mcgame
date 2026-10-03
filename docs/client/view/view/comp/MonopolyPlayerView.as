// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MonopolyPlayerView

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.compGameStage.PlayerView;
    import com.qeedoo.game.object.Player;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.compGameStage.DynamicItemLayer;
    import com.qeedoo.effects.EnterFrameMove;
    import mx.core.mx_internal;
    import com.qeedoo.game.system.Core;
    import flash.events.Event;
    import com.qeedoo.effects.TimerMove;
    import com.qeedoo.game.resource.AbstractGameRes;
    import com.qeedoo.ui.view.compDragable.SummerGames;

    public class MonopolyPlayerView extends Canvas 
    {

        public var _index:int = 0;
        private var winnerView1:PlayerView;
        private var winnerCharactor1:Player;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":190,
                    "height":216
                });
            }
        });
        private var layer:DynamicItemLayer;
        private var moveHandler:EnterFrameMove;
        private var move_num:int = 0;

        public function MonopolyPlayerView()
        {
            mx_internal::_document = this;
            this.width = 190;
            this.height = 216;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public function resetModel():void
        {
            if (winnerCharactor1)
            {
                winnerCharactor1.imgCode = 0;
                winnerCharactor1.wingResCode = 0;
                winnerCharactor1.mountResCode = 0;
                winnerCharactor1.mountState = 0;
                winnerCharactor1.classId = 0;
                winnerCharactor1.dir = 0;
                winnerCharactor1.resCode = 0;
                winnerCharactor1.name = null;
                winnerCharactor1.wp = 0;
                winnerCharactor1.ee = 0;
                winnerCharactor1.ef = 0;
                winnerCharactor1.star = 0;
            };
            if (winnerView1)
            {
                winnerView1.visible = false;
            };
        }

        private function moveStep():void
        {
            if (move_num <= 0)
            {
                Core.getInstance().remote.call("monopolyBoxAward", null);
                dispatchEvent(new Event("move_end"));
                return;
            };
            move_num--;
            _index++;
            if (_index == 18)
            {
                Core.getInstance().remote.call("monopolyStartAward", null);
            };
            if (_index > 17)
            {
                _index = (_index - 18);
            };
            if (!moveHandler)
            {
                moveHandler = new EnterFrameMove();
                moveHandler.stepLength = 10;
                moveHandler.target = this;
                moveHandler.addEventListener(TimerMove.EFFECT_END, moveStepEnd);
            };
            winnerView1.behavior(AbstractGameRes.BH_RUN_NORMAL);
            moveHandler.xBy = (SummerGames.positions[_index][0] - x);
            moveHandler.yBy = (SummerGames.positions[_index][1] - y);
            moveHandler.play();
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function startMove(_arg_1:int):void
        {
            if (!winnerView1)
            {
                return;
            };
            move_num = _arg_1;
            moveStep();
        }

        public function refresh(_arg_1:int):void
        {
            _index = _arg_1;
            if (_index > 17)
            {
                _index = (_index % 18);
            };
            var _local_2:Player = Core.getInstance().player;
            if (!layer)
            {
                layer = new DynamicItemLayer();
                addChild(layer);
            };
            if (winnerCharactor1)
            {
                resetModel();
            }
            else
            {
                winnerCharactor1 = new Player();
            };
            winnerCharactor1.imgCode = _local_2.imgCode;
            winnerCharactor1.wingResCode = _local_2.wingResCode;
            winnerCharactor1.mountResCode = _local_2.mountResCode;
            winnerCharactor1.mountState = _local_2.mountState;
            winnerCharactor1.classId = _local_2.classId;
            winnerCharactor1.resCode = _local_2.resCode;
            winnerCharactor1.name = _local_2.name;
            winnerCharactor1.wp = _local_2.wp;
            winnerCharactor1.ee = _local_2.ee;
            winnerCharactor1.ef = _local_2.ef;
            winnerCharactor1.star = _local_2.star;
            winnerCharactor1.dir = SummerGames.positions[_index][2];
            x = SummerGames.positions[_index][0];
            y = SummerGames.positions[_index][1];
            if (!winnerView1)
            {
                winnerView1 = new PlayerView();
                winnerView1.addEventListener("monopoly_move_stop", moveStepEnd);
                winnerView1.container = layer;
                winnerCharactor1.normalView = winnerView1;
            };
            winnerView1.gameObject = winnerCharactor1;
            winnerView1.faceTo(winnerCharactor1.dir);
            winnerView1.visible = true;
            if (winnerCharactor1.wp)
            {
                winnerView1.equipOn(winnerCharactor1.resCode, winnerCharactor1.ee, winnerCharactor1.ef, winnerCharactor1.star, true);
            }
            else
            {
                winnerView1.equipOff(winnerCharactor1.resCode);
            };
        }

        public function init():void
        {
        }

        private function moveStepEnd(_arg_1:Event):void
        {
            x = SummerGames.positions[_index][0];
            y = SummerGames.positions[_index][1];
            winnerView1.behavior(AbstractGameRes.BH_BREATH_SLOW);
            winnerCharactor1.dir = SummerGames.positions[_index][2];
            winnerView1.faceTo(winnerCharactor1.dir);
            moveStep();
        }


    }
}//package com.qeedoo.ui.view.comp

