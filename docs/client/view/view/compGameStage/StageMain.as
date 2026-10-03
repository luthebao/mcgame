// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.StageMain

package com.qeedoo.ui.view.compGameStage
{
    import mx.core.UIComponent;
    import flash.display.Sprite;
    import flash.display.DisplayObjectContainer;
    import com.qeedoo.game.system.Core;
    import flash.display.Loader;
    import mx.effects.Fade;
    import mx.effects.Move;
    import com.qeedoo.game.ui.ISlot;
    import flash.utils.Timer;
    import flash.display.Stage;
    import com.qeedoo.ui.view.comp.ItemSlotTemp;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.CloseEvent;
    import com.adobe.crypto.MD5;
    import mx.events.DragEvent;
    import com.qeedoo.ui.resource.ResManager;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.events.Event;
    import flash.net.URLRequest;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.utils.MouseManager;
    import flash.display.LoaderInfo;
    import flash.display.Graphics;
    import mx.managers.DragManager;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import mx.effects.easing.Linear;
    import com.qeedoo.ui.view.compMain.ChatCanvas;
    import com.qeedoo.ui.view.compDragable.QuestGuide;
    import mx.events.EffectEvent;

    public class StageMain extends UIComponent 
    {

        private const TILE_WIDTH:int = 200;
        private const TILE_HEIGHT:int = 100;

        public var mapContainer:MapContainer;
        public var routeLayer:Sprite;
        private var _container:DisplayObjectContainer;
        private var _core:Core = Core.getInstance();
        private var _loadedTop:int;
        public var flyingZoomRate:Number = 1;
        private var itemContainer:ItemContainer;
        private var _frontEffectLayer:Sprite;
        private var _hitTestLoader:Loader;
        private var hitTestContainer:HitTestContainer;
        private var _maskLoader:Loader;
        private var fadeIn:Fade;
        private var fadeOut:Fade;
        private var _loadedLeft:int;
        private var mapMove:Move;
        public var mapCanvas:Sprite;
        private var backEffectLayer:Sprite;
        private var _mapData:Object;
        private var _dropSlot:ISlot;
        private var _loadedBottom:int;
        private var _loadedRight:int;
        private var _moveTimer:Timer;
        private var _stage:Stage;

        public function StageMain()
        {
            initEffects();
            addChildren();
            addView();
            initEventHandlers();
            alpha = 0;
            routeLayer = new Sprite();
            addChild(routeLayer);
        }

        private function dragDropHandler(event:DragEvent):void
        {
            var slot:ISlot;
            var obj:Object;
            var type:String;
            var sid:String;
            var view:Object;
            var _dropTempSlot:ItemSlotTemp;
            var ii:* = undefined;
            var dropTemp:Function;
            var delmxTempSlot:Function;
            var delTempSlot:Function;
            if (event.dragSource.hasFormat("slot"))
            {
                slot = (event.dragSource.dataForFormat("slot") as ISlot);
                _dropSlot = slot;
                if (_dropSlot.slotType == Slot.SLOT_BAG)
                {
                    obj = GameData.d[slot.type][slot.giid];
                    if ((((obj) && (obj.color)) && (obj.color > 2)))
                    {
                        if (_core.delPass)
                        {
                            Alert.show(Language.STAGEMAIN_S[0], "", (Alert.YES | Alert.NO), null, dropHandlerByDp);
                        }
                        else
                        {
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.SLOT_U[0], delSlot);
                        };
                    }
                    else
                    {
                        Alert.show(Language.STAGEMAIN_S[0], "", (Alert.YES | Alert.NO), null, dropHandler);
                    };
                };
                if (_dropSlot.slotType == Slot.SLOT_GUILD)
                {
                    Alert.show(Language.STAGEMAIN_S[0], "", (Alert.YES | Alert.NO), null, dropGuildHandler);
                };
                if (_dropSlot.slotType == Slot.SLOT_USERBAR)
                {
                    slot.clean();
                    type = slot["id"].slice(0, 1);
                    sid = slot["id"].slice(1);
                    if (type == "s")
                    {
                        _core.updateSettingNow(("sid" + sid), 0);
                    }
                    else
                    {
                        if ((Number(sid) % 2) == 0)
                        {
                            _core.updateSettingNow(("bs" + sid), 0, true);
                        }
                        else
                        {
                            _core.updateSettingNow(("bs" + sid), 0, false);
                        };
                    };
                };
                if (((_dropSlot.slotType == Slot.SLOT_PET_AI) || (_dropSlot.slotType == Slot.SLOT_FAIRY_CONFIG_RIGHT)))
                {
                    slot.clean();
                    view = ViewManager.getInstance().getUI(ViewManager.PANEL_FAIRY_SKILL_CONFIG);
                    if (view)
                    {
                        view.saveAlert = true;
                    };
                };
                if (_dropSlot.slotType == Slot.SLOT_TEMP_SLOT)
                {
                    _dropTempSlot = ItemSlotTemp(_dropSlot);
                    if ((((_dropTempSlot.posId) && (_dropTempSlot.posId > 0)) && (_dropTempSlot.slotData)))
                    {
                        ii = _dropTempSlot.slotData.ii;
                        if ((((ii >= 5375) && (ii <= 5697)) || ((ii >= 5770) && (ii <= 5841))))
                        {
                            dropTemp = function (_arg_1:CloseEvent):void
                            {
                                if (_arg_1.detail == Alert.YES)
                                {
                                    _core.remote.delmxTempSlot(_dropTempSlot.posId, _core.delPass);
                                    _dropSlot = null;
                                };
                            };
                            delmxTempSlot = function (_arg_1:*):void
                            {
                                var _local_2:String;
                                if (_arg_1)
                                {
                                    _local_2 = MD5.hash(_arg_1);
                                    _core.remote.delmxTempSlot(_dropTempSlot.posId, _local_2);
                                    _dropSlot = null;
                                };
                            };
                            if (_core.delPass)
                            {
                                Alert.show(Language.STAGEMAIN_S[0], "", (Alert.YES | Alert.NO), null, dropTemp);
                            }
                            else
                            {
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.SLOT_U[0], delmxTempSlot);
                            };
                            return;
                        };
                    };
                    if ((((_dropTempSlot.posId) && (_dropTempSlot.posId > 0)) && (_dropTempSlot.slotData)))
                    {
                        dropTemp = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.delTempSlot(_dropTempSlot.posId, _core.delPass);
                                _dropSlot = null;
                            };
                        };
                        delTempSlot = function (_arg_1:*):void
                        {
                            var _local_2:String;
                            if (_arg_1)
                            {
                                _local_2 = MD5.hash(_arg_1);
                                _core.remote.delTempSlot(_dropTempSlot.posId, _local_2);
                                _dropSlot = null;
                            };
                        };
                        if (_core.delPass)
                        {
                            Alert.show(Language.STAGEMAIN_S[0], "", (Alert.YES | Alert.NO), null, dropTemp);
                        }
                        else
                        {
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.SLOT_U[0], delTempSlot);
                        };
                    };
                };
            };
        }

        public function set brightCode(_arg_1:Number):void
        {
            ResManager.setBrightCode(this, _arg_1);
        }

        public function loadHitTestLayer(_arg_1:String):void
        {
            _hitTestLoader = new Loader();
            var _local_2:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
            _hitTestLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, hitTestLoadedHander);
            var _local_3:String = ResManager.hashNov((_arg_1 + "/MAP_HIT_NEW.swf"));
            _hitTestLoader.load(new URLRequest(_local_3), _local_2);
        }

        private function dropGuildHandler(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.dropGuildItem(_dropSlot.slotData.id);
                _dropSlot = null;
            };
        }

        public function enterScene(_arg_1:Object):void
        {
            _core.player.walkable = false;
            enabled = true;
            _mapData = _arg_1;
            brightCode = _arg_1.brightCode;
            colorCode = _arg_1.colorCode;
            width = _arg_1.width;
            height = _arg_1.height;
            x = ((stage.stageWidth / 2) - _core.player.posCenterX);
            y = ((stage.stageHeight / 2) - _core.player.posCenterY);
            if (x > 0)
            {
                x = 0;
            };
            if (x < (stage.stageWidth - width))
            {
                x = (stage.stageWidth - width);
            };
            if (y > 0)
            {
                y = 0;
            };
            if (y < (stage.stageHeight - height))
            {
                y = (stage.stageHeight - height);
            };
            _loadedLeft = 0;
            _loadedTop = 0;
            _loadedRight = width;
            _loadedBottom = height;
            var _local_2:Number = Number(_arg_1.type);
            var _local_3:String = ResManager.getResUrlNoHash(_arg_1.resCode);
            switch (_local_2)
            {
                case GamePredef.MAP_TYPE_NORMAL:
                case GamePredef.MAP_TYPE_SINGLE:
                    loadHitTestLayer(_local_3);
                    mapContainer.init(this, _local_3, width, height, _local_2);
                    hitTestContainer.visible = false;
                    break;
                case GamePredef.MAP_TYPE_TILE:
                    buildTile(_arg_1.id);
                    break;
                default:
                    Alert.show(" type error");
            };
            if ([521, 522, 523, 524, 525].indexOf(Number(_arg_1.id)) >= 0)
            {
                SeaBubbleView.getInstance().startBubble(true);
            };
            var _local_4:* = _core.view.getUI(ViewManager.SHADE_PVP);
            if (_local_4)
            {
                if (ToolKit.isEqual(_arg_1.id, 73))
                {
                    _local_4.showPVPShadePanel();
                };
            };
        }

        public function leaveScene():void
        {
            itemContainer.removeAll();
            hitTestContainer.removeAll();
            mapContainer.clear();
            _core.view.clearStage();
            visible = false;
            enabled = false;
            if ((((!(_mapData == null)) && ([521, 522, 523, 524, 525].indexOf(Number(_mapData.id)) >= 0)) || (SeaBubbleView.getInstance().isPlaying)))
            {
                SeaBubbleView.getInstance().startBubble(false);
            };
            var _local_1:* = _core.view.getUI(ViewManager.SHADE_PVP);
            if ((((!(_mapData == null)) && (_local_1)) && (_local_1.visible)))
            {
                _local_1.closePVPShadePanel();
            };
        }

        private function mouseUpHandler(_arg_1:MouseEvent):void
        {
            stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
            _moveTimer.stop();
            _moveTimer.removeEventListener(TimerEvent.TIMER, moveTimerHandler);
            if (MouseManager.checkClick())
            {
                _core.player.view.stop();
                _core.player.stop();
            };
        }

        public function centerPlayer():void
        {
            if (_core.player)
            {
                centerTo(_core.player.posX, _core.player.posY);
            };
        }

        public function globalCenterTo(_arg_1:Number, _arg_2:Number):void
        {
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:uint;
            var _local_8:uint;
            if (((_core.player) && ((_core.player.flyingState == GamePredef.FLYING_STATE_TAKING_OFF) || (_core.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR))))
            {
                _local_5 = 30;
                _local_6 = (GamePredef.APP_WIDTH - _local_5);
                _local_7 = 160;
                _local_8 = GamePredef.APP_HEIGHT;
                _arg_1 = ((_arg_1 >= _local_5) ? _arg_1 : _local_5);
                _arg_1 = ((_arg_1 <= _local_6) ? _arg_1 : _local_6);
                _arg_2 = ((_arg_2 >= _local_7) ? _arg_2 : _local_7);
                _arg_2 = ((_arg_2 <= _local_8) ? _arg_2 : _local_8);
            };
            var _local_3:Number = ((_arg_1 - x) / flyingZoomRate);
            var _local_4:Number = ((_arg_2 - y) / flyingZoomRate);
            if (_core.player)
            {
                _core.player.routeTo(_local_3, _local_4);
            }
            else
            {
                centerTo(_local_3, _local_4);
            };
        }

        public function get centerX():int
        {
            return ((GamePredef.APP_HALF_WIDTH - x) / flyingZoomRate);
        }

        private function hitTestLoadedHander(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = (_arg_1.target as LoaderInfo);
            var _local_3:String = _local_2.url;
            var _local_4:Array = _local_3.split("/");
            var _local_5:String = _local_4[(_local_4.length - 1)];
            _hitTestLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, hitTestLoadedHander);
            var _local_6:Sprite = (_hitTestLoader.content as Sprite);
            hitTestContainer.init(_local_6, _local_5);
            _hitTestLoader.unload();
        }

        private function mapReady(_arg_1:Event=null):void
        {
            _core.view.showAll(ViewManager.TYPE_MAIN);
            _core.view.initView(ViewManager.MAIN_MINIMAP);
            if (_core.player.flyingState == GamePredef.FLYING_STATE_ON_GROUND)
            {
                applyZoomEffect(1);
            }
            else
            {
                applyZoomEffect(GamePredef.FLYING_ZOOM_RATE);
                itemContainer.drawClouds(false);
            };
            centerPlayerImm();
            setCoreReady();
        }

        private function createHitTest(_arg_1:Object):void
        {
            var _local_4:int;
            var _local_5:Boolean;
            var _local_2:Graphics = hitTestContainer.graphics;
            var _local_3:int = -2;
            while (_local_3 < ((width / TILE_WIDTH) + 3))
            {
                _local_4 = -2;
                while (_local_4 < ((height / TILE_HEIGHT) + 3))
                {
                    _local_5 = false;
                    if ((((_arg_1[_local_3]) && (_arg_1[_local_3][_local_4])) && ((Number(_arg_1[_local_3][_local_4]) % 2) == 1)))
                    {
                        _local_5 = true;
                    };
                    if (!_local_5)
                    {
                        _local_2.beginFill(0xFF9900, 1);
                        if ((_local_4 % 2) == 0)
                        {
                            _local_2.moveTo(((TILE_WIDTH * _local_3) - (TILE_WIDTH / 2)), (((TILE_HEIGHT / 2) * _local_4) + (TILE_HEIGHT / 2)));
                            _local_2.lineTo((TILE_WIDTH * _local_3), ((TILE_HEIGHT / 2) * _local_4));
                            _local_2.lineTo(((TILE_WIDTH * _local_3) + (TILE_WIDTH / 2)), (((TILE_HEIGHT / 2) * _local_4) + (TILE_HEIGHT / 2)));
                            _local_2.lineTo((TILE_WIDTH * _local_3), (((TILE_HEIGHT / 2) * _local_4) + TILE_HEIGHT));
                            _local_2.lineTo(((TILE_WIDTH * _local_3) - (TILE_WIDTH / 2)), (((TILE_HEIGHT / 2) * _local_4) + (TILE_HEIGHT / 2)));
                        }
                        else
                        {
                            _local_2.moveTo((TILE_WIDTH * _local_3), (((TILE_HEIGHT / 2) * _local_4) + (TILE_HEIGHT / 2)));
                            _local_2.lineTo(((TILE_WIDTH * _local_3) + (TILE_WIDTH / 2)), ((TILE_HEIGHT / 2) * _local_4));
                            _local_2.lineTo(((TILE_WIDTH * _local_3) + TILE_WIDTH), (((TILE_HEIGHT / 2) * _local_4) + (TILE_HEIGHT / 2)));
                            _local_2.lineTo(((TILE_WIDTH * _local_3) + (TILE_WIDTH / 2)), (((TILE_HEIGHT / 2) * _local_4) + TILE_HEIGHT));
                            _local_2.lineTo((TILE_WIDTH * _local_3), (((TILE_HEIGHT / 2) * _local_4) + (TILE_HEIGHT / 2)));
                        };
                        _local_2.endFill();
                    };
                    _local_4++;
                };
                _local_3++;
            };
        }

        public function get centerY():int
        {
            return ((GamePredef.APP_HALF_HEIGHT - y) / flyingZoomRate);
        }

        private function dragEnterHandler(_arg_1:DragEvent):void
        {
            var _local_2:ISlot;
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as ISlot);
                _dropSlot = _local_2;
                if (((((((_dropSlot.slotType == Slot.SLOT_BAG) || (_dropSlot.slotType == Slot.SLOT_USERBAR)) || (_dropSlot.slotType == Slot.SLOT_PET_AI)) || (_dropSlot.slotType == Slot.SLOT_GUILD)) || (_dropSlot.slotType == Slot.SLOT_TEMP_SLOT)) || (_dropSlot.slotType == Slot.SLOT_FAIRY_CONFIG_RIGHT)))
                {
                    DragManager.acceptDragDrop(UIComponent(_arg_1.currentTarget));
                };
            };
        }

        private function setCoreReady():void
        {
            _core.ready = true;
            _core.player.walkable = true;
            if (((_core.firstLoginFlag == 1) && (_core.player.walkable)))
            {
                _core.remote.fixFlyState();
                _core.firstLoginFlag = 0;
            };
        }

        public function loadFinish():void
        {
            itemContainer.sortChildren();
            visible = true;
            fadeIn.play();
            mapReady();
        }

        public function set colorCode(_arg_1:int):void
        {
            ResManager.setColorCode(this, _arg_1);
        }

        public function snapBackGround():BitmapData
        {
            var _local_1:BitmapData = new BitmapData(_stage.stageWidth, _stage.stageHeight);
            _local_1.draw(this);
            return (_local_1);
        }

        private function dragOverHandler(_arg_1:DragEvent):void
        {
            DragManager.showFeedback(DragManager.MOVE);
        }

        private function moveTimerHandler(_arg_1:TimerEvent):void
        {
            globalCenterTo(stage.mouseX, stage.mouseY);
        }

        public function centerTo(_arg_1:Number, _arg_2:Number):void
        {
            var _local_5:Point;
            var _local_3:Number = ((GamePredef.APP_HALF_WIDTH - x) / flyingZoomRate);
            var _local_4:Number = ((GamePredef.APP_HALF_HEIGHT - y) / flyingZoomRate);
            _local_5 = localCheckBounds(_arg_1, _arg_2);
            mapMove.stop();
            mapMove.xBy = ((_local_3 - _local_5.x) * flyingZoomRate);
            mapMove.yBy = ((_local_4 - _local_5.y) * flyingZoomRate);
            mapMove.play();
        }

        private function addChildren():void
        {
            mapCanvas = new Sprite();
            mapContainer = new MapContainer();
            backEffectLayer = new Sprite();
            itemContainer = new ItemContainer();
            hitTestContainer = new HitTestContainer();
            _frontEffectLayer = new Sprite();
            hitTestContainer.visible = false;
            mapCanvas.addChild(mapContainer);
            addChild(mapCanvas);
            addChild(backEffectLayer);
            addChild(itemContainer);
            addChild(hitTestContainer);
            addChild(_frontEffectLayer);
        }

        private function buildTile(_arg_1:int):void
        {
            var _local_4:Object;
            var _local_2:Object = _core.data.gameDataIndex[GamePredef.TBL_MAP_CELL][_arg_1];
            var _local_3:Object = {};
            for each (_local_4 in _local_2)
            {
                if (_local_3[_local_4.posX] == undefined)
                {
                    _local_3[_local_4.posX] = {};
                };
                _local_3[_local_4.posX][_local_4.posY] = _local_4.resCode;
            };
            createHitTest(_local_3);
            setCoreReady();
            hitTestContainer.visible = false;
            mapContainer.init(this, ResManager.getResUrl(_mapData.resCode), width, height, _mapData.type, _local_3);
        }

        private function dropHandlerByDp(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.dropItem(_dropSlot.slotData.id, _core.delPass);
                _dropSlot = null;
            };
        }

        private function initEffects():void
        {
            fadeOut = new Fade(this);
            fadeOut.alphaFrom = 1;
            fadeOut.alphaTo = 0;
            fadeOut.duration = 800;
            fadeIn = new Fade(this);
            fadeIn.alphaFrom = 0;
            fadeIn.alphaTo = 1;
            fadeIn.duration = 800;
            mapMove = new Move(this);
            mapMove.duration = 800;
            mapMove.easingFunction = Linear.easeInOut;
        }

        public function centerPlayerImm():void
        {
            x = 0;
            y = 0;
            lockToCenter(_core.player.posX, _core.player.posY);
        }

        private function delSlot(_arg_1:String):void
        {
            var _local_2:String;
            if (_arg_1)
            {
                _local_2 = MD5.hash(_arg_1);
                _core.remote.dropItem(_dropSlot.slotData.id, _local_2);
            };
            _dropSlot = null;
        }

        public function get frontEffectLayer():Sprite
        {
            return (_frontEffectLayer);
        }

        private function dropHandler(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.dropItem(_dropSlot.slotData.id);
                _dropSlot = null;
            };
        }

        private function effectEndHandler(_arg_1:Event=null):void
        {
            _core.player.posCenterX = centerX;
            _core.player.posCenterY = centerY;
        }

        public function applyZoomEffect(_arg_1:Number):void
        {
            flyingZoomRate = _arg_1;
            this.scaleX = flyingZoomRate;
            this.scaleY = flyingZoomRate;
            if (itemContainer)
            {
                itemContainer.applyZoomEffect(flyingZoomRate);
            };
        }

        private function mouseDownHandler(_arg_1:MouseEvent):void
        {
            var _local_2:ChatCanvas = (_core.view.getUI(ViewManager.MAIN_CHAT) as ChatCanvas);
            if (_local_2.checkPoint(stage.mouseX, stage.mouseY))
            {
                _arg_1.stopImmediatePropagation();
                return;
            };
            var _local_3:QuestGuide = (_core.view.getUI(ViewManager.MAIN_QUEST_GUIDE) as QuestGuide);
            if (_local_3.checkPoint(stage.mouseX, stage.mouseY))
            {
                _arg_1.stopImmediatePropagation();
                return;
            };
            globalCenterTo(stage.mouseX, stage.mouseY);
            stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
            _moveTimer.addEventListener(TimerEvent.TIMER, moveTimerHandler);
            _moveTimer.start();
            MouseManager.setClickTime();
            _core.clearTargets();
            _core.view.hide(ViewManager.MAIN_TARGET);
        }

        private function addView():void
        {
            _core.view.addUI(ViewManager.STAGE_MAIN_CONTAINER, itemContainer, true);
        }

        public function stopCenterEffect():void
        {
            mapMove.stop();
        }

        public function initView():void
        {
            _core.scene.init(this);
            _moveTimer = new Timer(500);
        }

        private function localCheckBounds(_arg_1:Number, _arg_2:Number):Point
        {
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_3:Number = GamePredef.APP_HALF_WIDTH;
            var _local_4:Number = GamePredef.APP_HALF_HEIGHT;
            var _local_5:Number = ((_local_3 - x) / flyingZoomRate);
            var _local_6:Number = ((_local_4 - y) / flyingZoomRate);
            var _local_7:Point = new Point(_arg_1, _arg_2);
            var _local_8:Number = (_local_3 / flyingZoomRate);
            if (_arg_1 < _local_8)
            {
                _local_10 = (_arg_1 - _local_8);
                _local_7.x = ((_local_10 < _loadedLeft) ? (_arg_1 + (_loadedLeft - _local_10)) : _arg_1);
            }
            else
            {
                if (_arg_1 > (_loadedRight - _local_8))
                {
                    _local_11 = (_arg_1 + _local_8);
                    _local_7.x = ((_local_11 > _loadedRight) ? (_arg_1 - (_local_11 - _loadedRight)) : _arg_1);
                }
                else
                {
                    _local_7.x = _arg_1;
                };
            };
            var _local_9:Number = (_local_4 / flyingZoomRate);
            if (_arg_2 < _local_9)
            {
                _local_12 = (_arg_2 - _local_9);
                _local_7.y = ((_local_12 < _loadedTop) ? (_arg_2 + (_loadedTop - _local_12)) : _arg_2);
            }
            else
            {
                if (_arg_2 > (_loadedBottom - _local_9))
                {
                    _local_13 = (_arg_2 + _local_9);
                    _local_7.y = ((_local_13 > _loadedBottom) ? (_arg_2 - (_local_13 - _loadedBottom)) : _arg_2);
                }
                else
                {
                    _local_7.y = _arg_2;
                };
            };
            return (_local_7);
        }

        private function initEventHandlers():void
        {
            addEventListener(DragEvent.DRAG_ENTER, dragEnterHandler);
            addEventListener(DragEvent.DRAG_OVER, dragOverHandler);
            addEventListener(DragEvent.DRAG_DROP, dragDropHandler);
            addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            mapMove.addEventListener(EffectEvent.EFFECT_END, effectEndHandler);
        }

        public function lockToCenter(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:Point = localCheckBounds(_arg_1, _arg_2);
            x = (GamePredef.APP_HALF_WIDTH - (_local_3.x * flyingZoomRate));
            y = (GamePredef.APP_HALF_HEIGHT - (_local_3.y * flyingZoomRate));
        }


    }
}//package com.qeedoo.ui.view.compGameStage

