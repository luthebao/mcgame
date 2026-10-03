// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MapCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import flash.geom.Point;
    import mx.core.UIComponent;
    import mx.controls.ToolTip;
    import flash.display.Bitmap;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.events.ToolTipEvent;
    import com.qeedoo.game.object.Npc;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compGameStage.SceneItemView;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.display.DisplayObject;

    public class MapCanvas extends Canvas 
    {

        private static const MINIMAP_WIDTH:int = 405;
        private static const MINIMAP_HEIGHT:int = 320;
        private static const MINIMAP_CENTERX:int = 60;
        private static const MINIMAP_CENTERY:int = 55;

        private var localizer:Point;
        private var canvasMiniMap:UIComponent;
        private var tip:ToolTip;
        private var oldMid:int;
        private var iconNpcContainer:Canvas;
        private var iconPlayer:MapIcon;
        private var imgMiniMap:Bitmap;
        public var mid:int;
        private var ipIdArray:Array;
        private var npcIdArray:Array;
        private var iconIpContainer:Canvas;
        private var _scaleX:Number;
        private var _scaleY:Number;

        private var _core:Core = Core.getInstance();
        private var npcIconList:Object = {};

        public function MapCanvas()
        {
            addChildrens();
            layoutChildrens();
            addEventHandlers();
        }

        private function addNpc(_arg_1:Object):void
        {
            var _local_2:Object = _core.getNpc(_arg_1.id);
            if (!_local_2)
            {
                trace("MapCanvas:addNpc Calllater ");
                return;
            };
            if (_local_2.miniMap != 1)
            {
                return;
            };
            if (((_local_2.npcType == GamePredef.NPC_TYPE_MAT) || (_local_2.npcType == GamePredef.NPC_TYPE_PLAN)))
            {
                return;
            };
            var _local_3:MapIcon = new MapIcon();
            npcIconList[id] = _local_3;
            if (((_local_2.state >= GamePredef.ST_QUEST_CANTAKE) && (_local_2.state <= GamePredef.ST_QUEST_CANFINISH)))
            {
                switch (_local_2.state)
                {
                    case GamePredef.ST_QUEST_CANTAKE:
                        _local_3.styleName = "CanvasMapQGetAble";
                        break;
                    case GamePredef.ST_QUEST_ISTAKE:
                        _local_3.styleName = "CanvasMapQFinishing";
                        break;
                    case GamePredef.ST_QUEST_CANFINISH:
                        _local_3.styleName = "CanvasMapQFinished";
                };
            }
            else
            {
                switch (_local_2.npcType)
                {
                    case 2:
                        _local_3.styleName = "CanvasMapTrade";
                        break;
                    case 3:
                        if (_core.lineInfo.auction)
                        {
                            _local_3.styleName = "CanvasMapMail";
                        }
                        else
                        {
                            _local_3.visible = false;
                        };
                        break;
                    case 5:
                        if (_core.lineInfo.auction)
                        {
                            _local_3.styleName = "CanvasMapTrade";
                        }
                        else
                        {
                            _local_3.visible = false;
                        };
                        break;
                    case 8:
                        _local_3.styleName = "CanvasMapTreatment";
                        break;
                    case 9:
                        _local_3.styleName = "CanvasMapSend";
                        break;
                    case 10:
                        _local_3.styleName = "CanvasMapBattle";
                        break;
                    default:
                        _local_3.styleName = "CanvasMapDialogue";
                };
            };
            _local_3.itemId = _local_2.id;
            _local_3.x = ((_local_2.posX * _scaleX) - 10);
            _local_3.y = ((_local_2.posY * _scaleY) - 10);
            iconNpcContainer.addChild(_local_3);
            _local_3.toolTip = ((((((((Language.MAPCANVAS_S[2] + _local_2.name) + "\r") + Language.MAPCANVAS_S[3]) + int((_local_2.posX / 10))) + ",") + int((_local_2.posY / 10))) + "\r") + Language.MAPCANVAS_S[4]);
            _local_3.toolTip = (_local_3.toolTip + ((GamePredef.NPC_TYPE_NAME[_local_2.npcType] != undefined) ? GamePredef.NPC_TYPE_NAME[_local_2.npcType] : Language.MAPCANVAS_S[5]));
        }

        private function addEventHandlers():void
        {
            addEventListener(MouseEvent.MOUSE_MOVE, showLocal);
            addEventListener(MouseEvent.MOUSE_OUT, hideLocal);
            canvasMiniMap.addEventListener(MouseEvent.CLICK, clickHandler);
            iconNpcContainer.addEventListener(MouseEvent.CLICK, clickHandler);
            iconIpContainer.addEventListener(MouseEvent.CLICK, clickHandler);
            iconPlayer.addEventListener(ToolTipEvent.TOOL_TIP_CREATE, createPlayerToolTip);
        }

        public function refreshNpc(_arg_1:Number):void
        {
            var _local_2:Npc = _core.getNpc(_arg_1);
            if (((_local_2) && (npcIconList[_arg_1])))
            {
                if (((_local_2.state >= GamePredef.ST_QUEST_CANTAKE) && (_local_2.state <= GamePredef.ST_QUEST_CANFINISH)))
                {
                    npcIconList[_arg_1].source = ResManager[("ICON_QUEST_STATE_" + _local_2.state)];
                }
                else
                {
                    npcIconList[_arg_1].source = ResManager.ICON_MINIMAP_NPC;
                };
            };
        }

        public function changeNpcVisible(_arg_1:Boolean):void
        {
            iconNpcContainer.visible = _arg_1;
            if (_arg_1)
            {
                iconNpcContainer.mouseEnabled = true;
            }
            else
            {
                iconNpcContainer.mouseEnabled = false;
            };
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
            var _local_2:Object = _arg_1.target;
            _local_2 = _local_2.parent;
            _core.clearTargets();
            if ((_local_2 is MapIcon))
            {
                _core.player.closeTo((iconNpcContainer.mouseX / _scaleX), (iconNpcContainer.mouseY / _scaleY));
                if (_local_2.type == GamePredef.TBL_SCENEITEM_INSTANCE)
                {
                    _core.targetIP = _core.view.getIP(_local_2.itemId);
                }
                else
                {
                    if (_local_2.type == GamePredef.TBL_NPC)
                    {
                        _core.targetNPC = _core.getNpc(_local_2.itemId);
                    };
                };
                return;
            };
            var _local_3:* = iconNpcContainer.mouseX;
            var _local_4:* = iconNpcContainer.mouseY;
            if (iconNpcContainer.mouseX < 20)
            {
                _local_3 = 20;
            };
            if (iconNpcContainer.mouseX > 380)
            {
                _local_3 = 380;
            };
            if (iconNpcContainer.mouseY < 20)
            {
                _local_4 = 20;
            };
            if (iconNpcContainer.mouseY > 280)
            {
                _local_4 = 280;
            };
            _core.player.routeTo((_local_3 / _scaleX), (_local_4 / _scaleY));
        }

        private function createPlayerToolTip(_arg_1:ToolTipEvent):void
        {
            _arg_1.currentTarget.toolTip = getPlayerToolTipText();
        }

        private function addIp(_arg_1:Object):void
        {
            var _local_2:MapIcon = new MapIcon();
            _local_2.type = GamePredef.TBL_SCENEITEM_INSTANCE;
            _local_2.itemId = _arg_1.id;
            _local_2.styleName = "CanvasMapSend";
            iconIpContainer.addChild(_local_2);
            _local_2.x = (((Number(_arg_1.posX) + (183 / 2)) * _scaleX) - 10);
            _local_2.y = (((Number(_arg_1.posY) + (136 / 2)) * _scaleY) - 5);
            _local_2.toolTip = (((((((Language.MAPCANVAS_S[0] + _arg_1.name) + "\r") + Language.MAPCANVAS_S[1]) + int((_arg_1.posX / 10))) + ",") + int((_arg_1.posY / 10))) + "\r");
        }

        public function set playerY(_arg_1:int):void
        {
            var _local_2:int = int(((canvasMiniMap.y + (_arg_1 * _scaleY)) - (iconPlayer.height / 2)));
            if (_local_2 != iconPlayer.y)
            {
                iconPlayer.y = _local_2;
            };
        }

        private function addChildrens():void
        {
            canvasMiniMap = new UIComponent();
            iconNpcContainer = new Canvas();
            iconIpContainer = new Canvas();
            iconIpContainer.mouseEnabled = false;
            iconPlayer = new MapIcon();
            iconPlayer.styleName = "CanvasMapSelf";
            localizer = new Point(MINIMAP_CENTERX, MINIMAP_CENTERY);
            tip = new ToolTip();
            tip.visible = false;
            addChild(canvasMiniMap);
            addChild(iconNpcContainer);
            addChild(iconIpContainer);
            addChild(iconPlayer);
            addChild(tip);
        }

        public function set playerX(_arg_1:int):void
        {
            var _local_2:int = int(((canvasMiniMap.x + (_arg_1 * _scaleX)) - (iconPlayer.width / 2)));
            if (_local_2 != iconPlayer.x)
            {
                iconPlayer.x = _local_2;
            };
        }

        private function layoutChildrens():void
        {
            localizer.x = MINIMAP_CENTERX;
            localizer.y = MINIMAP_CENTERY;
            iconPlayer.x = 10;
            iconPlayer.y = 239;
        }

        public function clear():void
        {
            clearNpc();
            clearIp();
        }

        private function hideLocal(_arg_1:MouseEvent):void
        {
            tip.visible = false;
        }

        public function get mapScaleY():Number
        {
            return (_scaleY);
        }

        public function clearNpc():void
        {
            npcIdArray = [];
            npcIconList = {};
            while (iconNpcContainer.numChildren > 0)
            {
                iconNpcContainer.removeChildAt(0);
            };
        }

        public function initView():void
        {
            if (oldMid != mid)
            {
                drawMap(_core.view.getUI(ViewManager.STAGE_MAIN).mapContainer);
                oldMid = mid;
            };
            clear();
            drawIcon();
            update();
        }

        public function update():void
        {
            var pt:Point;
            var newX:int;
            var newY:int;
            var pt1:Point;
            var pt2:Point;
            try
            {
                pt = new Point(_core.player.normalView.posX, _core.player.normalView.posY);
                newX = int(((canvasMiniMap.x + (pt.x * _scaleX)) - (iconPlayer.width / 2)));
                newY = int(((canvasMiniMap.y + (pt.y * _scaleY)) - (iconPlayer.height / 2)));
                pt1 = new Point(newX, newY);
                pt2 = new Point(iconPlayer.x, iconPlayer.y);
                if (Point.distance(pt1, pt2) > 2)
                {
                    iconPlayer.x = newX;
                    iconPlayer.y = newY;
                };
                iconPlayer.toolTip = ((((_core.player.name + " : ") + int((pt.x / 10))) + ",") + int((pt.y / 10)));
            }
            catch(e)
            {
                trace("updata error::");
            };
        }

        private function getPlayerToolTipText():String
        {
            return ((((_core.player.name + " : ") + int((_core.player.normalView.posX / 10))) + ",") + int((_core.player.normalView.posY / 10)));
        }

        public function clearIp():void
        {
            ipIdArray = [];
            while (iconIpContainer.numChildren > 0)
            {
                iconIpContainer.removeChildAt(0);
            };
        }

        public function get mapScaleX():Number
        {
            return (_scaleX);
        }

        private function drawIcon():void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_1:Object = _core.data.gameDataIndex[GamePredef.TBL_NPC][mid];
            if (_local_1)
            {
                for each (_local_3 in _local_1)
                {
                    addNpc(_local_3);
                };
            };
            var _local_2:Object = _core.data.gameDataIndex[GamePredef.TBL_SCENEITEM_INSTANCE][mid];
            if (_local_2)
            {
                for each (_local_4 in _local_2)
                {
                    _local_5 = _core.data.getGameData(GamePredef.TBL_SCENEITEM_TEMPLATE, _local_4.tid);
                    if (_local_5)
                    {
                        if (_local_5.type == SceneItemView.TYPE_TRANSPORT)
                        {
                            addIp(_local_4);
                        };
                    };
                };
            };
        }

        private function showLocal(_arg_1:MouseEvent):void
        {
            var _local_2:int;
            var _local_3:int;
            if (((mouseX == _arg_1.localX) && (mouseY == _arg_1.localY)))
            {
                tip.visible = true;
                _local_2 = int(((_arg_1.localX / _scaleX) / 10));
                _local_3 = int(((_arg_1.localY / _scaleY) / 10));
                tip.text = ((_local_2 + ",") + _local_3);
                tip.x = (_arg_1.localX + 10);
                tip.y = (_arg_1.localY + 20);
                if ((tip.x + tip.width) > width)
                {
                    tip.x = ((tip.x - tip.width) - 10);
                };
                if ((tip.y + tip.height) > height)
                {
                    tip.y = ((tip.y - tip.height) - 20);
                };
            }
            else
            {
                tip.visible = false;
            };
        }

        private function drawMap(_arg_1:DisplayObject):void
        {
            visible = false;
            if (((!(imgMiniMap == null)) && (imgMiniMap.parent)))
            {
                imgMiniMap.parent.removeChild(imgMiniMap);
                imgMiniMap = null;
            };
            var _local_2:Object = _core.data.gameData[GamePredef.TBL_MAP][mid];
            _scaleX = (MINIMAP_WIDTH / _local_2.width);
            _scaleY = _scaleX;
            var _local_3:BitmapData = new BitmapData(MINIMAP_WIDTH, (_local_2.height * _scaleY));
            _local_3.draw(_arg_1, new Matrix(_scaleX, 0, 0, _scaleY));
            imgMiniMap = new Bitmap(_local_3);
            canvasMiniMap.addChild(imgMiniMap);
            width = imgMiniMap.width;
            height = imgMiniMap.height;
            iconNpcContainer.width = width;
            iconNpcContainer.height = height;
            callLater(show);
        }

        public function changeIpVisible(_arg_1:Boolean):void
        {
            iconIpContainer.visible = _arg_1;
        }

        private function show():void
        {
            visible = true;
        }


    }
}//package com.qeedoo.ui.view.comp

