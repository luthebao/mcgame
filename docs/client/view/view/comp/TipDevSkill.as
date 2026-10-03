// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipDevSkill

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.ResizeEvent;
    import mx.events.PropertyChangeEvent;
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

    public class TipDevSkill extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1469089236txtLevelMoney:Text;
        private var dm:DataManager;
        private var _552983622txtGuildExp:Text;
        private var _core:Core;
        private var skill:Object = null;
        private var _1164591585txtGuildLevel:Text;
        private var _1656631245levelFull:Text;
        private var _temp:int = 0;
        private var _3769vo:ToolTipVO;

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
                                    "id":"txtGuildLevel"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtGuildExp"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtLevelMoney"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"levelFull",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16319235;
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipDevSkill()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipDevSkill_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipDevSkill._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get txtGuildExp():Text
        {
            return (this._552983622txtGuildExp);
        }

        [Bindable(event="propertyChange")]
        public function get levelFull():Text
        {
            return (this._1656631245levelFull);
        }

        [Bindable(event="propertyChange")]
        public function get txtLevelMoney():Text
        {
            return (this._1469089236txtLevelMoney);
        }

        public function set object(_arg_1:Object):void
        {
            _core = Core.getInstance();
            dm = DataManager.getInstance();
            vo = new ToolTipVO();
            _temp = _arg_1.temp;
            skill = _arg_1.skill;
            if (skill != null)
            {
                vo.guildLevel = Language.TIPREQSKILL_S[6].toString().replace("{guildLevel}", (_temp + 1));
                vo.guildExp = Language.TIPREQSKILL_S[7].toString().replace("{guildExp}", skill.guildDevExp);
                vo.guildMoney = Language.TIPREQSKILL_S[8].toString().replace("{guildMoney}", skill.guildDevMoney);
                txtGuildLevel.visible = true;
                txtGuildExp.visible = true;
                txtLevelMoney.visible = true;
                levelFull.visible = false;
            }
            else
            {
                txtGuildLevel.visible = false;
                txtGuildExp.visible = false;
                txtLevelMoney.visible = false;
                levelFull.visible = true;
            };
            if ((_temp + 1) <= Math.floor(_core.player.guild.level))
            {
                txtGuildLevel.setStyle("color", "#e3f236");
            }
            else
            {
                txtGuildLevel.setStyle("color", "#f90303");
            };
            if (((skill) && (Math.floor(skill.guildDevExp) <= Math.floor(_core.player.guild.exp))))
            {
                txtGuildExp.setStyle("color", "#e3f236");
            }
            else
            {
                txtGuildExp.setStyle("color", "#f90303");
            };
            if (((skill) && (Math.floor(skill.guildDevMoney) <= Math.floor(_core.player.guild.money))))
            {
                txtLevelMoney.setStyle("color", "#e3f236");
            }
            else
            {
                txtLevelMoney.setStyle("color", "#f90303");
            };
        }

        override public function initialize():void
        {
            var target:TipDevSkill;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipDevSkill_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipDevSkillWatcherSetupUtil");
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

        public function ___TipDevSkill_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function _TipDevSkill_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = vo.guildLevel;
            _local_1 = Language.TIPREQSKILL_S[10];
            _local_1 = vo.guildExp;
            _local_1 = Language.TIPREQSKILL_S[11];
            _local_1 = (!(Number(skill.guildDevExp) == 0));
            _local_1 = vo.guildMoney;
            _local_1 = Language.TIPREQSKILL_S[12];
            _local_1 = (!(Number(skill.guildDevMoney) == 0));
            _local_1 = Language.TIPREQSKILL_S[13];
        }

        [Bindable(event="propertyChange")]
        public function get txtGuildLevel():Text
        {
            return (this._1164591585txtGuildLevel);
        }

        public function set txtGuildLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._1164591585txtGuildLevel;
            if (_local_2 !== _arg_1)
            {
                this._1164591585txtGuildLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtGuildLevel", _local_2, _arg_1));
            };
        }

        public function set txtLevelMoney(_arg_1:Text):void
        {
            var _local_2:Object = this._1469089236txtLevelMoney;
            if (_local_2 !== _arg_1)
            {
                this._1469089236txtLevelMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtLevelMoney", _local_2, _arg_1));
            };
        }

        private function _TipDevSkill_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.guildLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtGuildLevel.htmlText = _arg_1;
            }, "txtGuildLevel.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPREQSKILL_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtGuildLevel.text = _arg_1;
            }, "txtGuildLevel.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.guildExp;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtGuildExp.htmlText = _arg_1;
            }, "txtGuildExp.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPREQSKILL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtGuildExp.text = _arg_1;
            }, "txtGuildExp.text");
            result[3] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(Number(skill.guildDevExp) == 0));
            }, function (_arg_1:Boolean):void
            {
                txtGuildExp.visible = _arg_1;
            }, "txtGuildExp.visible");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.guildMoney;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtLevelMoney.htmlText = _arg_1;
            }, "txtLevelMoney.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPREQSKILL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtLevelMoney.text = _arg_1;
            }, "txtLevelMoney.text");
            result[6] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(Number(skill.guildDevMoney) == 0));
            }, function (_arg_1:Boolean):void
            {
                txtLevelMoney.visible = _arg_1;
            }, "txtLevelMoney.visible");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPREQSKILL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                levelFull.text = _arg_1;
            }, "levelFull.text");
            result[8] = binding;
            return (result);
        }

        private function set vo(_arg_1:ToolTipVO):void
        {
            var _local_2:Object = this._3769vo;
            if (_local_2 !== _arg_1)
            {
                this._3769vo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vo", _local_2, _arg_1));
            };
        }

        public function set txtGuildExp(_arg_1:Text):void
        {
            var _local_2:Object = this._552983622txtGuildExp;
            if (_local_2 !== _arg_1)
            {
                this._552983622txtGuildExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtGuildExp", _local_2, _arg_1));
            };
        }

        public function set levelFull(_arg_1:Text):void
        {
            var _local_2:Object = this._1656631245levelFull;
            if (_local_2 !== _arg_1)
            {
                this._1656631245levelFull = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelFull", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }


    }
}//package com.qeedoo.ui.view.comp

