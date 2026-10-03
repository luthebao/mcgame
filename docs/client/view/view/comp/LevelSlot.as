// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.LevelSlot

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.ShopSlotVO;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.Event;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.logic.PetLogic;
    import flash.net.Responder;
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

    public class LevelSlot extends Canvas implements ISlot, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _LevelSlot_BasicTxtButton1:BasicTxtButton;
        private var _102865796level:int;
        private var _345321964shopSlot:ItemSlot;
        public var _LevelSlot_RoundedLabel1:RoundedLabel;
        public var _LevelSlot_RoundedLabel2:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":100,
                    "height":41,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"shopSlot",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":4,
                                "y":5,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_LevelSlot_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                            this.paddingTop = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":40,
                                "y":20,
                                "width":32,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_LevelSlot_RoundedLabel1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":37,
                                "y":2,
                                "width":62,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_LevelSlot_RoundedLabel2",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":63,
                                "y":20,
                                "width":32
                            });
                        }
                    })]
                });
            }
        });
        private var _1141922867shopSlotVO:ShopSlotVO = new ShopSlotVO();
        private var _core:Core = Core.getInstance();
        private var _dm:DataManager = DataManager.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LevelSlot()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0;
            };
            this.width = 100;
            this.height = 41;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LevelSlot._watcherSetupUtil = _arg_1;
        }


        public function set giid(_arg_1:Number):void
        {
            shopSlotVO.giid = _arg_1;
            getItemInfo(shopSlotVO.type, shopSlotVO.giid);
        }

        private function set level(_arg_1:int):void
        {
            var _local_2:Object = this._102865796level;
            if (_local_2 !== _arg_1)
            {
                this._102865796level = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "level", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get level():int
        {
            return (this._102865796level);
        }

        public function restore():void
        {
            shopSlot.restore();
        }

        override public function initialize():void
        {
            var target:LevelSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LevelSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_LevelSlotWatcherSetupUtil");
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

        private function set shopSlotVO(_arg_1:ShopSlotVO):void
        {
            var _local_2:Object = this._1141922867shopSlotVO;
            if (_local_2 !== _arg_1)
            {
                this._1141922867shopSlotVO = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlotVO", _local_2, _arg_1));
            };
        }

        public function get selected():Boolean
        {
            return (alpha == 0.5);
        }

        public function set slotData(_arg_1:Object):void
        {
            shopSlotVO.slotData = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot():ItemSlot
        {
            return (this._345321964shopSlot);
        }

        private function dClickHandler(_arg_1:Event):void
        {
            var _local_2:Event = new Event(Slot.EVENT_SLOT_DCLICK);
            dispatchEvent(_local_2);
        }

        private function tmpReturn(_arg_1:Object):void
        {
            var _local_2:Object = _arg_1.data;
            if (((_local_2) && (_local_2.id)))
            {
                _dm.addNewData(_arg_1.type, _arg_1.data);
                shopSlotVO.itemName = _local_2.name;
                shopSlot.addEventListener(Slot.EVENT_SLOT_DCLICK, dClickHandler);
            };
        }

        public function set index(_arg_1:int):void
        {
            shopSlotVO.index = _arg_1;
            _core.view.addSlot(_arg_1, this);
        }

        public function set shopSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._345321964shopSlot;
            if (_local_2 !== _arg_1)
            {
                this._345321964shopSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot", _local_2, _arg_1));
            };
        }

        public function set slotType(_arg_1:int):void
        {
            shopSlot.slotType = _arg_1;
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

        public function set stackNum(_arg_1:int):void
        {
            shopSlotVO.stackNum = _arg_1;
        }

        private function insReturn(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Object = _arg_1.data;
            if (((_local_2) && (_local_2.id)))
            {
                if (ToolKit.isEqual(_local_2.binded, 1))
                {
                    _core.sysMidNote(Language.LEVELSLOT_S[0]);
                    _local_4 = _core.player.petList[_local_2.id];
                    if (_local_4)
                    {
                        _local_4.inTrade = false;
                        _local_4.inAuction = false;
                    };
                    clean();
                    _core.view.getUI(ViewManager.PANEL_BAG).petInit();
                    return;
                };
                _local_3 = _dm.getData(GamePredef.TBL_CREATURE, _local_2.tid);
                level = PetLogic.expToLv(_local_2.exp);
                if (_local_3)
                {
                    shopSlotVO.itemName = _local_3.name;
                    shopSlot.addEventListener(Slot.EVENT_SLOT_DCLICK, dClickHandler);
                }
                else
                {
                    _core.remote.call("gdc", new Responder(tmpReturn), GamePredef.TBL_CREATURE, _local_2.tid);
                };
            };
        }

        public function get type():int
        {
            return (shopSlotVO.type);
        }

        public function get slotData():Object
        {
            return (shopSlot.slotData);
        }

        public function clean():void
        {
            reset();
        }

        public function isEmpty():Boolean
        {
            return (!(Boolean((((shopSlotVO.giid) && (shopSlotVO.giid > 0)) && (!(shopSlotVO.type == -1))))));
        }

        public function get stackMax():int
        {
            return (shopSlotVO.stackMax);
        }

        [Bindable(event="propertyChange")]
        private function get shopSlotVO():ShopSlotVO
        {
            return (this._1141922867shopSlotVO);
        }

        private function _LevelSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (shopSlotVO.slotData);
            }, function (_arg_1:Object):void
            {
                shopSlot.slotData = _arg_1;
            }, "shopSlot.slotData");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (shopSlotVO.type);
            }, function (_arg_1:int):void
            {
                shopSlot.type = _arg_1;
            }, "shopSlot.type");
            result[1] = binding;
            binding = new Binding(this, function ():Number
            {
                return (shopSlotVO.giid);
            }, function (_arg_1:Number):void
            {
                shopSlot.giid = _arg_1;
            }, "shopSlot.giid");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (shopSlotVO.stackMax);
            }, function (_arg_1:int):void
            {
                shopSlot.stackMax = _arg_1;
            }, "shopSlot.stackMax");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (shopSlotVO.stackNum);
            }, function (_arg_1:int):void
            {
                shopSlot.stackNum = _arg_1;
            }, "shopSlot.stackNum");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LEVEL_SLOT_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LevelSlot_BasicTxtButton1.label = _arg_1;
            }, "_LevelSlot_BasicTxtButton1.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = shopSlotVO.itemName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LevelSlot_RoundedLabel1.text = _arg_1;
            }, "_LevelSlot_RoundedLabel1.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = level;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LevelSlot_RoundedLabel2.text = _arg_1;
            }, "_LevelSlot_RoundedLabel2.text");
            result[7] = binding;
            return (result);
        }

        public function initView():void
        {
        }

        public function reset():void
        {
            shopSlotVO = new ShopSlotVO();
            shopSlotVO.type = -1;
            shopSlotVO.giid = -1;
            shopSlotVO.stackNum = 0;
            shopSlotVO.stackMax = 1;
            shopSlot.clearIcon();
            level = 0;
            shopSlot.setStyleName(0);
        }

        public function get index():int
        {
            return (shopSlotVO.index);
        }

        public function get slotType():int
        {
            return (shopSlot.slotType);
        }

        public function update():void
        {
            shopSlot.update();
        }

        private function _LevelSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = shopSlotVO.slotData;
            _local_1 = shopSlotVO.type;
            _local_1 = shopSlotVO.giid;
            _local_1 = shopSlotVO.stackMax;
            _local_1 = shopSlotVO.stackNum;
            _local_1 = Language.LEVEL_SLOT_U[0];
            _local_1 = shopSlotVO.itemName;
            _local_1 = level;
        }

        public function get stackNum():int
        {
            return (shopSlotVO.stackNum);
        }

        public function set stackMax(_arg_1:int):void
        {
            shopSlotVO.stackMax = _arg_1;
        }

        private function getItemInfo(_arg_1:int, _arg_2:Number):void
        {
            if (((_arg_2 <= 0) || (!(_arg_1 == GamePredef.TBL_PET))))
            {
                return;
            };
            _core.remote.call("gdc", new Responder(insReturn), _arg_1, _arg_2);
        }

        public function set type(_arg_1:int):void
        {
            shopSlotVO.type = _arg_1;
            getItemInfo(shopSlotVO.type, shopSlotVO.giid);
        }

        public function get giid():Number
        {
            return (shopSlotVO.giid);
        }


    }
}//package com.qeedoo.ui.view.comp

