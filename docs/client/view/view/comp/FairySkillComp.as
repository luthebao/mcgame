// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FairySkillComp

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.SkillSlotVO;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.controls.Image;
    import mx.core.DragSource;
    import mx.managers.DragManager;
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

    public class FairySkillComp extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _109578622sname:Label;
        private var _1991153647skillSlot:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":102,
                    "height":42,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"skillSlot",
                        "events":{"click":"__skillSlot_click"},
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "y":3,
                                "x":6.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"sname",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":41,
                                "width":61
                            });
                        }
                    })]
                });
            }
        });
        private var skillVO:SkillSlotVO = new SkillSlotVO();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FairySkillComp()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0.4;
                this.color = 0;
            };
            this.width = 102;
            this.height = 42;
            this.styleName = "CanvasBorder";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FairySkillComp._watcherSetupUtil = _arg_1;
        }


        private function _FairySkillComp_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = skillVO.slotData;
            _local_1 = skillVO.type;
            _local_1 = skillVO.giid;
            _local_1 = Slot.SLOT_FAIRY_CONFIG_LEFT;
        }

        override public function initialize():void
        {
            var target:FairySkillComp;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FairySkillComp_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FairySkillCompWatcherSetupUtil");
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

        public function refresh(_arg_1:Object):void
        {
            if ((((_arg_1) && (_arg_1.name)) && (_arg_1.iconCode)))
            {
                sname.text = _arg_1.name;
                skillVO.slotData = _arg_1;
                skillVO.giid = _arg_1.id;
            }
            else
            {
                init();
            };
            skillSlot.slotData = skillVO.slotData;
            skillSlot.type = skillVO.type;
            skillSlot.giid = skillVO.giid;
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

        public function __skillSlot_click(_arg_1:MouseEvent):void
        {
            drag(_arg_1);
        }

        public function init():void
        {
            sname.text = "";
            skillVO.type = GamePredef.TBL_SKILL;
            skillVO.giid = -1;
            skillVO.slotData = null;
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot():ItemSlot
        {
            return (this._1991153647skillSlot);
        }

        private function drag(_arg_1:MouseEvent):void
        {
            var _local_3:Image;
            var _local_4:DragSource;
            var _local_5:Image;
            if (((!(skillVO)) || (!(skillVO.slotData))))
            {
                return;
            };
            var _local_2:int = skillVO.slotData.level;
            _local_3 = Image(skillSlot.itemIcon);
            _local_4 = new DragSource();
            _local_4.addData(_local_3, "image");
            _local_4.addData(skillSlot, "slot");
            _local_4.addData(_local_2, "level");
            _local_5 = new Image();
            _local_5.source = _local_3.source;
            _local_5.height = _local_3.height;
            _local_5.width = _local_3.width;
            _local_5.x = _local_3.x;
            _local_5.y = _local_3.y;
            DragManager.doDrag(_local_3, _local_4, _arg_1, _local_5, 0, 0, 0.5);
        }

        private function _FairySkillComp_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (skillVO.slotData);
            }, function (_arg_1:Object):void
            {
                skillSlot.slotData = _arg_1;
            }, "skillSlot.slotData");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (skillVO.type);
            }, function (_arg_1:int):void
            {
                skillSlot.type = _arg_1;
            }, "skillSlot.type");
            result[1] = binding;
            binding = new Binding(this, function ():Number
            {
                return (skillVO.giid);
            }, function (_arg_1:Number):void
            {
                skillSlot.giid = _arg_1;
            }, "skillSlot.giid");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_FAIRY_CONFIG_LEFT);
            }, function (_arg_1:int):void
            {
                skillSlot.slotType = _arg_1;
            }, "skillSlot.slotType");
            result[3] = binding;
            return (result);
        }

        public function set sname(_arg_1:Label):void
        {
            var _local_2:Object = this._109578622sname;
            if (_local_2 !== _arg_1)
            {
                this._109578622sname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sname", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sname():Label
        {
            return (this._109578622sname);
        }


    }
}//package com.qeedoo.ui.view.comp

