// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MonsterHeartSlot

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.DragEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.view.compDragable.BagPanel;
    import mx.controls.Alert;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.config.Language;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.view.compDragable.MonsterHeartPanel;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
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

    use namespace mx_internal;

    public class MonsterHeartSlot extends Slot implements IBindingClient 
    {

        private static var ITEM_COLOR_NUM:Object = {
            "0":0,
            "1":1,
            "6":2,
            "11":3,
            "16":4
        };
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var monsterHeartHolePos:int = -1;
        public var isOpen:Boolean = true;
        public var monsterHeartBagPos:int = -1;
        public var monsterHeartBox:int = 0;
        private var _1091760867holeImg:Image;
        public var monsterHeartType:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Slot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":40,
                    "height":40,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"holeImg",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":1,
                                "y":1,
                                "visible":false,
                                "buttonMode":true
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MonsterHeartSlot()
        {
            mx_internal::_document = this;
            this.styleName = "TransparentSlot";
            this.width = 40;
            this.height = 40;
            this.addEventListener("creationComplete", ___MonsterHeartSlot_Slot1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MonsterHeartSlot._watcherSetupUtil = _arg_1;
        }


        public function set holeImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1091760867holeImg;
            if (_local_2 !== _arg_1)
            {
                this._1091760867holeImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeImg", _local_2, _arg_1));
            };
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:MonsterHeartSlot;
            var _local_3:Object;
            var _local_4:Object;
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as MonsterHeartSlot);
                if (_local_2 == this)
                {
                    trace("移动到原位置");
                    return;
                };
                if (_local_2.slotType == this.slotType)
                {
                    trace("同种类型格子移动");
                    return;
                };
                if (((_local_2.slotType == SLOT_MONSTERHEART_BAG) && (this.slotType == SLOT_MONSTERHEART_BOX)))
                {
                    _core.remote.call("monsterHeartSet", null, _local_2.monsterHeartBagPos, this.monsterHeartHolePos, this.monsterHeartBox, _local_2.monsterHeartType);
                }
                else
                {
                    if (((_local_2.slotType == SLOT_MONSTERHEART_BOX) && (this.slotType == SLOT_MONSTERHEART_BAG)))
                    {
                        _core.remote.call("monsterHeartReMove", null, _local_2.monsterHeartHolePos, _local_2.monsterHeartBox);
                    }
                    else
                    {
                        if (((_local_2.slotType == SLOT_MONSTERHEART_BAG) && (this.slotType == SLOT_MONSTERHEART_RESOLVE)))
                        {
                            this.clean();
                            this.slotData = _local_2.slotData;
                            this.type = _local_2.type;
                            this.giid = _local_2.giid;
                            _local_3 = _local_2.slotData;
                            (((_local_3) && (_local_3.color)) && (this.setStyleName(_local_3.color)));
                            _local_4 = _core.view.getUI(ViewManager.PANEL_MONSTERHEART);
                            if (_local_4)
                            {
                                _local_4.changeResolveExp();
                            };
                        }
                        else
                        {
                            if (((_local_2.slotType == SLOT_MONSTERHEART_BAG) && (this.slotType == SLOT_MONSTERHEART_UP)))
                            {
                                _local_3 = _local_2.slotData;
                                if (_local_3.color >= 5)
                                {
                                    return;
                                };
                                this.clean();
                                this.slotData = _local_3;
                                this.type = _local_2.type;
                                this.giid = _local_2.giid;
                                (((_local_3) && (_local_3.color)) && (this.setStyleName(_local_3.color)));
                                _local_4 = _core.view.getUI(ViewManager.PANEL_MONSTERHEART);
                                if (_local_4)
                                {
                                    _local_4.setMHSlotAfterUp(this.giid);
                                };
                            };
                        };
                    };
                };
            };
        }

        public function click(event:MouseEvent):void
        {
            var pointObj:Object;
            var needJGZnum:Number;
            var itemKK:Object;
            var jgzLevel:String;
            if (((isOpen) || (monsterHeartBox == 0)))
            {
                return;
            };
            var pId:Number = ((monsterHeartBox * 10) + monsterHeartHolePos);
            pointObj = GameData.d[GamePredef.TBL_CREATUREH_POINT][pId];
            var goldNum:Number = pointObj.goldnum;
            var itemColorNumQ:Number = pointObj.quality;
            needJGZnum = pointObj.num;
            itemKK = _core.getItemNumByColor(GamePredef.TBL_ITEM_TEMPLATE, pointObj.itemId, ITEM_COLOR_NUM[itemColorNumQ]);
            var func:Function = function (event:CloseEvent):void
            {
                var bagPanel:BagPanel;
                var goldLockFlag:Boolean;
                var gfunc:Function;
                if (event.detail == Alert.YES)
                {
                    bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                    goldLockFlag = bagPanel.goldLockFlag;
                    if (((goldLockFlag) || (!(bagPanel))))
                    {
                        gfunc = function (_arg_1:String):void
                        {
                            _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                        };
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                        return;
                    };
                    _core.remote.call("openHoleMonsterHeart", null, monsterHeartBox, monsterHeartHolePos);
                };
            };
            var func1:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:Number;
                if (_arg_1.detail == Alert.YES)
                {
                    _local_2 = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, pointObj.itemId).num;
                    if (_local_2 < needJGZnum)
                    {
                        Alert.show("Vui lòng lấy Kim Cương trong túi ra", "", Alert.YES);
                        return;
                    };
                    _core.remote.call("openHoleMonsterHeartJingang", null, monsterHeartBox, monsterHeartHolePos, itemKK);
                };
            };
            if (Number(itemKK.num) >= needJGZnum)
            {
                jgzLevel = MonsterHeartPanel.JGZ_COLOR[itemColorNumQ];
                Alert.show(Language.MONSTER_HEART[18].toString().replace("{num}", needJGZnum).replace("{level}", jgzLevel), "", (Alert.YES | Alert.NO), null, func1);
            }
            else
            {
                Alert.show(Language.MONSTER_HEART[13].toString().replace("{num}", goldNum), "", (Alert.YES | Alert.NO), null, func);
            };
        }

        public function setOpen(_arg_1:Boolean):void
        {
            isOpen = _arg_1;
            holeImg.visible = (!(_arg_1));
        }

        override public function initialize():void
        {
            var target:MonsterHeartSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MonsterHeartSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_MonsterHeartSlotWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function ___MonsterHeartSlot_Slot1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get holeImg():Image
        {
            return (this._1091760867holeImg);
        }

        public function setGoldLock(_arg_1:Boolean):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var _local_3:Boolean = _local_2.goldLockFlag;
            if (((!(_local_3 == _arg_1)) && (_local_2)))
            {
                _local_2.goldLockFlag = _arg_1;
            };
        }

        private function _MonsterHeartSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getIconUrl(4130220000381);
        }

        public function init():void
        {
            this.resetMHSlotIconSize();
            addEventListener(MouseEvent.CLICK, click);
        }

        private function _MonsterHeartSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000381));
            }, function (_arg_1:Object):void
            {
                holeImg.source = _arg_1;
            }, "holeImg.source");
            result[0] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

