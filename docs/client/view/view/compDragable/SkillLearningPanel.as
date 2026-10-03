// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SkillLearningPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.SkillSlot;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import com.qeedoo.MMOGame;
    import mx.events.FlexEvent;
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

    public class SkillLearningPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const SKILL_SLOT_NUM:int = 5;
        private var _502028560_skillList:Array;
        private var _922634941sSlot4:SkillSlot;
        public var _SkillLearningPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3582325vBox:VBox;
        private var _922634945sSlot0:SkillSlot;
        private var _803560629pageSel:PageSelector;
        private var _97884btn:BasicGlowButton;
        private var sList:Object;
        private var _922634942sSlot3:SkillSlot;
        private var _922634944sSlot1:SkillSlot;
        private var _nid:int;
        public var _SkillLearningPanel_BasicGlowButton2:BasicGlowButton;
        private var _selectedSkill:SkillSlot;
        private var _922634943sSlot2:SkillSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":280,
                    "height":338,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SkillLearningPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "id":"vBox",
                        "events":{"mouseDown":"__vBox_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 5;
                            this.paddingTop = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":0xFF,
                                "x":11,
                                "height":261,
                                "y":29,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SkillSlot,
                                    "id":"sSlot0",
                                    "events":{
                                        "doubleClick":"__sSlot0_doubleClick",
                                        "click":"__sSlot0_click"
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SkillSlot,
                                    "id":"sSlot1",
                                    "events":{
                                        "doubleClick":"__sSlot1_doubleClick",
                                        "click":"__sSlot1_click"
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SkillSlot,
                                    "id":"sSlot2",
                                    "events":{
                                        "doubleClick":"__sSlot2_doubleClick",
                                        "click":"__sSlot2_click"
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SkillSlot,
                                    "id":"sSlot3",
                                    "events":{
                                        "doubleClick":"__sSlot3_doubleClick",
                                        "click":"__sSlot3_click"
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SkillSlot,
                                    "id":"sSlot4",
                                    "events":{
                                        "doubleClick":"__sSlot4_doubleClick",
                                        "click":"__sSlot4_click"
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelector,
                        "id":"pageSel",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":265
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn",
                        "events":{"click":"__btn_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "16";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":154.2,
                                "styleName":"BtnStdGreen",
                                "width":52.2,
                                "height":27
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_SkillLearningPanel_BasicGlowButton2",
                        "events":{"click":"___SkillLearningPanel_BasicGlowButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "16";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":212.4,
                                "styleName":"BtnStdRed",
                                "width":52.2,
                                "height":27
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SkillLearningPanel()
        {
            mx_internal::_document = this;
            this.width = 280;
            this.height = 338;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SkillLearningPanel._watcherSetupUtil = _arg_1;
        }


        public function set sSlot1(_arg_1:SkillSlot):void
        {
            var _local_2:Object = this._922634944sSlot1;
            if (_local_2 !== _arg_1)
            {
                this._922634944sSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sSlot1", _local_2, _arg_1));
            };
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            learn();
        }

        public function set sSlot4(_arg_1:SkillSlot):void
        {
            var _local_2:Object = this._922634941sSlot4;
            if (_local_2 !== _arg_1)
            {
                this._922634941sSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sSlot4", _local_2, _arg_1));
            };
        }

        public function set sSlot2(_arg_1:SkillSlot):void
        {
            var _local_2:Object = this._922634943sSlot2;
            if (_local_2 !== _arg_1)
            {
                this._922634943sSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sSlot2", _local_2, _arg_1));
            };
        }

        public function set sSlot0(_arg_1:SkillSlot):void
        {
            var _local_2:Object = this._922634945sSlot0;
            if (_local_2 !== _arg_1)
            {
                this._922634945sSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sSlot0", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:SkillLearningPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SkillLearningPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SkillLearningPanelWatcherSetupUtil");
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

        private function _SkillLearningPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLLEARNINGPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SkillLearningPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SkillLearningPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLLEARNINGPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn.label = _arg_1;
            }, "btn.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLLEARNINGPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SkillLearningPanel_BasicGlowButton2.label = _arg_1;
            }, "_SkillLearningPanel_BasicGlowButton2.label");
            result[2] = binding;
            return (result);
        }

        public function __sSlot1_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function __sSlot2_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function __sSlot4_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        private function _SkillLearningPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SKILLLEARNINGPANEL_U[2];
            _local_1 = Language.SKILLLEARNINGPANEL_U[0];
            _local_1 = Language.SKILLLEARNINGPANEL_U[1];
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

        private function clickHandler(_arg_1:Event):void
        {
            var _local_2:SkillSlot;
            clearSelection();
            _local_2 = SkillSlot(_arg_1.currentTarget);
            _local_2.selected = true;
            var _local_3:Object = DataManager.getInstance().getGameData(GamePredef.TBL_SKILL, _local_2.giid);
            btn.enabled = true;
            _selectedSkill = _local_2;
        }

        private function onSkillListChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                this[("sSlot" + _local_4)].visible = true;
                this[("sSlot" + _local_4)].slotData = _skillList[_local_3];
                _local_4++;
            };
        }

        private function dClickHandler(_arg_1:Event):void
        {
            var _local_2:SkillSlot = SkillSlot(_arg_1.currentTarget);
            _local_2.selected = true;
        }

        private function setView():void
        {
            var _local_1:Core = Core.getInstance();
            _skillList = sortList(sList);
            initSkillList();
            btn.enabled = false;
            _selectedSkill = null;
        }

        [Bindable(event="propertyChange")]
        private function get _skillList():Array
        {
            return (this._502028560_skillList);
        }

        public function __sSlot1_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __sSlot3_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __sSlot0_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function __sSlot3_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get sSlot3():SkillSlot
        {
            return (this._922634942sSlot3);
        }

        public function set btn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        public function set sSlot3(_arg_1:SkillSlot):void
        {
            var _local_2:Object = this._922634942sSlot3;
            if (_local_2 !== _arg_1)
            {
                this._922634942sSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sSlot3", _local_2, _arg_1));
            };
        }

        private function clearSelection():void
        {
            var _local_1:int;
            while (_local_1 < vBox.numChildren)
            {
                SkillSlot(vBox.getChildAt(_local_1)).selected = false;
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get sSlot1():SkillSlot
        {
            return (this._922634944sSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get sSlot2():SkillSlot
        {
            return (this._922634943sSlot2);
        }

        private function learn():void
        {
            if (_selectedSkill)
            {
                if (_core.player.expSkill < _selectedSkill.slotData.expSkill)
                {
                    _core.sysMsg(Language.SKILLLEARNINGPANEL_S[0]);
                    return;
                };
                MMOGame.remote.skillLearn(_nid, _selectedSkill.slotData.id);
            };
        }

        public function updateSkillList():void
        {
            if (((visible) && (_nid > 0)))
            {
                _core.remote.npcFuncClick(_nid);
            };
        }

        public function showData(_arg_1:Object):void
        {
            _skillList = _arg_1.skillList;
            _nid = _arg_1.nid;
            initView();
            show();
        }

        private function clearSkillList():void
        {
            var _local_1:int;
            while (_local_1 < SKILL_SLOT_NUM)
            {
                this[("sSlot" + _local_1)].visible = false;
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSel():PageSelector
        {
            return (this._803560629pageSel);
        }

        private function set _skillList(_arg_1:Array):void
        {
            var _local_2:Object = this._502028560_skillList;
            if (_local_2 !== _arg_1)
            {
                this._502028560_skillList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_skillList", _local_2, _arg_1));
            };
        }

        private function setSlotsEnabled():void
        {
            var _local_2:SkillSlot;
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:Number;
            var _local_1:int;
            while (_local_1 < vBox.numChildren)
            {
                _local_2 = SkillSlot(vBox.getChildAt(_local_1));
                _local_3 = _local_2.slotData;
                if (GamePredef.GLOBAL_SETTING["defaultMoney"] == 1)
                {
                    _local_4 = _core.player.moneyBind;
                }
                else
                {
                    _local_4 = _core.player.money;
                };
                if (GamePredef.GLOBAL_SETTING["defaultGold"] == 1)
                {
                    _local_5 = _core.player.goldBind;
                }
                else
                {
                    _local_5 = _core.player.gold;
                };
                if ((((_local_3.price > _local_4) || (_local_3.gold > _local_5)) || (_local_3.expSkill > _core.player.expSkill)))
                {
                    _local_2.enabled = false;
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get sSlot4():SkillSlot
        {
            return (this._922634941sSlot4);
        }

        public function showSkill(_arg_1:Object):void
        {
            _nid = _arg_1.nid;
            sList = _arg_1.sList;
            initView();
            show();
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            setView();
        }

        [Bindable(event="propertyChange")]
        public function get sSlot0():SkillSlot
        {
            return (this._922634945sSlot0);
        }

        public function ___SkillLearningPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        private function sortList(_arg_1:Object):Array
        {
            var _local_3:Object;
            var _local_2:Array = [];
            for each (_local_3 in _arg_1)
            {
                _local_2.push(_local_3);
            };
            return (_local_2.sortOn("position", Array.NUMERIC));
        }

        private function initSkillList():void
        {
            pageSel.onPageChanged = onSkillListChanged;
            pageSel.onPageCleared = clearSkillList;
            pageSel.initPageSeletor(_skillList.length, SKILL_SLOT_NUM);
        }

        [Bindable(event="propertyChange")]
        public function get btn():BasicGlowButton
        {
            return (this._97884btn);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                clearSelection();
            };
        }

        private function clearSlots():void
        {
            var _local_1:int;
            while (_local_1 < vBox.numChildren)
            {
                SkillSlot(vBox.getChildAt(_local_1)).clean();
                SkillSlot(vBox.getChildAt(_local_1)).selected = false;
                _local_1++;
            };
        }

        public function __sSlot2_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __sSlot0_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
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
        public function get vBox():VBox
        {
            return (this._3582325vBox);
        }

        public function __sSlot4_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __vBox_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }


    }
}//package com.qeedoo.ui.view.compDragable

