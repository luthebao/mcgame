// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GuildSkillDevPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.GuildSkillDevSlot;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import mx.utils.ObjectUtil;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class GuildSkillDevPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const GUILD_SKILL_SLOT_NUM:int = 5;
        public var _GuildSkillDevPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1236632085gslot0:GuildSkillDevSlot;
        private var _1236632083gslot2:GuildSkillDevSlot;
        private var _3582325vBox:VBox;
        private var _1236632081gslot4:GuildSkillDevSlot;
        private var _803560629pageSel:PageSelector;
        private var _100893exp:BoxLabel;
        private var _1236632082gslot3:GuildSkillDevSlot;
        private var gid:Number = -1;
        private var _1236632084gslot1:GuildSkillDevSlot;
        public var skillDevData:Object = null;
        public var _GuildSkillDevPanel_Canvas1:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":372,
                    "height":338,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GuildSkillDevPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"_GuildSkillDevPanel_Canvas1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "autoLayout":true,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"vBox",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":250,
                                            "horizontalScrollPolicy":"off",
                                            "y":41,
                                            "x":16,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":GuildSkillDevSlot,
                                                "id":"gslot0"
                                            }), new UIComponentDescriptor({
                                                "type":GuildSkillDevSlot,
                                                "id":"gslot1"
                                            }), new UIComponentDescriptor({
                                                "type":GuildSkillDevSlot,
                                                "id":"gslot2"
                                            }), new UIComponentDescriptor({
                                                "type":GuildSkillDevSlot,
                                                "id":"gslot3"
                                            }), new UIComponentDescriptor({
                                                "type":GuildSkillDevSlot,
                                                "id":"gslot4"
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"pageSel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":120,
                                            "y":275
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"exp",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":50,
                                            "y":303,
                                            "text":"Label",
                                            "width":115,
                                            "height":18
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var skillDataProvider:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GuildSkillDevPanel()
        {
            mx_internal::_document = this;
            this.width = 372;
            this.height = 338;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuildSkillDevPanel._watcherSetupUtil = _arg_1;
        }


        private function _GuildSkillDevPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GUILDPANEL_U[13];
            _local_1 = Language.GUILD_SKILL_DEV_PANEL_U[0];
        }

        [Bindable(event="propertyChange")]
        public function get exp():BoxLabel
        {
            return (this._100893exp);
        }

        override public function initialize():void
        {
            var target:GuildSkillDevPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuildSkillDevPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GuildSkillDevPanelWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get vBox():VBox
        {
            return (this._3582325vBox);
        }

        public function set pageSel(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._803560629pageSel;
            if (_local_2 !== _arg_1)
            {
                this._803560629pageSel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSel", _local_2, _arg_1));
            };
        }

        private function clearSkillDevPage():void
        {
            var _local_1:int;
            while (_local_1 < GUILD_SKILL_SLOT_NUM)
            {
                this[("gslot" + _local_1)].clean();
                _local_1++;
            };
        }

        private function onSkillDevChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                this[("gslot" + _local_4)].giids = skillDataProvider[_local_3];
                this[("gslot" + _local_4)].gid = gid;
                _local_4++;
            };
        }

        public function set exp(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._100893exp;
            if (_local_2 !== _arg_1)
            {
                this._100893exp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "exp", _local_2, _arg_1));
            };
        }

        public function showGuildSkillView(_arg_1:Object, _arg_2:Boolean=true):void
        {
            var _local_9:*;
            this.gid = parseInt(_arg_1.gid);
            skillDevData = _arg_1.skillDevData;
            var _local_3:ArrayCollection = getGuildSkillList();
            skillDataProvider = new ArrayCollection();
            var _local_4:Object;
            var _local_5:* = {
                "id":-1,
                "level":-1
            };
            var _local_6:Object;
            var _local_7:GuildPanel = (Core.getInstance().view.getUI(ViewManager.PANEL_GUILD) as GuildPanel);
            _local_7.skillDevData = _arg_1.skillDevData;
            var _local_8:int;
            while (_local_8 < _local_3.length)
            {
                _local_4 = _local_3.getItemAt(_local_8);
                _local_5.id = _local_4.id;
                _local_5.level = _local_4.level;
                _local_5.learn = -1;
                _local_6 = ObjectUtil.copy(_local_5);
                for (_local_9 in skillDevData)
                {
                    if (_local_4.codeName == GameData.d[GamePredef.TBL_SKILL][_local_9].codeName)
                    {
                        _local_6.id = _local_9;
                        _local_6.level = GameData.d[GamePredef.TBL_SKILL][_local_9].level;
                        _local_6.learn = _local_5.level;
                        break;
                    };
                };
                skillDataProvider.addItem(_local_6);
                _local_8++;
            };
            if (_local_7.myGuild != null)
            {
                exp.text = _local_7.myGuild.exp;
            }
            else
            {
                exp.text = "";
            };
            initSkillList();
            if (_arg_2 == true)
            {
                show();
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSel():PageSelector
        {
            return (this._803560629pageSel);
        }

        private function getGuildSkillList():ArrayCollection
        {
            var _local_3:*;
            var _local_1:Object = DataManager.getInstance().gameDataIndex3[GamePredef.TBL_SKILL][4];
            var _local_2:ArrayCollection = new ArrayCollection();
            for (_local_3 in _local_1)
            {
                if (ToolKit.isEqual(_local_1[_local_3].level, 1))
                {
                    _local_2.addItem(_local_1[_local_3]);
                };
            };
            return (_local_2);
        }

        public function set gslot0(_arg_1:GuildSkillDevSlot):void
        {
            var _local_2:Object = this._1236632085gslot0;
            if (_local_2 !== _arg_1)
            {
                this._1236632085gslot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gslot0", _local_2, _arg_1));
            };
        }

        public function set gslot3(_arg_1:GuildSkillDevSlot):void
        {
            var _local_2:Object = this._1236632082gslot3;
            if (_local_2 !== _arg_1)
            {
                this._1236632082gslot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gslot3", _local_2, _arg_1));
            };
        }

        public function set gslot4(_arg_1:GuildSkillDevSlot):void
        {
            var _local_2:Object = this._1236632081gslot4;
            if (_local_2 !== _arg_1)
            {
                this._1236632081gslot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gslot4", _local_2, _arg_1));
            };
        }

        private function initSkillList():void
        {
            pageSel.onPageChanged = onSkillDevChanged;
            pageSel.onPageCleared = clearSkillDevPage;
            pageSel.initPageSeletor(skillDataProvider.length, GUILD_SKILL_SLOT_NUM);
        }

        public function set gslot2(_arg_1:GuildSkillDevSlot):void
        {
            var _local_2:Object = this._1236632083gslot2;
            if (_local_2 !== _arg_1)
            {
                this._1236632083gslot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gslot2", _local_2, _arg_1));
            };
        }

        public function set gslot1(_arg_1:GuildSkillDevSlot):void
        {
            var _local_2:Object = this._1236632084gslot1;
            if (_local_2 !== _arg_1)
            {
                this._1236632084gslot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gslot1", _local_2, _arg_1));
            };
        }

        public function set vBox(_arg_1:VBox):void
        {
            var _local_2:Object = this._3582325vBox;
            if (_local_2 !== _arg_1)
            {
                this._3582325vBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vBox", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get gslot0():GuildSkillDevSlot
        {
            return (this._1236632085gslot0);
        }

        [Bindable(event="propertyChange")]
        public function get gslot4():GuildSkillDevSlot
        {
            return (this._1236632081gslot4);
        }

        [Bindable(event="propertyChange")]
        public function get gslot1():GuildSkillDevSlot
        {
            return (this._1236632084gslot1);
        }

        [Bindable(event="propertyChange")]
        public function get gslot2():GuildSkillDevSlot
        {
            return (this._1236632083gslot2);
        }

        [Bindable(event="propertyChange")]
        public function get gslot3():GuildSkillDevSlot
        {
            return (this._1236632082gslot3);
        }

        private function _GuildSkillDevPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildSkillDevPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GuildSkillDevPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILD_SKILL_DEV_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildSkillDevPanel_Canvas1.label = _arg_1;
            }, "_GuildSkillDevPanel_Canvas1.label");
            result[1] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

