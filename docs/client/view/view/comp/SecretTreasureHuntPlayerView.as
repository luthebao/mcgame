// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SecretTreasureHuntPlayerView

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import com.qeedoo.game.object.Player;
    import com.qeedoo.ui.view.compGameStage.DynamicItemLayer;
    import com.qeedoo.ui.view.compGameStage.PlayerView;
    import com.qeedoo.effects.EnterFrameMove;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.resource.AbstractGameRes;
    import flash.events.Event;
    import com.qeedoo.effects.TimerMove;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class SecretTreasureHuntPlayerView extends Canvas 
    {

        private var winnerCharactor1:Player;
        public var _index:int = 0;
        private var layer:DynamicItemLayer;
        private var move_num:int = 0;
        private var winnerView1:PlayerView;
        private var moveHandler:EnterFrameMove;

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
        private var _core:Core = Core.getInstance();
        private var view:Object = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT);

        public function SecretTreasureHuntPlayerView()
        {
            mx_internal::_document = this;
            this.width = 190;
            this.height = 216;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function resetModel():void
        {
            if (winnerCharactor1)
            {
                winnerCharactor1.imgCode = 0;
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

        public function refresh(_arg_1:int):void
        {
            var _local_4:Array;
            _index = _arg_1;
            if (_arg_1 > 103)
            {
                _index = 103;
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
            var _local_3:String = GameData.d[GamePredef.TBL_MEVENT_MAP][_index].pos;
            _local_4 = _local_3.split(",");
            winnerCharactor1.imgCode = _local_2.imgCode;
            winnerCharactor1.classId = _local_2.classId;
            winnerCharactor1.resCode = _local_2.resCode;
            winnerCharactor1.name = _local_2.name;
            winnerCharactor1.wp = _local_2.wp;
            winnerCharactor1.ee = _local_2.ee;
            winnerCharactor1.ef = _local_2.ef;
            winnerCharactor1.star = _local_2.star;
            winnerCharactor1.dir = _local_4[2];
            x = _local_4[0];
            y = _local_4[1];
            view.setCanvasXY(x, y);
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

        private function moveStepEnd(_arg_1:Event):void
        {
            var _local_3:Array;
            var _local_2:String = GameData.d[GamePredef.TBL_MEVENT_MAP][_index].pos;
            _local_3 = _local_2.split(",");
            x = _local_3[0];
            y = _local_3[1];
            winnerView1.behavior(AbstractGameRes.BH_BREATH_SLOW);
            winnerCharactor1.dir = _local_3[2];
            winnerView1.faceTo(winnerCharactor1.dir);
            moveStep();
        }

        public function init():void
        {
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

        private function moveStep():void
        {
            if (move_num <= 0)
            {
                dispatchEvent(new Event("move_end"));
                return;
            };
            move_num--;
            _index++;
            if (!moveHandler)
            {
                moveHandler = new EnterFrameMove();
                moveHandler.stepLength = 10;
                moveHandler.target = this;
                moveHandler.addEventListener(TimerMove.EFFECT_END, moveStepEnd);
            };
            winnerView1.behavior(AbstractGameRes.BH_RUN_NORMAL);
            var _local_1:String = GameData.d[GamePredef.TBL_MEVENT_MAP][_index].pos;
            var _local_2:Array = _local_1.split(",");
            moveHandler.xBy = (_local_2[0] - x);
            moveHandler.yBy = (_local_2[1] - y);
            moveHandler.play();
            view.setCanvasXY(_local_2[0], _local_2[1]);
        }


    }
}//package com.qeedoo.ui.view.comp

