// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SkillSlot

package com.qeedoo.ui.view.comp
{
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.SkillSlotVO;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
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

    public class SkillSlot extends SimpleCanvas implements ISlot, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _SkillSlot_RoundedLabel1:RoundedLabel;
        private var _data:Object;
        private var _1991153647skillSlot:ItemSlot;
        public var _SkillSlot_Currency1:Currency;
        public var _SkillSlot_Currency2:Currency;
        public var _SkillSlot_RoundedLabel2:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":230,
                    "height":41,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"skillSlot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":5,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_SkillSlot_RoundedLabel1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":5,
                                "width":104.5,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_SkillSlot_RoundedLabel2",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":150.65,
                                "y":5,
                                "width":77.350006,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"_SkillSlot_Currency1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":44,
                                "y":20,
                                "width":89.71666,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"_SkillSlot_Currency2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":134.55,
                                "y":20,
                                "width":95.4,
                                "height":16
                            });
                        }
                    })]
                });
            }
        });
        private var _2147321034skillVO:SkillSlotVO = new SkillSlotVO();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SkillSlot()
        {
            mx_internal::_document = this;
            this.width = 230;
            this.height = 41;
            this.styleName = "SkillUseBar";
            this.doubleClickEnabled = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SkillSlot._watcherSetupUtil = _arg_1;
        }


        public function set skillSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1991153647skillSlot;
            if (_local_2 !== _arg_1)
            {
                this._1991153647skillSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot", _local_2, _arg_1));
            };
        }

        public function set stackMax(_arg_1:int):void
        {
        }

        public function restore():void
        {
            skillSlot.restore();
        }

        override public function initialize():void
        {
            var target:SkillSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SkillSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_SkillSlotWatcherSetupUtil");
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

        public function get selected():Boolean
        {
            return ((filters) && (filters.length > 0));
        }

        public function set slotData(_arg_1:Object):void
        {
            _data = _arg_1;
            skillVO.name = _arg_1.name;
            skillVO.cost = _arg_1.price;
            skillVO.point = _arg_1.expSkill;
            skillVO.level = _arg_1.level;
            skillVO.giid = _arg_1.id;
        }

        public function set index(_arg_1:int):void
        {
            skillVO.index = _arg_1;
            _core.view.addSlot(_arg_1, this);
        }

        private function dClickHandler(_arg_1:Event):void
        {
            var _local_2:Event = new Event(Slot.EVENT_SLOT_DCLICK);
            dispatchEvent(_local_2);
        }

        private function _SkillSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = skillVO.giid;
            _local_1 = skillVO.name;
            _local_1 = (Language.SKILLSLOT_S[0] + skillVO.level);
            _local_1 = skillVO.cost;
            _local_1 = Currency.TYPE_MONEYALL;
            _local_1 = skillVO.point;
            _local_1 = Currency.TYPE_POINT;
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
            }
            else
            {
                filters = [];
            };
        }

        public function get type():int
        {
            return (GamePredef.TBL_SKILL);
        }

        public function set stackNum(_arg_1:int):void
        {
        }

        public function get slotData():Object
        {
            return (_data);
        }

        public function get stackMax():int
        {
            return (0);
        }

        private function set skillVO(_arg_1:SkillSlotVO):void
        {
            var _local_2:Object = this._2147321034skillVO;
            if (_local_2 !== _arg_1)
            {
                this._2147321034skillVO = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillVO", _local_2, _arg_1));
            };
        }

        public function clean():void
        {
            skillSlot.clean();
        }

        [Bindable(event="propertyChange")]
        private function get skillVO():SkillSlotVO
        {
            return (this._2147321034skillVO);
        }

        public function get index():int
        {
            return (skillVO.index);
        }

        public function initView():void
        {
        }

        public function reset():void
        {
            skillSlot.reset();
        }

        public function get slotType():int
        {
            return (skillSlot.slotType);
        }

        private function _SkillSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skillSlot.type = _arg_1;
            }, "skillSlot.type");
            result[0] = binding;
            binding = new Binding(this, function ():Number
            {
                return (skillVO.giid);
            }, function (_arg_1:Number):void
            {
                skillSlot.giid = _arg_1;
            }, "skillSlot.giid");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = skillVO.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SkillSlot_RoundedLabel1.text = _arg_1;
            }, "_SkillSlot_RoundedLabel1.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.SKILLSLOT_S[0] + skillVO.level);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SkillSlot_RoundedLabel2.text = _arg_1;
            }, "_SkillSlot_RoundedLabel2.text");
            result[3] = binding;
            binding = new Binding(this, function ():Number
            {
                return (skillVO.cost);
            }, function (_arg_1:Number):void
            {
                _SkillSlot_Currency1.value = _arg_1;
            }, "_SkillSlot_Currency1.value");
            result[4] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEYALL);
            }, function (_arg_1:uint):void
            {
                _SkillSlot_Currency1.type = _arg_1;
            }, "_SkillSlot_Currency1.type");
            result[5] = binding;
            binding = new Binding(this, function ():Number
            {
                return (skillVO.point);
            }, function (_arg_1:Number):void
            {
                _SkillSlot_Currency2.value = _arg_1;
            }, "_SkillSlot_Currency2.value");
            result[6] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_POINT);
            }, function (_arg_1:uint):void
            {
                _SkillSlot_Currency2.type = _arg_1;
            }, "_SkillSlot_Currency2.type");
            result[7] = binding;
            return (result);
        }

        public function update():void
        {
            skillSlot.update();
        }

        public function get stackNum():int
        {
            return (0);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot():ItemSlot
        {
            return (this._1991153647skillSlot);
        }

        public function set type(_arg_1:int):void
        {
            skillVO.type = _arg_1;
        }

        public function set giid(_arg_1:Number):void
        {
            skillVO.giid = _arg_1;
        }

        public function get giid():Number
        {
            return (skillVO.giid);
        }


    }
}//package com.qeedoo.ui.view.comp

