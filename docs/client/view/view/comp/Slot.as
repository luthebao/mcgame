// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.Slot

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import com.qeedoo.game.ui.ISlot;
    import mx.core.UIComponent;
    import flash.text.TextField;
    import com.qeedoo.game.system.Core;
    import mx.controls.Image;
    import mx.managers.DragManager;
    import mx.events.DragEvent;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.game.utils.JSONUtil;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.event.GameDataEvent;
    import flash.utils.setTimeout;
    import mx.utils.ObjectUtil;
    import mx.core.DragSource;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.config.ItemConfig;
    import flash.utils.clearTimeout;
    import com.qeedoo.ui.view.compDragable.NumPanel;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.controls.TextArea;
    import com.adobe.crypto.MD5;
    import com.qeedoo.ui.view.compDragable.PetFightConf;
    import com.qeedoo.ui.event.GameEvent;
    import flash.display.DisplayObject;

    public class Slot extends Canvas implements ISlot 
    {

        public static const SLOT_BAG:uint = 0;
        public static const SLOT_MAIL:uint = 1;
        public static const SLOT_TRADE_ITEM:uint = 2;
        public static const SLOT_SHOP:uint = 3;
        public static const SLOT_EQUIP:uint = 4;
        public static const SLOT_SKILL:uint = 5;
        public static const SLOT_AUCTION:uint = 6;
        public static const SLOT_MAKE:uint = 7;
        public static const SLOT_EQUFUNC:uint = 8;
        public static const SLOT_JEWEL:uint = 9;
        public static const SLOT_MATERIAL:uint = 10;
        public static const SLOT_STAR:uint = 11;
        public static const SLOT_PET:uint = 12;
        public static const SLOT_PETFUNC:uint = 13;
        public static const SLOT_USERBAR:uint = 14;
        public static const SLOT_TRADE_PET:uint = 15;
        public static const SLOT_SKILL_PET:uint = 16;
        public static const SLOT_CREBOOK:uint = 17;
        public static const SLOT_TREASURE:uint = 18;
        public static const SLOT_EQUFUNC_ITEM:uint = 19;
        public static const SLOT_GUILD:uint = 20;
        public static const SLOT_PRODUCT:uint = 21;
        public static const SLOT_BUILD:uint = 21;
        public static const SLOT_LOTTO:uint = 22;
        public static const SLOT_TEMP_BAG:uint = 23;
        public static const SLOT_TEMP_SLOT:uint = 24;
        public static const SLOT_TEMPORARY_BAG:uint = 25;
        public static const SLOT_PET_AI:uint = 26;
        public static const SLOT_FARM_BAG:uint = 27;
        public static const SLOT_STARS_ADD:uint = 28;
        public static const SLOT_STARS_SPEED:uint = 29;
        public static const SLOT_PET_SOUL:uint = 30;
        public static const SLOT_AUCTION_ITEM:uint = 31;
        public static const SLOT_AUCTION_PET:uint = 32;
        public static const SLOT_CREATURE:uint = 33;
        public static const SLOT_MEDAL:uint = 34;
        public static const SLOT_FAIRY_CONFIG_LEFT:uint = 35;
        public static const SLOT_FAIRY_CONFIG_RIGHT:uint = 36;
        public static const SLOT_TALENT:uint = 37;
        public static const SLOT_STONE_SEAL:uint = 38;
        public static const SLOT_RUNE_UP:uint = 39;
        public static const SLOT_RUNE_CHA:uint = 40;
        public static const SLOT_RUNE_PET:uint = 41;
        public static const SLOT_RUNE_CHA_HOLE:uint = 42;
        public static const SLOT_RUNE_PET_HOLE:uint = 43;
        public static const SLOT_MYSTRE:uint = 44;
        public static const SLOT_MONTHWELFARE:uint = 45;
        public static const SLOT_PRS_CHIPBAG:uint = 46;
        public static const SLOT_PRS_EXCBAG:uint = 47;
        public static const SLOT_MONSTERHEART_BAG:uint = 48;
        public static const SLOT_MONSTERHEART_BOX:uint = 49;
        public static const SLOT_MONSTERHEART_UP:uint = 50;
        public static const SLOT_MONSTERHEART_RESOLVE:uint = 51;
        public static const SLOT_GUARD:uint = 52;
        public static const SLOT_PET_STONE_BAG:uint = 53;
        public static const SLOT_PET_STONE_COMPO:uint = 54;
        public static const SLOT_PET_STONE_SET:uint = 55;
        public static const SLOT_PET_STONE_EQUIPT:uint = 56;
        public static const SLOT_PET_STONE_NORMAL:uint = 57;
        public static const SLOT_PET_STONE_RESOLVE:uint = 58;
        public static const SLOT_PET_STONE_EQUIP_BAG:uint = 59;
        public static const SLOT_PET_STONE_CHANGE_SKILL:uint = 60;
        private static const DCLICK_DELAY:Number = 800;
        private static const REFRESH_DELAY:Number = 3000;
        private static const SHOW_DELAY:Number = 180;
        public static const EVENT_SLOT_DCLICK:String = "EVENT_SLOT_DCLICK";

        private var _container:UIComponent;
        private var _lastClick:Number;
        protected var _type:int = -1;
        private var _stackMax:int = -1;
        public var tempBagFlag:Boolean = false;
        public var sourceGroup:Boolean = false;
        private var _slotData:Object;
        public var acceptPos:Array;
        public var showMax:Boolean = false;
        private var _itemNum:TextField;
        private var _stackNum:int = 1;
        private var _gray:Boolean;
        private var _callLaterFlag:Boolean = false;
        public var acceptType:Array;
        private var _showToolTip:Boolean;
        public var acceptable:Boolean = true;
        public var movable:Boolean = true;
        protected var _core:Core = Core.getInstance();
        private var _itemIcon:Image;
        protected var _canvas:Canvas;
        public var temp_quality:uint = 0;
        private var _isInAuction:Boolean = false;
        public var kind:int = 0;
        protected var _toolTip:Object;
        protected var _itemId:Number = -1;
        private var _txt:TextField;
        private var _posId:uint = 0;
        private var _lastRefresh:Number = 0;
        protected var _slotType:int = -1;
        private var _timeoutHandler:int;
        private var _index:int = -1;
        private var _showHandler:Number = 0;
        private var _requestHandler:uint;
        private var _dropSlot:ISlot;
        public var tempColor:int = -1;
        public var quality:int = 0;

        public function Slot()
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

        public function resetRuneSlotIconSize():void
        {
            _itemIcon.width = 61;
            _itemIcon.height = 61;
        }

        private function dragOverHandler(_arg_1:DragEvent):void
        {
            var _local_2:ISlot;
            if (((acceptType == null) || (acceptType.length <= 0)))
            {
                DragManager.showFeedback(DragManager.MOVE);
                return;
            };
            if (((acceptable) && (_arg_1.dragSource.hasFormat("slot"))))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as ISlot);
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

        public function get stackNum():int
        {
            return (_stackNum);
        }

        private function setNumText():void
        {
            setTextFormat(_itemNum);
            _itemNum.height = 13;
            _itemNum.width = 33;
            _itemNum.autoSize = TextFieldAutoSize.RIGHT;
            _itemNum.x = 30;
            _itemNum.y = 19;
            _itemNum.defaultTextFormat = new TextFormat("Arial", 8, 0xFFFFFF);
        }

        private function checkAndShowTooltip():void
        {
            checkDelay();
            showTooltip();
        }

        public function resetBagSlotIconSize():void
        {
            _itemIcon.width = 38;
            _itemIcon.height = 38;
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

        private function setQualityColor():void
        {
            var _local_1:Object;
            var _local_2:*;
            var _local_3:int;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:int;
            if (_core.data.hasData(_type, _itemId))
            {
                _local_1 = _core.getTemplateData(_type, _itemId);
                if (((_type) && (_type == GamePredef.TBL_MEDAL)))
                {
                    setStyleName(_local_1.q);
                    return;
                };
                if (_local_1)
                {
                    kind = _local_1.kind;
                };
                _local_2 = _core.data.getGameData(_type, _itemId);
                if (_type == GamePredef.TBL_EQUIPT_INSTANCE)
                {
                    _local_3 = ((_local_2) ? _local_2.color : 0);
                    _local_4 = ((_local_2) ? _local_2.flag : null);
                    if (((_local_4) && (!(_local_4.indexOf("sublimeId") == -1))))
                    {
                        _local_5 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_local_4));
                        if ((((_local_5) && (int(_local_5.sublimeId) > 0)) && (!(_local_1.kind == 9))))
                        {
                            _local_3 = GamePredef.SUBLIMATION_COLOR;
                        };
                    };
                    setStyleName(_local_3);
                }
                else
                {
                    if (_type == GamePredef.TBL_ITEM_INSTANCE)
                    {
                        if (kind == GamePredef.ITEM_KIND_MATERIAL)
                        {
                            setStyleName(_local_2.color);
                        }
                        else
                        {
                            if (kind == GamePredef.ITEM_KIND_ITEM)
                            {
                                if (_local_1.type == 503)
                                {
                                    setStyleName(_local_1.color);
                                }
                                else
                                {
                                    if (((_local_1.type == 550) && (GamePredef.SLOT_SHOW_QUALITY_COLOR[_local_1.id])))
                                    {
                                        setStyleName(_local_1.color);
                                    };
                                };
                            }
                            else
                            {
                                if (kind == GamePredef.ITEM_KIND_FEATHER)
                                {
                                    (((_local_1.type > 1400) && (_local_1.type <= 1404)) && (setStyleName(_local_1.color)));
                                };
                            };
                        };
                    }
                    else
                    {
                        if (_type == GamePredef.TBL_ITEM_TEMPLATE)
                        {
                            if (((_slotType == SLOT_JEWEL) || (_slotType == SLOT_STONE_SEAL)))
                            {
                                (((kind == GamePredef.ITEM_KIND_ITEM) && (_local_1.type == 503)) && (setStyleName(_local_1.color)));
                            }
                            else
                            {
                                if (_slotType == SLOT_MYSTRE)
                                {
                                    ((kind == GamePredef.ITEM_KIND_MATERIAL) && (setStyleName(quality)));
                                };
                            };
                        }
                        else
                        {
                            if (_type == GamePredef.TBL_PET)
                            {
                                _local_6 = _core.basic.colorByGrowRate(_local_2.growRate);
                                setStyleName(_local_6);
                            }
                            else
                            {
                                if (((_type == GamePredef.TBL_MYSTRE) || (_type == GamePredef.TBL_RUNE_CHIP)))
                                {
                                    setStyleName(quality);
                                }
                                else
                                {
                                    if (_type == GamePredef.TBL_PET_STONE)
                                    {
                                        setStyleName(quality);
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function setImage():void
        {
            _itemIcon.width = 32;
            _itemIcon.height = 32;
            _itemIcon.scaleContent = true;
            _itemIcon.autoLoad = true;
        }

        private function setSource():void
        {
            if (((_itemId <= 0) || (isNaN(_itemId))))
            {
                _itemIcon.source = null;
                _itemIcon.filters = ((_gray) ? [GamePredef.GRAY_FILTER] : null);
                return;
            };
            if (_type <= 0)
            {
                trace("Set giid before type , calllater ");
                _callLaterFlag = true;
                return;
            };
            var _local_1:Core = Core.getInstance();
            var _local_2:Object = _local_1.getTemplateData(_type, _itemId, false);
            if (_local_2)
            {
                _itemIcon.source = ResManager.getIconUrl(_local_2.iconCode);
                ResManager.setColorCode(_itemIcon, _local_2.colorCode);
                setQualityColor();
            }
            else
            {
                _local_1.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _type) + "_") + _itemId), imgDataLoaded);
                _requestHandler = setTimeout(requestData, 300);
            };
        }

        protected function showTempToolTip(_arg_1:int, _arg_2:Boolean=false):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:Object;
            var _local_14:*;
            var _local_15:*;
            var _local_16:Object;
            if (_core.data.hasData(_type, _itemId))
            {
                _local_6 = _core.data.getGameData(_type, _itemId);
                _local_4 = ObjectUtil.copy(_local_6);
                _local_5 = {};
                _local_5.slotType = _slotType;
                if ((((((_slotType == SLOT_TREASURE) || (_slotType == SLOT_LOTTO)) || (_slotType == SLOT_TEMP_SLOT)) || ((_slotData) && (_slotData.wingTemp))) || (_slotType == SLOT_TEMPORARY_BAG)))
                {
                    _local_5.slotData = _slotData;
                };
                if (((_type == GamePredef.TBL_ITEM_TEMPLATE) && (_local_4.kind == GamePredef.ITEM_KIND_MATERIAL)))
                {
                    if (temp_quality > 0)
                    {
                        _local_4.color = temp_quality;
                    };
                    _local_5.slotData = _slotData;
                };
                if (((tempBagFlag) && (_slotType == SLOT_JEWEL)))
                {
                    _local_5.slotData = _slotData;
                };
                if ((tempColor >= 0))
                {
                    _local_4.color = tempColor;
                };
                _local_5.type = BasicToolTip.TYPE_TEMP;
                _local_5.btnVisible = false;
                _local_5.soulActived = false;
                _local_5.inst = null;
                _local_5.temp = _local_4;
                if (_type == GamePredef.TBL_DECO_SHOW)
                {
                    _local_7 = _local_6["t"];
                    if (((!(_gray)) && (_local_7 > 1)))
                    {
                        _local_8 = ObjectUtil.copy(_local_6);
                        _local_9 = _core.player.decoInfo;
                        _local_10 = _local_8["position"];
                        _local_11 = _local_9[_local_10];
                        _local_12 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_local_11["activeFlag"]));
                        _local_13 = _local_12["s"];
                        for (_local_14 in _local_13)
                        {
                            if (_local_14 == giid)
                            {
                                _local_8.dueTime = Number(_local_13[_local_14]);
                                _local_5.inst = _local_8;
                            };
                        };
                    };
                };
                if (_type == GamePredef.TBL_PET_STONE)
                {
                    _local_15 = (this as PetStoneSlot);
                    _local_5.skillId = (this as PetStoneSlot).skillId;
                };
                if ((((slotType == Slot.SLOT_TEMP_BAG) && (index >= 80)) && (index <= 99)))
                {
                    _local_16 = _core.player.tBag.tempBag[(index - 79)];
                    if ((((_local_16) && (_local_16.t)) && (_local_16.t > 0)))
                    {
                        _local_5.tempBagOt = _local_16.t;
                    };
                };
                if (((_slotData) && (_slotData.gold > 0)))
                {
                    _local_5.cost = _slotData.gold;
                    _local_5.costType = Currency.TYPE_GOLDALL;
                }
                else
                {
                    if (((_slotData) && (_slotData.money > 0)))
                    {
                        _local_5.cost = _slotData.money;
                        _local_5.costType = Currency.TYPE_MONEYALL;
                    };
                };
                _local_5.tempBagFlag = tempBagFlag;
                _toolTip = getToolTip();
                if (((data) && (data.quality > 0)))
                {
                    _local_5.quality = data.quality;
                };
                _toolTip.object = _local_5;
                if (((_arg_1 == GamePredef.TBL_ITEM_TEMPLATE) || (_arg_1 == GamePredef.TBL_EQUIPT_TEMPLATE)))
                {
                    _toolTip.currencyHide("temp");
                };
                _toolTip.show();
            }
            else
            {
                if (_arg_2)
                {
                    return;
                };
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _type) + "_") + _itemId), dataLoaded);
                _core.data.getGameData(_type, _itemId);
            };
        }

        public function get type():int
        {
            return (_type);
        }

        private function rollOverHandler(_arg_1:Event):void
        {
            _showToolTip = true;
            filters = [GamePredef.FILTER_SLOT_SELECTED];
            if (((_itemId > 0) && (_type > 0)))
            {
                _showHandler = setTimeout(checkAndShowTooltip, SHOW_DELAY);
            };
        }

        public function setStackMax():void
        {
            var _local_1:Object;
            if (((_itemId > 0) && (_type > 0)))
            {
                _local_1 = _core.getTemplateData(_type, _itemId);
                if (_local_1)
                {
                    stackMax = _local_1.stackMax;
                };
            };
        }

        private function drag(_arg_1:MouseEvent):void
        {
            var _local_2:Image = Image(_itemIcon);
            var _local_3:DragSource = new DragSource();
            _local_3.addData(_local_2, "image");
            _local_3.addData(this, "slot");
            var _local_4:Image = new Image();
            _local_4.source = _itemIcon.source;
            _local_4.height = _itemIcon.height;
            _local_4.width = _itemIcon.width;
            _local_4.x = _itemIcon.x;
            _local_4.y = _itemIcon.y;
            DragManager.doDrag(_local_2, _local_3, _arg_1, _local_4, 0, 0, 0.5);
        }

        public function get itemIcon():Image
        {
            return (_itemIcon);
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

        public function showTooltip(_arg_1:Boolean=false):void
        {
            switch (_type)
            {
                case GamePredef.TBL_ITEM_INSTANCE:
                case GamePredef.TBL_EQUIPT_INSTANCE:
                case GamePredef.TBL_PET:
                    showInstToolTip(_type, this._index, _arg_1);
                    return;
                case GamePredef.TBL_ITEM_TEMPLATE:
                case GamePredef.TBL_EQUIPT_TEMPLATE:
                case GamePredef.TBL_CREATURE:
                case GamePredef.TBL_SKILL:
                case GamePredef.TBL_BUILDING:
                case GamePredef.TBL_MINERAL_TEMPLATE:
                case GamePredef.TBL_MEDAL:
                case GamePredef.TBL_PET_TALENT:
                case GamePredef.TBL_DECO_SHOW:
                case GamePredef.TBL_DECO_RUNE:
                case GamePredef.TBL_RUNE_CHIP:
                case GamePredef.TBL_MYSTRE:
                case GamePredef.TBL_PRS_CHIP:
                case GamePredef.TBL_CREATUREH_HEART:
                case GamePredef.TBL_PET_STONE:
                    showTempToolTip(_type, _arg_1);
                    return;
            };
        }

        public function clean():void
        {
            reset();
            _slotData = null;
        }

        private function addLink():void
        {
            var _local_1:Object = _core.getTemplateData(_type, _itemId);
            if (!_local_1)
            {
                return;
            };
            _core.addLink(_type, _itemId, _local_1.name);
        }

        public function get isInAuction():Boolean
        {
            return (_isInAuction);
        }

        protected function dataLoaded(_arg_1:GameDataEvent):void
        {
            _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.index), dataLoaded);
            if (_showToolTip)
            {
                showTooltip(true);
            };
        }

        public function restItemIconSize():void
        {
            _itemIcon.width = 50;
            _itemIcon.height = 50;
            _canvas.width = 50;
            _canvas.height = 50;
        }

        public function resetRuneSlotSetIconSize():void
        {
            _itemIcon.width = 51;
            _itemIcon.height = 51;
        }

        public function get isDClick():Boolean
        {
            return (Boolean(((_lastClick + DCLICK_DELAY) > new Date().getTime())));
        }

        public function reset():void
        {
            _type = -1;
            _itemId = -1;
            _stackNum = 1;
            _stackMax = -1;
            this.gray = false;
            _itemNum.text = "";
            _itemIcon.source = null;
            _txt.visible = true;
            alpha = 1;
            _canvas.styleName = "";
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
            _itemIcon.source = null;
            _txt.visible = true;
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

        private function actionOnItem(_arg_1:MouseEvent, _arg_2:int, _arg_3:int):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Number;
            var _local_7:Array;
            var _local_8:*;
            if (_arg_2 == GamePredef.ACTION_JEWEL_DEL)
            {
                if (slotType == Slot.SLOT_JEWEL)
                {
                    this.dispatchEvent(new MouseEvent(MouseEvent.DOUBLE_CLICK));
                };
            };
            if (_arg_2 == GamePredef.ACTION_FEATHER_DEL)
            {
                if (slotType == Slot.SLOT_EQUFUNC_ITEM)
                {
                    this.dispatchEvent(new MouseEvent(MouseEvent.DOUBLE_CLICK));
                };
            };
            if (((((_type <= 0) || (_itemId <= 0)) || ((!(_slotType == Slot.SLOT_BAG)) && (!(_slotType == Slot.SLOT_EQUIP)))) || (_stackNum < 0)))
            {
                if (((!(slotType == SLOT_TEMP_SLOT)) || (!(_arg_2 == GamePredef.ACTION_DIVIDE))))
                {
                    return;
                };
            };
            if (_arg_3 == GamePredef.MOUSE_TARGET_CHA)
            {
                switch (_arg_2)
                {
                    case GamePredef.ACTION_BIND:
                        _core.remote.bindItem(slotData.id);
                        break;
                    case GamePredef.ACTION_ITEM:
                        _core.player.useItem(GamePredef.MOUSE_TARGET_CHA, -1, slotData.id);
                        break;
                    case GamePredef.ACTION_DIVIDE:
                        if (((slotType == Slot.SLOT_BAG) || (slotType == SLOT_TEMP_SLOT)))
                        {
                            _core.itemState = GamePredef.ST_ITEM_DIVIDE;
                            drag(_arg_1);
                        };
                        break;
                    case GamePredef.ACTION_DROP:
                        if (slotType == Slot.SLOT_BAG)
                        {
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.SLOT_U[0], delSlot);
                        };
                        break;
                    case GamePredef.ACTION_REPAIR_NOWEAR:
                        if (((this.index >= 600) && (this.index <= 607)))
                        {
                            _local_8 = _core.view.getUI(ViewManager.PANEL_PETMANAGER);
                            _core.remote.repairPetEqu(_local_8.petData.id, this._itemId, 1);
                        }
                        else
                        {
                            _core.remote.repair(slotData.id, 1);
                        };
                        break;
                    case GamePredef.ACTION_REPAIR_MAGIC_WEAPON:
                        _local_4 = _core.data.gameData[slotData.type][slotData.itemId];
                        _local_5 = _core.getTemplateData(slotData.type, slotData.itemId, false);
                        if ((((!(_local_4)) || (!(_local_5))) || (!(_local_5.kind == GamePredef.ITEM_KIND_MAGICWEAPON))))
                        {
                            return;
                        };
                        _local_6 = (_local_4.endureMax - _local_4.endureLeft);
                        if (_local_6 <= 0)
                        {
                            _core.sysMidNote(Language.CHARACTORPANEL_S[79]);
                            return;
                        };
                        _local_7 = _core.basic.getItemSlotList(ItemConfig.ITEM_DARKBLUE_STONE, 1);
                        if (_local_7)
                        {
                            _core.remote.magicWeaponAutoRepair(slotData.id, _local_7[0]);
                        }
                        else
                        {
                            _core.sysMidNote(Language.CHARACTORPANEL_S[78].replace("{num}", 1));
                        };
                        break;
                    case GamePredef.ACTION_REPAIR_NORMAL:
                        if (((this.index >= 600) && (this.index <= 607)))
                        {
                            _local_8 = _core.view.getUI(ViewManager.PANEL_PETMANAGER);
                            _core.remote.repairPetEqu(_local_8.petData.id, this._itemId, 2);
                        }
                        else
                        {
                            _core.remote.repair(slotData.id, 2);
                        };
                        break;
                };
            }
            else
            {
                if (_arg_3 == GamePredef.MOUSE_TARGET_PET)
                {
                    switch (_arg_2)
                    {
                        case GamePredef.ACTION_ITEM:
                            _core.player.useItem(GamePredef.MOUSE_TARGET_PET, _core.view.mousePetId, slotData.id);
                            return;
                    };
                };
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
            _type = _arg_1;
            if (((_callLaterFlag) && (_type > 0)))
            {
                _callLaterFlag = false;
                setSource();
            };
        }

        private function swapSlotView(_arg_1:ISlot, _arg_2:ISlot):void
        {
            var _local_3:Object = {};
            _local_3.type = _arg_1.type;
            _local_3.giid = _arg_1.giid;
            _local_3.stackNum = _arg_1.stackNum;
            _arg_1.type = _arg_2.type;
            _arg_1.giid = _arg_2.giid;
            _arg_1.stackNum = _arg_2.stackNum;
            _arg_2.type = _local_3.type;
            _arg_2.giid = _local_3.giid;
            _arg_2.stackNum = _local_3.stackNum;
        }

        public function setRuneNumText():void
        {
            _itemNum.x = 53;
            _itemNum.y = 42;
            _itemNum.defaultTextFormat = new TextFormat("Arial", 12, 0xFFFFFF);
        }

        public function set stackMax(_arg_1:int):void
        {
            _stackMax = _arg_1;
            if (_itemId > 0)
            {
                setStackText();
            };
        }

        protected function rollOutHandler(_arg_1:Event):void
        {
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

        private function showInstToolTip(_arg_1:int, _arg_2:int, _arg_3:Boolean=false):void
        {
            var _local_4:Object;
            var _local_5:Object;
            if (_core.data.hasData(_type, _itemId))
            {
                _local_4 = _core.data.getGameData(_type, _itemId);
                _local_5 = {};
                _local_5.type = BasicToolTip.TYPE_INST;
                _local_5.btnVisible = false;
                _local_5.soulActived = _core.player.equipActiveList[_index];
                _local_5.inst = _local_4;
                _local_5.temp = _core.getTemplateData(_type, _itemId);
                _local_5.index = _arg_2;
                if (_slotData == null)
                {
                    _slotData = {"sid":_index};
                };
                _local_5.slotData = _slotData;
                _toolTip = getToolTip();
                _toolTip.object = _local_5;
                if (((_arg_1 == GamePredef.TBL_ITEM_INSTANCE) || (_arg_1 == GamePredef.TBL_EQUIPT_INSTANCE)))
                {
                    if (this.isInAuction)
                    {
                        _toolTip.currencyHide("temp");
                    }
                    else
                    {
                        _toolTip.currencyHide("inst");
                    };
                };
                _toolTip.show();
            }
            else
            {
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _type) + "_") + _itemId), dataLoaded);
                _core.data.getGameData(_type, _itemId);
            };
        }

        private function initStyle():void
        {
            width = 34;
            height = 34;
            horizontalScrollPolicy = "off";
            verticalScrollPolicy = "off";
        }

        public function resetMHSlotIconSize():void
        {
            _itemIcon.width = 34;
            _itemIcon.height = 34;
            _itemNum.defaultTextFormat = new TextFormat("Arial", 9, 0xFFFFFF);
        }

        private function setTextFormat(_arg_1:TextField):void
        {
            _arg_1.autoSize = TextFieldAutoSize.LEFT;
            _arg_1.selectable = false;
            _arg_1.mouseEnabled = false;
            _arg_1.mouseWheelEnabled = false;
            _arg_1.textColor = 0xFFFFFF;
            _arg_1.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }

        public function dragDropHandler(event:DragEvent):void
        {
            var slot:ItemSlot;
            var numPanel:NumPanel;
            var inst:Object;
            var temp:Object;
            var ii:* = undefined;
            var func:Function;
            var view:Object;
            var equIns:Object;
            var equTmp:Object;
            var petPanelView:Object;
            var toPetIndex:uint;
            var itemTmp:Object;
            var tItemTmp:Object;
            var funcs:Function;
            var str:String;
            if (event.dragSource.hasFormat("slot"))
            {
                slot = (event.dragSource.dataForFormat("slot") as ItemSlot);
                if (slot == this)
                {
                    return;
                };
                switch (_slotType)
                {
                    case SLOT_BAG:
                        if (slot.stackNum == 0)
                        {
                            return;
                        };
                        if (slot.slotType == SLOT_BAG)
                        {
                            if ((((_core.itemState == GamePredef.ST_ITEM_DIVIDE) || (event.shiftKey)) && (_itemId < 0)))
                            {
                                numPanel = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                                numPanel.parent = _core.view.getUI(ViewManager.PANEL_BAG);
                                numPanel.showSelected(slot, this, NumPanel.TYPE_MOVE);
                            }
                            else
                            {
                                if ((((index > GamePredef.SLOT_SID_BAG[8]) && (index <= GamePredef.SLOT_SID_BAG[9])) && (!(slot.kind == GamePredef.ITEM_KIND_PETEQU))))
                                {
                                    return;
                                };
                                if (((index > GamePredef.SLOT_SID_BAG[7]) && (index <= GamePredef.SLOT_SID_BAG[8])))
                                {
                                    inst = _core.data.getData(GamePredef.TBL_ITEM_INSTANCE, slot.slotData.itemId);
                                    if (!inst)
                                    {
                                        return;
                                    };
                                    temp = _core.data.getGameData(GamePredef.TBL_ITEM_TEMPLATE, inst.tid);
                                    if (((!(temp)) || (!(temp.type == GamePredef.ITEM_TYPE_QUEST))))
                                    {
                                        return;
                                    };
                                };
                                _core.remote.moveItem(slot.index, index);
                            };
                        }
                        else
                        {
                            if (slot.slotType == SLOT_EQUIP)
                            {
                                if (slot.slotData == null)
                                {
                                    return;
                                };
                                _core.remote.equipOff(slot.slotData.id, index);
                            }
                            else
                            {
                                if (slot.slotType == SLOT_TEMP_SLOT)
                                {
                                    if (((slot.slotData) && (slot.slotData.ii > 0)))
                                    {
                                        ii = slot.slotData.ii;
                                        if ((((ii >= 5375) && (ii <= 5697)) || ((ii >= 5770) && (ii <= 5841))))
                                        {
                                            if (((_core.itemState == GamePredef.ST_ITEM_DIVIDE) || (event.shiftKey)))
                                            {
                                                func = function (_arg_1:*):void
                                                {
                                                    if (((_arg_1) && (_arg_1 > 0)))
                                                    {
                                                        if (((slot.posId) && (slot.posId <= _core.player.tBag.mx.tempSlotNum)))
                                                        {
                                                            _core.remote.addMXFromTemp(slot.posId, index, _arg_1);
                                                        };
                                                    };
                                                };
                                                NumPanel(_core.view.getUI(ViewManager.PANEL_NUM)).showSelected(slot, this, NumPanel.TYPE_MOVE, func);
                                            }
                                            else
                                            {
                                                _core.remote.addMXFromTemp(slot.posId, index);
                                            };
                                            return;
                                        };
                                    };
                                    if (((_core.itemState == GamePredef.ST_ITEM_DIVIDE) || (event.shiftKey)))
                                    {
                                        func = function (_arg_1:*):void
                                        {
                                            if (((_arg_1) && (_arg_1 > 0)))
                                            {
                                                if (((slot.posId) && (slot.posId <= _core.player.tBag.tempSlotNum)))
                                                {
                                                    _core.remote.addItemFromTemp(slot.posId, index, _arg_1);
                                                };
                                            };
                                        };
                                        NumPanel(_core.view.getUI(ViewManager.PANEL_NUM)).showSelected(slot, this, NumPanel.TYPE_MOVE, func);
                                    }
                                    else
                                    {
                                        _core.remote.addItemFromTemp(slot.posId, index);
                                    };
                                }
                                else
                                {
                                    if (slot.slotType == SLOT_STONE_SEAL)
                                    {
                                        view = _core.view.getUI(ViewManager.PANEL_STONE_SEAL);
                                        if (((view) && (slot is ItemSlotStoneSeal)))
                                        {
                                            view.toRemove((slot as ItemSlotStoneSeal).sealIndex);
                                        };
                                    };
                                };
                            };
                        };
                        return;
                    case SLOT_GUILD:
                        if (slot.slotType == SLOT_GUILD)
                        {
                            _core.remote.moveGuildItem(slot.index, index);
                        };
                        return;
                    case SLOT_SHOP:
                        if (slot == this)
                        {
                            return;
                        };
                        return;
                    case SLOT_EQUIP:
                        if (slot.slotData)
                        {
                            equIns = _core.data.getData(slot.slotData.type, slot.slotData.itemId);
                            if ((((equIns) && (equIns.tid)) && (ToolKit.isSmallThan(slot.slotData.sid, GamePredef.SLOT_SID_BANK[0]))))
                            {
                                equTmp = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][equIns.tid];
                                if ((((equTmp) && (ToolKit.isBigOrEqual(equTmp.position, GamePredef.PETEQU_POS_BEGIN))) && (ToolKit.isSmallOrEqual(equTmp.position, GamePredef.PETEQU_POS_END))))
                                {
                                    petPanelView = _core.view.getUI(ViewManager.PANEL_PETMANAGER);
                                    if (((petPanelView) && (petPanelView.petData)))
                                    {
                                        _core.remote.petEquipOn(petPanelView.petData.id, slot.slotData.id);
                                        return;
                                    };
                                };
                            };
                            _core.remote.equipOn(slot.slotData.id);
                        };
                        return;
                    case SLOT_TRADE_ITEM:
                        if (slot.slotType == SLOT_BAG)
                        {
                            _core.view.getUI(ViewManager.PANEL_TRADE).addItem(slot.slotData);
                        };
                        return;
                    case SLOT_TRADE_PET:
                        if (slot.slotType == SLOT_PET)
                        {
                            toPetIndex = uint((this.parent as LevelSlot).id.replace("pet", ""));
                            _core.view.getUI(ViewManager.PANEL_TRADE).addPet(slot.slotData.id, toPetIndex);
                            _core.view.getUI(ViewManager.PANEL_BAG).petInit();
                        };
                        return;
                    case SLOT_AUCTION_ITEM:
                        if (slot.slotType == SLOT_BAG)
                        {
                            _core.view.getUI(ViewManager.PANEL_PM_AUCTION).addItem(slot.slotData);
                        };
                        return;
                    case SLOT_AUCTION_PET:
                        if (slot.slotType == SLOT_PET)
                        {
                            toPetIndex = uint((this.parent as LevelSlot).id.replace("pet", ""));
                            _core.view.getUI(ViewManager.PANEL_PM_AUCTION).addPet(slot.slotData.id, toPetIndex);
                            _core.view.getUI(ViewManager.PANEL_BAG).petInit();
                        };
                        return;
                    case SLOT_EQUFUNC_ITEM:
                        if (slot.slotType == SLOT_BAG)
                        {
                            slotData = slot.slotData;
                            type = slot.type;
                            giid = slot.giid;
                            stackNum = slot.stackNum;
                        };
                        return;
                    case SLOT_TEMP_BAG:
                        if (slot.slotType == SLOT_BAG)
                        {
                            if ((index - 79) <= _core.player.tBag.tempbagNum)
                            {
                                itemTmp = _core.getTemplateData(slot.type, slot.giid);
                                tItemTmp = _core.getTemplateData(type, giid);
                                if (!itemTmp) break;
                                if (!ToolKit.isEqual(itemTmp.type, GamePredef.ITEM_TYPE_TEMP_BAG)) break;
                                if (((tItemTmp) && (tItemTmp.proplNum)))
                                {
                                    if (ToolKit.isEqual(itemTmp.proplNum, tItemTmp.proplNum))
                                    {
                                        if (tItemTmp.t < 0)
                                        {
                                            _core.sysMsg(Language.SLOT_U[4]);
                                            return;
                                        };
                                    };
                                    funcs = function (_arg_1:CloseEvent):void
                                    {
                                        if (_arg_1.detail == Alert.YES)
                                        {
                                            _core.remote.setTempBag(slot.index, index);
                                        };
                                    };
                                    str = Language.SLOT_U[1];
                                    str = str.replace("{name}", tItemTmp.name);
                                    Alert.show(str, "", (Alert.YES | Alert.NO), null, funcs);
                                    return;
                                };
                                func = function (_arg_1:CloseEvent):void
                                {
                                    if (_arg_1.detail == Alert.YES)
                                    {
                                        _core.remote.setTempBag(slot.index, index);
                                    };
                                };
                                Alert.show(Language.SLOT_U[3], "", (Alert.YES | Alert.NO), null, func);
                            }
                            else
                            {
                                if ((index - 99) <= _core.player.tBag.mx.tempbagNum)
                                {
                                    itemTmp = _core.getTemplateData(slot.type, slot.giid);
                                    tItemTmp = _core.getTemplateData(type, giid);
                                    if (!itemTmp) break;
                                    if (!ToolKit.isEqual(itemTmp.type, GamePredef.ITEM_TYPE_TEMP_BAG)) break;
                                    if (((tItemTmp) && (tItemTmp.proplNum)))
                                    {
                                        if (ToolKit.isEqual(itemTmp.proplNum, tItemTmp.proplNum))
                                        {
                                            if (tItemTmp.t < 0)
                                            {
                                                _core.sysMsg(Language.SLOT_U[4]);
                                                return;
                                            };
                                        };
                                        funcs = function (_arg_1:CloseEvent):void
                                        {
                                            if (_arg_1.detail == Alert.YES)
                                            {
                                                _core.remote.setmxTempBag(slot.index, index);
                                            };
                                        };
                                        str = Language.SLOT_U[1];
                                        str = str.replace("{name}", tItemTmp.name);
                                        Alert.show(str, "", (Alert.YES | Alert.NO), null, funcs);
                                        return;
                                    };
                                    func = function (_arg_1:CloseEvent):void
                                    {
                                        if (_arg_1.detail == Alert.YES)
                                        {
                                            _core.remote.setmxTempBag(slot.index, index);
                                        };
                                    };
                                    Alert.show(Language.SLOT_U[3], "", (Alert.YES | Alert.NO), null, func);
                                };
                            };
                        };
                        return;
                    case SLOT_CREATURE:
                        if (slot.slotType == SLOT_CREATURE)
                        {
                            slotData = slot.slotData;
                            type = slot.type;
                            giid = slot.giid;
                            stackNum = slot.stackNum;
                        };
                        return;
                    case SLOT_FAIRY_CONFIG_RIGHT:
                        if (slot.slotType == SLOT_FAIRY_CONFIG_LEFT)
                        {
                            view = _core.view.getUI(ViewManager.PANEL_FAIRY_SKILL_CONFIG);
                            if (view)
                            {
                                view.getSkill(slot, this);
                            };
                        }
                        else
                        {
                            if (slot.slotType == SLOT_FAIRY_CONFIG_RIGHT)
                            {
                                view = _core.view.getUI(ViewManager.PANEL_FAIRY_SKILL_CONFIG);
                                if (view)
                                {
                                    view.changeSkill(slot, this);
                                };
                            };
                        };
                        return;
                };
            };
        }

        public function setIconToolTip(_arg_1:Object, _arg_2:String):void
        {
            var _local_3:TextArea = new TextArea();
            _local_3.text = _arg_2;
            _itemIcon.source = _arg_1;
            _itemIcon.toolTip = _arg_2;
            setImage();
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
            setQualityColor();
        }

        public function resetQualityColor():void
        {
            _canvas.styleName = "TransparentSlot";
        }

        public function get posId():uint
        {
            return (this._posId);
        }

        public function set slotData(_arg_1:Object):void
        {
            this.gray = false;
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
            if (_arg_1 == 0)
            {
                _canvas.styleName = "TransparentSlot";
            }
            else
            {
                if (_arg_1 == 1)
                {
                    _canvas.styleName = "TransparentSlotGreen";
                }
                else
                {
                    if (_arg_1 == 2)
                    {
                        _canvas.styleName = "TransparentSlotBlue";
                    }
                    else
                    {
                        if (_arg_1 == 3)
                        {
                            _canvas.styleName = "TransparentSlotPurple";
                        }
                        else
                        {
                            if (_arg_1 == 4)
                            {
                                _canvas.styleName = "TransparentSlotOrange";
                            }
                            else
                            {
                                if (_arg_1 == 5)
                                {
                                    _canvas.styleName = "TransparentSlotRed";
                                };
                            };
                        };
                    };
                };
            };
        }

        private function setStackText():void
        {
            if (showMax)
            {
                if (_stackMax >= 0)
                {
                    _itemNum.text = ((_stackNum + "/") + _stackMax);
                }
                else
                {
                    if (_stackNum > 1)
                    {
                        _itemNum.text = String(_stackNum);
                    }
                    else
                    {
                        _itemNum.text = "";
                    };
                };
            }
            else
            {
                if (_stackNum > 1)
                {
                    _itemNum.text = String(_stackNum);
                }
                else
                {
                    _itemNum.text = "";
                };
            };
        }

        private function setFirstClickTime():void
        {
            _lastClick = new Date().getTime();
        }

        public function set isInAuction(_arg_1:Boolean):void
        {
            _isInAuction = _arg_1;
        }

        private function delSlot(_arg_1:String):void
        {
            var _local_2:String;
            if (_arg_1)
            {
                _local_2 = MD5.hash(_arg_1);
                _core.remote.dropItem(slotData.id, _local_2);
            };
        }

        public function get selected():Boolean
        {
            return (alpha == 0.5);
        }

        public function set index(_arg_1:int):void
        {
            if (_index > 0)
            {
                throw (new Error("slot index should set only once."));
            };
            _index = _arg_1;
            _core.view.addSlot(_arg_1, this);
        }

        private function canPutHere(_arg_1:ISlot):Boolean
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:int;
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
            if (_slotType < 0)
            {
                _slotType = _arg_1;
            };
        }

        private function addChildrens():void
        {
            _txt = new TextField();
            _itemIcon = new Image();
            _itemIcon.x = 1;
            _itemIcon.y = 1;
            _itemIcon.filters = ((_gray) ? [GamePredef.GRAY_FILTER] : null);
            _itemNum = new TextField();
            _canvas = new Canvas();
            _canvas.width = 34;
            _canvas.height = 34;
            _canvas.clipContent = false;
            _canvas.horizontalScrollPolicy = "off";
            _canvas.verticalScrollPolicy = "off";
            setImage();
            setNumText();
            setTxtText();
            _canvas.addChild(_itemIcon);
            addToContainer(_txt);
            addToContainer(_canvas);
            addToContainer(_itemNum);
        }

        public function setBagNumText():void
        {
            _itemNum.x = 36;
            _itemNum.y = 30;
            _itemNum.defaultTextFormat = new TextFormat("Arial", 8, 0xFFFFFF);
        }

        protected function getToolTip():Object
        {
            var _local_1:Object;
            var _local_2:Object;
            switch (_type)
            {
                case GamePredef.TBL_ITEM_INSTANCE:
                case GamePredef.TBL_ITEM_TEMPLATE:
                    return (_core.view.getUI(ViewManager.TOOLTIP_ITEM));
                case GamePredef.TBL_EQUIPT_INSTANCE:
                case GamePredef.TBL_EQUIPT_TEMPLATE:
                    if (_core.data.hasData(_type, _itemId))
                    {
                        _local_2 = _core.data.getGameData(_type, _itemId);
                        ((_local_2) && (_local_1 = _core.getTemplateData(_type, _itemId)));
                    };
                    if (((_local_1) && (_local_1.kind == GamePredef.ITEM_KIND_WING)))
                    {
                        return (_core.view.getUI(ViewManager.TOOLTIP_WING));
                    };
                    return (_core.view.getUI(ViewManager.TOOLTIP_EQUIP));
                case GamePredef.TBL_CREATURE:
                case GamePredef.TBL_PET:
                    return (_core.view.getUI(ViewManager.TOOLTIP_PET));
                case GamePredef.TBL_SKILL:
                    return (_core.view.getUI(ViewManager.TOOLTIP_SKILL));
                case GamePredef.TBL_BUILDING:
                    return (_core.view.getUI(ViewManager.TOOLTIP_BUILDING));
                case GamePredef.TBL_MEDAL:
                    return (_core.view.getUI(ViewManager.TOOLTIP_MEDAL));
                case GamePredef.TBL_PET_TALENT:
                    return (_core.view.getUI(ViewManager.TOOLTIP_TALENT));
                case GamePredef.TBL_DECO_SHOW:
                    return (_core.view.getUI(ViewManager.TOOLTIP_DECO_SHOW));
                case GamePredef.TBL_DECO_RUNE:
                    return (_core.view.getUI(ViewManager.TOOLTIP_DECO_RUNE));
                case GamePredef.TBL_RUNE_CHIP:
                    return (_core.view.getUI(ViewManager.TOOLTIP_RUNE_CHIP));
                case GamePredef.TBL_MYSTRE:
                    return (_core.view.getUI(ViewManager.TOOLTIP_MYS_TREASURE));
                case GamePredef.TBL_PRS_CHIP:
                    return (_core.view.getUI(ViewManager.TOOLTIP_PRS_CHIP));
                case GamePredef.TBL_CREATUREH_HEART:
                    return (_core.view.getUI(ViewManager.TOOLTIP_MONSTERHEART));
                case GamePredef.TBL_PET_STONE:
                    return (_core.view.getUI(ViewManager.TOOLTIP_PET_STONE));
            };
            return (_core.view.getUI(ViewManager.TOOLTIP_ITEM));
        }

        private function dragEnterHandler(_arg_1:DragEvent):void
        {
            var _local_2:ISlot;
            var _local_3:Array;
            var _local_4:int;
            if (!acceptable)
            {
                return;
            };
            if ((_arg_1.target.parent.parent.parent is PetFightConf))
            {
                _core.nextGuide(ViewManager.PANEL_PETFIGHT_CONF, "", -1, -1, 1);
            };
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as ISlot);
                _dropSlot = _local_2;
                if (_dropSlot.slotType == Slot.SLOT_USERBAR)
                {
                    if (_local_2 != this)
                    {
                        _local_3 = ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "s12", "s13", "s14", "s15", "s16", "s17", "s18", "s19", "s20", "s21", "s22", "s23", "s24", "s25", "s26", "s27", "s28", "s29", "s30"];
                        _local_4 = 0;
                        while (_local_4 < 30)
                        {
                            if (_local_3[_local_4] == this.id)
                            {
                                DragManager.acceptDragDrop(Canvas(_arg_1.currentTarget));
                                break;
                            };
                            _local_4++;
                        };
                    };
                }
                else
                {
                    DragManager.acceptDragDrop(Canvas(_arg_1.currentTarget));
                };
            };
        }

        public function set stackNum(_arg_1:int):void
        {
            var _local_2:Boolean = true;
            if (((_stackNum == _arg_1) && (!(_stackNum == 1))))
            {
                _local_2 = false;
            };
            _stackNum = _arg_1;
            if (_itemId > 0)
            {
                setStackText();
            };
            if (_local_2)
            {
                dispatchEvent(new GameEvent(GameEvent.SLOT_NUM_CHANGE));
            };
        }

        public function update():void
        {
            if (((_slotData) && (_slotData.sid > 0)))
            {
                type = _slotData.type;
                giid = _slotData.itemId;
                stackNum = _slotData.stackNum;
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

        public function set gray(_arg_1:Boolean):void
        {
            if (_gray == _arg_1)
            {
                return;
            };
            _gray = _arg_1;
            if (!_itemIcon)
            {
                return;
            };
            _itemIcon.filters = ((_gray) ? [GamePredef.GRAY_FILTER] : null);
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

        public function addToContainer(_arg_1:DisplayObject):DisplayObject
        {
            if (!_container)
            {
                _container = new UIComponent();
                this.addChild(_container);
            };
            return (_container.addChild(_arg_1));
        }

        protected function onClick(_arg_1:MouseEvent):void
        {
            var _local_2:GameEvent;
            _core.itemState = GamePredef.ST_ITEM_NORMAL;
            hideTooltip();
            if (isDClick)
            {
                _local_2 = new GameEvent(EVENT_SLOT_DCLICK);
                _local_2.data = _arg_1;
                dispatchEvent(_local_2);
                if (_timeoutHandler >= 0)
                {
                    clearTimeout(_timeoutHandler);
                    _timeoutHandler = 0;
                };
            }
            else
            {
                if (_core.view.mouseState == GamePredef.ACTION_NONE)
                {
                    setFirstClickTime();
                    if (_itemId <= 0)
                    {
                        return;
                    };
                    if (_arg_1.shiftKey)
                    {
                        addLink();
                        return;
                    };
                    if (movable)
                    {
                        _timeoutHandler = setTimeout(drag, 180, _arg_1);
                    };
                }
                else
                {
                    actionOnItem(_arg_1, _core.view.mouseState, _core.view.mouseTargetType);
                    _core.view.resoreMouse();
                };
            };
        }

        public function setRuneSetNumText():void
        {
            _itemNum.x = 45;
            _itemNum.y = 36;
            _itemNum.defaultTextFormat = new TextFormat("Arial", 10, 0xFFFFFF);
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

        public function setTypeAndId(_arg_1:int, _arg_2:Number):void
        {
            _type = _arg_1;
            giid = _arg_2;
        }

        public function set giid(_arg_1:Number):void
        {
            _itemId = _arg_1;
            if (_itemId <= 0)
            {
                clearIcon();
                return;
            };
            _txt.visible = false;
            setSource();
            setStackMax();
            _itemIcon.toolTip = null;
            dispatchEvent(new GameEvent(GameEvent.SLOT_GIID_CHANGE));
        }

        private function setTxtText():void
        {
            setTextFormat(_txt);
        }


    }
}//package com.qeedoo.ui.view.comp

