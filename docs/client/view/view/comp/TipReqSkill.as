// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipReqSkill

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.states.RemoveChild;
    import com.qeedoo.game.data.DataManager;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import mx.states.State;
    import mx.binding.Binding;
    import flash.display.DisplayObject;
    import flash.utils.getDefinitionByName;
    import mx.events.ResizeEvent;
    import com.qeedoo.game.object.Player;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compDragable.GuildPanel;
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

    public class TipReqSkill extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _552465410txtPreSkill:Text;
        private var _1476030621txtGuild:Text;
        private var _1378070903txtLevelExp:Text;
        private var _3769vo:ToolTipVO;
        private var _1469089236txtLevelMoney:Text;
        public var _TipReqSkill_RemoveChild1:RemoveChild;
        public var _TipReqSkill_RemoveChild2:RemoveChild;
        public var _TipReqSkill_RemoveChild3:RemoveChild;
        public var _TipReqSkill_RemoveChild4:RemoveChild;
        public var _TipReqSkill_RemoveChild5:RemoveChild;
        public var _TipReqSkill_RemoveChild6:RemoveChild;
        public var _TipReqSkill_RemoveChild7:RemoveChild;
        public var _TipReqSkill_RemoveChild8:RemoveChild;
        private var _418184118txtSkillBook:Text;
        public var _TipReqSkill_RemoveChild9:RemoveChild;
        private var _277055558txtProGrade:Text;
        private var dm:DataManager;
        private var _932190282txtGuildContrib:Text;
        private var _temp:int = 0;
        private var _9364448txtPlayLevel:Text;
        private var _1068883605txtMagicWeaponLevel:Text;
        public var _TipReqSkill_RemoveChild11:RemoveChild;
        public var _TipReqSkill_RemoveChild13:RemoveChild;
        public var _TipReqSkill_RemoveChild14:RemoveChild;
        public var _TipReqSkill_RemoveChild10:RemoveChild;
        public var _TipReqSkill_RemoveChild15:RemoveChild;
        public var _TipReqSkill_RemoveChild16:RemoveChild;
        public var _TipReqSkill_RemoveChild12:RemoveChild;
        private var _859638905txtDex:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 0;
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtSkillBook",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求技能书"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtPreSkill",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 14938678;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求前置技能"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtPlayLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求人物等级"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtLevelExp",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"升级经验"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtLevelMoney",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求升级金钱"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtProGrade",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求职业等级"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtGuild",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求公会等级"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtGuildContrib",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求公会捐献"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtMagicWeaponLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"需求神器等级"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtDex",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"熟练度"});
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipReqSkill()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.states = [_TipReqSkill_State1_c(), _TipReqSkill_State2_c(), _TipReqSkill_State3_c(), _TipReqSkill_State4_c(), _TipReqSkill_State5_c()];
            this.addEventListener("resize", ___TipReqSkill_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipReqSkill._watcherSetupUtil = _arg_1;
        }


        public function set txtMagicWeaponLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._1068883605txtMagicWeaponLevel;
            if (_local_2 !== _arg_1)
            {
                (this._1068883605txtMagicWeaponLevel = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtMagicWeaponLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtPreSkill():Text
        {
            return (this._552465410txtPreSkill);
        }

        public function set txtDex(_arg_1:Text):void
        {
            var _local_2:Object = this._859638905txtDex;
            if (_local_2 !== _arg_1)
            {
                (this._859638905txtDex = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtDex", _local_2, _arg_1));
            };
        }

        private function _TipReqSkill_RemoveChild10_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild10 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild10", _TipReqSkill_RemoveChild10);
            return (_local_1);
        }

        private function _TipReqSkill_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild1 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild1", _TipReqSkill_RemoveChild1);
            return (_local_1);
        }

        public function set txtPreSkill(_arg_1:Text):void
        {
            var _local_2:Object = this._552465410txtPreSkill;
            if (_local_2 !== _arg_1)
            {
                (this._552465410txtPreSkill = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPreSkill", _local_2, _arg_1));
            };
        }

        private function _TipReqSkill_RemoveChild14_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild14 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild14", _TipReqSkill_RemoveChild14);
            return (_local_1);
        }

        private function _TipReqSkill_RemoveChild5_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild5 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild5", _TipReqSkill_RemoveChild5);
            return (_local_1);
        }

        public function set txtLevelExp(_arg_1:Text):void
        {
            var _local_2:Object = this._1378070903txtLevelExp;
            if (_local_2 !== _arg_1)
            {
                (this._1378070903txtLevelExp = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtLevelExp", _local_2, _arg_1));
            };
        }

        private function _TipReqSkill_RemoveChild9_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild9 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild9", _TipReqSkill_RemoveChild9);
            return (_local_1);
        }

        private function _TipReqSkill_State4_c():State
        {
            var _local_1:State = new State();
            (_local_1.name = "life");
            (_local_1.overrides = [_TipReqSkill_RemoveChild10_i(), _TipReqSkill_RemoveChild11_i(), _TipReqSkill_RemoveChild12_i()]);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get txtPlayLevel():Text
        {
            return (this._9364448txtPlayLevel);
        }

        [Bindable(event="propertyChange")]
        public function get txtLevelMoney():Text
        {
            return (this._1469089236txtLevelMoney);
        }

        public function set txtPlayLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._9364448txtPlayLevel;
            if (_local_2 !== _arg_1)
            {
                (this._9364448txtPlayLevel = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPlayLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtSkillBook():Text
        {
            return (this._418184118txtSkillBook);
        }

        private function _TipReqSkill_RemoveChild13_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild13 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild13", _TipReqSkill_RemoveChild13);
            return (_local_1);
        }

        private function _TipReqSkill_State3_c():State
        {
            var _local_1:State = new State();
            (_local_1.name = "artifact");
            (_local_1.overrides = [_TipReqSkill_RemoveChild7_i(), _TipReqSkill_RemoveChild8_i(), _TipReqSkill_RemoveChild9_i()]);
            return (_local_1);
        }

        public function set txtLevelMoney(_arg_1:Text):void
        {
            var _local_2:Object = this._1469089236txtLevelMoney;
            if (_local_2 !== _arg_1)
            {
                (this._1469089236txtLevelMoney = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtLevelMoney", _local_2, _arg_1));
            };
        }

        private function _TipReqSkill_RemoveChild8_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild8 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild8", _TipReqSkill_RemoveChild8);
            return (_local_1);
        }

        private function _TipReqSkill_RemoveChild4_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild4 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild4", _TipReqSkill_RemoveChild4);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get txtGuild():Text
        {
            return (this._1476030621txtGuild);
        }

        [Bindable(event="propertyChange")]
        public function get txtMagicWeaponLevel():Text
        {
            return (this._1068883605txtMagicWeaponLevel);
        }

        public function set txtGuildContrib(_arg_1:Text):void
        {
            var _local_2:Object = this._932190282txtGuildContrib;
            if (_local_2 !== _arg_1)
            {
                (this._932190282txtGuildContrib = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtGuildContrib", _local_2, _arg_1));
            };
        }

        public function set txtProGrade(_arg_1:Text):void
        {
            var _local_2:Object = this._277055558txtProGrade;
            if (_local_2 !== _arg_1)
            {
                (this._277055558txtProGrade = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtProGrade", _local_2, _arg_1));
            };
        }

        private function set vo(_arg_1:ToolTipVO):void
        {
            var _local_2:Object = this._3769vo;
            if (_local_2 !== _arg_1)
            {
                (this._3769vo = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtDex():Text
        {
            return (this._859638905txtDex);
        }

        private function _TipReqSkill_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtGuild);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild1.target = _arg_1);
            }, "_TipReqSkill_RemoveChild1.target"));
            (result[0] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtGuildContrib);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild2.target = _arg_1);
            }, "_TipReqSkill_RemoveChild2.target"));
            (result[1] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtMagicWeaponLevel);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild3.target = _arg_1);
            }, "_TipReqSkill_RemoveChild3.target"));
            (result[2] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtSkillBook);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild4.target = _arg_1);
            }, "_TipReqSkill_RemoveChild4.target"));
            (result[3] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtProGrade);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild5.target = _arg_1);
            }, "_TipReqSkill_RemoveChild5.target"));
            (result[4] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtMagicWeaponLevel);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild6.target = _arg_1);
            }, "_TipReqSkill_RemoveChild6.target"));
            (result[5] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtProGrade);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild7.target = _arg_1);
            }, "_TipReqSkill_RemoveChild7.target"));
            (result[6] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtGuild);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild8.target = _arg_1);
            }, "_TipReqSkill_RemoveChild8.target"));
            (result[7] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtGuildContrib);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild9.target = _arg_1);
            }, "_TipReqSkill_RemoveChild9.target"));
            (result[8] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtProGrade);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild10.target = _arg_1);
            }, "_TipReqSkill_RemoveChild10.target"));
            (result[9] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtGuild);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild11.target = _arg_1);
            }, "_TipReqSkill_RemoveChild11.target"));
            (result[10] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtMagicWeaponLevel);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild12.target = _arg_1);
            }, "_TipReqSkill_RemoveChild12.target"));
            (result[11] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtProGrade);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild13.target = _arg_1);
            }, "_TipReqSkill_RemoveChild13.target"));
            (result[12] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtGuild);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild14.target = _arg_1);
            }, "_TipReqSkill_RemoveChild14.target"));
            (result[13] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtGuildContrib);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild15.target = _arg_1);
            }, "_TipReqSkill_RemoveChild15.target"));
            (result[14] = binding);
            (binding = new Binding(this, function ():DisplayObject
            {
                return (txtMagicWeaponLevel);
            }, function (_arg_1:DisplayObject):void
            {
                (_TipReqSkill_RemoveChild16.target = _arg_1);
            }, "_TipReqSkill_RemoveChild16.target"));
            (result[15] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtSkillBook.htmlText = _arg_1);
            }, "txtSkillBook.htmlText"));
            (result[16] = binding);
            (binding = new Binding(this, function ():Boolean
            {
                return (!(vo.name == ""));
            }, function (_arg_1:Boolean):void
            {
                (txtSkillBook.visible = _arg_1);
            }, "txtSkillBook.visible"));
            (result[17] = binding);
            (binding = new Binding(this, function ():Boolean
            {
                return (!(vo.name == ""));
            }, function (_arg_1:Boolean):void
            {
                (txtSkillBook.includeInLayout = _arg_1);
            }, "txtSkillBook.includeInLayout"));
            (result[18] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.preSkill;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtPreSkill.htmlText = _arg_1);
            }, "txtPreSkill.htmlText"));
            (result[19] = binding);
            (binding = new Binding(this, function ():Boolean
            {
                return (!(vo.preSkill == ""));
            }, function (_arg_1:Boolean):void
            {
                (txtPreSkill.visible = _arg_1);
            }, "txtPreSkill.visible"));
            (result[20] = binding);
            (binding = new Binding(this, function ():Boolean
            {
                return (!(vo.preSkill == ""));
            }, function (_arg_1:Boolean):void
            {
                (txtPreSkill.includeInLayout = _arg_1);
            }, "txtPreSkill.includeInLayout"));
            (result[21] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.reqLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtPlayLevel.htmlText = _arg_1);
            }, "txtPlayLevel.htmlText"));
            (result[22] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.expSkill;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtLevelExp.htmlText = _arg_1);
            }, "txtLevelExp.htmlText"));
            (result[23] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.price;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtLevelMoney.htmlText = _arg_1);
            }, "txtLevelMoney.htmlText"));
            (result[24] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.reqCL;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtProGrade.htmlText = _arg_1);
            }, "txtProGrade.htmlText"));
            (result[25] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.guildLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtGuild.htmlText = _arg_1);
            }, "txtGuild.htmlText"));
            (result[26] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.guildContrib;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtGuildContrib.htmlText = _arg_1);
            }, "txtGuildContrib.htmlText"));
            (result[27] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.magicWeaponLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtMagicWeaponLevel.htmlText = _arg_1);
            }, "txtMagicWeaponLevel.htmlText"));
            (result[28] = binding);
            (binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.dexProgress;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                (txtDex.htmlText = _arg_1);
            }, "txtDex.htmlText"));
            (result[29] = binding);
            return (result);
        }

        override public function initialize():void
        {
            var target:TipReqSkill;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipReqSkill_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipReqSkillWatcherSetupUtil");
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

        private function _TipReqSkill_RemoveChild12_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild12 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild12", _TipReqSkill_RemoveChild12);
            return (_local_1);
        }

        private function _TipReqSkill_RemoveChild3_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild3 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild3", _TipReqSkill_RemoveChild3);
            return (_local_1);
        }

        public function set txtSkillBook(_arg_1:Text):void
        {
            var _local_2:Object = this._418184118txtSkillBook;
            if (_local_2 !== _arg_1)
            {
                (this._418184118txtSkillBook = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtSkillBook", _local_2, _arg_1));
            };
        }

        private function _TipReqSkill_State2_c():State
        {
            var _local_1:State = new State();
            (_local_1.name = "guild");
            (_local_1.overrides = [_TipReqSkill_RemoveChild4_i(), _TipReqSkill_RemoveChild5_i(), _TipReqSkill_RemoveChild6_i()]);
            return (_local_1);
        }

        private function _TipReqSkill_RemoveChild16_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild16 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild16", _TipReqSkill_RemoveChild16);
            return (_local_1);
        }

        private function _TipReqSkill_RemoveChild7_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild7 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild7", _TipReqSkill_RemoveChild7);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get txtLevelExp():Text
        {
            return (this._1378070903txtLevelExp);
        }

        public function ___TipReqSkill_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function _TipReqSkill_bindingExprs():void
        {
            var _local_1:*;
            (_local_1 = txtGuild);
            (_local_1 = txtGuildContrib);
            (_local_1 = txtMagicWeaponLevel);
            (_local_1 = txtSkillBook);
            (_local_1 = txtProGrade);
            (_local_1 = txtMagicWeaponLevel);
            (_local_1 = txtProGrade);
            (_local_1 = txtGuild);
            (_local_1 = txtGuildContrib);
            (_local_1 = txtProGrade);
            (_local_1 = txtGuild);
            (_local_1 = txtMagicWeaponLevel);
            (_local_1 = txtProGrade);
            (_local_1 = txtGuild);
            (_local_1 = txtGuildContrib);
            (_local_1 = txtMagicWeaponLevel);
            (_local_1 = vo.name);
            (_local_1 = (!(vo.name == "")));
            (_local_1 = (!(vo.name == "")));
            (_local_1 = vo.preSkill);
            (_local_1 = (!(vo.preSkill == "")));
            (_local_1 = (!(vo.preSkill == "")));
            (_local_1 = vo.reqLevel);
            (_local_1 = vo.expSkill);
            (_local_1 = vo.price);
            (_local_1 = vo.reqCL);
            (_local_1 = vo.guildLevel);
            (_local_1 = vo.guildContrib);
            (_local_1 = vo.magicWeaponLevel);
            (_local_1 = vo.dexProgress);
        }

        public function set object(_arg_1:Object):void
        {
            var _local_4:*;
            var _local_5:Object;
            var _local_7:Number;
            if (!_arg_1.skill)
            {
                return;
            };
            _core = Core.getInstance();
            dm = DataManager.getInstance();
            var _local_2:Player = _core.player;
            vo = new ToolTipVO();
            _temp = _arg_1.temp;
            var _local_3:Object = _arg_1.skill;
            for (_local_4 in _arg_1)
            {
            };
            _local_5 = _core.skillBookBySkillName(_local_3.name);
            if (_temp == 0)
            {
                if ((((!(ToolKit.isEqual(_local_3.useEnv, 4))) && (!(ToolKit.isEqual(_local_3.useEnv, 5)))) && (!(ToolKit.isEqual(_local_3.useEnv, 3)))))
                {
                    if (((_local_5) && (_core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, _local_5.id) > 0)))
                    {
                        txtSkillBook.setStyle("color", "#e3f236");
                    }
                    else
                    {
                        txtSkillBook.setStyle("color", "#f90303");
                    };
                    (vo.name = Language.TIPREQSKILL_S[0].toString().replace("{skillBook}", _local_3.name));
                    (vo.preSkill = "");
                };
            }
            else
            {
                (vo.name = "");
                (vo.preSkill = Language.TIPREQSKILL_S[1].toString().replace("{preSkill}", (_local_3.name + _temp)));
            };
            (vo.reqLevel = Language.TIPREQSKILL_S[2].toString().replace("{playLevel}", _local_3.reqLevel));
            (vo.expSkill = Language.TIPREQSKILL_S[3].toString().replace("{levelExp}", _local_3.expSkill));
            (vo.price = Language.TIPREQSKILL_S[4].toString().replace("{levelMoney}", _local_3.price));
            (vo.reqCL = Language.TIPREQSKILL_S[5].toString().replace("{proGrade}", GamePredef.CLASS_LEVEL[_local_3.reqCL]));
            (vo.guildLevel = Language.TIPREQSKILL_S[6].toString().replace("{guildLevel}", (_temp + 1)));
            (vo.guildContrib = Language.TIPREQSKILL_S[9].toString().replace("{guildContrib}", _local_3.costGuildContrib));
            (vo.magicWeaponLevel = Language.TIPREQSKILL_S[14].toString().replace("{magicWeaponLevel}", _local_3.creKind));
            if (_arg_1.dex !== undefined)
            {
                (vo.dexProgress = Language.TIPREQSKILL_S[15].toString().replace("{dexNow}", _arg_1.dex).replace("{dexRequire}", _local_3.dexSkill));
                if (Number(_arg_1.dex) < Number(_local_3.dexSkill))
                {
                    txtDex.setStyle("color", "#f90303");
                }
                else
                {
                    txtDex.setStyle("color", "#e3f236");
                };
            };
            if (_local_2.level < Number(_local_3.reqLevel))
            {
                txtPlayLevel.setStyle("color", "#f90303");
            }
            else
            {
                txtPlayLevel.setStyle("color", "#e3f236");
            };
            if (_local_2.expSkill < Number(_local_3.expSkill))
            {
                txtLevelExp.setStyle("color", "#f90303");
            }
            else
            {
                txtLevelExp.setStyle("color", "#e3f236");
            };
            if ((((_local_2.money < Number(_local_3.price)) && (2 == GamePredef.GLOBAL_SETTING.defaultMoney)) || ((_local_2.moneyBind < Number(_local_3.price)) && (1 == GamePredef.GLOBAL_SETTING.defaultMoney))))
            {
                txtLevelMoney.setStyle("color", "#f90303");
            }
            else
            {
                txtLevelMoney.setStyle("color", "#e3f236");
            };
            if ((((_local_2.cl < int(_local_3.reqCL)) && (!(int(_local_3.reqCL) == GamePredef.SKILL_REQUEST_CHAR_LEVEL))) || ((int(_local_3.reqCL) == GamePredef.SKILL_REQUEST_CHAR_LEVEL) && (!(_core.player.expRe)))))
            {
                txtProGrade.setStyle("color", "#f90303");
            }
            else
            {
                txtProGrade.setStyle("color", "#e3f236");
            };
            var _local_6:GuildPanel = (_core.view.getUI(ViewManager.PANEL_GUILD) as GuildPanel);
            if (((!(_core.player.guild == null)) && (!(_core.player.gData == null))))
            {
                _local_7 = (Number(_core.player.gData.normalContrib) + Number(_core.player.gData.donateContrib));
                if (_local_7 >= Number(_local_3.costGuildContrib))
                {
                    txtGuildContrib.setStyle("color", "#e3f236");
                }
                else
                {
                    txtGuildContrib.setStyle("color", "#f90303");
                };
                if (Number(_core.player.guild.level) < (Number(_temp) + 1))
                {
                    txtGuild.setStyle("color", "#f90303");
                }
                else
                {
                    txtGuild.setStyle("color", "#e3f236");
                };
            }
            else
            {
                txtGuild.setStyle("color", "#f90303");
                txtGuildContrib.setStyle("color", "#f90303");
            };
            if (((Number(_local_3.creKind) < 3) || (true)))
            {
                txtMagicWeaponLevel.setStyle("color", "#e3f236");
            }
            else
            {
                txtMagicWeaponLevel.setStyle("color", "#f90303");
            };
            if (ToolKit.isEqual(_local_3.useEnv, 4))
            {
                (currentState = "guild");
            }
            else
            {
                if (ToolKit.isEqual(_local_3.useEnv, 5))
                {
                    (currentState = "artifact");
                }
                else
                {
                    if (ToolKit.isEqual(_local_3.useEnv, 6))
                    {
                        if (Number(_local_3.costGuildContrib) > 0)
                        {
                            (currentState = "life");
                        }
                        else
                        {
                            (currentState = "lifeNoContribution");
                        };
                    }
                    else
                    {
                        (currentState = "normal");
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtGuildContrib():Text
        {
            return (this._932190282txtGuildContrib);
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }

        [Bindable(event="propertyChange")]
        public function get txtProGrade():Text
        {
            return (this._277055558txtProGrade);
        }

        public function set txtGuild(_arg_1:Text):void
        {
            var _local_2:Object = this._1476030621txtGuild;
            if (_local_2 !== _arg_1)
            {
                (this._1476030621txtGuild = _arg_1);
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtGuild", _local_2, _arg_1));
            };
        }

        private function _TipReqSkill_RemoveChild11_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild11 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild11", _TipReqSkill_RemoveChild11);
            return (_local_1);
        }

        private function _TipReqSkill_RemoveChild2_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild2 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild2", _TipReqSkill_RemoveChild2);
            return (_local_1);
        }

        private function _TipReqSkill_RemoveChild15_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild15 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild15", _TipReqSkill_RemoveChild15);
            return (_local_1);
        }

        private function _TipReqSkill_RemoveChild6_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            (_TipReqSkill_RemoveChild6 = _local_1);
            BindingManager.executeBindings(this, "_TipReqSkill_RemoveChild6", _TipReqSkill_RemoveChild6);
            return (_local_1);
        }

        private function _TipReqSkill_State5_c():State
        {
            var _local_1:State = new State();
            (_local_1.name = "lifeNoContribution");
            (_local_1.overrides = [_TipReqSkill_RemoveChild13_i(), _TipReqSkill_RemoveChild14_i(), _TipReqSkill_RemoveChild15_i(), _TipReqSkill_RemoveChild16_i()]);
            return (_local_1);
        }

        private function _TipReqSkill_State1_c():State
        {
            var _local_1:State = new State();
            (_local_1.name = "normal");
            (_local_1.overrides = [_TipReqSkill_RemoveChild1_i(), _TipReqSkill_RemoveChild2_i(), _TipReqSkill_RemoveChild3_i()]);
            return (_local_1);
        }

        override public function show(_arg_1:Object=null):void
        {
            setPos();
            (this.visible = true);
        }


    }
}//package com.qeedoo.ui.view.comp

