// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SoulSlot

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import com.qeedoo.game.ui.ISlot;
    import flash.utils.Dictionary;
    import mx.core.UIComponent;
    import flash.display.Loader;
    import mx.controls.Alert;
    import flash.text.TextField;
    import mx.controls.Label;
    import flash.display.MovieClip;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.event.GameEvent;
    import mx.managers.DragManager;
    import mx.events.DragEvent;
    import flash.events.Event;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.setTimeout;
    import flash.display.Bitmap;
    import mx.core.DragSource;
    import mx.controls.Image;
    import flash.events.MouseEvent;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.event.GameDataEvent;
    import flash.display.LoaderInfo;
    import flash.utils.clearTimeout;
    import flash.display.BitmapData;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compDragable.PetFightConf;
    import mx.managers.PopUpManager;
    import mx.events.CloseEvent;

    public class SoulSlot extends Canvas implements ISlot 
    {

        public static const SLOT_PET_SOUL:uint = 0;
        public static const SLOT_BAG_SOUL:uint = 1;
        public static var soulResDict:Dictionary = new Dictionary();
        private static const DCLICK_DELAY:Number = 800;
        private static const REFRESH_DELAY:Number = 3000;
        private static const SHOW_DELAY:Number = 180;
        public static const EVENT_SLOT_DCLICK:String = "EVENT_SLOT_DCLICK";

        private var _container:UIComponent;
        private var _lastClick:Number;
        private var _type:int = -1;
        private var _stackMax:int = -1;
        public var tempBagFlag:Boolean = false;
        private var _slotData:Object;
        public var acceptPos:Array;
        public var showMax:Boolean = false;
        private var _loader:Loader;
        private var _alert:Alert;
        private var _callLaterFlag:Boolean = false;
        public var _iconCode:Number = -1;
        private var _showToolTip:Boolean;
        public var acceptType:Array;
        public var movable:Boolean = true;
        public var acceptable:Boolean = true;
        protected var _canvas:Canvas;
        private var _state:int = 0;
        public var temp_quality:uint = 0;
        private var _isInAuction:Boolean = false;
        public var kind:int = 0;
        protected var _toolTip:Object;
        private var _lastRefresh:Number = 0;
        private var _itemId:Number = -1;
        private var _txt:TextField;
        private var _posId:uint = 0;
        private var _slotType:int = -1;
        private var lastIconCode:Number = -1;
        private var _timeoutHandler:int;
        private var _index:int = -1;
        private var _showHandler:Number = 0;
        private var _requestHandler:uint;
        private var _dropSlot:ISlot;
        private var soul:SoulSprite;
        public var _label:Label;
        public var quality:int = 0;

        private var _itemIcon:MovieClip = new MovieClip();
        private var soulIcon:UIComponent = new UIComponent();
        protected var _core:Core = Core.getInstance();

        public function SoulSlot()
        {
            initStyle();
            addChildrens();
            initEventHandlers();
        }

        public function set iconHeight(_arg_1:int):void
        {
            if (((!(_itemIcon == null)) && (!(_canvas == null))))
            {
                _itemIcon.height = _arg_1;
                _canvas.height = (_arg_1 + 2);
            };
        }

        public function set giid(_arg_1:Number):void
        {
            _itemId = _arg_1;
            if (_itemId <= 0)
            {
                clearIcon();
                return;
            };
            this.setSource();
            _txt.visible = false;
            dispatchEvent(new GameEvent(GameEvent.SLOT_GIID_CHANGE));
        }

        private function dragOverHandler(_arg_1:DragEvent):void
        {
            var _local_2:ISlot;
            if (((acceptType == null) || (acceptType.length <= 0)))
            {
                DragManager.showFeedback(DragManager.MOVE);
                return;
            };
            if (((acceptable) && (_arg_1.dragSource.hasFormat("petSoulSlot"))))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("petSoulSlot") as ISlot);
                if (canPutHere(_local_2))
                {
                    DragManager.showFeedback(DragManager.MOVE);
                }
                else
                {
                    DragManager.showFeedback(DragManager.NONE);
                };
                return;
            };
            DragManager.showFeedback(DragManager.NONE);
        }

        public function get stackMax():int
        {
            return (0);
        }

        private function checkAndShowTooltip():void
        {
            checkDelay();
            showTooltip();
        }

        public function set dropSlot(_arg_1:ISlot):void
        {
            this._dropSlot = _arg_1;
        }

        private function mouseMove(_arg_1:Event):void
        {
            if (((!(_toolTip)) || (_toolTip.visible == false)))
            {
                showTooltip();
            };
        }

        public function set posId(_arg_1:uint):void
        {
            this._posId = _arg_1;
        }

        public function set state(_arg_1:int):void
        {
            _state = _arg_1;
            if (_state == 0)
            {
                _canvas.styleName = "SoulSlotClose";
                if ((((this.slotType == SLOT_PET_SOUL) && (this._index)) && (this._index > 108)))
                {
                    this._label.toolTip = Language.PET_SOUL_S[55];
                }
                else
                {
                    switch (this.slotType)
                    {
                        case SLOT_PET_SOUL:
                            this._label.toolTip = Language.PET_SOUL_S[31].toString().replace("{level}", GamePredef.PET_SOUL_LEVEL[(this._index - 101)]);
                            break;
                        case SLOT_BAG_SOUL:
                            this._label.toolTip = Language.PET_SOUL_S[32];
                            break;
                    };
                };
                this._label.visible = true;
            }
            else
            {
                if (_state == 1)
                {
                    _canvas.styleName = "SoulSlotOpen";
                    this._label.visible = false;
                };
            };
        }

        private function rollOverHandler(_arg_1:Event):void
        {
            if (this._state == 0)
            {
                return;
            };
            _showToolTip = true;
            filters = [GamePredef.FILTER_SOUL_SLOT_SELECTED];
            if (((_itemId > 0) && (_type > 0)))
            {
                _showHandler = setTimeout(checkAndShowTooltip, SHOW_DELAY);
            };
        }

        private function drag(_arg_1:MouseEvent):void
        {
            var _local_2:Bitmap = getBitmapByFrame();
            var _local_3:UIComponent = soulIcon;
            var _local_4:DragSource = new DragSource();
            _local_4.addData(_local_3, "movieClip");
            _local_4.addData(this, "petSoulSlot");
            var _local_5:Image = new Image();
            _local_5.source = _local_2;
            _local_5.height = soul.height;
            _local_5.width = soul.width;
            _local_5.x = 0;
            _local_5.y = 0;
            DragManager.doDrag(_local_3, _local_4, _arg_1, _local_5, 0, 0, 0.5);
        }

        public function setSource():void
        {
            var _local_3:String;
            if ((((_itemId <= 0) || (isNaN(_itemId))) || (!(_type == GamePredef.TBL_PET_SOUL))))
            {
                this.clearIcon();
                return;
            };
            if (_type <= 0)
            {
                trace("Set giid before type , calllater ");
                _callLaterFlag = true;
                return;
            };
            var _local_1:Core = Core.getInstance();
            var _local_2:Object = GameData.d[_type][_itemId];
            if (_local_2)
            {
                clearIcon();
                _local_3 = ResManager.getResUrlNoHash(_iconCode);
                soul = new SoulSprite();
                soul.show(_local_3);
                soulIcon = new UIComponent();
                soulIcon.addChild(soul);
                this._canvas.addChild(soulIcon);
            }
            else
            {
                _local_1.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _type) + "_") + _itemId), imgDataLoaded);
                _requestHandler = setTimeout(requestData, 300);
            };
        }

        private function showSoulToolTip(_arg_1:int, _arg_2:int, _arg_3:Boolean=false):void
        {
            var _local_4:Object;
            var _local_5:Object;
            if (_core.data.hasData(_type, _itemId))
            {
                _local_5 = {};
                _local_5.temp = GameData.d[_type][_itemId];
                if (_slotData != null)
                {
                    _local_5.isIns = true;
                    _local_5.slotData = _slotData;
                };
                _toolTip = getToolTip();
                _toolTip.object = _local_5;
                _toolTip.show();
            }
            else
            {
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _type) + "_") + _itemId), dataLoaded);
                _core.data.getGameData(_type, _itemId);
            };
        }

        private function addLink():void
        {
            var _local_1:Object = GameData.d[_type][_itemId];
            if (!_local_1)
            {
                return;
            };
            _core.addLink(_type, _itemId, _local_1.name);
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                alpha = 0.5;
            }
            else
            {
                alpha = 1;
            };
        }

        public function get type():int
        {
            return (_type);
        }

        public function get itemIcon():MovieClip
        {
            return (_itemIcon);
        }

        public function showTooltip(_arg_1:Boolean=false):void
        {
            switch (_type)
            {
                case GamePredef.TBL_PET_SOUL:
                    showSoulToolTip(_type, this._index, _arg_1);
                    return;
            };
        }

        public function clean():void
        {
            reset();
            _slotData = null;
        }

        private function resLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = (_arg_1.target as LoaderInfo);
            if (_local_2.url.indexOf(ResManager.hash((ResManager.getResUrlNoHash(_iconCode) + "_NEW.swf"))) == -1)
            {
                return;
            };
            _local_2.removeEventListener(Event.COMPLETE, resLoadCompleteHandler);
            _itemIcon = (_local_2.content as MovieClip);
            _itemIcon.x = 32;
            _itemIcon.y = 32;
            soulIcon = new UIComponent();
            soulIcon.addChild(_itemIcon);
            _canvas.addChild(soulIcon);
        }

        public function reset():void
        {
            _type = -1;
            _itemId = -1;
            lastIconCode = -1;
            if ((((soul) && (soul.parent)) && (soul.parent == this.soulIcon)))
            {
                soul.unShow();
                this.soulIcon.removeChild(soul);
            };
            alpha = 1;
            _canvas.styleName = "";
        }

        public function get isInAuction():Boolean
        {
            return (_isInAuction);
        }

        private function checkDelay():void
        {
            var _local_1:Number = new Date().getTime();
            if ((_local_1 - _lastRefresh) > REFRESH_DELAY)
            {
                if (((((_type == GamePredef.TBL_PET) || (_type == GamePredef.TBL_ITEM_INSTANCE)) || (_type == GamePredef.TBL_EQUIPT_INSTANCE)) || (_type == GamePredef.TBL_EQUIPT_INSTANCE)))
                {
                    _core.data.delData(_type, _itemId);
                };
                _lastRefresh = _local_1;
            };
        }

        protected function dataLoaded(_arg_1:GameDataEvent):void
        {
            _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.index), dataLoaded);
            if (_showToolTip)
            {
                showTooltip(true);
            };
        }

        public function get slotType():int
        {
            return (_slotType);
        }

        public function hideTooltip():void
        {
            if (_toolTip)
            {
                _toolTip.hide();
            };
        }

        public function clearIcon():void
        {
            if ((((soul) && (soul.parent)) && (soul.parent == this.soulIcon)))
            {
                soul.unShow();
                this.soulIcon.removeChild(soul);
            };
        }

        public function set typeAndId(_arg_1:Object):void
        {
            _type = _arg_1.type;
            giid = _arg_1.itemId;
        }

        private function imgDataLoaded(_arg_1:GameDataEvent):void
        {
            _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.index), imgDataLoaded);
            setSource();
        }

        public function set type(_arg_1:int):void
        {
            if (_arg_1 != GamePredef.TBL_PET_SOUL)
            {
                return;
            };
            _type = _arg_1;
        }

        private function swapSlotView(_arg_1:ISlot, _arg_2:ISlot):void
        {
            var _local_3:Object = {};
            _local_3.type = _arg_1.type;
            _local_3.giid = _arg_1.giid;
            _arg_1.type = _arg_2.type;
            _arg_1.giid = _arg_2.giid;
            _arg_2.type = _local_3.type;
            _arg_2.giid = _local_3.giid;
        }

        protected function rollOutHandler(_arg_1:Event):void
        {
            if (this._state == 0)
            {
                return;
            };
            _showToolTip = false;
            filters = [];
            clearTimeout(_showHandler);
            if (((_itemId > 0) && (_type > 0)))
            {
                hideTooltip();
            };
        }

        public function set text(_arg_1:String):void
        {
            _txt.text = _arg_1;
        }

        public function get giid():Number
        {
            return (_itemId);
        }

        public function set stackMax(_arg_1:int):void
        {
        }

        public function getBitmapByFrame():Bitmap
        {
            var _local_1:BitmapData = soul.getBitmapData();
            return (new Bitmap(_local_1));
        }

        private function initStyle():void
        {
            width = 65;
            height = 65;
            horizontalScrollPolicy = "off";
            verticalScrollPolicy = "off";
        }

        public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:PetSoulSlot;
            if (this._state == 0)
            {
                return;
            };
            if (_arg_1.dragSource.hasFormat("petSoulSlot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("petSoulSlot") as PetSoulSlot);
                if (_local_2 == this)
                {
                    return;
                };
                switch (_local_2.slotType)
                {
                    case SLOT_PET_SOUL:
                        if (_local_2.slotData.petId)
                        {
                            _core.remote.moveSoul(_local_2.index, index, _local_2.slotData.petId);
                        }
                        else
                        {
                            _core.remote.moveSoul(_local_2.index, index, -1);
                        };
                        return;
                    case SLOT_BAG_SOUL:
                        if (this.slotData.petId)
                        {
                            _core.remote.moveSoul(_local_2.index, index, this.slotData.petId);
                        }
                        else
                        {
                            _core.remote.moveSoul(_local_2.index, index, -1);
                        };
                        return;
                };
            };
        }

        public function get dropSlot():ISlot
        {
            return (_dropSlot);
        }

        public function restore():void
        {
            _canvas.styleName = "";
            _slotData = _core.data.getSlot({"sid":_index});
            update();
        }

        public function get posId():uint
        {
            return (this._posId);
        }

        public function get state():int
        {
            return (_state);
        }

        public function resetQualityColor():void
        {
            _canvas.styleName = "SoulSlotClose";
        }

        public function set slotData(_arg_1:Object):void
        {
            _slotData = _arg_1;
        }

        public function set iconWidth(_arg_1:int):void
        {
            if (((!(_itemIcon == null)) && (!(_canvas == null))))
            {
                _itemIcon.width = _arg_1;
                _canvas.width = (_arg_1 + 2);
            };
        }

        public function setStyleName(_arg_1:int):void
        {
            _state = _arg_1;
            if (_arg_1 == 0)
            {
                _canvas.styleName = "SoulSlotClose";
            }
            else
            {
                if (_arg_1 == 1)
                {
                    _canvas.styleName = "SoulSlotOpen";
                };
            };
        }

        public function get isDClick():Boolean
        {
            return (Boolean(((_lastClick + DCLICK_DELAY) > new Date().getTime())));
        }

        private function setFirstClickTime():void
        {
            _lastClick = new Date().getTime();
        }

        public function set isInAuction(_arg_1:Boolean):void
        {
            _isInAuction = _arg_1;
        }

        public function get selected():Boolean
        {
            return (alpha == 0.5);
        }

        public function set index(_arg_1:int):void
        {
            if (_index > 0)
            {
                return;
            };
            _index = _arg_1;
        }

        private function canPutHere(_arg_1:ISlot):Boolean
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:int;
            if (_state == 0)
            {
                return (false);
            };
            if (((acceptType == null) || (acceptType.length <= 0)))
            {
                return (true);
            };
            for each (_local_2 in acceptType)
            {
                if (_arg_1.type == _local_2)
                {
                    if (((acceptPos == null) || (acceptPos.length <= 0)))
                    {
                        return (true);
                    };
                    _local_3 = _core.getTemplateData(_arg_1.type, _arg_1.giid);
                    if (((_local_3) && (_local_3.hasOwnProperty("position"))))
                    {
                        for each (_local_4 in acceptPos)
                        {
                            if (_local_3.position == _local_4)
                            {
                                return (true);
                            };
                        };
                        return (false);
                    };
                    return (false);
                };
            };
            return (false);
        }

        public function set slotType(_arg_1:int):void
        {
            _slotType = _arg_1;
        }

        private function addChildrens():void
        {
            _container = new UIComponent();
            _txt = new TextField();
            _label = new Label();
            _label.x = 0;
            _label.y = 0;
            _label.width = 65;
            _label.height = 65;
            _canvas = new Canvas();
            _canvas.horizontalScrollPolicy = "off";
            _canvas.verticalScrollPolicy = "off";
            _canvas.addChild(_label);
            _canvas.width = 65;
            _canvas.height = 65;
            _container.addChild(_txt);
            _container.addChild(_canvas);
            addChild(_container);
        }

        protected function getToolTip():Object
        {
            switch (_type)
            {
                case GamePredef.TBL_PET_SOUL:
                    return (_core.view.getUI(ViewManager.TOOLTIP_PET_SOUL));
            };
            return (_core.view.getUI(ViewManager.TOOLTIP_ITEM));
        }

        private function dragEnterHandler(_arg_1:DragEvent):void
        {
            var _local_2:ISlot;
            if (!acceptable)
            {
                return;
            };
            if ((_arg_1.target.parent.parent.parent is PetFightConf))
            {
                _core.nextGuide(ViewManager.PANEL_PETFIGHT_CONF, "", -1, -1, 1);
            };
            if (_arg_1.dragSource.hasFormat("petSoulSlot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("petSoulSlot") as ISlot);
                _dropSlot = _local_2;
                DragManager.acceptDragDrop(Canvas(_arg_1.currentTarget));
            };
        }

        public function set stackNum(_arg_1:int):void
        {
        }

        public function update():void
        {
            if (((_slotData) && (_slotData.sid > 0)))
            {
                type = _slotData.type;
                giid = _slotData.itemId;
            }
            else
            {
                clean();
            };
        }

        public function rightClick():void
        {
            var _local_1:GameEvent;
            if (_showToolTip)
            {
                _local_1 = new GameEvent(EVENT_SLOT_DCLICK);
                _local_1.data = {};
                dispatchEvent(_local_1);
            };
        }

        public function get slotData():Object
        {
            return (_slotData);
        }

        public function get index():int
        {
            return (_index);
        }

        private function requestData():void
        {
            if (_requestHandler > 0)
            {
                clearTimeout(_requestHandler);
                _requestHandler = 0;
            };
            var _local_1:Core = Core.getInstance();
            _local_1.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _type) + "_") + _itemId), imgDataLoaded);
            _local_1.data.getGameData(_type, _itemId);
        }

        public function get stackNum():int
        {
            return (0);
        }

        private function onClick(event:MouseEvent):void
        {
            var func:Function;
            _core.itemState = GamePredef.ST_ITEM_NORMAL;
            hideTooltip();
            if (isDClick)
            {
                if (_state != 0)
                {
                    return;
                };
                if (this.slotType == SLOT_PET_SOUL)
                {
                    return;
                };
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.openBag();
                    };
                };
                _alert = Alert.show(Language.PET_SOUL_S[21], "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                setFirstClickTime();
                if (_state == 0)
                {
                    return;
                };
                if (_core.view.mouseState == GamePredef.ACTION_NONE)
                {
                    if (_itemId <= 0)
                    {
                        return;
                    };
                    if (event.shiftKey)
                    {
                        addLink();
                        return;
                    };
                    if (movable)
                    {
                        _timeoutHandler = setTimeout(drag, 180, event);
                    };
                };
            };
        }

        public function setTypeAndId(_arg_1:int, _arg_2:Number):void
        {
            _type = _arg_1;
            giid = _arg_2;
        }

        private function initEventHandlers():void
        {
            addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
            addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
            addEventListener(MouseEvent.CLICK, onClick);
            addEventListener(DragEvent.DRAG_ENTER, dragEnterHandler);
            addEventListener(DragEvent.DRAG_OVER, dragOverHandler);
            addEventListener(DragEvent.DRAG_DROP, dragDropHandler);
        }


    }
}//package com.qeedoo.ui.view.comp

